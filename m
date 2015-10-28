Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A407DE00748; Wed, 28 Oct 2015 13:06:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8114CE0049B
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2015 13:06:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 42B1F52A8F; Wed, 28 Oct 2015 20:06:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151028200626.42B1F52A8F@arago-project.org>
Date: Wed, 28 Oct 2015 20:06:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : ipumm-fw: update recipe to build ipumm-fw from git source
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
X-List-Received-Date: Wed, 28 Oct 2015 20:06:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: b1b013c158dc172dbef850511a8a12e963714715
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b1b013c158dc172dbef850511a8a12e963714715

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Wed Oct 28 20:52:12 2015 +0000

ipumm-fw: update recipe to build ipumm-fw from git source

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb |   35 ---------------
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb        |   62 +++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 35 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
deleted file mode 100644
index f537179..0000000
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.09.01.bb
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
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=5803e271087f74d03239d868bebcc2c7"
-
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RDEPENDS_${PN} = " libdce"
-
-SRC_URI = "http://downloads.ti.com/infotainment/esd/jacinto6/glsdk/ipumm/3_00_09_01/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
-
-SRC_URI[md5sum] = "bf15624e26bdef4dbb67b98ccd8b9754"
-SRC_URI[sha256sum] = "e70a38b62e3e4d11d5ce68f0980de4df5256bd597068f179e220fa5afcd065fe"
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
-PR = "r0"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
new file mode 100644
index 0000000..af53c3c
--- /dev/null
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -0,0 +1,62 @@
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
+LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=036f6300761559fbc5ce7d06e1ccea5a"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+RDEPENDS_${PN} = " libdce"
+
+SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
+
+SRCREV = "7f15373c21a9a98b8881d81c3681c09e858a9d2c"
+
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
+    oe_runmake unconfig
+    oe_runmake vayu_smp_config
+}
+
+do_compile() {
+    oe_runmake
+}
+
+TARGET = "dra7-ipu2-fw.xem4"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
+PR = "r1"


