Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D0FCE0049B; Mon, 19 Oct 2015 14:02:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65ACCE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:02:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JL2U1I003025
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:02:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JL2Tna020488
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:02:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 16:02:30 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JL2Tos025361;	Mon, 19 Oct 2015 16:02:29 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 17:02:25 -0400
Message-ID: <1445288545-24107-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v5] dspdce-fw: add recipe to build dspdce-fw from git source and remove recipe which uses prebuilt firmware
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
X-List-Received-Date: Mon, 19 Oct 2015 21:02:37 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>

v5 changes: 
* Use "update-alternatives" for the target remotecore binary as
  opencl-monitor also provides the DSP firmware

---
 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb | 26 ------------
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb        | 61 +++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 26 deletions(-)
 delete mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
 create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb

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
index 0000000..8910d05
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
+export HWVERSION="ES10"
+export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
+
+export XDCVERSION="ti-xdctools-tree"
+export BIOSVERSION="ti-sysbios-tree"
+export IPCVERSION="ti-ipc-tree"
+export CEVERSION="ti-codec-engine-tree"
+export FCVERSION="ti-framework-components-tree"
+export XDAISVERSION="ti-xdais-tree"
+export OSALVERSION="ti-osal-tree"
+
+export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+export C66XCGTOOLSPATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
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
+TARGET="dra7-dsp1-fw.xe66"
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
-- 
1.9.1


