Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8964.1645503198069886866
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8475C40C30
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cr6l8kvhcYwn for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81DE740C2E
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 22908174770
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 05/19] linuxutils: remove Linux Utils helper package
Date: Tue, 22 Feb 2022 04:13:00 +0000
Message-Id: <20220222041314.2840028-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Linux Utils were used mainly by DMAI on deprecated DaVinci and OMAP3
platforms.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/includes/ti-paths.inc              |  3 -
 recipes-ti/linuxutils/ti-linuxutils.inc       | 93 -------------------
 .../ti-linuxutils/linuxutils-BKL-fix-2.patch  | 22 -----
 .../ti-linuxutils/linuxutils-BKL-fix.patch    | 73 ---------------
 .../linuxutils_2_26-cmemk-fixes.patch         | 59 ------------
 .../linuxutils_2_26-sdmak-fixes.patch         | 25 -----
 .../linuxutils/ti-linuxutils_2.26.01.02.bb    | 17 ----
 7 files changed, 292 deletions(-)
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils.inc
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fi=
x-2.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fi=
x.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-c=
memk-fixes.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-s=
dmak-fixes.patch
 delete mode 100644 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
index e5530037..d226c4af 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -9,7 +9,6 @@ export BIOSUTILS_INSTALL_DIR_RECIPE  =3D "${installdir}/t=
i-biosutils-tree"
 export C6ACCEL_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-c6accel-tree"
 export C6RUN_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-c6run-tree"
 export CE_INSTALL_DIR_RECIPE         =3D "${installdir}/ti-codec-engine-=
tree"
-export CMEM_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-linuxutils-tr=
ee"
 export CODEC_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-codecs-tree"
 export CODEGEN_ARM_INSTALL_DIR_RECIPE=3D "${installdir}/ti-cgt470-tree"
 export CODEGEN_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-cgt6x-tree"
@@ -29,7 +28,6 @@ export HDVICP20_INSTALL_DIR_RECIPE   =3D "${installdir}=
/ti-hdvicp20-tree"
 export IMGLIB_C64P_INSTALL_DIR_RECIPE=3D "${installdir}/ti-imglib-tree"
 export IPC_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-ipc-tree"
 export LINK_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-dsplink-tree"
-export LINUXUTILS_INSTALL_DIR_RECIPE =3D "${installdir}/ti-linuxutils-tr=
ee"
 export LPM_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-local-power-m=
anager-tree"
 export NDK_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-ndk-tree"
 export NS_INSTALL_DIR_RECIPE              =3D "${installdir}/ti-ns-tree"
@@ -82,7 +80,6 @@ export HDVICP20_INSTALL_DIR   =3D "${STAGING_DIR_TARGET=
}${HDVICP20_INSTALL_DIR_REC
 export IMGLIB_C64P_INSTALL_DIR=3D "${STAGING_DIR_TARGET}${IMGLIB_C64P_IN=
STALL_DIR_RECIPE}"
 export IPC_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${IPC_INSTALL_DI=
R_RECIPE}"
 export LINK_INSTALL_DIR       =3D "${STAGING_DIR_TARGET}${LINK_INSTALL_D=
IR_RECIPE}"
-export LINUXUTILS_INSTALL_DIR =3D "${STAGING_DIR_TARGET}${LINUXUTILS_INS=
TALL_DIR_RECIPE}"
 export LPM_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${LPM_INSTALL_DI=
R_RECIPE}"
 export NDK_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${NDK_INSTALL_DI=
R_RECIPE}"
 export NS_INSTALL_DIR         =3D "${STAGING_DIR_TARGET}${NS_INSTALL_DIR=
