Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09572EB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 13:21:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.32434.1688390494069928023
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Jul 2023 06:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vYWDX8aj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: hnagalla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 363DLWNm035742
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jul 2023 08:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688390492;
	bh=c8ALwm3BclSp6vS7UEHp9lrWfweXPi5OHxysG4chx4s=;
	h=From:To:CC:Subject:Date;
	b=vYWDX8ajxdr9yKXABvZ1CEcr2tqzJUY/B9wYXmoL/Gwu93HbT92l2jL5sBeApInju
	 JZRE4RMwqFV8p6X5d3CWiIuPs2dXDMbAWEoGlQF3mLV/0hb9+rJi8SqxT4yEsatP2j
	 YmryIpUEG2Bzd6tG2pt2rFuciC9sXN6JM94CMENw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 363DLWCJ046087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jul 2023 08:21:32 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jul 2023 08:21:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jul 2023 08:21:32 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 363DLWfL015328;
	Mon, 3 Jul 2023 08:21:32 -0500
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>
Subject: [kirkstone/master PATCH] ipc: ti-rpmsg-char: Update library to 0.6.2
Date: Mon, 3 Jul 2023 08:21:30 -0500
Message-ID: <20230703132130.21111-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Jul 2023 13:21:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16808

Update ti-rpmsg-char library to fix wrong rpmsg-ctrl
device ids observed when multiple remote procs are present
with multiple channels opened.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 84873923..b9983644 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.1 release
-SRCREV = "510e90d0a75bc21d79020669d2ea03f8222f3b8d"
+# 0.6.2 release
+SRCREV = "6e2e829f8810708638597d49a3a7c1f2eac28ba2"
 
-PV = "0.6.1+git${SRCPV}"
+PV = "0.6.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


