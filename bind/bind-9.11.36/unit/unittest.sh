#!/bin/sh

# Find the top of the BIND9 tree.
export TOP=/home/rener/dhcp-4.4.3-P1/bind/bind-9.11.36
KYUA=
CMOCKA_MESSAGE_OUTPUT=TAP
export CMOCKA_MESSAGE_OUTPUT
GDB="$(command -v gdb)"

kyua_report() {
	${KYUA} --logfile /dev/null report --results-file "${KYUA_RESULT:-LATEST}"
}

clear_kyua_work_dir() {
	KYUA_WORK_DIR="$(grep -i -m1 "failed" "${1}" | sed -n 's|.*\(/tmp/kyua\.[A-Za-z0-9]*\).*|\1|p')"
	if [ -n "${CI}" ] && [ -d "${KYUA_WORK_DIR}" ]; then
		find "${KYUA_WORK_DIR}" \( -name 'core*' -o -name '*.core' \) -exec mv -v {} . \;
		rm -rf "${KYUA_WORK_DIR}"
	fi
}

if [ -z "${KYUA}" ]; then
	exit 0
fi

echo "S:unit:$(date)"
echo "T:unit:1:A"
echo "I:unit tests (using kyua)"

${KYUA} -v parallelism="${TEST_PARALLEL_JOBS:-1}" --logfile kyua.log --loglevel debug test --results-file "${KYUA_RESULT:-NEW}"
status=$?

kyua_report

clear_kyua_work_dir kyua.log

# Use kyua-debug(1) facility to gather additional data on failed tests.
# Some runs will just show verbose information from the run, some will
# show backtrace via gdb(1).
USER_ID=$(id -u)
BROKEN_TESTS=$(kyua_report | awk '$2 == "->" && ( $3 == "broken:" || $3 == "failed:" ) { print $1 }')
# Conditions for getting kyua debug info and GDB backtrace: runs under CI
# (safety), GDB present, root privileges, failed tests.
if [ -n "${CI}" ] && [ -n "${GDB}" ] && [ "${USER_ID:-1}" -eq 0 ] && [ -n "${BROKEN_TESTS}" ]; then
	if [ "$(uname -s)" = "Linux" ] && ! sysctl -n "kernel.core_pattern" | grep -xq "core.%p"; then
		echo "I:*** kernel.core_pattern is not set to 'core.%p'"
		echo "I:*** kyua may not be able to find core dumps for broken tests"
	fi
	if [ "$(uname -s)" = "FreeBSD" ] && ! sysctl -n "kern.corefile" | grep -xq "core.%P"; then
		echo "I:*** kern.corefile is not set to 'core.%P'"
		echo "I:*** kyua may not be able to find core dumps for broken tests"
	fi
	if grep '^#define USE_LIBTOOL 1$' "${TOP}/config.h" >/dev/null; then
		# kyua debug command misidentifies broken binaries when libtool
		# is used (see https://github.com/jmmv/kyua/issues/207).
		# Here we try to "trick" kyua to use our custom gdb script instead
		# of using gdb(1) directly. Hence this part needs to be run as root
		# and, for safety reasons, only in the CI.
		mv "${GDB}" "${GDB}.orig"
		cp "${TOP}/unit/gdb" "${GDB}"
	fi
	i=1
	for test in ${BROKEN_TESTS}; do
		echo
		echo "----- $test -----"
		KYUA_DEBUG_LOG="kyua.debug.log.${i}"
		${KYUA} debug "${test}" 2>&1 | tee "${KYUA_DEBUG_LOG}"
		clear_kyua_work_dir "${KYUA_DEBUG_LOG}"
		i=$((i + 1))
	done
	if grep '^#define USE_LIBTOOL 1$' "${TOP}/config.h" >/dev/null; then
		mv "${GDB}.orig" "${GDB}"
	fi
fi

if [ "${status}" -eq 0 ]
then
	rm -f kyua.log
	echo "R:PASS"
else
	echo "R:FAIL:status:${status}"
fi
echo "E:unit:$(date)"

exit ${status}
