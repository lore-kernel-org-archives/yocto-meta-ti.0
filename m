Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CAB8E00B27; Wed,  7 Jun 2017 14:04:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UPPERCASE_50_75
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DFC8E00B27
	for <meta-ti@yoctoproject.org>; Wed,  7 Jun 2017 14:04:48 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E40E20C0B;
	Wed,  7 Jun 2017 21:04:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6ufP6bXRtQBt; Wed,  7 Jun 2017 21:04:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25DDC204E0;
	Wed,  7 Jun 2017 21:04:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 992971624C6;
	Wed,  7 Jun 2017 17:04:46 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  7 Jun 2017 17:04:37 -0400
Message-Id: <1496869478-36913-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] u-boot-ti: support multiple configs
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
X-List-Received-Date: Wed, 07 Jun 2017 21:04:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 257 +++++++++++++++++++++++++++++----------
 1 file changed, 192 insertions(+), 65 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 68b7989..04e224d 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -18,9 +18,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
 
 SUMMARY = "u-boot bootloader for TI devices"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
-
 BRANCH ?= "master"
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
@@ -29,8 +26,6 @@ PV_append = "+git${SRCPV}"
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PROVIDES += "u-boot"
 PKG_${PN} = "u-boot"
 PKG_${PN}-dev = "u-boot-dev"
@@ -88,82 +83,214 @@ UBOOT_HS_MLO_BINARY = "u-boot_HS_MLO"
 UBOOT_HS_MLO_IMAGE = "u-boot_HS_MLO-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_MLO_SYMLINK = "u-boot_HS_MLO-${MACHINE}"
 
-do_compile_append_am437x-hs-evm () {
-	if [ -f ${B}/u-boot-spl_HS_ISSW ]; then
-		rm -rf ${B}/MLO
-		cp ${B}/u-boot-spl_HS_ISSW ${B}/MLO
-	fi
-}
-
 do_install_append () {
-	if [ "x${SPL_UART_BINARY}" != "x" ]; then
-		install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
-		ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
-	fi
-	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-		install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
-		ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
-	fi
-	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					if [ "x${SPL_UART_BINARY}" != "x" ]; then
+						install ${B}/${config}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}
+					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}-${type}
+						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}-${type}
+						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}
+					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}-${type}
+						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
+						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+					fi
+				fi
+			done
+			unset  j
+		done
+		unset  i
+	else
+		if [ "x${SPL_UART_BINARY}" != "x" ]; then
+			install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+			ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
+		fi
+		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+			install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
+			ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
+		fi
+		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+			install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
+			ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+		fi
 	fi
 }
 
 do_deploy_append () {
-	cd ${DEPLOYDIR}
-	if [ "x${SPL_UART_BINARY}" != "x" ]; then
-		install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
-		rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
-		ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
-		ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
-	fi
-	if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-		install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
-		rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
-		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
-		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
-	fi
-	if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-		install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
-		rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
-		ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					cd ${DEPLOYDIR}
+					if [ "x${SPL_UART_BINARY}" != "x" ]; then
+						install ${B}/${config}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}-${type}
+						rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_BINARY}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_BINARY}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_SYMLINK}-${type}
+						ln -sf ${SPL_UART_IMAGE}-${type} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}-${type}
+						rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
+						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${type}
+						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
+						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}-${type}
+						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
+					fi
+					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
+						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}-${type}
+						rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
+						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${type}
+						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
+						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
+						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
+					fi
+				fi
+			done
+			unset  j
+		done
+		unset  i
+	else
+		cd ${DEPLOYDIR}
+		if [ "x${SPL_UART_BINARY}" != "x" ]; then
+			install ${B}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
+			rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+			ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
+			ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
+		fi
+		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+			install ${B}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
+			rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
+			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
+			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
+		fi
+		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+			install ${B}/${UBOOT_HS_MLO_BINARY} ${DEPLOYDIR}/${UBOOT_HS_MLO_IMAGE}
+			rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
+			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
+			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
+		fi
 	fi
 }
 
 do_install_append_keystone () {
-	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
-		install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
-		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-	fi
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
+						install ${B}/${config}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}-${type}
+						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_SPL_BINARY}-${type}
+						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
+					fi
+
+					install ${B}/${config}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}-${type}
+					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}-${type}
+					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_BINARY}
+
+					if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
+						install ${B}/${config}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}-${type}
+						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_GPH_BINARY}-${type}
+						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+					fi
+				fi
+			done
+			unset  j
+		done
+		unset  i
+	else
+		if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
+			install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
+			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
+		fi
 
-	install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
-	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
+		install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
+		ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
 
-	if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
-		install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
-		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+		if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
+			install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
+			ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
+		fi
 	fi
 }
 
 do_deploy_append_keystone () {
-	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
-		install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
-		rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
-		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
-		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
-	fi
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
+						install ${B}/${config}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}-${type}
+						rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
+						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_SYMLINK}-${type}
+						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_SYMLINK}
+						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_BINARY}-${type}
+						ln -sf ${UBOOT_SPI_SPL_IMAGE}-${type} ${UBOOT_SPI_SPL_BINARY}
+					fi
+
+					install ${B}/${config}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}-${type}
+					rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}-${type}
+					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_SYMLINK}
+					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}-${type}
+					ln -sf ${UBOOT_SPI_IMAGE}-${type} ${UBOOT_SPI_BINARY}
+
+					if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
+						install ${B}/${config}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}-${type}
+						rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
+						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_SYMLINK}-${type}
+						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_SYMLINK}
+						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_BINARY}-${type}
+						ln -sf ${UBOOT_SPI_GPH_IMAGE}-${type} ${UBOOT_SPI_GPH_BINARY}
+					fi
+				fi
+			done
+			unset  j
+		done
+		unset  i
+	else
+		if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
+			install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
+			rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
+			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
+			ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
+		fi
 
-	install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
-	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
+		install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
+		rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
+		ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
+		ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
 
-	if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
-		install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
-		rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
-		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
-		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
+		if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
+			install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
+			rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
+			ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
+			ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
+		fi
 	fi
 }
-- 
2.7.4


