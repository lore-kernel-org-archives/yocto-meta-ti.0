Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11BB6E01460
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 12:35:28 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so12378421obb.35
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 12:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NZe8Zzdrg7KiKjLUFTsSVqP+eMEvAaS9+aGNOt0KQJo=;
	b=DsymhX0KjC+oKNNC1QQ9K/AgsB+bDxw44vxwn01ZhLHsudqe/8r94k2Sopcsakhrh1
	LaOOEc35xYdoIKFdobmXfjcd4P2R37Xhrs7zPdiJ5tOPoAL0iVPTLMY0Oe6LeuR4zek6
	Fw2eOvuj5YRxc+9KSD7v34MmFuq86U6h75+yQG+iz6XLspZ5JHh3Cq7LCT6I2KamJhrJ
	NB6KF0l2MzW/UjRzAenoH7Sif8kyrPXf83UwQyu3hVNybcvbE88F4JHi5ScodRNwiRbL
	0bFrYfS0Kd9nakYxfQqlQhqW7v8O/gDEXAQ/auq8Sfht4A5IM1Mb3eW6Lx2nnXFrhSsd
	fXuw==
Received: by 10.182.116.2 with SMTP id js2mr14641264obb.38.1346700928594;
	Mon, 03 Sep 2012 12:35:28 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id d4sm12393062obx.3.2012.09.03.12.35.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 12:35:28 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  3 Sep 2012 14:52:05 -0500
Message-Id: <1346701925-7793-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [PATCH] omap3-sgx-modules: Upgrade to latest version 4.06.00.02
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
X-List-Received-Date: Mon, 03 Sep 2012 19:35:29 -0000

* Add the latest version of omap3-sgx-modules.
* Set DEFAULT_PREFERENCE to -1 to match libgles-omap3_4.06.00.02

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../omap3-sgx-modules_4.06.00.02.bb                |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
new file mode 100644
index 0000000..c31e9f1
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.02.bb
@@ -0,0 +1,50 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_06_00_02"
+IMGPV = "1.7.867897"
+BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+# Not making this the default version to match a similar setting
+# in the matching libgles-omap3_4.06.00.02 recipe.
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+SRC_URI[md5sum] = "62f0c378e38f8d14e9f184c3836aea21"
+SRC_URI[sha256sum] = "71c8e154484304b3ce32d565557720a96c7ba762e72d7f1e93deeef9f3274402"
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+export KERNELDIR = "${STAGING_KERNEL_DIR}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti814x = "ti81xx"
+TI_PLATFORM_ti816x = "ti81xx"
+TI_PLATFORM_ti33x = "ti335x"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti814x = "dc_ti81xx_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+MODULESLOCATION_ti33x = "dc_ti335x_linux"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
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


