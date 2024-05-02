Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD760C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 00:26:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2199.1714609583477972948
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 May 2024 17:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC7BF40C79
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jc_t_dJjLmjU for <meta-ti@lists.yoctoproject.org>;
	Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3B6440AB7
	for <meta-ti@lists.yoctoproject.org>; Thu,  2 May 2024 00:26:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CDE57163F55
	for <meta-ti@lists.yoctoproject.org>; Wed,  1 May 2024 20:26:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/scarthgap][PATCH 2/3] mesa-pvr_23.2.1: import mesa patches from oe-core/master
Date: Wed,  1 May 2024 20:26:20 -0400
Message-Id: <20240502002621.3456112-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502002621.3456112-1-denis@denix.org>
References: <20240502002621.3456112-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 00:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17625

From: Randolph Sapp <rs@ti.com>

Locally overlay verbatim copies of mesa 22.3.5 patches from
oe-core/master, so we get whatever QoL patches from core relevant to the
current release.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 41 ++++++++++++++++++
 ...e-cmake-dependency-detector-for-llvm.patch | 42 +++++++++++++++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  4 +-
 ...k-for-all-linux-host_os-combinations.patch | 18 ++++----
 4 files changed, 94 insertions(+), 11 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/000=
1-gallium-Fix-build-with-llvm-17.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/000=
1-meson-Disable-cmake-dependency-detector-for-llvm.patch
 copy meta-ti-bsp/recipes-graphics/mesa/{files =3D> mesa-pvr_23.2.1}/0001=
-meson-misdetects-64bit-atomics-on-mips-clang.patch (99%)
 copy meta-ti-bsp/recipes-graphics/mesa/{files =3D> mesa-pvr_23.2.1}/0001=
-meson.build-check-for-all-linux-host_os-combinations.patch (84%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-galli=
um-Fix-build-with-llvm-17.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-=
pvr_23.2.1/0001-gallium-Fix-build-with-llvm-17.patch
new file mode 100644
index 00000000..237f940f
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-gallium-Fix-=
build-with-llvm-17.patch
@@ -0,0 +1,41 @@
+From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 23 Jun 2023 01:20:38 -0700
+Subject: [PATCH] gallium: Fix build with llvm 17
+
+These headers are not available for C files in llvm 17+
+and they seem to be not needed to compile after all with llvm 17
+so add conditions to exclude them for llvm >=3D 17
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/23827]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/a=
uxiliary/gallivm/lp_bld_init.c
+index cd2108f..b1a4d03 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+@@ -46,15 +46,19 @@
+ #if GALLIVM_USE_NEW_PASS =3D=3D 1
+ #include <llvm-c/Transforms/PassBuilder.h>
+ #elif GALLIVM_HAVE_CORO =3D=3D 1
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Scalar.h>
+-#if LLVM_VERSION_MAJOR >=3D 7
++#endif
++#if LLVM_VERSION_MAJOR >=3D 7 && LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Utils.h>
+ #endif
+ #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_AR=
M || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
+ #include <llvm-c/Transforms/IPO.h>
+ #endif
++#if LLVM_VERSION_MAJOR < 17
+ #include <llvm-c/Transforms/Coroutines.h>
+ #endif
++#endif
+=20
+ unsigned gallivm_perf =3D 0;
+=20
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson=
-Disable-cmake-dependency-detector-for-llvm.patch b/meta-ti-bsp/recipes-g=
raphics/mesa/mesa-pvr_23.2.1/0001-meson-Disable-cmake-dependency-detector=
-for-llvm.patch
new file mode 100644
index 00000000..4cded054
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson-Disabl=
e-cmake-dependency-detector-for-llvm.patch
@@ -0,0 +1,42 @@
+From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Sep 2023 15:34:22 -0700
+Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking =
errors with meson 1.2.1
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/25438]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/meson.build
++++ b/meson.build
+@@ -1659,6 +1659,7 @@ with_llvm =3D false
+ if _llvm.allowed()
+   dep_llvm =3D dependency(
+     'llvm',
++    method : host_machine.system() =3D=3D 'windows' ? 'auto' : 'config-=
tool',
+     version : _llvm_version,
+     modules : llvm_modules,
+     optional_modules : llvm_optional_modules,
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetect=
s-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/m=
esa-pvr_23.2.1/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
similarity index 99%
copy from meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-6=
4bit-atomics-on-mips-clang.patch
copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson-misd=
etects-64bit-atomics-on-mips-clang.patch
index 35bd0ea1..9cd9bee2 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit=
-atomics-on-mips-clang.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson-misdet=
ects-64bit-atomics-on-mips-clang.patch
@@ -17,9 +17,9 @@ index 5a5eab4..e499516 100644
 @@ -21,7 +21,7 @@
   * IN THE SOFTWARE.
   */
-
+=20
 -#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
 +#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HA=
VE_PTHREAD)
-
+=20
  #include <stdint.h>
  #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-che=
ck-for-all-linux-host_os-combinations.patch b/meta-ti-bsp/recipes-graphic=
s/mesa/mesa-pvr_23.2.1/0001-meson.build-check-for-all-linux-host_os-combi=
nations.patch
similarity index 84%
copy from meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-=
for-all-linux-host_os-combinations.patch
copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson.buil=
d-check-for-all-linux-host_os-combinations.patch
index f0c1de46..a555c5f8 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1/0001-meson.build-=
check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From 3b4d6b89f644b43e507c08181fef06db4326f9da Mon Sep 17 00:00:00 2001
+From b251af67df5a6840d2e9cc06edae2c387f8778f1 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,21 +20,21 @@ Signed-off-by: Alistair Francis <alistair@alistair23.=
me>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 172c64a..9b5294c 100644
+index 22385d8..15f48a6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
+@@ -121,7 +121,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi =3D with_shared_glapi and with_any_opengl
-
+=20
 -system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
)
 +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
) or host_machine.system().startswith('linux')
-
- with_freedreno_kgsl =3D get_option('freedreno-kgsl')
- if with_freedreno_kgsl
-@@ -1076,7 +1076,7 @@ if cc.has_function('reallocarray')
+=20
+ gallium_drivers =3D get_option('gallium-drivers')
+ if gallium_drivers.contains('auto')
+@@ -909,7 +909,7 @@ if cc.has_function('fmemopen')
  endif
-
+=20
  # TODO: this is very incomplete
 -if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid'].contains(host_machine.system())
 +if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system()) or host_machine.system().startswith('linux')
--=20
2.25.1


