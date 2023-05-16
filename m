Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51C3C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:42:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.26957.1684255349174573172
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g7IC3Odm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgRvY075851;
	Tue, 16 May 2023 11:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255347;
	bh=sPAL/Z8utAdtKLZlEQeVGLSzd9rz4gV+ZkKSlaXSwuM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=g7IC3OdmIf2gY5JiPb8JQzP1him/xZ5I5vvobQbfe7y/mkCTp8CZ0zGAq4tTz55IY
	 4OXqEEZZ3A3ufOsR6QaqhfndFEKWvfpsCqRqz0wTIx4Ay+Rq5nR0lztcVNUKc3zCAS
	 UtWV+SUsShMHdF7gKkOs/0XhR4uWUs2+tqekfHHw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGgRWK087823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:42:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:42:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:42:25 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgPpb031081;
	Tue, 16 May 2023 11:42:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxkn-0003DQ-JJ; Tue, 16 May 2023 11:42:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 1/8] meta-ti-bsp: conf: machine: j7200: Update def config
Date: Tue, 16 May 2023 11:42:18 -0500
Message-ID: <20230516164225.12311-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164225.12311-1-reatmon@ti.com>
References: <20230516164225.12311-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 16:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16545

From: Udit Kumar <u-kumar1@ti.com>

u-boot 2023.04 merged def configs for HS and GP EVM into one.
This patch updates config for J7200 HS EVM for both A72 and R5.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
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
2.17.1


