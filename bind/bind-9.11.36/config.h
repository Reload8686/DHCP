/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */
/*
 * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, you can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * See the COPYRIGHT file distributed with this work for additional
 * information regarding copyright ownership.
 */

/*! \file */

/***
 *** This file is not to be included by any public header files, because
 *** it does not get installed.
 ***/

/** define on DEC OSF to enable 4.4BSD style sa_len support */
/* #undef _SOCKADDR_LEN */

/** define if your system needs pthread_init() before using pthreads */
/* #undef NEED_PTHREAD_INIT */

/** define if your system has sigwait() */
/* #undef HAVE_SIGWAIT */

/** define if sigwait() is the UnixWare flavor */
/* #undef HAVE_UNIXWARE_SIGWAIT */

/** define on Solaris to get sigwait() to work using pthreads semantics */
/* #undef _POSIX_PTHREAD_SEMANTICS */

/** define if LinuxThreads is in use */
/* #undef HAVE_LINUXTHREADS */

/** define if sysconf() is available */
/* #undef HAVE_SYSCONF */

/** define if sysctlbyname() is available */
/* #undef HAVE_SYSCTLBYNAME */

/** define if catgets() is available */
#define HAVE_CATGETS 1

/** define if getifaddrs() exists */
#define HAVE_GETIFADDRS 1

/** define if you have the NET_RT_IFLIST sysctl variable and sys/sysctl.h */
/* #undef HAVE_IFLIST_SYSCTL */

/** define if tzset() is available */
#define HAVE_TZSET 1

/** define if struct addrinfo exists */
#define HAVE_ADDRINFO 1

/** define if getaddrinfo() exists */
#define HAVE_GETADDRINFO 1

/** define if gai_strerror() exists */
#define HAVE_GAISTRERROR 1

/**
 * define if pthread_setconcurrency() should be called to tell the
 * OS how many threads we might want to run.
 */
/* #undef CALL_PTHREAD_SETCONCURRENCY */

/** define if IPv6 is not disabled */
#define WANT_IPV6 1

/** define if flockfile() is available */
#define HAVE_FLOCKFILE 1

/** define if getc_unlocked() is available */
#define HAVE_GETCUNLOCKED 1

/** Shut up warnings about sputaux in stdio.h on BSD/OS pre-4.1 */
/* #undef SHUTUP_SPUTAUX */
#ifdef SHUTUP_SPUTAUX
struct __sFILE;
extern __inline int __sputaux(int _c, struct __sFILE *_p);
#endif

/** Shut up warnings about missing sigwait prototype on BSD/OS 4.0* */
/* #undef SHUTUP_SIGWAIT */
#ifdef SHUTUP_SIGWAIT
int sigwait(const unsigned int *set, int *sig);
#endif

/** Shut up warnings from gcc -Wcast-qual on BSD/OS 4.1. */
/* #undef SHUTUP_STDARG_CAST */
#if defined(SHUTUP_STDARG_CAST) && defined(__GNUC__)
#include <stdarg.h>		/** Grr.  Must be included *every time*. */
/**
 * The silly continuation line is to keep configure from
 * commenting out the #undef.
 */

#undef \
	va_start
#define	va_start(ap, last) \
	do { \
		union { const void *konst; long *var; } _u; \
		_u.konst = &(last); \
		ap = (va_list)(_u.var + __va_words(__typeof(last))); \
	} while (0)
#endif /** SHUTUP_STDARG_CAST && __GNUC__ */

/** define if the system has a random number generating device */
#define PATH_RANDOMDEV "/dev/random"

/** define if pthread_attr_getstacksize() is available */
/* #undef HAVE_PTHREAD_ATTR_GETSTACKSIZE */

/** define if pthread_attr_setstacksize() is available */
/* #undef HAVE_PTHREAD_ATTR_SETSTACKSIZE */

/** define if you have strerror in the C library. */
#define HAVE_STRERROR 1

/* Define if OpenSSL includes DSA support */
/* #undef HAVE_OPENSSL_DSA */

/* Define if you have getpassphrase in the C library. */
/* #undef HAVE_GETPASSPHRASE */

