Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D2DEE0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 16:15:26 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8HNFQk8018199;
	Mon, 17 Sep 2012 18:15:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8HNFQaa025448;
	Mon, 17 Sep 2012 18:15:26 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 17 Sep 2012 18:15:26 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] recipes: Fix ti-eula-unpack issue. Tweak sgx
	modules and libgles recipes.
Thread-Index: AQHNiGdZZzkxFLJPF0Wic+ETd5QIL5ePQ4AA
Date: Mon, 17 Sep 2012 23:15:24 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D6243@DFLE09.ent.ti.com>
References: <1346521503-32331-1-git-send-email-fcooper27jr@gmail.com>
In-Reply-To: <1346521503-32331-1-git-send-email-fcooper27jr@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] recipes: Fix ti-eula-unpack issue. Tweak sgx	modules and libgles recipes.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 23:15:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Franklin S. Cooper Jr
Sent: Saturday, September 01, 2012 12:45 PM
To: meta-ti@yoctoproject.org
Cc: Franklin S. Cooper Jr
Subject: [meta-ti] [PATCH] recipes: Fix ti-eula-unpack issue. Tweak sgx mod=
ules and libgles recipes.

* Commit d8fc4a686262c50fd0053afa7240020909ec430b addressed an issue where
  too many newlines characters were being sent since print by default alrea=
dy
  sends a newline character. This commit however resulted in bin files bein=
g
  installed in the WORKDIR and broke other recipes which commit
  a94f765b9867abefd5f0bd262b5dddb8782b3187 addressed. This lead to a very
  cluttered WORKDIR.
* This patch updates ti-eula-unpack.inc to switch from using a print to a w=
rite.
  Since write doesn't automatically send newlines it is a bit more obvious =
when
  newlines are sent.
* Part of the reason that bin files were being installed in the WORKDIR was
  due to TI_BIN_UNPK_WDEXT being blank for some recipes. For instance in th=
e
  libgles-omap3 recipes, when the workdir command is set in TI_BIN_UNPK_CMD=
S the
  directory that the Graphics SDK will be installed into is
  workdir+TI_BIN_UNPK_WDEXT. A blank TI_BIN_UNPK_WDEXT means the SDK will b=
e
  installed in WORKDIR. By setting TI_BIN_UNPK_WDEXT to a proper value the
  recipes can be sure it is installed in the proper directory.
* Determine which file to download based on the defined BINFILE and not a
  hardcoded value. This idea was taken from arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../omap3-sgx-modules_1.6.16.3977.bb               |    8 ++++----
 recipes-graphics/libgles/libgles-omap3.inc         |    4 ++--
 .../libgles/libgles-omap3_4.03.00.02.bb            |    6 +++---
 .../libgles/libgles-omap3_4.05.00.03.bb            |    6 +++---
 recipes-ti/includes/ti-eula-unpack.inc             |    4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b=
/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
index 0affee1..4f9be7b 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
@@ -11,17 +11,17 @@ BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
=20
 inherit module
=20
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR_append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI =3D=20
+"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfx
+sdk/${SGXPV}/exports/${BINFILE} \
            file://Compile-fixes-for-38-kernel.patch \
            file://kernel-30.patch \
           "
 SRC_URI[md5sum] =3D "ff8c1f2b8e4cb42f4ced6a613b081ada"
 SRC_URI[sha256sum] =3D "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036=
423458c8d75255"
-
-S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
+TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
+S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
=20
 PVRBUILD =3D "release"
 export KERNELDIR =3D "${STAGING_KERNEL_DIR}"
diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/=
libgles/libgles-omap3.inc
index 18ee7ff..4525285 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE =3D "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum  LIC_FILES_CHKSUM =3D "f=
ile://TSPA.txt;md5=3Dc0d5d9c1e38b41677144c4e24d6ddee1"
=20
-PR =3D "r31"
+PR =3D "r32"
=20
 COMPATIBLE_MACHINE =3D "(omap3|ti814x|ti816x|ti33x)"
=20
@@ -11,7 +11,7 @@ DEPENDS =3D "virtual/libx11 libxau libxdmcp libdrm"
=20
 PROVIDES +=3D "virtual/egl"
=20
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/${SGXPV}/exports/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin =
\
+SRC_URI =3D=20
+"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfx
+sdk/${SGXPV}/exports/${BINFILE} \
 		   file://cputype \
 		   file://rc.pvr \
 		   file://sample.desktop \
diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes=
-graphics/libgles/libgles-omap3_4.03.00.02.bb
index 97a22fe..e98fe02 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
@@ -15,8 +15,9 @@ require libgles-omap3.inc  SGXPV =3D "4_03_00_02"
 IMGPV =3D "1.6.16.3977"
 BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
=20
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI =3D=20
+"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfx
+sdk/${SGXPV}/exports/${BINFILE} \
                    file://cputype \
                    file://rc.pvr \
                    file://sample.desktop \ @@ -26,5 +27,4 @@ SRC_URI =3D "=
http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] =3D "ff8c1f2b8e4cb42f4ced6a613b081ada"
 SRC_URI[sha256sum] =3D "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036=
423458c8d75255"
=20
-S =3D "${WORKDIR}"
-
+S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recipes=
-graphics/libgles/libgles-omap3_4.05.00.03.bb
index d55dd05..7795e2e 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -12,8 +12,9 @@ require libgles-omap3.inc  SGXPV =3D "4_05_00_03"
 IMGPV =3D "1.6.16.4117"
 BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
=20
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI =3D=20
+"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfx
+sdk/${SGXPV}/exports/${BINFILE} \
                    file://cputype \
                    file://rc.pvr \
                    file://sample.desktop \ @@ -23,5 +24,4 @@ SRC_URI =3D "=
http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] =3D "0e651eaa92bb91760f0b40a17697a7dc"
 SRC_URI[sha256sum] =3D "bfe764a8959556195545d6fff76f63a489642f345c105bbbc3=
09a3f243c2dd0e"
=20
-S =3D "${WORKDIR}"
-
+S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/t=
i-eula-unpack.inc
index 60f5558..aee88f1 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -14,7 +14,7 @@ python do_unpack () {
     bb.build.exec_func('ti_bin_do_unpack', d)  }
=20
-TI_BIN_UNPK_WDEXT +=3D ""
+TI_BIN_UNPK_WDEXT ?=3D ""
 python ti_bin_do_unpack() {
=20
     import os
@@ -60,7 +60,7 @@ python ti_bin_do_unpack() {
             wdext =3D bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
             wdext =3D bb.data.expand(wdext, localdata)
             cmd =3D workdir+wdext
-        print >>f, cmd
+        f.write(cmd+'\n');
     f.close()
=20
     # Expand the tarball that was created if required
--
1.7.0.4

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

