Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64709E00E0D; Wed, 11 Sep 2019 12:24:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C63D0E00E08
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 12:24:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4D7840BC4;
	Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dL3DKnMJHPjS; Wed, 11 Sep 2019 19:24:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF38E40BE3;
	Wed, 11 Sep 2019 19:24:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8744E173B70;
	Wed, 11 Sep 2019 15:24:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Sep 2019 15:23:53 -0400
Message-Id: <1568229835-30920-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568229835-30920-1-git-send-email-denys@ti.com>
References: <1568229835-30920-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/4] ti-img-rogue-driver: port generic toolchain support from SGX
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
X-List-Received-Date: Wed, 11 Sep 2019 19:24:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-km-support-general-toolchain.patch        | 56 ++++++++++++++++++++++
 .../ti-img-rogue-driver_1.10.5371573.bb            |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
new file mode 100644
index 0000000..4dc219c
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
@@ -0,0 +1,56 @@
+From dbdbd9309a58ee723fc827ef5fd45c28347cf61f Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 7 May 2019 17:06:09 -0400
+Subject: [PATCH] km: support general toolchain
+
+This is a patch from IMG to support general toolchains such as
+aarch64-oe-linux-gnu, aarch64-poky-linux-gnu, arm-none-linux-gnueabi
+per IMG ticket 122059
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ build/linux/config/compiler.mk        | 12 +++++++++++-
+ .../build/linux/config/compilers/arm-linux-gnueabi.mk       |  6 ++++++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+ create mode 100644 build/linux/config/compilers/arm-linux-gnueabi.mk
+
+diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
+index 82c9d44..dead2f9 100644
+--- a/build/linux/config/compiler.mk
++++ b/build/linux/config/compiler.mk
+@@ -48,13 +48,14 @@ define calculate-compiler-preferred-target
+  ifeq ($(2),qcc)
+   $(1)_compiler_preferred_target := qcc
+  else
+-  $(1)_compiler_preferred_target := $$(subst --,-,$$(shell $(2) -dumpmachine))
++  $(1)_compiler_preferred_target := $$(subst --,-,$$(subst unknown,,$$(shell $(2) -dumpmachine)))
+   ifeq ($$($(1)_compiler_preferred_target),)
+    $$(warning No output from '$(2) -dumpmachine')
+    $$(warning Check that the compiler is in your PATH and CROSS_COMPILE is)
+    $$(warning set correctly.)
+    $$(error Unable to run compiler '$(2)')
+   endif
++  $$(warning $(1) $(2))
+   ifneq ($$(filter %-w64-mingw32,$$($(1)_compiler_preferred_target)),)
+    # Use the compiler target name.
+   else
+@@ -64,6 +65,15 @@ define calculate-compiler-preferred-target
+    ifneq ($$(filter arm-linux-android,$$($(1)_compiler_preferred_target)),)
+     $(1)_compiler_preferred_target := arm-linux-androideabi
+    endif
++  ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
++   $(1)_compiler_preferred_target := aarch64-linux-gnu
++  endif
++  ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
++   $(1)_compiler_preferred_target := arm-linux-gnueabi
++  endif
++  ifneq ($$(filter arm-%-gnueabihf,$$($(1)_compiler_preferred_target)),)
++   $(1)_compiler_preferred_target := arm-linux-gnueabihf
++  endif
+    ifneq ($$(filter clang%,$(2)),)
+     ifeq ($(1),target)
+      ifeq (arm-linux-gnueabihf,$$(CROSS_TRIPLE))
+-- 
+2.7.4
+
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index fcf35ed..0cd2f42 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -17,7 +17,9 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "linuxws/thud/k4.19/${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
+    file://0001-km-support-general-toolchain.patch \
+"
 S = "${WORKDIR}/git"
 
 SRCREV = "1531b98ba602911359bfded2d683e49b3c731313"
-- 
2.7.4


