Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6132E007F2; Tue,  8 Mar 2016 10:18:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53D17E006AD
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 10:18:33 -0800 (PST)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3Q00AHAG6DM150@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 08 Mar 2016 12:18:13 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=xaWXGEOsqLxfkzY7OEEA:9
Received: by 100.15.86.14 with SMTP id 3a609104; Tue, 08 Mar 2016 18:18:13 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E4F1F161F14;	Tue,
	8 Mar 2016 13:18:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 08 Mar 2016 13:18:11 -0500
Message-id: <1457461092-9580-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] ipumm-fw: remove old versions
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
X-List-Received-Date: Tue, 08 Mar 2016 18:18:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb | 35 -----------------------------
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb | 35 -----------------------------
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb | 33 ---------------------------
 3 files changed, 103 deletions(-)
 delete mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
 delete mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
 delete mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb

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
-- 
2.2.0