/* Define to the length type used by the socket API (socklen_t, size_t, int). */
#define ISC_SOCKADDR_LEN_T socklen_t

/* Define if threads need PTHREAD_SCOPE_SYSTEM */
/* #undef NEED_PTHREAD_SCOPE_SYSTEM */

/* Define to 1 if you have the uname library function. */
#define HAVE_UNAME 1

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* Define to enable the "filter-aaaa-on-v4" and "filter-aaaa-on-v6" options.
   */
/* #undef ALLOW_FILTER_AAAA */

/* Define if recvmsg() does not meet all of the BSD socket API specifications.
   */
/* #undef BROKEN_RECVMSG */

/* Define if you cannot bind() before connect() for TCP sockets. */
/* #undef BROKEN_TCP_BIND_BEFORE_CONNECT */

/* Define to enable "rrset-order fixed" syntax. */
/* #undef DNS_RDATASET_FIXED */

/* Define to enable American Fuzzy Lop test harness */
/* #undef ENABLE_AFL */

/* Define to enable rpz-nsdname rules. */
#define ENABLE_RPZ_NSDNAME 1

/* Define to enable rpz-nsip rules. */
#define ENABLE_RPZ_NSIP 1

/* Solaris hack to get select_large_fdset. */
/* #undef FD_SETSIZE */

/* Define to nothing if C supports flexible array members, and to 1 if it does
   not. That way, with a declaration like `struct s { int n; double
   d[FLEXIBLE_ARRAY_MEMBER]; };', the struct hack can be used with pre-C99
   compilers. When computing the size of such an object, don't use 'sizeof
   (struct s)' as it overestimates the size. Use 'offsetof (struct s, d)'
   instead. Don't use 'offsetof (struct s, d[0])', as this doesn't work with
   MSVC and with C++ compilers. */
#define FLEXIBLE_ARRAY_MEMBER /**/

/* Define to 1 if you have the `arc4random' function. */
/* #undef HAVE_ARC4RANDOM */

/* Define to 1 if you have the `arc4random_addrandom' function. */
/* #undef HAVE_ARC4RANDOM_ADDRANDOM */

/* Define to 1 if you have the `arc4random_stir' function. */
/* #undef HAVE_ARC4RANDOM_STIR */

/* Define to 1 if the compiler supports __builtin_clz. */
#define HAVE_BUILTIN_CLZ 1

/* Define to 1 if the compiler supports __builtin_expect. */
#define HAVE_BUILTIN_EXPECT 1

/* define if the compiler supports __builtin_unreachable(). */
#define HAVE_BUILTIN_UNREACHABLE 1

/* Define to 1 if you have the `chroot' function. */
#define HAVE_CHROOT 1

/* Define if clock_gettime is available. */
#define HAVE_CLOCK_GETTIME 1

/* Use cmocka */
/* #undef HAVE_CMOCKA */

/* Define to 1 if you have the <cmocka.h> header file. */
/* #undef HAVE_CMOCKA_H */

/* Define to 1 if you have the <devpoll.h> header file. */
/* #undef HAVE_DEVPOLL_H */

/* Define to 1 if you have the `DH_get0_key' function. */
/* #undef HAVE_DH_GET0_KEY */

/* Define to 1 if you have the `dlclose' function. */
#define HAVE_DLCLOSE 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the `dlopen' function. */
#define HAVE_DLOPEN 1

/* Define to 1 if you have the `dlsym' function. */
#define HAVE_DLSYM 1

/* Define to 1 to enable dnstap support */
/* #undef HAVE_DNSTAP */

/* Define to 1 if you have the `DSA_get0_pqg' function. */
/* #undef HAVE_DSA_GET0_PQG */

/* Define to 1 if you have the `ECDSA_SIG_get0' function. */
/* #undef HAVE_ECDSA_SIG_GET0 */

/* Define to 1 if you have the <editline/readline.h> header file. */
/* #undef HAVE_EDITLINE_READLINE_H */

/* Define to 1 if you have the <edit/readline/history.h> header file. */
/* #undef HAVE_EDIT_READLINE_HISTORY_H */

/* Define to 1 if you have the <edit/readline/readline.h> header file. */
/* #undef HAVE_EDIT_READLINE_READLINE_H */

