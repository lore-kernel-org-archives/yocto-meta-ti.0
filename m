Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89843C25B0D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2829.1659667777299957892
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kqpgtmhh;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752nabn017574;
	Thu, 4 Aug 2022 21:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667776;
	bh=czVNxQdvUYwOCs/EoZ1mIMbVVpAtUb3aKkSes74MWG0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KqpgtmhhSqQcL6MxBodreKAH/cA6/kliKVkPYHcoJEpRZwjp14QZhgbM1x7tCFP2J
	 dcu9qXLYq3IU5bmnhYRWJbwgh0vv4kQ0fpBIK5kW/79AjZpYluuCnCXoSaEOrn8suU
	 prBGcWn+YnMb2PtD86pLYc8eHRQQx6UdMRbJshkE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752naNx123441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:36 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYEQ111537;
	Thu, 4 Aug 2022 21:49:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 4/8] prueth-fw: Deploy for AM64xx based on
 SoC not EVM
Date: Thu, 4 Aug 2022 21:49:30 -0500
Message-ID: <20220805024934.23349-4-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805024934.23349-1-afd@ti.com>
References: <20220805024934.23349-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 02:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14929

This makes sense but looks like was done wrong to match AM65xx which
needed the exact EVM specified due to this only working on SR2.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index cf65e09a..e5446423 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
+COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 2ac6eac4..143e6545 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -35,7 +35,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-evm = " cadence-mhdp-fw"
-- 
2.36.1


