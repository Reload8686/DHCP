/* includes/config.h.  Generated from config.h.in by configure.  */
/* includes/config.h.in.  Generated from configure.ac by autoheader.  */

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* Define to support binary insertion of leases into queues. */
/* #undef BINARY_LEASES */

/* Define to compile debug-only DHCP software. */
/* #undef DEBUG */

/* Define to queue multiple DHCPACK replies per fsync. */
#define DELAYED_ACK 1

/* Define to 1 to include DHCPv4 over DHCPv6 support. */
/* #undef DHCP4o6 */

/* Define to BIG_ENDIAN for MSB (Motorola or SPARC CPUs) or LITTLE_ENDIAN for
   LSB (Intel CPUs). */
#define DHCP_BYTE_ORDER LITTLE_ENDIAN

/* Define to 1 to include DHCPv6 support. */
#define DHCPv6 1

/* Define to any value to chroot() prior to loading config. */
/* #undef EARLY_CHROOT */

/* Define to include execute() config language support. */
#define ENABLE_EXECUTE 1

/* Define to include Failover Protocol support. */
#define FAILOVER_PROTOCOL 1

/* Define to nothing if C supports flexible array members, and to 1 if it does
   not. That way, with a declaration like `struct s { int n; double
   d[FLEXIBLE_ARRAY_MEMBER]; };', the struct hack can be used with pre-C99
   compilers. When computing the size of such an object, don't use 'sizeof
   (struct s)' as it overestimates the size. Use 'offsetof (struct s, d)'
   instead. Don't use 'offsetof (struct s, d[0])', as this doesn't work with
   MSVC and with C++ compilers. */
#define FLEXIBLE_ARRAY_MEMBER /**/

/* ATF framework specified? */
/* #undef HAVE_ATF */

/* Define to 1 to use the Berkeley Packet Filter interface code. */
/* #undef HAVE_BPF */

/* Define to 1 to use DLPI interface code. */
/* #undef HAVE_DLPI */

/* Define to 1 if you have the <ifaddrs.h> header file. */
#define HAVE_IFADDRS_H 1

/* Define to 1 if you have the `inet_ntop' function. */
/* #undef HAVE_INET_NTOP */

/* Define to 1 if you have the `inet_pton' function. */
/* #undef HAVE_INET_PTON */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <ldap.h> header file. */
/* #undef HAVE_LDAP_H */

/* Define to 1 if you have the <linux/types.h> header file. */
#define HAVE_LINUX_TYPES_H 1

/* Define to 1 to use the Linux Packet Filter interface code. */
#define HAVE_LPF 1

/* Define to 1 if you have the <micasa_mgmd.h> header file. */
/* #undef HAVE_MICASA_MGMD_H */

/* Define to 1 if you have the <minix/config.h> header file. */
/* #undef HAVE_MINIX_CONFIG_H */

/* Define to 1 if you have the <net/if6.h> header file. */
/* #undef HAVE_NET_IF6_H */

/* Define to 1 if you have the <net/if_dl.h> header file. */
/* #undef HAVE_NET_IF_DL_H */

/* Define to 1 if you have the <regex.h> header file. */
#define HAVE_REGEX_H 1

/* Define to 1 if the sockaddr structure has a length field. */
/* #undef HAVE_SA_LEN */

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
#define HAVE_STDIO_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strlcat' function. */
/* #undef HAVE_STRLCAT */

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <wchar.h> header file. */
#define HAVE_WCHAR_H 1

/* Define to the string for a noreturn attribute. */
#define ISC_DHCP_NORETURN __attribute__((noreturn))

/* Define if you have the /dev/random or other configured file. */
#define ISC_PATH_RANDOMDEV "/dev/random"

/* Define to 1 if the system has 'struct if_laddrconf'. */
/* #undef ISC_PLATFORM_HAVEIF_LADDRCONF */

/* Define to 1 if the system has 'struct if_laddrreq'. */
/* #undef ISC_PLATFORM_HAVEIF_LADDRREQ */

/* Define to 1 if the system has 'struct lifnum'. */
/* #undef ISC_PLATFORM_HAVELIFNUM */

/* Define to 1 if the inet_aton() function is missing. */
/* #undef NEED_INET_ATON */

/* Name of package */
#define PACKAGE "dhcp"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "dhcp-users@isc.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "DHCP"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "DHCP 4.4.3-P1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "dhcp"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "4.4.3-P1"

/* Define to any value to include Ari's PARANOIA patch. */
/* #undef PARANOIA */

/* Define to 1 to include relay port support. */
/* #undef RELAY_PORT */

/* The size of `struct iaddr *', as computed by sizeof. */
#define SIZEOF_STRUCT_IADDR_P 8

/* Define to 1 if all of the C90 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it. */
#define STDC_HEADERS 1

/* Define to include server activity tracing support. */
#define TRACING 1

/* Define to 1 if ethernet devices are in /dev/net */
/* #undef USE_DEV_NET */

/* Define to include PIDs in syslog messages. */
/* #undef USE_LOG_PID */

/* Define to 1 to use the standard BSD socket API. */
/* #undef USE_SOCKETS */

