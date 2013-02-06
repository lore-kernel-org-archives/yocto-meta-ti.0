Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E943CE00527
	for <meta-ti@yoctoproject.org>; Tue,  5 Feb 2013 22:58:04 -0800 (PST)
Received: by mail-ob0-f175.google.com with SMTP id uz6so1112969obc.6
	for <meta-ti@yoctoproject.org>; Tue, 05 Feb 2013 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cwUFLJh7EukeHqqAOABkuIsTRJ1zLSeOBOCyFuSVtpE=;
	b=PrV0fsBuz+HgyNSbQuuHsA0qLaN/iFxLHHoVEKrcyyjfGFevLqsa6A/6wQJW3ibt26
	lhXM3tb5xEBzCCuL8xNF0TvsiTWWjPxdqYD+x1WIVSWjMESmPP2ZnLXP5pZ0NfPFFUeF
	k5BVOzczAYF3wK1QUD09D7mzYpBE87O7xxjvR2jXVFng8FW18oJMX8ZLxMOwA+2Kg1oC
	9reiQDQ7OKYp8qy8VyxUIWWa2g3RUVFUa4I7ir7K1x1yr6ysTftqs61AmbQxv0vHpf10
	rqQQYdHDzI/YIcENvrYy81wKJni1TOFqzmoXrpelR2HMAQniuABI1MpVZGlgS4HGepKq
	R1LA==
X-Received: by 10.182.182.101 with SMTP id ed5mr20456310obc.23.1360133884324; 
	Tue, 05 Feb 2013 22:58:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm29092880oea.7.2013.02.05.22.58.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 22:58:03 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Wed,  6 Feb 2013 00:57:52 -0600
Message-Id: <1360133872-10658-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360133872-10658-1-git-send-email-fcooper@ti.com>
References: <1360133872-10658-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 06 Feb 2013 06:58:05 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add version 4.08.00.01 of the SGX modules.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2:
Update SRC_URI link to use official SDK download link

 .../omap3-sgx-modules_4.08.00.01.bb                |   56 ++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
new file mode 100644
index 0000000..4885946
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_08_00_01"
+IMGPV = "1.9.2139099"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+
+SRC_URI[md5sum] = "dd0d994a48ecc4293f272a1fddddf159"
+SRC_URI[sha256sum] = "fd721288c95314e0d676dd89462e1dec994e185cb608bcb8ac4a4b5809f9693a"
+
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
+export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
+
+do_install() {
+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    cp  ${S}/pvrsrvkm.ko \
+        ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
+        ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+        ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+
+    if [ "${SUPPORT_XORG}" = "1" ]; then
+        cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+    fi
+}
-- 
1.7.0.4


