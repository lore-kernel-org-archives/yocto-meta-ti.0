Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821DCC87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 08:05:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.46035.1754553908798056106
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Aug 2025 01:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OYMZPEFB;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577857lu313578;
	Thu, 7 Aug 2025 03:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754553907; i=@ti.com;
	bh=U6RiGSlJdsWEsWP/lz58G5h5AcHD/omuQOQwQ6Ty1Ro=;
	h=From:To:Subject:Date;
	b=OYMZPEFBc0s8qXnJHrlCbF25v5J2fKcpxMSAxcDFnMd935AsY07RFXO8pfp4H75uG
	 l9DMwpvaPgx55gqC62cRRrC+Y2SAnYDaiXwIKIfWMopFgOVnD8m7+P8bvU169cbCqR
	 kuuiBOw3vHC2L87cUSZlG0aZUtTukNsC7cQ3BYoc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 577857vI3730067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 03:05:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 03:05:07 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 03:05:07 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5778578g1438988;
	Thu, 7 Aug 2025 03:05:07 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id F2776E8044; Thu,  7 Aug 2025 03:05:06 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508070100
Date: Thu, 7 Aug 2025 03:05:06 -0500
Message-ID: <20250807080506.2249872-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Aug 2025 08:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18905

Updated the value(s) for:
  k3conf: SRCREV

Changelogs:
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=6034420195cf763c9470fb2113810695e5e37a23..2bcd5f52a88ef48f8bb5b7541cf05b10d2008cd7

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 62f3485b..4496413e 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "6034420195cf763c9470fb2113810695e5e37a23"
+SRCREV = "2bcd5f52a88ef48f8bb5b7541cf05b10d2008cd7"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
-- 
2.43.5


