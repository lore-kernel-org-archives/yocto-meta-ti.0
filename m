Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE252E00CE0; Thu, 26 Jul 2018 14:25:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72312E00CDD
	for <meta-ti@yoctoproject.org>; Thu, 26 Jul 2018 14:25:32 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A85A620C38;
	Thu, 26 Jul 2018 21:25:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id v_F0kej87Jtj; Thu, 26 Jul 2018 21:25:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8102F20567;
	Thu, 26 Jul 2018 21:25:30 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 065621634FE;
	Thu, 26 Jul 2018 17:25:30 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Jul 2018 17:25:29 -0400
Message-Id: <1532640329-37267-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] u-boot-ti: don't override do_compile, pass PACKAGECONFIG_CONFARGS to EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 26 Jul 2018 21:25:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 4fd3529..61bf990 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -35,6 +35,8 @@ PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
 # optee-os is not a direct dependency, do not enable optee by default
 PACKAGECONFIG_append_k3 = " atf"
 
+EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
+
 PROVIDES += "u-boot"
 PKG_${PN} = "u-boot"
 PKG_${PN}-dev = "u-boot-dev"
@@ -107,25 +109,6 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
 
-do_compile_k3 () {
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
-	fi
-
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-
-	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-	then
-		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-	fi
-
-	oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
-	oe_runmake -C ${S} O=${B} ${PACKAGECONFIG_CONFARGS} ${UBOOT_MAKE_TARGET}
-}
-
 do_install_append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
-- 
2.7.4


