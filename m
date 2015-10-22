Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A12FFE00B44; Thu, 22 Oct 2015 10:00:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40C38E00AF6
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 10:00:52 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 68ED252A72; Thu, 22 Oct 2015 17:00:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151022170051.68ED252A72@arago-project.org>
Date: Thu, 22 Oct 2015 17:00:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : dspdce-fw: update recipe to build dspdce-fw from git source
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
X-List-Received-Date: Thu, 22 Oct 2015 17:00:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5f12d9f826344a8a27d9d77a4d1cb614ad4b8f2c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5f12d9f826344a8a27d9d77a4d1cb614ad4b8f2c

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Tue Oct 20 03:02:25 2015 +0000

dspdce-fw: update recipe to build dspdce-fw from git source

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb |   26 -----------
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb        |   61 +++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
deleted file mode 100644
index 777c221..0000000
--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=386d1802eefc2fcf00ab01a5b4556277"
-
-COMPATIBLE_MACHINE = "dra7xx-evm"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_05/exports/dspdce-${MACHINE}-1.00.00.05.tar.gz;protocol=ftp"
-
-S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
-
-SRC_URI[md5sum] = "4f3d5c6ef088019aa4804eaaedc8e949"
-SRC_URI[sha256sum] = "8d99c4f149613448a6d72c62a18cc7445c63c687b786658da1762c4e1c03a6a0"
-
-TARGET = "dra7-dsp1-fw.xe66"
-
-do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
-}
-
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
-
-INSANE_SKIP_${PN} = "arch"
-
-PR = "r1"
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
new file mode 100644
index 0000000..3beb4fb
--- /dev/null
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6ed75f22b1a2b7544b1c809d"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
+
+SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
+
+PV = "1.00.00.06"
+
+S = "${WORKDIR}/git"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+PR = "r0"
+inherit update-alternatives
+
+DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
+
+export HWVERSION = "ES10"
+export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
+
+export XDCVERSION = "ti-xdctools-tree"
+export BIOSVERSION = "ti-sysbios-tree"
+export IPCVERSION = "ti-ipc-tree"
+export CEVERSION = "ti-codec-engine-tree"
+export FCVERSION = "ti-framework-components-tree"
+export XDAISVERSION = "ti-xdais-tree"
+export OSALVERSION = "ti-osal-tree"
+
+export IPCSRC = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+export C66XCGTOOLSPATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+
+do_configure() {
+    cd ${S}
+    make unconfig
+    make vayu_config
+}
+
+do_compile() {
+    cd ${S}
+    make dspbin
+}
+
+TARGET = "dra7-dsp1-fw.xe66"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}
+}
+
+ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "/lib/firmware/${TARGET}"
+ALTERNATIVE_PRIORITY = "10"
+
+INSANE_SKIP_${PN} = "arch"
+
+FILES_${PN} += "${base_libdir}/firmware/*"


