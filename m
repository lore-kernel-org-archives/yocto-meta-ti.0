Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 498ADE00B84
	for <meta-ti@yoctoproject.org>; Sun, 13 Apr 2014 20:50:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4000IZT5CCB530@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 13 Apr 2014 22:50:51 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 189D7201BF; Sun,
	13 Apr 2014 23:50:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sun, 13 Apr 2014 23:50:22 -0400
Message-id: <1397447422-6936-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1397447422-6936-1-git-send-email-denis@denix.org>
References: <1397447422-6936-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 2/2] linux-ti-staging: add baseport, connectivity, ipc and systest config fragments
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
X-List-Received-Date: Mon, 14 Apr 2014 03:50:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux/linux-ti-staging/baseport_defconfig        |  8 ++++++++
 .../linux/linux-ti-staging/connectivity_defconfig    | 14 ++++++++++++++
 recipes-kernel/linux/linux-ti-staging/defconfig      |  4 ++++
 recipes-kernel/linux/linux-ti-staging/ipc_defconfig  | 18 ++++++++++++++++++
 .../linux/linux-ti-staging/systest_defconfig         | 20 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb        |  6 +++++-
 6 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging/baseport_defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging/ipc_defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging/systest_defconfig

diff --git a/recipes-kernel/linux/linux-ti-staging/baseport_defconfig b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
new file mode 100644
index 0000000..8dc24af
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/baseport_defconfig
@@ -0,0 +1,8 @@
+##################################################
+# Baseport Config Options
+##################################################
+CONFIG_CRYPTO_HW=y
+CONFIG_CRYPTO_DEV_OMAP_AES=y
+CONFIG_CRYPTO_DEV_OMAP_SHAM=y
+CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
new file mode 100644
index 0000000..bf18dae
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/connectivity_defconfig
@@ -0,0 +1,14 @@
+##################################################
+# Connectivity Configs
+##################################################
+CONFIG_MTD_NAND_OMAP_BCH=y
+CONFIG_MTD_TESTS=m
+CONFIG_SPI_SPIDEV=y
+CONFIG_USB_TEST=m
+CONFIG_USB_ACM=y
+CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_PRINTER=y
+CONFIG_USB_NET_AX8817X=y
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+CONFIG_USB_G_MULTI_CDC=y
diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-staging/defconfig
index 926b35a..2a920e8 100644
--- a/recipes-kernel/linux/linux-ti-staging/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging/defconfig
@@ -1 +1,5 @@
 use-kernel-config=omap2plus_defconfig
+config-fragment=baseport_defconfig
+config-fragment=connectivity_defconfig
+config-fragment=systest_defconfig
+config-fragment=ipc_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging/ipc_defconfig b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
new file mode 100644
index 0000000..645dfdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/ipc_defconfig
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
diff --git a/recipes-kernel/linux/linux-ti-staging/systest_defconfig b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
new file mode 100644
index 0000000..e21602f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/systest_defconfig
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
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 96be621..704d96b 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -40,11 +40,15 @@ SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
 PV = "3.12.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
+           file://baseport_defconfig \
+           file://connectivity_defconfig \
+           file://ipc_defconfig \
+           file://systest_defconfig \
           "
 
 # Disable SMP in defconfig on single-core platforms to reduce overhead
-- 
1.9.2


