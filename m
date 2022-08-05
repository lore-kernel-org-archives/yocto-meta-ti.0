Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDC8C25B0C
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2720.1659667779297815791
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cW+UoqFy;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752nZfm042235;
	Thu, 4 Aug 2022 21:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667775;
	bh=UFl49sCEObSx124kzpBp88BwN8raT3RoEFNlX34LyTI=;
	h=From:To:CC:Subject:Date;
	b=cW+UoqFyr4OOihF3MOPixDB+YUcM2zL19ha9326bNwxS0CLqrVVgzNCV1PrzgT6PM
	 1OODabv0TR6LTuAl3MI4i7EftSmYfZeaWQkrJWM3BCl34L9IDhn2gqr5TNaiSyo5zv
	 n16j0gpCGMiZBBVXsaAM5BzgKd2PW4X3usCc2w6w=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752nZr5073784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:34 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYEN111537;
	Thu, 4 Aug 2022 21:49:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/8] u-boot-ti: Do not prepend output files
 with DEPLOYDIR
Date: Thu, 4 Aug 2022 21:49:27 -0500
Message-ID: <20220805024934.23349-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 02:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14932

We already cd into DEPLOYDIR so this is not needed. This now matches the
keystone version below. Also fixes build in some odd situations.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 1f8fb6de..acc06fea 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -187,15 +187,15 @@ do_deploy_append () {
 				then
 					cd ${DEPLOYDIR}
 					if [ "x${SPL_UART_BINARY}" != "x" ]; then
-						install ${B}/${config}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}-${type}
-						rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_BINARY}-${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_BINARY}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_SYMLINK}-${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+						install ${B}/${config}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}-${type}
+						rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}-${type}
 						rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${type}
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
@@ -203,7 +203,7 @@ do_deploy_append () {
 						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}-${type}
 						rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${type}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
@@ -211,7 +211,7 @@ do_deploy_append () {
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${DEPLOYDIR}/${UBOOT_HS_ISSW_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}-${type}
 						rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
 						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${type}
 						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
@@ -219,7 +219,7 @@ do_deploy_append () {
 						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
 					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE}-${type}
+						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}-${type}
 						rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
 						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${type}
 						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
@@ -234,31 +234,31 @@ do_deploy_append () {
 	else
 		cd ${DEPLOYDIR}
 		if [ "x${SPL_UART_BINARY}" != "x" ]; then
-			install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
-			rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
-			ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
-			ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+			install ${B}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}
+			rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
+			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
+			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
 		fi
 		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-			install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
+			install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
 			rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
 			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
 			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
 		fi
 		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-			install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
+			install ${B}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}
 			rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
 		fi
 		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
-			install ${B}/${UBOOT_HS_ISSW_BINARY} ${DEPLOYDIR}/${UBOOT_HS_ISSW_IMAGE}
+			install ${B}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}
 			rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
 			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
 			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
 		fi
 		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
-			install ${B}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE}
+			install ${B}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}
 			rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
-- 
2.36.1


