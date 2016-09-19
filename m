Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A788DE00503; Mon, 19 Sep 2016 10:00:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8879E00404
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 09:59:59 -0700 (PDT)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODR00A31GJAYG00@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 19 Sep 2016 11:59:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=4oiTWkaoD8kivZ9J1wwA:9
Received: by 100.15.110.130 with SMTP id 5f565fd6;
	Mon, 19 Sep 2016 16:59:49 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id E9E0316212E;	Mon, 19 Sep 2016 12:59:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 19 Sep 2016 12:59:25 -0400
Message-id: <1474304370-18201-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/6] u-boot-ti-staging: remove old versions
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
X-List-Received-Date: Mon, 19 Sep 2016 17:00:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 20 -------
 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb | 78 -------------------------
 2 files changed, 98 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
 delete mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
deleted file mode 100644
index 9d7dd06..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require u-boot-ti.inc
-
-# u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native"
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
-
-PR = "r14"
-PV_append = "+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2014.07"
-
-SRCREV = "fb6ab76dad21e12b12d0f824fcfa2609a26ec695"
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
deleted file mode 100644
index 0634a16..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ /dev/null
@@ -1,78 +0,0 @@
-require u-boot-ti.inc
-
-# u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native"
-
-DESCRIPTION = "u-boot bootloader for TI devices"
-
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
-
-PR = "r25"
-PV_append = "+git${SRCPV}"
-
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
-
-BRANCH ?= "ti-u-boot-2015.07"
-
-SRCREV = "46c915c96358c426bb1f4dd1e25a9a805d93a24e"
-
-# Support for secure devices - detailed info is in doc/README.ti-secure
-TI_SECURE_DEV_PKG ?= ""
-TI_SECURE_DEV_PKG_dra7xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
-TI_SECURE_DEV_PKG_am437x-hs-evm = "${TI_SECURE_DEV_PKG_AM4}"
-export TI_SECURE_DEV_PKG
-
-SPL_BINARY = "MLO"
-SPL_UART_BINARY = "u-boot-spl.bin"
-
-# Keystone specifics
-UBOOT_SUFFIX_keystone = "bin"
-SPL_UART_BINARY_keystone = ""
-
-# SPI NOR Flash binaries
-UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
-UBOOT_SPI_BINARY = "u-boot.img"
-UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
-
-# SPI NOR Flash deployed images
-UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
-UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
-UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
-UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
-
-do_compile_append_am437x-hs-evm () {
-	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
-		rm -rf ${S}/MLO
-		cp ${S}/u-boot-spl_HS_ISSW ${S}/MLO
-	fi
-}
-
-do_install_append_keystone () {
-	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-
-	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
-	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
-
-	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
-}
-
-do_deploy_append_keystone () {
-	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
-	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
-	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
-
-	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
-	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
-	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
-
-	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
-	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
-	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
-}
-- 
2.7.4


