Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E174AC7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 04:44:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1626.1685076290778291778
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 21:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EU1kDFvy;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: hnagalla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34Q4ioQG025691
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 23:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685076290;
	bh=9TtyFPGLgcx1g5WxF33lZZ1vIVEvkQMTqlTeOqWuu2c=;
	h=From:To:CC:Subject:Date;
	b=EU1kDFvya3ImsIk9Kbze94H27NTn5UtI2/CQe7nZTOJYHRQrutdCeot20+1H9jP6h
	 tPx0oHnT/cfCnZw6exxPfQK6FHezTgoyOj37phrx9U58kn8FAU/32CYBqWcS+mqSZn
	 rH7MaOs4JuEMR6h9l9JnRYTvo4mvzl6qhKQrIt8g=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34Q4io3r121360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 23:44:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 23:44:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 23:44:49 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34Q4inhB020164;
	Thu, 25 May 2023 23:44:49 -0500
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>
Subject: [kirkstone/master PATCH] ipc: ti-rpmsg-char: Update library to 0.6.1
Date: Thu, 25 May 2023 23:44:48 -0500
Message-ID: <20230526044448.20318-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 04:44:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16596

Update the ti-rpmsg-char library to 0.6.1 version to fix rpmsg_ctlr
id on v6.1 kernel when multiple channels are created.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index bff55258..84873923 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.0 release
-SRCREV = "600ec4dd56d73cc7ad62082c63244183b34f77a5"
+# 0.6.1 release
+SRCREV = "510e90d0a75bc21d79020669d2ea03f8222f3b8d"
 
-PV = "0.6.0+git${SRCPV}"
+PV = "0.6.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


