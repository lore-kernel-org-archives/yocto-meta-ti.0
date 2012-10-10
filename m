Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38AB4E011C5
	for <meta-ti@yoctoproject.org>; Tue,  9 Oct 2012 20:58:24 -0700 (PDT)
Received: by mail-oa0-f48.google.com with SMTP id h2so99378oag.35
	for <meta-ti@yoctoproject.org>; Tue, 09 Oct 2012 20:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XcS08ZbnU0wuzL2vNOxIwogHegiwRvcxalXc4aZL/js=;
	b=RfPYODqVqtcedS0AV+rMRYC7y4KDUC6etzM+ePeVGm+NZ0Yj/hiRnuHTkK51/oOqnM
	vVFRJvVZx5XobKrFJK4sVvz8ZhqwYsgbz/jfj5/7Yp7ZqaRGRboWtleIHZqnI0tcXgJk
	BRVm51HhREyNkDs3PKFxnoGhhbW8+bJcxWO+W6a+nOJZZqhYnDNYagMuTLbh/NGPajey
	oCMzd/N+ur2aQOkp22VGCoUQvexDXsJHlNHmZ0e+/yGDUQix8ittTQfR33+GMFDaBSZ1
	goh7PhcJ6jEJcosPrY5EyTxv738SrSpl6WMU9zJqXJq79q2jCvSszzO7WGUub3pso6+E
	K94w==
Received: by 10.182.95.142 with SMTP id dk14mr4657820obb.2.1349841503831;
	Tue, 09 Oct 2012 20:58:23 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id f4sm252726obb.3.2012.10.09.20.58.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 20:58:23 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  9 Oct 2012 23:28:24 -0500
Message-Id: <1349843304-18507-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1349843304-18507-1-git-send-email-fcooper@ti.com>
References: <1349843304-18507-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 2/2][for-comments] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 10 Oct 2012 03:58:24 -0000

* Add version 4.08.00.01 of the SGX modules.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../omap3-sgx-modules_4.08.00.01.bb                |   55 ++++++++++++++++++++
 1 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
new file mode 100644
index 0000000..f45934f
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5743acf520dd81ca172e69f818a3d4"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_08_00_01"
+IMGPV = "1.7.867897"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "<ti-internal-url>/Graphics_SDK_setuplinux_4_08_00_01.bin"
+SRC_URI[md5sum] = "95b8f02923d6ea52ea104fa3d93ce1f0"
+SRC_URI[sha256sum] = "1db2d46ec3c6a97db146357841e02a95a15be658c2297dc571e6e61b32238561"
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
+	if [ "${SUPPORT_XORG}" = "1" ]; then
+	    cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	fi
+}
-- 
1.7.0.4


