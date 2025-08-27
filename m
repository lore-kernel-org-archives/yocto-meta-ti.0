Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7AECA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 20:00:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.4599.1756324833940057778
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Aug 2025 13:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hiDtnuke;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RK0WdF1844542;
	Wed, 27 Aug 2025 15:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756324832; i=@ti.com;
	bh=62fQ2c2j3Gf9y/dvZ0eCFE3G6bo20QRPikZlxvk410U=;
	h=From:To:Subject:Date;
	b=hiDtnuke5y+x8KYewTSXgjSxptqv+eASfRI17RBx+KWlBDMcNDSTLG8HRLfd7aRS6
	 PHp18Jcq4VfbqDScWkKHAhmz5OlIKWCVuDwuMGb1HXi07xNt+1WbxMhknD4ShPzJtm
	 NruM6V8/cv36myXaY6Kjmni9NhgCbopLyREmtgCA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RK0WBJ2695727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 27 Aug 2025 15:00:32 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 15:00:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 15:00:32 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RK0WAl3616722;
	Wed, 27 Aug 2025 15:00:32 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 043AF2A43; Wed, 27 Aug 2025 15:00:32 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508271122
Date: Wed, 27 Aug 2025 15:00:31 -0500
Message-ID: <20250827200031.3477210-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Aug 2025 20:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18973

Updated the value(s) for:
  k3conf: SRCREV

Changelogs:
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=6700e5a7f417c1bb19daf2422b880a82b7315543..3de294db4f2cd75404f358768f4be8f8fa3132d7

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 848977b9..cf96dd2e 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "6700e5a7f417c1bb19daf2422b880a82b7315543"
+SRCREV = "3de294db4f2cd75404f358768f4be8f8fa3132d7"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
-- 
2.43.5


