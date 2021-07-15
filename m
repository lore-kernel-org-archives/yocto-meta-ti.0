Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.609.1626366999474488498
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jul 2021 09:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48FD940C1C;
	Thu, 15 Jul 2021 16:36:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArVSv6KOmfxE; Thu, 15 Jul 2021 16:36:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3043C40BE9;
	Thu, 15 Jul 2021 16:36:36 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7CB41174639;
	Thu, 15 Jul 2021 12:36:35 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] ti-img-rogue-driver: unify with dunfell and fix double-patching
Date: Thu, 15 Jul 2021 12:36:35 -0400
Message-Id: <1626366995-42438-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

There was a discrepancy between master and dunfell where 2 different versions
of the same patch existed, so when syncing branches, it resulted in appying
the same change twice. This cleans it up.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...k-support-OE-toolchain-alongside-Poky-one.patch | 26 ----------------------
 .../ti-img-rogue-driver_1.13.5776728.bb            |  4 ++--
 2 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
deleted file mode 100644
index abe48df..0000000
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0d291f91d86e59d87ce023b4e7b89f6b00aa4aab Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denis@denix.org>
-Date: Sat, 27 Mar 2021 00:20:57 -0400
-Subject: [PATCH] compiler.mk: support OE toolchain alongside Poky one
-
-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
----
- build/linux/config/compiler.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
-index 53a0bef..d45d438 100644
---- a/build/linux/config/compiler.mk
-+++ b/build/linux/config/compiler.mk
-@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
-    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_preferred_target)),)
-     $(1)_compiler_preferred_target := i386-linux-gnu
-    endif
--   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
-+   ifneq ($$(filter aarch64-poky-linux aarch64-oe-linux,$$($(1)_compiler_preferred_target)),)
-     $(1)_compiler_preferred_target := aarch64-linux-gnu
-    endif
-    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
--- 
-2.7.4
-
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
index 00f1d81..e6edebd 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
@@ -19,8 +19,8 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "1.13-5776728/linux-k5.10"
 
-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
-    file://0001-compiler.mk-support-OE-toolchain-alongside-Poky-one.patch \
+SRC_URI = " \
+    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
     file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
 "
 
-- 
2.7.4

