Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C198E009CA; Thu,  2 Feb 2017 15:35:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 513D2E009A0
	for <meta-ti@yoctoproject.org>; Thu,  2 Feb 2017 15:35:29 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4D41852B43; Thu,  2 Feb 2017 23:35:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170202233528.4D41852B43@arago-project.org>
Date: Thu,  2 Feb 2017 23:35:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add version 4.9.7
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
X-List-Received-Date: Thu, 02 Feb 2017 23:35:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c481cfe32a708012efe0a42ca3724e7a113f2205
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c481cfe32a708012efe0a42ca3724e7a113f2205

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  2 04:36:54 2017 +0000

linux-ti-staging: add version 4.9.7

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-4.9/defconfig           |    1 +
 .../linux/linux-ti-staging-4.9/dra7xx/defconfig    |    1 +
 .../linux/linux-ti-staging-4.9/k2g/defconfig       |    1 +
 .../linux/linux-ti-staging-4.9/keystone/defconfig  |    1 +
 .../linux/linux-ti-staging-4.9/ti33x/defconfig     |    1 +
 .../linux/linux-ti-staging-4.9/ti43x/defconfig     |    1 +
 .../linux/linux-ti-staging-rt-4.9/defconfig        |    1 +
 .../linux/linux-ti-staging-rt-4.9/dra7xx/defconfig |    1 +
 .../linux/linux-ti-staging-rt-4.9/k2g/defconfig    |    1 +
 .../linux-ti-staging-rt-4.9/keystone/defconfig     |    1 +
 .../linux/linux-ti-staging-rt-4.9/ti33x/defconfig  |    1 +
 .../linux/linux-ti-staging-rt-4.9/ti43x/defconfig  |    1 +
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb    |    9 +++
 .../linux/linux-ti-staging-systest-4.9/defconfig   |    1 +
 .../linux-ti-staging-systest-4.9/dra7xx/defconfig  |    1 +
 .../linux-ti-staging-systest-4.9/k2g/defconfig     |    1 +
 .../keystone/defconfig                             |    1 +
 .../linux-ti-staging-systest-4.9/ti33x/defconfig   |    1 +
 .../linux-ti-staging-systest-4.9/ti43x/defconfig   |    1 +
 .../linux/linux-ti-staging-systest_4.9.bb          |    5 ++
 recipes-kernel/linux/linux-ti-staging_4.9.bb       |   66 ++++++++++++++++++++
 21 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/defconfig
new file mode 100644
index 0000000..d083d18
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_omap2_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/dra7xx/defconfig
new file mode 100644
index 0000000..dcb53ba
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/dra7xx/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dra7x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/k2g/defconfig
new file mode 100644
index 0000000..316b04b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/k2g/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/keystone/defconfig
new file mode 100644
index 0000000..5a40b93
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/keystone/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/ti33x/defconfig
new file mode 100644
index 0000000..88f80fa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/ti33x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am3x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/ti43x/defconfig
new file mode 100644
index 0000000..4b9daaf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/ti43x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am4x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.9/defconfig
new file mode 100644
index 0000000..f0b8bab
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.9/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_omap2_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.9/dra7xx/defconfig
new file mode 100644
index 0000000..47e3d04
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.9/dra7xx/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dra7x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.9/k2g/defconfig
new file mode 100644
index 0000000..a9c24f2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.9/k2g/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_k2g_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.9/keystone/defconfig
new file mode 100644
index 0000000..fc68085
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.9/keystone/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_keystone_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti33x/defconfig
new file mode 100644
index 0000000..0a4fbac
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti33x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am3x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti43x/defconfig
new file mode 100644
index 0000000..99594c8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.9/ti43x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am4x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
new file mode 100644
index 0000000..b9d93b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -0,0 +1,9 @@
+require linux-ti-staging_4.9.bb
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
+
+BRANCH = "ti-rt-linux-4.9.y"
+
+SRCREV = "9515cdeb59f8f504c1fdcd67ef9118ff202e7c88"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/defconfig
new file mode 100644
index 0000000..5d051bd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_omap2_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/dra7xx/defconfig
new file mode 100644
index 0000000..2b3635c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/dra7xx/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dra7x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/k2g/defconfig
new file mode 100644
index 0000000..abfb330
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/k2g/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_k2g_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/keystone/defconfig
new file mode 100644
index 0000000..e95bcf9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/keystone/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_keystone_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti33x/defconfig
new file mode 100644
index 0000000..9ab6733
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti33x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am3x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti43x/defconfig
new file mode 100644
index 0000000..825c31c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/ti43x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am4x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.9.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.9.bb
new file mode 100644
index 0000000..c53f94c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest_4.9.bb
@@ -0,0 +1,5 @@
+require linux-ti-staging_4.9.bb
+
+# Look in the generic major.minor directory for files
+# This will have priority over generic non-rt path
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
new file mode 100644
index 0000000..791d647
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -0,0 +1,66 @@
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
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add run-time dependency for PM firmware to the rootfs
+RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
+RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
+
+# Add run-time dependency for VPE VPDMA firmware to the rootfs
+RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
+
+# Add run-time dependency for Goodix firmware to the rootfs
+RDEPENDS_kernel-base_append_dra7xx = " goodix-fw"
+
+# Install boot-monitor skern file into /boot dir of rootfs
+RDEPENDS_kernel-base_append_keystone = " boot-monitor"
+
+# Install ti-sci-fw into /boot dir of rootfs
+RDEPENDS_kernel-base_append_k2g = " ti-sci-fw"
+
+# Add run-time dependency for SerDes firmware to the rootfs
+RDEPENDS_kernel-base_append_keystone = " serdes-fw"
+
+# Add run-time dependency for QMSS PDSP firmware to the rootfs
+RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
+
+# Add run-time dependency for NETCP PA firmware to the rootfs
+RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
+
+# Add run-time dependency for PRU Ethernet firmware to the rootfs
+RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_am335x-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_k2g = " prueth-fw"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-lsk-linux-4.9.y"
+
+SRCREV = "20e747cb77b81fce68c4b7ee3cfa24e10aedf484"
+PV = "4.9.7+git${SRCPV}"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig"


