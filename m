Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3FCC19F53
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:38:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.560.1714513111416430326
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 14:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NN0HlTmu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ULcURC030657;
	Tue, 30 Apr 2024 16:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714513110;
	bh=bRf6QGP7t/GyHV+S3zU43395kH6Lvu0YpfyW50/nBKw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NN0HlTmu5ZcEQSKUA900A0aajmYVx1TyDqYnYgYrIb4PEAhVkeG4z4BxXBWHWuRFD
	 dqeQvEoS1tqwHGVwJwM1idULPaMd0B0Zuz2j+9hKWZTEAj/Cehw38w7ebCAvQaEgJE
	 6lZjz5YopX24kTGzlVgMJHYe1XLXrz7kkZ8S4lnk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ULcUXc093867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 16:38:30 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 16:38:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 16:38:29 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ULcT62017153;
	Tue, 30 Apr 2024 16:38:29 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 1/3] ti-img-rogue-*: add ddk 24.1 recipes for ltsprep
Date: Tue, 30 Apr 2024 16:38:19 -0500
Message-ID: <20240430213821.3697267-2-rs@ti.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430213821.3697267-1-rs@ti.com>
References: <20240430213821.3697267-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Apr 2024 21:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17618

From: Randolph Sapp <rs@ti.com>

Add these recipes but lock them behind ltsprep tags because they require
device tree changes that does not work on the current default kernel for
this layer.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-driver_24.1.6554834.bb       |  44 ++++++
 .../ti-img-rogue-umlibs_24.1.6554834.bb       | 149 ++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
new file mode 100644
index 00000000..a1b76d27
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
@@ -0,0 +1,44 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
+HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
+LICENSE = "MIT | GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
+
+DEFAULT_PREFERENCE = "-1"
+
+inherit module
+
+PROVIDES = "virtual/gpudriver"
+
+MACHINE_KERNEL_PR:append = "b"
+PR = "${MACHINE_KERNEL_PR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
+
+DEPENDS = "virtual/kernel"
+
+BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
+
+TARGET_PRODUCT:j721e = "j721e_linux"
+TARGET_PRODUCT:j721s2 = "j721s2_linux"
+TARGET_PRODUCT:j784s4 = "j784s4_linux"
+TARGET_PRODUCT:am62xx = "am62_linux"
+TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
+PVR_BUILD = "release"
+PVR_WS = "lws-generic"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+}
+
+RRECOMMENDS:${PN} += "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
new file mode 100644
index 00000000..df426d1a
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
@@ -0,0 +1,149 @@
+DESCRIPTION = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
+
+DEFAULT_PREFERENCE = "-1"
+
+inherit bin_package
+
+INHIBIT_DEFAULT_DEPS = ""
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
+
+PR = "r3"
+
+BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
+SRCREV = "e473234158c736248cf71a60080b7faf76fca561"
+S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
+
+TARGET_PRODUCT:j721e = "j721e_linux"
+TARGET_PRODUCT:j721s2 = "j721s2_linux"
+TARGET_PRODUCT:j784s4 = "j784s4_linux"
+TARGET_PRODUCT:am62xx = "am62_linux"
+TARGET_PRODUCT:am62pxx = "am62p_linux"
+TARGET_PRODUCT:j722s = "j722s_linux"
+PVR_BUILD = "release"
+PVR_WS = "lws-generic"
+
+RDEPENDS:${PN} = " \
+    libdrm \
+    ti-img-rogue-driver \
+    ${PN}-firmware \
+"
+
+PACKAGECONFIG ?= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
+"
+
+PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
+PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
+PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
+
+def get_file_list(package_list_var, d):
+    file_list = []
+    package_list = d.getVar(package_list_var)
+    prefix = f"{d.getVar('S')}/"
+    if package_list:
+        for package in package_list.split():
+            package_file_string = d.getVar(f"FILES:{package}")
+            if package_file_string:
+                for package_file in package_file_string.split():
+                    file_list.append(f"{prefix}{package_file}")
+    return " ".join(file_list)
+
+do_install:prepend() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
+        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
+        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
+        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
+        if [ -e ${S}/lib/firmware ]; then
+            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
+        fi
+    fi
+
+    # clean up any empty directories
+    find "${S}" -empty -type d -delete
+}
+
+GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
+VULKAN_PACKAGES = "libvk-rogue"
+OPENCL_PACKAGES = "libopencl-rogue libopencl-rogue-tools"
+
+PACKAGES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGES'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKAGES'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKAGES'), '', d)} \
+    ${PN}-tools \
+    ${PN}-firmware \
+    ${PN} \
+"
+
+# Inject variables so that packages don't get Debian-renamed (which would
+# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the generic
+# libgl name to prevent colliding with swrast libs
+python __anonymous() {
+    suffix = ""
+    if "-native" in d.getVar("PN"):
+        suffix = "-native"
+    for p in (("vulkan", "libvk",),
+              ("gles", "libgles1", "libglesv1-cm1"),
+              ("gles", "libgles2", "libglesv2-2"),
+              ("gles", "libgles3",),
+              ("opencl", "libopencl",)):
+        mlprefix = d.getVar("MLPREFIX")
+        fullp = mlprefix + p[1] + "-rogue" + suffix
+        mlprefix = d.getVar("MLPREFIX")
+        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
+}
+
+# gles specific shared objects
+FILES:libgles1-rogue = "${libdir}/libGLESv1*.so*"
+FILES:libgles2-rogue = "${libdir}/libGLESv2*.so*"
+RDEPENDS:libgles1-rogue += "mesa-megadriver"
+RDEPENDS:libgles2-rogue += "mesa-megadriver"
+
+# vulkan specific shared objects and configs
+FILES:libvk-rogue = "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
+RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
+
+# opencl specific shared objects and configs
+FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
+RDEPENDS:libopencl-rogue += "opencl-icd-loader"
+RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
+FILES:libopencl-rogue-tools += "${bindir}/ocl*"
+DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
+
+# optional tools and tests
+FILES:${PN}-tools = "${bindir}/"
+RDEPENDS:${PN}-tools = "python3-core ${PN}"
+INSANE_SKIP:${PN}-tools = "ldflags"
+RDEPENDS:${PN}-tools = "libdrm"
+
+# required firmware
+FILES:${PN}-firmware = "${base_libdir}/firmware/*"
+INSANE_SKIP:${PN}-firmware += "arch"
+
+RRECOMMENDS:${PN} += " \
+    ${PN}-tools \
+"
+
+INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"
-- 
2.44.0


