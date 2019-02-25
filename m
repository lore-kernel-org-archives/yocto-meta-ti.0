Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6A61E00CEE; Mon, 25 Feb 2019 13:55:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UPPERCASE_50_75
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2256DE0090C
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2019 13:55:20 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1363740B0A;
	Mon, 25 Feb 2019 21:55:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aAoxJVMwzghF; Mon, 25 Feb 2019 21:55:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D82DC403F2;
	Mon, 25 Feb 2019 21:55:08 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DA6A816ACB6;
	Mon, 25 Feb 2019 16:55:02 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Feb 2019 16:55:02 -0500
Message-Id: <1551131702-3324-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] u-boot-ti: K2 HS platforms do not support 2-stage boot from SPI
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
X-List-Received-Date: Mon, 25 Feb 2019 21:55:22 -0000

Hence install and deploy UBOOT_SPI_BINARY conditionally, similar to
UBOOT_SPI_SPL_BINARY and UBOOT_SPI_GPH_BINARY.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 42 ++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 9d82711..b66a7a6 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -67,6 +67,10 @@ UBOOT_SPI_SPL_BINARY_k2hk-hs-evm = ""
 UBOOT_SPI_SPL_BINARY_k2g-hs-evm = ""
 UBOOT_SPI_SPL_BINARY_k2l-hs-evm = ""
 UBOOT_SPI_BINARY = "u-boot.img"
+UBOOT_SPI_BINARY_k2e-hs-evm = ""
+UBOOT_SPI_BINARY_k2hk-hs-evm = ""
+UBOOT_SPI_BINARY_k2g-hs-evm = ""
+UBOOT_SPI_BINARY_k2l-hs-evm = ""
 UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
 UBOOT_SPI_GPH_BINARY_k2e-hs-evm = ""
 UBOOT_SPI_GPH_BINARY_k2hk-hs-evm = ""
@@ -269,9 +273,11 @@ do_install_append_keystone () {
 						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
 					fi
 
-					install ${B}/${config}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}-${type}
-					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}-${type}
-					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}
+					if [ "x${UBOOT_SPI_BINARY}" != "x" ]; then
+						install ${B}/${config}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}-${type}
+						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}-${type}
+						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}
+					fi
 
 					if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
 						install ${B}/${config}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}-${type}
@@ -289,8 +295,10 @@ do_install_append_keystone () {
 			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
 		fi
 
-		install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
-		ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
+		if [ "x${UBOOT_SPI_BINARY}" != "x" ]; then
+			install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+			ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
+		fi
 
 		if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
 			install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
@@ -317,12 +325,14 @@ do_deploy_append_keystone () {
 						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_BINARY}
 					fi
 
-					install ${B}/${config}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}-${type}
-					rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}-${type}
-					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}
-					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}-${type}
-					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}
+					if [ "x${UBOOT_SPI_BINARY}" != "x" ]; then
+						install ${B}/${config}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}-${type}
+						rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}-${type}
+						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}
+						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}-${type}
+						ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}
+					fi
 
 					if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
 						install ${B}/${config}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}-${type}
@@ -345,10 +355,12 @@ do_deploy_append_keystone () {
 			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
 		fi
 
-		install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
-		rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-		ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
-		ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
+		if [ "x${UBOOT_SPI_BINARY}" != "x" ]; then
+			install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
+			rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+			ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
+			ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
+		fi
 
 		if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
 			install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
-- 
2.7.4


