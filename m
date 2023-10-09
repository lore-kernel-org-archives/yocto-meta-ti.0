Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4332BCD613E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 21:35:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.76320.1696887310165778930
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 14:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ICtHdZb3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399LZ8HB054131;
	Mon, 9 Oct 2023 16:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696887308;
	bh=wyehRG7IZ1ilTgmWDF0SS0rfFcIUhsKDk1GWo4LTpDI=;
	h=From:To:Subject:Date;
	b=ICtHdZb3B7r65ZvD5GKzIsGYTd0OL0vQHKlMb80ybvas7/qh8611wtWBS1oA9vCti
	 /FGjiGoAuIcp9lsDJhzw6TlCR2iuR4zVwLwXEG56p0xxCfyfczlen5D+pHhVRfk+t9
	 Xkm76woC9r42vXX96ViGOqfncFVPyvU0UClC/b90=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399LZ8bs062811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Oct 2023 16:35:08 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 16:35:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 16:35:08 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399LZ8OT017741;
	Mon, 9 Oct 2023 16:35:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qpxu8-0004WF-2h; Mon, 09 Oct 2023 16:35:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] u-boot-ti: Correctly fix SPL binary name for SD/MMC media on HS boards
Date: Mon, 9 Oct 2023 16:35:08 -0500
Message-ID: <20231009213508.17330-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 21:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17088

The previous patch is incorrectly accepted and released.  This patch
applies the logic that was discussed on the mailing list.

- Create a new variable grouping for SPL_HS_MLO
- Update the install/deploy code to reference the new variables.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 33 ++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 355e9868..58ee6525 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -81,15 +81,19 @@ SPL_UART_BINARY:k3r5 = ""
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
 
+SPL_HS_MLO_BINARY = "u-boot-spl_HS_MLO"
+SPL_HS_MLO_IMAGE = "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
+SPL_HS_MLO_SYMLINK = "u-boot-spl_HS_MLO-${MACHINE}"
+
 # HS XLD
 UBOOT_HS_XLD_BINARY = "u-boot-spl_HS_X-LOADER"
 UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
 
 # HS MLO
-UBOOT_HS_MLO_BINARY = "u-boot-spl_HS_MLO"
-UBOOT_HS_MLO_IMAGE = "u-boot-spl_HS_MLO-${MACHINE}-${PV}-${PR}"
-UBOOT_HS_MLO_SYMLINK = "u-boot-spl_HS_MLO-${MACHINE}"
+UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
+UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
 
 # HS ISSW
 UBOOT_HS_ISSW_BINARY = "u-boot-spl_HS_ISSW"
@@ -121,6 +125,11 @@ do_install:append () {
 						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}-${type}
 						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}
 					fi
+					if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
+						install ${B}/${config}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}-${type}
+						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}-${type}
+						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}
+					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
 						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}-${type}
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}-${type}
@@ -151,6 +160,10 @@ do_install:append () {
 			install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
 			ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
 		fi
+		if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
+			install ${B}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}
+			ln -sf ${SPL_HS_MLO_IMAGE} ${D}/boot/${SPL_HS_MLO_BINARY}
+		fi
 		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
 			install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
 			ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
@@ -202,6 +215,14 @@ do_deploy:append () {
 						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
 						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
 					fi
+					if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
+						install ${B}/${config}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}-${type}
+						rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
+						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}-${type}
+						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}
+						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}-${type}
+						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}
+					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
 						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}-${type}
 						rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
@@ -247,6 +268,12 @@ do_deploy:append () {
 			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
 			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
 		fi
+		if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
+			install ${B}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}
+			rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
+			ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_SYMLINK}
+			ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_BINARY}
+		fi
 		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
 			install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
 			rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
-- 
2.17.1


