Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28E3DE00CA3; Fri,  1 Apr 2016 12:20:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP,
	but had no rDNS
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13D56E00AD7
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 12:20:53 -0700 (PDT)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Y001CQZ2DFY50@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 01 Apr 2016 14:20:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=y8WHj_DQv0qotnjlKgkA:9
Received: by 100.15.86.14 with SMTP id 02572332; Fri, 01 Apr 2016 19:20:37 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C4AED161F56;	Fri,
	1 Apr 2016 15:20:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 01 Apr 2016 15:20:36 -0400
Message-id: <1459538436-2414-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linux-ti-staging: add latest 4.4 version
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
X-List-Received-Date: Fri, 01 Apr 2016 19:20:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux/linux-ti-staging-4.4/defconfig           |  1 +
 .../linux/linux-ti-staging-4.4/keystone/defconfig  |  1 +
 .../linux/linux-ti-staging-rt-4.4/defconfig        |  1 +
 .../linux-ti-staging-rt-4.4/keystone/defconfig     |  1 +
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb    |  9 +++
 .../linux/linux-ti-staging-systest-4.4/defconfig   |  1 +
 .../keystone/defconfig                             |  1 +
 .../linux/linux-ti-staging-systest_4.4.bb          |  5 ++
 recipes-kernel/linux/linux-ti-staging_4.4.bb       | 91 ++++++++++++++++++++++
 9 files changed, 111 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest_4.4.bb
 create mode 100644 recipes-kernel/linux/linux-ti-staging_4.4.bb

diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
new file mode 100644
index 0000000..990e7f7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
new file mode 100644
index 0000000..470cf11
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
new file mode 100644
index 0000000..2091fca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/rt_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
new file mode 100644
index 0000000..6d28753
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/rt_multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
new file mode 100644
index 0000000..21b4392
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -0,0 +1,9 @@
+require linux-ti-staging_4.4.bb
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
+
+BRANCH = "ti-rt-linux-4.4.y"
+
+SRCREV = "0d355dc80c8c72d048c603c5e23d29a3d018c58b"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
new file mode 100644
index 0000000..cfe4f99
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
new file mode 100644
index 0000000..68cfc25
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.4.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.4.bb
new file mode 100644
index 0000000..d8e9779
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest_4.4.bb
@@ -0,0 +1,5 @@
+require linux-ti-staging_4.4.bb
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
new file mode 100644
index 0000000..ffd074a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -0,0 +1,91 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/cmem.inc
+require recipes-kernel/linux/ti-uio.inc
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
+RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
+
+# Add a run-time dependency for the VPE VPDMA firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
+
+# Install boot-monitor skern file into /boot dir of rootfs
+RDEPENDS_kernel-base_append_keystone = " boot-monitor"
+
+# Install ti-sci-fw into /boot dir of rootfs
+RDEPENDS_kernel-base_append_k2g-evm = " ti-sci-fw"
+
+# Add run-time dependency for SerDes firmware to the rootfs
+RDEPENDS_kernel-base_append_keystone = " serdes-fw"
+
+# Add run-time dependency for NETCP PA firmware to the rootfs
+RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2e-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
+
+# Add run-time dependency for PRU Ethernet firmware to the rootfs
+RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
+
+# Default is to package all dtb files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
+KERNEL_DEVICETREE_dra7xx-hs-evm = "${KERNEL_DEVICETREE_dra7xx-evm}"
+KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-idk.dtb am572x-idk.dtb"
+KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
+KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
+KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
+KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
+KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
+KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
+KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
+KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-lsk-linux-4.4.y"
+
+SRCREV = "08b8a2e93fac2471992ea3e110a3683a00f39d74"
+PV = "4.4.6+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
+
+# SoC specific config fragments are not enabled yet
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_dra7xx = " ${KERNEL_CONFIG_DIR}/dra7_only.cfg"
+
+MULTI_CONFIG_BASE_SUFFIX = ""
+
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig"
-- 
2.2.0