/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
# define _ALL_SOURCE 1
#endif
/* Enable general extensions on macOS.  */
#ifndef _DARWIN_C_SOURCE
# define _DARWIN_C_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# define __EXTENSIONS__ 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable X/Open compliant socket functions that do not require linking
   with -lxnet on HP-UX 11.11.  */
#ifndef _HPUX_ALT_XOPEN_SOCKET_API
# define _HPUX_ALT_XOPEN_SOCKET_API 1
#endif
/* Identify the host operating system as Minix.
   This macro does not affect the system headers' behavior.
   A future release of Autoconf may stop defining this macro.  */
#ifndef _MINIX
/* # undef _MINIX */
#endif
/* Enable general extensions on NetBSD.
   Enable NetBSD compatibility extensions on Minix.  */
#ifndef _NETBSD_SOURCE
# define _NETBSD_SOURCE 1
#endif
/* Enable OpenBSD compatibility extensions on NetBSD.
   Oddly enough, this does nothing on OpenBSD.  */
#ifndef _OPENBSD_SOURCE
# define _OPENBSD_SOURCE 1
#endif
/* Define to 1 if needed for POSIX-compatible behavior.  */
#ifndef _POSIX_SOURCE
/* # undef _POSIX_SOURCE */
#endif
/* Define to 2 if needed for POSIX-compatible behavior.  */
#ifndef _POSIX_1_SOURCE
/* # undef _POSIX_1_SOURCE */
#endif
/* Enable POSIX-compatible threading on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-5:2014.  */
#ifndef __STDC_WANT_IEC_60559_ATTRIBS_EXT__
# define __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-1:2014.  */
#ifndef __STDC_WANT_IEC_60559_BFP_EXT__
# define __STDC_WANT_IEC_60559_BFP_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-2:2015.  */
#ifndef __STDC_WANT_IEC_60559_DFP_EXT__
# define __STDC_WANT_IEC_60559_DFP_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-4:2015.  */
#ifndef __STDC_WANT_IEC_60559_FUNCS_EXT__
# define __STDC_WANT_IEC_60559_FUNCS_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-3:2015.  */
#ifndef __STDC_WANT_IEC_60559_TYPES_EXT__
# define __STDC_WANT_IEC_60559_TYPES_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TR 24731-2:2010.  */
#ifndef __STDC_WANT_LIB_EXT2__
# define __STDC_WANT_LIB_EXT2__ 1
#endif
/* Enable extensions specified by ISO/IEC 24747:2009.  */
#ifndef __STDC_WANT_MATH_SPEC_FUNCS__
# define __STDC_WANT_MATH_SPEC_FUNCS__ 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# define _TANDEM_SOURCE 1
#endif
/* Enable X/Open extensions.  Define to 500 only if necessary
   to make mbstate_t available.  */
#ifndef _XOPEN_SOURCE
/* # undef _XOPEN_SOURCE */
#endif


/* Define to 1 to enable IPv4 packet info support. */
/* #undef USE_V4_PKTINFO */

/* Version number of package */
#define VERSION "4.4.3-P1"

/* tpacket_auxdata.tp_vlan_tci present */
#define VLAN_TCI_PRESENT 1

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

/* File for dhclient6 leases. */
/* #undef _PATH_DHCLIENT6_DB */

/* File for dhclient6 process information. */
/* #undef _PATH_DHCLIENT6_PID */

/* File for dhclient leases. */
/* #undef _PATH_DHCLIENT_DB */

/* File for dhclient process information. */
/* #undef _PATH_DHCLIENT_PID */

/* File for dhcpd6 leases. */
/* #undef _PATH_DHCPD6_DB */

/* File for dhcpd6 process information. */
/* #undef _PATH_DHCPD6_PID */

/* Default file containing dhcpd configuration. */
/* #undef _PATH_DHCPD_CONF */

/* File for dhcpd leases. */
/* #undef _PATH_DHCPD_DB */

/* File for dhcpd process information. */
/* #undef _PATH_DHCPD_PID */

/* File for dhcrelay6 process information. */
/* #undef _PATH_DHCRELAY6_PID */

/* File for dhcrelay process information. */
/* #undef _PATH_DHCRELAY_PID */

/* Define for Solaris 2.5.1 so the uint32_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT32_T */

/* Define for Solaris 2.5.1 so the uint64_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT64_T */

/* Define for Solaris 2.5.1 so the uint8_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT8_T */

/* Define to the type of a signed integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int16_t */

/* Define to the type of a signed integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int32_t */

/* Define to the type of a signed integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int64_t */

/* Define to the type of a signed integer type of width exactly 8 bits if such
   a type exists and the standard includes do not define it. */
/* #undef int8_t */

/* Define a type for 16-bit unsigned integers. */
/* #undef u_int16_t */

/* Define a type for 32-bit unsigned integers. */
/* #undef u_int32_t */

/* Define a type for 64-bit unsigned integers. */
/* #undef u_int64_t */

/* Define a type for 8-bit unsigned integers. */
/* #undef u_int8_t */

/* Define to the type of an unsigned integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint16_t */

/* Define to the type of an unsigned integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint32_t */

/* Define to the type of an unsigned integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint64_t */

/* Define to the type of an unsigned integer type of width exactly 8 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint8_t */
