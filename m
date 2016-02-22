Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18564E00C4C; Mon, 22 Feb 2016 13:54:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP,
	but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4533E00BEA
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2016 13:54:38 -0800 (PST)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.148])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2Y008QZY6NJL50@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 22 Feb 2016 15:54:24 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=BQztMkJkyZ1GBBLgmg8A:9
Received: by 100.15.86.14 with SMTP id 043394d8; Mon, 22 Feb 2016 21:54:23 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 37AB2161EB5;	Mon,
	22 Feb 2016 16:54:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 22 Feb 2016 16:54:22 -0500
Message-id: <1456178062-20262-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] u-boot-ti-staging: add support for DRA7 and AM4 secure devices
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
X-List-Received-Date: Mon, 22 Feb 2016 21:54:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index 304b0ab..ed827fc 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r19"
+PR = "r20"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
@@ -16,6 +16,12 @@ BRANCH ?= "ti-u-boot-2015.07"
 
 SRCREV = "dca348d604c0117fa7851e3a4a194bedb42b739b"
 
+# Support for secure devices - detailed info is in doc/README.ti-secure
+TI_SECURE_DEV_PKG ?= ""
+TI_SECURE_DEV_PKG_dra7xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
+TI_SECURE_DEV_PKG_am437x-hs-evm = "${TI_SECURE_DEV_PKG_AM4}"
+export TI_SECURE_DEV_PKG
+
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
 
@@ -36,6 +42,13 @@ UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
 UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
 UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
 
+do_compile_append_am437x-hs-evm () {
+	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
+		rm -rf ${S}/MLO
+		cp ${S}/u-boot-spl_HS_ISSW ${S}/MLO
+	fi
+}
+
 do_install_append_keystone () {
 	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
 	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-- 
2.2.0


