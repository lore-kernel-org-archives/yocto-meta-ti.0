Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004B2C83F09
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 08:56:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.17812.1751532989513887943
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 01:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fQfhvT6Q;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5638uTPO4165644
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Jul 2025 03:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751532989;
	bh=Vy3vEZfngpsrvD0IrPh1lNKxMrplXz4MaDyt+FgRYAA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fQfhvT6Q62VApCNlSxtcPh/jiV00ZmmZeRQsfFPBdTQjHHgUz7zqZDA8xs4U5eEC1
	 4O/Z0PvhzId29rHAkRgXA3l6ddfn8Lct1yQH0Q7YQEPN4wgI/HJ66/PZuuHisUaBup
	 MOhlxBweY+Lhe4jCFCYn5ouNOUyyYP17A32Fq2h8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5638uTUO1684071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Jul 2025 03:56:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 03:56:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 03:56:28 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5638uR6O554115;
	Thu, 3 Jul 2025 03:56:28 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v1 2/2] meta-ti-bsp: u-boot: change tispl_falcon to tifalcon
Date: Thu, 3 Jul 2025 14:25:41 +0530
Message-ID: <20250703085542.3246605-2-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703085542.3246605-1-anshuld@ti.com>
References: <20250703085542.3246605-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Jul 2025 08:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18763

The payload containing ATF, OP-TEE and DM in falcon mode was renamed
from 'tispl_falcon.bin' to 'tifalcon.bin' when adapting upstream patches
to ti-u-boot[1].

Therefore this patch fixes the same in meta-ti.

[1]:
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs/k3_r5_falcon.config?h=ti-u-boot-2025.01-next#n36

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index c348c99b..75e6bd0a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -14,7 +14,7 @@ require u-boot-mergeconfig.inc
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
 
-FILES:${PN}-falcon = "boot/tispl_falcon.bin"
+FILES:${PN}-falcon = "boot/tifalcon.bin"
 
 SUMMARY = "u-boot bootloader for TI devices"
 
@@ -374,7 +374,7 @@ do_deploy:append:am62pxx() {
 }
 
 do_install:append:ti-falcon() {
-	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
+	install -m 0644 ${B}/tifalcon.bin ${D}/boot
 }
 
 FALCON_PKG = ""
-- 
2.49.0


