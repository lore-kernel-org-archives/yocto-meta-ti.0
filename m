Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8A10E002A8
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 03:24:10 -0700 (PDT)
Received: by eekb45 with SMTP id b45so355827eek.35
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 03:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=f14Hirf3Ie5sY7/ZPpK/fJBmNmP990UXlXj3XY5HAUU=;
	b=DJCoF14yH7tMyWDK9+zyaiHFj+AKDoVisXkdBc2rLHcgThrzjjS/zQPbSd43rwIdp7
	kwVeZ957yUzVSy743rnA8b8HANUTkb5VmG/ovuHf34tl0V67s7nVQAPCZtzqn58MlRoa
	JX3fJUao9BVCcZBIHrmi2/A9/xijD4Ec6j+BCxiMcSpACCgppsyi6yaeAKSUm9prkYTK
	sh7Tt5+IFz87tMi5kokwLvfbOBRtlF0vMSjI9kz+iyAqFb4H/K5ZTm3roU5x2EB4z5Gv
	DkknSma/xZsWMUjzI5nYqK30+YdbHuq7Dlclt/45KlRIksZfmY38qvMK9hjfc8yyJGj+
	a8NA==
Received: by 10.14.37.199 with SMTP id y47mr11518558eea.111.1342002249301;
	Wed, 11 Jul 2012 03:24:09 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id s4sm4457564eef.2.2012.07.11.03.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 03:24:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Jul 2012 12:24:02 +0200
Message-Id: <1342002242-19003-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnb+ZIY0phtUmQd/3zm1A1d/wNFEIWrwUUl51amZm74rLtUko8fWzhbkBGdY9ogrJrkLqf0
Subject: [PATCH v2 8/8] u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Wed, 11 Jul 2012 10:24:11 -0000