/* Define to 1 if you have the `EVP_sha256' function. */
/* #undef HAVE_EVP_SHA256 */

/* Define to 1 if you have the `EVP_sha384' function. */
/* #undef HAVE_EVP_SHA384 */

/* Define to 1 if you have the `EVP_sha512' function. */
/* #undef HAVE_EVP_SHA512 */

/* Define to 1 if you have the `explicit_bzero' function. */
#define HAVE_EXPLICIT_BZERO 1

/* Define to 1 if you have the <fcntl.h> header file. */
#define HAVE_FCNTL_H 1

/* Define if OpenSSL provides FIPS_mode() */
/* #undef HAVE_FIPS_MODE */

/* Define to 1 if you have the `fseeko' function. */
#define HAVE_FSEEKO 1

/* Define to 1 if you have the `ftello' function. */
#define HAVE_FTELLO 1

/* Build with GeoIP support */
/* #undef HAVE_GEOIP */

/* Build with GeoIP2 support */
/* #undef HAVE_GEOIP2 */

/* Build with GeoIP City IPv6 support */
/* #undef HAVE_GEOIP_CITY_V6 */

/* Build with GeoIP Country IPv6 support */
/* #undef HAVE_GEOIP_V6 */

/* Define to 1 if you have the `getrandom' function. */
#define HAVE_GETRANDOM 1

/* Define to use gperftools CPU profiler. */
/* #undef HAVE_GPERFTOOLS_PROFILER */

/* Define to 1 if you have the <gssapi/gssapi.h> header file. */
/* #undef HAVE_GSSAPI_GSSAPI_H */

/* Define to 1 if you have the <gssapi/gssapi_krb5.h> header file. */
/* #undef HAVE_GSSAPI_GSSAPI_KRB5_H */

/* Define to 1 if you have the <gssapi.h> header file. */
/* #undef HAVE_GSSAPI_H */

/* Define to 1 if you have the <gssapi_krb5.h> header file. */
/* #undef HAVE_GSSAPI_KRB5_H */

/* Define to 1 if you have the if_nametoindex function. */
#define HAVE_IF_NAMETOINDEX 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if libjson was found */
/* #undef HAVE_JSON */

/* Define if json-c was found */
/* #undef HAVE_JSON_C */

/* Define to 1 if you have the <kerberosv5/krb5.h> header file. */
/* #undef HAVE_KERBEROSV5_KRB5_H */

/* Define to 1 if you have the <krb5.h> header file. */
/* #undef HAVE_KRB5_H */

/* Define to 1 if you have the <krb5/krb5.h> header file. */
/* #undef HAVE_KRB5_KRB5_H */

/* Define to 1 if you have the `c' library (-lc). */
/* #undef HAVE_LIBC */

/* Define to 1 if you have the `cap' library (-lcap). */
/* #undef HAVE_LIBCAP */

/* if system have backtrace function */
#define HAVE_LIBCTRACE /**/

/* Define to 1 if you have the `c_r' library (-lc_r). */
/* #undef HAVE_LIBC_R */

/* Define to 1 if you have the `nsl' library (-lnsl). */
/* #undef HAVE_LIBNSL */

/* Define to 1 if you have the `pthread' library (-lpthread). */
/* #undef HAVE_LIBPTHREAD */

/* Define to 1 if you have the `rt' library (-lrt). */
/* #undef HAVE_LIBRT */

/* Define to 1 if you have the `scf' library (-lscf). */
/* #undef HAVE_LIBSCF */

/* Define to use libseccomp system call filtering. */
/* #undef HAVE_LIBSECCOMP */

/* Define to 1 if you have the `socket' library (-lsocket). */
/* #undef HAVE_LIBSOCKET */

/* Define to 1 if you have the `thr' library (-lthr). */
/* #undef HAVE_LIBTHR */

/* Define if libxml2 was found */
/* #undef HAVE_LIBXML2 */

/* Define to 1 if you have the <linux/capability.h> header file. */
#define HAVE_LINUX_CAPABILITY_H 1

/* Define to 1 if you have the <linux/netlink.h> header file. */
#define HAVE_LINUX_NETLINK_H 1

