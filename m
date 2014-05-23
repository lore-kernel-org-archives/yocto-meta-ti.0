Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B67DBE009A7; Fri, 23 May 2014 12:18:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 926FBE00BE0
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 12:17:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1158552AAF; Fri, 23 May 2014 19:17:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140523191759.1158552AAF@arago-project.org>
Date: Fri, 23 May 2014 19:17:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : linux-ti-staging: Add version 3.15 of TI integration kernel
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
X-List-Received-Date: Fri, 23 May 2014 19:18:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 5548cad9ffb24e06f645c6c8ff843ba1b79c290d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5548cad9ffb24e06f645c6c8ff843ba1b79c290d

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Fri May 23 02:08:33 2014 +0000

linux-ti-staging: Add version 3.15 of TI integration kernel

* Add version 3.15 of the TI integration kernel.  Major changes
  from previous version are:
    * Config fragments now come primarily from the integration
      tree.  Removed baseport and connectivity fragments for now
      and the others can be removed as they are added to the
      integration tree.
    * Added a non-smp.cfg config to disable SMP for single core
      devices instead of using a patch to the defconfig file as
      we did in the past.
* Use the right SRCREV

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-3.15/defconfig          |    1 +
 recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg |   18 ++++++
 .../linux/linux-ti-staging-3.15/non-smp.cfg        |    5 ++
 .../linux/linux-ti-staging-3.15/systest.cfg        |   20 +++++++
 recipes-kernel/linux/linux-ti-staging_3.15.bb      |   59 ++++++++++++++++++++
 5 files changed, 103 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/defconfig b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
new file mode 100644
index 0000000..645dfdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
@@ -0,0 +1,18 @@
+##################################################
+# IPC config options
+##################################################
+CONFIG_IOMMU_API=y
+CONFIG_IOMMU_SUPPORT=y
+CONFIG_OF_IOMMU=y
+CONFIG_OMAP_IOMMU=y
+CONFIG_OMAP_IOVMM=y
+CONFIG_OMAP_IOMMU_DEBUG=y
+CONFIG_VIRTIO=m
+CONFIG_RPMSG=m
+CONFIG_RPMSG_RPC=m
+CONFIG_REMOTEPROC=m
+CONFIG_OMAP_REMOTEPROC=m
+CONFIG_OMAP_REMOTEPROC_IPU=y
+CONFIG_OMAP_REMOTEPROC_DSP=y
+CONFIG_OMAP_REMOTEPROC_IPU1=y
+CONFIG_OMAP_REMOTEPROC_DSP2=y
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
new file mode 100644
index 0000000..d61a413
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
@@ -0,0 +1,5 @@
+##################################################
+# Non-SMP config options
+##################################################
+CONFIG_SMP=n
+CONFIG_NR_CPUS=n
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
new file mode 100644
index 0000000..e21602f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
@@ -0,0 +1,20 @@
+##################################################
+# Systest config options
+##################################################
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEVKMEM=y
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
+CONFIG_DEBUG_KMEMLEAK_TEST=n
+CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_PM_DEBUG=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_USB_DEBUG=y
+CONFIG_SND_DEBUG=y
+CONFIG_RTC_DEBUG=y
diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
new file mode 100644
index 0000000..308a412
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
@@ -0,0 +1,59 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.15:"
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
+RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
+
+# Add a run-time dependency for the VPE VPDMA firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_dra7xx-evm = " vpe-vpdma-fw"
+
+# Default is to package all dtb files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-3.15.y"
+
+SRCREV = "3fd9aad17d3b4d1d7ee50ae788c0a096921e7216"
+PV = "3.14+3.15-rc6"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_CONFIG_DIR = "ti_config_fragments"
+KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = "${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = "${WORKDIR}/non-smp.cfg"
+
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+           file://ipc.cfg \
+           file://systest.cfg \
+           file://non-smp.cfg \
+          "


