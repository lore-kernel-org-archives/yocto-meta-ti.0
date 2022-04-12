Return-Path: <nsaulnier@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD74C38A2D
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.5819.1649727377246931345
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 18:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sefv68hj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nsaulnier@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C1aFkC108387
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Apr 2022 20:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649727375;
	bh=1TvVak0PkubpEI7O8DqWX1EbkiU2//HKrq4Iv5oT+bA=;
	h=From:To:CC:Subject:Date;
	b=sefv68hjPAYo0eouaMg2NU/GhCdRmvg3SHDapsxh6uBjjbIJ9pkR7T6WcX1qTfWvP
	 MzoXdjtn+P4Ojzx2yasZRFKndzKodxPR3Fg8a609luddLWLpoI8HMlrfVuyrWlsYMs
	 Tyxsy5SSpf9eqeVaRY6EL+O7FemDGPy3paSFYBZE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C1aFoU114021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Apr 2022 20:36:15 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Apr 2022 20:36:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Apr 2022 20:36:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C1aFZX056913;
	Mon, 11 Apr 2022 20:36:15 -0500
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <nsaulnier@ti.com>, <reatmon@ti.com>, <kishon@ti.com>, <s-anna@ti.com>
Subject: [meta-ti][master/dunfell PATCH v1 1/2] pru-icss_git.bb: update to
 PSSP v6.1.0
Date: Mon, 11 Apr 2022 20:35:58 -0500
Message-ID: <20220412013559.4140-1-nsaulnier@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14597

Update the SDK folder example-applications/pru-icss-x.x.x to install the latest
version of the PRU Software Support Package (PSSP).

This also uses PSSP v6.1.0 to generate the PRU Halt and RPMsg binaries in the
Linux SDK default filesystem image under /lib/firmware.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index bc085c24b5fb..ac75103d31d6 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "8eee431384b6a1a9c96ae91a8e99485176b4d2b3"
+SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
 
-PV = "6.0.1"
+PV = "6.1.0"
 PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
-- 
2.17.1