/* Define to 1 if you have the <linux/rtnetlink.h> header file. */
#define HAVE_LINUX_RTNETLINK_H 1

/* Define to 1 if you have the <linux/types.h> header file. */
#define HAVE_LINUX_TYPES_H 1

/* Define if lmdb was found */
/* #undef HAVE_LMDB */

/* Define to 1 if you have the <locale.h> header file. */
#define HAVE_LOCALE_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `mmap' function. */
#define HAVE_MMAP 1

/* Define to 1 if you have the `nanosleep' function. */
#define HAVE_NANOSLEEP 1

/* Define to 1 if you have the <net/if6.h> header file. */
/* #undef HAVE_NET_IF6_H */

/* Define to 1 if you have the <net/route.h> header file. */
#define HAVE_NET_ROUTE_H 1

/* Define if your OpenSSL version supports AES */
/* #undef HAVE_OPENSSL_AES */

/* Define if your OpenSSL version supports ECDSA. */
/* #undef HAVE_OPENSSL_ECDSA */

/* Define if your OpenSSL version supports Ed25519. */
/* #undef HAVE_OPENSSL_ED25519 */

/* Define if your OpenSSL version supports Ed448. */
/* #undef HAVE_OPENSSL_ED448 */

/* Define if your OpenSSL version supports EVP AES */
/* #undef HAVE_OPENSSL_EVP_AES */

/* Define if your OpenSSL version supports GOST. */
/* #undef HAVE_OPENSSL_GOST */

/* Define if your PKCS11 provider supports ECDSA. */
/* #undef HAVE_PKCS11_ECDSA */

/* Define if your PKCS11 provider supports Ed25519. */
/* #undef HAVE_PKCS11_ED25519 */

/* Define if your PKCS11 provider supports Ed448. */
/* #undef HAVE_PKCS11_ED448 */

/* Define if your PKCS11 provider supports GOST. */
/* #undef HAVE_PKCS11_GOST */

/* Support for PTHREAD_MUTEX_ADAPTIVE_NP */
/* #undef HAVE_PTHREAD_MUTEX_ADAPTIVE_NP */

/* Define to 1 if you have the <pthread_np.h> header file. */
/* #undef HAVE_PTHREAD_NP_H */

/* Define to 1 if you have the `pthread_setname_np' function. */
/* #undef HAVE_PTHREAD_SETNAME_NP */

/* Define to 1 if you have the `pthread_set_name_np' function. */
/* #undef HAVE_PTHREAD_SET_NAME_NP */

/* Define to 1 if you have the `pthread_yield' function. */
/* #undef HAVE_PTHREAD_YIELD */

/* Define to 1 if you have the `pthread_yield_np' function. */
/* #undef HAVE_PTHREAD_YIELD_NP */

/* Define to 1 if you have the `readline' function. */
/* #undef HAVE_READLINE */

/* Define to 1 if you have the <readline/history.h> header file. */
/* #undef HAVE_READLINE_HISTORY_H */

/* Define to 1 if you have the <readline/readline.h> header file. */
/* #undef HAVE_READLINE_READLINE_H */

/* Define to 1 if you have the <regex.h> header file. */
#define HAVE_REGEX_H 1

/* Define to 1 if you have the `RSA_set0_key' function. */
/* #undef HAVE_RSA_SET0_KEY */

/* Define to 1 if you have the <sched.h> header file. */
/* #undef HAVE_SCHED_H */

/* Define to 1 if you have the `sched_yield' function. */
/* #undef HAVE_SCHED_YIELD */

/* Define to 1 if you have the `setegid' function. */
#define HAVE_SETEGID 1

/* Define to 1 if you have the `seteuid' function. */
#define HAVE_SETEUID 1

/* Define to 1 if you have the `setlocale' function. */
#define HAVE_SETLOCALE 1

/* Define to 1 if you have the `setresgid' function. */
#define HAVE_SETRESGID 1

/* Define to 1 if you have the `setresuid' function. */
#define HAVE_SETRESUID 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/capability.h> header file. */
/* #undef HAVE_SYS_CAPABILITY_H */

/* Define to 1 if you have the <sys/devpoll.h> header file. */
/* #undef HAVE_SYS_DEVPOLL_H */

