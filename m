Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDA2C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 05:26:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6289.1666243571265626321
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 22:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=shjfDKn/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29K5QA5H112661
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666243570;
	bh=20egJpBGkBKveaVxn4yPTMr552VOsMIsnR5R28IoZiw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=shjfDKn/HmmAuAvndK1CV1sVsJQpsU7kfMxHNNYsjpUm2VoGbPgdAPtnrDBpDOhYG
	 JG8KBkkL3lIvrzrtCtCLDS2Qm5CnTHNbAi8FQ5HAd2vpj/SoV3R+SKC2FdJzfg5HWa
	 9+ptaWMdh9O4MjqLdKZLxghs/mYF3cSzMwhOO+cU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29K5QAx3056464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:26:10 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 20
 Oct 2022 00:26:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 20 Oct 2022 00:26:10 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29K5PuF1120845;
	Thu, 20 Oct 2022 00:26:08 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][RFC dunfell][PATCH v3 6/6] cadence-mhdp-fw: add compatible for j784s4-hs-evm
Date: Thu, 20 Oct 2022 10:55:55 +0530
Message-ID: <20221020052555.1895586-7-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020052555.1895586-1-m-chawdhry@ti.com>
References: <20221020052555.1895586-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Oct 2022 05:26:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15190

Add the HS platform to the compatible list in the recipe.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 57780cb2..ce1add35 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 0a61c408..08f3f462 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -43,6 +43,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-hs-evm = " cadence-mhdp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cadence-mhdp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cadence-mhdp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-hs-evm = " cadence-mhdp-fw"
 
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
-- 
2.34.1


