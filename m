Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9742C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 17:23:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2693.1708104216698089056
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Feb 2024 09:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GmLNaoTH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41GHNXw8020386;
	Fri, 16 Feb 2024 11:23:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708104213;
	bh=TG7GmphKhAa5TLhs6FZRWKwdK6JZrScQKya8t/W+nl4=;
	h=From:To:CC:Subject:Date;
	b=GmLNaoTHLCDRYnzOpavDaYmij9CghlYGur4PEB1vtmJ7JD3oU9RRqPvvLxAPcB9/Y
	 9Hpc3pZoAAAOzXnCClrxB/Ymzp02/O+UXJgoYNEq8B0PsRNTQ+czvFKEFp7pGG689i
	 oyNLVwsdfftG1SFhpe6Oep7P6KghkLrxomcUavTQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41GHNXx2008023
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 11:23:33 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 11:23:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 11:23:33 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41GHNWLv085245;
	Fri, 16 Feb 2024 11:23:32 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Denys <denis@denix.org>, Gyan Gupta <g-gupta@ti.com>,
        Khasim <khasim@ti.com>
Subject: [meta-ti][kirkstone/master][PATCH] conf: beagleplay: Apply U-boot defconfig fragments
Date: Fri, 16 Feb 2024 22:53:24 +0530
Message-ID: <20240216172324.2555581-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Feb 2024 17:23:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17485

- Apply am625_beagleplay_a53.config which is maintained in U-boot tree & is intended
to be applied on top of am62x_evm_a53_defconfig [1].

- Apply am625_beagleplay_r5.config which is maintained in U-boot tree & is intended
to be applied on top of am62x_evm_r5_defconfig [2].

References
----------

[1] https://github.com/beagleboard/u-boot/blob/v2023.04-ti-09.01.00.008-BeaglePlay/configs/am625_beagleplay_a53.config

[2] https://github.com/beagleboard/u-boot/blob/v2023.04-ti-09.01.00.008-BeaglePlay/configs/am625_beagleplay_r5.config

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 5 +++++
 meta-ti-bsp/conf/machine/beagleplay.conf      | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
index c40615c9..601cbbf7 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -12,3 +12,8 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index dc6947d1..9ea7ff75 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -20,6 +20,11 @@ OPTEEMACHINE = "k3-am62x"
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
+
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
 PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
-- 
2.34.1


