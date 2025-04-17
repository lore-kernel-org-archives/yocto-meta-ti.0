Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9227C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:51:48 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.10919.1744901498820187685
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 07:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YmO8aPTW;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HEpYfs726865
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 09:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744901494;
	bh=BD7T+rjX/sXQ2mPT7LFCXWyzsOP/LRsS0XYoBO49+Yk=;
	h=From:To:CC:Subject:Date;
	b=YmO8aPTWRXsf2kyHFOguPLXKGG7+AUfmiwjjcfEteRzfFWiAqU/4rL71ECsCkqDkV
	 BXEIYB//4KjrXBy5Mm1NT0qxCUQboOi/RV3CLBJNEfFg22Yu4g4IBtmCpDpfST4Xei
	 PvjsJ7g133I6jYgraPDi+o9DdFk0fZl+BEiF1ohk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HEpY6N057441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 09:51:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 09:51:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 09:51:34 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HEpXlN080936;
	Thu, 17 Apr 2025 09:51:33 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Remove do_install from bootsplash image
Date: Thu, 17 Apr 2025 20:21:31 +0530
Message-ID: <20250417145131.3966302-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 14:51:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18483

* U-Boot reads the bootsplash image file from the /boot (i.e vfat)
partition & displays it during boot-up showcasing early splash screen
support.

* There's no significance of having an additional do_install
as the logo file need not be added in the rootfs/image.

* Fixes 277f04df4c94de44bcea95b46d59cf057f571e45 & 1fed958bfe8a8825996134f62097ac02206f43b2

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 41d4abdd..6fe7ddf1 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -353,21 +353,11 @@ uboot_deploy:append () {
     fi
 }
 
-do_install:append:am62xx() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
-}
-
 do_deploy:append:am62xx() {
 	install -d ${DEPLOYDIR}
 	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
 }
 
-do_install:append:am62pxx() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
-}
-
 do_deploy:append:am62pxx() {
 	install -d ${DEPLOYDIR}
 	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
-- 
2.34.1


