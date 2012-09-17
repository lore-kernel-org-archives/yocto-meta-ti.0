Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F4F8E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 16:38:33 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8HNcX8V020531
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 18:38:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8HNcXpv016017
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 18:38:33 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 17 Sep 2012 18:38:33 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] omap3-sgx-modules: Upgrade to latest version
	4.06.00.02
Thread-Index: AQHNigtbHN78sN36sE+7Nm1tK3qoMZePRt2Q
Date: Mon, 17 Sep 2012 23:38:32 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D62B7@DFLE09.ent.ti.com>
References: <1346701925-7793-1-git-send-email-fcooper27jr@gmail.com>
In-Reply-To: <1346701925-7793-1-git-send-email-fcooper27jr@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] omap3-sgx-modules: Upgrade to latest version	4.06.00.02
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
X-List-Received-Date: Mon, 17 Sep 2012 23:38:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Franklin S. Cooper Jr
Sent: Monday, September 03, 2012 2:52 PM
To: meta-ti@yoctoproject.org
Cc: Franklin S. Cooper Jr
Subject: [meta-ti] [PATCH] omap3-sgx-modules: Upgrade to latest version 4.0=
6.00.02

* Add the latest version of omap3-sgx-modules.
* Set DEFAULT_PREFERENCE to -1 to match libgles-omap3_4.06.00.02

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../omap3-sgx-modules_4.06.00.02.bb                |   50 ++++++++++++++++=
++++
 1 files changed, 50 insertions(+), 0 deletions(-)  create mode 100644 reci=
pes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb b/=
recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
new file mode 100644
index 0000000..c31e9f1
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
@@ -0,0 +1,50 @@
+DESCRIPTION =3D "Kernel drivers for the PowerVR SGX chipset found in the o=
map3 SoCs"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea5743acf520dd81ca172e69f818a3d=
4"
+
+TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV =3D "4_06_00_02"
+IMGPV =3D "1.7.867897"
+BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append =3D "a"
+PR =3D "${MACHINE_KERNEL_PR}"
+
+# Not making this the default version to match a similar setting # in=20
+the matching libgles-omap3_4.06.00.02 recipe.
+DEFAULT_PREFERENCE =3D "-1"
+
+SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+SRC_URI[md5sum] =3D "62f0c378e38f8d14e9f184c3836aea21"
+SRC_URI[sha256sum] =3D "71c8e154484304b3ce32d565557720a96c7ba762e72d7f1e93=
deeef9f3274402"
+TI_BIN_UNPK_WDEXT=3D"/Graphics_SDK_${SGXPV}"
+S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
+
+PVRBUILD =3D "release"
+export KERNELDIR =3D "${STAGING_KERNEL_DIR}"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+
+TI_PLATFORM_omap3 =3D "omap3630"
+TI_PLATFORM_ti814x =3D "ti81xx"
+TI_PLATFORM_ti816x =3D "ti81xx"
+TI_PLATFORM_ti33x =3D "ti335x"
+
+MODULESLOCATION_omap3 =3D "dc_omapfb3_linux"
+MODULESLOCATION_ti814x =3D "dc_ti81xx_linux"
+MODULESLOCATION_ti816x =3D "dc_ti81xx_linux"
+MODULESLOCATION_ti33x =3D "dc_ti335x_linux"
+
+MAKE_TARGETS =3D " BUILD=3D${PVRBUILD} TI_PLATFORM=3D${TI_PLATFORM}"
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    cp  ${S}/pvrsrvkm.ko \
+        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
+        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+}
--
1.7.0.4

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