All patches have been rediffed and boot tested

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Resending only patch 8 because the v1 wasusing the wrong set of patches, an earlier tree was copied instead of the one in $S

 ...add-option-to-boot-kernel-from-boot-in-ex.patch |   26 +++++++
 ...only-do-in-kernel-dhcp-when-using-NFS-use.patch |   35 ---------
 ...ddr_defs-change-DDR-timings-for-15x15-EVM.patch |   30 -------
 ...boot-kernel-from-boot-in-ext2-3-filesyste.patch |   27 -------
 ...ch => 0002-am335x_evm-set-bootdelay-to-1.patch} |   18 ++---
 ...make-MMC-rootfs-RO-on-boot-so-fsck-works.patch} |   12 +--
 ....patch => 0004-am335x_evm-switch-to-ext4.patch} |   14 ++--
 ...ge-mmc_load_uimage-to-load-at-a-fixed-add.patch |   49 ------------
 ...5x-evm-enable-i2c2-pinmux-for-beaglebone.patch} |   18 ++---
 ...vm-Fix-bone-pmic-shut-down-over-USB-power.patch |   82 --------------------
 ...tch => 0006-ext2load-increase-read-speed.patch} |   10 +--
 ...fix-ext2load-and-specify-partition-for-bo.patch |   30 +++++++
 ...-evm-turn-d-cache-on-globally-turn-it-off.patch |   46 -----------
 ...vm-load-uImage-from-boot-instead-of-VFAT.patch} |   18 ++---
 ...ort.patch => 0009-ext4fs-ls-load-support.patch} |   12 +--
 ...patch => 0010-am335x-switch-to-ext4-mode.patch} |   33 ++++----
 ...fix-ext2load-and-specify-partition-for-bo.patch |   28 -------
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |   31 ++++----
 18 files changed, 137 insertions(+), 382 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-only-do-in-kernel-dhcp-when-using-NFS-use.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-boot-kernel-from-boot-in-ext2-3-filesyste.patch
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0003-am335x_evm-set-bootdelay-to-1.patch => 0002-am335x_evm-set-bootdelay-to-1.patch} (57%)
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch => 0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch} (67%)
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0007-am335x_evm-switch-to-ext4.patch => 0004-am335x_evm-switch-to-ext4.patch} (66%)
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch => 0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch} (77%)
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0011-ext2load-increase-read-speed.patch => 0006-ext2load-increase-read-speed.patch} (88%)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch => 0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch} (71%)
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0014-ext4fs-ls-load-support.patch => 0009-ext4fs-ls-load-support.patch} (99%)
 rename recipes-bsp/u-boot/u-boot/2011.09git/{0015-am335x-switch-to-ext4-mode.patch => 0010-am335x-switch-to-ext4-mode.patch} (57%)
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch
new file mode 100644
index 0000000..03569d1
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch
@@ -0,0 +1,26 @@
+From 65ba75f46ec4c9749996ec290fa1c5e4e6264ce3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 1 Nov 2011 12:21:07 +0100
+Subject: [PATCH 01/10] am335x_evm: add option to boot kernel from /boot in
+ ext2/3 filesystem
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 44a8500..83ccb5a 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -75,6 +75,7 @@
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+ 		"env import -t $loadaddr $filesize\0" \
+ 	"mmc_load_uimage=fatload mmc ${mmc_dev} ${kloadaddr} ${bootfile}\0" \
++	"mmc_load_uimage_ext2=ext2load ${mmc_dev} ${kloadaddr} /boot/${bootfile}\0" \
+ 	"optargs=\0" \
+ 	"bootargs_defaults=setenv bootargs " \
+ 		"console=${console} " \
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-only-do-in-kernel-dhcp-when-using-NFS-use.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-only-do-in-kernel-dhcp-when-using-NFS-use.patch
deleted file mode 100644
index 1ccfe19..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-only-do-in-kernel-dhcp-when-using-NFS-use.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 557a773eb245f3f2508e40d6d8a6c593738fd46f Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 1 Nov 2011 12:19:54 +0100
-Subject: [PATCH 1/4] am335x_evm: only do in-kernel dhcp when using NFS, userspace will do dhcp otherwise
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 41a3316..93b3161 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -69,7 +69,7 @@
- 	"nfsopts=nolock\0" \
- 	"static_ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}" \
- 			"::off\0" \
--	"ip_method=dhcp\0" \
-+	"ip_method=none\0" \
- 	"bootenv=uEnv.txt\0" \
- 	"loadbootenv=fatload mmc ${mmc_dev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
-@@ -99,7 +99,7 @@
- 		"setenv bootargs ${bootargs} " \
- 		"root=/dev/nfs " \
- 		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
--		"ip=${ip_method}\0" \
-+		"ip=dhcp\0" \
- 	"mmc_boot=run mmc_args; " \
- 		"run mmc_load_uimage; " \
- 		"bootm ${loadaddr}\0" \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch
deleted file mode 100644
index 4563a2c..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7a3b3b04b1aed6a649d99396f914ec042968f924 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Thu, 9 Feb 2012 13:09:27 -0600
-Subject: [PATCH] ddr_defs: change DDR timings for 15x15 EVM
-
-* For cold silicon the DDR timings need to be relaxed in order for
-  the device to boot with DDR at 266MHz
-* Fix proposed by James Doublesin
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- arch/arm/include/asm/arch-ti81xx/ddr_defs.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/arch/arm/include/asm/arch-ti81xx/ddr_defs.h b/arch/arm/include/asm/arch-ti81xx/ddr_defs.h
-index 6c4b422..0b7ffe7 100644
---- a/arch/arm/include/asm/arch-ti81xx/ddr_defs.h
-+++ b/arch/arm/include/asm/arch-ti81xx/ddr_defs.h
-@@ -338,7 +338,7 @@
- #define DDR2_RD_DQS		0x40
- #define DDR2_PHY_FIFO_WE	0x56
- #else
--#define EMIF_READ_LATENCY	0x04
-+#define EMIF_READ_LATENCY	0x05
- #define EMIF_TIM1		0x0666B3D6
- #define EMIF_TIM2		0x143731DA
- #define	EMIF_TIM3		0x00000347
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-boot-kernel-from-boot-in-ext2-3-filesyste.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-boot-kernel-from-boot-in-ext2-3-filesyste.patch
deleted file mode 100644
index 61614f7..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-boot-kernel-from-boot-in-ext2-3-filesyste.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 206baf5d1d8eb19312c0c8216e6722a63548573d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 1 Nov 2011 12:21:07 +0100
-Subject: [PATCH 2/4] am335x_evm: add option to boot kernel from /boot in ext2/3 filesystem
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 93b3161..9bbfe3b 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -74,7 +74,8 @@
- 	"loadbootenv=fatload mmc ${mmc_dev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
- 		"env import -t $loadaddr $filesize\0" \
--	"mmc_load_uimage=fatload mmc ${mmc_dev} ${loadaddr} ${bootfile}\0" \
-+	"mmc_load_uimage=fatload mmc ${mmc_dev} ${loadaddr} ${bootfile}\0" \
-+	"mmc_load_uimage_ext2=ext2load ${mmc_dev} ${loadaddr} /boot/${bootfile}\0" \
- 	"optargs=\0" \
- 	"bootargs_defaults=setenv bootargs " \
- 		"console=${console} " \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch
similarity index 57%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch
index 3265540..fdce9c4 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch
@@ -1,26 +1,26 @@
-From bf513a05bc37f6d32e14c1e46d090773d1664c99 Mon Sep 17 00:00:00 2001
+From cb92653d26476880602a20b62da03a35d36d622e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 1 Nov 2011 12:21:38 +0100
-Subject: [PATCH 3/4] am335x_evm: set bootdelay to 1
+Subject: [PATCH 02/10] am335x_evm: set bootdelay to 1
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  include/configs/am335x_evm.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 9bbfe3b..6143dc3 100755
+index 83ccb5a..2558775 100755
 --- a/include/configs/am335x_evm.h
 +++ b/include/configs/am335x_evm.h
