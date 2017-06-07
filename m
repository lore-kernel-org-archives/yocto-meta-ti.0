Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24B49E00BF8; Wed,  7 Jun 2017 14:15:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UPPERCASE_50_75
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2315EE00BF3
	for <meta-ti@yoctoproject.org>; Wed,  7 Jun 2017 14:15:48 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E34AB20BF3;
	Wed,  7 Jun 2017 21:15:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id o4BM1RQQd7lt; Wed,  7 Jun 2017 21:15:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B9608204E0;
	Wed,  7 Jun 2017 21:15:46 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3799C1624C6;
	Wed,  7 Jun 2017 17:15:46 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  7 Jun 2017 17:15:45 -0400
Message-Id: <1496870145-38590-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] u-boot-ti: add support for u-boot-spl_HS_2ND images
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
X-List-Received-Date: Wed, 07 Jun 2017 21:15:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 04e224d..c1385f4 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -83,6 +83,11 @@ UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
 UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
 
+# HS 2ND
+UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
+UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
+
 do_install_append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
@@ -107,6 +112,11 @@ do_install_append () {
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
 					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}-${type}
+						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}-${type}
+						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}
+					fi
 				fi
 			done
 			unset  j
@@ -125,6 +135,10 @@ do_install_append () {
 			install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
 		fi
+		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
+			install ${B}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}
+			ln -sf ${UBOOT_HS_2ND_IMAGE} ${D}/boot/${UBOOT_HS_2ND_BINARY}
+		fi
 	fi
 }
 
@@ -162,6 +176,14 @@ do_deploy_append () {
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
 						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
 					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE}-${type}
+						rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
+						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${type}
+						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
+						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}-${type}
+						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}
+					fi
 				fi
 			done
 			unset  j
@@ -187,6 +209,12 @@ do_deploy_append () {
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
 			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
 		fi
+		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
+			install ${B}/${UBOOT_HS_2ND_BINARY} ${DEPLOYDIR}/${UBOOT_HS_2ND_IMAGE}
+			rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
+			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
+			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
+		fi
 	fi
 }
 
-- 
2.7.4


