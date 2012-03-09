Return-Path: <raj.khem@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F17EE0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 23:49:29 -0800 (PST)
Received: by iagw33 with SMTP id w33so2402406iag.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 23:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fm3C/n0Tl5OSaN6u/RNU135wcyN1ZSmwk7ETL06y0JI=;
	b=nv25LokaTVJenpGIIlOD/OuKx2y63kSDUDiyjOiGslKEFGDU5FvMLZ00etxP3ESE6+
	iWzZiiV/CI5JPvELR2VKy50IO/H76MSuWkKTv7vNCAcNPQCXjgUhNxr7oDlu39qO46e6
	DnH438m1M/7lk7gaMAcFSZjB02XluPyJmlZSjBM9NgfmasWN+KQGbGjRGcnoEMFUffzz
	KxcQfwn1R/y/mxUsLlexcWsEnHwSPqa4nNUxSSkitiJhiOYgCkUrfRqpwRZ6HsqriKFm
	1sbOoY1JLRGNcEUlUU4MRkJZleUKX+hKw8e4xUEiUaGauQj1yPltWhC8LyaHbhfVzy84
	Vpbw==
Received: by 10.50.47.164 with SMTP id e4mr1353709ign.40.1331279368784;
	Thu, 08 Mar 2012 23:49:28 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id j4sm874524igq.5.2012.03.08.23.49.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 23:49:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 Mar 2012 23:49:01 -0800
Message-Id: <1331279341-12118-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] u-boot: Fix config-Always-use-GNU-ld patch to work with dash
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
X-List-Received-Date: Fri, 09 Mar 2012 07:49:29 -0000

>& /dev/null is not ok for dash so use > /dev/null 2>&1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../u-boot/0001-config-Always-use-GNU-ld.patch     |    8 ++++----
 .../2011.12/0007-config-Always-use-GNU-ld.patch    |   10 +++++-----
 recipes-bsp/u-boot/u-boot_2011.09.bb               |    2 +-
 recipes-bsp/u-boot/u-boot_2011.12.bb               |    2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
index 2564d1d..64685e3 100644
--- a/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
+++ b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
@@ -1,4 +1,4 @@
-From dff01fc9346e6f4e3386536df309d2e78f03f3ee Mon Sep 17 00:00:00 2001
+From a8dc33253472328f2af04973575f26e9106db1c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 21 Dec 2011 08:53:02 -0800
 Subject: [PATCH] config: Always use GNU ld
@@ -20,14 +20,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 files changed, 3 insertions(+), 1 deletions(-)
 
 diff --git a/config.mk b/config.mk
-index ddaa477..59b3e71 100644
+index ddaa477..139dfa0 100644
 --- a/config.mk
 +++ b/config.mk
 @@ -126,11 +126,13 @@ cc-option = $(strip $(if $(findstring $1,$(CC_OPTIONS)),$1,\
  		$(if $(call cc-option-sys,$1),$1,$2)))
  endif
  
-+exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; \
++exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v > /dev/null 2>&1; \
 +		then echo "$(1)"; else echo "$(2)"; fi; )
  #
  # Include the make variables (CC, etc...)
@@ -39,5 +39,5 @@ index ddaa477..59b3e71 100644
  CPP	= $(CC) -E
  AR	= $(CROSS_COMPILE)ar
 -- 
-1.7.5.4
+1.7.9.1
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch b/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch
index 15f22b3..64685e3 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch
@@ -1,7 +1,7 @@
-From 06fe8be6b5c70853c0e3fac93d7bba9cb3d0292f Mon Sep 17 00:00:00 2001
+From a8dc33253472328f2af04973575f26e9106db1c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 21 Dec 2011 08:53:02 -0800
-Subject: [PATCH 07/10] config: Always use GNU ld
+Subject: [PATCH] config: Always use GNU ld
 
 This patch makes sure that we always use the GNU ld. u-boot uses certain
 construct e.g. OVERLAY which are not implemented in gold therefore it
@@ -20,14 +20,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 files changed, 3 insertions(+), 1 deletions(-)
 
 diff --git a/config.mk b/config.mk
-index ddaa477..59b3e71 100644
+index ddaa477..139dfa0 100644
 --- a/config.mk
 +++ b/config.mk
 @@ -126,11 +126,13 @@ cc-option = $(strip $(if $(findstring $1,$(CC_OPTIONS)),$1,\
  		$(if $(call cc-option-sys,$1),$1,$2)))
  endif
  
-+exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; \
++exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v > /dev/null 2>&1; \
 +		then echo "$(1)"; else echo "$(2)"; fi; )
  #
  # Include the make variables (CC, etc...)
@@ -39,5 +39,5 @@ index ddaa477..59b3e71 100644
  CPP	= $(CC) -E
  AR	= $(CROSS_COMPILE)ar
 -- 
-1.7.2.5
+1.7.9.1
 
diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot_2011.09.bb
index 4a9d3cb..b164c77 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
@@ -1,6 +1,6 @@
 require u-boot.inc
 
-PR = "r6"
+PR = "r7"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 35ffd4b..9bbd31e 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r5"
+PR = "r6"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
-- 
1.7.9.1


