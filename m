Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F188C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:02:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1032.1750266149751877961
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 10:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hybZNp/1;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IH2QwD353485;
	Wed, 18 Jun 2025 12:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750266146;
	bh=oAAfwnNzIwenuTokzg+ReRpqjR2oHKj8I+kGUj5yr2E=;
	h=From:To:CC:Subject:Date;
	b=hybZNp/1kbgP5WpnLSxn1d/kFmWkErXcHBF0FafkF3p+me3qtJdinEPOyOSJGeVYD
	 UcdaB3PstXjLjPTX8f9cynutv9uSPCQDWka2Nh+MKjAnfwkCYyJnvsyyJVnh9CYRvn
	 hvHD6jxSPWEwfDTTiCMNmcxy8Rf4sq0TeFYRx48Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IH2Qgp3107503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 12:02:26 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 12:02:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 12:02:26 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IH2PIb4079838;
	Wed, 18 Jun 2025 12:02:26 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <afd@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH v3] recipes-bsp: Add TI TAD5212 DAC firmware recipe
Date: Wed, 18 Jun 2025 22:32:17 +0530
Message-ID: <20250618170217.2577275-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jun 2025 17:02:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18655

From: Vishnu Singh <v-singh1@ti.com>

Add TAD5212 DAC firmware images for am62dxx-evm to support two DAC
configurations:
- tad5212_01.bin: Configures 1 DAC with stereo channel in i2s mode.
- tad5212_04.bin: Configures 4 DAC with each having stereo channel
		  support in i2s mode.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/paresh-bhagat12/38ad3188e2da2546627341cd9416ccad

Change log:
V2 -> V3:
	- Removed redundant info in recipe(licesne and checksum)
	- Package firmware only for am62dxx-evm

V1 -> V2:
	- Updated names of firmware in recipe

 meta-ti-bsp/conf/machine/am62dxx-evm.conf       |  2 ++
 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb  | 17 +++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc     |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index 9fbbb90a..1e41c53c 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -14,3 +14,5 @@ KERNEL_DEVICETREE = ""
 FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
 
 UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-dac-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
new file mode 100644
index 00000000..8f68009d
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${TAD5212_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE = "am62dxx"
+
+TAD5212_1DEV = "tad5212_01.bin"
+TAD5212_4DEV = "tad5212_04.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware
+	install -m 0644 ${S}/ti/tad5212/${TAD5212_1DEV} ${D}${nonarch_base_libdir}/firmware/
+	install -m 0644 ${S}/ti/tad5212/${TAD5212_4DEV} ${D}${nonarch_base_libdir}/firmware/
+}
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d1dd9df3..08cd0b30 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,6 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.00.09"
 TI_SYSFW_VERSION = "11.01.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
+TAD5212_FW_VERSION = "1.0.0.0"
 
 TI_LINUX_FW_SRCREV ?= "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
-- 
2.34.1


