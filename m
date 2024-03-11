Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4752C54E5D
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 20:46:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4270.1710189959459985347
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 13:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sNGe2Vsy;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BKjxj0129670
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 15:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710189959;
	bh=kKFZu1Eiwsx5KPJdsxd6TWJZeE46VYRumlwZouETwek=;
	h=From:To:CC:Subject:Date;
	b=sNGe2VsyyEag/B4XcGrf4cKK6deRm7Ql1dzSSXetoweHhKU7RiflZMktgpE/IMA5x
	 3XTBDt8homYzKE6sJC5Nub9cifU49LYltoY3ThXapQZya/uUAqKROjMnR47Wvj6gsN
	 /u8wn1akXmolww7VTFYe5mX7abLjb5mdskTaa++A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BKjwCa035495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 15:45:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 15:45:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 15:45:58 -0500
Received: from localhost (praneethhome.dhcp.ti.com [128.247.81.61])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BKjwIB101670;
	Mon, 11 Mar 2024 15:45:58 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Apurva Nandan <a-nandan@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [master][PATCH] ipc: ti-rpmsg-char: Update library to 0.6.6
Date: Mon, 11 Mar 2024 15:45:58 -0500
Message-ID: <20240311204558.17473-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 20:46:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17510

From: Praneeth Bajjuri <praneeth@ti.com>

update from 0.6.4 to 0.6.6.
This update brings the following fixes from ti-rpmsg-char repo.

55a6f40 remove ti.ipc4.ping-pong reference
8892e57 lib: fix data type build warnings
7c2ab48 lib: fix build warnings

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index d9f101b1..4710be09 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.4 release
-SRCREV = "439a13cf24662224d5dfa672c6a50d7c43899886"
+# 0.6.6 release
+SRCREV = "55a6f4032246631a309f8608af5e822024664b59"
 
-PV = "0.6.4+git"
+PV = "0.6.6+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


