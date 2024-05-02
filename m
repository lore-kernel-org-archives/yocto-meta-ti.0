Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08A5C25B10
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:19:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3519.1714677536648300698
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F7PZO7aR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442JIptp047573;
	Thu, 2 May 2024 14:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714677531;
	bh=+cXRuzFk2wSA95pVplmbYGgHTEqd0ZlPnP6uAVOf5fw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F7PZO7aRCtFn9dgAVjCgNAi8gpOV3wga3w2dne0NbA39aZcgZWT97otSTk1lOHGRY
	 0kDIldRzw+GVvhGHVmXEUUCOWwLWxhXOOj3ZM8EoolGB+Uc2s0Ed58OJHNd7VSfDTK
	 oUNV/OSEkx98SPlBXEQ9n7+UkNAeRWnK+iQmpIE0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442JIp30003641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 14:18:51 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 14:18:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 14:18:51 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442JIpgV120631;
	Thu, 2 May 2024 14:18:51 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master/scarthgap][PATCHv2 3/3] mesa-pvr_23.2.1: add recipe for 23.2.1
Date: Thu, 2 May 2024 14:18:43 -0500
Message-ID: <20240502191843.2380555-4-rs@ti.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502191843.2380555-1-rs@ti.com>
References: <20240502191843.2380555-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 19:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17638

From: Randolph Sapp <rs@ti.com>

Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
This branch does not currently contain SGX patches so it is also being
masked by the ltsprep branding to prevent regressing those devices
currently.

Please note that may run into sstate errors when switching to or away
from the ltsprep tag. Please issue a clean to mesa and
ti-img-rogue-umlibs if you get warnings from either package's
do_create_runtime_spdx step.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
new file mode 100644
index 00000000..1e66acd2
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -0,0 +1,58 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without completely
+# clobbering mesa.
+
+DEFAULT_PREFERENCE = "-1"
+
+require recipes-graphics/mesa/mesa.inc
+
+SUMMARY += " (with PowerVR support for TI platforms)"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
+
+BRANCH = "powervr/${PV}"
+
+SRC_URI = " \
+    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
+    file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+    file://0001-gallium-Fix-build-with-llvm-17.patch \
+    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
+"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG:append = " \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
+    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
+"
+
+SRCREV = "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
+
+PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
+PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
+PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
+
+PACKAGECONFIG:remove = "video-codecs"
+PACKAGECONFIG[video-codecs] = ""
+PACKAGECONFIG:remove = "elf-tls"
+PACKAGECONFIG[elf-tls] = ""
+PACKAGECONFIG:remove = "xvmc"
+PACKAGECONFIG[xvmc] = ""
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
+
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
+FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
+
+RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
-- 
2.44.0


