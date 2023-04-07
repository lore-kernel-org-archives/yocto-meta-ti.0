Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A46C76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:51:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5240.1680868281292554681
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 04:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kUBwDOxM;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: u-kumar1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 337BpK5o072547
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680868280;
	bh=I7uU1LnCjItBRDo91zptVrjIouPViqXaZXJvgS2a5+o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kUBwDOxMeBnyIMyObaFDqFNjQN5UGoi9oTP859r5ftNXZ9hNfQuJr3umqpfDKGsZX
	 Vz21hf8LsnNAXPo9Dw4u+uIM5MPBQTOzrRQs2PoJU65oE3czDbbhAApD1liWkx8WLX
	 9WGn7p5Yo47PcnrF9JJ92I3bhQj00CEJWHyZU1a0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 337BpJrT046151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:20 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 7
 Apr 2023 06:51:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 7 Apr 2023 06:51:20 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 337BpDVc035857;
	Fri, 7 Apr 2023 06:51:18 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH 2/4] meta-ti-bsp: conf: machine: j7200: Update def config
Date: Fri, 7 Apr 2023 17:21:05 +0530
Message-ID: <20230407115107.839204-3-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407115107.839204-1-u-kumar1@ti.com>
References: <20230407115107.839204-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 11:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16322

u-boot 2023.04 merged def configs for HS and GP EVM into one.
This patch updates config for J7200 HS EVM for both A72 and R5.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
index 3fe06e74..1922d5c8 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
@@ -8,4 +8,4 @@ SYSFW_SOC = "j7200_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-UBOOT_MACHINE = "j7200_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "j7200_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
index dc928974..4facbc37 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/j7200-evm.conf
 
-UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
+UBOOT_MACHINE = "j7200_evm_a72_defconfig"
 
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
-- 
2.34.1


