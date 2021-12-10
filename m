Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.691.1639095926005909204
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 16:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WiBeDTaB;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id o4so6907045pfp.13
        for <meta-ti@lists.yoctoproject.org>; Thu, 09 Dec 2021 16:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JFV/B7OzEdI3sCTxmCnASThLu43dFX1v5s91JLHbf3Y=;
        b=WiBeDTaBFBaKmfEavxpX1XZ6ZYWRsAh2HJxfGcbQNkzu7qxU2j4RuUGJRYzujLw3U3
         o/XoNVyT0ne2nSJ1RGxvCJYxYbD+o+vJtx9hywn5Za3sTOqHZuCCLDm0l31eb1BtL4HZ
         KCVMbmZuhkJ0Z62i7GsCxOvCk3s7NzTjppSGZdaqtGvarYhd43daKrs5sGzjCkXDcnE3
         5IgFaVGXtP3hRzOZAtEemsnRNOUSSs38dVehAxe2pswYQFjRCFdHx3dOjNLlc+k5HWWX
         2EEpii0lUX/jgmJp0Oms+iGrdZbHgdg5ZqCUBG041M9X5WEYRZHQ0yJZU5noNB/RdKNR
         PsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JFV/B7OzEdI3sCTxmCnASThLu43dFX1v5s91JLHbf3Y=;
        b=DxyKWvZ92uJbYt34eBOXMZZTCJwMB7GuBaKyTrP/O6o151eqipKv+tyJuND/8GEgW+
         OiTeY5Uyt3E5BnjAKoIIMhK2QgQcVTaPo9AVBv+Ml/UvtlyChkTfGpxez4mFpG4vxAHg
         c8oExWkUm0d6azgdsUZXzXESWgn9EHupXdfwiKtB7/sV2e8Vb+ml/CFvtynbcLQhgU4h
         Wbvkd0ozXT4IOzG9wvK6Fl5C/P7e7binR3C6fyUJJ9agrrk6hmZaetlhEYPtnf3VTa/K
         EWslS0b5l4BxQLVU94lk3y8NwWL0oUUanCcVz++4m4ziuVhiWjhO+pykZX9bdm0PqDoJ
         LEhA==
X-Gm-Message-State: AOAM531Hq5UxWCdHoOthRBxahoaMjluoVcSz+yz5t0ND6KO1M+nTHc4K
	L+bvGs56Ry0KlQbsgI955OsGO8RdHPawog==
X-Google-Smtp-Source: ABdhPJwXe64JIG0MrWufawFg2IDcB2S97AzSkyte1f+GDAW0oXXY9YEcw+I/lTAJQGAjWGqN4nKROA==
X-Received: by 2002:a05:6a00:1708:b0:4ad:57eb:3367 with SMTP id h8-20020a056a00170800b004ad57eb3367mr14761574pfc.27.1639095924863;
        Thu, 09 Dec 2021 16:25:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id d12sm886674pfu.91.2021.12.09.16.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 16:25:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2] ti-sgx-ddk-km: Fix build with kernel 5.10 and musl support
Date: Thu,  9 Dec 2021 16:25:22 -0800
Message-Id: <20211210002522.1561830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a patch to fix runtime problems loading the kernel module with
kernel 5.10

Adds support to build with musl targets

Add yoe to recognised OE distributions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>
---
v2: Add upstream status to patches

 ...mbedded-hardfp-toolchain-w-o-gnueabi.patch | 20 +++++++++----
 ...02-Fix-driver-config-for-5.10-kernel.patch | 29 +++++++++++++++++++
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  1 +
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  1 +
 4 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
index 15105eac..4f71ea9d 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
@@ -1,23 +1,33 @@
-From 755632b4f3a40996a12bc7816a9839af7112040a Mon Sep 17 00:00:00 2001
+From a1c191a020f6eebc9a94b641be1fca7885fc9dd2 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 9 Sep 2019 17:05:48 -0400
-Subject: [PATCH] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
+Subject: [PATCH 1/2] km: support OpenEmbedded hardfp toolchain w/o -gnueabihf
  suffix
 
+OE toolchains are not having armhf in its name but they still are armhf
+ABI, teach this to sgx module build system
+
+recognize musleabi in tuples as well
+
+Add yoe distro support
+
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  eurasia_km/eurasiacon/build/linux2/config/compiler.mk | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
-index dead2f9..2ba3e5e 100644
+index dead2f9..1b5f090 100644
 --- a/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
 +++ b/eurasia_km/eurasiacon/build/linux2/config/compiler.mk
 @@ -68,12 +68,12 @@ define calculate-compiler-preferred-target
    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
     $(1)_compiler_preferred_target := aarch64-linux-gnu
    endif
-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-gnueabi arm-yoe-linux-gnueabi arm-oe-linux-musleabi arm-poky-linux-musleabi arm-yoe-linux-musleabi,$$($(1)_compiler_preferred_target)),)
 +   $(1)_compiler_preferred_target := arm-linux-gnueabihf
 +  endif
    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
@@ -30,5 +40,5 @@ index dead2f9..2ba3e5e 100644
  endef
  
 -- 
-2.7.4
+2.34.1
 
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
new file mode 100644
index 00000000..1f097909
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0002-Fix-driver-config-for-5.10-kernel.patch
@@ -0,0 +1,29 @@
+From 57c3aafacde126786077afa7bfc07ec261acffaf Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul.barker@sancloud.com>
+Date: Wed, 27 Oct 2021 10:34:32 +0100
+Subject: [PATCH 2/2] Fix driver config for 5.10 kernel
+
+See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
+
+Upstream-Status: Pending
+Ref: BSP-66
+Signed-off-by: Paul Barker <paul.barker@sancloud.com>
+---
+ eurasia_km/eurasiacon/build/linux2/config/core.mk | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eurasia_km/eurasiacon/build/linux2/config/core.mk b/eurasia_km/eurasiacon/build/linux2/config/core.mk
+index 3f27926..18d515a 100644
+--- a/eurasia_km/eurasiacon/build/linux2/config/core.mk
++++ b/eurasia_km/eurasiacon/build/linux2/config/core.mk
+@@ -590,6 +590,7 @@ ifneq ($(BUFFERCLASS_MODULE),)
+ $(eval $(call BothConfigMake,BUFFERCLASS_MODULE,$(BUFFERCLASS_MODULE)))
+ endif
+ 
++PVR_LINUX_MEM_AREA_USE_VMAP = 1
+ ifneq ($(strip $(KERNELDIR)),)
+ PVR_LINUX_MEM_AREA_POOL_MAX_PAGES ?= 0
+ ifneq ($(PVR_LINUX_MEM_AREA_POOL_MAX_PAGES),0)
+-- 
+2.34.1
+
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 3848e84e..e6247e08 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -22,6 +22,7 @@ BRANCH = "ti-img-sgx/${PV}/k5.10"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
     file://0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch \
+    file://0002-Fix-driver-config-for-5.10-kernel.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 87bbb437..9d55122c 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -32,6 +32,7 @@ inherit update-rc.d
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 
 DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
+DEPENDS:append:libc-musl = " gcompat"
 RDEPENDS:${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
 
 RPROVIDES:${PN} = "libegl libgles1 libgles2 libgbm"
-- 
2.34.1

