Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4A0C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 08:01:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.19289.1704441709539611139
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 00:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rRxacaFc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40581m8h051801
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:01:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704441708;
	bh=d1RmcAozEcr8G72NMY2lTh6hKes5peS+ZqsY4fH7Fdk=;
	h=From:To:CC:Subject:Date;
	b=rRxacaFcQq2jO0BvTjTtsh2mG4980TbRtIvPMSYtN1vzGEUp7R4du8NvNI3sqQakA
	 u8hfZxm/P+lm3e/wkOk22DKf5vQlWNS/25jbsm9o0+++rciHAcDYGDNNd6Q6VLYb6A
	 uWypKeg7Po2JzlCD5qveKxeHCCN5NFDIi8ZCtGIg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40581meU035523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 02:01:48 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 02:01:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 02:01:48 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40581k0O083309;
	Fri, 5 Jan 2024 02:01:47 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <a-nandan@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ipc: ti-rpmsg-char: Update library to 0.6.4
Date: Fri, 5 Jan 2024 13:31:43 +0530
Message-ID: <20240105080143.876480-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jan 2024 08:01:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17377

From: Apurva Nandan <a-nandan@ti.com>

Fetch from the latest commit which has J722S support now.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 729cc437..78782e6a 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.3 release
-SRCREV = "369ed24324c28c683d52637bb0cc7784b74c1385"
+# 0.6.4 release
+SRCREV = "439a13cf24662224d5dfa672c6a50d7c43899886"
 
-PV = "0.6.3+git${SRCPV}"
+PV = "0.6.4+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


