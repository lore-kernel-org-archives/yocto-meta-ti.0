Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62ACC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 10:01:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3661.1750240912583801402
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 03:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S3qmo+r4;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IA1n7f280677;
	Wed, 18 Jun 2025 05:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750240909;
	bh=iNSVgAyq1VjOWA6nRhXD41G70sa/jGzzpITxZYmvff8=;
	h=From:To:CC:Subject:Date;
	b=S3qmo+r48kdSZfEjVJlV+UEaL+ZT9U60+kRZqg8m1SOET/cImwfiuj9QaZyXqpiX9
	 F69vuHBVdNb+HaAzoVFgKd3lMYvS7sn0jGiAVEOCAtKNggATL0UV39BnUO6qrCE3ME
	 TWiQrGE/YVTgS+QHdKvRP0xXpi5Uv/3tDw3QqolY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IA1nLa3825305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 05:01:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 05:01:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 05:01:48 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IA1maS3516109;
	Wed, 18 Jun 2025 05:01:48 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <afd@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH v2] recipes-bsp: Add TI TAD5212 DAC firmware recipe
Date: Wed, 18 Jun 2025 15:31:43 +0530
Message-ID: <20250618100143.1955550-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jun 2025 10:01:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18650

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
V1 -> V2:
	- Updated names of firmware in recipe

 meta-ti-bsp/conf/machine/include/am62dxx.inc  |  2 ++
 .../recipes-bsp/ti-dac-fw/ti-dac-fw.bb        | 20 +++++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 3 files changed, 23 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb

diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
index ac4e8e17..3c60acb1 100644
--- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
@@ -13,3 +13,5 @@ IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-dac-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
new file mode 100644
index 00000000..68b17aad
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
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


