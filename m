Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.20673.1643238549357613498
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FB6140CB5;
	Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXmhmHeKAmBn; Wed, 26 Jan 2022 23:09:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3557640CB6;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1EC4717472D;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 05/19] linuxutils: remove Linux Utils helper package
Date: Wed, 26 Jan 2022 18:08:45 -0500
Message-Id: <1643238539-20686-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Linux Utils were used mainly by DMAI on deprecated DaVinci and OMAP3
platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/includes/ti-paths.inc                   |  3 -
 recipes-ti/linuxutils/ti-linuxutils.inc            | 93 ----------------------
 .../ti-linuxutils/linuxutils-BKL-fix-2.patch       | 22 -----
 .../ti-linuxutils/linuxutils-BKL-fix.patch         | 73 -----------------
 .../linuxutils_2_26-cmemk-fixes.patch              | 59 --------------
 .../linuxutils_2_26-sdmak-fixes.patch              | 25 ------
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  | 17 ----
 7 files changed, 292 deletions(-)
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils.inc
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index e553003..d226c4a 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -9,7 +9,6 @@ export BIOSUTILS_INSTALL_DIR_RECIPE  = "${installdir}/ti-biosutils-tree"
 export C6ACCEL_INSTALL_DIR_RECIPE    = "${installdir}/ti-c6accel-tree"
 export C6RUN_INSTALL_DIR_RECIPE      = "${installdir}/ti-c6run-tree"
 export CE_INSTALL_DIR_RECIPE         = "${installdir}/ti-codec-engine-tree"
-export CMEM_INSTALL_DIR_RECIPE       = "${installdir}/ti-linuxutils-tree"
 export CODEC_INSTALL_DIR_RECIPE      = "${installdir}/ti-codecs-tree"
 export CODEGEN_ARM_INSTALL_DIR_RECIPE= "${installdir}/ti-cgt470-tree"
 export CODEGEN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt6x-tree"
@@ -29,7 +28,6 @@ export HDVICP20_INSTALL_DIR_RECIPE   = "${installdir}/ti-hdvicp20-tree"
 export IMGLIB_C64P_INSTALL_DIR_RECIPE= "${installdir}/ti-imglib-tree"
 export IPC_INSTALL_DIR_RECIPE        = "${installdir}/ti-ipc-tree"
 export LINK_INSTALL_DIR_RECIPE       = "${installdir}/ti-dsplink-tree"
-export LINUXUTILS_INSTALL_DIR_RECIPE = "${installdir}/ti-linuxutils-tree"
 export LPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-local-power-manager-tree"
 export NDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-ndk-tree"
 export NS_INSTALL_DIR_RECIPE              = "${installdir}/ti-ns-tree"
@@ -82,7 +80,6 @@ export HDVICP20_INSTALL_DIR   = "${STAGING_DIR_TARGET}${HDVICP20_INSTALL_DIR_REC
 export IMGLIB_C64P_INSTALL_DIR= "${STAGING_DIR_TARGET}${IMGLIB_C64P_INSTALL_DIR_RECIPE}"
 export IPC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${IPC_INSTALL_DIR_RECIPE}"
 export LINK_INSTALL_DIR       = "${STAGING_DIR_TARGET}${LINK_INSTALL_DIR_RECIPE}"
