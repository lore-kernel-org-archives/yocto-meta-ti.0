Return-Path: <r-monk@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5A2AE01421
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 06:43:19 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4ADhIAJ028028;
	Thu, 10 May 2012 08:43:18 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4ADhGI9025405;
	Thu, 10 May 2012 08:43:18 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Thu, 10 May 2012 15:42:59 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] omapfbplay: import from OE classic
Thread-Index: AQHNLqUZfbMuoq6l6USfKciGIL58ZpbDBCMA
Date: Thu, 10 May 2012 13:42:55 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B755661@DNCE05.ent.ti.com>
References: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1336651467-17102-1-git-send-email-koen@dominion.thruhere.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {A696D2E7-C9A0-4B8E-AE75-3C5C4345C6B1}
x-cr-hashedpuzzle: Agxh CUBF C7hO DgUH FYcK GSl6 HGIy Im5W LKKT M43i QHor
	Rehy SxYr SysN WBSA WpB0; 2;
	awBvAGUAbgBAAGQAbwBtAGkAbgBpAG8AbgAuAHQAaAByAHUAaABlAHIAZQAuAG4AZQB0ADsAbQBlAHQAYQAtAHQAaQBAAHkAbwBjAHQAbwBwAHIAbwBqAGUAYwB0AC4AbwByAGcA;
	Sosha1_v1; 7; {A696D2E7-C9A0-4B8E-AE75-3C5C4345C6B1};
	cgAtAG0AbwBuAGsAQAB0AGkALgBjAG8AbQA=; Thu,
	10 May 2012 13:42:32 GMT;
	UgBFADoAIABbAG0AZQB0AGEALQB0AGkAXQAgAFsAUABBAFQAQwBIAF0AIABvAG0AYQBwAGYAYgBwAGwAYQB5ADoAIABpAG0AcABvAHIAdAAgAGYAcgBvAG0AIABPAEUAIABjAGwAYQBzAHMAaQBjAA==
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "Dmytriyenko, Denys" <denys@ti.com>
Subject: Re: [PATCH] omapfbplay: import from OE classic
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
X-List-Received-Date: Thu, 10 May 2012 13:43:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Think we've still got some API incompatibility here.  I needed to roll back=
 to an earlier omapfbplay commit (34293052c5a2ae328eac6903512e6b4ce19b5639)=
 and patch CODEC_TYPE :-

-        if (afc->streams[i]->codec->codec_type =3D=3D CODEC_TYPE_VIDEO && =
!st)
+        if (afc->streams[i]->codec->codec_type =3D=3D AVMEDIA_TYPE_VIDEO &=
& !st)

to get this working on beagleboard-xm, so I suspect there may have been an =
API change after Aug11, or d03f042ecac0a231bedeadc7a6c67f0102d5505a was reb=
ased against 0.8 branch?  I guess we should ask Mans...

~rog


Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: 10 May 2012 13:04
To: meta-ti@yoctoproject.org
Cc: Dmytriyenko, Denys
Subject: [meta-ti] [PATCH] omapfbplay: import from OE classic

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../files/0001-rollback-to-libav-0.7.4-API.patch   |   26 +++++++++++++++
 .../files/omapfbplay-errorhandling.patch           |   34 ++++++++++++++++=
++++
 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb |   16 +++++++++
 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb  |    7 ++++
 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb   |    3 ++
 recipes-graphics/omapfbplay/omapfbplay.inc         |   33 ++++++++++++++++=
+++
 recipes-graphics/omapfbplay/omapfbplay_git.bb      |    3 ++
 7 files changed, 122 insertions(+)
 create mode 100644 recipes-graphics/omapfbplay/files/0001-rollback-to-liba=
v-0.7.4-API.patch
 create mode 100644 recipes-graphics/omapfbplay/files/omapfbplay-errorhandl=
ing.patch
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay.inc
 create mode 100644 recipes-graphics/omapfbplay/omapfbplay_git.bb

