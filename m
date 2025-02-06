Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBDCC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:40:45 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.42562.1738852838868579724
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 06:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PDMAyR6h;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516EeaaO3567997
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Feb 2025 08:40:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738852836;
	bh=99nDSUBC6c7rcOw7uin3TBXielRzj4QB0bxXCOyLRFc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PDMAyR6hz+apu6PdwqtFrcpSaKD4EeqVondTCraNFDcD4p/8qs3AfSqC/PFyCeAAu
	 V/B83nv047ieFYTLBoSFvjUYz9k992jcUNaTcMehQSbxI1kye5eJ5+6Hr0XF7qXSLV
	 qZ1iAPKJF5KVs3U70d6d4vIWzOOqW+PhpOLyFtlk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Eea7S041335;
	Thu, 6 Feb 2025 08:40:36 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:40:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:40:36 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516EeZIl081731;
	Thu, 6 Feb 2025 08:40:35 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v3 1/5] recipes-security: optee: Update to v4.5.0+
Date: Thu, 6 Feb 2025 20:10:17 +0530
Message-ID: <20250206144021.3007831-2-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206144021.3007831-1-c-shilwant@ti.com>
References: <20250206144021.3007831-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 14:40:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18281

Bump up SRCREV of optee-os to ef1ebdc23034a804a72da2207f1a825ce96a1464

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 0fab9c9a..89f7f818 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.4.0+git"
-SRCREV = "8f645256efc0dc66bd5c118778b0b50c44469ae1"
+PV = "4.5.0+git"
+SRCREV = "ef1ebdc23034a804a72da2207f1a825ce96a1464"
 
 SRC_URI:remove = " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
-- 
2.34.1