-@@ -38,7 +38,7 @@
- #define CONFIG_INITRD_TAG		/* Required for ramdisk support */
+@@ -127,7 +127,7 @@
  
+ #ifndef CONFIG_RESTORE_FLASH
  /* set to negative value for no autoboot */
 -#define CONFIG_BOOTDELAY		3
 +#define CONFIG_BOOTDELAY		1
  
- #define CONFIG_MMC
- #define CONFIG_NAND
+ #define CONFIG_BOOTCOMMAND \
+ 	"if mmc rescan; then " \
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
similarity index 67%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
index 7219554..8096df0 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
@@ -1,15 +1,15 @@
-From 63e5b3b4271917e0a3c5a4903a76fdfb30118d3c Mon Sep 17 00:00:00 2001
+From ca9a3452249bfda3d9a8096794b4fbfbf212d72f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 1 Nov 2011 12:22:30 +0100
-Subject: [PATCH 4/4] am335x-evm: make MMC rootfs RO on boot so fsck works
+Subject: [PATCH 03/10] am335x-evm: make MMC rootfs RO on boot so fsck works
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  include/configs/am335x_evm.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 6143dc3..56e36da 100755
+index 2558775..1b4fa37 100755
 --- a/include/configs/am335x_evm.h
 +++ b/include/configs/am335x_evm.h
 @@ -50,7 +50,7 @@
@@ -18,9 +18,9 @@ index 6143dc3..56e36da 100755
  	"mmc_dev=0\0" \
 -	"mmc_root=/dev/mmcblk0p2 rw\0" \
 +	"mmc_root=/dev/mmcblk0p2 ro\0" \
- 	"nand_root=/dev/mtdblock7 rw\0" \
+ 	"nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
  	"spi_root=/dev/mtdblock4 rw\0" \
  	"nor_root=/dev/mtdblock3 rw\0" \
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch
similarity index 66%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch
index 891af6c..3d8495e 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch
@@ -1,26 +1,26 @@
-From d2032a2932911159985451d76c547b4e6d99fb61 Mon Sep 17 00:00:00 2001
+From 97fa23e167d3e4b46c71a5fac1a5e9aa39f0a551 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 7 Nov 2011 21:33:32 +0100
-Subject: [PATCH 7/7] am335x_evm: switch to ext4
+Subject: [PATCH 04/10] am335x_evm: switch to ext4
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  include/configs/am335x_evm.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 8c0fae2..8bf3ff1 100755
+index 1b4fa37..3d37058 100755
 --- a/include/configs/am335x_evm.h
 +++ b/include/configs/am335x_evm.h
 @@ -54,7 +54,7 @@
- 	"nand_root=/dev/mtdblock7 rw\0" \
+ 	"nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
  	"spi_root=/dev/mtdblock4 rw\0" \
  	"nor_root=/dev/mtdblock3 rw\0" \
 -	"mmc_root_fs_type=ext3 rootwait\0" \
 +	"mmc_root_fs_type=ext4 rootwait\0" \