-export LINUXUTILS_INSTALL_DIR = "${STAGING_DIR_TARGET}${LINUXUTILS_INSTALL_DIR_RECIPE}"
 export LPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${LPM_INSTALL_DIR_RECIPE}"
 export NDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${NDK_INSTALL_DIR_RECIPE}"
 export NS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${NS_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
deleted file mode 100644
index c461418..0000000
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ /dev/null
@@ -1,93 +0,0 @@
-DESCRIPTION = "MFP Linux utils for TI ARM/DSP processors"
-SECTION = "devel"
-LICENSE = "GPLv2 & BSD"
-
-BASE_SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/linuxutils/${PV}/exports"
-SRC_URI = "${BASE_SRC_URI}/linuxutils_${PV}.tar.gz "
-
-LIC_FILES_CHKSUM = "file://gpl_2.0.txt;md5=1298794fc2eed3df92a89f3c9d317440"
-
-S = "${WORKDIR}/linuxutils_${PV}"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PR = "${MACHINE_KERNEL_PR}"
-
-#This is a kernel module, don't set PR directly
-MACHINE_KERNEL_PR:append = "f"
-
-inherit module
-
-do_compile() {
-    do_make_scripts
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-
-    case "${SOC_FAMILY}" in
-    "dm365")
-            modules="cmem edma irq";;
-    "omap3")
-            modules="cmem sdma";;
-    "dm355")
-            modules="cmem edma irq";;
-    *)
-            modules="cmem"
-    esac
-
-    for module in $modules ; do
-    cd ${S}/packages/ti/sdo/linuxutils/$module
-    make \
-      LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" \
-      MVTOOL_PREFIX="${TARGET_PREFIX}" \
-      UCTOOL_PREFIX="${TARGET_PREFIX}" \
-      clean debug release
-    done
-}
-
-do_install () {
-    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
-    # Install CMEM
-    for module in $(find ${S}/packages/ti/sdo/linuxutils/ -name "*.ko") ; do
-        install -m 0755 $module ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
-    done
-    cd ${S}/packages/ti/sdo/linuxutils/cmem/apps
-    make \
-      LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" \
-      MVTOOL_PREFIX="${TARGET_PREFIX}" \
-      UCTOOL_PREFIX="${TARGET_PREFIX}" \
-      EXEC_DIR="${D}${installdir}/ti-linuxutils-app/cmem-app" \
-      install
-    # Install EDMA
-    if [ "${SOC_FAMILY}" = "dm365" ] ; then
-        cd ${S}/packages/ti/sdo/linuxutils/edma/apps
-        make \
-         LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" \
-         MVTOOL_PREFIX="${TARGET_PREFIX}" \
-         UCTOOL_PREFIX="${TARGET_PREFIX}" \
-         EXEC_DIR="${D}${installdir}/ti-linuxutils-app/edma-app" \
-         install
-    fi
-
-    # stage tree - other packages may need this
-    install -d ${D}${LINUXUTILS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${LINUXUTILS_INSTALL_DIR_RECIPE}
-}
-
-
-
-
-PACKAGES =+ " ti-cmem-module \
-              ti-sdma-module \
-              ti-edma-module \
-              ti-irq-module \
-              ti-linuxutils-app"
-
-FILES:ti-cmem-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/cmem*.ko"
-FILES:ti-sdma-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/sdma*.ko"
-FILES:ti-edma-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/edma*.ko"
-FILES:ti-irq-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/irq*.ko"
-
-FILES:ti-linuxutils-app = "${installdir}/ti-linuxutils-app/*/*"
-
-INSANE_SKIP:ti-linuxutils-app = "True"
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.patch
deleted file mode 100644
index 1438003..0000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From: Koen Kooi <k-kooi@ti.com>
-Subject: linuxutils: fix build with 2.6.37rcX
-
----
-
---- /tmp/sdmak.c	2010-12-05 18:43:55.000000000 +0100
-+++ linuxutils_2_25_05_11/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c	2010-12-05 18:48:31.000000000 +0100
-@@ -208,9 +208,12 @@
-             }
- 
-             up_read(&current->mm->mmap_sem);
--
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
-+            sema_init(&(channels[channel].mutex),1);
-+#else
-             init_MUTEX_LOCKED(&(channels[channel].mutex));
--            channels[channel].owner = filp;
-+#endif
-+			channels[channel].owner = filp;
- 
-             if (copy_to_user(argp, &channel, sizeof(channel))) {
-                 return -EFAULT;
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch
deleted file mode 100644
index 29b0a44..0000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From: Koen Kooi <k-kooi@ti.com>
-Subject: linuxutils: fix build with 2.6.37rcX
-
----
-
---- /tmp/cmemk.c	2010-12-05 18:41:00.000000000 +0100
-+++ linuxutils_2_25_05_11/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c	2010-12-05 18:43:24.000000000 +0100
-@@ -31,6 +31,7 @@
- #include <linux/seq_file.h>
- #include <linux/vmalloc.h>
- #include <linux/sched.h>
-+#include <linux/slab.h>
- #include <asm/cacheflush.h>
- #include <asm/uaccess.h>
- #include <asm/pgtable.h>
-@@ -204,7 +205,11 @@
-     "\n\t\t fall back to a heap-based allocation attempt");
- module_param(useHeapIfPoolUnavailable, int, S_IRUGO);
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
-+static DEFINE_SEMAPHORE(cmem_mutex);
-+#else
- static DECLARE_MUTEX(cmem_mutex);
-+#endif
- 
- /* Describes a pool buffer */
- typedef struct pool_buffer {
-@@ -243,8 +248,12 @@
- 
- static struct file_operations cmem_fxns = {
-     owner:   THIS_MODULE,
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
-+    unlocked_ioctl: ioctl,
-+#else
-     ioctl:   ioctl,
--    mmap:    mmap,
-+#endif
-+	mmap:    mmap,
-     open:    open,
-     release: release
- };
---- /tmp/sdmak.c	2010-12-05 18:43:55.000000000 +0100
-+++ linuxutils_2_25_05_11/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c	2010-12-05 18:48:31.000000000 +0100
-@@ -208,9 +208,12 @@
-             }
- 
-             up_read(&current->mm->mmap_sem);
--
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
-+            sema_init(&(channels[channel].mutex),1);
-+#else
-             init_MUTEX_LOCKED(&(channels[channel].mutex));
--            channels[channel].owner = filp;
-+#endif
-+			channels[channel].owner = filp;
- 
-             if (copy_to_user(argp, &channel, sizeof(channel))) {
-                 return -EFAULT;
-@@ -286,8 +289,12 @@
- }
- 
- static struct file_operations fops = {
--    .ioctl = dma_ioctl,
--    .release = dma_release,
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
-+    .unlocked_ioctl = dma_ioctl,
-+#else
-+	.ioctl = dma_ioctl,
-+#endif
-+	.release = dma_release,
-     .owner = THIS_MODULE
- };
- 
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
deleted file mode 100644
index 3ce66f8..0000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Index: linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
-===================================================================
---- linuxutils_2_26_01_02.orig/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
-+++ linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
-@@ -31,6 +31,7 @@
- #include <linux/seq_file.h>
- #include <linux/vmalloc.h>
- #include <linux/sched.h>
-+#include <linux/slab.h>
- #include <asm/cacheflush.h>
- #include <asm/uaccess.h>
- #include <asm/pgtable.h>
-@@ -1072,7 +1073,7 @@ static int set_noncached(struct vm_area_
- {
-     vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
- 
--    vma->vm_flags |= VM_RESERVED | VM_IO;
-+    vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
- 
-     if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
-                         vma->vm_end - vma->vm_start, vma->vm_page_prot)) {
-@@ -1095,7 +1096,7 @@ static int set_cached(struct vm_area_str
-                                 );
- #endif
- 
--    vma->vm_flags |= VM_RESERVED | VM_IO;
-+    vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
- 
-     if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
-                         vma->vm_end - vma->vm_start, vma->vm_page_prot)) {
-@@ -2062,8 +2063,13 @@ int __init cmem_init(void)
-         block_avail_size[bi] = length;
- 
-         /* attempt to determine the end of Linux kernel memory */
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 11, 0)
-         phys_end_kernel = virt_to_phys((void *)PAGE_OFFSET) +
-                    (num_physpages << PAGE_SHIFT);
-+#else
-+        phys_end_kernel = virt_to_phys((void *)PAGE_OFFSET) +
-+                   (get_num_physpages() << PAGE_SHIFT);
-+#endif
- 
-         if (phys_end_kernel > block_start[bi]) {
-             if (allowOverlap == 0) {
-@@ -2186,10 +2192,14 @@ int __init cmem_init(void)
-     }
- 
-     /* Create the /proc entry */
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
-     cmem_proc_entry = create_proc_entry("cmem", 0, NULL);
-     if (cmem_proc_entry) {
-         cmem_proc_entry->proc_fops = &cmem_proc_ops;
-     }
-+#else
-+    cmem_proc_entry = proc_create_data("cmem", 0, NULL, &cmem_proc_ops, NULL);
-+#endif
- 
-     mutex_init(&cmem_mutex);
- 
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch
deleted file mode 100644
index 5ec85fc..0000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c
-===================================================================
---- linuxutils_2_26_01_02.orig/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c
-+++ linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c
-@@ -44,7 +44,7 @@
- #include <mach/hardware.h>
- #include <mach/dma.h>
- #include <mach/tc.h>
--#else
-+#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0)
- #include <plat/hardware.h>
- #include <plat/dma.h>
- #include <plat/tc.h>
-@@ -97,6 +97,11 @@
- 
- #endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) */
- 
-+#ifndef OMAP_DMA_NO_DEVICE
-+#include <linux/omap-dma.h>
-+#define OMAP_DMA_NO_DEVICE	0
-+#endif
-+
- #include "../interface/sdma.h"
- 
- struct channel {
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
deleted file mode 100644
index 97aebd4..0000000
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require ti-linuxutils.inc
-
-SRC_URI += "file://linuxutils-BKL-fix-2.patch \
-			file://linuxutils_2_26-cmemk-fixes.patch \
-			file://linuxutils_2_26-sdmak-fixes.patch \
-	"
-
-PE = "1"
-PV = "2_26_01_02"
-
-SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
-SRC_URI[sha256sum] = "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
-
-INSANE_SKIP:${PN} = "installed-vs-shipped"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
-- 
2.7.4

