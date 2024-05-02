Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD732C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:19:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3520.1714677536816158465
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZOm7Pswv;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442JIpEx116829;
	Thu, 2 May 2024 14:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714677531;
	bh=RQ5SFGc88zaYyWAErWdKUE1wS6OKEMtOionuYcRn6ZI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZOm7Pswv26B2h48MV/AzKrsbcIUBkbAFKv3GikxrXwMZ0KQ/N89DrI1o6Ye4LPdfr
	 Ucm9WAD+/C/1SDsx4j0Cdr11yaQVfnhSpLeuq9Qem1OEt0fCEAmHtsXL+0jByCNff3
	 OqnAMVNbgO9PhRgU0LAzLfkE04iR2yT+aednSPbA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442JIpnh065920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 14:18:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 14:18:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 14:18:51 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442JIpgU120631;
	Thu, 2 May 2024 14:18:51 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master/scarthgap][PATCHv2 2/3] mesa-pvr_23.2.1: import mesa patches from oe-core/master
Date: Thu, 2 May 2024 14:18:42 -0500
Message-ID: <20240502191843.2380555-3-rs@ti.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502191843.2380555-1-rs@ti.com>
References: <20240502191843.2380555-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 19:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17639

From: Randolph Sapp <rs@ti.com>

Locally overlay verbatim copies of mesa 22.3.5 patches from
oe-core/master, so we get whatever QoL patches from core relevant to the
current release.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 41 ++++++++++++++++++
 ...e-cmake-dependency-detector-for-llvm.patch | 42 ++++++++++++++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch | 25 +++++++++++
 ...k-for-all-linux-host_os-combinations.patch | 43 +++++++++++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
new file mode 100644
index 00000000..237f940f
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
@@ -0,0 +1,41 @@
+From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 23 Jun 2023 01:20:38 -0700
+Subject: [PATCH] gallium: Fix build with llvm 17
+
+These headers are not available for C files in llvm 17+
+and they seem to be not needed to compile after all with llvm 17
+so add conditions to exclude them for llvm >= 17
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+index cd2108f..b1a4d03 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+@@ -46,15 +46,19 @@
+ #if GALLIVM_USE_NEW_PASS == 1
+ #include <llvm-c/Transforms/PassBuilder.h>
+ #elif GALLIVM_HAVE_CORO == 1
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Scalar.h>
+-#if LLVM_VERSION_MAJOR >= 7
++#endif
++#if LLVM_VERSION_MAJOR >= 7 && LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Utils.h>
+ #endif
+ #if LLVM_VERSION_MAJOR <= 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
+ #include <llvm-c/Transforms/IPO.h>
+ #endif
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Coroutines.h>
+ #endif
++#endif
+ 
+ unsigned gallivm_perf = 0;
+ 
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
new file mode 100644
index 00000000..4cded054
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
@@ -0,0 +1,42 @@
+From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Sep 2023 15:34:22 -0700
+Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking errors with meson 1.2.1
+
+meson dependency auto dependency detection uses cmake and then
+config-tool to process dependencies, in mesa the logic to detect llvm is
+using auto detection which means if it finds cmake then it will try to
+use cmake method. Cmake method works ok except a case when llvm-dev
+package is installed on the build host then it generates its own
+native.meson file and ignores OE supplied meson.native file which has
+correct llvm-config tool specified which is pointing to llvm-config from
+native sysroot. The generated meson.native file points to one found in
+/usr/bin and there onwards detector finds native install of llvm and
+configures that into building native mesa package.
+
+Since cmake detector does not always work, disable it by default and use
+config-tool which works in all cases. This is suggested in below issues
+too
+
+A similar issue is open in meson upstream [1] and mesa [2]
+
+[1] https://github.com/mesonbuild/meson/issues/10483
+[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/meson.build
++++ b/meson.build
+@@ -1659,6 +1659,7 @@ with_llvm = false
+ if _llvm.allowed()
+   dep_llvm = dependency(
+     'llvm',
++    method : host_machine.system() == 'windows' ? 'auto' : 'config-tool',
+     version : _llvm_version,
+     modules : llvm_modules,
+     optional_modules : llvm_optional_modules,
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
new file mode 100644
index 00000000..9cd9bee2
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -0,0 +1,25 @@
+From 3ef37c63f03ad6f2af407de350486fdd25e9132a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 15:23:47 -0800
+Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/util/u_atomic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
+index 5a5eab4..e499516 100644
+--- a/src/util/u_atomic.c
++++ b/src/util/u_atomic.c
+@@ -21,7 +21,7 @@
+  * IN THE SOFTWARE.
+  */
+ 
+-#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
++#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
+ 
+ #include <stdint.h>
+ #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
new file mode 100644
index 00000000..a555c5f8
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -0,0 +1,43 @@
+From b251af67df5a6840d2e9cc06edae2c387f8778f1 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Thu, 14 Nov 2019 13:04:49 -0800
+Subject: [PATCH] meson.build: check for all linux host_os combinations
+
+Make sure that we are also looking for our host_os combinations like
+linux-musl etc. when assuming support for DRM/KMS.
+
+Also delete a duplicate line.
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
+
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 22385d8..15f48a6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -121,7 +121,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+ # Only build shared_glapi if at least one OpenGL API is enabled
+ with_shared_glapi = with_shared_glapi and with_any_opengl
+ 
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+ 
+ gallium_drivers = get_option('gallium-drivers')
+ if gallium_drivers.contains('auto')
+@@ -909,7 +909,7 @@ if cc.has_function('fmemopen')
+ endif
+ 
+ # TODO: this is very incomplete
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android'].contains(host_machine.system())
++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+   pre_args += '-D_GNU_SOURCE'
+ elif host_machine.system() == 'sunos'
+   pre_args += '-D__EXTENSIONS__'
-- 
2.44.0


