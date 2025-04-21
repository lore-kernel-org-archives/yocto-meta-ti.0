Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23819C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 05:48:55 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.9857.1745214525842294393
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 20 Apr 2025 22:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nCCUHiLV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53L5mgin829018
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 00:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745214522;
	bh=LCuvGUWCtSkXeLFMaTtCBEsaj94N3P3yz8Afkr6qt2w=;
	h=From:To:CC:Subject:Date;
	b=nCCUHiLVbde+rxDXcyl3iGHIfLoYiGpcUrb+Qh7TLsRbKYzlqZdz53b4sQWPFaL15
	 8F4r0HEurWuq9Gx6glzbgWBIX7/ZhADLCB21G9gc98T2DFG/k+QhaItLXOsD0pvWLt
	 fUuMMklB4pD+kpmZJIRDorZQYQ4Q2K0JCv88AoNQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53L5mgIP048127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 00:48:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 00:48:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 00:48:41 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53L5mfIw086371;
	Mon, 21 Apr 2025 00:48:41 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2] recipes-bsp: u-boot: Remove do_install from bootsplash image
Date: Mon, 21 Apr 2025 11:18:30 +0530
Message-ID: <20250421054830.3302500-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Apr 2025 05:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18487

* U-Boot reads the bootsplash image file from the vfat boot partition
& displays it during boot-up showcasing early splash screen support.

* There's no significance of having an additional do_install
as the logo file need not be added in the rootfs/image.

* Fixes 277f04df4c94de44bcea95b46d59cf057f571e45 & 1fed958bfe8a8825996134f62097ac02206f43b2

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
Changes in v2: Update commit message based on Denys feedback in v1
Link to v1: https://lists.yoctoproject.org/g/meta-ti/message/18484

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


