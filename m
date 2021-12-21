Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.238.1640047208348158799
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 16:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C773407DA;
	Tue, 21 Dec 2021 00:40:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lo4_ttOR3YWb; Tue, 21 Dec 2021 00:40:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F1B4C40027;
	Tue, 21 Dec 2021 00:40:04 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2AF5F17470F;
	Mon, 20 Dec 2021 19:40:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [master][PATCH] ti-sgx-ddk-km: patches got merged upstream, update recipe accordingly
Date: Mon, 20 Dec 2021 19:39:59 -0500
Message-Id: <1640047199-16505-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Both of the local patches were merged upstream, so update the reecipe to pull
the latest SRCREV and drop those patches from the OE metadata.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 ...OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 44 ----------------------
 .../0002-Fix-driver-config-for-5.10-kernel.patch   | 29 --------------
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  |  7 +---
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
deleted file mode 100644
index 4f71ea9..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a1c191a020f6eebc9a94b641be1fca7885fc9dd2 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 9 Sep 2019 17:05:48 -0400
-Subject: [PATCH 1/2] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
- suffix
-
-OE toolchains are not having armhf in its name but they still are armhf
-ABI, teach this to sgx module build system
-
-recognize musleabi in tuples as well
-
-Add yoe distro support
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
-index dead2f9..1b5f090 100644
---- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
-+++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
-@@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
-   ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
-    $(1)_compiler_preferred_target := aarch64-linux-gnu
-   endif
-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi arm-yoe-linux-gnueabi arm-oe-linux-musleabi arm-poky-linux-musleabi arm-yoe-linux-musleabi,$$($(1)_compiler_preferred_target)),)
-+   $(1)_compiler_preferred_target := arm-linux-gnueabihf
-+  endif
-   ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
-    $(1)_compiler_preferred_target := arm-linux-gnueabi
-   endif
--  ifneq ($$(filter arm-%-gnueabihf,$$($(1)_compiler_preferred_target)),)
--   $(1)_compiler_preferred_target := arm-linux-gnueabihf
--  endif
-  endif
- endef
- 
--- 
-2.34.1
-
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
deleted file mode 100644
index 1f09790..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 57c3aafacde126786077afa7bfc07ec261acffaf Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul.barker@sancloud.com>
-Date: Wed, 27 Oct 2021 10:34:32 +0100
-Subject: [PATCH 2/2] Fix driver config for 5.10 kernel
-
-See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
-
-Upstream-Status: Pending
-Ref: BSP-66
-Signed-off-by: Paul Barker <paul.barker@sancloud.com>
----
- eurasia_km/eurasiacon/build/linux2/config/core.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/eurasia_km/eurasiacon/build/linux2/config/core.mk b/eurasia_km/eurasiacon/build/linux2/config/core.mk
-index 3f27926..18d515a 100644
---- a/eurasia_km/eurasiacon/build/linux2/config/core.mk
-+++ b/eurasia_km/eurasiacon/build/linux2/config/core.mk
-@@ -590,6 +590,7 @@ ifneq ($(BUFFERCLASS_MODULE),)
- $(eval $(call BothConfigMake,BUFFERCLASS_MODULE,$(BUFFERCLASS_MODULE)))
- endif
- 
-+PVR_LINUX_MEM_AREA_USE_VMAP = 1
- ifneq ($(strip $(KERNELDIR)),)
- PVR_LINUX_MEM_AREA_POOL_MAX_PAGES ?= 0
- ifneq ($(PVR_LINUX_MEM_AREA_POOL_MAX_PAGES),0)
--- 
-2.34.1
-
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index e6247e0..5657408 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -20,14 +20,11 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "ti-img-sgx/${PV}/k5.10"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
-    file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
-    file://0002-Fix-driver-config-for-5.10-kernel.patch \
-"
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "62f31de3ceed156bff32abb3dd03693a02df117e"
+SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
 
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
-- 
2.7.4

