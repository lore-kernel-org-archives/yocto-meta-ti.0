Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C25C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 09:06:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11923.1710320787266636659
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 02:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dQL0DYto;
 spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42D96Pkg081541;
	Wed, 13 Mar 2024 04:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710320785; i=@ti.com;
	bh=G0+6JRnbS7lfOBuGdKO6pM7fOqXMuu45dfRoX/Ct5uU=;
	h=From:To:Subject:Date;
	b=dQL0DYto3Ua6U9mG2WSz1x5laqvRo3af5rC6punbPvryWinwZSMwAG6ZEXeQMGZaw
	 36mcbAxKwjgvahOm1Mszrdnwd+uVyhigCtw7EuGIfh72d/AI2GBwv3aa0ezMyRq0/m
	 LXSIH8vv4Qt+tFqyfjtKpEG+zqXieMkmQVNpQaDo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42D96P2a052744
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Mar 2024 04:06:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Mar 2024 04:06:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Mar 2024 04:06:25 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.248.130.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42D96P7K012726;
	Wed, 13 Mar 2024 04:06:25 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 335D210F58E5; Wed, 13 Mar 2024 04:06:25 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202403130100
Date: Wed, 13 Mar 2024 04:06:25 -0500
Message-ID: <1710320785-54807-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Mar 2024 09:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17523

Updated the value(s) for:
  u-boot-ti-staging_2024.04: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index b9e8295..0218cd3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -8,4 +8,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV = "d49fa3defa50c6d3f04acbb52fd486c13c14ab6a"
+SRCREV = "f3c979dd0053c082d2df170446923e7ce5edbc2d"
-- 
1.8.3.1


