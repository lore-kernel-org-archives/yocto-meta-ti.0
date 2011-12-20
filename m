Return-Path: <raj.khem@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DFF0E0030D
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 15:54:32 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by iapp10 with SMTP id p10so14978967iap.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 15:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/G936sjbqAnGNIdCh/4yQOzpX8iPWq5Xmz86KjY/1tI=;
	b=h04vTNQSxwSUWgm04N0yjww9Na7wbt6c98ZAwV1n4p/SiInaB8q3xvj2DHIPc2ZvzK
	Y88MXqOMx0KbwVbwRmmfizz8X4+TDltbNELc8yUutXq5KuvIRdTDkQcaihMS8x6ZcKlb
	yFU6DpCmd6JLhwCLwDmTAz3WeQdVd469in2xE=
Received: by 10.42.19.195 with SMTP id d3mr4308786icb.21.1324425271359;
	Tue, 20 Dec 2011 15:54:31 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id b20sm10094479ibj.7.2011.12.20.15.54.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 15:54:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Dec 2011 15:54:10 -0800
Message-Id: <1324425250-25536-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] u-boot_2011.09: Always use gnu ld for LD
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
X-List-Received-Date: Tue, 20 Dec 2011 23:54:32 -0000

u-boot wants GNU ld and cant link with gold
so when default linker is gold we make sure
that it still uses good old GNU ld

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch |   29 +++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.09.bb              |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch

diff --git a/recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch b/recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch
new file mode 100644
index 0000000..a527317
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/always-use-bfd-ld.patch
@@ -0,0 +1,29 @@
+This patch makes sure that we always use the GNU ld. u-boot uses certain contruct
+e.g. OVERLAY which are not implemented in gold therefore it always needs GNU ld
+for linking. It works well if default linker in toolchain is GNU ld but in some cases
+we can have gold to be the default linker and also ship GNU ld but not as default
+in such cases its called $(PREFIX)ld.bfd, with this patch we make sure that if
+$(PREFIX)ld.bfd exists than we use that for our ld. This way it does not matter
+what the default ld is.
+
+Upstream-status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/config.mk
++++ b/config.mk
+@@ -126,11 +126,13 @@ cc-option = $(strip $(if $(findstring $1
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
diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot_2011.09.bb
index 74c8518..7924fe3 100644
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
+           file://always-use-bfd-ld.patch \
            file://fw_env.config \
           "
 
-- 
1.7.5.4


