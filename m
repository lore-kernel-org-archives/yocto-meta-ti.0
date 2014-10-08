Return-Path: <eballetbo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26763E00878; Wed,  8 Oct 2014 06:48:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B07A1E00853
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 06:48:09 -0700 (PDT)
Received: by mail-wg0-f42.google.com with SMTP id z12so11530612wgg.25
	for <meta-ti@yoctoproject.org>; Wed, 08 Oct 2014 06:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zc8i7n76QZdTzWEwwCi61ZHyGxFZXGcCYaJW4gtSJ68=;
	b=K3qvB3slTaXq3TLHnxPDRLbuD2FrjYiHYuZ5J8PxslURDr2BNaNDNJ8FXsU8kDT454
	qLWsQjUX4YPV+57TPNmepvnPPEQuaYWuu4Br3j6Kp+ud5KLaTHCE0no3T0d69QgNkJ4G
	3byRLoshMj6Bz6bRXSvyXwzEs6EnaLF+J8+IXY1NRT0rx0XQx04iyazGaADGSIB7p5+b
	+vb6iiG1IWS2cjfST/s3TDFgMbkphehfUDtHGv8BvuHTpPOZrpUmF0G9JlFEOa9ri7yr
	/mDdhmoh55t4GPKNzDFOTV9y+ZQmq1JI0XEI1l0VAaOGRpDgJdkncrmDBr1ZewI9yUZn
	5kfA==
X-Received: by 10.180.223.100 with SMTP id qt4mr11428330wic.35.1412776088901; 
	Wed, 08 Oct 2014 06:48:08 -0700 (PDT)
Received: from localhost.localdomain (43.Red-2-139-180.staticIP.rima-tde.net.
	[2.139.180.43])
	by mx.google.com with ESMTPSA id p1sm158375wjy.22.2014.10.08.06.48.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Oct 2014 06:48:08 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
To: meta-ti@yoctoproject.org,
	ebutera@gmail.com,
	martinez.javier@gmail.com
Date: Wed,  8 Oct 2014 15:47:46 +0200
Message-Id: <1412776066-4991-4-git-send-email-eballetbo@iseebcn.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
References: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH 3/3] ti-linuxutils: Fix build problems for kernel up to 3.17
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
X-List-Received-Date: Wed, 08 Oct 2014 13:48:16 -0000

Add to patches to fix the build of cmemk and sdmak kernel modules.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 recipes-ti/linuxutils/ti-linuxutils.inc            |  2 +-
 .../linuxutils_2_26-cmemk-fixes.patch              | 59 ++++++++++++++++++++++
 .../linuxutils_2_26-sdmak-fixes.patch              | 25 +++++++++
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |  5 +-
 4 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
 create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch

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
-- 
1.9.1


