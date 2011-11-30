Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C8A1E0030A
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 08:34:26 -0800 (PST)
Received: by eaal12 with SMTP id l12so1179352eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 30 Nov 2011 08:34:25 -0800 (PST)
Received: by 10.213.9.148 with SMTP id l20mr548275ebl.44.1322670865259;
	Wed, 30 Nov 2011 08:34:25 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d6sm7739116eec.10.2011.11.30.08.34.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 08:34:24 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4ED658F5.5000804@gmail.com>
Date: Wed, 30 Nov 2011 17:34:17 +0100
Message-Id: <48FEF49B-BC3F-40F6-9105-26CD2E9FDFEA@dominion.thruhere.net>
References: <4ED658F5.5000804@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Add lzop-native and depend on it if the kernel needs it
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 16:34:29 -0000
X-Groupsio-MsgNum: 181
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E7E934E0-A9DA-4C70-A14A-16A967D15A9C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E7E934E0-A9DA-4C70-A14A-16A967D15A9C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 17:25 heeft Christopher Larson het volgende =
geschreven:

> If the kernel has CONFIG_KERNEL_LZO=3Dy, it may well attempt to use =
the 'lzop'
> utility to do the lzo compression, but we should not be relying on =
that utility
> being installed on the build machine.
>=20
> This currently affects the linux-omap4 build for omap4430-panda.

Would you mind pushing the lzop recipe to oe-core instead of meta-ti?

regards,

Koen

