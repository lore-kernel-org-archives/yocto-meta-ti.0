Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FD56E00832; Thu, 19 Mar 2015 19:24:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 104F4E00777
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 19:24:27 -0700 (PDT)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLH0048GO06MI60@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 19 Mar 2015 21:24:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=wThdOHh2xb0d3qu3XRYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8113720190;	Thu,
	19 Mar 2015 22:24:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 19 Mar 2015 22:24:05 -0400
Message-id: <1426818245-28403-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ipumm-fw: split omap5-evm and dra7xx-evm recipes due to different versions
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
X-List-Received-Date: Fri, 20 Mar 2015 02:24:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

The last version update left omap5-evm behind, which breaks the recipe.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...umm-fw_3.00.07.02.bb => ipumm-fw_3.00.04.02.bb} | 26 +++++++---------------
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb        | 26 +++++++---------------
 2 files changed, 16 insertions(+), 36 deletions(-)
 copy recipes-bsp/ipumm-fw/{ipumm-fw_3.00.07.02.bb => ipumm-fw_3.00.04.02.bb} (35%)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
similarity index 35%
copy from recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
copy to recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
index 5b85f83..f5ebd14 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
@@ -9,29 +9,19 @@ python __anonymous() {
 DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
-LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
-LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
 
-COMPATIBLE_MACHINE = "dra7xx|omap5-evm"
+COMPATIBLE_MACHINE = "omap5-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI_dra7xx = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-dra7xx-evm-3.00.07.02.tar.gz;protocol=ftp;name=dra7xx-evm"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-${PV}.tar.gz;protocol=http"
 
-SRC_URI_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
+SRC_URI[md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
+SRC_URI[sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
 
-# DRA7xx checksums
-SRC_URI[dra7xx-evm.md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
-SRC_URI[dra7xx-evm.sha256sum] = "0f07176e313a692a05fa6bfe9f7920b677b0924287121945c6e22b3f4408670c"
+S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
 
-# OMAP5 checksums
-SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
-SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
-
-S_dra7xx = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
-S_omap5-evm = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
-
-TARGET_dra7xx = "dra7-ipu2-fw.xem4"
-TARGET_omap5-evm = "ducati-m3-core0.xem3"
+TARGET = "ducati-m3-core0.xem3"
 
 do_install() {
         mkdir -p ${D}${base_libdir}/firmware
@@ -40,4 +30,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r2"
+PR = "r3"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
index 5b85f83..036ea33 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
@@ -9,29 +9,19 @@ python __anonymous() {
 DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
-LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
-LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
 
-COMPATIBLE_MACHINE = "dra7xx|omap5-evm"
+COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI_dra7xx = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-dra7xx-evm-3.00.07.02.tar.gz;protocol=ftp;name=dra7xx-evm"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-${MACHINE}-${PV}.tar.gz;protocol=http"
 
-SRC_URI_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
+SRC_URI[md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
+SRC_URI[sha256sum] = "0f07176e313a692a05fa6bfe9f7920b677b0924287121945c6e22b3f4408670c"
 
-# DRA7xx checksums
-SRC_URI[dra7xx-evm.md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
-SRC_URI[dra7xx-evm.sha256sum] = "0f07176e313a692a05fa6bfe9f7920b677b0924287121945c6e22b3f4408670c"
+S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
 
-# OMAP5 checksums
-SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
-SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
-
-S_dra7xx = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
-S_omap5-evm = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
-
-TARGET_dra7xx = "dra7-ipu2-fw.xem4"
-TARGET_omap5-evm = "ducati-m3-core0.xem3"
+TARGET = "dra7-ipu2-fw.xem4"
 
 do_install() {
         mkdir -p ${D}${base_libdir}/firmware
@@ -40,4 +30,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r2"
+PR = "r3"
-- 
2.2.0


