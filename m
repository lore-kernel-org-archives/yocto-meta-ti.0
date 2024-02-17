Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA40C48BC3
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 07:53:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6201.1708156382403966711
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Feb 2024 23:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=re1wJxGS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41H7qwoF085874;
	Sat, 17 Feb 2024 01:52:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708156378;
	bh=NCZn380Pz/w+anfhNzg5epIfSsrE1aeR2yZygSdPJC0=;
	h=From:To:CC:Subject:Date;
	b=re1wJxGSBBtMu9VqpXxd4iNv9+sQrAExAlpWBIZiZUiMdWEQi0zpMY+eOjhoZ2JCd
	 9GQgWNuUcv+aI7tV1WwcfEopYxWMIaC/JvRAWXdLU8DnAGitGWtwY3gsQeXzlD+WC8
	 WhZPwkhzlCelREiLPhEd+OND1hDAlk2igGZPhwJg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41H7qvma116837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Feb 2024 01:52:57 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 17
 Feb 2024 01:52:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 17 Feb 2024 01:52:57 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41H7qvDS005157;
	Sat, 17 Feb 2024 01:52:57 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Denys <denis@denix.org>, Gyan Gupta <g-gupta@ti.com>,
        Khasim <khasim@ti.com>
Subject: [meta-ti][kirkstone/master][PATCH] conf: beaglebone-ai64: Apply U-boot defconfig fragments
Date: Sat, 17 Feb 2024 13:22:49 +0530
Message-ID: <20240217075249.3183025-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 Feb 2024 07:53:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17487

- Apply j721e_beagleboneai64_a72.config which is maintained in U-boot tree & is intended
to be applied on top of j721e_evm_a72_defconfig [1].

- Apply j721e_beagleboneai64_r5.config which is maintained in U-boot tree & is intended
to be applied on top of j721e_evm_r5_defconfig [2].

References
----------

[1] https://github.com/beagleboard/u-boot/blob/v2023.04-ti-09.01.00.008-BeaglePlay/configs/j721e_beagleboneai64_a72.config

[2] https://github.com/beagleboard/u-boot/blob/v2023.04-ti-09.01.00.008-BeaglePlay/configs/j721e_beagleboneai64_r5.config

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf | 6 ++++++
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf      | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
index b893f380..f57ae065 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
@@ -15,3 +15,9 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
+
+
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+UBOOT_CONFIG_FRAGMENTS = "j721e_beagleboneai64_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index 31fb4ac4..a19a3e29 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -6,6 +6,12 @@ require conf/machine/include/j721e.inc
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
 
+
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+UBOOT_CONFIG_FRAGMENTS = "j721e_beagleboneai64_a72.config"
+
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
 
 KERNEL_DEVICETREE = " \
-- 
2.34.1