diff --git a/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4=
-API.patch b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4=
-API.patch
new file mode 100644
index 0000000..9095fe5
--- /dev/null
+++ b/recipes-graphics/omapfbplay/files/0001-rollback-to-libav-0.7.4-API.pa=
tch
@@ -0,0 +1,26 @@
+From dca631cfa22b1f903c943a9e03597aa6f9ae10d4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 10 May 2012 14:01:27 +0200
+Subject: [PATCH] rollback to libav 0.7.4 API
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ omapfbplay.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/omapfbplay.c b/omapfbplay.c
+index 6a6fc96..1e5a29c 100644
+--- a/omapfbplay.c
++++ b/omapfbplay.c
+@@ -674,7 +674,7 @@ main(int argc, char **argv)
+     pthread_join(dispt, NULL);
+
+ out:
+-    if (afc) avformat_close_input(&afc);
++    if (afc) av_close_input_file(&afc);
+
+     if (codec)   codec->close();
+     if (timer)   timer->close();
+--
+1.7.10
+
diff --git a/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.pat=
ch b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
new file mode 100644
index 0000000..7dd544f
--- /dev/null
+++ b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
@@ -0,0 +1,34 @@
+From e321ae7df57ada9ecc8c155fa4e5511c96ef5db3 Mon Sep 17 00:00:00 2001
+From: Rob Clark <rob@ti.com>
+Date: Fri, 18 Mar 2011 12:40:51 -0500
+Subject: [PATCH] dce: differentiate between fatal and non-fatal errors
+
+For streams with errors, the codec will throw back an error. But not
+all errors are fatal.
+---
+ dce.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/dce.c b/dce.c
+index ab7ad0a..88f175e 100644
+--- a/dce.c
++++ b/dce.c
+@@ -270,8 +270,14 @@ static int dce_decode(AVPacket *p)
+
+     err =3D VIDDEC3_process(codec, inbufs, outbufs, in_args, out_args);
+     if (err) {
+-        fprintf(stderr, "VIDDEC3_process() error %d\n", err);
+-        return -1;
++        fprintf(stderr, "VIDDEC3_process() error %d %08x\n", err,
++                    out_args->extendedError);
++        /* for non-fatal errors, keep going.. a non-fatal error could
++         * just indicate an error in the input stream which the codec
++         * was able to conceal
++         */
++        if (XDM_ISFATALERROR(out_args->extendedError))
++            return -1;
+     }
+
+     for (i =3D 0; i < out_args->outputID[i]; i++) {
+--
+1.7.1
diff --git a/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb b/recipes-g=
raphics/omapfbplay/omapfbplay-cmem_git.bb
new file mode 100644
index 0000000..a0392f6
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
@@ -0,0 +1,16 @@
+require omapfbplay.inc
+
+DEPENDS +=3D "ti-linuxutils"
+
+require recipes-ti/includes/ti-paths.inc
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+SDMA_CFLAGS =3D " -I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/s=
dma/include/"
+CMEM_CFLAGS =3D " -I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/c=
mem/include/"
+CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include ${SDMA_CFLAGS} ${CMEM_CF=
LAGS}"
+
+export SDMA_LIBS =3D "-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxuti=
ls/sdma/lib -l:sdma.a470MV"
+export CMEM_LIBS =3D "-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxuti=
ls/cmem/lib -l:cmem.a470MV"
+
+OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy CMEM=3Dy SDMA=3Dy"
diff --git a/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb b/recipes-gr=
aphics/omapfbplay/omapfbplay-dce_git.bb
new file mode 100644
index 0000000..e70ac72
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
@@ -0,0 +1,7 @@
+require omapfbplay.inc
+
+DEPENDS +=3D "libdce"
+
+CFLAGS +=3D " -I. -I${STAGING_INCDIR}/dce -I${STAGING_KERNEL_DIR}/include =
"
+
+OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy DCE=3Dy"
diff --git a/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb b/recipes-gra=
phics/omapfbplay/omapfbplay-xv_git.bb
new file mode 100644
index 0000000..cadf6d8
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
@@ -0,0 +1,3 @@
+require omapfbplay.inc
+
+OMAPFBPLAYOPTS =3D "V4L2=3Dy NETSYNC=3Dy XV=3Dy"
diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc b/recipes-graphics/=
omapfbplay/omapfbplay.inc
new file mode 100644
index 0000000..88de77b
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay.inc
@@ -0,0 +1,33 @@
+DESCRIPTION =3D "Simple libav-based player that uses the omapfb overlays"
+DEPENDS =3D "bzip2 lame libav virtual/kernel"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://omapfbplay.c;beginline=3D2;endline=3D22;md5=
=3D05d3789ab362e6f4a9682e98100ea0fa"
+
+PV =3D "0.0+${PR}+gitr${SRCREV}"
+
+SRCREV =3D "d03f042ecac0a231bedeadc7a6c67f0102d5505a"
+SRC_URI =3D "git://git.mansr.com/omapfbplay;protocol=3Dgit \
+           file://omapfbplay-errorhandling.patch \
+           file://0001-rollback-to-libav-0.7.4-API.patch \
+          "
+
+S =3D "${WORKDIR}/git"
+
+# We want a kernel header for armv7a, but we don't want to make mplayer ma=
chine specific for that
+STAGING_KERNEL_DIR =3D "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${T=
ARGET_OS}/kernel"
+CFLAGS +=3D " -I. -I${STAGING_KERNEL_DIR}/include "
+
+OMAPFBPLAYVARIANT ?=3D "${PN}"
+OMAPFBPLAYOPTS ?=3D "V4L2=3Dy NETSYNC=3Dy"
+
+do_compile() {
+       cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h $=
{S} || true
+       cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S} ||=
 true
+       cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || true
+       oe_runmake ${TARGET_ARCH}=3Dy ${OMAPFBPLAYOPTS} -e
+}
+
+do_install() {
+       install -d ${D}/${bindir}
+       install -m 0755 ${S}/omapfbplay ${D}/${bindir}/${OMAPFBPLAYVARIANT}
+}
diff --git a/recipes-graphics/omapfbplay/omapfbplay_git.bb b/recipes-graphi=
cs/omapfbplay/omapfbplay_git.bb
new file mode 100644
index 0000000..0d3956f
--- /dev/null
+++ b/recipes-graphics/omapfbplay/omapfbplay_git.bb
@@ -0,0 +1,3 @@
+require omapfbplay.inc
+
+OMAPFBPLAYOPTS =3D "V4L2=3Dy OMAPFB=3Dy NETSYNC=3Dy"
--
1.7.10

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