- 	"nand_root_fs_type=jffs2\0" \
+ 	"nand_root_fs_type=ubifs rootwait=1\0" \
  	"spi_root_fs_type=jffs2\0" \
  	"nor_root_fs_type=jffs2\0" \
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch
deleted file mode 100644
index 126ff24..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From bd152bec1086a35f426c53c9bb9f0c309e216037 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 Nov 2011 19:07:10 +0100
-Subject: [PATCH 5/5] am335x: Change mmc_load_uimage to load at a fixed address
- The kernel normally expects to be run from 0x80008000 so if we
- load from SD card at that-mkimage header we can save a copy of
- the kernel.
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 56e36da..8c0fae2 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -74,8 +74,8 @@
- 	"loadbootenv=fatload mmc ${mmc_dev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
- 		"env import -t $loadaddr $filesize\0" \
--	"mmc_load_uimage=fatload mmc ${mmc_dev} ${loadaddr} ${bootfile}\0" \
--	"mmc_load_uimage_ext2=ext2load ${mmc_dev} ${loadaddr} /boot/${bootfile}\0" \
-+	"mmc_load_uimage=fatload mmc ${mmc_dev} 0x80007fc0 ${bootfile}\0" \
-+	"mmc_load_uimage_ext2=ext2load ${mmc_dev} 0x80007fc0 /boot/${bootfile}\0" \
- 	"optargs=\0" \
- 	"bootargs_defaults=setenv bootargs " \
- 		"console=${console} " \
-@@ -103,7 +103,7 @@
- 		"ip=dhcp\0" \
- 	"mmc_boot=run mmc_args; " \
- 		"run mmc_load_uimage; " \
--		"bootm ${loadaddr}\0" \
-+		"bootm 0x80007fc0\0" \
- 	"nand_boot=echo Booting from nand ...; " \
- 		"run nand_args; " \
- 		"nand read.i ${loadaddr} ${nand_src_addr} ${nand_img_siz}; " \
-@@ -137,7 +137,7 @@
- 		"fi;" \
- 		"if run mmc_load_uimage; then " \
- 			"run mmc_args;" \
--			"bootm ${loadaddr};" \
-+			"bootm 0x80007fc0;" \
- 		"fi;" \
- 	"fi;" \
- 	"run nand_boot;" \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
similarity index 77%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
index b97fa16..fa2790d 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
@@ -1,18 +1,18 @@
-From 2df6e88944b98466e0b1225a873bfed005cea4e4 Mon Sep 17 00:00:00 2001
+From e2121ca4fd82f8313b764fe7fb24511ef7d10904 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 16 Nov 2011 18:57:12 +0100
-Subject: [PATCH] am335x-evm: enable i2c2 pinmux for beaglebone
+Subject: [PATCH 05/10] am335x-evm: enable i2c2 pinmux for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  board/ti/am335x/mux.c |   18 ++++++++++++++++++
- 1 files changed, 18 insertions(+), 0 deletions(-)
+ 1 file changed, 18 insertions(+)
 
 diff --git a/board/ti/am335x/mux.c b/board/ti/am335x/mux.c
-index d9956f3..313d5a5 100644
+index 885b33f..70645d4 100644
 --- a/board/ti/am335x/mux.c
 +++ b/board/ti/am335x/mux.c
