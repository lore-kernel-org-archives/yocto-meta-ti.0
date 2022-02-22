Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8793.1645503202322408863
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFFC940C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsQ5BnbkopHP for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B226540C90
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9AFAC174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 15/19] doxygen: remove outdated version in favor of upstream
Date: Tue, 22 Feb 2022 04:13:10 +0000
Message-Id: <20220222041314.2840028-16-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

It's not BSP core functionality and newer version is available from meta-=
oe.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../doxygen/doxygen/patch-flex_2_6_0.diff     | 66 -------------------
 recipes-devtools/doxygen/doxygen_1.8.9.1.bb   | 36 ----------
 2 files changed, 102 deletions(-)
 delete mode 100644 recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.dif=
f
 delete mode 100644 recipes-devtools/doxygen/doxygen_1.8.9.1.bb

diff --git a/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff b/rec=
ipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
deleted file mode 100644
index 36d73798..00000000
--- a/recipes-devtools/doxygen/doxygen/patch-flex_2_6_0.diff
+++ /dev/null
@@ -1,66 +0,0 @@
---- src/code.l.orig
-+++ src/code.l
-@@ -3695,7 +3695,7 @@ void codeFreeScanner()
- extern "C" { // some bogus code to keep the compiler happy
-   void codeYYdummy() { yy_flex_realloc(0,0); }=20
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=3D2 && YY_FLEX_MINOR_VERSION<=3D5 && YY_FL=
EX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4 but old=
er than 2.5.33. These versions do NOT work with doxygen! Please use versi=
on <=3D2.5.4 or >=3D2.5.33 or expect things to be parsed wrongly!"
- #endif
-=20
---- src/commentscan.l.orig
-+++ src/commentscan.l
-@@ -1098,7 +1098,7 @@ RCSTAG    "$"{ID}":"[^\n$]+"$"
- 					      // but we need to know the position in the input buffer wher=
e this=20
- 					      // rule matched.
- 					      // for flex 2.5.33+ we should use YY_CURRENT_BUFFER_LVALUE
--#if YY_FLEX_MINOR_VERSION>=3D5 && YY_FLEX_SUBMINOR_VERSION>=3D33
-+#if YY_FLEX_MAJOR_VERSION>=3D2 && (YY_FLEX_MINOR_VERSION>5 || (YY_FLEX_=
MINOR_VERSION=3D=3D5 && YY_FLEX_SUBMINOR_VERSION>=3D33))
- 					      inputPosition=3DprevPosition + (int)(yy_bp - YY_CURRENT_BUFF=
ER_LVALUE->yy_ch_buf);
- #else
- 					      inputPosition=3DprevPosition + (int)(yy_bp - yy_current_buff=
er->yy_ch_buf);
-@@ -1160,7 +1160,7 @@ RCSTAG    "$"{ID}":"[^\n$]+"$"
-                                           g_memberGroupHeader.resize(0)=
;
- 					  parseMore=3DTRUE;
-                                           needNewEntry =3D TRUE;
--#if YY_FLEX_MINOR_VERSION>=3D5 && YY_FLEX_SUBMINOR_VERSION>=3D33
-+#if YY_FLEX_MAJOR_VERSION>=3D2 && (YY_FLEX_MINOR_VERSION>5 || (YY_FLEX_=
MINOR_VERSION=3D=3D5 && YY_FLEX_SUBMINOR_VERSION>=3D33))
- 				          inputPosition=3DprevPosition + (int)(yy_bp - YY_CURRENT_B=
UFFER_LVALUE->yy_ch_buf) + strlen(yytext);
- #else
- 				          inputPosition=3DprevPosition + (int)(yy_bp - yy_current_b=
uffer->yy_ch_buf) + strlen(yytext);
-
---- src/fortrancode.l.orig
-+++ src/fortrancode.l
-@@ -1289,7 +1289,7 @@ void parseFortranCode(CodeOutputInterfac
- extern "C" { // some bogus code to keep the compiler happy
-   void fortrancodeYYdummy() { yy_flex_realloc(0,0); }=20
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=3D2 && YY_FLEX_MINOR_VERSION<=3D5 && YY_FL=
EX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4 but old=
er than 2.5.33. These versions do NOT work with doxygen! Please use versi=
on <=3D2.5.4 or >=3D2.5.33 or expect things to be parsed wrongly!"
- #else
- extern "C" { // some bogus code to keep the compiler happy
-
---- src/pycode.l.orig
-+++ src/pycode.l       =20
-@@ -1503,7 +1503,7 @@ void parsePythonCode(CodeOutputInterface
- extern "C" { // some bogus code to keep the compiler happy
-   void pycodeYYdummy() { yy_flex_realloc(0,0); }=20
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=3D2 && YY_FLEX_MINOR_VERSION<=3D5 && YY_FL=
EX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4. These =
are currently incompatible with 2.5.4, and do NOT work with doxygen! Plea=
se use version 2.5.4 or expect things to be parsed wrongly! A bug report =
has been submitted (#732132)."
- #endif
-=20
---- src/vhdlcode.l
-+++ src.a/vhdlcode.l
-@@ -1613,7 +1613,7 @@ void codeFreeVhdlScanner()
- extern "C" { // some bogus code to keep the compiler happy
-   void vhdlcodeYYdummy() { yy_flex_realloc(0,0); }=20
- }
--#elif YY_FLEX_SUBMINOR_VERSION<33
-+#elif YY_FLEX_MAJOR_VERSION<=3D2 && YY_FLEX_MINOR_VERSION<=3D5 && YY_FL=
EX_SUBMINOR_VERSION<33
- #error "You seem to be using a version of flex newer than 2.5.4 but old=
er than 2.5.33. These versions do NOT work with doxygen! Please use versi=
on <=3D2.5.4 or >=3D2.5.33 or expect things to be parsed wrongly!"
- #endif
-=20
diff --git a/recipes-devtools/doxygen/doxygen_1.8.9.1.bb b/recipes-devtoo=
ls/doxygen/doxygen_1.8.9.1.bb
deleted file mode 100644
index eb43e741..00000000
--- a/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY =3D "Utilities for generating documentation from source code"
-HOMEPAGE =3D "http://www.doxygen.org/"
-SECTION =3D "console/utils"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db380c86cea229fa42b9e543fc491f=
5eb"
-
-DEPENDS =3D "flex-native bison-native"
-
-SRC_URI =3D "http://ftp.stack.nl/pub/users/dimitri/${BP}.src.tar.gz \
-	file://patch-flex_2_6_0.diff;striplevel=3D0"
-
-SRC_URI[md5sum] =3D "3d1a5c26bef358c10a3894f356a69fbc"
-SRC_URI[sha256sum] =3D "d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b9216=
7e738c1887feccec"
-
-EXTRA_OECONF =3D "--prefix ${prefix}"
-
-DISABLE_STATIC =3D ""
-
-do_configure () {
-	./configure ${EXTRA_OECONF}
-
-	# TODO on rebuilds will repeatedly append.  Change logic to include a
-	# separate file and overwrite that file?
-	echo "TMAKE_CC=3D${CC}" >> tmake/lib/linux-g++/tmake.conf
-	echo "TMAKE_CXX=3D${CXX}" >> tmake/lib/linux-g++/tmake.conf
-	echo "TMAKE_CFLAGS=3D${CFLAGS}" >> tmake/lib/linux-g++/tmake.conf
-	echo "TMAKE_CXXFLAGS=3D${CXXFLAGS}" >> tmake/lib/linux-g++/tmake.conf
-	echo "TMAKE_LINK=3D${CXX}" >> tmake/lib/linux-g++/tmake.conf
-	echo "TMAKE_LFLAGS=3D${LDFLAGS}" >> tmake/lib/linux-g++/tmake.conf
-}
-
-do_install() {
-	oe_runmake install DESTDIR=3D${D} MAN1DIR=3Dshare/man/man1
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