_RECIPE}"
diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxut=
ils/ti-linuxutils.inc
deleted file mode 100644
index c461418f..00000000
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ /dev/null
@@ -1,93 +0,0 @@
-DESCRIPTION =3D "MFP Linux utils for TI ARM/DSP processors"
-SECTION =3D "devel"
-LICENSE =3D "GPLv2 & BSD"
-
-BASE_SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/t=
argetcontent/linuxutils/${PV}/exports"
-SRC_URI =3D "${BASE_SRC_URI}/linuxutils_${PV}.tar.gz "
-
-LIC_FILES_CHKSUM =3D "file://gpl_2.0.txt;md5=3D1298794fc2eed3df92a89f3c9=
d317440"
-
-S =3D "${WORKDIR}/linuxutils_${PV}"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PR =3D "${MACHINE_KERNEL_PR}"
-
-#This is a kernel module, don't set PR directly
-MACHINE_KERNEL_PR:append =3D "f"
-
-inherit module
-
-do_compile() {
-    do_make_scripts
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-
-    case "${SOC_FAMILY}" in
-    "dm365")
-            modules=3D"cmem edma irq";;
-    "omap3")
-            modules=3D"cmem sdma";;
-    "dm355")
-            modules=3D"cmem edma irq";;
-    *)
-            modules=3D"cmem"
-    esac
-
-    for module in $modules ; do
-    cd ${S}/packages/ti/sdo/linuxutils/$module
-    make \
-      LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" \
-      MVTOOL_PREFIX=3D"${TARGET_PREFIX}" \
-      UCTOOL_PREFIX=3D"${TARGET_PREFIX}" \
-      clean debug release
-    done
-}
-
-do_install () {
-    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
-    # Install CMEM
-    for module in $(find ${S}/packages/ti/sdo/linuxutils/ -name "*.ko") =
; do
-        install -m 0755 $module ${D}/lib/modules/${KERNEL_VERSION}/kerne=
l/drivers/dsp
-    done
-    cd ${S}/packages/ti/sdo/linuxutils/cmem/apps
-    make \
-      LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" \
-      MVTOOL_PREFIX=3D"${TARGET_PREFIX}" \
-      UCTOOL_PREFIX=3D"${TARGET_PREFIX}" \
-      EXEC_DIR=3D"${D}${installdir}/ti-linuxutils-app/cmem-app" \
-      install
-    # Install EDMA
-    if [ "${SOC_FAMILY}" =3D "dm365" ] ; then
-        cd ${S}/packages/ti/sdo/linuxutils/edma/apps
-        make \
-         LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" \
-         MVTOOL_PREFIX=3D"${TARGET_PREFIX}" \
-         UCTOOL_PREFIX=3D"${TARGET_PREFIX}" \
-         EXEC_DIR=3D"${D}${installdir}/ti-linuxutils-app/edma-app" \
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
-PACKAGES =3D+ " ti-cmem-module \
-              ti-sdma-module \
-              ti-edma-module \
-              ti-irq-module \
-              ti-linuxutils-app"
-
-FILES:ti-cmem-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/=
dsp/cmem*.ko"
-FILES:ti-sdma-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/=
dsp/sdma*.ko"
-FILES:ti-edma-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/=
dsp/edma*.ko"
-FILES:ti-irq-module =3D "/lib/modules/${KERNEL_VERSION}/kernel/drivers/d=
sp/irq*.ko"
-
-FILES:ti-linuxutils-app =3D "${installdir}/ti-linuxutils-app/*/*"
-
-INSANE_SKIP:ti-linuxutils-app =3D "True"
-INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.pat=
ch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.patch
deleted file mode 100644
index 1438003c..00000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix-2.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From: Koen Kooi <k-kooi@ti.com>
-Subject: linuxutils: fix build with 2.6.37rcX
-
----
-
---- /tmp/sdmak.c	2010-12-05 18:43:55.000000000 +0100
-+++ linuxutils_2_25_05_11/packages/ti/sdo/linuxutils/sdma/src/module/sdm=
ak.c	2010-12-05 18:48:31.000000000 +0100
-@@ -208,9 +208,12 @@
-             }
-=20
-             up_read(&current->mm->mmap_sem);
--
-+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,36)
-+            sema_init(&(channels[channel].mutex),1);
-+#else
-             init_MUTEX_LOCKED(&(channels[channel].mutex));
--            channels[channel].owner =3D filp;
-+#endif
-+			channels[channel].owner =3D filp;
-=20
-             if (copy_to_user(argp, &channel, sizeof(channel))) {
-                 return -EFAULT;
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch=
 b/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch
deleted file mode 100644
index 29b0a444..00000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils-BKL-fix.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From: Koen Kooi <k-kooi@ti.com>
-Subject: linuxutils: fix build with 2.6.37rcX
-
----
-
---- /tmp/cmemk.c	2010-12-05 18:41:00.000000000 +0100
-+++ linuxutils_2_25_05_11/packages/ti/sdo/linuxutils/cmem/src/module/cme=
mk.c	2010-12-05 18:43:24.000000000 +0100
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
-=20
-+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,36)
-+static DEFINE_SEMAPHORE(cmem_mutex);
-+#else
- static DECLARE_MUTEX(cmem_mutex);
-+#endif
-=20
- /* Describes a pool buffer */
- typedef struct pool_buffer {
-@@ -243,8 +248,12 @@
-=20
- static struct file_operations cmem_fxns =3D {
-     owner:   THIS_MODULE,
-+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,36)
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
-+++ linuxutils_2_25_05_11/packages/ti/sdo/linuxutils/sdma/src/module/sdm=
ak.c	2010-12-05 18:48:31.000000000 +0100
-@@ -208,9 +208,12 @@
-             }
-=20
-             up_read(&current->mm->mmap_sem);
--
-+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,36)
-+            sema_init(&(channels[channel].mutex),1);
-+#else
-             init_MUTEX_LOCKED(&(channels[channel].mutex));
--            channels[channel].owner =3D filp;
-+#endif
-+			channels[channel].owner =3D filp;
-=20
-             if (copy_to_user(argp, &channel, sizeof(channel))) {
-                 return -EFAULT;
-@@ -286,8 +289,12 @@
- }
-=20
- static struct file_operations fops =3D {
--    .ioctl =3D dma_ioctl,
--    .release =3D dma_release,
-+#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,36)
-+    .unlocked_ioctl =3D dma_ioctl,
-+#else
-+	.ioctl =3D dma_ioctl,
-+#endif
-+	.release =3D dma_release,
-     .owner =3D THIS_MODULE
- };
-=20
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fi=
xes.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fix=
es.patch
deleted file mode 100644
index 3ce66f8c..00000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.pat=
ch
+++ /dev/null
@@ -1,59 +0,0 @@
-Index: linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/=
cmemk.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linuxutils_2_26_01_02.orig/packages/ti/sdo/linuxutils/cmem/src/modul=
e/cmemk.c
-+++ linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cme=
mk.c
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
-     vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
-=20
--    vma->vm_flags |=3D VM_RESERVED | VM_IO;
-+    vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
-=20
-     if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
-                         vma->vm_end - vma->vm_start, vma->vm_page_prot)=
) {
-@@ -1095,7 +1096,7 @@ static int set_cached(struct vm_area_str
-                                 );
- #endif
-=20
--    vma->vm_flags |=3D VM_RESERVED | VM_IO;
-+    vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
-=20
-     if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
-                         vma->vm_end - vma->vm_start, vma->vm_page_prot)=
) {
-@@ -2062,8 +2063,13 @@ int __init cmem_init(void)
-         block_avail_size[bi] =3D length;
-=20
-         /* attempt to determine the end of Linux kernel memory */
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 11, 0)
-         phys_end_kernel =3D virt_to_phys((void *)PAGE_OFFSET) +
-                    (num_physpages << PAGE_SHIFT);
-+#else
-+        phys_end_kernel =3D virt_to_phys((void *)PAGE_OFFSET) +
-+                   (get_num_physpages() << PAGE_SHIFT);
-+#endif
-=20
-         if (phys_end_kernel > block_start[bi]) {
-             if (allowOverlap =3D=3D 0) {
-@@ -2186,10 +2192,14 @@ int __init cmem_init(void)
-     }
-=20
-     /* Create the /proc entry */
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
-     cmem_proc_entry =3D create_proc_entry("cmem", 0, NULL);
-     if (cmem_proc_entry) {
-         cmem_proc_entry->proc_fops =3D &cmem_proc_ops;
-     }
-+#else
-+    cmem_proc_entry =3D proc_create_data("cmem", 0, NULL, &cmem_proc_op=
s, NULL);
-+#endif
-=20
-     mutex_init(&cmem_mutex);
-=20
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fi=
xes.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fix=
es.patch
deleted file mode 100644
index 5ec85fc2..00000000
--- a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.pat=
ch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/sdma/src/module/=
sdmak.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- linuxutils_2_26_01_02.orig/packages/ti/sdo/linuxutils/sdma/src/modul=
e/sdmak.c
-+++ linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/sdma/src/module/sdm=
ak.c
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
-=20
- #endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,18) */
-=20
-+#ifndef OMAP_DMA_NO_DEVICE
-+#include <linux/omap-dma.h>
-+#define OMAP_DMA_NO_DEVICE	0
-+#endif
-+
- #include "../interface/sdma.h"
-=20
- struct channel {
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-=
ti/linuxutils/ti-linuxutils_2.26.01.02.bb
deleted file mode 100644
index 97aebd41..00000000
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require ti-linuxutils.inc
-
-SRC_URI +=3D "file://linuxutils-BKL-fix-2.patch \
-			file://linuxutils_2_26-cmemk-fixes.patch \
-			file://linuxutils_2_26-sdmak-fixes.patch \
-	"
-
-PE =3D "1"
-PV =3D "2_26_01_02"
-
-SRC_URI[md5sum] =3D "70b4918bc35c1bcfef34d6ba3fbce0c8"
-SRC_URI[sha256sum] =3D "51266dd928f8d629cd417c869789a6c0d596612120f16561=
9119cbaadfd66ee2"
-
-INSANE_SKIP:${PN} =3D "installed-vs-shipped"
-
-COMPATIBLE_HOST ?=3D "null"
-COMPATIBLE_HOST:ti-soc =3D "(.*)"
--=20
2.25.1

