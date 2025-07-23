Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC55C87FC5
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 21:16:21 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1610.1753305375781779292
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 14:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hWWdUIVj;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NLGEc51823583;
	Wed, 23 Jul 2025 16:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753305374;
	bh=Qv+xgChHPRsxz0ZnIbf+tTAuf1qh+Xjw2Y+gDNdmIRY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hWWdUIVjMRLJBTXpJM99tNowup0mWQsTmbqKgSjQ/+par5+vJDNNbKJzkxRN4/SOt
	 847qJWKkT153NomygyxNnArYNt6nvopenTc4r00eXoByPJ5+wlp2rqtUPsHndlO23j
	 KM+28pG4GaOB4JZOBGomnKHUgOYljhFGURpY6DJ0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NLGEm12630127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 16:16:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 16:16:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 16:16:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NLGEds3300614;
	Wed, 23 Jul 2025 16:16:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uegow-0004DZ-61; Wed, 23 Jul 2025 16:16:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 3/3] check_yocto_rules: Add new rule for recent change
Date: Wed, 23 Jul 2025 16:16:13 -0500
Message-ID: <20250723211613.16164-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250723211613.16164-1-reatmon@ti.com>
References: <20250723211613.16164-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 21:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18814

- The UBOOT_VERSION bbappend does not need a guard since we are
modifying our own layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 7e8eb211..6d33c0aa 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -17,7 +17,8 @@
         "skip_files" : [
             "meta-ti-bsp/recipes-core/udev/eudev_%.bbappend",
             "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bbappend",
-            "meta-ti-bsp/recipes-security/optee/optee-%.bbappend"
+            "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
+            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend"
         ]
     },
     "GUARD-2" : {
-- 
2.17.1


