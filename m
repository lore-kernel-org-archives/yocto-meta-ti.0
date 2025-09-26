Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF814CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:02:56 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3074.1758913373291579565
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 12:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rpMk9Rg1;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QJ2pNB2175137;
	Fri, 26 Sep 2025 14:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758913371; i=@ti.com;
	bh=HbsVfYEtuP6ngS+jGre3itX61sXiY1dnCZ8zccbngTg=;
	h=From:To:Subject:Date;
	b=rpMk9Rg1sZSvHldZZcIFdQWvL55FpxbV4CE+4O/5WMH0UzXkd4KTSsd2zc0qSNKa3
	 tdOJaPwQM8tBrrzgolOq0MytpEuciW4Os70NDAVIMlsSrB0G68gpAK1Nr7A6z95QQ8
	 rDQu5gW1hzqe0veJ4IjwgG5hAEy4mohCTuLw4MAI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QJ2pp31174244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 26 Sep 2025 14:02:51 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 26
 Sep 2025 14:02:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 14:02:51 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QJ2php1773897;
	Fri, 26 Sep 2025 14:02:51 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0EAEE136626; Fri, 26 Sep 2025 14:02:51 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
Date: Fri, 26 Sep 2025 14:02:51 -0500
Message-ID: <20250926190251.1349034-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Sep 2025 19:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19066

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=91c8a62c788c2d0efb733296336bf0e658727faf..c779c758475cb98e95d3c05744e0dcbca5fc9991

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 4ab8827d..be42b27a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "91c8a62c788c2d0efb733296336bf0e658727faf"
+SRCREV_uboot = "c779c758475cb98e95d3c05744e0dcbca5fc9991"
-- 
2.43.5


