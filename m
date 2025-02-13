Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BB6C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.8740.1739490506572021516
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fGSlzG63;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOst736966
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=1dyTiFUzNYpEQ2Rk/ZI4Uqx44xrI2A/ksz3R0sRoJvo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fGSlzG63QxPi+GDZ0iJH5Nnq+whwX/MU1QmllReUekXw4GVK0u3He+at9DrdmzGOk
	 xOWzisu969TmlJfi3lDXk8OLIHUXTaUDd4+lFhFhg0+AT4rjDrhO6MmHMUz6UqOkfz
	 LnBKHWm3kn5oUHGZLwAjy+X9kDxU5R8RzoYMUV08=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmOUN085331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcN056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 2/7] mesa-pvr: version 23.2.1 -> 24.0.1
Date: Thu, 13 Feb 2025 17:48:08 -0600
Message-ID: <20250213234813.3618729-3-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213234813.3618729-1-rs@ti.com>
References: <20250213234813.3618729-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18315

From: Randolph Sapp <rs@ti.com>

The gfx library provided by rogue can support this never version of mesa
out of the box. Pull it in now that we have ported the SGX side of
things.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...allium-Fix-build-with-llvm-18-and-19.patch | 52 -----------------
 ...e-cmake-dependency-detector-for-llvm.patch | 42 --------------
 ...e-lp_bld_misc.cpp-to-support-llvm-19.patch | 38 +++++++++++++
 .../0001-drisw-fix-build-without-dri3.patch   | 57 +++++++++++++++++++
 .../0001-gallium-Fix-build-with-llvm-17.patch |  0
 ...ll-StringMapIterator-from-llvm-scope.patch | 31 ++++++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  0
 ...k-for-all-linux-host_os-combinations.patch | 16 +++---
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 41 +++++++++++++
 ...{mesa-pvr_23.2.1.bb => mesa-pvr_24.0.1.bb} | 16 ++----
 10 files changed, 181 insertions(+), 112 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-gallium-Fix-build-with-llvm-17.patch (100%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr-23.2.1 => mesa-pvr-24.0.1}/0001-meson.build-check-for-all-linux-host_os-combinations.patch (70%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_23.2.1.bb => mesa-pvr_24.0.1.bb} (81%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
deleted file mode 100644
index 6e8d0cab..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Mon, 4 Nov 2024 13:37:29 -0600
-Subject: [PATCH] gallium: Fix build with llvm 18 and 19
-
-- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
-- llvm::sys::getHostCPUFeatures() now returns the features instead of
-modifying the passed in argument. [2]
-
-Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mesa/-/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
-Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index 5e7a30a6cc2..dbc777e3096 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -366,7 +366,11 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
-    builder.setEngineKind(EngineKind::JIT)
-           .setErrorStr(&Error)
-           .setTargetOptions(options)
-+#if LLVM_VERSION_MAJOR >= 18
-+          .setOptLevel((CodeGenOptLevel)OptLevel);
-+#else
-           .setOptLevel((CodeGenOpt::Level)OptLevel);
-+#endif
-
- #if DETECT_OS_WINDOWS
-     /*
-@@ -394,8 +398,14 @@ lp_build_create_jit_compiler_for_module(LLVMExecutionEngineRef *OutJIT,
-     * which allows us to enable/disable code generation based
-     * on the results of cpuid on these architectures.
-     */
--   llvm::StringMap<bool> features;
--   llvm::sys::getHostCPUFeatures(features);
-+   #if LLVM_VERSION_MAJOR >= 19
-+      /* llvm-19+ returns StringMap from getHostCPUFeatures.
-+      */
-+      auto features = llvm::sys::getHostCPUFeatures();
-+   #else
-+      llvm::StringMap<bool> features;
-+      llvm::sys::getHostCPUFeatures(features);
-+   #endif
-
-    for (StringMapIterator<bool> f = features.begin();
-         f != features.end();
---
-2.17.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
deleted file mode 100644
index 4cded054..00000000
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Sep 2023 15:34:22 -0700
-Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking errors with meson 1.2.1
-
-meson dependency auto dependency detection uses cmake and then
-config-tool to process dependencies, in mesa the logic to detect llvm is
-using auto detection which means if it finds cmake then it will try to
-use cmake method. Cmake method works ok except a case when llvm-dev
-package is installed on the build host then it generates its own
-native.meson file and ignores OE supplied meson.native file which has
-correct llvm-config tool specified which is pointing to llvm-config from
-native sysroot. The generated meson.native file points to one found in
-/usr/bin and there onwards detector finds native install of llvm and
-configures that into building native mesa package.
-
-Since cmake detector does not always work, disable it by default and use
-config-tool which works in all cases. This is suggested in below issues
-too
-
-A similar issue is open in meson upstream [1] and mesa [2]
-
-[1] https://github.com/mesonbuild/meson/issues/10483
-[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/meson.build
-+++ b/meson.build
-@@ -1659,6 +1659,7 @@ with_llvm = false
- if _llvm.allowed()
-   dep_llvm = dependency(
-     'llvm',
-+    method : host_machine.system() == 'windows' ? 'auto' : 'config-tool',
-     version : _llvm_version,
-     modules : llvm_modules,
-     optional_modules : llvm_optional_modules,
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
new file mode 100644
index 00000000..9e5bb342
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch
@@ -0,0 +1,38 @@
+From fa9cd89a85b904615ebc11da609445b5b751e68d Mon Sep 17 00:00:00 2001
+From: Satadru Pramanik <satadru@umich.edu>
+Date: Sat, 5 Oct 2024 13:35:52 +0000
+Subject: [PATCH] Update lp_bld_misc.cpp to support llvm-19+.
+
+Fixes #11896.
+cc: mesa-stable
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31533>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index 7975fcf1ac9..5b615d627ff 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -329,8 +329,14 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
+     * which allows us to enable/disable code generation based
+     * on the results of cpuid on these architectures.
+     */
+-   llvm::StringMap<bool> features;
+-   llvm::sys::getHostCPUFeatures(features);
++   #if LLVM_VERSION_MAJOR >= 19
++      /* llvm-19+ returns StringMap from getHostCPUFeatures.
++      */
++      auto features = llvm::sys::getHostCPUFeatures();
++   #else
++      llvm::StringMap<bool> features;
++      llvm::sys::getHostCPUFeatures(features);
++   #endif
+
+    for (llvm::StringMapIterator<bool> f = features.begin();
+         f != features.end();
+--
+2.47.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
new file mode 100644
index 00000000..9d662b34
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-drisw-fix-build-without-dri3.patch
@@ -0,0 +1,57 @@
+From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 6 Feb 2024 09:47:09 +0100
+Subject: [PATCH 1/2] drisw: fix build without dri3
+
+commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
+can be build without dri3.
+
+  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in function `driswCreateScreenDriver':
+  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference to `dri3_check_multibuffer'
+  collect2: error: ld returned 1 exit status
+
+Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
+dri3_check_multibuffer().
+
+Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper path")
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/glx/drisw_glx.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
+index 3d3f752..4b19e2d 100644
+--- a/src/glx/drisw_glx.c
++++ b/src/glx/drisw_glx.c
+@@ -32,7 +32,9 @@
+ #include <dlfcn.h>
+ #include "dri_common.h"
+ #include "drisw_priv.h"
++#ifdef HAVE_DRI3
+ #include "dri3_priv.h"
++#endif
+ #include <X11/extensions/shmproto.h>
+ #include <assert.h>
+ #include <vulkan/vulkan_core.h>
+@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+        goto handle_error;
+    }
+
++#ifdef HAVE_DRI3
+    if (pdpyp->zink) {
+       bool err;
+       psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
+@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+          goto handle_error;
+       }
+    }
++#endif
+
+    glx_config_destroy_list(psc->base.configs);
+    psc->base.configs = configs;
+--
+2.44.0
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallium-Fix-build-with-llvm-17.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
new file mode 100644
index 00000000..1751df6f
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch
@@ -0,0 +1,31 @@
+From d17338d403980e1932a42f5d11c2a1fb7b25127b Mon Sep 17 00:00:00 2001
+From: MastaG <mastag@gmail.com>
+Date: Wed, 3 Jul 2024 21:00:42 +0200
+Subject: [PATCH] gallivm: Call StringMapIterator from llvm:: scope
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/11392
+Fixes: b035d9cab5a4 ("gallivm: use getHostCPUFeatures on x86/llvm-4.0+.")
+Reviewed-by: David Heidelberg <david@ixit.cz>
+Signed-off-by: David Heidelberg <david@ixit.cz>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30009>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/d17338d403980e1932a42f5d11c2a1fb7b25127b]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index 95a8a6c6a08..f3c10652ed6 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -332,7 +332,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
+    llvm::StringMap<bool> features;
+    llvm::sys::getHostCPUFeatures(features);
+
+-   for (StringMapIterator<bool> f = features.begin();
++   for (llvm::StringMapIterator<bool> f = features.begin();
+         f != features.end();
+         ++f) {
+       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
+--
+2.47.1
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
similarity index 70%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index e9a6fd3f..964e0a44 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From b251af67df5a6840d2e9cc06edae2c387f8778f1 Mon Sep 17 00:00:00 2001
+From f2fe76d506f356de055b8eca83a7c9d0744a40af Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,24 +20,24 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 22385d8..15f48a6 100644
+index 35cc5f1..9a49c0d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -121,7 +121,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+@@ -128,7 +128,7 @@
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = with_shared_glapi and with_any_opengl
 
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
-+system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machine.system()) or host_machine.system().startswith('linux')
 
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-@@ -909,7 +909,7 @@ if cc.has_function('fmemopen')
+@@ -998,7 +998,7 @@
  endif
 
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android'].contains(host_machine.system())
-+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android', 'managarm'].contains(host_machine.system())
++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android', 'managarm'].contains(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args += '-D_GNU_SOURCE'
  elif host_machine.system() == 'sunos'
    pre_args += '-D__EXTENSIONS__'
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
new file mode 100644
index 00000000..1203c446
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -0,0 +1,41 @@
+From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Tue, 6 Feb 2024 09:47:10 +0100
+Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
+
+Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+added an automatic zink fallback even when the zink gallium is not
+enabled at build time.
+
+It leads to unexpected error log while loading drisw driver and
+zink is not installed on the rootfs:
+
+  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
+
+Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27478]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/glx/glxext.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/glx/glxext.c b/src/glx/glxext.c
+index 05c825a..7a06aa9 100644
+--- a/src/glx/glxext.c
++++ b/src/glx/glxext.c
+@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
+ #endif /* HAVE_DRI3 */
+       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
+          dpyPriv->dri2Display = dri2CreateDisplay(dpy);
++#if defined(HAVE_ZINK)
+       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
+          try_zink = !debug_get_bool_option("LIBGL_KOPPER_DISABLE", false) &&
+                     !getenv("GALLIUM_DRIVER");
++#endif /* HAVE_ZINK */
+    }
+ #endif /* GLX_USE_DRM */
+    if (glx_direct)
+--
+2.44.0
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
similarity index 81%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index cdff372a..1ac022d2 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -15,8 +15,10 @@ SRC_URI = " \
     file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
     file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
     file://0001-gallium-Fix-build-with-llvm-17.patch \
-    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
-    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
+    file://0001-drisw-fix-build-without-dri3.patch \
+    file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
+    file://0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch \
+    file://0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -26,19 +28,13 @@ PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
-SRCREV = "0e75e7ded360ea6aee4140393b30960e152f3994"
-PV = "23.2.1"
+SRCREV = "82e6a9293c476267417c5b6b906b01fb73a34e38"
+PV = "24.0.1"
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
 PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
 
-PACKAGECONFIG:remove = "video-codecs"
-PACKAGECONFIG[video-codecs] = ""
-PACKAGECONFIG:remove = "elf-tls"
-PACKAGECONFIG[elf-tls] = ""
-PACKAGECONFIG:remove = "xvmc"
-PACKAGECONFIG[xvmc] = ""
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.48.1


