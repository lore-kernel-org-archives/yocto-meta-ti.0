Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5819CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:10:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.442.1755792596488837418
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 09:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IW4DRolD;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: t-lannynd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LG9uer524439
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 11:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755792596;
	bh=mEjvA1eL9MD6f5vErxXErilPqrwwMPr6f/tTT7TgUk0=;
	h=From:To:CC:Subject:Date;
	b=IW4DRolD0oGy6k0OPVJH9EnrOLTIQVr+tVtKkcPURI+IgIauXNwoorEJOA9ESWSaR
	 JDg7tCWckCRQ4MsWR/oVxSmSIhL/FYIvluF8j7VyTDnns2wBAmhxlUm+DRc01vFZC1
	 zEAyrWXkGM3mAd3soHpQkqZZAVEPxnnv4H9oMfrM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LG9tSd2644547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 11:09:55 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 11:09:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 11:09:55 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LG9tAe2129962;
	Thu, 21 Aug 2025 11:09:55 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: [meta-ti][master][PATCH v2] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
Date: Thu, 21 Aug 2025 11:09:44 -0500
Message-ID: <20250821160944.845890-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 16:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18953

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
Reviewed-by: Andrew Davis <afd@ti.com>
---

v2:
- Split patch into seperate master and scarthgap patches
- Added SUMMARY to bitbake recipe

 .../recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb        |  2 ++
 .../ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb    |  2 ++
 .../ti-multimedia-udev/files/67-multimedia.rules      |  5 +++++
 .../ti-multimedia-udev/ti-multimedia-udev.bb          | 11 +++++++++++
 4 files changed, 20 insertions(+)
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
index f73f59fa..cdcf4af0 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -19,3 +19,5 @@ SRCREV = "0bcbb20af32ea13275b452f0e84f5a49966d0bf6"
 TARGET_PRODUCT:j721e = "j721e_linux"
 
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
index 00000000..40b0db8e
--- /dev/null
+++ b/meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Udev rules for device naming of VPU devices and JPEG encoder"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI += "file://67-multimedia.rules"
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/67-multimedia.rules ${D}${sysconfdir}/udev/rules.d/
+}

