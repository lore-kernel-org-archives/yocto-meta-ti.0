Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D03CEEEC08
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 03:28:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.65488.1726198085605420967
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 20:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q1thVtp2;
 spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48D3S3RH082609;
	Thu, 12 Sep 2024 22:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726198083; i=@ti.com;
	bh=8aNAUk4cJTnaUQr/PZ3KbGxc8C75MCo3W6QbwoasO98=;
	h=From:To:Subject:Date;
	b=Q1thVtp2OLLyfxlKKUDp0Z5knzMZG/sqomGMbNw3ygkTA9rUkwWAsX8+F1eVxjs18
	 j8oDRDzxboM3n7xrvp35VBk5joMUrvLdYFfCK/MEAkdTSGLJ4snbxbCKs4FFak04xE
	 t0LldZuC6R85VaM1BR/Nj/6bwg0RlhKTKQ2JJKpQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48D3S3oW030418
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Sep 2024 22:28:03 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Sep 2024 22:28:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Sep 2024 22:28:03 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.248.130.114])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D3S3pa004217;
	Thu, 12 Sep 2024 22:28:03 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 6071D1133CED; Thu, 12 Sep 2024 22:28:03 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202409121457
Date: Thu, 12 Sep 2024 22:28:03 -0500
Message-ID: <1726198083-100326-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Sep 2024 03:28:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17964

Updated the value(s) for:
  k3conf: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 76088ea..ce8f98b 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV = "0.3+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "85a7433202aafafbccea8a7b2491f4df8b1ecd80"
+SRCREV = "30a1d5b2d08c0da39d4e62b3ebee591a9882fa21"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
-- 
1.8.3.1


