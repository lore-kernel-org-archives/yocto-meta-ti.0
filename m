Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064BCEDEC5C
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:18:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.13133.1694614681189140734
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 07:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KDFs5IUK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: hnagalla@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38DEHxmB078051
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 09:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694614680;
	bh=YGY1l9BTClK6GmNFL1ux17c7XlRV+/dVJZca07Icz8k=;
	h=From:To:CC:Subject:Date;
	b=KDFs5IUKdDRJ1NAHp9EBH2s1HzPE/AyI0PfTmCUAe5Co4G4v9A+OxuBSs51eDf+ng
	 7fvnm4IXHhaG7rlLlZw/IaIa+D2tQwjeodJRx21yqIQRYmWlqv1VLpzaTsEDei5kwP
	 uq8fXX/AzF4eO7061nM6TcES5y9xYEDHFsa8ztKM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38DEHxji073765
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 09:17:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Sep 2023 09:17:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Sep 2023 09:17:59 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38DEHxUb018180;
	Wed, 13 Sep 2023 09:17:59 -0500
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>
Subject: [kirkstone/master PATCH] ipc: ti-rpmsg-char: Update library to 0.6.3
Date: Wed, 13 Sep 2023 09:17:57 -0500
Message-ID: <20230913141757.22981-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 14:18:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16962

Update library to 0.6.3 as it adds support for AM62P
SoC.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index b9983644..729cc437 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.2 release
-SRCREV = "6e2e829f8810708638597d49a3a7c1f2eac28ba2"
+# 0.6.3 release
+SRCREV = "369ed24324c28c683d52637bb0cc7784b74c1385"
 
-PV = "0.6.2+git${SRCPV}"
+PV = "0.6.3+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


