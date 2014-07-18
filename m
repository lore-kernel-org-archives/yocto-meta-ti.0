Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94582E003FA; Fri, 18 Jul 2014 13:48:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54F71E00342
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 13:48:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5B2A752A50; Fri, 18 Jul 2014 20:47:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140718204759.5B2A752A50@arago-project.org>
Date: Fri, 18 Jul 2014 20:47:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest source with new config fragments
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
X-List-Received-Date: Fri, 18 Jul 2014 20:48:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 6070bc9d97178983f2c912c28972e481c55de71f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6070bc9d97178983f2c912c28972e481c55de71f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jul 19 01:37:45 2014 +0000

linux-ti-staging: update to the latest source with new config fragments

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg |   18 ------------------
 .../linux/linux-ti-staging-3.14/systest.cfg        |   20 --------------------
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |   13 +++++++------
 3 files changed, 7 insertions(+), 44 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
deleted file mode 100644
index 645dfdf..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
+++ /dev/null
@@ -1,18 +0,0 @@
-##################################################
-# IPC config options
-##################################################
-CONFIG_IOMMU_API=y
-CONFIG_IOMMU_SUPPORT=y
-CONFIG_OF_IOMMU=y
-CONFIG_OMAP_IOMMU=y
-CONFIG_OMAP_IOVMM=y
-CONFIG_OMAP_IOMMU_DEBUG=y
-CONFIG_VIRTIO=m
-CONFIG_RPMSG=m
-CONFIG_RPMSG_RPC=m
-CONFIG_REMOTEPROC=m
-CONFIG_OMAP_REMOTEPROC=m
-CONFIG_OMAP_REMOTEPROC_IPU=y
-CONFIG_OMAP_REMOTEPROC_DSP=y
-CONFIG_OMAP_REMOTEPROC_IPU1=y
-CONFIG_OMAP_REMOTEPROC_DSP2=y
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg
deleted file mode 100644
index e21602f..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg
+++ /dev/null
@@ -1,20 +0,0 @@
-##################################################
-# Systest config options
-##################################################
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_KMEMLEAK=y
-CONFIG_DEVKMEM=y
-CONFIG_HAVE_DEBUG_KMEMLEAK=y
-CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
-CONFIG_DEBUG_KMEMLEAK_TEST=n
-CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
-CONFIG_DEBUG_LOCK_ALLOC=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_PM_DEBUG=y
-CONFIG_DEBUG_GPIO=y
-CONFIG_USB_DEBUG=y
-CONFIG_SND_DEBUG=y
-CONFIG_RTC_DEBUG=y
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 8c12bad..fd8e1f2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -45,21 +45,22 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "9d00dd1187099b0841125220c7432a3507e5b5fa"
-PV = "3.14.8"
+SRCREV = "fc907b1464b03aa571a1003020bf711da041e5aa"
+PV = "3.14.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_CONFIG_DIR = "ti_config_fragments"
-KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
+KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
+KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFIG_DIR}/baseport.cfg \
+                           ${KERNEL_CONFIG_DIR}/connectivity.cfg ${KERNEL_CONFIG_DIR}/ipc.cfg \
+                           ${KERNEL_CONFIG_DIR}/power.cfg"
+
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-           file://ipc.cfg \
-           file://systest.cfg \
            file://non-smp.cfg \
           "


