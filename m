Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A7CDE0043F; Fri, 18 Jul 2014 12:38:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21901E00342
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 12:37:54 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X003DGAIZ18X0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 18 Jul 2014 14:37:48 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5D98A20087; Fri,
	18 Jul 2014 15:37:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 18 Jul 2014 15:37:45 -0400
Message-id: <1405712265-16158-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709056-30388-1-git-send-email-denis@denix.org>
References: <1405709056-30388-1-git-send-email-denis@denix.org>
Subject: [PATCH v3] linux-ti-staging: update to the latest source with new config fragments
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
X-List-Received-Date: Fri, 18 Jul 2014 19:38:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - updated with the latest 3.14.13 merge
v3 - another merge of audio-display tree

 recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg   | 18 ------------------
 .../linux/linux-ti-staging-3.14/systest.cfg          | 20 --------------------
 recipes-kernel/linux/linux-ti-staging_3.14.bb        | 13 +++++++------
 3 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/ipc.cfg
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/systest.cfg

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
-- 
2.0.0


