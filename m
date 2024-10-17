Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CF3D3C527
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 17:28:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3744.1729186091634392568
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 10:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c7OmzF+d;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49HHS8p5128553;
	Thu, 17 Oct 2024 12:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729186088;
	bh=Q0RF+obFAg5XVRtDzyvo7QSPkjdGVm9UHHM6nb7IJCU=;
	h=From:To:CC:Subject:Date;
	b=c7OmzF+dNzxi1COXRvsm4lHy9cMnyUYhMqfjce685FcjSrcaYzZgea0QVnjrnm/AW
	 sMuA9Vcezt+TCXo8RTz0ZySRawAPXZkLP5epwm2t9m8SIpmEUQr7l5a2iblnjIWyCP
	 X2U5cEcVpD+1NOYUz88th1zkVdVQ9kBV6aawAc0Y=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49HHS8pl008366
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Oct 2024 12:28:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Oct 2024 12:28:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Oct 2024 12:28:07 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49HHS7wq060347;
	Thu, 17 Oct 2024 12:28:07 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Nishanth
	<nm@ti.com>, Dhruva <d-gole@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Add support for bsp-ti-6_12 in beagleplay
Date: Thu, 17 Oct 2024 22:57:46 +0530
Message-ID: <20241017172746.3862000-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 17:28:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18011

Add bsp-ti-6_12 overrides in A53 & R5 machine configuration
to ensure it picks the appropriate u-boot configs for beagleplay

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 1 +
 meta-ti-bsp/conf/machine/beagleplay.conf      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
index 338a6fbf..3844ccfa 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -10,6 +10,7 @@ SYSFW_SUFFIX = "gp"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_r5_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_r5.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index c5ce3902..051c7bd1 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -21,6 +21,7 @@ OPTEEMACHINE = "k3-am62x"
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_a53_defconfig"
+UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_a53_defconfig"
 
 UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_a53.config"
-- 
2.34.1


