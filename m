Return-Path: <raj.khem@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27E7BE0123C
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2011 08:59:21 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by iapp10 with SMTP id p10so16595309iap.35
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2011 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4EIV7CJWid5eMnjjx9bf8p8nj0cgY1HHQL8iJPkrhgc=;
	b=PBbWqQiCQeqOH5P0W52t45kWXB3nZztAUXWLKLEr7NvhtwGunpbnUi7h31yNdl74Vz
	sVc15139VuqjALxVbnbb5YqAcMyQyvPZ3rKEfpx0N0XVH4SAToSnZFjUARSaxKlTlCm+
	lhEb9wUyr+QA0baKVjvK7fUe7DMEKPURs7cLI=
Received: by 10.50.153.135 with SMTP id vg7mr4477026igb.12.1324486759690;
	Wed, 21 Dec 2011 08:59:19 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id b20sm18857940ibj.7.2011.12.21.08.59.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 08:59:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 21 Dec 2011 08:59:01 -0800
Message-Id: <1324486741-23134-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] u-boot_2011.09: Always use gnu ld for LD
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2011 16:59:21 -0000

u-boot wants GNU ld and cant link with gold
so when default linker is gold we make sure
that it still uses good old GNU ld

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../u-boot/0001-config-Always-use-GNU-ld.patch     |   43 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.09.bb               |    3 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch

diff --git a/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
new file mode 100644
index 0000000..2564d1d
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
@@ -0,0 +1,43 @@
+From dff01fc9346e6f4e3386536df309d2e78f03f3ee Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2011 08:53:02 -0800
+Subject: [PATCH] config: Always use GNU ld
+
+This patch makes sure that we always use the GNU ld. u-boot uses certain
+construct e.g. OVERLAY which are not implemented in gold therefore it
+always needs GNU ld for linking. It works well if default linker in
+toolchain is GNU ld but in some cases we can have gold to be the
+default linker and also ship GNU ld but not as default in such cases
+its called $(PREFIX)ld.bfd, with this patch we make sure that if
+$(PREFIX)ld.bfd exists than we use that for our ld. This way it
+does not matter what the default ld is.
+
+Upstream-status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.mk |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index ddaa477..59b3e71 100644
+--- a/config.mk
++++ b/config.mk
+@@ -126,11 +126,13 @@ cc-option = $(strip $(if $(findstring $1,$(CC_OPTIONS)),$1,\
+ 		$(if $(call cc-option-sys,$1),$1,$2)))
+ endif
+ 
++exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; \
++		then echo "$(1)"; else echo "$(2)"; fi; )
+ #
+ # Include the make variables (CC, etc...)
+ #
+ AS	= $(CROSS_COMPILE)as
+-LD	= $(CROSS_COMPILE)ld
++LD	= $(call exists_bfd_ld, "$(CROSS_COMPILE)ld.bfd", "$(CROSS_COMPILE)ld")
+ CC	= $(CROSS_COMPILE)gcc
+ CPP	= $(CC) -E
+ AR	= $(CROSS_COMPILE)ar
+-- 
+1.7.5.4
+
diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot_2011.09.bb
index 74c8518..4a9d3cb 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
@@ -1,6 +1,6 @@
 require u-boot.inc
 
-PR = "r5"
+PR = "r6"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -32,6 +32,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.09/0019-BeagleBoard-config-Really-switch-to-ttyO2.patch \
            file://2011.09/0020-beagleboard-add-support-for-TCT-Beacon-board.patch \
            file://2011.09/0021-beagleboard-add-support-for-scanning-loop-through-ex.patch \
+           file://0001-config-Always-use-GNU-ld.patch \
            file://fw_env.config \
           "
 
-- 
1.7.5.4


