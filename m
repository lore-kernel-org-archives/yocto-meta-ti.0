Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF923C64ED8
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:10 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13580.1650490504989958667
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 14:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wPx1uaog;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23KLYw1c032704;
	Wed, 20 Apr 2022 16:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650490498;
	bh=Ffd1dcmty1N2ubWkoQ7JocEnGekE2vhZHh3PEeaQG4g=;
	h=From:To:CC:Subject:Date;
	b=wPx1uaogdZiKVhLeK9+h7XVX2TwNhDlB7pBosSlkEabzo6t4K8I8ATv96olufRVU+
	 qJS90eaZ/wehkSyv3OSM6xznCG9VNsepok572IczOYc64bulk3Bgy2AJadhh6y/pzP
	 X1UdijHHNNVbCgFilNWnq9PAnqqsQBMQUIqOT9DI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23KLYwjk060388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Apr 2022 16:34:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Apr 2022 16:34:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Apr 2022 16:34:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23KLYwWL013228;
	Wed, 20 Apr 2022 16:34:58 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>, Hari Nagalla <hnagalla@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ipc: ti-rpmsg-char: Update library to 0.4.1
Date: Wed, 20 Apr 2022 16:34:58 -0500
Message-ID: <20220420213458.4270-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14610

Update the ti-rpmsg-char library to 0.4.1 version that enables the
support for AM62x SoC family remote processors.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index dc98fbb5..b499647a 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.4.0 release
-SRCREV = "92b464f1e7477f77e44ae18d87b3d369576d662e"
+# Initial 0.4.1 release
+SRCREV = "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
 
-PV = "0.4.0+git${SRCPV}"
+PV = "0.4.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


