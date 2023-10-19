Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B72CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:39:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.25148.1697715584109305416
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 04:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OgeI2rwt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-mantena@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JBdh9f026118
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 06:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697715583;
	bh=msHSpEp3m/FGYBAQEmkUpL6/CZXL7GBxb0bUHjSBFks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OgeI2rwtfGfZH5sjiGxpYyIm5HWRa4eG4VNxbdOCp2B60F7eMrCAYeoFeDeldLhsD
	 pGO3Y0v2hU7KFekpF0pgH4ZH2SQX2/ETxVf3z0zMzHWWtBcx0GQe/xRrDf+ezeqmzb
	 h9FmmN/F6VfpmT0OlkwUUzIZvLvoIqYsVvXISZ98=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JBdhmG056643
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 06:39:43 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 06:39:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 06:39:43 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JBdgpB009695;
	Thu, 19 Oct 2023 06:39:42 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>
Subject: [meta-ti][kirkstone][PATCH 1/1] linux-bb.org: update to 6.1.46 for aarch64 targets
Date: Thu, 19 Oct 2023 17:09:38 +0530
Message-ID: <20231019113938.1657179-2-p-mantena@ti.com>
X-Mailer: git-send-email 2.33.3
In-Reply-To: <20231019113938.1657179-1-p-mantena@ti.com>
References: <20231019113938.1657179-1-p-mantena@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 11:39:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17141

Updates SRCREV, PV, and BRANCH for aarch64 targets. This fixes the
kernel boot issue. Update the machine conf file, aligning to the changes
made in the naming of devicetree files from 5.10 to 6.1.

Tested by running MACHINE=beaglebone-ai64 bitbake tisdk-default-image
and booting the beagleboneai64 with the images.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 72 ++++++-------------
 .../recipes-kernel/linux/linux-bb.org_git.bb  |  8 +--
 2 files changed, 24 insertions(+), 56 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index bd5f541f..9de15266 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -10,62 +10,30 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
 
 KERNEL_DEVICETREE = " \
 ti/k3-j721e-beagleboneai64.dtb \
-ti/k3-j721e-beagleboneai64-no-shared-mem.dtb \
 ti/k3-j721e-common-proc-board.dtb \
-ti/k3-j721e-common-proc-board-infotainment.dtbo \
-ti/k3-j721e-common-proc-board-uarts.dtbo \
-ti/k3-j721e-cpb-csi2-ov5640.dtbo \
-ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-0-3.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-cm-1-3.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-0-3.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-0.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-1.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
-ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
-ti/k3-j721e-fpdlink-sk-fusion.dtbo \
-ti/k3-j721e-gesi-exp-board.dtbo \
-ti/k3-j721e-proc-board-tps65917.dtb \
-ti/k3-j721e-quad-port-eth-exp.dtbo \
+ti/k3-j721e-evm-csi2-ov5640.dtbo \
+ti/k3-j721e-evm.dtb \
+ti/k3-j721e-evm-fusion.dtbo \
+ti/k3-j721e-evm-gesi-exp-board.dtbo \
+ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
+ti/k3-j721e-evm-virt-mac-client.dtbo \
 ti/k3-j721e-sk-csi2-ov5640.dtbo \
+ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
 ti/k3-j721e-sk.dtb \
-ti/k3-j721e-sk-rpi-cam-imx219.dtbo \
+ti/k3-j721e-sk-fusion.dtbo \
 ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
-ti/overlays/BBAI64-CSI0-imx219.dtbo \
-ti/overlays/BBAI64-CSI1-imx219.dtbo \
-ti/overlays/BBAI64-DSI-RPi-7inch-panel.dtbo \
-ti/overlays/BBAI64-P8_37-ehrpwm5_a.dtbo \
-ti/overlays/BBAI64-P9_25-ehrpwm4_b.dtbo \
-ti/overlays/BB-I2C2-MPU6050.dtbo \
-ti/overlays/BBORG_LOAD-00A2.dtbo \
-ti/overlays/BBORG_RELAY-00A2.dtbo \
-ti/overlays/BBORG_SERVO-00A2.dtbo \
-ti/overlays/BONE-FAN.dtbo \
-ti/overlays/BONE-I2C1.dtbo \
-ti/overlays/BONE-I2C2.dtbo \
-ti/overlays/BONE-I2C3.dtbo \
-ti/overlays/BONE-LED_P8_03.dtbo \
-ti/overlays/BONE-LED_P9_11.dtbo \
-ti/overlays/BONE-PWM0.dtbo \
-ti/overlays/BONE-PWM1.dtbo \
-ti/overlays/BONE-PWM2.dtbo \
-ti/overlays/BONE-SPI0_0.dtbo \
-ti/overlays/BONE-SPI0_1.dtbo \
-ti/overlays/BONE-SPI1_0.dtbo \
-ti/overlays/BONE-UART1.dtbo \
-ti/overlays/BONE-USB0-host.dtbo \
-ti/overlays/J721E-PRU-UIO-00A0.dtbo \
-ti/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtbo \
-ti/overlays/robotics-cape.dtbo \
+ti/k3-fpdlink-imx390-rcm-0-0.dtbo \
+ti/k3-fpdlink-imx390-rcm-0-1.dtbo \
+ti/k3-fpdlink-imx390-rcm-0-2.dtbo \
+ti/k3-fpdlink-imx390-rcm-0-3.dtbo \
+ti/k3-fpdlink-imx390-rcm-1-0.dtbo \
+ti/k3-fpdlink-imx390-rcm-1-1.dtbo \
+ti/k3-fpdlink-imx390-rcm-1-2.dtbo \
+ti/k3-fpdlink-imx390-rcm-1-3.dtbo \
+ti/k3-fpdlink-ov2312-0-0.dtbo \
+ti/k3-fpdlink-ov2312-0-1.dtbo \
+ti/k3-fpdlink-ov2312-0-2.dtbo \
+ti/k3-fpdlink-ov2312-0-3.dtbo \
 "
 
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index f4c1775d..aab0f9b9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -21,10 +21,10 @@ SRCREV:armv7a = "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
 PV:armv7a = "5.10.168+git${SRCPV}"
 BRANCH:armv7a = "v5.10.168-ti-r70"
 
-# 5.10.162 version for 64-bit
-SRCREV:aarch64 = "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
-PV:aarch64 = "5.10.162+git${SRCPV}"
-BRANCH:aarch64 = "v5.10.162-ti-arm64-r99"
+# 6.1.46 version for 64-bit
+SRCREV:aarch64 = "0a1e93a38c699fdd3c629d57f5cd015f90ab0d36"
+PV:aarch64 = "6.1.46+git${SRCPV}"
+BRANCH:aarch64 = "v6.1.46-ti-arm64-r9"
 
 SRC_URI = " \
     git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
-- 
2.33.3


