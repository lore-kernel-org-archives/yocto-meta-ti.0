Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFC16E00A44; Tue,  6 May 2014 15:41:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E87B2E00480
	for <meta-ti@yoctoproject.org>; Tue,  6 May 2014 15:41:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BF00E529B3; Tue,  6 May 2014 22:41:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140506224144.BF00E529B3@arago-project.org>
Date: Tue,  6 May 2014 22:41:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add baseport, connectivity, ipc and systest config fragments
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
X-List-Received-Date: Tue, 06 May 2014 22:41:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 788da6f205f69c959d03df390612f6c906caa1f4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=788da6f205f69c959d03df390612f6c906caa1f4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr 26 05:41:01 2014 +0000

linux-ti-staging: add baseport, connectivity, ipc and systest config fragments

Do not apply systest fragment by default on the production build.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/linux-ti-staging/baseport.cfg |    8 ++++++++
 .../linux/linux-ti-staging/connectivity.cfg        |   14 ++++++++++++++
 recipes-kernel/linux/linux-ti-staging/ipc.cfg      |   18 ++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging/systest.cfg  |   20 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    8 +++++++-
 5 files changed, 67 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging/baseport.cfg b/recipes-kernel/linux/linux-ti-staging/baseport.cfg
new file mode 100644
index 0000000..8dc24af
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/baseport.cfg
@@ -0,0 +1,8 @@
+##################################################
+# Baseport Config Options
+##################################################
+CONFIG_CRYPTO_HW=y
+CONFIG_CRYPTO_DEV_OMAP_AES=y
+CONFIG_CRYPTO_DEV_OMAP_SHAM=y
+CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity.cfg b/recipes-kernel/linux/linux-ti-staging/connectivity.cfg
new file mode 100644
index 0000000..bf18dae
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/connectivity.cfg
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
diff --git a/recipes-kernel/linux/linux-ti-staging/ipc.cfg b/recipes-kernel/linux/linux-ti-staging/ipc.cfg
new file mode 100644
index 0000000..645dfdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/ipc.cfg
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
diff --git a/recipes-kernel/linux/linux-ti-staging/systest.cfg b/recipes-kernel/linux/linux-ti-staging/systest.cfg
new file mode 100644
index 0000000..e21602f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/systest.cfg
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
index 96be621..154d2fc 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -40,11 +40,17 @@ SRCREV = "f0d4672333685697320f4907d5b4d3919121c299"
 PV = "3.12.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
+KERNEL_CONFIG_FRAGMENTS = "baseport.cfg connectivity.cfg ipc.cfg"
+
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
+           file://baseport.cfg \
+           file://connectivity.cfg \
+           file://ipc.cfg \
+           file://systest.cfg \
           "
 
 # Disable SMP in defconfig on single-core platforms to reduce overhead


