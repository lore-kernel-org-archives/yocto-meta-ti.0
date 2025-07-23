Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5889FC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 20:36:11 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.622.1753302963012959909
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 13:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XsV9xgjf;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: hnagalla@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NKa2P61345017
	for <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 15:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753302962;
	bh=PxTqb4pE+GxiyB/0E33n6yhY0GxwmtxswScrrDr7b2A=;
	h=From:To:CC:Subject:Date;
	b=XsV9xgjfPgDU+CCnn9IDha7uNMyFnorZfeAXABbIRc34fozCMeLzemCRZYlT6AgMj
	 YFUlkgfWRLJskG/vN99ychjIt+R3sWdwWnQlZCtQZIwKGkP6HwZhqKH3X2RqPlDrKA
	 K9mNd1ab/COpaw8M4SCiYj0dvG7B9AUSR9B3opPM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NKa25c2607951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 15:36:02 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 15:36:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 15:36:01 -0500
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NKa1sj3261295;
	Wed, 23 Jul 2025 15:36:01 -0500
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <nsaulnier@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [master/scarthgap] pru-icss_git.bb: update to PSSP v6.5.0
Date: Wed, 23 Jul 2025 15:35:57 -0500
Message-ID: <20250723203557.30808-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 20:36:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18813

update to PSSP release v6.5.0. This release is compatible to linux
v6.12 and other fixes for RP message size.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index 73b582a2..84d00eed 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
-SRCREV = "00a5efa5157feb84cb2e4bf50b481f7082acca82"
+SRCREV = "5584926fa3721274e61c5473593cfb7f9f4284d4"
 
-PV = "6.3.0"
+PV = "6.5.0"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
2.34.1


