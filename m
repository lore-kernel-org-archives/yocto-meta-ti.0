Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.795.1625679610235686444
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 10:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4EA1B40C86;
	Wed,  7 Jul 2021 17:40:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RmLQ05iFdAdA; Wed,  7 Jul 2021 17:40:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B5C3409B0;
	Wed,  7 Jul 2021 17:40:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7D2A317461B;
	Wed,  7 Jul 2021 13:40:04 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Gowtham Tammana <g-tammana@ti.com>
Subject: [PATCH][dunfell/master] ti-img-rogue-driver: support OE nodistro toolchain same as Poky
Date: Wed,  7 Jul 2021 13:39:58 -0400
Message-Id: <1625679598-51006-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Add OpenEmbedded "nodistro" internal toolchain triplet detection similar to
corresponding Poky one.

Cc: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...pport-OpenEmbedded-nodistro-internal-aarc.patch | 29 ++++++++++++++++++++++
 .../ti-img-rogue-driver_1.13.5776728.bb            |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
new file mode 100644
index 0000000..f021cc3
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
@@ -0,0 +1,29 @@
+From 80d32fee3d768abbd77cce77ea9a7574651460a9 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denis@denix.org>
+Date: Wed, 7 Jul 2021 13:11:56 -0400
+Subject: [PATCH] compiler: support OpenEmbedded "nodistro" internal aarch64
+ toolchain
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+---
+ build/linux/config/compiler.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/linux/config/compiler.mk b/build/linux/config/compiler.mk
+index 53a0bef..d788579 100644
+--- a/build/linux/config/compiler.mk
++++ b/build/linux/config/compiler.mk
+@@ -65,7 +65,7 @@ define calculate-compiler-preferred-target
+    ifneq ($$(filter i386-% i486-% i586-% i686-%,$$($(1)_compiler_preferred_target)),)
+     $(1)_compiler_preferred_target := i386-linux-gnu
+    endif
+-   ifneq ($$(filter aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
++   ifneq ($$(filter aarch64-oe-linux aarch64-poky-linux,$$($(1)_compiler_preferred_target)),)
+     $(1)_compiler_preferred_target := aarch64-linux-gnu
+    endif
+    ifneq ($$(filter armv7a-cros-linux-gnueabi armv7l-tizen-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
+-- 
+2.7.4
+
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
index ff3cbb8..e6edebd 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
@@ -19,7 +19,10 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "1.13-5776728/linux-k5.10"
 
-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH}"
+SRC_URI = " \
+    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
+    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

