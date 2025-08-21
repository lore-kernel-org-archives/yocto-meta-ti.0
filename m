Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68744CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:24:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.881.1755746482096388877
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Aug 2025 20:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hN1vBQim;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: t-lannynd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L3LLvm393175
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 Aug 2025 22:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755746481;
	bh=BPqRiCspQaYkxxG3qVn7ydQ6SasKHZv046zcdXpgQL0=;
	h=From:To:CC:Subject:Date;
	b=hN1vBQimjbmNtPJ/FtLVnQeZJ4sk7BMt7uR69gQ5PORh2tGyRBf2hsQVYo91lkjJx
	 snmolh4usofFNfYvfbX/A217Ek/iiWpsNrkAC39Y1VchdDC725B9MEpu2KGoxqAxjv
	 Pu6bYJm2DM+TkodWzUOJyLeqYEyGDGScv/B6o/i0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L3LLMG1823326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 Aug 2025 22:21:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 22:21:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 22:21:20 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L3LKoD1213991;
	Wed, 20 Aug 2025 22:21:20 -0500
From: "Thorsten Lannynd" <t-lannynd@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
Date: Wed, 20 Aug 2025 22:20:55 -0500
Message-ID: <20250821032055.388954-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 14:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18948

This patch introduces udev rules to ensure consistent device naming for
VPU decoders, encoders, and the JPEG encoder. These rules are essential
for enabling hardware-accelerated video decoding in Chromium using the
V4L2 Stateful decoder.

The following udev rules are added:
- Map vpu and vpu0 to /dev/video-dec0 and /dev/video-enc0.
- Map vpu1 to /dev/video-dec1 and /dev/video-enc1.
- Map the JPEG encoder to /dev/jpeg-enc0.

These changes ensure proper operation of the VPU and JPEG encoder,
especially when other video devices are connected, avoiding mismatches.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb   | 2 ++
 .../ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb       | 2 ++
 .../ti-multimedia-udev/files/67-multimedia.rules         | 5 +++++
 .../ti-multimedia-udev/ti-multimedia-udev.bb             | 9 +++++++++
 4 files changed, 18 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules
 create mode 100644 meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 6a65992f..95bfd01a 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -27,3 +27,5 @@ do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/cnm
 	install -m 0644 ${S}/cnm/${SOURCE_WAVE521C} ${D}${nonarch_base_libdir}/firmware/cnm/${TARGET_WAVE521C}
 }
+
+RDEPENDS:${PN} += "ti-multimedia-udev"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
index 9a3b6bfd..3ffde870 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -21,3 +21,5 @@ TARGET_PRODUCT:j721e = "j721e_linux"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+RDEPENDS:${PN} += "ti-multimedia-udev"
diff --git a/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules
new file mode 100644
index 00000000..5239d1ef
--- /dev/null
+++ b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/files/67-multimedia.rules
@@ -0,0 +1,5 @@
+SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/*210000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU decoder", SYMLINK+="video-dec0"
+SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/*210000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU encoder", SYMLINK+="video-enc0"
+SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/4220000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU decoder", SYMLINK+="video-dec1"
+SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/4220000.video-codec/video4linux/video*", ATTR{name}=="C&M Wave5 VPU encoder", SYMLINK+="video-enc1"
+SUBSYSTEM=="video4linux", DEVPATH=="/devices/*/fd20000.jpeg-encoder/video4linux/video*", ATTR{name}=="e5010", SYMLINK+="jpeg-enc0"
diff --git a/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
new file mode 100644
index 00000000..24c25b1a
--- /dev/null
+++ b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
@@ -0,0 +1,9 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI += "file://67-multimedia.rules"
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/67-multimedia.rules ${D}${sysconfdir}/udev/rules.d/
+}

