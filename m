Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A76CE7A8C
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 03:49:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.14735.1695440985362032268
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 20:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z6/1AwYC;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38N3nh9Y047428;
	Fri, 22 Sep 2023 22:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695440983;
	bh=HpCPVqnDZVemEnIWjczr74RF3sgGECU4culn5/FI2y4=;
	h=From:To:Subject:Date;
	b=Z6/1AwYCOeOV6jBIz7YLc84cP1ImFf4777J/abgm19BCzLu8ISUduFTOJpSYYlE/C
	 wq0WGgCfZuoS5eUMJXFEIwXrVEDTE59+p7R8rLH7I4EKRrv4e1OGinj+ImOETLIhcN
	 yPp/I6JpVz+B6+ihP1lb66Q3xcyQFP5HR5jUMPhk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38N3nhoH064084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Sep 2023 22:49:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Sep 2023 22:49:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Sep 2023 22:49:43 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38N3nhTk060713;
	Fri, 22 Sep 2023 22:49:43 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qjteJ-0003O2-1o; Fri, 22 Sep 2023 22:49:43 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] mesa-pvr: Patches for LLVM 17 support
Date: Fri, 22 Sep 2023 22:49:43 -0500
Message-ID: <20230923034943.12941-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 23 Sep 2023 03:49:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17011

There are a number of issues in gallium when moving to LLVM 17.  These
patches fix those compile issues.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...t-usage-of-LLVMContextSetOpaquePoint.patch | 129 ++++++++++++++++++
 .../0001-gallium-Fix-build-with-llvm-17.patch |  59 ++++++++
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |   2 +
 3 files changed, 190 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch

diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
new file mode 100644
index 00000000..4345cc57
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch
@@ -0,0 +1,129 @@
+From 1a894699354f5f984f31e5d3418b651edf486df9 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 22 Sep 2023 22:32:41 -0500
+Subject: [PATCH] fix: gallivm: limit usage of LLVMContextSetOpaquePointers()
+ to LLVM 15
+
+LLVMContextSetOpaquePointers() was a temporary workaround offered to
+allow transitioning to opaque pointers. Mesa is ready for this now with
+recent versions of LLVM (16+). Therefore we limit the workaround of
+using LLVMContextSetOpaquePointers() to LLVM 15 now, that this C
+interface was removed in LLVM 17.
+
+Reference: https://github.com/llvm/llvm-project/commit/1270879376025457e266572c7cccc51eb5de9276
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21124]
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ src/gallium/auxiliary/draw/draw_llvm.c        | 2 +-
+ src/gallium/drivers/llvmpipe/lp_context.c     | 2 +-
+ src/gallium/drivers/llvmpipe/lp_test_arit.c   | 2 +-
+ src/gallium/drivers/llvmpipe/lp_test_blend.c  | 2 +-
+ src/gallium/drivers/llvmpipe/lp_test_conv.c   | 2 +-
+ src/gallium/drivers/llvmpipe/lp_test_format.c | 4 ++--
+ src/gallium/drivers/llvmpipe/lp_test_printf.c | 2 +-
+ 7 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/gallium/auxiliary/draw/draw_llvm.c b/src/gallium/auxiliary/draw/draw_llvm.c
+index 50c157bc3cc..8b3a1522725 100644
+--- a/src/gallium/auxiliary/draw/draw_llvm.c
++++ b/src/gallium/auxiliary/draw/draw_llvm.c
+@@ -784,7 +784,7 @@ draw_llvm_create(struct draw_context *draw, LLVMContextRef context)
+    if (!llvm->context) {
+       llvm->context = LLVMContextCreate();
+ 
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+       LLVMContextSetOpaquePointers(llvm->context, false);
+ #endif
+ 
+diff --git a/src/gallium/drivers/llvmpipe/lp_context.c b/src/gallium/drivers/llvmpipe/lp_context.c
+index 8309335aebc..0ef4317fc76 100644
+--- a/src/gallium/drivers/llvmpipe/lp_context.c
++++ b/src/gallium/drivers/llvmpipe/lp_context.c
+@@ -263,7 +263,7 @@ llvmpipe_create_context(struct pipe_screen *screen, void *priv,
+    if (!llvmpipe->context)
+       goto fail;
+ 
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(llvmpipe->context, false);
+ #endif
+ 
+diff --git a/src/gallium/drivers/llvmpipe/lp_test_arit.c b/src/gallium/drivers/llvmpipe/lp_test_arit.c
+index 4118928d52e..565b1c47753 100644
+--- a/src/gallium/drivers/llvmpipe/lp_test_arit.c
++++ b/src/gallium/drivers/llvmpipe/lp_test_arit.c
+@@ -434,7 +434,7 @@ test_unary(unsigned verbose, FILE *fp, const struct unary_test_t *test, unsigned
+    }
+ 
+    context = LLVMContextCreate();
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(context, false);
+ #endif
+    gallivm = gallivm_create("test_module", context, NULL);
+diff --git a/src/gallium/drivers/llvmpipe/lp_test_blend.c b/src/gallium/drivers/llvmpipe/lp_test_blend.c
+index 37c3f731eaf..3d2899a78d4 100644
+--- a/src/gallium/drivers/llvmpipe/lp_test_blend.c
++++ b/src/gallium/drivers/llvmpipe/lp_test_blend.c
+@@ -452,7 +452,7 @@ test_one(unsigned verbose,
+       dump_blend_type(stdout, blend, type);
+ 
+    context = LLVMContextCreate();
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(context, false);
+ #endif
+    gallivm = gallivm_create("test_module", context, NULL);
+diff --git a/src/gallium/drivers/llvmpipe/lp_test_conv.c b/src/gallium/drivers/llvmpipe/lp_test_conv.c
+index c7ea9efc12d..83236f0c0ba 100644
+--- a/src/gallium/drivers/llvmpipe/lp_test_conv.c
++++ b/src/gallium/drivers/llvmpipe/lp_test_conv.c
+@@ -223,7 +223,7 @@ test_one(unsigned verbose,
+    }
+ 
+    context = LLVMContextCreate();
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(context, false);
+ #endif
+    gallivm = gallivm_create("test_module", context, NULL);
+diff --git a/src/gallium/drivers/llvmpipe/lp_test_format.c b/src/gallium/drivers/llvmpipe/lp_test_format.c
+index 0a2a1e449e8..89f7d5dec1a 100644
+--- a/src/gallium/drivers/llvmpipe/lp_test_format.c
++++ b/src/gallium/drivers/llvmpipe/lp_test_format.c
+@@ -150,7 +150,7 @@ test_format_float(unsigned verbose, FILE *fp,
+    unsigned i, j, k, l;
+ 
+    context = LLVMContextCreate();
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(context, false);
+ #endif
+    gallivm = gallivm_create("test_module_float", context, NULL);
+@@ -254,7 +254,7 @@ test_format_unorm8(unsigned verbose, FILE *fp,
+    unsigned i, j, k, l;
+ 
+    context = LLVMContextCreate();
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(context, false);
+ #endif
+    gallivm = gallivm_create("test_module_unorm8", context, NULL);
+diff --git a/src/gallium/drivers/llvmpipe/lp_test_printf.c b/src/gallium/drivers/llvmpipe/lp_test_printf.c
+index b3de9cb9e8b..850c0abfe22 100644
+--- a/src/gallium/drivers/llvmpipe/lp_test_printf.c
++++ b/src/gallium/drivers/llvmpipe/lp_test_printf.c
+@@ -96,7 +96,7 @@ test_printf(unsigned verbose, FILE *fp,
+    boolean success = TRUE;
+ 
+    context = LLVMContextCreate();
+-#if LLVM_VERSION_MAJOR >= 15
++#if LLVM_VERSION_MAJOR == 15
+    LLVMContextSetOpaquePointers(context, false);
+ #endif
+    gallivm = gallivm_create("test_module", context, NULL);
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
new file mode 100644
index 00000000..0a09b33c
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -0,0 +1,59 @@
+From 2dfe0f899aeb415a5491b8c67e208673d2a2914f Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 22 Sep 2023 21:50:08 -0500
+Subject: [PATCH] gallium: Fix build with llvm 17
+
+These headers are not available for C files in llvm 17+
+and they seem to be not needed to compile after all with llvm 17
+so add conditions to exclude them for llvm >= 17
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21262]
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22980]
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init.c   | 8 ++++----
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 4 ++++
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+index 584ea738668..fe8bb2b11af 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+@@ -42,14 +42,14 @@
+ 
+ #include <llvm/Config/llvm-config.h>
+ #include <llvm-c/Analysis.h>
+-#include <llvm-c/Transforms/Scalar.h>
+-#if LLVM_VERSION_MAJOR >= 7
+-#include <llvm-c/Transforms/Utils.h>
+-#endif
+ #include <llvm-c/BitWriter.h>
+ #if GALLIVM_USE_NEW_PASS == 1
+ #include <llvm-c/Transforms/PassBuilder.h>
+ #elif GALLIVM_HAVE_CORO == 1
++#include <llvm-c/Transforms/Scalar.h>
++#if LLVM_VERSION_MAJOR >= 7
++#include <llvm-c/Transforms/Utils.h>
++#endif
+ #if LLVM_VERSION_MAJOR <= 8 && (defined(PIPE_ARCH_AARCH64) || defined (PIPE_ARCH_ARM) || defined(PIPE_ARCH_S390) || defined(PIPE_ARCH_MIPS64))
+ #include <llvm-c/Transforms/IPO.h>
+ #endif
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index 2279e5acb28..0caeaf94263 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -56,7 +56,11 @@
+ #include <llvm-c/ExecutionEngine.h>
+ #include <llvm/Target/TargetOptions.h>
+ #include <llvm/ExecutionEngine/ExecutionEngine.h>
++#if LLVM_VERSION_MAJOR >= 17
++#include <llvm/TargetParser/Triple.h>
++#else
+ #include <llvm/ADT/Triple.h>
++#endif
+ #include <llvm/Analysis/TargetLibraryInfo.h>
+ #include <llvm/ExecutionEngine/SectionMemoryManager.h>
+ #include <llvm/Support/CommandLine.h>
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 0de3cb94..281d6a21 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -17,6 +17,8 @@ SRC_URI = " \
     file://0001-util-format-Check-for-NEON-before-using-it.patch \
     file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
     file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
+    file://0001-gallium-Fix-build-with-llvm-17.patch \
+    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


