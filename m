Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63FDC001DD
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 18:44:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.41341.1688409847168982982
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Jul 2023 11:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FcOLfjiZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 363Ii5YK106653
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jul 2023 13:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688409845;
	bh=fmWVSg91hY1dxU2fOoepIgMa0cEqootkQkmQ05jqmwg=;
	h=From:To:CC:Subject:Date;
	b=FcOLfjiZ8EPazdM1aOoJfr1BqP5+oHRjvu0G6osSy6mQVENmzadx6ujh20gzsVzVx
	 +j/qnoxFGPZTlQxYO8i4ppdlyRdHRY0diYUvj/zI+phZwTKxWZwN82B9Wet23pg79b
	 6MOZrcvpjKbL0AsuVShDynf3YWHdwG6EJTmHp544=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 363Ii5sl130725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jul 2023 13:44:05 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jul 2023 13:44:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jul 2023 13:44:05 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 363Ii5nK063532;
	Mon, 3 Jul 2023 13:44:05 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Nick
 Saulnier <nsaulnier@ti.com>, Hari Nagalla <hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [kirkstone/master PATCH] pru-icss_git.bb: update to PSSP v6.2.0
Date: Mon, 3 Jul 2023 13:44:05 -0500
Message-ID: <20230703184405.2603-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Jul 2023 18:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16809

From: Praneeth Bajjuri <praneeth@ti.com>

Upgrade to v6.2.0 version.
This release supports Linux kernel 6.1.
The RPMsg library in previous versions of the PSSP will not work with
the PRU RPMsg drivers in Linux kernel 6.1.

Other changes in this version:
 * Bug fixes:
     - Getting Started Labs, fix "zero" command clearing too many bytes
     - Include files, add a missing parentheses to pru_cfg, pru_ctrl, pru_ecap
 * Update ReadMe files to point to the latest URLs

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index 3b0805d9..66fd8000 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
-SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
+SRCREV = "cde50f7d16f04ab8dc3510a3f22d3750b1037978"
 
-PV = "6.1.0"
-PR = "r0"
+PV = "6.2.0"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
2.17.1


