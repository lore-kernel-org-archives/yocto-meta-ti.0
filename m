Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CF4C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:06:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.40738.1681117614268531547
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 02:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nTTD45xQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33A96rj0044696
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 04:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681117613;
	bh=3ibMr4yn3rStzxQnpjiKSqaZO+J3CRjnRfEqS9+Pbe8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nTTD45xQFUHdX2s04onu1yzTBU8MMD2njLZcmyZYCC5TPWnrduFewS2J4W3K8PvkQ
	 wtpSxgR8hTuM8RbNSgfoF49S3r8BPT1Et7sZhcQnfcrxEdDRucJ3kWCbQVARqqREdy
	 7HzVCsaUMhMxeTWkKmgi+MO88DacMzwqbKbT4iCE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33A96rJ3032342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 04:06:53 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 04:06:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 04:06:53 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33A96lXn023313;
	Mon, 10 Apr 2023 04:06:52 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v2 2/2] meta-ti-bsp: conf: machine: j721s2: Update def config
Date: Mon, 10 Apr 2023 14:36:45 +0530
Message-ID: <20230410090645.335745-3-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410090645.335745-1-u-kumar1@ti.com>
References: <20230407115107.839204-1-u-kumar1@ti.com>
 <20230410090645.335745-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 09:06:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16335

u-boot 2023.04 merged def configs for HS and GP EVM into one.
This patch updates config for J721S2 HS EVM for both A72 and R5.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
index a4d51904..58cd92c4 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
@@ -8,4 +8,4 @@ SYSFW_SOC = "j721s2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-UBOOT_MACHINE = "j721s2_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 7ce5000a..7d2d6271 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -15,7 +15,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
-UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
+UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
-- 
2.34.1


