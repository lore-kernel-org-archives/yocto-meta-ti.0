Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F9BDE00951; Tue,  8 Mar 2016 15:44:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9ED42E00A27
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2638A52AD2; Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234430.2638A52AD2@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ipumm-fw: remove old versions
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3464972e794ff923155d56b5f2f52271862b0b98
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3464972e794ff923155d56b5f2f52271862b0b98

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Mar  9 00:18:11 2016 +0000

ipumm-fw: remove old versions

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb |   35 ---------------------------
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb |   35 ---------------------------
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb |   33 -------------------------
 3 files changed, 0 insertions(+), 103 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
deleted file mode 100644
index 642c94c..0000000
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
-}
-
-DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
-LICENSE = "TI-TSPA"
-
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
-
-COMPATIBLE_MACHINE = "omap5-evm"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = " libdce"
-
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-${PV}.tar.gz;protocol=http"
-
-SRC_URI[md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
-SRC_URI[sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65"
-
-S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
-
-TARGET = "ducati-m3-core0.xem3"
-
-do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
-
-PR = "r4"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
deleted file mode 100644
index 576931f..0000000
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
-}
-
-DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
-LICENSE = "TI-TSPA"
-
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
-
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = " libdce"
-
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
-
-SRC_URI[md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
-SRC_URI[sha256sum] = "0f07176e313a692a05fa6bfe9f7920b677b0924287121945c6e22b3f4408670c"
-
-S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
-
-TARGET = "dra7-ipu2-fw.xem4"
-
-do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
-
-PR = "r5"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
deleted file mode 100644
index 81de45e..0000000
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-python __anonymous() {
-    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
-    if not features:
-        return
-    if "mmip" not in features:
-        raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
-}
-
-DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
-LICENSE = "TI-TSPA"
-
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=57d49afcca8f1be47b1c4e79aa06b3ba"
-
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = "libdce"
-
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_08_01/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
-
-SRC_URI[md5sum] = "a1873333e7676ec1b7fcb18fb8b90696"
-SRC_URI[sha256sum] = "d583d827191a3772f496145cbf81747e10e7ed553d4653379576ac891019d7fb"
-
-S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
-
-TARGET = "dra7-ipu2-fw.xem4"
-
-do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"


