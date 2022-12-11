Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D36AC4167B
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 02:55:30 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9495.1670727323415387623
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 10 Dec 2022 18:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: list.ti.com, ip: 198.47.19.141, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BB2tKMI063701;
	Sat, 10 Dec 2022 20:55:20 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BB2tKep024690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 10 Dec 2022 20:55:20 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 10
 Dec 2022 20:55:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 10 Dec 2022 20:55:20 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BB2tKNx112505;
	Sat, 10 Dec 2022 20:55:20 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 361E6112303D; Sat, 10 Dec 2022 20:55:20 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/2] linux-ti-staging-rt: CI/CD Auto-Merger: cicd.2022.12.10.19:06:00
Date: Sat, 10 Dec 2022 20:55:19 -0600
Message-ID: <1670727320-25630-2-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670727320-25630-1-git-send-email-lcpdbld@list.ti.com>
References: <1670727320-25630-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 11 Dec 2022 02:55:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15444

Updated the value(s) for:
  PV
  SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 88a02e3..375d70e 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "2163f054a20370d67304bc6cd4cade1cf50b0e97"
-PV = "5.10.153+git${SRCPV}"
+SRCREV = "55e4ea52395cfe3b57cbf648da59d76e9c659718"
+PV = "5.10.158+git${SRCPV}"
-- 
1.8.3.1


