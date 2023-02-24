Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAAAC7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 18:13:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25711.1677262399724149106
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 10:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yaDMjaQq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31OIDGMX094532;
	Fri, 24 Feb 2023 12:13:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677262396;
	bh=rMxfCfYdip41ytctzaj4zFBtkrBZoitWaYR1Wpqi6AA=;
	h=From:To:Subject:Date;
	b=yaDMjaQqsyt4ootHYYsYRs+ZM2qBLTz65GMqb+w0R14OvzxGP0hTw8psOO3uOejHg
	 2r3twRaqQHnyogIluhFHbyNQcWiVgIDBOh/DyG/gqXLx+ikc+F5BVh4EZU+BHmTTHT
	 z8THJMsLPCwBVC4uy2vEUrdn75YXiY28Wi3uS6iQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31OIDGQu007179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Feb 2023 12:13:16 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 24
 Feb 2023 12:13:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 24 Feb 2023 12:13:15 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31OIDFBw028191;
	Fri, 24 Feb 2023 12:13:15 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pVcZH-0007AN-Me; Fri, 24 Feb 2023 12:13:15 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] Revert "ti-k3-secdev: CI/CD Auto-Merger: cicd.dunfell.202302231358"
Date: Fri, 24 Feb 2023 12:13:15 -0600
Message-ID: <20230224181315.27508-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 18:13:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15954

This reverts commit 7f773f3b5bef5ec20c1a0b43a5b9eeaf3eb00702.

An error in our CICD script picked an invalid hash.  Rollback to the
previous SRCREV.
---
 recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
index d36f344b..7196be97 100644
--- a/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE_class-nativesdk = "(.*)"
 GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
 GIT_PROTOCOL = "https"
 GIT_BRANCH = "master"
-GIT_SRCREV = "d14fbab5ccb21ffeb010ce57792c56a1308ed314"
+GIT_SRCREV = "eb2c4d734487e5095b94cef3fd7213ee71d9e016"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
 SRCREV = "${GIT_SRCREV}"
-- 
2.17.1


