Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D38C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:27:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16986.1693409231553469176
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 08:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MBs3jAR2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37UFRA80068750;
	Wed, 30 Aug 2023 10:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693409230;
	bh=Sc02N9Ndl3B1ZhVhy92jnJaJMVPeMBhjMbFQjKlkSI0=;
	h=From:To:Subject:Date;
	b=MBs3jAR2WaqlHRwjeIW8h6aZxVNiXptEnDeAJSDti9Dr3+ZJOZ8HgUCrHKbdChB7R
	 EW9rIMRGB9ztFAC9XL60+ri4HI12GSPUDzpVY8Nnn3CG3cN/YWJKM1YiIFtDpLZVcM
	 yhNxwaMzpwM9hmkCCQeMkebiMICMKMgFsDGYWMGA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37UFRARl101416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Aug 2023 10:27:10 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Aug 2023 10:27:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Aug 2023 10:27:09 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37UFR9HR027074;
	Wed, 30 Aug 2023 10:27:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qbN65-0005mD-KA; Wed, 30 Aug 2023 10:27:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] conf/am65xx-hs-evm: Fix UBOOT_MACHINE to match u-boot config
Date: Wed, 30 Aug 2023 10:27:09 -0500
Message-ID: <20230830152709.20767-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Aug 2023 15:27:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16907

The uboot config for am65 is moving to a merged build for both GP and
HS.  Until the yocto configs catch up, we need to keep am65xx-hs-evm
working.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
index 4fb2bf50..337c8413 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -8,4 +8,4 @@ SYSFW_SOC = "am65x_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
index 0addec90..f8221f31 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -4,4 +4,4 @@
 
 require conf/machine/include/am65xx.inc
 
-UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
+UBOOT_MACHINE = "am65x_evm_a53_defconfig"
-- 
2.17.1


