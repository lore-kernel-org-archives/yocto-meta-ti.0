Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FB7AE00DD7; Sun, 17 Jun 2018 12:37:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97D0EE0084F
	for <meta-ti@yoctoproject.org>; Sun, 17 Jun 2018 12:37:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B563B20C14;
	Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Hqc61iwLR6u0; Sun, 17 Jun 2018 19:37:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 87F2F20BBE;
	Sun, 17 Jun 2018 19:37:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D40C01634B0;
	Sun, 17 Jun 2018 15:37:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sun, 17 Jun 2018 15:37:23 -0400
Message-Id: <1529264243-32781-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264243-32781-1-git-send-email-denys@ti.com>
References: <1529264243-32781-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 5/5] u-boot-ti-staging: add handling of K3 and AM65x on A53 side
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:30 -0000

Handle dependencies on ATF and OPTEE via PACKAGECONFIGs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb |  6 +++---
 recipes-bsp/u-boot/u-boot-ti.inc                | 27 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index 14b5e4d..8f79fe5 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r10"
+PR = "r11"
 
-BRANCH = "ti-u-boot-2018.01"
+BRANCH = "ti-u-boot-2018.01-next"
 
-SRCREV = "3c49934f57ead2da6b6a0a2345d576ba2735687c"
+SRCREV = "6e9cffd6e111df6f9122b4a77c71112981feb9d3"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 666d7ae..4fd3529 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -29,6 +29,12 @@ PV_append = "+git${SRCPV}"
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native"
 
+PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/boot/bl31.bin,,arm-trusted-firmware"
+PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
+
+# optee-os is not a direct dependency, do not enable optee by default
+PACKAGECONFIG_append_k3 = " atf"
+
 PROVIDES += "u-boot"
 PKG_${PN} = "u-boot"
 PKG_${PN}-dev = "u-boot-dev"
@@ -47,10 +53,12 @@ SPL_BINARY_k2hk-hs-evm = ""
 SPL_BINARY_k2g-hs-evm = ""
 SPL_BINARY_k2l-hs-evm = ""
 SPL_BINARY_omapl138 = ""
+SPL_BINARY_k3 = "tispl.bin"
 
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY = "u-boot-spl.bin"
 SPL_UART_BINARY_keystone = ""
+SPL_UART_BINARY_k3 = ""
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -99,6 +107,25 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
 
+do_compile_k3 () {
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
+		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
+	fi
+
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+
+	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+	then
+		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
+	fi
+
+	oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+	oe_runmake -C ${S} O=${B} ${PACKAGECONFIG_CONFARGS} ${UBOOT_MAKE_TARGET}
+}
+
 do_install_append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
-- 
2.7.4


