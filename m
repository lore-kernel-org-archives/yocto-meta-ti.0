Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94CE1E00D17; Wed, 13 Dec 2017 12:23:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9494E00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 12:23:14 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5666208CC;
	Wed, 13 Dec 2017 20:23:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id va5vgcG9_826; Wed, 13 Dec 2017 20:23:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC5BD207BA;
	Wed, 13 Dec 2017 20:23:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 48C57162717;
	Wed, 13 Dec 2017 15:23:12 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 13 Dec 2017 15:23:11 -0500
Message-Id: <1513196591-16791-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] edma3-lld: pass TOOLCHAIN_OPTIONS and fix host-user-contamination
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
X-List-Received-Date: Wed, 13 Dec 2017 20:23:15 -0000

1. Need TOOLCHAIN_OPTIONS to pass --sysroot parameter for internal toolchain
2. Use proper cp parameters to handle files ownership correctly

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld_git.bb | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
index e197d0b..38db2e2 100644
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -24,41 +24,43 @@ do_compile () {
 	cd ${S}/packages
 	for platform in ${PLATFORMLIST}
 	do
-		ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" \
-		CROSSLNK="${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT="${S}" make \
+		ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" CROSSAR="${TARGET_PREFIX}ar" \
+		CROSSLNK="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" INTERNAL_SW_ROOT="${S}" make \
 		PLATFORM="$platform" TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF \
 		SONAME=libedma3.so all
 	done
 }
 
 do_install () {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
 	install -d ${D}/${libdir}
 
 	# Static Libraries
-	cp ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg \
+	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg \
 		${D}/${libdir}/libedma3.a
-	cp ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/edma3_lld_rm.aa15fg \
+	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/edma3_lld_rm.aa15fg \
 		${D}/${libdir}/libedma3rm.a
 
 	# Shared Libraries
-	cp -a ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* ${D}/${libdir}
-	cp -a ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/libedma* ${D}/${libdir}
+	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* ${D}/${libdir}
+	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/libedma* ${D}/${libdir}
 
 	# Copy Headers
 	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
 	install -d ${D}/${includedir}/ti/sdo/edma3/rm
-	cp ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/sdo/edma3/drv/
-	cp ${S}/packages/ti/sdo/edma3/rm/*.h ${D}/${includedir}/ti/sdo/edma3/rm/
+	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/sdo/edma3/drv/
+	cp ${CP_ARGS} ${S}/packages/ti/sdo/edma3/rm/*.h ${D}/${includedir}/ti/sdo/edma3/rm/
 
 	# Copy Sample Config
 	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2HSample.c \
+	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2HSample.c \
 		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2KSample.c \
+	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2KSample.c \
 		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LSample.c \
+	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LSample.c \
 		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
-	cp ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESample.c \
+	cp ${CP_ARGS} ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESample.c \
 		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
 
 	install -d ${D}/${bindir}
-- 
2.7.4