/* Define to 1 if you have the <sys/dyntune.h> header file. */
/* #undef HAVE_SYS_DYNTUNE_H */

/* Define to 1 if you have the <sys/mman.h> header file. */
#define HAVE_SYS_MMAN_H 1

/* Define to 1 if you have the <sys/param.h> header file. */
#define HAVE_SYS_PARAM_H 1

/* Define to 1 if you have the <sys/prctl.h> header file. */
#define HAVE_SYS_PRCTL_H 1

/* Define to 1 if you have the <sys/select.h> header file. */
#define HAVE_SYS_SELECT_H 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/sockio.h> header file. */
/* #undef HAVE_SYS_SOCKIO_H */

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/sysctl.h> header file. */
/* #undef HAVE_SYS_SYSCTL_H */

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <sys/un.h> header file. */
#define HAVE_SYS_UN_H 1

/* Define if running under Compaq TruCluster */
/* #undef HAVE_TRUCLUSTER */

/* Define to 1 if the system has the type `uintptr_t'. */
#define HAVE_UINTPTR_T 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* define if the compiler supports _Unwind_Backtrace() */
/* #undef HAVE_UNWIND_BACKTRACE */

/* Define to 1 if you have the `usleep' function. */
#define HAVE_USLEEP 1

/* Define if zlib was found */
#define HAVE_ZLIB 1

/* return type of gai_strerror */
#define IRS_GAISTRERROR_RETURN_T const char *

/* Define to the buffer length type used by getnameinfo(3). */
#define IRS_GETNAMEINFO_BUFLEN_T socklen_t

/* Define to the flags type used by getnameinfo(3). */
#define IRS_GETNAMEINFO_FLAGS_T int

/* Define to the sockaddr length type used by getnameinfo(3). */
#define IRS_GETNAMEINFO_SOCKLEN_T socklen_t

/* Define if you want to use inline buffers */
#define ISC_BUFFER_USEINLINE 1

/* Define to allow building of objects for dlopen(). */
#define ISC_DLZ_DLOPEN 1

/* define if the linker supports --wrap option */
/* #undef LD_WRAP */

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* Defined if extern char *optarg is not declared. */
/* #undef NEED_OPTARG */

/* Define if connect does not honour the permission on the UNIX domain socket.
   */
/* #undef NEED_SECURE_DIRECTORY */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "info@isc.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "BIND"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "BIND 9.11"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "bind"

/* Define to the home page for this package. */
#define PACKAGE_URL "https://www.isc.org/downloads/BIND/"

/* Define to the version of this package. */
#define PACKAGE_VERSION "9.11"

/* Sets which flag to pass to open/fcntl to make non-blocking
   (O_NDELAY/O_NONBLOCK). */
#define PORT_NONBLOCK O_NONBLOCK

/* Define if GOST private keys are encoded in ASN.1. */
/* #undef PREFER_GOSTASN1 */

/* The size of `void *', as computed by sizeof. */
/* #undef SIZEOF_VOID_P */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

/* Define to use large-system tuning. */
/* #undef TUNE_LARGE */

/* Defined if you need to use ioctl(FIONBIO) instead a fcntl call to make
   non-blocking. */
/* #undef USE_FIONBIO_IOCTL */

/* Define to enable very verbose query trace logging. */
/* #undef WANT_QUERYTRACE */

/* define if idnkit support is to be included. */
/* #undef WITH_IDNKIT */

/* define if IDN output support is to be included. */
/* #undef WITH_IDN_OUT_SUPPORT */

/* define if IDN input support is to be included. */
/* #undef WITH_IDN_SUPPORT */

/* define if libidn2 support is to be included. */
/* #undef WITH_LIBIDN2 */

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to empty if your compiler does not support "static inline". */
/* #undef inline */

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to `int' if <sys/types.h> does not define. */
/* #undef ssize_t */

/* Define to the type of an unsigned integer type wide enough to hold a
   pointer, if such a type exists, and if the system does not define it. */
/* #undef uintptr_t */

/* Define to empty if the keyword `volatile' does not work. Warning: valid
   code using `volatile' can become incorrect without. Disable with care. */
/* #undef volatile */
