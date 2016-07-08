Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21CD1E00C0F; Fri,  8 Jul 2016 16:42:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2EA4E00B7A
	for <meta-ti@yoctoproject.org>; Fri,  8 Jul 2016 16:42:52 -0700 (PDT)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA0003J7SJ0T880@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 08 Jul 2016 18:42:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=b7jIudLy5X5xvDDMcrUA:9
Received: by 100.15.86.14 with SMTP id 23576f4c; Fri, 08 Jul 2016 23:42:36 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 94CFA1620A3;	Fri,  8 Jul 2016 19:42:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 08 Jul 2016 19:42:33 -0400
Message-id: <1468021354-20601-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] u-boot-ti-staging: add HS_X-LOADER images, update to ti2016.02-rc4 tag
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
X-List-Received-Date: Fri, 08 Jul 2016 23:42:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 53510c6..f6377de 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r9"
+PR = "r10"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2016.05"
 
-SRCREV = "b43cf45fec75961d196da4563bd32c0215d2fd58"
+SRCREV = "a4560200fc597109328a6454094fa77516434880"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""
@@ -43,6 +43,11 @@ UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
 UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
 UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
 
+# HS XLD
+UBOOT_HS_XLD_BINARY = "u-boot-spl_HS_X-LOADER"
+UBOOT_HS_XLD_IMAGE = "u-boot-spl_HS_X-LOADER-${MACHINE}-${PV}-${PR}"
+UBOOT_HS_XLD_SYMLINK = "u-boot-spl_HS_X-LOADER-${MACHINE}"
+
 do_compile_append_am437x-hs-evm () {
 	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
 		rm -rf ${S}/MLO
@@ -50,6 +55,22 @@ do_compile_append_am437x-hs-evm () {
 	fi
 }
 
+do_install_append () {
+	if [ -f ${S}/${UBOOT_HS_XLD_BINARY} ]; then
+		install ${S}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
+		ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
+	fi
+}
+
+do_deploy_append () {
+	if [ -f ${S}/${UBOOT_HS_XLD_BINARY} ]; then
+		install ${S}/${UBOOT_HS_XLD_BINARY} ${DEPLOYDIR}/${UBOOT_HS_XLD_IMAGE}
+		rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
+		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
+		ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
+	fi
+}
+
 do_install_append_keystone () {
 	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
 	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
-- 
2.7.4


