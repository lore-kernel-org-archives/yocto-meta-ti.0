Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48DC9E0088B; Wed,  8 Oct 2014 11:10:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC837E00786
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 11:09:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BEE74529C2; Wed,  8 Oct 2014 18:09:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008180957.BEE74529C2@arago-project.org>
Date: Wed,  8 Oct 2014 18:09:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Enric Balletbo i Serra : ti-linuxutils: Fix build problems for kernel up to 3.17
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
X-List-Received-Date: Wed, 08 Oct 2014 18:10:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a9a74cc33dded238756eb81879d01a6eac64e503
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a9a74cc33dded238756eb81879d01a6eac64e503

Author: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Date:   Wed Oct  8 19:47:46 2014 +0000

ti-linuxutils: Fix build problems for kernel up to 3.17

Add to patches to fix the build of cmemk and sdmak kernel modules.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/linuxutils/ti-linuxutils.inc            |    2 +-
 .../linuxutils_2_26-cmemk-fixes.patch              |   59 ++++++++++++++++++++
 .../linuxutils_2_26-sdmak-fixes.patch              |   25 ++++++++
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |    5 +-
 4 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
index dba485b..c8f9320 100644
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ b/recipes-ti/linuxutils/ti-linuxutils.inc
@@ -15,7 +15,7 @@ require recipes-ti/includes/ti-staging.inc
 PR = "${MACHINE_KERNEL_PR}"
 
 #This is a kernel module, don't set PR directly
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "f"
 
 inherit module
 
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
new file mode 100644
index 0000000..3ce66f8
--- /dev/null
+++ b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
@@ -0,0 +1,59 @@
+Index: linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
+===================================================================
+--- linuxutils_2_26_01_02.orig/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
++++ linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
+@@ -31,6 +31,7 @@
+ #include <linux/seq_file.h>
+ #include <linux/vmalloc.h>
+ #include <linux/sched.h>
++#include <linux/slab.h>
+ #include <asm/cacheflush.h>
+ #include <asm/uaccess.h>
+ #include <asm/pgtable.h>
+@@ -1072,7 +1073,7 @@ static int set_noncached(struct vm_area_
+ {
+     vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+ 
+-    vma->vm_flags |= VM_RESERVED | VM_IO;
++    vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
+ 
+     if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+                         vma->vm_end - vma->vm_start, vma->vm_page_prot)) {
+@@ -1095,7 +1096,7 @@ static int set_cached(struct vm_area_str
+                                 );
+ #endif
+ 
+-    vma->vm_flags |= VM_RESERVED | VM_IO;
++    vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
+ 
+     if (remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
+                         vma->vm_end - vma->vm_start, vma->vm_page_prot)) {
+@@ -2062,8 +2063,13 @@ int __init cmem_init(void)
+         block_avail_size[bi] = length;
+ 
+         /* attempt to determine the end of Linux kernel memory */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 11, 0)
+         phys_end_kernel = virt_to_phys((void *)PAGE_OFFSET) +
+                    (num_physpages << PAGE_SHIFT);
++#else
++        phys_end_kernel = virt_to_phys((void *)PAGE_OFFSET) +
++                   (get_num_physpages() << PAGE_SHIFT);
++#endif
+ 
+         if (phys_end_kernel > block_start[bi]) {
+             if (allowOverlap == 0) {
+@@ -2186,10 +2192,14 @@ int __init cmem_init(void)
+     }
+ 
+     /* Create the /proc entry */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 10, 0)
+     cmem_proc_entry = create_proc_entry("cmem", 0, NULL);
+     if (cmem_proc_entry) {
+         cmem_proc_entry->proc_fops = &cmem_proc_ops;
+     }
++#else
++    cmem_proc_entry = proc_create_data("cmem", 0, NULL, &cmem_proc_ops, NULL);
++#endif
+ 
+     mutex_init(&cmem_mutex);
+ 
diff --git a/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch
new file mode 100644
index 0000000..5ec85fc
--- /dev/null
+++ b/recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch
@@ -0,0 +1,25 @@
+Index: linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c
+===================================================================
+--- linuxutils_2_26_01_02.orig/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c
++++ linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/sdma/src/module/sdmak.c
+@@ -44,7 +44,7 @@
+ #include <mach/hardware.h>
+ #include <mach/dma.h>
+ #include <mach/tc.h>
+-#else
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0)
+ #include <plat/hardware.h>
+ #include <plat/dma.h>
+ #include <plat/tc.h>
+@@ -97,6 +97,11 @@
+ 
+ #endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) */
+ 
++#ifndef OMAP_DMA_NO_DEVICE
++#include <linux/omap-dma.h>
++#define OMAP_DMA_NO_DEVICE	0
++#endif
++
+ #include "../interface/sdma.h"
+ 
+ struct channel {
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
index 75a32da..1a56d1d 100644
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
@@ -1,6 +1,9 @@
 require ti-linuxutils.inc
 
-SRC_URI += "file://linuxutils-BKL-fix-2.patch"
+SRC_URI += "file://linuxutils-BKL-fix-2.patch \
+			file://linuxutils_2_26-cmemk-fixes.patch \
+			file://linuxutils_2_26-sdmak-fixes.patch \
+	"
 
 PE = "1"
 PV = "2_26_01_02"


