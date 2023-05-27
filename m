Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164A5C77B7A
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:58:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3626.1685152725115627191
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 18:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gC120Ixi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34R1weNR107060;
	Fri, 26 May 2023 20:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685152720;
	bh=y9xuptB8jv0FmTqWzEZ9B8cnR1qJrDzMggtQt7Mn9M4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gC120IxiZrNuLrSFpNt1DpzRBvYHgsrtwnEQb6NUukjKUBZ/6NdFQEN/LspqLOrCk
	 y3WPai8kDn/VJBh1rOzd+lcFwjSQ6s0XjD+nq7CnigiwCzTGBZ+0NMKhUJx2JuAJIT
	 SIm6b4UqSgFHHE2mcw9JzoIcpTVJ8p2jfnmDRnL8=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34R1weZD007043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 20:58:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 20:58:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 20:58:40 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34R1weNZ066247;
	Fri, 26 May 2023 20:58:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] ti-img-rogue-umlibs: bump version and explicitly package
Date: Fri, 26 May 2023 20:58:37 -0500
Message-ID: <20230527015837.231817-3-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230527015837.231817-1-rs@ti.com>
References: <20230527015837.231817-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 27 May 2023 01:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16614

From: Randolph Sapp <rs@ti.com>

Bump the version and explicitly package all Khronos APIs separately.
This should be nice for those folks that want a headless opencl system
for tinkering and such.

This version includes experimental GEM support (for applications like
Chromium that like to poke at the render node) and a new Vulkan ICD
loader interface for better support with the Vulkan ICD loaders present
in Yocto.

This lifts a method from mesa used to force a common naming convention
for Vulkan, OpenCL, and OpenGLES libs to make things a little easier to
follow. Without it the target package names get scrambled based on the
shared object name.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-driver_23.1.6404501.bb       |  2 +-
 .../rogue/ti-img-rogue-umlibs_23.1.6404501.bb | 89 +++++++++++++------
 2 files changed, 65 insertions(+), 26 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
index 76e3d801..1a08a441 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
+SRCREV = "ebddb087ef140ca83e4c30d66580b0bb33b003fd"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
index f22cd1d1..3fcb786c 100644
--- a/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "452b0f50d2984171c81d5a0d3b22198177d919ad"
+SRCREV = "bfacba50b004d0e93ee1f8b42d2217131453f5fd"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
@@ -22,52 +22,91 @@ TARGET_PRODUCT:am62xx = "am62_linux"
 PVR_BUILD = "release"
 PVR_WS = "lws-generic"
 
-RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
+RDEPENDS:${PN} = " \
+    libdrm \
+    ti-img-rogue-driver \
+    ${PN}-firmware \
+"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
         mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
         rmdir ${D}/lib
     fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
-        rm -rf ${D}${libdir}/libVK_IMG.so*
-    fi
-    rm -rf "${D}/etc/init.d"
 }
 
 PACKAGES = " \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
+    libgles1-rogue libgles1-rogue-dev \
+    libgles2-rogue libgles2-rogue-dev \
+    libgles3-rogue libgles3-rogue-dev \
+    libvk-rogue libvk-rogue-dev \
+    libopencl-rogue libopencl-rogue-dev \
+    libopencl-rogue-tools \
     ${PN}-tools \
     ${PN}-firmware \
+    ${PN}-dev \
     ${PN} \
 "
 
-FILES:${PN}-vulkan = " \
-    ${datadir}/vulkan \
-    ${libdir}/libVK_IMG.so* \
-"
-RDEPENDS:${PN}-vulkan += " \
-    mesa-vulkan-drivers \
-    libdrm \
-    ti-img-rogue-driver \
-    libx11-xcb \
-    wayland \
-"
-INSANE_SKIP:${PN}-vulkan += " \
-    already-stripped \
-    dev-so \
-"
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
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
+
+        # For -dev, the first element is both the Debian and original name
+        fullp = mlprefix + p[1] + "-rogue-dev" + suffix
+        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+}
+
+# gles specific shared objects
+FILES:libgles1-rogue = "${libdir}/libGLESv1*.so.*"
+FILES:libgles1-rogue-dev = "${libdir}/libGLESv1*.so"
+FILES:libgles2-rogue = "${libdir}/libGLESv2*.so.*"
+FILES:libgles2-rogue-dev = "${libdir}/libGLESv2*.so"
+RDEPENDS:libgles1-rogue += "mesa-megadriver"
+RDEPENDS:libgles2-rogue += "mesa-megadriver"
+RDEPENDS:libgles3-rogue-dev += "libgles2-rogue-dev"
+
+# vulkan specific shared objects and configs
+FILES:libvk-rogue = "${libdir}/libVK_IMG.so.* ${datadir}/vulkan"
+FILES:libvk-rogue-dev = "${libdir}/libVK_IMG.so"
+RDEPENDS:libvk-rogue += "vulkan-loader libx11-xcb wayland libdrm"
+
+# opencl specific shared objects and configs
+FILES:libopencl-rogue = "${libdir}/libPVROCL.so.* ${sysconfdir}/OpenCL"
+FILES:libopencl-rogue-dev = "${libdir}/libPVROCL.so"
+RDEPENDS:libopencl-rogue += "opencl-icd-loader"
+RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
+FILES:libopencl-rogue-tools += "${bindir}/ocl*"
 
+# optional tools and tests
 FILES:${PN}-tools = "${bindir}/"
-RDEPENDS:${PN}-tools = "python3-core"
+RDEPENDS:${PN}-tools = "python3-core ${PN}"
 
+# required firmware
 FILES:${PN}-firmware = "${base_libdir}/firmware/*"
 INSANE_SKIP:${PN}-firmware += "arch"
 
 RRECOMMENDS:${PN} += " \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libgles1-rogue libgles2-rogue", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan x11 wayland", "libvk-rogue", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opencl", "libopencl-rogue", "", d)} \
     ${PN}-tools \
 "
-RDEPENDS:${PN} += " ${PN}-firmware"
 
 INSANE_SKIP:${PN} += "already-stripped dev-so"
-- 
2.40.1


