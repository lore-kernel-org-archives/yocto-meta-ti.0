Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9325EC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:26:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13256.1672842371059251343
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 06:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=D1D0UBEY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304EQAcf004846
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:26:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672842370;
	bh=K6DPqb3GFPQA3CGiLWvi8ckHbMU3rIQoWeTIgldP5fg=;
	h=From:To:CC:Subject:Date;
	b=D1D0UBEYQP4/3jWQwOjN5d2I7W/jSq7d70NdTnh4i/NkKVNLaTura64z7D4tGkjUe
	 1raKA8wCLWKaLY/y98AaH3ZRcxQgNqbnfkdvIiBEbyA8ae8ETUzGRW61n7gDLzx+rU
	 VapV+iuUup5edETIL0uGqmnpBMirUKsQqkt7rmoU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304EQAuS022286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Jan 2023 08:26:10 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 08:26:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 08:26:10 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304EQ9ID113088;
	Wed, 4 Jan 2023 08:26:09 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <devarsht@ti.com>, <vigneshr@ti.com>
Subject: [meta-ti][dunfell][PATCH] ipc: ti-rpmsg-char: Update library to 0.5.2
Date: Wed, 4 Jan 2023 19:56:09 +0530
Message-ID: <20230104142609.26769-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 14:26:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15517

Update library to 0.5.2 as it adds support for AM62A
SoC.

Co-Authored-By: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index 0b35f412..2c6ab414 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.5.1 release
-SRCREV = "adb964ee72f99545e2ad55c50cfd14015a7d837e"
+# Initial 0.5.2 release
+SRCREV = "1da3e1bd0412c148ab57690940fea5d129220896"
 
-PV = "0.5.1+git${SRCPV}"
+PV = "0.5.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


