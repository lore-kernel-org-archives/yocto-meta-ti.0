Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CF2CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 07:49:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3678.1761119333661490770
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 00:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UNnNyMqi;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59M7mpPF215349;
	Wed, 22 Oct 2025 02:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761119331; i=@ti.com;
	bh=kHz9Fw4odWL2+/SI6aC3/nLjKAmNeEv3c9xshfs5eYI=;
	h=From:To:Subject:Date;
	b=UNnNyMqiyo4t7KHZZ7VS2x5hyJaGO1l0ftR/zLuGposLrpAzUmpFVm4E8QQFvY4JJ
	 eCs2D3qYLiRJ0pODuyzeyzYkSCyqFn5ytfymgDl2eEaHBKqh16/Pp/rQTqzoCaOT1d
	 UsD1eZJqPn9/yjrDsWglLS0sk9fMqu9+m/Y0kon4=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59M7mp6X1850952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 02:48:51 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 02:48:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 02:48:51 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59M7mpE5858617;
	Wed, 22 Oct 2025 02:48:51 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 7DBB92A6C; Wed, 22 Oct 2025 02:48:51 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510220100
Date: Wed, 22 Oct 2025 02:48:51 -0500
Message-ID: <20251022074851.1115311-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Oct 2025 07:49:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19153

Updated the value(s) for:
  k3conf: SRCREV

Changelogs:
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=f63ccd27cba9550de04e8dbb04bc6003d8b5168e..4612157b45912dfc21ef49e364931c5ce3cb27a0

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index cafa467f..1a0880d0 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "f63ccd27cba9550de04e8dbb04bc6003d8b5168e"
+SRCREV = "4612157b45912dfc21ef49e364931c5ce3cb27a0"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
-- 
2.43.5