>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> recipes-kernel/linux/linux.inc         |   11 +
> recipes-support/lzop/lzop/acinclude.m4 |  390 =
++++++++++++++++++++++++++++++++
> recipes-support/lzop/lzop_1.03.bb      |   25 ++
> 3 files changed, 426 insertions(+), 0 deletions(-)
> create mode 100644 recipes-support/lzop/lzop/acinclude.m4
> create mode 100644 recipes-support/lzop/lzop_1.03.bb
>=20
> diff --git a/recipes-kernel/linux/linux.inc =
b/recipes-kernel/linux/linux.inc
> index 9650e68..e8a754f 100644
> --- a/recipes-kernel/linux/linux.inc
> +++ b/recipes-kernel/linux/linux.inc
> @@ -264,3 +264,14 @@ pkg_postrm_kernel-devicetree () {
> 	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove devicetree =
devicetree-${KERNEL_VERSION} || true
> }
> +# Automatically depend on lzop-native if CONFIG_KERNEL_LZO is enabled
> +python () {
> +    try:
> +        defconfig =3D bb.fetch2.localpath('file://defconfig', d)
> +    except bb.fetch2.FetchError:
> +        pass
> +    else:
> +        if 'CONFIG_KERNEL_LZO=3Dy\n' in open(defconfig).readlines():
> +            depends =3D d.getVar('DEPENDS', False)
> +            d.setVar('DEPENDS', depends + ' lzop-native')
> +}
> diff --git a/recipes-support/lzop/lzop/acinclude.m4 =
b/recipes-support/lzop/lzop/acinclude.m4
> new file mode 100644
> index 0000000..0029c19
> --- /dev/null
> +++ b/recipes-support/lzop/lzop/acinclude.m4
> @@ -0,0 +1,390 @@
> +
> +AC_DEFUN([mfx_ACC_CHECK_ENDIAN], [
> +AC_C_BIGENDIAN([AC_DEFINE(ACC_ABI_BIG_ENDIAN,1,[Define to 1 if your =
machine is big endian.])],[AC_DEFINE(ACC_ABI_LITTLE_ENDIAN,1,[Define to =
1 if your machine is little endian.])])
> +])#
> +
> +AC_DEFUN([mfx_ACC_CHECK_HEADERS], [
> +AC_HEADER_TIME
> +AC_CHECK_HEADERS([assert.h ctype.h dirent.h errno.h fcntl.h float.h =
limits.h malloc.h memory.h setjmp.h signal.h stdarg.h stddef.h stdint.h =
stdio.h stdlib.h string.h strings.h time.h unistd.h utime.h sys/stat.h =
sys/time.h sys/types.h sys/wait.h])
> +])#
> +
> +AC_DEFUN([mfx_ACC_CHECK_FUNCS], [
> +AC_CHECK_FUNCS(access alloca atexit atoi atol chmod chown ctime =
difftime fstat gettimeofday gmtime localtime longjmp lstat memcmp memcpy =
memmove memset mktime qsort raise setjmp signal snprintf strcasecmp =
strchr strdup strerror strftime stricmp strncasecmp strnicmp strrchr =
strstr time umask utime vsnprintf)
> +])#
> +
> +
> +AC_DEFUN([mfx_ACC_CHECK_SIZEOF], [
> +AC_CHECK_SIZEOF(short)
> +AC_CHECK_SIZEOF(int)
> +AC_CHECK_SIZEOF(long)
> +
> +AC_CHECK_SIZEOF(long long)
> +AC_CHECK_SIZEOF(__int16)
> +AC_CHECK_SIZEOF(__int32)
> +AC_CHECK_SIZEOF(__int64)
> +
> +AC_CHECK_SIZEOF(void *)
> +AC_CHECK_SIZEOF(size_t)
> +AC_CHECK_SIZEOF(ptrdiff_t)
> +])#
> +
> +
> +# =
/***********************************************************************
> +# // Check for ACC_conformance
> +# =
************************************************************************/
> +
> +AC_DEFUN([mfx_ACC_ACCCHK], [
> +mfx_tmp=3D$1
> +mfx_save_CPPFLAGS=3D$CPPFLAGS
> +dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we =
mimic this here
> +test "X$mfx_tmp" =3D "X" || CPPFLAGS=3D"$mfx_tmp $CPPFLAGS"
> +
> +AC_MSG_CHECKING([whether your compiler passes the ACC conformance =
test])
> +
> +AC_LANG_CONFTEST([AC_LANG_PROGRAM(
> +[[#define ACC_CONFIG_NO_HEADER 1
> +#include "acc/acc.h"
> +#include "acc/acc_incd.h"
> +#undef ACCCHK_ASSERT
> +#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
> +#include "acc/acc_chk.ch"
> +#undef ACCCHK_ASSERT
> +static void test_acc_compile_time_assert(void) {
> +#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
> +#include "acc/acc_chk.ch"
> +#undef ACCCHK_ASSERT
> +}
> +#undef NDEBUG
> +#include <assert.h>
> +static int test_acc_run_time_assert(int r) {
> +#define ACCCHK_ASSERT(expr)     assert(expr);
> +#include "acc/acc_chk.ch"
> +#undef ACCCHK_ASSERT
> +return r;
> +}
> +]], [[
> +test_acc_compile_time_assert();
> +if (test_acc_run_time_assert(1) !=3D 1) return 1;
> +]]
> +)])
> +
> +mfx_tmp=3DFAILED
> +_AC_COMPILE_IFELSE([], [mfx_tmp=3Dyes])
> +rm -f conftest.$ac_ext conftest.$ac_objext
> +
> +CPPFLAGS=3D$mfx_save_CPPFLAGS
> +
> +AC_MSG_RESULT([$mfx_tmp])
> +case x$mfx_tmp in
> +  xpassed | xyes) ;;
> +  *)
> +    AC_MSG_NOTICE([])
> +    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - =
for details see ])
> +    AC_MSG_NOTICE([`config.log'. Please check that log file and =
consider sending])
> +    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
> +    AC_MSG_NOTICE([Thanks for your support.])
> +    AC_MSG_NOTICE([])
> +    AC_MSG_ERROR([ACC conformance test failed. Stop.])
> +dnl    AS_EXIT
> +    ;;
> +esac
> +])# mfx_ACC_ACCCHK
> +
> +
> +# =
/***********************************************************************
> +# // Check for ACC_conformance
> +# =
************************************************************************/
> +
> +AC_DEFUN([mfx_MINIACC_ACCCHK], [
> +mfx_tmp=3D$1
> +mfx_save_CPPFLAGS=3D$CPPFLAGS
> +dnl in Makefile.in $(INCLUDES) will be before $(CPPFLAGS), so we =
mimic this here
> +test "X$mfx_tmp" =3D "X" || CPPFLAGS=3D"$mfx_tmp $CPPFLAGS"
> +
> +AC_MSG_CHECKING([whether your compiler passes the ACC conformance =
test])
> +
> +AC_LANG_CONFTEST([AC_LANG_PROGRAM(
> +[[#define ACC_CONFIG_NO_HEADER 1
> +#define ACC_WANT_ACC_INCD_H 1
> +#include $2
> +
> +#define ACC_WANT_ACC_CHK_CH 1
> +#undef ACCCHK_ASSERT
> +#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT_HEADER(expr)
> +#include $2
> +
> +#define ACC_WANT_ACC_CHK_CH 1
> +#undef ACCCHK_ASSERT
> +#define ACCCHK_ASSERT(expr)     ACC_COMPILE_TIME_ASSERT(expr)
> +static void test_acc_compile_time_assert(void) {
> +#include $2
> +}
> +
> +#undef NDEBUG
> +#include <assert.h>
> +#define ACC_WANT_ACC_CHK_CH 1
> +#undef ACCCHK_ASSERT
> +#define ACCCHK_ASSERT(expr)  assert(expr);
> +static int test_acc_run_time_assert(int r) {
> +#include $2
> +return r;
> +}
> +]], [[
> +test_acc_compile_time_assert();
> +if (test_acc_run_time_assert(1) !=3D 1) return 1;
> +]]
> +)])
> +
> +mfx_tmp=3DFAILED
> +_AC_COMPILE_IFELSE([], [mfx_tmp=3Dyes])
> +rm -f conftest.$ac_ext conftest.$ac_objext
> +
> +CPPFLAGS=3D$mfx_save_CPPFLAGS
> +
> +AC_MSG_RESULT([$mfx_tmp])
> +case x$mfx_tmp in
> +  xpassed | xyes) ;;
> +  *)
> +    AC_MSG_NOTICE([])
> +    AC_MSG_NOTICE([Your compiler failed the ACC conformance test - =
for details see ])
> +    AC_MSG_NOTICE([`config.log'. Please check that log file and =
consider sending])
> +    AC_MSG_NOTICE([a patch or bug-report to <${PACKAGE_BUGREPORT}>.])
> +    AC_MSG_NOTICE([Thanks for your support.])
> +    AC_MSG_NOTICE([])
> +    AC_MSG_ERROR([ACC conformance test failed. Stop.])
> +dnl    AS_EXIT
> +    ;;
> +esac
> +])# mfx_MINIACC_ACCCHK
> +
> +
> +
> +# serial 1
> +
> +AC_DEFUN([mfx_PROG_CPPFLAGS], [
> +AC_MSG_CHECKING([whether the C preprocessor needs special flags])
> +
> +AC_LANG_CONFTEST([AC_LANG_PROGRAM(
> +[[#include <limits.h>
> +#if (32767 >=3D 4294967295ul) || (65535u >=3D 4294967295ul)
> +#  include "your C preprocessor is broken 1"
> +#elif (0xffffu =3D=3D 0xfffffffful)
> +#  include "your C preprocessor is broken 2"
> +#elif (32767 >=3D ULONG_MAX) || (65535u >=3D ULONG_MAX)
> +#  include "your C preprocessor is broken 3"
> +#endif
> +]], [[ ]]
> +)])
> +
> +mfx_save_CPPFLAGS=3D$CPPFLAGS
> +mfx_tmp=3DERROR
> +for mfx_arg in "" -no-cpp-precomp
> +do
> +  CPPFLAGS=3D"$mfx_arg $mfx_save_CPPFLAGS"
> +  _AC_COMPILE_IFELSE([],
> +[mfx_tmp=3D$mfx_arg
> +break])
> +done
> +CPPFLAGS=3D$mfx_save_CPPFLAGS
> +rm -f conftest.$ac_ext conftest.$ac_objext
> +case x$mfx_tmp in
> +  x)
> +    AC_MSG_RESULT([none needed]) ;;
> +  xERROR)
> +    AC_MSG_RESULT([ERROR])
> +    AC_MSG_ERROR([your C preprocessor is broken - for details see =
config.log])
> +    ;;
> +  *)
> +    AC_MSG_RESULT([$mfx_tmp])
> +    CPPFLAGS=3D"$mfx_tmp $CPPFLAGS"
> +    ;;
> +esac
> +])# mfx_PROG_CPPFLAGS
> +
> +
> +
> +# serial 3
> +
> +AC_DEFUN([mfx_CHECK_HEADER_SANE_LIMITS_H], [
> +AC_CACHE_CHECK([whether limits.h is sane],
> +mfx_cv_header_sane_limits_h,
> +[AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <limits.h>
> +#if (32767 >=3D 4294967295ul) || (65535u >=3D 4294967295ul)
> +#  if defined(__APPLE__) && defined(__GNUC__)
> +#    error "your preprocessor is broken - use compiler option =
-no-cpp-precomp"
> +#  else
> +#    include "your preprocessor is broken"
> +#  endif
> +#endif
> +#define MFX_0xffff          0xffff
> +#define MFX_0xffffffffL     4294967295ul
> +#if !defined(CHAR_BIT) || (CHAR_BIT !=3D 8)
> +#  include "error CHAR_BIT"
> +#endif
> +#if !defined(UCHAR_MAX)
> +#  include "error UCHAR_MAX 1"
> +#endif
> +#if !defined(USHRT_MAX)
> +#  include "error USHRT_MAX 1"
> +#endif
> +#if !defined(UINT_MAX)
> +#  include "error UINT_MAX 1"
> +#endif
> +#if !defined(ULONG_MAX)
> +#  include "error ULONG_MAX 1"
> +#endif
> +#if !defined(SHRT_MAX)
> +#  include "error SHRT_MAX 1"
> +#endif
> +#if !defined(INT_MAX)
> +#  include "error INT_MAX 1"
> +#endif
> +#if !defined(LONG_MAX)
> +#  include "error LONG_MAX 1"
> +#endif
> +#if (UCHAR_MAX < 1)
> +#  include "error UCHAR_MAX 2"
> +#endif
> +#if (USHRT_MAX < 1)
> +#  include "error USHRT_MAX 2"
> +#endif
> +#if (UINT_MAX < 1)
> +#  include "error UINT_MAX 2"
> +#endif
> +#if (ULONG_MAX < 1)
> +#  include "error ULONG_MAX 2"
> +#endif
> +#if (UCHAR_MAX < 0xff)
> +#  include "error UCHAR_MAX 3"
> +#endif
> +#if (USHRT_MAX < MFX_0xffff)
> +#  include "error USHRT_MAX 3"
> +#endif
> +#if (UINT_MAX < MFX_0xffff)
> +#  include "error UINT_MAX 3"
> +#endif
> +#if (ULONG_MAX < MFX_0xffffffffL)
> +#  include "error ULONG_MAX 3"
> +#endif
> +#if (USHRT_MAX > UINT_MAX)
> +#  include "error USHRT_MAX vs UINT_MAX"
> +#endif
> +#if (UINT_MAX > ULONG_MAX)
> +#  include "error UINT_MAX vs ULONG_MAX"
> +#endif
> +]], [[
> +#if (USHRT_MAX =3D=3D MFX_0xffff)
> +{ typedef char a_short2a[1 - 2 * !(sizeof(short) =3D=3D 2)]; }
> +#elif (USHRT_MAX >=3D MFX_0xffff)
> +{ typedef char a_short2b[1 - 2 * !(sizeof(short) > 2)]; }
> +#endif
> +#if (UINT_MAX =3D=3D MFX_0xffff)
> +{ typedef char a_int2a[1 - 2 * !(sizeof(int) =3D=3D 2)]; }
> +#elif (UINT_MAX >=3D MFX_0xffff)
> +{ typedef char a_int2b[1 - 2 * !(sizeof(int) > 2)]; }
> +#endif
> +#if (ULONG_MAX =3D=3D MFX_0xffff)
> +{ typedef char a_long2a[1 - 2 * !(sizeof(long) =3D=3D 2)]; }
> +#elif (ULONG_MAX >=3D MFX_0xffff)
> +{ typedef char a_long2b[1 - 2 * !(sizeof(long) > 2)]; }
> +#endif
> +#if (USHRT_MAX =3D=3D MFX_0xffffffffL)
> +{ typedef char a_short4a[1 - 2 * !(sizeof(short) =3D=3D 4)]; }
> +#elif (USHRT_MAX >=3D MFX_0xffffffffL)
> +{ typedef char a_short4b[1 - 2 * !(sizeof(short) > 4)]; }
> +#endif
> +#if (UINT_MAX =3D=3D MFX_0xffffffffL)
> +{ typedef char a_int4a[1 - 2 * !(sizeof(int) =3D=3D 4)]; }
> +#elif (UINT_MAX >=3D MFX_0xffffffffL)
> +{ typedef char a_int4b[1 - 2 * !(sizeof(int) > 4)]; }
> +#endif
> +#if (ULONG_MAX =3D=3D MFX_0xffffffffL)
> +{ typedef char a_long4a[1 - 2 * !(sizeof(long) =3D=3D 4)]; }
> +#elif (ULONG_MAX >=3D MFX_0xffffffffL)
> +{ typedef char a_long4b[1 - 2 * !(sizeof(long) > 4)]; }
> +#endif
> +]])],
> +[mfx_cv_header_sane_limits_h=3Dyes],
> +[mfx_cv_header_sane_limits_h=3Dno])])
> +])
> +
> +# =
/***********************************************************************
> +# // standard
> +# =
************************************************************************/
> +
> +AC_DEFUN([mfx_LZO_CHECK_ENDIAN], [
> +AC_C_BIGENDIAN([AC_DEFINE(LZO_ABI_BIG_ENDIAN,1,[Define to 1 if your =
machine is big endian.])],[AC_DEFINE(LZO_ABI_LITTLE_ENDIAN,1,[Define to =
1 if your machine is little endian.])])
> +])#
> +
> +
> +# =
/***********************************************************************
> +# //
> +# =
************************************************************************/
> +
> +dnl more types which are not yet covered by ACC
> +
> +AC_DEFUN([mfx_CHECK_SIZEOF], [
> +AC_CHECK_SIZEOF(__int32)
> +AC_CHECK_SIZEOF(intmax_t)
> +AC_CHECK_SIZEOF(uintmax_t)
> +AC_CHECK_SIZEOF(intptr_t)
> +AC_CHECK_SIZEOF(uintptr_t)
> +
> +AC_CHECK_SIZEOF(float)
> +AC_CHECK_SIZEOF(double)
> +AC_CHECK_SIZEOF(long double)
> +
> +AC_CHECK_SIZEOF(dev_t)
> +AC_CHECK_SIZEOF(fpos_t)
> +AC_CHECK_SIZEOF(mode_t)
> +AC_CHECK_SIZEOF(off_t)
> +AC_CHECK_SIZEOF(ssize_t)
> +AC_CHECK_SIZEOF(time_t)
> +])#
> +
> +
> +
> +AC_DEFUN([mfx_CHECK_LIB_WINMM], [
> +if test "X$GCC" =3D Xyes; then
> +case $host_os in
> +cygwin* | mingw* | pw32*)
> +     test "X$LIBS" !=3D "X" && LIBS=3D"$LIBS "
> +     LIBS=3D"${LIBS}-lwinmm" ;;
> +*)
> +     ;;
> +esac
> +fi
> +])#
> +
> +#serial 6
> +
> +dnl =46rom Paul Eggert.
> +
> +# Define ST_MTIM_NSEC to be the nanoseconds member of struct stat's =
st_mtim,
> +# if it exists.
> +
> +AC_DEFUN([AC_STRUCT_ST_MTIM_NSEC],
> + [AC_CACHE_CHECK([for nanoseconds member of struct stat.st_mtim],
> +   ac_cv_struct_st_mtim_nsec,
> +   [ac_save_CPPFLAGS=3D"$CPPFLAGS"
> +    ac_cv_struct_st_mtim_nsec=3Dno
> +    # tv_nsec -- the usual case
> +    # _tv_nsec -- Solaris 2.6, if
> +    #	(defined _XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED =3D=3D =
1
> +    #	 && !defined __EXTENSIONS__)
> +    # st__tim.tv_nsec -- UnixWare 2.1.2
> +    for ac_val in tv_nsec _tv_nsec st__tim.tv_nsec; do
> +      CPPFLAGS=3D"$ac_save_CPPFLAGS -DST_MTIM_NSEC=3D$ac_val"
> +      AC_TRY_COMPILE([#include <sys/types.h>
> +#include <sys/stat.h>], [struct stat s; s.st_mtim.ST_MTIM_NSEC;],
> +        [ac_cv_struct_st_mtim_nsec=3D$ac_val; break])
> +    done
> +    CPPFLAGS=3D"$ac_save_CPPFLAGS"])
> +
> +  if test $ac_cv_struct_st_mtim_nsec !=3D no; then
> +    AC_DEFINE_UNQUOTED(ST_MTIM_NSEC, $ac_cv_struct_st_mtim_nsec,
> +      [Define to be the nanoseconds member of struct stat's st_mtim,
> +       if it exists.])
> +  fi
> + ]
> +)
> diff --git a/recipes-support/lzop/lzop_1.03.bb =
b/recipes-support/lzop/lzop_1.03.bb
> new file mode 100644
> index 0000000..02a5590
> --- /dev/null
> +++ b/recipes-support/lzop/lzop_1.03.bb
> @@ -0,0 +1,25 @@
> +inherit autotools
> +
> +SUMMARY =3D "Real-time file compressor"
> +DESCRIPTION =3D "lzop is a compression utility which is designed to =
be a companion to gzip. \n\
> +It is based on the LZO data compression library and its main =
advantages over \n\
> +gzip are much higher compression and decompression speed at the cost =
of some \n\
> +compression ratio. The lzop compression utility was designed with the =
goals \n\
> +of reliability, speed, portability and with reasonable drop-in =
compatibility \n\
> +to gzip."
> +DEPENDS +=3D "lzo"
> +PR =3D "r0"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ddfeaf3dc4beef4f5a7bdbc35b197f39e \
> + =
file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D6797bd3ed0a1a49327b7ebf=
9366ebd86"
> +
> +SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
> +           file://acinclude.m4"
> +
> +do_configure () {
> +    ln -sf ../acinclude.m4
> +    autotools_do_configure
> +}
> +
> +BBCLASSEXTEND +=3D "native"
> --=20
> 1.7.7
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_E7E934E0-A9DA-4C70-A14A-16A967D15A9C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WWw4ACgkQMkyGM64RGpFp/gCfWTB4jdpReMRq8NrFnWoiyGWj
KDsAoL1OL+xyHwonwd1lWHo7UCPxoO39
=rP57
-----END PGP SIGNATURE-----

--Apple-Mail=_E7E934E0-A9DA-4C70-A14A-16A967D15A9C--
