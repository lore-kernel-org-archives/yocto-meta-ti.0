Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45FD4E009C3; Tue, 27 Oct 2015 09:05:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18806E00814
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 09:05:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RG5rM5032014
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 11:05:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RG5rkP024462
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 11:05:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 11:05:53 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9RG5qhs008009;	Tue, 27 Oct 2015 11:05:53 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Oct 2015 12:05:51 -0400
Message-ID: <1445961951-7182-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ipumm-fw: update recipe to build ipumm-fw from git source
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
X-List-Received-Date: Tue, 27 Oct 2015 16:05:58 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb | 46 ++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
index f537179..8b0dc21 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
@@ -9,27 +9,57 @@ python __anonymous() {
 DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=5803e271087f74d03239d868bebcc2c7"
+LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=036f6300761559fbc5ce7d06e1ccea5a"
 
 COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN} = " libdce"
 
-SRC_URI = "http://downloads.ti.com/infotainment/esd/jacinto6/glsdk/ipumm/3_00_09_01/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
+SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRC_URI[md5sum] = "bf15624e26bdef4dbb67b98ccd8b9754"
-SRC_URI[sha256sum] = "e70a38b62e3e4d11d5ce68f0980de4df5256bd597068f179e220fa5afcd065fe"
+SRCREV = "7f15373c21a9a98b8881d81c3681c09e858a9d2c"
 
-S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
+S = "${WORKDIR}/git"
+
+PV = "3.00.09.01"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ccsv6-native ti-ipc-rtos"
+
+export HWVERSION="ES10"
+export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
+
+export XDCVERSION="ti-xdctools-tree"
+export BIOSVERSION="ti-sysbios-tree"
+export IPCVERSION="ti-ipc-tree"
+export CEVERSION="ti-codec-engine-tree"
+export FCVERSION="ti-framework-components-tree"
+export XDAISVERSION="ti-xdais-tree"
+
+export TMS470CGTOOLPATH="${M4_TOOLCHAIN_INSTALL_DIR}"
+export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+
+do_configure() {
+    cd ${S}
+    make unconfig
+    make vayu_smp_config
+}
+
+
+do_compile() {
+    cd ${S}
+    make
+}
 
 TARGET = "dra7-ipu2-fw.xem4"
 
 do_install() {
         mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+        cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
 }
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r0"
+PR = "r1"
-- 
1.9.1


