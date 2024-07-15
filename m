Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A77C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 23:57:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1037.1721087845253659846
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 16:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F8WiSYiB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FNvOqW075987
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Jul 2024 18:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721087844;
	bh=zgpzr32M2us6Av4emYA3yobF6rKkIEQ8GSLe8NkZcEA=;
	h=From:To:CC:Subject:Date;
	b=F8WiSYiBv2NmIn4GHANsb9aRxZPNdUqBlZDm1mLjcCEmzkYub7GcBXIh4N1iGctQ+
	 CAHt8+gzjPC9lDmq85aBI6MpChQpYvLahiecslKTm+J2BYMq2Vhh81NAOV5Osro2H/
	 SN8mwfopjMQZPfTcwZcnSYjSlIuFHT9tSgTKMy/k=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FNvOD4102594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Jul 2024 18:57:24 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 18:57:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 18:57:24 -0500
Received: from localhost (praneethhome.dhcp.ti.com [128.247.81.61])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FNvOFq113296;
	Mon, 15 Jul 2024 18:57:24 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Hari Nagalla <hnagalla@ti.com>,
        Nick
 Saulnier <nsaulnier@ti.com>
Subject: [scarthgap PATCH] ipc: ti-rpmsg-char: Update library to 0.6.7
Date: Mon, 15 Jul 2024 18:57:24 -0500
Message-ID: <20240715235724.28197-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Jul 2024 23:57:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17864

From: Praneeth Bajjuri <praneeth@ti.com>

update from 0.6.6 to 0.6.7.
This update brings the following fixes from ti-rpmsg-char repo.

5100a2e lib: Fix truncation warnings
15011fe example: Add roundtrip delay metering
aac39ae lib: fix truncation warnings with spritnf
4b9fd76 include: rproc_id: Add numbered enum

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 4710be09..22d03d97 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.6 release
-SRCREV = "55a6f4032246631a309f8608af5e822024664b59"
+# 0.6.7 release
+SRCREV = "5100a2e4a4a951e40ea0708fa78960770ec0ac33"
 
-PV = "0.6.6+git"
+PV = "0.6.7+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