-@@ -309,6 +309,12 @@ static struct module_pin_mux i2c1_pin_mux[] = {
+@@ -310,6 +310,12 @@ static struct module_pin_mux i2c1_pin_mux[] = {
  	{-1},
  };
  
@@ -25,7 +25,7 @@ index d9956f3..313d5a5 100644
  #ifndef CONFIG_NO_ETH
  static struct module_pin_mux rgmii1_pin_mux[] = {
  	{OFFSET(mii1_txen), MODE(2)},			/* RGMII1_TCTL */
-@@ -568,6 +574,7 @@ static struct evm_pin_mux low_cost_evm_pin_mux[] = {
+@@ -598,6 +604,7 @@ static struct evm_pin_mux sk_evm_pin_mux[] = {
  static struct evm_pin_mux beaglebone_pin_mux[] = {
  	{uart0_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
  	{i2c1_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_4, DEV_ON_BASEBOARD},
@@ -33,7 +33,7 @@ index d9956f3..313d5a5 100644
  #ifdef CONFIG_NAND
  	{nand_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3, DEV_ON_DGHTR_BRD},
  #endif
-@@ -587,6 +594,7 @@ static struct evm_pin_mux beaglebone_pin_mux[] = {
+@@ -617,6 +624,7 @@ static struct evm_pin_mux beaglebone_pin_mux[] = {
  static struct evm_pin_mux beaglebone_old_pin_mux[] = {
  	{uart0_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
  	{i2c1_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_4, DEV_ON_BASEBOARD},
@@ -41,7 +41,7 @@ index d9956f3..313d5a5 100644
  #ifdef CONFIG_NAND
  	{nand_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3, DEV_ON_DGHTR_BRD},
  #endif
-@@ -682,6 +690,16 @@ void enable_i2c0_pin_mux(void)
+@@ -713,6 +721,16 @@ void enable_i2c0_pin_mux(void)
  	configure_module_pin_mux(i2c0_pin_mux);
  }
  
@@ -59,5 +59,5 @@ index d9956f3..313d5a5 100644
  {
  	configure_module_pin_mux(uart0_pin_mux);
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
deleted file mode 100644
index 158483b..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 801316091ac7e14cc8fa9b0bd2cdce76bea06991 Mon Sep 17 00:00:00 2001
-From: Joel A Fernandes <joelagnel@ti.com>
-Date: Thu, 3 Nov 2011 22:19:19 -0500
-Subject: [PATCH v2] am335x-evm: Fix bone pmic shut down over USB power
-Cc: trini@ti.com,
-    chase.maupin@ti.com
-
-* Set DCDC2 to 1.2v for all power sources and board revs except for A1
-* Set USB current trip point to 1300mA for all boards and power sources.
-* Only Skip setting of MPU frequency to 720MHz for A1 and USB-powered boards.
-
-Credits to Jason for noticing this. Tested with several reboots over USB on a Rev A2/3.
-
-v2 changes:
-Take care of not upping DCDC2 and LDO voltages for A1.
-For A1- only operation done is to set the USB current limit.
-
-Signed-off-by: Jason Kridner <jdk@ti.com>
-Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
----
-Chase has volunteered to test this out on his A1.
-
- board/ti/am335x/evm.c |   31 ++++++++++++++++---------------
- 1 files changed, 16 insertions(+), 15 deletions(-)
-
-diff --git a/board/ti/am335x/evm.c b/board/ti/am335x/evm.c
-index e95a088..bc1119e 100644
---- a/board/ti/am335x/evm.c
-+++ b/board/ti/am335x/evm.c
-@@ -483,12 +483,20 @@ void spl_board_init(void)
- 		if (tps65217_reg_read(STATUS, &pmic_status_reg))
- 			return;
- 
-+		/* Increase USB current limit to 1300mA */
-+		if (tps65217_reg_write(PROT_LEVEL_NONE, POWER_PATH,
-+				       USB_INPUT_CUR_LIMIT_1300MA,
-+				       USB_INPUT_CUR_LIMIT_MASK))
-+			printf("tps65217_reg_write failure\n");
-+
- 		/* Only perform PMIC configurations if board rev > A1 */
- 		if (!strncmp(header.version, "00A1", 4))
- 			return;
- 
--		if (!(pmic_status_reg & PWR_SRC_AC_BITMASK)) {
--			printf("No AC power, disabling frequency switch\n");
-+		/* Set DCDC2 (MPU) voltage to 1.275V */
-+		if (tps65217_voltage_update(DEFDCDC2,
-+					     DCDC_VOLT_SEL_1275MV)) {
-+			printf("tps65217_voltage_update failure\n");
- 			return;
- 		}
- 
-@@ -501,20 +509,13 @@ void spl_board_init(void)
- 				       LDO_VOLTAGE_OUT_3_3, LDO_MASK))
- 			printf("tps65217_reg_write failure\n");
- 
--		/* Increase USB current limit to 1300mA */
--		if (tps65217_reg_write(PROT_LEVEL_NONE, POWER_PATH,
--				       USB_INPUT_CUR_LIMIT_1300MA,
--				       USB_INPUT_CUR_LIMIT_MASK))
--			printf("tps65217_reg_write failure\n");
--
--		/* Set DCDC2 (MPU) voltage to 1.275V */
--		if (!tps65217_voltage_update(DEFDCDC2,
--					     DCDC_VOLT_SEL_1275MV)) {
--			/* Set MPU Frequency to 720MHz */
--			mpu_pll_config(MPUPLL_M_720);
--		} else {
--			printf("tps65217_voltage_update failure\n");
-+		if (!(pmic_status_reg & PWR_SRC_AC_BITMASK)) {
-+			printf("No AC power, disabling frequency switch\n");
-+			return;
- 		}
-+
-+		/* Set MPU Frequency to 720MHz */
-+		mpu_pll_config(MPUPLL_M_720);
- 	} else {
- 		/* 
- 		 * EVM PMIC code.  PMIC voltage is configuring for frequency
--- 
-1.7.4.1
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch
similarity index 88%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch
index ba86266..ee33d90 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch
@@ -1,7 +1,7 @@
-From 486ce56b1203dd71bad310940b321d3ae13cadec Mon Sep 17 00:00:00 2001
-From: u-boot@lakedaemon.net <u-boot@lakedaemon.net>
+From f6894e8bc193d225267e4d58a633354e9937c93d Mon Sep 17 00:00:00 2001
+From: "u-boot@lakedaemon.net" <u-boot@lakedaemon.net>
 Date: Wed, 28 Mar 2012 04:37:11 +0000
-Subject: [PATCH 11/15] ext2load: increase read speed
+Subject: [PATCH 06/10] ext2load: increase read speed
 
 This patch dramatically drops the amount of time u-boot needs to read a
 file from an ext2 partition.  On a typical 2 to 5 MB file (kernels and
@@ -16,7 +16,7 @@ userspace, and then confirmed after ext2load.
 Signed-off-by: Jason Cooper <u-boot@lakedaemon.net>
 ---
  fs/ext2/ext2fs.c |   26 ++++++++++++++++++++++++--
- 1 files changed, 24 insertions(+), 2 deletions(-)
+ 1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/fs/ext2/ext2fs.c b/fs/ext2/ext2fs.c
 index e119e13..8531db5 100644
@@ -70,5 +70,5 @@ index e119e13..8531db5 100644
  	return (len);
  }
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
new file mode 100644
index 0000000..ba7cf03
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
@@ -0,0 +1,30 @@
+From 160a0a0145cbe4bca9c0f71286fc8529e57c21c4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 1 Apr 2012 22:57:37 +0200
+Subject: [PATCH 07/10] am335x-evm: fix ext2load and specify partition for
+ both fatload and ext2load
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 3d37058..a81d716 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -74,9 +74,8 @@
+ 	"loadbootenv=fatload mmc ${mmc_dev} ${loadaddr} ${bootenv}\0" \
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+ 		"env import -t $loadaddr $filesize\0" \
+-	"mmc_load_uimage=fatload mmc ${mmc_dev} ${kloadaddr} ${bootfile}\0" \
+-	"mmc_load_uimage_ext2=ext2load ${mmc_dev} ${kloadaddr} /boot/${bootfile}\0" \
+-	"optargs=\0" \
++	"mmc_load_uimage=fatload mmc ${mmc_dev}:1 ${kloadaddr} ${bootfile}\0" \
++	"mmc_load_uimage_ext2=ext2load mmc ${mmc_dev}:2 ${kloadaddr} /boot/${bootfile}\0" \
+ 	"bootargs_defaults=setenv bootargs " \
+ 		"console=${console} " \
+ 		"${optargs}\0" \
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch
deleted file mode 100644
index b79a884..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 31d430d8db335b7c3fea08b6aa8309b90b8f2cb9 Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Tue, 8 Nov 2011 08:07:47 +0100
-Subject: [PATCH 8/8] HACK: am335x evm: turn d-cache on globally, turn it off when doing nfs stuff
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- board/ti/am335x/evm.c        |   12 ++++++++++++
- include/configs/am335x_evm.h |    1 +
- 2 files changed, 13 insertions(+), 0 deletions(-)
-
-diff --git a/board/ti/am335x/evm.c b/board/ti/am335x/evm.c
-index bc1119e..e64626a 100644
---- a/board/ti/am335x/evm.c
-+++ b/board/ti/am335x/evm.c
-@@ -1041,3 +1041,15 @@ U_BOOT_CMD(
- 
- #endif /* CONFIG_NAND_TI81XX */
- #endif /* CONFIG_SPL_BUILD */
-+
-+/*
-+ * Not all drivers we use (such as ethernet) are dcache safe.  But
-+ * we need cache on to boot quickly enough.
-+ */
-+#ifndef CONFIG_SYS_DCACHE_OFF
-+void enable_caches(void)
-+{
-+	/* Enable D-cache. I-cache is already enabled in start.S */
-+	dcache_enable();
-+}
-+#endif
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 8bf3ff1..58fa2f6 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -119,6 +119,7 @@
- 		"bootm ${loadaddr}\0" \
- 	"net_boot=echo Booting from network ...; " \
- 		"setenv autoload no; " \
-+		"dcache off; " \
- 		"dhcp; " \
- 		"tftp ${loadaddr} ${bootfile}; " \
- 		"run net_args; " \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
similarity index 71%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
index 49720e9..70408b6 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
@@ -1,35 +1,35 @@
-From 4c7580268803485ecbc05c3da3e1bbb9f2f431e0 Mon Sep 17 00:00:00 2001
+From b01ee680bab7b40f6dc9b8087630e5c0251c6fcd Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 1 Apr 2012 23:10:22 +0200
-Subject: [PATCH 13/15] am335x-evm: load uImage from /boot instead of VFAT
+Subject: [PATCH 08/10] am335x-evm: load uImage from /boot instead of VFAT
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  include/configs/am335x_evm.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 9a4b407..b2628c5 100755
+index a81d716..e42febe 100755
 --- a/include/configs/am335x_evm.h
 +++ b/include/configs/am335x_evm.h
-@@ -102,7 +102,7 @@
+@@ -101,7 +101,7 @@
  		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
  		"ip=dhcp\0" \
  	"mmc_boot=run mmc_args; " \
 -		"run mmc_load_uimage; " \
 +		"run mmc_load_uimage_ext2; " \
- 		"bootm 0x80007fc0\0" \
+ 		"bootm ${kloadaddr}\0" \
  	"nand_boot=echo Booting from nand ...; " \
  		"run nand_args; " \
-@@ -136,7 +136,7 @@
+@@ -139,7 +139,7 @@
  			"echo Running uenvcmd ...;" \
  			"run uenvcmd;" \
  		"fi;" \
 -		"if run mmc_load_uimage; then " \
 +		"if run mmc_load_uimage_ext2; then " \
  			"run mmc_args;" \
- 			"bootm 0x80007fc0;" \
+ 			"bootm ${kloadaddr};" \
  		"fi;" \
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch
similarity index 99%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch
index bc81c18..37ef5d4 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch
@@ -1,7 +1,7 @@
-From 881674a3a8258bfc0f3a130503e2663c2f22817d Mon Sep 17 00:00:00 2001
-From: uma.shankar <uma.shankar@samsung.com>
+From 4e2f3f39a37883bddbe92a71045cb90f489e1d5f Mon Sep 17 00:00:00 2001
+From: "uma.shankar" <uma.shankar@samsung.com>
 Date: Mon, 9 Jan 2012 07:54:50 +0000
-Subject: [PATCH 14/15] ext4fs ls load support
+Subject: [PATCH 09/10] ext4fs ls load support
 
 Signed-off-by: Uma Shankar <uma.shankar@samsung.com>
 Signed-off-by: Manjunatha C Achar <a.manjunatha@samsung.com>
@@ -13,7 +13,7 @@ Signed-off-by: Hakgoo Lee <goodguy.lee@samsung.com>
  common/cmd_ext4.c     |  266 +++++++++++++++
  fs/Makefile           |    1 +
  fs/ext2/dev.c         |    1 +
- fs/ext2/ext2fs.c      |  181 ++---------
+ fs/ext2/ext2fs.c      |  181 ++--------
  fs/ext4/Makefile      |   51 +++
  fs/ext4/dev.c         |  145 ++++++++
  fs/ext4/ext4_common.c |  875 +++++++++++++++++++++++++++++++++++++++++++++++++
@@ -45,7 +45,7 @@ index 99b9278..6a5068d 100644
  LIBS += net/libnet.o
  LIBS += disk/libdisk.o
 diff --git a/common/Makefile b/common/Makefile
-index 54dc558..a1ccfd8 100644
+index 838ae25..b9b5c85 100644
 --- a/common/Makefile
 +++ b/common/Makefile
 @@ -87,6 +87,7 @@ COBJS-$(CONFIG_ENV_IS_IN_EEPROM) += cmd_eeprom.o
@@ -2358,5 +2358,5 @@ index 0000000..5d48021
 +};
 +#endif
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch
similarity index 57%
rename from recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch
rename to recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch
index 3a93289..4511b6b 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch
@@ -1,44 +1,45 @@
-From 89f08384d5048059ac0a8ab72b6a7a194513dc64 Mon Sep 17 00:00:00 2001
+From 9e1a99476875b1f1e6e34e70d9bf6e77d3ac8fba Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 4 Apr 2012 00:06:31 +0200
-Subject: [PATCH 15/15] am335x: switch to ext4 mode
+Subject: [PATCH 10/10] am335x: switch to ext4 mode
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- include/configs/am335x_evm.h |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
+ include/configs/am335x_evm.h |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index b2628c5..18d2cac 100755
+index e42febe..e2be380 100755
 --- a/include/configs/am335x_evm.h
 +++ b/include/configs/am335x_evm.h
-@@ -76,6 +76,7 @@
+@@ -75,7 +75,7 @@
+ 	"importbootenv=echo Importing environment from mmc ...; " \
  		"env import -t $loadaddr $filesize\0" \
- 	"mmc_load_uimage=fatload mmc ${mmc_dev}:1 0x80007fc0 ${bootfile}\0" \
- 	"mmc_load_uimage_ext2=ext2load mmc ${mmc_dev}:2 0x80007fc0 /boot/${bootfile}\0" \
-+	"mmc_load_uimage_ext4=ext4load mmc ${mmc_dev}:2 0x80007fc0 /boot/${bootfile}\0" \
- 	"optargs=\0" \
+ 	"mmc_load_uimage=fatload mmc ${mmc_dev}:1 ${kloadaddr} ${bootfile}\0" \
+-	"mmc_load_uimage_ext2=ext2load mmc ${mmc_dev}:2 ${kloadaddr} /boot/${bootfile}\0" \
++	"mmc_load_uimage_ext4=ext4load mmc ${mmc_dev}:2 ${kloadaddr} /boot/${bootfile}\0" \
  	"bootargs_defaults=setenv bootargs " \
  		"console=${console} " \
-@@ -102,7 +103,7 @@
+ 		"${optargs}\0" \
+@@ -101,7 +101,7 @@
  		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
  		"ip=dhcp\0" \
  	"mmc_boot=run mmc_args; " \
 -		"run mmc_load_uimage_ext2; " \
 +		"run mmc_load_uimage_ext4; " \
- 		"bootm 0x80007fc0\0" \
+ 		"bootm ${kloadaddr}\0" \
  	"nand_boot=echo Booting from nand ...; " \
  		"run nand_args; " \
-@@ -136,7 +137,7 @@
+@@ -139,7 +139,7 @@
  			"echo Running uenvcmd ...;" \
  			"run uenvcmd;" \
  		"fi;" \
 -		"if run mmc_load_uimage_ext2; then " \
 +		"if run mmc_load_uimage_ext4; then " \
  			"run mmc_args;" \
- 			"bootm 0x80007fc0;" \
+ 			"bootm ${kloadaddr};" \
  		"fi;" \
-@@ -404,6 +405,7 @@
+@@ -426,6 +426,7 @@
  #define CONFIG_DOS_PARTITION
  #define CONFIG_CMD_FAT
  #define CONFIG_CMD_EXT2
@@ -47,5 +48,5 @@ index b2628c5..18d2cac 100755
  
  /* Unsupported features */
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
deleted file mode 100644
index 8bd6a42..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6233c6274e86dad6bac240cf8703e0a0b3e14e27 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 1 Apr 2012 22:57:37 +0200
-Subject: [PATCH 12/15] am335x-evm: fix ext2load and specify partition for both fatload and ext2load
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 5a7e9a8..9a4b407 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -74,8 +74,8 @@
- 	"loadbootenv=fatload mmc ${mmc_dev} ${loadaddr} ${bootenv}\0" \
- 	"importbootenv=echo Importing environment from mmc ...; " \
- 		"env import -t $loadaddr $filesize\0" \
--	"mmc_load_uimage=fatload mmc ${mmc_dev} 0x80007fc0 ${bootfile}\0" \
--	"mmc_load_uimage_ext2=ext2load ${mmc_dev} 0x80007fc0 /boot/${bootfile}\0" \
-+	"mmc_load_uimage=fatload mmc ${mmc_dev}:1 0x80007fc0 ${bootfile}\0" \
-+	"mmc_load_uimage_ext2=ext2load mmc ${mmc_dev}:2 0x80007fc0 /boot/${bootfile}\0" \
- 	"optargs=\0" \
- 	"bootargs_defaults=setenv bootargs " \
- 		"console=${console} " \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 48bc618..c4b4ca7 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,32 +6,27 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r27"
+PR = "r28"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
 UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=int_am335xpsp_04.06.00.01-v2011.09-for-sdk-05.03.00.00 \
-           file://2011.09git/0001-am335x_evm-only-do-in-kernel-dhcp-when-using-NFS-use.patch \
-           file://2011.09git/0002-am335x_evm-boot-kernel-from-boot-in-ext2-3-filesyste.patch \
-           file://2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch \
-           file://2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch \
-           file://2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch \
-           file://2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch \
-           file://2011.09git/0007-am335x_evm-switch-to-ext4.patch \
-           file://2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch \
-           file://2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch \
-           file://2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch \
-           file://2011.09git/0011-ext2load-increase-read-speed.patch \
-           file://2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch \
-           file://2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch \
-           file://2011.09git/0014-ext4fs-ls-load-support.patch \
-           file://2011.09git/0015-am335x-switch-to-ext4-mode.patch \
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=master \
+           file://2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch \
+           file://2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch \
+           file://2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch \
+           file://2011.09git/0004-am335x_evm-switch-to-ext4.patch \
+           file://2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch \
+           file://2011.09git/0006-ext2load-increase-read-speed.patch \
+           file://2011.09git/0007-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch \
+           file://2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch \
+           file://2011.09git/0009-ext4fs-ls-load-support.patch \
+           file://2011.09git/0010-am335x-switch-to-ext4-mode.patch \
           "
 
-SRCREV = "f63b270e47f62f4d1a05b2001357e215966c6f5a"
+SRCREV = "ec687252299796639ff9bcb981804fbec7b445a4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-- 
1.7.10


