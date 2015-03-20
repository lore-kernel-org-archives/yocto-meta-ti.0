Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BA84E00858; Thu, 19 Mar 2015 20:52:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F27AE00777
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 20:52:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 87D6E5297F; Fri, 20 Mar 2015 03:52:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150320035215.87D6E5297F@arago-project.org>
Date: Fri, 20 Mar 2015 03:52:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ipumm-fw: split omap5-evm and dra7xx-evm recipes due to different versions
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
X-List-Received-Date: Fri, 20 Mar 2015 03:52:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ac2adc4032d0216ee5cae64cfe043671d3efa2f9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ac2adc4032d0216ee5cae64cfe043671d3efa2f9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Mar 20 08:24:05 2015 +0000

ipumm-fw: split omap5-evm and dra7xx-evm recipes due to different versions

The last version update left omap5-evm behind, which breaks the recipe.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb |   33 +++++++++++++++++++++++++++
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb |   26 ++++++--------------
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
new file mode 100644
index 0000000..f5ebd14
--- /dev/null
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
@@ -0,0 +1,33 @@
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    if "mmip" not in features:
+        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
+}
+
+DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
+LICENSE = "TI-TSPA"
+
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
+
+COMPATIBLE_MACHINE = "omap5-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-${PV}.tar.gz;protocol=http"
+
+SRC_URI[md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
+SRC_URI[sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
+
+S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
+
+TARGET = "ducati-m3-core0.xem3"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
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


