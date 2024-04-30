Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08963C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:38:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.559.1714513111388923763
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 14:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T8skrJP9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ULcUUS030653;
	Tue, 30 Apr 2024 16:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714513110;
	bh=VKnIvZ89fD+U4xn97mY1G0dvo76n3+OXYofPccURU44=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T8skrJP9MzbhU/f29ZbQ01WXo3vaLWcKr4a7DKDLbli76UGNmUtoCbKudJg50/sYQ
	 Mach5mNy+USMgt9B4V72XlFcH88uwjU3yuJbynFOMAPKQdDjRx/A5tgBEp2y8NpZ/J
	 1ytdRf9ZhOSO9SDL+TciC+I/TUOyzLqdhak4d4D8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ULcU7W009249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 16:38:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 16:38:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 16:38:29 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ULcT64017153;
	Tue, 30 Apr 2024 16:38:29 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add recipe for 23.2.1
Date: Tue, 30 Apr 2024 16:38:21 -0500
Message-ID: <20240430213821.3697267-4-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17617

From: Randolph Sapp <rs@ti.com>

Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
This branch does not currently contain SGX patches so it is also being
masked by the ltsprep branding to prevent regressing those devices
currently.

Please note that because this recipe is currently in
SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
switching away from the ltsprep tag. Please issue a clean to mesa and
ti-img-rogue-umlibs if you get warnings from either package's
do_create_runtime_spdx step.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
new file mode 100644
index 00000000..c83ba87d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
@@ -0,0 +1,59 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without completely
+# clobbering mesa.
+
+DEFAULT_PREFERENCE = "-1"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}_${PV}:"
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


