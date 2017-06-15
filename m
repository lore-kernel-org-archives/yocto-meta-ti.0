Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44CCFE00B8F; Wed, 14 Jun 2017 17:49:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,TVD_SPACE_RATIO,
	TVD_SPACE_RATIO_MINFP,UPPERCASE_50_75 autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  1.0 TVD_SPACE_RATIO_MINFP Space ratio
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45B5AE00B77
	for <meta-ti@yoctoproject.org>; Wed, 14 Jun 2017 17:49:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C9E520879;
	Thu, 15 Jun 2017 00:49:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KYinFM5KlXxQ; Thu, 15 Jun 2017 00:49:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75D2020567;
	Thu, 15 Jun 2017 00:49:33 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 08E841624E1;
	Wed, 14 Jun 2017 20:49:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Jun 2017 20:49:32 -0400
Message-Id: <1497487772-79933-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] u-boot-ti: add support for u-boot-spl_HS_ISSW images
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jun 2017 00:49:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 79291e2..5b49777 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -86,6 +86,11 @@ UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
 UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
 
+# HS ISSW
+UBOOT_HS_ISSW_BINARY = "u-boot-spl_HS_ISSW"
+UBOOT_HS_ISSW_IMAGE = "u-boot-spl_HS_ISSW-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_ISSW_SYMLINK = "u-boot-spl_HS_ISSW-${MACHINE}"
+
 # HS 2ND
 UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
@@ -115,6 +120,11 @@ do_install_append () {
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
 					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}-${type}
+						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}-${type}
+						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
+					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
 						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}-${type}
 						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}-${type}
@@ -138,6 +148,10 @@ do_install_append () {
 			install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
 		fi
+		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
+			install ${B}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}
+			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
+		fi
 		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
 			install ${B}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}
 			ln -sf ${UBOOT_HS_2ND_IMAGE} ${D}/boot/${UBOOT_HS_2ND_BINARY}
@@ -179,6 +193,14 @@ do_deploy_append () {
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
 					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${DEPLOYDIR}/${UBOOT_HS_ISSW_IMAGE}-${type}
+						rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
+						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${type}
+						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
+						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}-${type}
+						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
+					fi
 					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
 						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE}-${type}
 						rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
@@ -212,6 +234,12 @@ do_deploy_append () {
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
 		fi
+		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
+			install ${B}/${UBOOT_HS_ISSW_BINARY} ${DEPLOYDIR}/${UBOOT_HS_ISSW_IMAGE}
+			rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
+			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
+			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
+		fi
 		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
 			install ${B}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE}
 			rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
-- 
2.7.4


