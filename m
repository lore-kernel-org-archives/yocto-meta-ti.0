Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EAFAE00348
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:27 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id d41so1131520eek.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=gAKsFCqJmKsNGMOhIyig5zP4fkdfMlIWMmz40lvU/zU=;
	b=FEnzY/kl04DZcBcpg+DGIvyj29yxgVVc0RpTFhxsov86VFi62XGb3oK1HvYvsvuqxt
	C5AMILxYfbZHfVEN/YTsuM0Ay9tmK/FAcjubVSet6XfiyZFNpFWDFObwradAQYuZZSPB
	uFd4iWgy0fdG7UeAmD+5VHAUKkdy/w0HQyawZVQz1ID1m8MN7Ei75PSBh3lu3Tdq0wns
	FId8+PYZb4iyzlk1JoacENANAJj8Xcd7aIqeY7kGFsrD4m9HNMHDqb7rvoIvv0q/aVN/
	JHDZ2odOw4n/JWddyPseJ1eomsQCFHDKMpkA0G56R1eiRmpEn+OUEg5Ol/UzeI5ITbbo
	qGzQ==
Received: by 10.14.218.137 with SMTP id k9mr9117502eep.25.1343581767089;
	Sun, 29 Jul 2012 10:09:27 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id k48sm21540608eep.13.2012.07.29.10.09.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:30 +0200
Message-Id: <1343581714-20397-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmKWqxRMiUV1PTxCurj/dKlq+rqEKbp7bII8zJof7L+Hok5+cnDylv+OqJ2o0CXhXlyenGU
Subject: [PATCH][for-denzil 08/12] u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:29 -0000

All patches have been rediffed and boot tested

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...add-option-to-boot-kernel-from-boot-in-ex.patch |   26 +
 ...only-do-in-kernel-dhcp-when-using-NFS-use.patch |   35 -
 ...ddr_defs-change-DDR-timings-for-15x15-EVM.patch |   30 -
 ...boot-kernel-from-boot-in-ext2-3-filesyste.patch |   27 -
 .../0002-am335x_evm-set-bootdelay-to-1.patch       |   26 +
 ...-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch |   26 +
 .../0003-am335x_evm-set-bootdelay-to-1.patch       |   26 -
 ...-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch |   26 -
 .../0004-am335x_evm-switch-to-ext4.patch           |   26 +
 ...ge-mmc_load_uimage-to-load-at-a-fixed-add.patch |   49 -
 ...35x-evm-enable-i2c2-pinmux-for-beaglebone.patch |   63 +
 ...vm-Fix-bone-pmic-shut-down-over-USB-power.patch |   82 -
 .../0006-ext2load-increase-read-speed.patch        |   74 +
 ...fix-ext2load-and-specify-partition-for-bo.patch |   30 +
 .../0007-am335x_evm-switch-to-ext4.patch           |   26 -
 ...-evm-turn-d-cache-on-globally-turn-it-off.patch |   46 -
 ...evm-load-uImage-from-boot-instead-of-VFAT.patch |   35 +
 ...35x-evm-enable-i2c2-pinmux-for-beaglebone.patch |   63 -
 .../2011.09git/0009-ext4fs-ls-load-support.patch   | 2362 ++++++++++++++++++++
 .../0010-am335x-switch-to-ext4-mode.patch          |   52 +
 .../0011-ext2load-increase-read-speed.patch        |   74 -
 ...fix-ext2load-and-specify-partition-for-bo.patch |   28 -
 ...evm-load-uImage-from-boot-instead-of-VFAT.patch |   35 -
 .../2011.09git/0014-ext4fs-ls-load-support.patch   | 2362 --------------------
 .../0015-am335x-switch-to-ext4-mode.patch          |   51 -
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |   31 +-
 26 files changed, 2733 insertions(+), 2978 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-am335x_evm-only-do-in-kernel-dhcp-when-using-NFS-use.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-boot-kernel-from-boot-in-ext2-3-filesyste.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch

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
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch
new file mode 100644
index 0000000..fdce9c4
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0002-am335x_evm-set-bootdelay-to-1.patch
@@ -0,0 +1,26 @@
+From cb92653d26476880602a20b62da03a35d36d622e Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 1 Nov 2011 12:21:38 +0100
+Subject: [PATCH 02/10] am335x_evm: set bootdelay to 1
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 83ccb5a..2558775 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -127,7 +127,7 @@
+ 
+ #ifndef CONFIG_RESTORE_FLASH
+ /* set to negative value for no autoboot */
+-#define CONFIG_BOOTDELAY		3
++#define CONFIG_BOOTDELAY		1
+ 
+ #define CONFIG_BOOTCOMMAND \
+ 	"if mmc rescan; then " \
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
new file mode 100644
index 0000000..8096df0
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
@@ -0,0 +1,26 @@
+From ca9a3452249bfda3d9a8096794b4fbfbf212d72f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 1 Nov 2011 12:22:30 +0100
+Subject: [PATCH 03/10] am335x-evm: make MMC rootfs RO on boot so fsck works
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 2558775..1b4fa37 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -50,7 +50,7 @@
+ 	"script_addr=0x81900000\0" \
+ 	"console=ttyO0,115200n8\0" \
+ 	"mmc_dev=0\0" \
+-	"mmc_root=/dev/mmcblk0p2 rw\0" \
++	"mmc_root=/dev/mmcblk0p2 ro\0" \
+ 	"nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
+ 	"spi_root=/dev/mtdblock4 rw\0" \
+ 	"nor_root=/dev/mtdblock3 rw\0" \
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch
deleted file mode 100644
index 3265540..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bf513a05bc37f6d32e14c1e46d090773d1664c99 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 1 Nov 2011 12:21:38 +0100
-Subject: [PATCH 3/4] am335x_evm: set bootdelay to 1
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 9bbfe3b..6143dc3 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -38,7 +38,7 @@
- #define CONFIG_INITRD_TAG		/* Required for ramdisk support */
- 
- /* set to negative value for no autoboot */
--#define CONFIG_BOOTDELAY		3
-+#define CONFIG_BOOTDELAY		1
- 
- #define CONFIG_MMC
- #define CONFIG_NAND
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
deleted file mode 100644
index 7219554..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 63e5b3b4271917e0a3c5a4903a76fdfb30118d3c Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 1 Nov 2011 12:22:30 +0100
-Subject: [PATCH 4/4] am335x-evm: make MMC rootfs RO on boot so fsck works
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 6143dc3..56e36da 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -50,7 +50,7 @@
- 	"script_addr=0x81900000\0" \
- 	"console=ttyO0,115200n8\0" \
- 	"mmc_dev=0\0" \
--	"mmc_root=/dev/mmcblk0p2 rw\0" \
-+	"mmc_root=/dev/mmcblk0p2 ro\0" \
- 	"nand_root=/dev/mtdblock7 rw\0" \
- 	"spi_root=/dev/mtdblock4 rw\0" \
- 	"nor_root=/dev/mtdblock3 rw\0" \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch
new file mode 100644
index 0000000..3d8495e
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0004-am335x_evm-switch-to-ext4.patch
@@ -0,0 +1,26 @@
+From 97fa23e167d3e4b46c71a5fac1a5e9aa39f0a551 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 7 Nov 2011 21:33:32 +0100
+Subject: [PATCH 04/10] am335x_evm: switch to ext4
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 1b4fa37..3d37058 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -54,7 +54,7 @@
+ 	"nand_root=ubi0:rootfs rw ubi.mtd=7,2048\0" \
+ 	"spi_root=/dev/mtdblock4 rw\0" \
+ 	"nor_root=/dev/mtdblock3 rw\0" \
+-	"mmc_root_fs_type=ext3 rootwait\0" \
++	"mmc_root_fs_type=ext4 rootwait\0" \
+ 	"nand_root_fs_type=ubifs rootwait=1\0" \
+ 	"spi_root_fs_type=jffs2\0" \
+ 	"nor_root_fs_type=jffs2\0" \
+-- 
+1.7.10
+
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
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
new file mode 100644
index 0000000..fa2790d
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
@@ -0,0 +1,63 @@
+From e2121ca4fd82f8313b764fe7fb24511ef7d10904 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 16 Nov 2011 18:57:12 +0100
+Subject: [PATCH 05/10] am335x-evm: enable i2c2 pinmux for beaglebone
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ board/ti/am335x/mux.c |   18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/board/ti/am335x/mux.c b/board/ti/am335x/mux.c
+index 885b33f..70645d4 100644
+--- a/board/ti/am335x/mux.c
++++ b/board/ti/am335x/mux.c
+@@ -310,6 +310,12 @@ static struct module_pin_mux i2c1_pin_mux[] = {
+ 	{-1},
+ };
+ 
++static struct module_pin_mux i2c2_pin_mux[] = {
++	{OFFSET(uart1_ctsn), (MODE(3) | RXACTIVE | PULLUDEN | SLEWCTRL)},  /* I2C_DATA */
++	{OFFSET(uart1_rtsn), (MODE(3) | RXACTIVE | PULLUDEN | SLEWCTRL)}, /* I2C_SCLK */
++	{-1},
++};
++
+ #ifndef CONFIG_NO_ETH
+ static struct module_pin_mux rgmii1_pin_mux[] = {
+ 	{OFFSET(mii1_txen), MODE(2)},			/* RGMII1_TCTL */
+@@ -598,6 +604,7 @@ static struct evm_pin_mux sk_evm_pin_mux[] = {
+ static struct evm_pin_mux beaglebone_pin_mux[] = {
+ 	{uart0_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
+ 	{i2c1_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_4, DEV_ON_BASEBOARD},
++	{i2c2_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
+ #ifdef CONFIG_NAND
+ 	{nand_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3, DEV_ON_DGHTR_BRD},
+ #endif
+@@ -617,6 +624,7 @@ static struct evm_pin_mux beaglebone_pin_mux[] = {
+ static struct evm_pin_mux beaglebone_old_pin_mux[] = {
+ 	{uart0_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
+ 	{i2c1_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_4, DEV_ON_BASEBOARD},
++	{i2c2_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
+ #ifdef CONFIG_NAND
+ 	{nand_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3, DEV_ON_DGHTR_BRD},
+ #endif
+@@ -713,6 +721,16 @@ void enable_i2c0_pin_mux(void)
+ 	configure_module_pin_mux(i2c0_pin_mux);
+ }
+ 
++void enable_i2c1_pin_mux(void)
++{
++	configure_module_pin_mux(i2c1_pin_mux);
++}
++
++void enable_i2c2_pin_mux(void)
++{
++	configure_module_pin_mux(i2c2_pin_mux);
++}
++
+ void enable_uart0_pin_mux(void)
+ {
+ 	configure_module_pin_mux(uart0_pin_mux);
+-- 
+1.7.10
+
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
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch
new file mode 100644
index 0000000..ee33d90
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0006-ext2load-increase-read-speed.patch
@@ -0,0 +1,74 @@
+From f6894e8bc193d225267e4d58a633354e9937c93d Mon Sep 17 00:00:00 2001
+From: "u-boot@lakedaemon.net" <u-boot@lakedaemon.net>
+Date: Wed, 28 Mar 2012 04:37:11 +0000
+Subject: [PATCH 06/10] ext2load: increase read speed
+
+This patch dramatically drops the amount of time u-boot needs to read a
+file from an ext2 partition.  On a typical 2 to 5 MB file (kernels and
+initrds) it goes from tens of seconds to a couple seconds.
+
+All we are doing here is grouping contiguous blocks into one read.
+
+Boot tested on Globalscale Technologies Dreamplug (Kirkwood ARM SoC)
+with three different files.  sha1sums were calculated in Linux
+userspace, and then confirmed after ext2load.
+
+Signed-off-by: Jason Cooper <u-boot@lakedaemon.net>
+---
+ fs/ext2/ext2fs.c |   26 ++++++++++++++++++++++++--
+ 1 file changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/fs/ext2/ext2fs.c b/fs/ext2/ext2fs.c
+index e119e13..8531db5 100644
+--- a/fs/ext2/ext2fs.c
++++ b/fs/ext2/ext2fs.c
+@@ -414,7 +414,6 @@ int ext2fs_read_file
+ 		if (blknr < 0) {
+ 			return (-1);
+ 		}
+-		blknr = blknr << log2blocksize;
+ 
+ 		/* Last block.  */
+ 		if (i == blockcnt - 1) {
+@@ -432,6 +431,29 @@ int ext2fs_read_file
+ 			blockend -= skipfirst;
+ 		}
+ 
++		/* grab middle blocks in one go */
++		if (i != pos / blocksize && i != blockcnt - 1 && blockcnt > 3) {
++			int oldblk = blknr;
++			int blocknxt;
++			while (i < blockcnt - 1) {
++				blocknxt = ext2fs_read_block(node, i + 1);
++				if (blocknxt == (oldblk + 1)) {
++					oldblk = blocknxt;
++					i++;
++				} else {
++					blocknxt = ext2fs_read_block(node, i);
++					break;
++				}
++			}
++
++			if (oldblk == blknr)
++				blockend = blocksize;
++			else
++				blockend = (1 + blocknxt - blknr) * blocksize;
++		}
++
++		blknr = blknr << log2blocksize;
++
+ 		/* If the block number is 0 this block is not stored on disk but
+ 		   is zero filled instead.  */
+ 		if (blknr) {
+@@ -444,7 +466,7 @@ int ext2fs_read_file
+ 		} else {
+ 			memset (buf, 0, blocksize - skipfirst);
+ 		}
+-		buf += blocksize - skipfirst;
++		buf += blockend - skipfirst;
+ 	}
+ 	return (len);
+ }
+-- 
+1.7.10
+
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
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch
deleted file mode 100644
index 891af6c..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0007-am335x_evm-switch-to-ext4.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d2032a2932911159985451d76c547b4e6d99fb61 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 7 Nov 2011 21:33:32 +0100
-Subject: [PATCH 7/7] am335x_evm: switch to ext4
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 8c0fae2..8bf3ff1 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -54,7 +54,7 @@
- 	"nand_root=/dev/mtdblock7 rw\0" \
- 	"spi_root=/dev/mtdblock4 rw\0" \
- 	"nor_root=/dev/mtdblock3 rw\0" \
--	"mmc_root_fs_type=ext3 rootwait\0" \
-+	"mmc_root_fs_type=ext4 rootwait\0" \
- 	"nand_root_fs_type=jffs2\0" \
- 	"spi_root_fs_type=jffs2\0" \
- 	"nor_root_fs_type=jffs2\0" \
--- 
-1.7.2.5
-
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
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
new file mode 100644
index 0000000..70408b6
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
@@ -0,0 +1,35 @@
+From b01ee680bab7b40f6dc9b8087630e5c0251c6fcd Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 1 Apr 2012 23:10:22 +0200
+Subject: [PATCH 08/10] am335x-evm: load uImage from /boot instead of VFAT
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index a81d716..e42febe 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -101,7 +101,7 @@
+ 		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
+ 		"ip=dhcp\0" \
+ 	"mmc_boot=run mmc_args; " \
+-		"run mmc_load_uimage; " \
++		"run mmc_load_uimage_ext2; " \
+ 		"bootm ${kloadaddr}\0" \
+ 	"nand_boot=echo Booting from nand ...; " \
+ 		"run nand_args; " \
+@@ -139,7 +139,7 @@
+ 			"echo Running uenvcmd ...;" \
+ 			"run uenvcmd;" \
+ 		"fi;" \
+-		"if run mmc_load_uimage; then " \
++		"if run mmc_load_uimage_ext2; then " \
+ 			"run mmc_args;" \
+ 			"bootm ${kloadaddr};" \
+ 		"fi;" \
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
deleted file mode 100644
index b97fa16..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2df6e88944b98466e0b1225a873bfed005cea4e4 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 16 Nov 2011 18:57:12 +0100
-Subject: [PATCH] am335x-evm: enable i2c2 pinmux for beaglebone
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- board/ti/am335x/mux.c |   18 ++++++++++++++++++
- 1 files changed, 18 insertions(+), 0 deletions(-)
-
-diff --git a/board/ti/am335x/mux.c b/board/ti/am335x/mux.c
-index d9956f3..313d5a5 100644
---- a/board/ti/am335x/mux.c
-+++ b/board/ti/am335x/mux.c
-@@ -309,6 +309,12 @@ static struct module_pin_mux i2c1_pin_mux[] = {
- 	{-1},
- };
- 
-+static struct module_pin_mux i2c2_pin_mux[] = {
-+	{OFFSET(uart1_ctsn), (MODE(3) | RXACTIVE | PULLUDEN | SLEWCTRL)},  /* I2C_DATA */
-+	{OFFSET(uart1_rtsn), (MODE(3) | RXACTIVE | PULLUDEN | SLEWCTRL)}, /* I2C_SCLK */
-+	{-1},
-+};
-+
- #ifndef CONFIG_NO_ETH
- static struct module_pin_mux rgmii1_pin_mux[] = {
- 	{OFFSET(mii1_txen), MODE(2)},			/* RGMII1_TCTL */
-@@ -568,6 +574,7 @@ static struct evm_pin_mux low_cost_evm_pin_mux[] = {
- static struct evm_pin_mux beaglebone_pin_mux[] = {
- 	{uart0_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
- 	{i2c1_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_4, DEV_ON_BASEBOARD},
-+	{i2c2_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
- #ifdef CONFIG_NAND
- 	{nand_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3, DEV_ON_DGHTR_BRD},
- #endif
-@@ -587,6 +594,7 @@ static struct evm_pin_mux beaglebone_pin_mux[] = {
- static struct evm_pin_mux beaglebone_old_pin_mux[] = {
- 	{uart0_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
- 	{i2c1_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_4, DEV_ON_BASEBOARD},
-+	{i2c2_pin_mux, PROFILE_ALL, DEV_ON_BASEBOARD},
- #ifdef CONFIG_NAND
- 	{nand_pin_mux, PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3, DEV_ON_DGHTR_BRD},
- #endif
-@@ -682,6 +690,16 @@ void enable_i2c0_pin_mux(void)
- 	configure_module_pin_mux(i2c0_pin_mux);
- }
- 
-+void enable_i2c1_pin_mux(void)
-+{
-+	configure_module_pin_mux(i2c1_pin_mux);
-+}
-+
-+void enable_i2c2_pin_mux(void)
-+{
-+	configure_module_pin_mux(i2c2_pin_mux);
-+}
-+
- void enable_uart0_pin_mux(void)
- {
- 	configure_module_pin_mux(uart0_pin_mux);
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch
new file mode 100644
index 0000000..37ef5d4
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0009-ext4fs-ls-load-support.patch
@@ -0,0 +1,2362 @@
+From 4e2f3f39a37883bddbe92a71045cb90f489e1d5f Mon Sep 17 00:00:00 2001
+From: "uma.shankar" <uma.shankar@samsung.com>
+Date: Mon, 9 Jan 2012 07:54:50 +0000
+Subject: [PATCH 09/10] ext4fs ls load support
+
+Signed-off-by: Uma Shankar <uma.shankar@samsung.com>
+Signed-off-by: Manjunatha C Achar <a.manjunatha@samsung.com>
+Signed-off-by: Iqbal Shareef <iqbal.ams@samsung.com>
+Signed-off-by: Hakgoo Lee <goodguy.lee@samsung.com>
+---
+ Makefile              |    2 +-
+ common/Makefile       |    1 +
+ common/cmd_ext4.c     |  266 +++++++++++++++
+ fs/Makefile           |    1 +
+ fs/ext2/dev.c         |    1 +
+ fs/ext2/ext2fs.c      |  181 ++--------
+ fs/ext4/Makefile      |   51 +++
+ fs/ext4/dev.c         |  145 ++++++++
+ fs/ext4/ext4_common.c |  875 +++++++++++++++++++++++++++++++++++++++++++++++++
+ fs/ext4/ext4_common.h |   63 ++++
+ fs/ext4/ext4fs.c      |  228 +++++++++++++
+ include/ext4fs.h      |  132 ++++++++
+ include/ext_common.h  |  188 +++++++++++
+ 13 files changed, 1977 insertions(+), 157 deletions(-)
+ create mode 100644 common/cmd_ext4.c
+ create mode 100644 fs/ext4/Makefile
+ create mode 100644 fs/ext4/dev.c
+ create mode 100644 fs/ext4/ext4_common.c
+ create mode 100644 fs/ext4/ext4_common.h
+ create mode 100644 fs/ext4/ext4fs.c
+ create mode 100644 include/ext4fs.h
+ create mode 100644 include/ext_common.h
+
+diff --git a/Makefile b/Makefile
+index 99b9278..6a5068d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -226,7 +226,7 @@ LIBS += arch/arm/cpu/ixp/npe/libnpe.o
+ endif
+ LIBS += arch/$(ARCH)/lib/lib$(ARCH).o
+ LIBS += fs/cramfs/libcramfs.o fs/fat/libfat.o fs/fdos/libfdos.o fs/jffs2/libjffs2.o \
+-	fs/reiserfs/libreiserfs.o fs/ext2/libext2fs.o fs/yaffs2/libyaffs2.o \
++	fs/reiserfs/libreiserfs.o fs/ext2/libext2fs.o fs/ext4/libext4fs.o fs/yaffs2/libyaffs2.o \
+ 	fs/ubifs/libubifs.o
+ LIBS += net/libnet.o
+ LIBS += disk/libdisk.o
+diff --git a/common/Makefile b/common/Makefile
+index 838ae25..b9b5c85 100644
+--- a/common/Makefile
++++ b/common/Makefile
+@@ -87,6 +87,7 @@ COBJS-$(CONFIG_ENV_IS_IN_EEPROM) += cmd_eeprom.o
+ COBJS-$(CONFIG_CMD_EEPROM) += cmd_eeprom.o
+ COBJS-$(CONFIG_CMD_ELF) += cmd_elf.o
+ COBJS-$(CONFIG_SYS_HUSH_PARSER) += cmd_exit.o
++COBJS-$(CONFIG_CMD_EXT4) += cmd_ext4.o
+ COBJS-$(CONFIG_CMD_EXT2) += cmd_ext2.o
+ COBJS-$(CONFIG_CMD_FAT) += cmd_fat.o
+ COBJS-$(CONFIG_CMD_FDC)$(CONFIG_CMD_FDOS) += cmd_fdc.o
+diff --git a/common/cmd_ext4.c b/common/cmd_ext4.c
+new file mode 100644
+index 0000000..2c53d2c
+--- /dev/null
++++ b/common/cmd_ext4.c
+@@ -0,0 +1,266 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * Ext4fs support
++ * made from existing cmd_ext2.c file of Uboot
++ *
++ * (C) Copyright 2004
++ * esd gmbh <www.esd-electronics.com>
++ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
++ *
++ * made from cmd_reiserfs by
++ *
++ * (C) Copyright 2003 - 2004
++ * Sysgo Real-Time Solutions, AG <www.elinos.com>
++ * Pavel Bartusek <pba@sysgo.com>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ *
++ */
++
++/*
++ * Changelog:
++ *	0.1 - Newly created file for ext4fs support. Taken from cmd_ext2.c
++ *	        file in uboot. Added ext4fs ls and load support.
++ */
++
++#include <common.h>
++#include <part.h>
++#include <config.h>
++#include <command.h>
++#include <image.h>
++#include <linux/ctype.h>
++#include <asm/byteorder.h>
++#include <ext_common.h>
++#include <ext4fs.h>
++#include <linux/stat.h>
++#include <malloc.h>
++
++#if defined(CONFIG_CMD_USB) && defined(CONFIG_USB_STORAGE)
++#include <usb.h>
++#endif
++
++#if !defined(CONFIG_DOS_PARTITION) && !defined(CONFIG_EFI_PARTITION)
++#error DOS or EFI partition support must be selected
++#endif
++
++uint64_t total_sector;
++uint64_t part_offset;
++
++#define DOS_PART_MAGIC_OFFSET	0x1fe
++#define DOS_FS_TYPE_OFFSET	0x36
++#define DOS_FS32_TYPE_OFFSET	0x52
++
++static int do_ext4_load(cmd_tbl_t *cmdtp, int flag, int argc,
++						char *const argv[])
++{
++	char *filename = NULL;
++	char *ep;
++	int dev;
++	unsigned long part = 1;
++	ulong addr = 0;
++	ulong part_length;
++	int filelen;
++	disk_partition_t info;
++	struct ext_filesystem *fs;
++	char buf[12];
++	unsigned long count;
++	const char *addr_str;
++
++	count = 0;
++	addr = simple_strtoul(argv[3], NULL, 16);
++	filename = getenv("bootfile");
++	switch (argc) {
++	case 3:
++		addr_str = getenv("loadaddr");
++		if (addr_str != NULL)
++			addr = simple_strtoul(addr_str, NULL, 16);
++		else
++			addr = CONFIG_SYS_LOAD_ADDR;
++
++		break;
++	case 4:
++		break;
++	case 5:
++		filename = argv[4];
++		break;
++	case 6:
++		filename = argv[4];
++		count = simple_strtoul(argv[5], NULL, 16);
++		break;
++
++	default:
++		return cmd_usage(cmdtp);
++	}
++
++	if (!filename) {
++		puts("** No boot file defined **\n");
++		return 1;
++	}
++
++	dev = (int)simple_strtoul(argv[2], &ep, 16);
++	ext4_dev_desc = get_dev(argv[1], dev);
++	if (ext4_dev_desc == NULL) {
++		printf("** Block device %s %d not supported\n", argv[1], dev);
++		return 1;
++	}
++	if (init_fs(ext4_dev_desc))
++		return 1;
++
++	fs = get_fs();
++	if (*ep) {
++		if (*ep != ':') {
++			puts("** Invalid boot device, use `dev[:part]' **\n");
++			return 1;
++		}
++		part = simple_strtoul(++ep, NULL, 16);
++	}
++
++	if (part != 0) {
++		if (get_partition_info(fs->dev_desc, part, &info)) {
++			printf("** Bad partition %lu **\n", part);
++			return 1;
++		}
++
++		if (strncmp((char *)info.type, BOOT_PART_TYPE,
++			    strlen(BOOT_PART_TYPE)) != 0) {
++			printf("** Invalid partition type \"%s\""
++			       " (expect \"" BOOT_PART_TYPE "\")\n", info.type);
++			return 1;
++		}
++		printf("Loading file \"%s\" "
++		       "from %s device %d:%lu %s\n",
++		       filename, argv[1], dev, part, info.name);
++	} else {
++		printf("Loading file \"%s\" from %s device %d\n",
++		       filename, argv[1], dev);
++	}
++
++	part_length = ext4fs_set_blk_dev(fs->dev_desc, part);
++	if (part_length == 0) {
++		printf("**Bad partition - %s %d:%lu **\n", argv[1], dev, part);
++		ext4fs_close();
++		return 1;
++	}
++
++	if (!ext4fs_mount(part_length)) {
++		printf("** Bad ext2 partition or disk - %s %d:%lu **\n",
++		       argv[1], dev, part);
++		ext4fs_close();
++		return 1;
++	}
++
++	filelen = ext4fs_open(filename);
++	if (filelen < 0) {
++		printf("** File not found %s\n", filename);
++		ext4fs_close();
++		return 1;
++	}
++	if ((count < filelen) && (count != 0))
++		filelen = count;
++
++	if (ext4fs_read((char *)addr, filelen) != filelen) {
++		printf("** Unable to read \"%s\" from %s %d:%lu **\n",
++		       filename, argv[1], dev, part);
++		ext4fs_close();
++		return 1;
++	}
++
++	ext4fs_close();
++	deinit_fs(fs->dev_desc);
++	/* Loading ok, update default load address */
++	load_addr = addr;
++
++	printf("%d bytes read\n", filelen);
++	sprintf(buf, "%X", filelen);
++	setenv("filesize", buf);
++
++	return 0;
++}
++
++static int do_ext4_ls(cmd_tbl_t *cmdtp, int flag, int argc, char *const argv[])
++{
++	const char *filename = "/";
++	int dev;
++	unsigned long part = 1;
++	char *ep;
++	struct ext_filesystem *fs;
++	int part_length;
++
++	if (argc < 3)
++		return cmd_usage(cmdtp);
++
++	dev = (int)simple_strtoul(argv[2], &ep, 16);
++	ext4_dev_desc = get_dev(argv[1], dev);
++
++	if (ext4_dev_desc == NULL) {
++		printf("\n** Block device %s %d not supported\n", argv[1], dev);
++		return 1;
++	}
++
++	if (init_fs(ext4_dev_desc))
++		return 1;
++
++	fs = get_fs();
++	if (*ep) {
++		if (*ep != ':') {
++			puts("\n** Invalid boot device, use `dev[:part]' **\n");
++			return 1;
++		}
++		part = simple_strtoul(++ep, NULL, 16);
++	}
++
++	if (argc == 4)
++		filename = argv[3];
++
++	part_length = ext4fs_set_blk_dev(fs->dev_desc, part);
++	if (part_length == 0) {
++		printf("** Bad partition - %s %d:%lu **\n", argv[1], dev, part);
++		ext4fs_close();
++		return 1;
++	}
++
++	if (!ext4fs_mount(part_length)) {
++		printf("** Bad ext2 partition or disk - %s %d:%lu **\n",
++		       argv[1], dev, part);
++		ext4fs_close();
++		return 1;
++	}
++	if (ext4fs_ls(filename)) {
++		printf("** Error ext2fs_ls() **\n");
++		ext4fs_close();
++		return 1;
++	};
++
++	ext4fs_close();
++	deinit_fs(fs->dev_desc);
++
++	return 0;
++}
++
++U_BOOT_CMD(ext4ls, 4, 1, do_ext4_ls,
++	   "list files in a directory (default /)",
++	   "<interface> <dev[:part]> [directory]\n"
++	   "	  - list files from 'dev' on 'interface' in a 'directory'");
++
++U_BOOT_CMD(ext4load, 6, 0, do_ext4_load,
++	   "load binary file from a Ext2 filesystem",
++	   "<interface> <dev[:part]> [addr] [filename] [bytes]\n"
++	   "	  - load binary file 'filename' from 'dev' on 'interface'\n"
++	   "		 to address 'addr' from ext2 filesystem");
+diff --git a/fs/Makefile b/fs/Makefile
+index 22aad12..00a8f37 100644
+--- a/fs/Makefile
++++ b/fs/Makefile
+@@ -23,6 +23,7 @@
+ #
+ 
+ subdirs-$(CONFIG_CMD_CRAMFS) := cramfs
++subdirs-$(CONFIG_CMD_EXT4) += ext4
+ subdirs-$(CONFIG_CMD_EXT2) += ext2
+ subdirs-$(CONFIG_CMD_FAT) += fat
+ subdirs-$(CONFIG_CMD_FDOS) += fdos
+diff --git a/fs/ext2/dev.c b/fs/ext2/dev.c
+index 78851d0..339a16e 100644
+--- a/fs/ext2/dev.c
++++ b/fs/ext2/dev.c
+@@ -27,6 +27,7 @@
+ #include <common.h>
+ #include <config.h>
+ #include <ext2fs.h>
++#include <ext_common.h>
+ 
+ static block_dev_desc_t *ext2fs_block_dev_desc;
+ static disk_partition_t part_info;
+diff --git a/fs/ext2/ext2fs.c b/fs/ext2/ext2fs.c
+index 8531db5..ea3d98c 100644
+--- a/fs/ext2/ext2fs.c
++++ b/fs/ext2/ext2fs.c
+@@ -25,152 +25,16 @@
+ 
+ #include <common.h>
+ #include <ext2fs.h>
++#include <ext_common.h>
+ #include <malloc.h>
+ #include <asm/byteorder.h>
+ 
+ extern int ext2fs_devread (int sector, int byte_offset, int byte_len,
+ 			   char *buf);
+ 
+-/* Magic value used to identify an ext2 filesystem.  */
+-#define	EXT2_MAGIC		0xEF53
+-/* Amount of indirect blocks in an inode.  */
+-#define INDIRECT_BLOCKS		12
+-/* Maximum lenght of a pathname.  */
+-#define EXT2_PATH_MAX		4096
+-/* Maximum nesting of symlinks, used to prevent a loop.  */
+-#define	EXT2_MAX_SYMLINKCNT	8
+-
+-/* Filetype used in directory entry.  */
+-#define	FILETYPE_UNKNOWN	0
+-#define	FILETYPE_REG		1
+-#define	FILETYPE_DIRECTORY	2
+-#define	FILETYPE_SYMLINK	7
+-
+-/* Filetype information as used in inodes.  */
+-#define FILETYPE_INO_MASK	0170000
+-#define FILETYPE_INO_REG	0100000
+-#define FILETYPE_INO_DIRECTORY	0040000
+-#define FILETYPE_INO_SYMLINK	0120000
+-
+-/* Bits used as offset in sector */
+-#define DISK_SECTOR_BITS        9
+-
+-/* Log2 size of ext2 block in 512 blocks.  */
+-#define LOG2_EXT2_BLOCK_SIZE(data) (__le32_to_cpu (data->sblock.log2_block_size) + 1)
+-
+-/* Log2 size of ext2 block in bytes.  */
+-#define LOG2_BLOCK_SIZE(data)	   (__le32_to_cpu (data->sblock.log2_block_size) + 10)
+-
+-/* The size of an ext2 block in bytes.  */
+-#define EXT2_BLOCK_SIZE(data)	   (1 << LOG2_BLOCK_SIZE(data))
+-
+-/* The ext2 superblock.  */
+-struct ext2_sblock {
+-	uint32_t total_inodes;
+-	uint32_t total_blocks;
+-	uint32_t reserved_blocks;
+-	uint32_t free_blocks;
+-	uint32_t free_inodes;
+-	uint32_t first_data_block;
+-	uint32_t log2_block_size;
+-	uint32_t log2_fragment_size;
+-	uint32_t blocks_per_group;
+-	uint32_t fragments_per_group;
+-	uint32_t inodes_per_group;
+-	uint32_t mtime;
+-	uint32_t utime;
+-	uint16_t mnt_count;
+-	uint16_t max_mnt_count;
+-	uint16_t magic;
+-	uint16_t fs_state;
+-	uint16_t error_handling;
+-	uint16_t minor_revision_level;
+-	uint32_t lastcheck;
+-	uint32_t checkinterval;
+-	uint32_t creator_os;
+-	uint32_t revision_level;
+-	uint16_t uid_reserved;
+-	uint16_t gid_reserved;
+-	uint32_t first_inode;
+-	uint16_t inode_size;
+-	uint16_t block_group_number;
+-	uint32_t feature_compatibility;
+-	uint32_t feature_incompat;
+-	uint32_t feature_ro_compat;
+-	uint32_t unique_id[4];
+-	char volume_name[16];
+-	char last_mounted_on[64];
+-	uint32_t compression_info;
+-};
+-
+-/* The ext2 blockgroup.  */
+-struct ext2_block_group {
+-	uint32_t block_id;
+-	uint32_t inode_id;
+-	uint32_t inode_table_id;
+-	uint16_t free_blocks;
+-	uint16_t free_inodes;
+-	uint16_t used_dir_cnt;
+-	uint32_t reserved[3];
+-};
+-
+-/* The ext2 inode.  */
+-struct ext2_inode {
+-	uint16_t mode;
+-	uint16_t uid;
+-	uint32_t size;
+-	uint32_t atime;
+-	uint32_t ctime;
+-	uint32_t mtime;
+-	uint32_t dtime;
+-	uint16_t gid;
+-	uint16_t nlinks;
+-	uint32_t blockcnt;	/* Blocks of 512 bytes!! */
+-	uint32_t flags;
+-	uint32_t osd1;
+-	union {
+-		struct datablocks {
+-			uint32_t dir_blocks[INDIRECT_BLOCKS];
+-			uint32_t indir_block;
+-			uint32_t double_indir_block;
+-			uint32_t tripple_indir_block;
+-		} blocks;
+-		char symlink[60];
+-	} b;
+-	uint32_t version;
+-	uint32_t acl;
+-	uint32_t dir_acl;
+-	uint32_t fragment_addr;
+-	uint32_t osd2[3];
+-};
+-
+-/* The header of an ext2 directory entry.  */
+-struct ext2_dirent {
+-	uint32_t inode;
+-	uint16_t direntlen;
+-	uint8_t namelen;
+-	uint8_t filetype;
+-};
+-
+-struct ext2fs_node {
+-	struct ext2_data *data;
+-	struct ext2_inode inode;
+-	int ino;
+-	int inode_read;
+-};
+-
+-/* Information about a "mounted" ext2 filesystem.  */
+-struct ext2_data {
+-	struct ext2_sblock sblock;
+-	struct ext2_inode *inode;
+-	struct ext2fs_node diropen;
+-};
+-
+-
+-typedef struct ext2fs_node *ext2fs_node_t;
+ 
+ struct ext2_data *ext2fs_root = NULL;
+-ext2fs_node_t ext2fs_file = NULL;
++struct ext2fs_node *ext2fs_file;
+ int symlinknest = 0;
+ uint32_t *indir1_block = NULL;
+ int indir1_size = 0;
+@@ -243,14 +107,16 @@ static int ext2fs_read_inode
+ }
+ 
+ 
+-void ext2fs_free_node (ext2fs_node_t node, ext2fs_node_t currroot) {
++void ext2fs_free_node(struct ext2fs_node *node, struct ext2fs_node *currroot)
++{
+ 	if ((node != &ext2fs_root->diropen) && (node != currroot)) {
+ 		free (node);
+ 	}
+ }
+ 
+ 
+-static int ext2fs_read_block (ext2fs_node_t node, int fileblock) {
++static int ext2fs_read_block(struct ext2fs_node *node, int fileblock)
++{
+ 	struct ext2_data *data = node->data;
+ 	struct ext2_inode *inode = &node->inode;
+ 	int blknr;
+@@ -390,7 +256,8 @@ static int ext2fs_read_block (ext2fs_node_t node, int fileblock) {
+ 
+ 
+ int ext2fs_read_file
+-	(ext2fs_node_t node, int pos, unsigned int len, char *buf) {
++	(struct ext2fs_node *node, int pos, unsigned int len, char *buf)
++{
+ 	int i;
+ 	int blockcnt;
+ 	int log2blocksize = LOG2_EXT2_BLOCK_SIZE (node->data);
+@@ -471,8 +338,8 @@ int ext2fs_read_file
+ 	return (len);
+ }
+ 
+-
+-static int ext2fs_iterate_dir (ext2fs_node_t dir, char *name, ext2fs_node_t * fnode, int *ftype)
++int ext2fs_iterate_dir(struct ext2fs_node *dir, char *name,
++					struct ext2fs_node **fnode, int *ftype)
+ {
+ 	unsigned int fpos = 0;
+ 	int status;
+@@ -501,7 +368,7 @@ static int ext2fs_iterate_dir (ext2fs_node_t dir, char *name, ext2fs_node_t * fn
+ 		}
+ 		if (dirent.namelen != 0) {
+ 			char filename[dirent.namelen + 1];
+-			ext2fs_node_t fdiro;
++			struct ext2fs_node *fdiro;
+ 			int type = FILETYPE_UNKNOWN;
+ 
+ 			status = ext2fs_read_file (diro,
+@@ -603,8 +470,8 @@ static int ext2fs_iterate_dir (ext2fs_node_t dir, char *name, ext2fs_node_t * fn
+ 	return (0);
+ }
+ 
+-
+-static char *ext2fs_read_symlink (ext2fs_node_t node) {
++static char *ext2fs_read_symlink(struct ext2fs_node *node)
++{
+ 	char *symlink;
+ 	struct ext2fs_node *diro = node;
+ 	int status;
+@@ -641,15 +508,16 @@ static char *ext2fs_read_symlink (ext2fs_node_t node) {
+ 
+ 
+ int ext2fs_find_file1
+-	(const char *currpath,
+-	 ext2fs_node_t currroot, ext2fs_node_t * currfound, int *foundtype) {
++	(const char *currpath, struct ext2fs_node *currroot,
++		struct ext2fs_node **currfound, int *foundtype)
++{
+ 	char fpath[strlen (currpath) + 1];
+ 	char *name = fpath;
+ 	char *next;
+ 	int status;
+ 	int type = FILETYPE_DIRECTORY;
+-	ext2fs_node_t currnode = currroot;
+-	ext2fs_node_t oldnode = currroot;
++	struct ext2fs_node *currnode = currroot;
++	struct ext2fs_node *oldnode = currroot;
+ 
+ 	strncpy (fpath, currpath, strlen (currpath) + 1);
+ 
+@@ -745,8 +613,9 @@ int ext2fs_find_file1
+ 
+ 
+ int ext2fs_find_file
+-	(const char *path,
+-	 ext2fs_node_t rootnode, ext2fs_node_t * foundnode, int expecttype) {
++	(const char *path, struct ext2fs_node *rootnode,
++	struct ext2fs_node **foundnode, int expecttype)
++{
+ 	int status;
+ 	int foundtype = FILETYPE_DIRECTORY;
+ 
+@@ -772,7 +641,7 @@ int ext2fs_find_file
+ 
+ 
+ int ext2fs_ls (const char *dirname) {
+-	ext2fs_node_t dirnode;
++	struct ext2fs_node *dirnode;
+ 	int status;
+ 
+ 	if (ext2fs_root == NULL) {
+@@ -792,7 +661,7 @@ int ext2fs_ls (const char *dirname) {
+ 
+ 
+ int ext2fs_open (const char *filename) {
+-	ext2fs_node_t fdiro = NULL;
++	struct ext2fs_node *fdiro = NULL;
+ 	int status;
+ 	int len;
+ 
+@@ -822,8 +691,8 @@ fail:
+ }
+ 
+ 
+-int ext2fs_close (void
+-	) {
++int ext2fs_close(void)
++{
+ 	if ((ext2fs_file != NULL) && (ext2fs_root != NULL)) {
+ 		ext2fs_free_node (ext2fs_file, &ext2fs_root->diropen);
+ 		ext2fs_file = NULL;
+diff --git a/fs/ext4/Makefile b/fs/ext4/Makefile
+new file mode 100644
+index 0000000..7add4ab
+--- /dev/null
++++ b/fs/ext4/Makefile
+@@ -0,0 +1,51 @@
++#
++# (C) Copyright 2006
++# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
++#
++# (C) Copyright 2003
++# Pavel Bartusek, Sysgo Real-Time Solutions AG, pba@sysgo.de
++#
++#
++# See file CREDITS for list of people who contributed to this
++# project.
++#
++# This program is free software; you can redistribute it and/or
++# modify it under the terms of the GNU General Public License as
++# published by the Free Software Foundation; either version 2 of
++# the License, or (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++# MA 02111-1307 USA
++#
++
++include $(TOPDIR)/config.mk
++
++LIB	= $(obj)libext4fs.o
++
++AOBJS	=
++COBJS-$(CONFIG_CMD_EXT4) := ext4fs.o ext4_common.o dev.o
++
++SRCS	:= $(AOBJS:.o=.S) $(COBJS-y:.o=.c)
++OBJS	:= $(addprefix $(obj),$(AOBJS) $(COBJS-y))
++
++
++all:	$(LIB) $(AOBJS)
++
++$(LIB):	$(obj).depend $(OBJS)
++	$(call cmd_link_o_target, $(OBJS))
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+diff --git a/fs/ext4/dev.c b/fs/ext4/dev.c
+new file mode 100644
+index 0000000..2054be3
+--- /dev/null
++++ b/fs/ext4/dev.c
+@@ -0,0 +1,145 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * made from existing ext2/dev.c file of Uboot
++ * (C) Copyright 2004
++ * esd gmbh <www.esd-electronics.com>
++ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
++ *
++ * based on code of fs/reiserfs/dev.c by
++ *
++ * (C) Copyright 2003 - 2004
++ * Sysgo AG, <www.elinos.com>, Pavel Bartusek <pba@sysgo.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ *
++ */
++
++/*
++ * Changelog:
++ *	0.1 - Newly created file for ext4fs support. Taken from
++ *	        fs/ext2/dev.c file in uboot.
++ */
++
++#include <common.h>
++#include <config.h>
++#include <ext_common.h>
++
++static block_dev_desc_t *ext4fs_block_dev_desc;
++static disk_partition_t part_info;
++
++int ext4fs_set_blk_dev(block_dev_desc_t *rbdd, int part)
++{
++	ext4fs_block_dev_desc = rbdd;
++
++	if (part == 0) {
++		/* disk doesn't use partition table */
++		part_info.start = 0;
++		part_info.size = rbdd->lba;
++		part_info.blksz = rbdd->blksz;
++	} else {
++		if (get_partition_info(ext4fs_block_dev_desc,
++					part, &part_info))
++			return 0;
++	}
++	return part_info.size;
++}
++
++int ext4fs_devread(int sector, int byte_offset, int byte_len, char *buf)
++{
++	char sec_buf[SECTOR_SIZE];
++	unsigned block_len;
++
++	/* Check partition boundaries */
++	if ((sector < 0)
++	    || ((sector + ((byte_offset + byte_len - 1) >> SECTOR_BITS)) >=
++		part_info.size)) {
++		printf("%s read outside partition %d\n", __func__, sector);
++		return 0;
++	}
++
++	/* Get the read to the beginning of a partition */
++	sector += byte_offset >> SECTOR_BITS;
++	byte_offset &= SECTOR_SIZE - 1;
++
++	debug(" <%d, %d, %d>\n", sector, byte_offset, byte_len);
++
++	if (ext4fs_block_dev_desc == NULL) {
++		printf("** Invalid Block Device Descriptor (NULL)\n");
++		return 0;
++	}
++
++	if (byte_offset != 0) {
++		/* read first part which isn't aligned with start of sector */
++		if (ext4fs_block_dev_desc->
++		    block_read(ext4fs_block_dev_desc->dev,
++				part_info.start + sector, 1,
++				(unsigned long *) sec_buf) != 1) {
++			printf(" ** ext2fs_devread() read error **\n");
++			return 0;
++		}
++		memcpy(buf, sec_buf + byte_offset,
++			min(SECTOR_SIZE - byte_offset, byte_len));
++		buf += min(SECTOR_SIZE - byte_offset, byte_len);
++		byte_len -= min(SECTOR_SIZE - byte_offset, byte_len);
++		sector++;
++	}
++
++	if (byte_len == 0)
++		return 1;
++
++	/* read sector aligned part */
++	block_len = byte_len & ~(SECTOR_SIZE - 1);
++
++	if (block_len == 0) {
++		u8 p[SECTOR_SIZE];
++
++		block_len = SECTOR_SIZE;
++		ext4fs_block_dev_desc->block_read(ext4fs_block_dev_desc->dev,
++						  part_info.start + sector,
++						  1, (unsigned long *)p);
++		memcpy(buf, p, byte_len);
++		return 1;
++	}
++
++	if (ext4fs_block_dev_desc->block_read(ext4fs_block_dev_desc->dev,
++					part_info.start + sector,
++					block_len / SECTOR_SIZE,
++					(unsigned long *) buf) !=
++					block_len / SECTOR_SIZE) {
++		printf(" ** %s read error - block\n", __func__);
++		return 0;
++	}
++	block_len = byte_len & ~(SECTOR_SIZE - 1);
++	buf += block_len;
++	byte_len -= block_len;
++	sector += block_len / SECTOR_SIZE;
++
++	if (byte_len != 0) {
++		/* read rest of data which are not in whole sector */
++		if (ext4fs_block_dev_desc->
++		    block_read(ext4fs_block_dev_desc->dev,
++				part_info.start + sector, 1,
++				(unsigned long *) sec_buf) != 1) {
++			printf("* %s read error - last part\n", __func__);
++			return 0;
++		}
++		memcpy(buf, sec_buf, byte_len);
++	}
++	return 1;
++}
+diff --git a/fs/ext4/ext4_common.c b/fs/ext4/ext4_common.c
+new file mode 100644
+index 0000000..d9deefe
+--- /dev/null
++++ b/fs/ext4/ext4_common.c
+@@ -0,0 +1,875 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * ext4ls and ext4load : Based on ext2 ls load support in Uboot.
++ *
++ * (C) Copyright 2004
++ * esd gmbh <www.esd-electronics.com>
++ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
++ *
++ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
++ * GRUB  --  GRand Unified Bootloader
++ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#include <common.h>
++#include <ext_common.h>
++#include <ext4fs.h>
++#include <malloc.h>
++#include <stddef.h>
++#include <linux/stat.h>
++#include <linux/time.h>
++#include <asm/byteorder.h>
++#include "ext4_common.h"
++
++struct ext2_data *ext4fs_root;
++struct ext2fs_node *ext4fs_file;
++uint32_t *ext4fs_indir1_block;
++int ext4fs_indir1_size;
++int ext4fs_indir1_blkno = -1;
++uint32_t *ext4fs_indir2_block;
++int ext4fs_indir2_size;
++int ext4fs_indir2_blkno = -1;
++
++uint32_t *ext4fs_indir3_block;
++int ext4fs_indir3_size;
++int ext4fs_indir3_blkno = -1;
++struct ext2_inode *g_parent_inode;
++static int symlinknest;
++
++static struct ext4_extent_header *ext4fs_get_extent_block
++	(struct ext2_data *data, char *buf,
++		struct ext4_extent_header *ext_block,
++		uint32_t fileblock, int log2_blksz)
++{
++	struct ext4_extent_idx *index;
++	unsigned long long block;
++	struct ext_filesystem *fs = get_fs();
++	int i;
++
++	while (1) {
++		index = (struct ext4_extent_idx *)(ext_block + 1);
++
++		if (le32_to_cpu(ext_block->eh_magic) != EXT4_EXT_MAGIC)
++			return 0;
++
++		if (ext_block->eh_depth == 0)
++			return ext_block;
++		i = -1;
++		do {
++			i++;
++			if (i >= le32_to_cpu(ext_block->eh_entries))
++				break;
++		} while (fileblock > le32_to_cpu(index[i].ei_block));
++
++		if (--i < 0)
++			return 0;
++
++		block = le32_to_cpu(index[i].ei_leaf_hi);
++		block = (block << 32) + le32_to_cpu(index[i].ei_leaf_lo);
++
++		if (ext4fs_devread(block << log2_blksz, 0, fs->blksz, buf))
++			ext_block = (struct ext4_extent_header *)buf;
++		else
++			return 0;
++	}
++}
++
++static int ext4fs_blockgroup
++	(struct ext2_data *data, int group, struct ext2_block_group *blkgrp)
++{
++	long int blkno;
++	unsigned int blkoff, desc_per_blk;
++
++	desc_per_blk = EXT2_BLOCK_SIZE(data) / sizeof(struct ext2_block_group);
++
++	blkno = __le32_to_cpu(data->sblock.first_data_block) + 1 +
++	    group / desc_per_blk;
++	blkoff = (group % desc_per_blk) * sizeof(struct ext2_block_group);
++
++	debug("ext4fs read %d group descriptor (blkno %ld blkoff %u)\n",
++	      group, blkno, blkoff);
++
++	return ext4fs_devread(blkno << LOG2_EXT2_BLOCK_SIZE(data),
++			      blkoff, sizeof(struct ext2_block_group),
++			      (char *)blkgrp);
++}
++
++int ext4fs_read_inode(struct ext2_data *data, int ino, struct ext2_inode *inode)
++{
++	struct ext2_block_group blkgrp;
++	struct ext2_sblock *sblock = &data->sblock;
++	struct ext_filesystem *fs = get_fs();
++	int inodes_per_block, status;
++	long int blkno;
++	unsigned int blkoff;
++
++	/* It is easier to calculate if the first inode is 0. */
++	ino--;
++	status = ext4fs_blockgroup(data, ino / __le32_to_cpu
++				   (sblock->inodes_per_group), &blkgrp);
++	if (status == 0)
++		return 0;
++
++	inodes_per_block = EXT2_BLOCK_SIZE(data) / fs->inodesz;
++	blkno = __le32_to_cpu(blkgrp.inode_table_id) +
++	    (ino % __le32_to_cpu(sblock->inodes_per_group)) / inodes_per_block;
++	blkoff = (ino % inodes_per_block) * fs->inodesz;
++	/* Read the inode. */
++	status = ext4fs_devread(blkno << LOG2_EXT2_BLOCK_SIZE(data), blkoff,
++				sizeof(struct ext2_inode), (char *)inode);
++	if (status == 0)
++		return 0;
++
++	return 1;
++}
++
++long int read_allocated_block(struct ext2_inode *inode, int fileblock)
++{
++	long int blknr;
++	int blksz;
++	int log2_blksz;
++	int status;
++	long int rblock;
++	long int perblock_parent;
++	long int perblock_child;
++	unsigned long long start;
++	/* get the blocksize of the filesystem */
++	blksz = EXT2_BLOCK_SIZE(ext4fs_root);
++	log2_blksz = LOG2_EXT2_BLOCK_SIZE(ext4fs_root);
++	if (le32_to_cpu(inode->flags) & EXT4_EXTENTS_FL) {
++		char *buf = zalloc(blksz);
++		if (!buf)
++			return -ENOMEM;
++		struct ext4_extent_header *ext_block;
++		struct ext4_extent *extent;
++		int i = -1;
++		ext_block = ext4fs_get_extent_block(ext4fs_root, buf,
++						    (struct ext4_extent_header
++						     *)inode->b.
++						    blocks.dir_blocks,
++						    fileblock, log2_blksz);
++		if (!ext_block) {
++			printf("invalid extent block\n");
++			free(buf);
++			return -EINVAL;
++		}
++
++		extent = (struct ext4_extent *)(ext_block + 1);
++
++		do {
++			i++;
++			if (i >= le32_to_cpu(ext_block->eh_entries))
++				break;
++		} while (fileblock >= le32_to_cpu(extent[i].ee_block));
++		if (--i >= 0) {
++			fileblock -= le32_to_cpu(extent[i].ee_block);
++			if (fileblock >= le32_to_cpu(extent[i].ee_len)) {
++				free(buf);
++				return 0;
++			}
++
++			start = le32_to_cpu(extent[i].ee_start_hi);
++			start = (start << 32) +
++			    le32_to_cpu(extent[i].ee_start_lo);
++			free(buf);
++			return fileblock + start;
++		}
++
++		printf("Extent Error\n");
++		free(buf);
++		return -1;
++	}
++
++	/* Direct blocks. */
++	if (fileblock < INDIRECT_BLOCKS)
++		blknr = __le32_to_cpu(inode->b.blocks.dir_blocks[fileblock]);
++
++	/* Indirect. */
++	else if (fileblock < (INDIRECT_BLOCKS + (blksz / 4))) {
++		if (ext4fs_indir1_block == NULL) {
++			ext4fs_indir1_block = zalloc(blksz);
++			if (ext4fs_indir1_block == NULL) {
++				printf("** SI ext2fs read block (indir 1)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_size = blksz;
++			ext4fs_indir1_blkno = -1;
++		}
++		if (blksz != ext4fs_indir1_size) {
++			free(ext4fs_indir1_block);
++			ext4fs_indir1_block = NULL;
++			ext4fs_indir1_size = 0;
++			ext4fs_indir1_blkno = -1;
++			ext4fs_indir1_block = zalloc(blksz);
++			if (ext4fs_indir1_block == NULL) {
++				printf("** SI ext2fs read block (indir 1):"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_size = blksz;
++		}
++		if ((__le32_to_cpu(inode->b.blocks.indir_block) <<
++		     log2_blksz) != ext4fs_indir1_blkno) {
++			status =
++			    ext4fs_devread(__le32_to_cpu
++					   (inode->b.blocks.
++					    indir_block) << log2_blksz, 0,
++					   blksz, (char *)ext4fs_indir1_block);
++			if (status == 0) {
++				printf("** SI ext2fs read block (indir 1)"
++				       "failed. **\n");
++				return 0;
++			}
++			ext4fs_indir1_blkno =
++			    __le32_to_cpu(inode->b.blocks.
++					  indir_block) << log2_blksz;
++		}
++		blknr = __le32_to_cpu(ext4fs_indir1_block
++				      [fileblock - INDIRECT_BLOCKS]);
++	}
++	/* Double indirect. */
++	else if (fileblock < (INDIRECT_BLOCKS + (blksz / 4 *
++					(blksz / 4 + 1)))) {
++
++		long int perblock = blksz / 4;
++		long int rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4);
++
++		if (ext4fs_indir1_block == NULL) {
++			ext4fs_indir1_block = zalloc(blksz);
++			if (ext4fs_indir1_block == NULL) {
++				printf("** DI ext2fs read block (indir 2 1)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_size = blksz;
++			ext4fs_indir1_blkno = -1;
++		}
++		if (blksz != ext4fs_indir1_size) {
++			free(ext4fs_indir1_block);
++			ext4fs_indir1_block = NULL;
++			ext4fs_indir1_size = 0;
++			ext4fs_indir1_blkno = -1;
++			ext4fs_indir1_block = zalloc(blksz);
++			if (ext4fs_indir1_block == NULL) {
++				printf("** DI ext2fs read block (indir 2 1)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_size = blksz;
++		}
++		if ((__le32_to_cpu(inode->b.blocks.double_indir_block) <<
++		     log2_blksz) != ext4fs_indir1_blkno) {
++			status =
++			    ext4fs_devread(__le32_to_cpu
++					   (inode->b.blocks.
++					    double_indir_block) << log2_blksz,
++					   0, blksz,
++					   (char *)ext4fs_indir1_block);
++			if (status == 0) {
++				printf("** DI ext2fs read block (indir 2 1)"
++				       "failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_blkno =
++			    __le32_to_cpu(inode->b.blocks.double_indir_block) <<
++			    log2_blksz;
++		}
++
++		if (ext4fs_indir2_block == NULL) {
++			ext4fs_indir2_block = zalloc(blksz);
++			if (ext4fs_indir2_block == NULL) {
++				printf("** DI ext2fs read block (indir 2 2)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir2_size = blksz;
++			ext4fs_indir2_blkno = -1;
++		}
++		if (blksz != ext4fs_indir2_size) {
++			free(ext4fs_indir2_block);
++			ext4fs_indir2_block = NULL;
++			ext4fs_indir2_size = 0;
++			ext4fs_indir2_blkno = -1;
++			ext4fs_indir2_block = zalloc(blksz);
++			if (ext4fs_indir2_block == NULL) {
++				printf("** DI ext2fs read block (indir 2 2)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir2_size = blksz;
++		}
++		if ((__le32_to_cpu(ext4fs_indir1_block[rblock / perblock]) <<
++		     log2_blksz) != ext4fs_indir2_blkno) {
++			status = ext4fs_devread(__le32_to_cpu
++						(ext4fs_indir1_block
++						 [rblock /
++						  perblock]) << log2_blksz, 0,
++						blksz,
++						(char *)ext4fs_indir2_block);
++			if (status == 0) {
++				printf("** DI ext2fs read block (indir 2 2)"
++				       "failed. **\n");
++				return -1;
++			}
++			ext4fs_indir2_blkno =
++			    __le32_to_cpu(ext4fs_indir1_block[rblock
++							      /
++							      perblock]) <<
++			    log2_blksz;
++		}
++		blknr = __le32_to_cpu(ext4fs_indir2_block[rblock % perblock]);
++	}
++	/* Tripple indirect. */
++	else {
++		rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4 +
++				      (blksz / 4 * blksz / 4));
++		perblock_child = blksz / 4;
++		perblock_parent = ((blksz / 4) * (blksz / 4));
++
++		if (ext4fs_indir1_block == NULL) {
++			ext4fs_indir1_block = zalloc(blksz);
++			if (ext4fs_indir1_block == NULL) {
++				printf("** TI ext2fs read block (indir 2 1)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_size = blksz;
++			ext4fs_indir1_blkno = -1;
++		}
++		if (blksz != ext4fs_indir1_size) {
++			free(ext4fs_indir1_block);
++			ext4fs_indir1_block = NULL;
++			ext4fs_indir1_size = 0;
++			ext4fs_indir1_blkno = -1;
++			ext4fs_indir1_block = zalloc(blksz);
++			if (ext4fs_indir1_block == NULL) {
++				printf("** TI ext2fs read block (indir 2 1)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_size = blksz;
++		}
++		if ((__le32_to_cpu(inode->b.blocks.triple_indir_block) <<
++		     log2_blksz) != ext4fs_indir1_blkno) {
++			status = ext4fs_devread
++			    (__le32_to_cpu(inode->b.blocks.triple_indir_block)
++			     << log2_blksz, 0, blksz,
++			     (char *)ext4fs_indir1_block);
++			if (status == 0) {
++				printf("** TI ext2fs read block (indir 2 1)"
++				       "failed. **\n");
++				return -1;
++			}
++			ext4fs_indir1_blkno =
++			    __le32_to_cpu(inode->b.blocks.triple_indir_block) <<
++			    log2_blksz;
++		}
++
++		if (ext4fs_indir2_block == NULL) {
++			ext4fs_indir2_block = zalloc(blksz);
++			if (ext4fs_indir2_block == NULL) {
++				printf("** TI ext2fs read block (indir 2 2)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir2_size = blksz;
++			ext4fs_indir2_blkno = -1;
++		}
++		if (blksz != ext4fs_indir2_size) {
++			free(ext4fs_indir2_block);
++			ext4fs_indir2_block = NULL;
++			ext4fs_indir2_size = 0;
++			ext4fs_indir2_blkno = -1;
++			ext4fs_indir2_block = zalloc(blksz);
++			if (ext4fs_indir2_block == NULL) {
++				printf("** TI ext2fs read block (indir 2 2)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir2_size = blksz;
++		}
++		if ((__le32_to_cpu(ext4fs_indir1_block[rblock /
++						       perblock_parent]) <<
++		     log2_blksz)
++		    != ext4fs_indir2_blkno) {
++			status = ext4fs_devread(__le32_to_cpu
++						(ext4fs_indir1_block
++						 [rblock /
++						  perblock_parent]) <<
++						log2_blksz, 0, blksz,
++						(char *)ext4fs_indir2_block);
++			if (status == 0) {
++				printf("** TI ext2fs read block (indir 2 2)"
++				       "failed. **\n");
++				return -1;
++			}
++			ext4fs_indir2_blkno =
++			    __le32_to_cpu(ext4fs_indir1_block[rblock /
++							      perblock_parent])
++			    << log2_blksz;
++		}
++
++		if (ext4fs_indir3_block == NULL) {
++			ext4fs_indir3_block = zalloc(blksz);
++			if (ext4fs_indir3_block == NULL) {
++				printf("** TI ext2fs read block (indir 2 2)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir3_size = blksz;
++			ext4fs_indir3_blkno = -1;
++		}
++		if (blksz != ext4fs_indir3_size) {
++			free(ext4fs_indir3_block);
++			ext4fs_indir3_block = NULL;
++			ext4fs_indir3_size = 0;
++			ext4fs_indir3_blkno = -1;
++			ext4fs_indir3_block = zalloc(blksz);
++			if (ext4fs_indir3_block == NULL) {
++				printf("** TI ext2fs read block (indir 2 2)"
++				       "malloc failed. **\n");
++				return -1;
++			}
++			ext4fs_indir3_size = blksz;
++		}
++		if ((__le32_to_cpu(ext4fs_indir2_block[rblock
++						       /
++						       perblock_child]) <<
++		     log2_blksz) != ext4fs_indir3_blkno) {
++			status =
++			    ext4fs_devread(__le32_to_cpu
++					   (ext4fs_indir2_block
++					    [(rblock / perblock_child)
++					     % (blksz / 4)]) << log2_blksz, 0,
++					   blksz, (char *)ext4fs_indir3_block);
++			if (status == 0) {
++				printf("** TI ext2fs read block (indir 2 2)"
++				       "failed. **\n");
++				return -1;
++			}
++			ext4fs_indir3_blkno =
++			    __le32_to_cpu(ext4fs_indir2_block[(rblock /
++							       perblock_child) %
++							      (blksz /
++							       4)]) <<
++			    log2_blksz;
++		}
++
++		blknr = __le32_to_cpu(ext4fs_indir3_block
++				      [rblock % perblock_child]);
++	}
++	debug("ext4fs_read_block %ld\n", blknr);
++
++	return blknr;
++}
++
++void ext4fs_close(void)
++{
++	if ((ext4fs_file != NULL) && (ext4fs_root != NULL)) {
++		ext4fs_free_node(ext4fs_file, &ext4fs_root->diropen);
++		ext4fs_file = NULL;
++	}
++	if (ext4fs_root != NULL) {
++		free(ext4fs_root);
++		ext4fs_root = NULL;
++	}
++	if (ext4fs_indir1_block != NULL) {
++		free(ext4fs_indir1_block);
++		ext4fs_indir1_block = NULL;
++		ext4fs_indir1_size = 0;
++		ext4fs_indir1_blkno = -1;
++	}
++	if (ext4fs_indir2_block != NULL) {
++		free(ext4fs_indir2_block);
++		ext4fs_indir2_block = NULL;
++		ext4fs_indir2_size = 0;
++		ext4fs_indir2_blkno = -1;
++	}
++	if (ext4fs_indir3_block != NULL) {
++		free(ext4fs_indir3_block);
++		ext4fs_indir3_block = NULL;
++		ext4fs_indir3_size = 0;
++		ext4fs_indir3_blkno = -1;
++	}
++}
++
++int ext4fs_iterate_dir(struct ext2fs_node *dir, char *name,
++		       struct ext2fs_node **fnode, int *ftype)
++{
++	unsigned int fpos = 0;
++	int status;
++	struct ext2fs_node *diro = (struct ext2fs_node *)dir;
++
++#ifdef DEBUG
++	if (name != NULL)
++		printf("Iterate dir %s\n", name);
++#endif				/* of DEBUG */
++	if (!diro->inode_read) {
++		status = ext4fs_read_inode(diro->data, diro->ino, &diro->inode);
++		if (status == 0)
++			return 0;
++	}
++	/* Search the file.  */
++	while (fpos < __le32_to_cpu(diro->inode.size)) {
++		struct ext2_dirent dirent;
++
++		status = ext4fs_read_file(diro, fpos,
++					  sizeof(struct ext2_dirent),
++					  (char *)&dirent);
++		if (status < 1)
++			return 0;
++
++		if (dirent.namelen != 0) {
++			char filename[dirent.namelen + 1];
++			struct ext2fs_node *fdiro;
++			int type = FILETYPE_UNKNOWN;
++
++			status = ext4fs_read_file(diro,
++						  fpos +
++						  sizeof(struct ext2_dirent),
++						  dirent.namelen, filename);
++			if (status < 1)
++				return 0;
++
++			fdiro = zalloc(sizeof(struct ext2fs_node));
++			if (!fdiro)
++				return 0;
++
++			fdiro->data = diro->data;
++			fdiro->ino = __le32_to_cpu(dirent.inode);
++
++			filename[dirent.namelen] = '\0';
++
++			if (dirent.filetype != FILETYPE_UNKNOWN) {
++				fdiro->inode_read = 0;
++
++				if (dirent.filetype == FILETYPE_DIRECTORY)
++					type = FILETYPE_DIRECTORY;
++				else if (dirent.filetype == FILETYPE_SYMLINK)
++					type = FILETYPE_SYMLINK;
++				else if (dirent.filetype == FILETYPE_REG)
++					type = FILETYPE_REG;
++			} else {
++				status = ext4fs_read_inode(diro->data,
++							   __le32_to_cpu
++							   (dirent.inode),
++							   &fdiro->inode);
++				if (status == 0) {
++					free(fdiro);
++					return 0;
++				}
++				fdiro->inode_read = 1;
++
++				if ((__le16_to_cpu(fdiro->inode.mode) &
++				     FILETYPE_INO_MASK) ==
++				    FILETYPE_INO_DIRECTORY) {
++					type = FILETYPE_DIRECTORY;
++				} else if ((__le16_to_cpu(fdiro->inode.mode)
++					    & FILETYPE_INO_MASK) ==
++					   FILETYPE_INO_SYMLINK) {
++					type = FILETYPE_SYMLINK;
++				} else if ((__le16_to_cpu(fdiro->inode.mode)
++					    & FILETYPE_INO_MASK) ==
++					   FILETYPE_INO_REG) {
++					type = FILETYPE_REG;
++				}
++			}
++#ifdef DEBUG
++			printf("iterate >%s<\n", filename);
++#endif				/* of DEBUG */
++			if ((name != NULL) && (fnode != NULL)
++			    && (ftype != NULL)) {
++				if (strcmp(filename, name) == 0) {
++					*ftype = type;
++					*fnode = fdiro;
++					return 1;
++				}
++			} else {
++				if (fdiro->inode_read == 0) {
++					status = ext4fs_read_inode(diro->data,
++								 __le32_to_cpu(
++								 dirent.inode),
++								 &fdiro->inode);
++					if (status == 0) {
++						free(fdiro);
++						return 0;
++					}
++					fdiro->inode_read = 1;
++				}
++				switch (type) {
++				case FILETYPE_DIRECTORY:
++					printf("<DIR> ");
++					break;
++				case FILETYPE_SYMLINK:
++					printf("<SYM> ");
++					break;
++				case FILETYPE_REG:
++					printf("      ");
++					break;
++				default:
++					printf("< ? > ");
++					break;
++				}
++				printf("%10d %s\n",
++				       __le32_to_cpu(fdiro->inode.size),
++				       filename);
++			}
++			free(fdiro);
++		}
++		fpos += __le16_to_cpu(dirent.direntlen);
++	}
++	return 0;
++}
++
++static char *ext4fs_read_symlink(struct ext2fs_node *node)
++{
++	char *symlink;
++	struct ext2fs_node *diro = node;
++	int status;
++
++	if (!diro->inode_read) {
++		status = ext4fs_read_inode(diro->data, diro->ino, &diro->inode);
++		if (status == 0)
++			return 0;
++	}
++	symlink = zalloc(__le32_to_cpu(diro->inode.size) + 1);
++	if (!symlink)
++		return 0;
++
++	if (__le32_to_cpu(diro->inode.size) <= 60) {
++		strncpy(symlink, diro->inode.b.symlink,
++			__le32_to_cpu(diro->inode.size));
++	} else {
++		status = ext4fs_read_file(diro, 0,
++					  __le32_to_cpu(diro->inode.size),
++					  symlink);
++		if (status == 0) {
++			free(symlink);
++			return 0;
++		}
++	}
++	symlink[__le32_to_cpu(diro->inode.size)] = '\0';
++	return symlink;
++}
++
++static int ext4fs_find_file1(const char *currpath,
++			     struct ext2fs_node *currroot,
++			     struct ext2fs_node **currfound, int *foundtype)
++{
++	char fpath[strlen(currpath) + 1];
++	char *name = fpath;
++	char *next;
++	int status;
++	int type = FILETYPE_DIRECTORY;
++	struct ext2fs_node *currnode = currroot;
++	struct ext2fs_node *oldnode = currroot;
++
++	strncpy(fpath, currpath, strlen(currpath) + 1);
++
++	/* Remove all leading slashes. */
++	while (*name == '/')
++		name++;
++
++	if (!*name) {
++		*currfound = currnode;
++		return 1;
++	}
++
++	for (;;) {
++		int found;
++
++		/* Extract the actual part from the pathname. */
++		next = strchr(name, '/');
++		if (next) {
++			/* Remove all leading slashes. */
++			while (*next == '/')
++				*(next++) = '\0';
++		}
++
++		if (type != FILETYPE_DIRECTORY) {
++			ext4fs_free_node(currnode, currroot);
++			return 0;
++		}
++
++		oldnode = currnode;
++
++		/* Iterate over the directory. */
++		found = ext4fs_iterate_dir(currnode, name, &currnode, &type);
++		if (found == 0)
++			return 0;
++
++		if (found == -1)
++			break;
++
++		/* Read in the symlink and follow it. */
++		if (type == FILETYPE_SYMLINK) {
++			char *symlink;
++
++			/* Test if the symlink does not loop. */
++			if (++symlinknest == 8) {
++				ext4fs_free_node(currnode, currroot);
++				ext4fs_free_node(oldnode, currroot);
++				return 0;
++			}
++
++			symlink = ext4fs_read_symlink(currnode);
++			ext4fs_free_node(currnode, currroot);
++
++			if (!symlink) {
++				ext4fs_free_node(oldnode, currroot);
++				return 0;
++			}
++
++			debug("Got symlink >%s<\n", symlink);
++
++			if (symlink[0] == '/') {
++				ext4fs_free_node(oldnode, currroot);
++				oldnode = &ext4fs_root->diropen;
++			}
++
++			/* Lookup the node the symlink points to. */
++			status = ext4fs_find_file1(symlink, oldnode,
++						   &currnode, &type);
++
++			free(symlink);
++
++			if (status == 0) {
++				ext4fs_free_node(oldnode, currroot);
++				return 0;
++			}
++		}
++
++		ext4fs_free_node(oldnode, currroot);
++
++		/* Found the node! */
++		if (!next || *next == '\0') {
++			*currfound = currnode;
++			*foundtype = type;
++			return 1;
++		}
++		name = next;
++	}
++	return -1;
++}
++
++int ext4fs_find_file(const char *path, struct ext2fs_node *rootnode,
++	struct ext2fs_node **foundnode, int expecttype)
++{
++	int status;
++	int foundtype = FILETYPE_DIRECTORY;
++
++	symlinknest = 0;
++	if (!path)
++		return 0;
++
++	status = ext4fs_find_file1(path, rootnode, foundnode, &foundtype);
++	if (status == 0)
++		return 0;
++
++	/* Check if the node that was found was of the expected type. */
++	if ((expecttype == FILETYPE_REG) && (foundtype != expecttype))
++		return 0;
++	else if ((expecttype == FILETYPE_DIRECTORY)
++		   && (foundtype != expecttype))
++		return 0;
++
++	return 1;
++}
++
++int ext4fs_open(const char *filename)
++{
++	struct ext2fs_node *fdiro = NULL;
++	int status;
++	int len;
++
++	if (ext4fs_root == NULL)
++		return -1;
++
++	ext4fs_file = NULL;
++	status = ext4fs_find_file(filename, &ext4fs_root->diropen, &fdiro,
++				  FILETYPE_REG);
++	if (status == 0)
++		goto fail;
++
++	if (!fdiro->inode_read) {
++		status = ext4fs_read_inode(fdiro->data, fdiro->ino,
++					   &fdiro->inode);
++		if (status == 0)
++			goto fail;
++	}
++	len = __le32_to_cpu(fdiro->inode.size);
++	ext4fs_file = fdiro;
++
++	return len;
++ fail:
++	ext4fs_free_node(fdiro, &ext4fs_root->diropen);
++
++	return -1;
++}
++
++int ext4fs_mount(unsigned part_length)
++{
++	struct ext2_data *data;
++	int status;
++	struct ext_filesystem *fs = get_fs();
++	data = zalloc(sizeof(struct ext2_data));
++	if (!data)
++		return 0;
++
++	/* Read the superblock. */
++	status = ext4fs_devread(1 * 2, 0, sizeof(struct ext2_sblock),
++				(char *)&data->sblock);
++
++	if (status == 0)
++		goto fail;
++
++	/* Make sure this is an ext2 filesystem. */
++	if (__le16_to_cpu(data->sblock.magic) != EXT2_MAGIC)
++		goto fail;
++
++	if (__le32_to_cpu(data->sblock.revision_level == 0))
++		fs->inodesz = 128;
++	else
++		fs->inodesz = __le16_to_cpu(data->sblock.inode_size);
++
++	debug("EXT2 rev %d, inode_size %d\n",
++	      __le32_to_cpu(data->sblock.revision_level), fs->inodesz);
++
++	data->diropen.data = data;
++	data->diropen.ino = 2;
++	data->diropen.inode_read = 1;
++	data->inode = &data->diropen.inode;
++
++	status = ext4fs_read_inode(data, 2, data->inode);
++	if (status == 0)
++		goto fail;
++
++	ext4fs_root = data;
++
++	return 1;
++ fail:
++	printf("Failed to mount ext2 filesystem...\n");
++	free(data);
++	ext4fs_root = NULL;
++
++	return 0;
++}
+diff --git a/fs/ext4/ext4_common.h b/fs/ext4/ext4_common.h
+new file mode 100644
+index 0000000..18e6ad1
+--- /dev/null
++++ b/fs/ext4/ext4_common.h
+@@ -0,0 +1,63 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * ext4ls and ext4load :  based on ext2 ls load support in Uboot.
++ *
++ * (C) Copyright 2004
++ * esd gmbh <www.esd-electronics.com>
++ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
++ *
++ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
++ * GRUB  --  GRand Unified Bootloader
++ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __EXT4_COMMON__
++#define __EXT4_COMMON__
++#include <ext_common.h>
++#include <ext4fs.h>
++#include <malloc.h>
++#include <asm/errno.h>
++
++#define YES		1
++#define NO		0
++#define TRUE		1
++#define FALSE		0
++#define RECOVER	1
++#define SCAN		0
++
++#define S_IFLNK	0120000		/* symbolic link */
++#define BLOCK_NO_ONE		1
++#define SUPERBLOCK_SECTOR	2
++#define SUPERBLOCK_SIZE	1024
++#define F_FILE			1
++
++#define zalloc(size) calloc(1, size)
++
++extern unsigned long part_offset;
++int ext4fs_read_inode(struct ext2_data *data, int ino,
++		      struct ext2_inode *inode);
++int ext4fs_read_file(struct ext2fs_node *node, int pos,
++		unsigned int len, char *buf);
++int ext4fs_find_file(const char *path, struct ext2fs_node *rootnode,
++			struct ext2fs_node **foundnode, int expecttype);
++int ext4fs_iterate_dir(struct ext2fs_node *dir, char *name,
++			struct ext2fs_node **fnode, int *ftype);
++#endif
+diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
+new file mode 100644
+index 0000000..7933769
+--- /dev/null
++++ b/fs/ext4/ext4fs.c
+@@ -0,0 +1,228 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * ext4ls and ext4load : Based on ext2 ls and load support in Uboot.
++ *		       Ext4 read optimization taken from Open-Moko
++ *		       Qi bootloader
++ *
++ * (C) Copyright 2004
++ * esd gmbh <www.esd-electronics.com>
++ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
++ *
++ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
++ * GRUB  --  GRand Unified Bootloader
++ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#include <common.h>
++#include <malloc.h>
++#include <ext_common.h>
++#include <ext4fs.h>
++#include <linux/stat.h>
++#include <linux/time.h>
++#include <asm/byteorder.h>
++#include "ext4_common.h"
++
++int ext4fs_symlinknest;
++block_dev_desc_t *ext4_dev_desc;
++
++struct ext_filesystem *get_fs(void)
++{
++	if (ext4_dev_desc == NULL || ext4_dev_desc->priv == NULL)
++		printf("Invalid Input Arguments %s\n", __func__);
++
++	return ext4_dev_desc->priv;
++}
++
++int init_fs(block_dev_desc_t *dev_desc)
++{
++	struct ext_filesystem *fs;
++	if (dev_desc == NULL) {
++		printf("Invalid Input Arguments %s\n", __func__);
++		return -EINVAL;
++	}
++
++	fs = zalloc(sizeof(struct ext_filesystem));
++	if (fs == NULL) {
++		printf("malloc failed: %s\n", __func__);
++		return -ENOMEM;
++	}
++
++	fs->dev_desc = dev_desc;
++	dev_desc->priv = fs;
++
++	return 0;
++}
++
++void deinit_fs(block_dev_desc_t *dev_desc)
++{
++	if (dev_desc == NULL) {
++		printf("Invalid Input Arguments %s\n", __func__);
++		return;
++	}
++	free(dev_desc->priv);
++	dev_desc->priv = NULL;
++}
++
++void ext4fs_free_node(struct ext2fs_node *node, struct ext2fs_node *currroot)
++{
++	if ((node != &ext4fs_root->diropen) && (node != currroot))
++		free(node);
++}
++
++/*
++ * Taken from openmoko-kernel mailing list: By Andy green
++ * Optimized read file API : collects and defers contiguous sector
++ * reads into one potentially more efficient larger sequential read action
++ */
++int ext4fs_read_file(struct ext2fs_node *node, int pos,
++		     unsigned int len, char *buf)
++{
++	int i;
++	int blockcnt;
++	int log2blocksize = LOG2_EXT2_BLOCK_SIZE(node->data);
++	int blocksize = 1 << (log2blocksize + DISK_SECTOR_BITS);
++	unsigned int filesize = __le32_to_cpu(node->inode.size);
++	int previous_block_number = -1;
++	int delayed_start = 0;
++	int delayed_extent = 0;
++	int delayed_skipfirst = 0;
++	int delayed_next = 0;
++	char *delayed_buf = NULL;
++	short status;
++
++	/* Adjust len so it we can't read past the end of the file. */
++	if (len > filesize)
++		len = filesize;
++
++	blockcnt = ((len + pos) + blocksize - 1) / blocksize;
++
++	for (i = pos / blocksize; i < blockcnt; i++) {
++		int blknr;
++		int blockoff = pos % blocksize;
++		int blockend = blocksize;
++		int skipfirst = 0;
++		blknr = read_allocated_block(&(node->inode), i);
++		if (blknr < 0)
++			return -1;
++
++		blknr = blknr << log2blocksize;
++
++		/* Last block.  */
++		if (i == blockcnt - 1) {
++			blockend = (len + pos) % blocksize;
++
++			/* The last portion is exactly blocksize. */
++			if (!blockend)
++				blockend = blocksize;
++		}
++
++		/* First block. */
++		if (i == pos / blocksize) {
++			skipfirst = blockoff;
++			blockend -= skipfirst;
++		}
++		if (blknr) {
++			int status;
++
++			if (previous_block_number != -1) {
++				if (delayed_next == blknr) {
++					delayed_extent += blockend;
++					delayed_next += blockend >> SECTOR_BITS;
++				} else {	/* spill */
++					status = ext4fs_devread(delayed_start,
++							delayed_skipfirst,
++							delayed_extent,
++							delayed_buf);
++					if (status == 0)
++						return -1;
++					previous_block_number = blknr;
++					delayed_start = blknr;
++					delayed_extent = blockend;
++					delayed_skipfirst = skipfirst;
++					delayed_buf = buf;
++					delayed_next = blknr +
++					    (blockend >> SECTOR_BITS);
++				}
++			} else {
++				previous_block_number = blknr;
++				delayed_start = blknr;
++				delayed_extent = blockend;
++				delayed_skipfirst = skipfirst;
++				delayed_buf = buf;
++				delayed_next = blknr +
++				    (blockend >> SECTOR_BITS);
++			}
++		} else {
++			if (previous_block_number != -1) {
++				/* spill */
++				status = ext4fs_devread(delayed_start,
++							delayed_skipfirst,
++							delayed_extent,
++							delayed_buf);
++				if (status == 0)
++					return -1;
++				previous_block_number = -1;
++			}
++			memset(buf, 0, blocksize - skipfirst);
++		}
++		buf += blocksize - skipfirst;
++	}
++	if (previous_block_number != -1) {
++		/* spill */
++		status = ext4fs_devread(delayed_start,
++					delayed_skipfirst, delayed_extent,
++					delayed_buf);
++		if (status == 0)
++			return -1;
++		previous_block_number = -1;
++	}
++
++	return len;
++}
++
++int ext4fs_ls(const char *dirname)
++{
++	struct ext2fs_node *dirnode;
++	int status;
++
++	if (dirname == NULL)
++		return 0;
++
++	status = ext4fs_find_file(dirname, &ext4fs_root->diropen, &dirnode,
++				  FILETYPE_DIRECTORY);
++	if (status != 1) {
++		printf("** Can not find directory. **\n");
++		return 1;
++	}
++
++	ext4fs_iterate_dir(dirnode, NULL, NULL, NULL);
++	ext4fs_free_node(dirnode, &ext4fs_root->diropen);
++
++	return 0;
++}
++
++int ext4fs_read(char *buf, unsigned len)
++{
++	if (ext4fs_root == NULL || ext4fs_file == NULL)
++		return 0;
++
++	return ext4fs_read_file(ext4fs_file, 0, len, buf);
++}
+diff --git a/include/ext4fs.h b/include/ext4fs.h
+new file mode 100644
+index 0000000..58a6a1d
+--- /dev/null
++++ b/include/ext4fs.h
+@@ -0,0 +1,132 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * Ext4 Extent data structures are taken from  original ext4 fs code
++ * as found in the linux kernel.
++ *
++ * Copyright (c) 2003-2006, Cluster File Systems, Inc, info@clusterfs.com
++ * Written by Alex Tomas <alex@clusterfs.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __EXT4__
++#define __EXT4__
++#include <ext_common.h>
++
++#define EXT4_EXTENTS_FL		0x00080000 /* Inode uses extents */
++#define EXT4_EXT_MAGIC			0xf30a
++#define EXT4_FEATURE_RO_COMPAT_GDT_CSUM	0x0010
++#define EXT4_FEATURE_INCOMPAT_EXTENTS	0x0040
++#define EXT4_INDIRECT_BLOCKS		12
++
++#define EXT4_BG_INODE_UNINIT		0x0001
++#define EXT4_BG_BLOCK_UNINIT		0x0002
++#define EXT4_BG_INODE_ZEROED		0x0004
++
++/*
++ * ext4_inode has i_block array (60 bytes total).
++ * The first 12 bytes store ext4_extent_header;
++ * the remainder stores an array of ext4_extent.
++ */
++
++/*
++ * This is the extent on-disk structure.
++ * It's used at the bottom of the tree.
++ */
++struct ext4_extent {
++	__le32	ee_block;	/* first logical block extent covers */
++	__le16	ee_len;		/* number of blocks covered by extent */
++	__le16	ee_start_hi;	/* high 16 bits of physical block */
++	__le32	ee_start_lo;	/* low 32 bits of physical block */
++};
++
++/*
++ * This is index on-disk structure.
++ * It's used at all the levels except the bottom.
++ */
++struct ext4_extent_idx {
++	__le32	ei_block;	/* index covers logical blocks from 'block' */
++	__le32	ei_leaf_lo;	/* pointer to the physical block of the next *
++				 * level. leaf or next index could be there */
++	__le16	ei_leaf_hi;	/* high 16 bits of physical block */
++	__u16	ei_unused;
++};
++
++/* Each block (leaves and indexes), even inode-stored has header. */
++struct ext4_extent_header {
++	__le16	eh_magic;	/* probably will support different formats */
++	__le16	eh_entries;	/* number of valid entries */
++	__le16	eh_max;		/* capacity of store in entries */
++	__le16	eh_depth;	/* has tree real underlying blocks? */
++	__le32	eh_generation;	/* generation of the tree */
++};
++
++struct ext_filesystem {
++	/* Total Sector of partition */
++	uint64_t total_sect;
++	/* Block size  of partition */
++	uint32_t blksz;
++	/* Inode size of partition */
++	uint32_t inodesz;
++	/* Sectors per Block */
++	uint32_t sect_perblk;
++	/* Group Descriptor Block Number */
++	uint32_t gdtable_blkno;
++	/* Total block groups of partition */
++	uint32_t no_blkgrp;
++	/* No of blocks required for bgdtable */
++	uint32_t no_blk_pergdt;
++	/* Superblock */
++	struct ext2_sblock *sb;
++	/* Block group descritpor table */
++	struct ext2_block_group *gd;
++	char *gdtable;
++
++	/* Block Bitmap Related */
++	unsigned char **blk_bmaps;
++	long int curr_blkno;
++	uint16_t first_pass_bbmap;
++
++	/* Inode Bitmap Related */
++	unsigned char **inode_bmaps;
++	int curr_inode_no;
++	uint16_t first_pass_ibmap;
++
++	/* Journal Related */
++
++	/* Block Device Descriptor */
++	block_dev_desc_t *dev_desc;
++};
++
++extern block_dev_desc_t *ext4_dev_desc;
++extern struct ext2_data *ext4fs_root;
++extern struct ext2fs_node *ext4fs_file;
++
++struct ext_filesystem *get_fs(void);
++int init_fs(block_dev_desc_t *dev_desc);
++void deinit_fs(block_dev_desc_t *dev_desc);
++int ext4fs_open(const char *filename);
++int ext4fs_read(char *buf, unsigned len);
++int ext4fs_mount(unsigned part_length);
++void ext4fs_close(void);
++int ext4fs_ls(const char *dirname);
++void ext4fs_free_node(struct ext2fs_node *node, struct ext2fs_node *currroot);
++int ext4fs_devread(int sector, int byte_offset, int byte_len, char *buf);
++int ext4fs_set_blk_dev(block_dev_desc_t *rbdd, int part);
++long int read_allocated_block(struct ext2_inode *inode, int fileblock);
++#endif
+diff --git a/include/ext_common.h b/include/ext_common.h
+new file mode 100644
+index 0000000..5d48021
+--- /dev/null
++++ b/include/ext_common.h
+@@ -0,0 +1,188 @@
++/*
++ * (C) Copyright 2011 - 2012 Samsung Electronics
++ * EXT4 filesystem implementation in Uboot by
++ * Uma Shankar <uma.shankar@samsung.com>
++ * Manjunatha C Achar <a.manjunatha@samsung.com>
++ *
++ * Data structures and headers for ext4 support have been taken from
++ * ext2 ls load support in Uboot
++ *
++ * (C) Copyright 2004
++ * esd gmbh <www.esd-electronics.com>
++ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
++ *
++ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
++ * GRUB  --  GRand Unified Bootloader
++ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++#ifndef __EXT_COMMON__
++#define __EXT_COMMON__
++
++#define SECTOR_SIZE		0x200
++#define SECTOR_BITS		9
++
++/* Magic value used to identify an ext2 filesystem.  */
++#define	EXT2_MAGIC		0xEF53
++/* Amount of indirect blocks in an inode.  */
++#define INDIRECT_BLOCKS		12
++/* Maximum lenght of a pathname.  */
++#define EXT2_PATH_MAX			4096
++/* Maximum nesting of symlinks, used to prevent a loop.  */
++#define	EXT2_MAX_SYMLINKCNT		8
++
++/* Filetype used in directory entry.  */
++#define	FILETYPE_UNKNOWN		0
++#define	FILETYPE_REG			1
++#define	FILETYPE_DIRECTORY		2
++#define	FILETYPE_SYMLINK		7
++
++/* Filetype information as used in inodes.  */
++#define FILETYPE_INO_MASK		0170000
++#define FILETYPE_INO_REG		0100000
++#define FILETYPE_INO_DIRECTORY		0040000
++#define FILETYPE_INO_SYMLINK		0120000
++#define EXT2_ROOT_INO			2 /* Root inode */
++
++/* Bits used as offset in sector */
++#define DISK_SECTOR_BITS		9
++/* The size of an ext2 block in bytes.  */
++#define EXT2_BLOCK_SIZE(data)	   (1 << LOG2_BLOCK_SIZE(data))
++
++/* Log2 size of ext2 block in 512 blocks.  */
++#define LOG2_EXT2_BLOCK_SIZE(data) (__le32_to_cpu \
++				(data->sblock.log2_block_size) + 1)
++
++/* Log2 size of ext2 block in bytes.  */
++#define LOG2_BLOCK_SIZE(data)	   (__le32_to_cpu \
++		(data->sblock.log2_block_size) + 10)
++#define INODE_SIZE_FILESYSTEM(data)	(__le32_to_cpu \
++			(data->sblock.inode_size))
++
++#define EXT2_FT_DIR	2
++#define SUCCESS	1
++
++/* Macro-instructions used to manage several block sizes  */
++#define EXT2_MIN_BLOCK_LOG_SIZE	10 /* 1024 */
++#define EXT2_MAX_BLOCK_LOG_SIZE	16 /* 65536 */
++#define EXT2_MIN_BLOCK_SIZE		(1 << EXT2_MIN_BLOCK_LOG_SIZE)
++#define EXT2_MAX_BLOCK_SIZE		(1 << EXT2_MAX_BLOCK_LOG_SIZE)
++
++/* The ext2 superblock.  */
++struct ext2_sblock {
++	uint32_t total_inodes;
++	uint32_t total_blocks;
++	uint32_t reserved_blocks;
++	uint32_t free_blocks;
++	uint32_t free_inodes;
++	uint32_t first_data_block;
++	uint32_t log2_block_size;
++	uint32_t log2_fragment_size;
++	uint32_t blocks_per_group;
++	uint32_t fragments_per_group;
++	uint32_t inodes_per_group;
++	uint32_t mtime;
++	uint32_t utime;
++	uint16_t mnt_count;
++	uint16_t max_mnt_count;
++	uint16_t magic;
++	uint16_t fs_state;
++	uint16_t error_handling;
++	uint16_t minor_revision_level;
++	uint32_t lastcheck;
++	uint32_t checkinterval;
++	uint32_t creator_os;
++	uint32_t revision_level;
++	uint16_t uid_reserved;
++	uint16_t gid_reserved;
++	uint32_t first_inode;
++	uint16_t inode_size;
++	uint16_t block_group_number;
++	uint32_t feature_compatibility;
++	uint32_t feature_incompat;
++	uint32_t feature_ro_compat;
++	uint32_t unique_id[4];
++	char volume_name[16];
++	char last_mounted_on[64];
++	uint32_t compression_info;
++};
++
++struct ext2_block_group {
++	__u32 block_id;	/* Blocks bitmap block */
++	__u32 inode_id;	/* Inodes bitmap block */
++	__u32 inode_table_id;	/* Inodes table block */
++	__u16 free_blocks;	/* Free blocks count */
++	__u16 free_inodes;	/* Free inodes count */
++	__u16 used_dir_cnt;	/* Directories count */
++	__u16 bg_flags;
++	__u32 bg_reserved[2];
++	__u16 bg_itable_unused; /* Unused inodes count */
++	__u16 bg_checksum;	/* crc16(s_uuid+grouo_num+group_desc)*/
++};
++
++/* The ext2 inode. */
++struct ext2_inode {
++	uint16_t mode;
++	uint16_t uid;
++	uint32_t size;
++	uint32_t atime;
++	uint32_t ctime;
++	uint32_t mtime;
++	uint32_t dtime;
++	uint16_t gid;
++	uint16_t nlinks;
++	uint32_t blockcnt;	/* Blocks of 512 bytes!! */
++	uint32_t flags;
++	uint32_t osd1;
++	union {
++		struct datablocks {
++			uint32_t dir_blocks[INDIRECT_BLOCKS];
++			uint32_t indir_block;
++			uint32_t double_indir_block;
++			uint32_t triple_indir_block;
++		} blocks;
++		char symlink[60];
++	} b;
++	uint32_t version;
++	uint32_t acl;
++	uint32_t dir_acl;
++	uint32_t fragment_addr;
++	uint32_t osd2[3];
++};
++
++/* The header of an ext2 directory entry. */
++struct ext2_dirent {
++	uint32_t inode;
++	uint16_t direntlen;
++	uint8_t namelen;
++	uint8_t filetype;
++};
++
++struct ext2fs_node {
++	struct ext2_data *data;
++	struct ext2_inode inode;
++	int ino;
++	int inode_read;
++};
++
++/* Information about a "mounted" ext2 filesystem. */
++struct ext2_data {
++	struct ext2_sblock sblock;
++	struct ext2_inode *inode;
++	struct ext2fs_node diropen;
++};
++#endif
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch
new file mode 100644
index 0000000..4511b6b
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0010-am335x-switch-to-ext4-mode.patch
@@ -0,0 +1,52 @@
+From 9e1a99476875b1f1e6e34e70d9bf6e77d3ac8fba Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 4 Apr 2012 00:06:31 +0200
+Subject: [PATCH 10/10] am335x: switch to ext4 mode
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ include/configs/am335x_evm.h |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index e42febe..e2be380 100755
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -75,7 +75,7 @@
+ 	"importbootenv=echo Importing environment from mmc ...; " \
+ 		"env import -t $loadaddr $filesize\0" \
+ 	"mmc_load_uimage=fatload mmc ${mmc_dev}:1 ${kloadaddr} ${bootfile}\0" \
+-	"mmc_load_uimage_ext2=ext2load mmc ${mmc_dev}:2 ${kloadaddr} /boot/${bootfile}\0" \
++	"mmc_load_uimage_ext4=ext4load mmc ${mmc_dev}:2 ${kloadaddr} /boot/${bootfile}\0" \
+ 	"bootargs_defaults=setenv bootargs " \
+ 		"console=${console} " \
+ 		"${optargs}\0" \
+@@ -101,7 +101,7 @@
+ 		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
+ 		"ip=dhcp\0" \
+ 	"mmc_boot=run mmc_args; " \
+-		"run mmc_load_uimage_ext2; " \
++		"run mmc_load_uimage_ext4; " \
+ 		"bootm ${kloadaddr}\0" \
+ 	"nand_boot=echo Booting from nand ...; " \
+ 		"run nand_args; " \
+@@ -139,7 +139,7 @@
+ 			"echo Running uenvcmd ...;" \
+ 			"run uenvcmd;" \
+ 		"fi;" \
+-		"if run mmc_load_uimage_ext2; then " \
++		"if run mmc_load_uimage_ext4; then " \
+ 			"run mmc_args;" \
+ 			"bootm ${kloadaddr};" \
+ 		"fi;" \
+@@ -426,6 +426,7 @@
+ #define CONFIG_DOS_PARTITION
+ #define CONFIG_CMD_FAT
+ #define CONFIG_CMD_EXT2
++#define CONFIG_CMD_EXT4
+ #endif
+ 
+ /* Unsupported features */
+-- 
+1.7.10
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
deleted file mode 100644
index ba86266..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 486ce56b1203dd71bad310940b321d3ae13cadec Mon Sep 17 00:00:00 2001
-From: u-boot@lakedaemon.net <u-boot@lakedaemon.net>
-Date: Wed, 28 Mar 2012 04:37:11 +0000
-Subject: [PATCH 11/15] ext2load: increase read speed
-
-This patch dramatically drops the amount of time u-boot needs to read a
-file from an ext2 partition.  On a typical 2 to 5 MB file (kernels and
-initrds) it goes from tens of seconds to a couple seconds.
-
-All we are doing here is grouping contiguous blocks into one read.
-
-Boot tested on Globalscale Technologies Dreamplug (Kirkwood ARM SoC)
-with three different files.  sha1sums were calculated in Linux
-userspace, and then confirmed after ext2load.
-
-Signed-off-by: Jason Cooper <u-boot@lakedaemon.net>
----
- fs/ext2/ext2fs.c |   26 ++++++++++++++++++++++++--
- 1 files changed, 24 insertions(+), 2 deletions(-)
-
-diff --git a/fs/ext2/ext2fs.c b/fs/ext2/ext2fs.c
-index e119e13..8531db5 100644
---- a/fs/ext2/ext2fs.c
-+++ b/fs/ext2/ext2fs.c
-@@ -414,7 +414,6 @@ int ext2fs_read_file
- 		if (blknr < 0) {
- 			return (-1);
- 		}
--		blknr = blknr << log2blocksize;
- 
- 		/* Last block.  */
- 		if (i == blockcnt - 1) {
-@@ -432,6 +431,29 @@ int ext2fs_read_file
- 			blockend -= skipfirst;
- 		}
- 
-+		/* grab middle blocks in one go */
-+		if (i != pos / blocksize && i != blockcnt - 1 && blockcnt > 3) {
-+			int oldblk = blknr;
-+			int blocknxt;
-+			while (i < blockcnt - 1) {
-+				blocknxt = ext2fs_read_block(node, i + 1);
-+				if (blocknxt == (oldblk + 1)) {
-+					oldblk = blocknxt;
-+					i++;
-+				} else {
-+					blocknxt = ext2fs_read_block(node, i);
-+					break;
-+				}
-+			}
-+
-+			if (oldblk == blknr)
-+				blockend = blocksize;
-+			else
-+				blockend = (1 + blocknxt - blknr) * blocksize;
-+		}
-+
-+		blknr = blknr << log2blocksize;
-+
- 		/* If the block number is 0 this block is not stored on disk but
- 		   is zero filled instead.  */
- 		if (blknr) {
-@@ -444,7 +466,7 @@ int ext2fs_read_file
- 		} else {
- 			memset (buf, 0, blocksize - skipfirst);
- 		}
--		buf += blocksize - skipfirst;
-+		buf += blockend - skipfirst;
- 	}
- 	return (len);
- }
--- 
-1.7.2.5
-
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
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
deleted file mode 100644
index 49720e9..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4c7580268803485ecbc05c3da3e1bbb9f2f431e0 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 1 Apr 2012 23:10:22 +0200
-Subject: [PATCH 13/15] am335x-evm: load uImage from /boot instead of VFAT
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index 9a4b407..b2628c5 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -102,7 +102,7 @@
- 		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
- 		"ip=dhcp\0" \
- 	"mmc_boot=run mmc_args; " \
--		"run mmc_load_uimage; " \
-+		"run mmc_load_uimage_ext2; " \
- 		"bootm 0x80007fc0\0" \
- 	"nand_boot=echo Booting from nand ...; " \
- 		"run nand_args; " \
-@@ -136,7 +136,7 @@
- 			"echo Running uenvcmd ...;" \
- 			"run uenvcmd;" \
- 		"fi;" \
--		"if run mmc_load_uimage; then " \
-+		"if run mmc_load_uimage_ext2; then " \
- 			"run mmc_args;" \
- 			"bootm 0x80007fc0;" \
- 		"fi;" \
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch
deleted file mode 100644
index bc81c18..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0014-ext4fs-ls-load-support.patch
+++ /dev/null
@@ -1,2362 +0,0 @@
-From 881674a3a8258bfc0f3a130503e2663c2f22817d Mon Sep 17 00:00:00 2001
-From: uma.shankar <uma.shankar@samsung.com>
-Date: Mon, 9 Jan 2012 07:54:50 +0000
-Subject: [PATCH 14/15] ext4fs ls load support
-
-Signed-off-by: Uma Shankar <uma.shankar@samsung.com>
-Signed-off-by: Manjunatha C Achar <a.manjunatha@samsung.com>
-Signed-off-by: Iqbal Shareef <iqbal.ams@samsung.com>
-Signed-off-by: Hakgoo Lee <goodguy.lee@samsung.com>
----
- Makefile              |    2 +-
- common/Makefile       |    1 +
- common/cmd_ext4.c     |  266 +++++++++++++++
- fs/Makefile           |    1 +
- fs/ext2/dev.c         |    1 +
- fs/ext2/ext2fs.c      |  181 ++---------
- fs/ext4/Makefile      |   51 +++
- fs/ext4/dev.c         |  145 ++++++++
- fs/ext4/ext4_common.c |  875 +++++++++++++++++++++++++++++++++++++++++++++++++
- fs/ext4/ext4_common.h |   63 ++++
- fs/ext4/ext4fs.c      |  228 +++++++++++++
- include/ext4fs.h      |  132 ++++++++
- include/ext_common.h  |  188 +++++++++++
- 13 files changed, 1977 insertions(+), 157 deletions(-)
- create mode 100644 common/cmd_ext4.c
- create mode 100644 fs/ext4/Makefile
- create mode 100644 fs/ext4/dev.c
- create mode 100644 fs/ext4/ext4_common.c
- create mode 100644 fs/ext4/ext4_common.h
- create mode 100644 fs/ext4/ext4fs.c
- create mode 100644 include/ext4fs.h
- create mode 100644 include/ext_common.h
-
-diff --git a/Makefile b/Makefile
-index 99b9278..6a5068d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -226,7 +226,7 @@ LIBS += arch/arm/cpu/ixp/npe/libnpe.o
- endif
- LIBS += arch/$(ARCH)/lib/lib$(ARCH).o
- LIBS += fs/cramfs/libcramfs.o fs/fat/libfat.o fs/fdos/libfdos.o fs/jffs2/libjffs2.o \
--	fs/reiserfs/libreiserfs.o fs/ext2/libext2fs.o fs/yaffs2/libyaffs2.o \
-+	fs/reiserfs/libreiserfs.o fs/ext2/libext2fs.o fs/ext4/libext4fs.o fs/yaffs2/libyaffs2.o \
- 	fs/ubifs/libubifs.o
- LIBS += net/libnet.o
- LIBS += disk/libdisk.o
-diff --git a/common/Makefile b/common/Makefile
-index 54dc558..a1ccfd8 100644
---- a/common/Makefile
-+++ b/common/Makefile
-@@ -87,6 +87,7 @@ COBJS-$(CONFIG_ENV_IS_IN_EEPROM) += cmd_eeprom.o
- COBJS-$(CONFIG_CMD_EEPROM) += cmd_eeprom.o
- COBJS-$(CONFIG_CMD_ELF) += cmd_elf.o
- COBJS-$(CONFIG_SYS_HUSH_PARSER) += cmd_exit.o
-+COBJS-$(CONFIG_CMD_EXT4) += cmd_ext4.o
- COBJS-$(CONFIG_CMD_EXT2) += cmd_ext2.o
- COBJS-$(CONFIG_CMD_FAT) += cmd_fat.o
- COBJS-$(CONFIG_CMD_FDC)$(CONFIG_CMD_FDOS) += cmd_fdc.o
-diff --git a/common/cmd_ext4.c b/common/cmd_ext4.c
-new file mode 100644
-index 0000000..2c53d2c
---- /dev/null
-+++ b/common/cmd_ext4.c
-@@ -0,0 +1,266 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * Ext4fs support
-+ * made from existing cmd_ext2.c file of Uboot
-+ *
-+ * (C) Copyright 2004
-+ * esd gmbh <www.esd-electronics.com>
-+ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
-+ *
-+ * made from cmd_reiserfs by
-+ *
-+ * (C) Copyright 2003 - 2004
-+ * Sysgo Real-Time Solutions, AG <www.elinos.com>
-+ * Pavel Bartusek <pba@sysgo.com>
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License as
-+ * published by the Free Software Foundation; either version 2 of
-+ * the License, or (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
-+ * MA 02111-1307 USA
-+ *
-+ */
-+
-+/*
-+ * Changelog:
-+ *	0.1 - Newly created file for ext4fs support. Taken from cmd_ext2.c
-+ *	        file in uboot. Added ext4fs ls and load support.
-+ */
-+
-+#include <common.h>
-+#include <part.h>
-+#include <config.h>
-+#include <command.h>
-+#include <image.h>
-+#include <linux/ctype.h>
-+#include <asm/byteorder.h>
-+#include <ext_common.h>
-+#include <ext4fs.h>
-+#include <linux/stat.h>
-+#include <malloc.h>
-+
-+#if defined(CONFIG_CMD_USB) && defined(CONFIG_USB_STORAGE)
-+#include <usb.h>
-+#endif
-+
-+#if !defined(CONFIG_DOS_PARTITION) && !defined(CONFIG_EFI_PARTITION)
-+#error DOS or EFI partition support must be selected
-+#endif
-+
-+uint64_t total_sector;
-+uint64_t part_offset;
-+
-+#define DOS_PART_MAGIC_OFFSET	0x1fe
-+#define DOS_FS_TYPE_OFFSET	0x36
-+#define DOS_FS32_TYPE_OFFSET	0x52
-+
-+static int do_ext4_load(cmd_tbl_t *cmdtp, int flag, int argc,
-+						char *const argv[])
-+{
-+	char *filename = NULL;
-+	char *ep;
-+	int dev;
-+	unsigned long part = 1;
-+	ulong addr = 0;
-+	ulong part_length;
-+	int filelen;
-+	disk_partition_t info;
-+	struct ext_filesystem *fs;
-+	char buf[12];
-+	unsigned long count;
-+	const char *addr_str;
-+
-+	count = 0;
-+	addr = simple_strtoul(argv[3], NULL, 16);
-+	filename = getenv("bootfile");
-+	switch (argc) {
-+	case 3:
-+		addr_str = getenv("loadaddr");
-+		if (addr_str != NULL)
-+			addr = simple_strtoul(addr_str, NULL, 16);
-+		else
-+			addr = CONFIG_SYS_LOAD_ADDR;
-+
-+		break;
-+	case 4:
-+		break;
-+	case 5:
-+		filename = argv[4];
-+		break;
-+	case 6:
-+		filename = argv[4];
-+		count = simple_strtoul(argv[5], NULL, 16);
-+		break;
-+
-+	default:
-+		return cmd_usage(cmdtp);
-+	}
-+
-+	if (!filename) {
-+		puts("** No boot file defined **\n");
-+		return 1;
-+	}
-+
-+	dev = (int)simple_strtoul(argv[2], &ep, 16);
-+	ext4_dev_desc = get_dev(argv[1], dev);
-+	if (ext4_dev_desc == NULL) {
-+		printf("** Block device %s %d not supported\n", argv[1], dev);
-+		return 1;
-+	}
-+	if (init_fs(ext4_dev_desc))
-+		return 1;
-+
-+	fs = get_fs();
-+	if (*ep) {
-+		if (*ep != ':') {
-+			puts("** Invalid boot device, use `dev[:part]' **\n");
-+			return 1;
-+		}
-+		part = simple_strtoul(++ep, NULL, 16);
-+	}
-+
-+	if (part != 0) {
-+		if (get_partition_info(fs->dev_desc, part, &info)) {
-+			printf("** Bad partition %lu **\n", part);
-+			return 1;
-+		}
-+
-+		if (strncmp((char *)info.type, BOOT_PART_TYPE,
-+			    strlen(BOOT_PART_TYPE)) != 0) {
-+			printf("** Invalid partition type \"%s\""
-+			       " (expect \"" BOOT_PART_TYPE "\")\n", info.type);
-+			return 1;
-+		}
-+		printf("Loading file \"%s\" "
-+		       "from %s device %d:%lu %s\n",
-+		       filename, argv[1], dev, part, info.name);
-+	} else {
-+		printf("Loading file \"%s\" from %s device %d\n",
-+		       filename, argv[1], dev);
-+	}
-+
-+	part_length = ext4fs_set_blk_dev(fs->dev_desc, part);
-+	if (part_length == 0) {
-+		printf("**Bad partition - %s %d:%lu **\n", argv[1], dev, part);
-+		ext4fs_close();
-+		return 1;
-+	}
-+
-+	if (!ext4fs_mount(part_length)) {
-+		printf("** Bad ext2 partition or disk - %s %d:%lu **\n",
-+		       argv[1], dev, part);
-+		ext4fs_close();
-+		return 1;
-+	}
-+
-+	filelen = ext4fs_open(filename);
-+	if (filelen < 0) {
-+		printf("** File not found %s\n", filename);
-+		ext4fs_close();
-+		return 1;
-+	}
-+	if ((count < filelen) && (count != 0))
-+		filelen = count;
-+
-+	if (ext4fs_read((char *)addr, filelen) != filelen) {
-+		printf("** Unable to read \"%s\" from %s %d:%lu **\n",
-+		       filename, argv[1], dev, part);
-+		ext4fs_close();
-+		return 1;
-+	}
-+
-+	ext4fs_close();
-+	deinit_fs(fs->dev_desc);
-+	/* Loading ok, update default load address */
-+	load_addr = addr;
-+
-+	printf("%d bytes read\n", filelen);
-+	sprintf(buf, "%X", filelen);
-+	setenv("filesize", buf);
-+
-+	return 0;
-+}
-+
-+static int do_ext4_ls(cmd_tbl_t *cmdtp, int flag, int argc, char *const argv[])
-+{
-+	const char *filename = "/";
-+	int dev;
-+	unsigned long part = 1;
-+	char *ep;
-+	struct ext_filesystem *fs;
-+	int part_length;
-+
-+	if (argc < 3)
-+		return cmd_usage(cmdtp);
-+
-+	dev = (int)simple_strtoul(argv[2], &ep, 16);
-+	ext4_dev_desc = get_dev(argv[1], dev);
-+
-+	if (ext4_dev_desc == NULL) {
-+		printf("\n** Block device %s %d not supported\n", argv[1], dev);
-+		return 1;
-+	}
-+
-+	if (init_fs(ext4_dev_desc))
-+		return 1;
-+
-+	fs = get_fs();
-+	if (*ep) {
-+		if (*ep != ':') {
-+			puts("\n** Invalid boot device, use `dev[:part]' **\n");
-+			return 1;
-+		}
-+		part = simple_strtoul(++ep, NULL, 16);
-+	}
-+
-+	if (argc == 4)
-+		filename = argv[3];
-+
-+	part_length = ext4fs_set_blk_dev(fs->dev_desc, part);
-+	if (part_length == 0) {
-+		printf("** Bad partition - %s %d:%lu **\n", argv[1], dev, part);
-+		ext4fs_close();
-+		return 1;
-+	}
-+
-+	if (!ext4fs_mount(part_length)) {
-+		printf("** Bad ext2 partition or disk - %s %d:%lu **\n",
-+		       argv[1], dev, part);
-+		ext4fs_close();
-+		return 1;
-+	}
-+	if (ext4fs_ls(filename)) {
-+		printf("** Error ext2fs_ls() **\n");
-+		ext4fs_close();
-+		return 1;
-+	};
-+
-+	ext4fs_close();
-+	deinit_fs(fs->dev_desc);
-+
-+	return 0;
-+}
-+
-+U_BOOT_CMD(ext4ls, 4, 1, do_ext4_ls,
-+	   "list files in a directory (default /)",
-+	   "<interface> <dev[:part]> [directory]\n"
-+	   "	  - list files from 'dev' on 'interface' in a 'directory'");
-+
-+U_BOOT_CMD(ext4load, 6, 0, do_ext4_load,
-+	   "load binary file from a Ext2 filesystem",
-+	   "<interface> <dev[:part]> [addr] [filename] [bytes]\n"
-+	   "	  - load binary file 'filename' from 'dev' on 'interface'\n"
-+	   "		 to address 'addr' from ext2 filesystem");
-diff --git a/fs/Makefile b/fs/Makefile
-index 22aad12..00a8f37 100644
---- a/fs/Makefile
-+++ b/fs/Makefile
-@@ -23,6 +23,7 @@
- #
- 
- subdirs-$(CONFIG_CMD_CRAMFS) := cramfs
-+subdirs-$(CONFIG_CMD_EXT4) += ext4
- subdirs-$(CONFIG_CMD_EXT2) += ext2
- subdirs-$(CONFIG_CMD_FAT) += fat
- subdirs-$(CONFIG_CMD_FDOS) += fdos
-diff --git a/fs/ext2/dev.c b/fs/ext2/dev.c
-index 78851d0..339a16e 100644
---- a/fs/ext2/dev.c
-+++ b/fs/ext2/dev.c
-@@ -27,6 +27,7 @@
- #include <common.h>
- #include <config.h>
- #include <ext2fs.h>
-+#include <ext_common.h>
- 
- static block_dev_desc_t *ext2fs_block_dev_desc;
- static disk_partition_t part_info;
-diff --git a/fs/ext2/ext2fs.c b/fs/ext2/ext2fs.c
-index 8531db5..ea3d98c 100644
---- a/fs/ext2/ext2fs.c
-+++ b/fs/ext2/ext2fs.c
-@@ -25,152 +25,16 @@
- 
- #include <common.h>
- #include <ext2fs.h>
-+#include <ext_common.h>
- #include <malloc.h>
- #include <asm/byteorder.h>
- 
- extern int ext2fs_devread (int sector, int byte_offset, int byte_len,
- 			   char *buf);
- 
--/* Magic value used to identify an ext2 filesystem.  */
--#define	EXT2_MAGIC		0xEF53
--/* Amount of indirect blocks in an inode.  */
--#define INDIRECT_BLOCKS		12
--/* Maximum lenght of a pathname.  */
--#define EXT2_PATH_MAX		4096
--/* Maximum nesting of symlinks, used to prevent a loop.  */
--#define	EXT2_MAX_SYMLINKCNT	8
--
--/* Filetype used in directory entry.  */
--#define	FILETYPE_UNKNOWN	0
--#define	FILETYPE_REG		1
--#define	FILETYPE_DIRECTORY	2
--#define	FILETYPE_SYMLINK	7
--
--/* Filetype information as used in inodes.  */
--#define FILETYPE_INO_MASK	0170000
--#define FILETYPE_INO_REG	0100000
--#define FILETYPE_INO_DIRECTORY	0040000
--#define FILETYPE_INO_SYMLINK	0120000
--
--/* Bits used as offset in sector */
--#define DISK_SECTOR_BITS        9
--
--/* Log2 size of ext2 block in 512 blocks.  */
--#define LOG2_EXT2_BLOCK_SIZE(data) (__le32_to_cpu (data->sblock.log2_block_size) + 1)
--
--/* Log2 size of ext2 block in bytes.  */
--#define LOG2_BLOCK_SIZE(data)	   (__le32_to_cpu (data->sblock.log2_block_size) + 10)
--
--/* The size of an ext2 block in bytes.  */
--#define EXT2_BLOCK_SIZE(data)	   (1 << LOG2_BLOCK_SIZE(data))
--
--/* The ext2 superblock.  */
--struct ext2_sblock {
--	uint32_t total_inodes;
--	uint32_t total_blocks;
--	uint32_t reserved_blocks;
--	uint32_t free_blocks;
--	uint32_t free_inodes;
--	uint32_t first_data_block;
--	uint32_t log2_block_size;
--	uint32_t log2_fragment_size;
--	uint32_t blocks_per_group;
--	uint32_t fragments_per_group;
--	uint32_t inodes_per_group;
--	uint32_t mtime;
--	uint32_t utime;
--	uint16_t mnt_count;
--	uint16_t max_mnt_count;
--	uint16_t magic;
--	uint16_t fs_state;
--	uint16_t error_handling;
--	uint16_t minor_revision_level;
--	uint32_t lastcheck;
--	uint32_t checkinterval;
--	uint32_t creator_os;
--	uint32_t revision_level;
--	uint16_t uid_reserved;
--	uint16_t gid_reserved;
--	uint32_t first_inode;
--	uint16_t inode_size;
--	uint16_t block_group_number;
--	uint32_t feature_compatibility;
--	uint32_t feature_incompat;
--	uint32_t feature_ro_compat;
--	uint32_t unique_id[4];
--	char volume_name[16];
--	char last_mounted_on[64];
--	uint32_t compression_info;
--};
--
--/* The ext2 blockgroup.  */
--struct ext2_block_group {
--	uint32_t block_id;
--	uint32_t inode_id;
--	uint32_t inode_table_id;
--	uint16_t free_blocks;
--	uint16_t free_inodes;
--	uint16_t used_dir_cnt;
--	uint32_t reserved[3];
--};
--
--/* The ext2 inode.  */
--struct ext2_inode {
--	uint16_t mode;
--	uint16_t uid;
--	uint32_t size;
--	uint32_t atime;
--	uint32_t ctime;
--	uint32_t mtime;
--	uint32_t dtime;
--	uint16_t gid;
--	uint16_t nlinks;
--	uint32_t blockcnt;	/* Blocks of 512 bytes!! */
--	uint32_t flags;
--	uint32_t osd1;
--	union {
--		struct datablocks {
--			uint32_t dir_blocks[INDIRECT_BLOCKS];
--			uint32_t indir_block;
--			uint32_t double_indir_block;
--			uint32_t tripple_indir_block;
--		} blocks;
--		char symlink[60];
--	} b;
--	uint32_t version;
--	uint32_t acl;
--	uint32_t dir_acl;
--	uint32_t fragment_addr;
--	uint32_t osd2[3];
--};
--
--/* The header of an ext2 directory entry.  */
--struct ext2_dirent {
--	uint32_t inode;
--	uint16_t direntlen;
--	uint8_t namelen;
--	uint8_t filetype;
--};
--
--struct ext2fs_node {
--	struct ext2_data *data;
--	struct ext2_inode inode;
--	int ino;
--	int inode_read;
--};
--
--/* Information about a "mounted" ext2 filesystem.  */
--struct ext2_data {
--	struct ext2_sblock sblock;
--	struct ext2_inode *inode;
--	struct ext2fs_node diropen;
--};
--
--
--typedef struct ext2fs_node *ext2fs_node_t;
- 
- struct ext2_data *ext2fs_root = NULL;
--ext2fs_node_t ext2fs_file = NULL;
-+struct ext2fs_node *ext2fs_file;
- int symlinknest = 0;
- uint32_t *indir1_block = NULL;
- int indir1_size = 0;
-@@ -243,14 +107,16 @@ static int ext2fs_read_inode
- }
- 
- 
--void ext2fs_free_node (ext2fs_node_t node, ext2fs_node_t currroot) {
-+void ext2fs_free_node(struct ext2fs_node *node, struct ext2fs_node *currroot)
-+{
- 	if ((node != &ext2fs_root->diropen) && (node != currroot)) {
- 		free (node);
- 	}
- }
- 
- 
--static int ext2fs_read_block (ext2fs_node_t node, int fileblock) {
-+static int ext2fs_read_block(struct ext2fs_node *node, int fileblock)
-+{
- 	struct ext2_data *data = node->data;
- 	struct ext2_inode *inode = &node->inode;
- 	int blknr;
-@@ -390,7 +256,8 @@ static int ext2fs_read_block (ext2fs_node_t node, int fileblock) {
- 
- 
- int ext2fs_read_file
--	(ext2fs_node_t node, int pos, unsigned int len, char *buf) {
-+	(struct ext2fs_node *node, int pos, unsigned int len, char *buf)
-+{
- 	int i;
- 	int blockcnt;
- 	int log2blocksize = LOG2_EXT2_BLOCK_SIZE (node->data);
-@@ -471,8 +338,8 @@ int ext2fs_read_file
- 	return (len);
- }
- 
--
--static int ext2fs_iterate_dir (ext2fs_node_t dir, char *name, ext2fs_node_t * fnode, int *ftype)
-+int ext2fs_iterate_dir(struct ext2fs_node *dir, char *name,
-+					struct ext2fs_node **fnode, int *ftype)
- {
- 	unsigned int fpos = 0;
- 	int status;
-@@ -501,7 +368,7 @@ static int ext2fs_iterate_dir (ext2fs_node_t dir, char *name, ext2fs_node_t * fn
- 		}
- 		if (dirent.namelen != 0) {
- 			char filename[dirent.namelen + 1];
--			ext2fs_node_t fdiro;
-+			struct ext2fs_node *fdiro;
- 			int type = FILETYPE_UNKNOWN;
- 
- 			status = ext2fs_read_file (diro,
-@@ -603,8 +470,8 @@ static int ext2fs_iterate_dir (ext2fs_node_t dir, char *name, ext2fs_node_t * fn
- 	return (0);
- }
- 
--
--static char *ext2fs_read_symlink (ext2fs_node_t node) {
-+static char *ext2fs_read_symlink(struct ext2fs_node *node)
-+{
- 	char *symlink;
- 	struct ext2fs_node *diro = node;
- 	int status;
-@@ -641,15 +508,16 @@ static char *ext2fs_read_symlink (ext2fs_node_t node) {
- 
- 
- int ext2fs_find_file1
--	(const char *currpath,
--	 ext2fs_node_t currroot, ext2fs_node_t * currfound, int *foundtype) {
-+	(const char *currpath, struct ext2fs_node *currroot,
-+		struct ext2fs_node **currfound, int *foundtype)
-+{
- 	char fpath[strlen (currpath) + 1];
- 	char *name = fpath;
- 	char *next;
- 	int status;
- 	int type = FILETYPE_DIRECTORY;
--	ext2fs_node_t currnode = currroot;
--	ext2fs_node_t oldnode = currroot;
-+	struct ext2fs_node *currnode = currroot;
-+	struct ext2fs_node *oldnode = currroot;
- 
- 	strncpy (fpath, currpath, strlen (currpath) + 1);
- 
-@@ -745,8 +613,9 @@ int ext2fs_find_file1
- 
- 
- int ext2fs_find_file
--	(const char *path,
--	 ext2fs_node_t rootnode, ext2fs_node_t * foundnode, int expecttype) {
-+	(const char *path, struct ext2fs_node *rootnode,
-+	struct ext2fs_node **foundnode, int expecttype)
-+{
- 	int status;
- 	int foundtype = FILETYPE_DIRECTORY;
- 
-@@ -772,7 +641,7 @@ int ext2fs_find_file
- 
- 
- int ext2fs_ls (const char *dirname) {
--	ext2fs_node_t dirnode;
-+	struct ext2fs_node *dirnode;
- 	int status;
- 
- 	if (ext2fs_root == NULL) {
-@@ -792,7 +661,7 @@ int ext2fs_ls (const char *dirname) {
- 
- 
- int ext2fs_open (const char *filename) {
--	ext2fs_node_t fdiro = NULL;
-+	struct ext2fs_node *fdiro = NULL;
- 	int status;
- 	int len;
- 
-@@ -822,8 +691,8 @@ fail:
- }
- 
- 
--int ext2fs_close (void
--	) {
-+int ext2fs_close(void)
-+{
- 	if ((ext2fs_file != NULL) && (ext2fs_root != NULL)) {
- 		ext2fs_free_node (ext2fs_file, &ext2fs_root->diropen);
- 		ext2fs_file = NULL;
-diff --git a/fs/ext4/Makefile b/fs/ext4/Makefile
-new file mode 100644
-index 0000000..7add4ab
---- /dev/null
-+++ b/fs/ext4/Makefile
-@@ -0,0 +1,51 @@
-+#
-+# (C) Copyright 2006
-+# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
-+#
-+# (C) Copyright 2003
-+# Pavel Bartusek, Sysgo Real-Time Solutions AG, pba@sysgo.de
-+#
-+#
-+# See file CREDITS for list of people who contributed to this
-+# project.
-+#
-+# This program is free software; you can redistribute it and/or
-+# modify it under the terms of the GNU General Public License as
-+# published by the Free Software Foundation; either version 2 of
-+# the License, or (at your option) any later version.
-+#
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+#
-+# You should have received a copy of the GNU General Public License
-+# along with this program; if not, write to the Free Software
-+# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
-+# MA 02111-1307 USA
-+#
-+
-+include $(TOPDIR)/config.mk
-+
-+LIB	= $(obj)libext4fs.o
-+
-+AOBJS	=
-+COBJS-$(CONFIG_CMD_EXT4) := ext4fs.o ext4_common.o dev.o
-+
-+SRCS	:= $(AOBJS:.o=.S) $(COBJS-y:.o=.c)
-+OBJS	:= $(addprefix $(obj),$(AOBJS) $(COBJS-y))
-+
-+
-+all:	$(LIB) $(AOBJS)
-+
-+$(LIB):	$(obj).depend $(OBJS)
-+	$(call cmd_link_o_target, $(OBJS))
-+
-+#########################################################################
-+
-+# defines $(obj).depend target
-+include $(SRCTREE)/rules.mk
-+
-+sinclude $(obj).depend
-+
-+#########################################################################
-diff --git a/fs/ext4/dev.c b/fs/ext4/dev.c
-new file mode 100644
-index 0000000..2054be3
---- /dev/null
-+++ b/fs/ext4/dev.c
-@@ -0,0 +1,145 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * made from existing ext2/dev.c file of Uboot
-+ * (C) Copyright 2004
-+ * esd gmbh <www.esd-electronics.com>
-+ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
-+ *
-+ * based on code of fs/reiserfs/dev.c by
-+ *
-+ * (C) Copyright 2003 - 2004
-+ * Sysgo AG, <www.elinos.com>, Pavel Bartusek <pba@sysgo.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+ *
-+ */
-+
-+/*
-+ * Changelog:
-+ *	0.1 - Newly created file for ext4fs support. Taken from
-+ *	        fs/ext2/dev.c file in uboot.
-+ */
-+
-+#include <common.h>
-+#include <config.h>
-+#include <ext_common.h>
-+
-+static block_dev_desc_t *ext4fs_block_dev_desc;
-+static disk_partition_t part_info;
-+
-+int ext4fs_set_blk_dev(block_dev_desc_t *rbdd, int part)
-+{
-+	ext4fs_block_dev_desc = rbdd;
-+
-+	if (part == 0) {
-+		/* disk doesn't use partition table */
-+		part_info.start = 0;
-+		part_info.size = rbdd->lba;
-+		part_info.blksz = rbdd->blksz;
-+	} else {
-+		if (get_partition_info(ext4fs_block_dev_desc,
-+					part, &part_info))
-+			return 0;
-+	}
-+	return part_info.size;
-+}
-+
-+int ext4fs_devread(int sector, int byte_offset, int byte_len, char *buf)
-+{
-+	char sec_buf[SECTOR_SIZE];
-+	unsigned block_len;
-+
-+	/* Check partition boundaries */
-+	if ((sector < 0)
-+	    || ((sector + ((byte_offset + byte_len - 1) >> SECTOR_BITS)) >=
-+		part_info.size)) {
-+		printf("%s read outside partition %d\n", __func__, sector);
-+		return 0;
-+	}
-+
-+	/* Get the read to the beginning of a partition */
-+	sector += byte_offset >> SECTOR_BITS;
-+	byte_offset &= SECTOR_SIZE - 1;
-+
-+	debug(" <%d, %d, %d>\n", sector, byte_offset, byte_len);
-+
-+	if (ext4fs_block_dev_desc == NULL) {
-+		printf("** Invalid Block Device Descriptor (NULL)\n");
-+		return 0;
-+	}
-+
-+	if (byte_offset != 0) {
-+		/* read first part which isn't aligned with start of sector */
-+		if (ext4fs_block_dev_desc->
-+		    block_read(ext4fs_block_dev_desc->dev,
-+				part_info.start + sector, 1,
-+				(unsigned long *) sec_buf) != 1) {
-+			printf(" ** ext2fs_devread() read error **\n");
-+			return 0;
-+		}
-+		memcpy(buf, sec_buf + byte_offset,
-+			min(SECTOR_SIZE - byte_offset, byte_len));
-+		buf += min(SECTOR_SIZE - byte_offset, byte_len);
-+		byte_len -= min(SECTOR_SIZE - byte_offset, byte_len);
-+		sector++;
-+	}
-+
-+	if (byte_len == 0)
-+		return 1;
-+
-+	/* read sector aligned part */
-+	block_len = byte_len & ~(SECTOR_SIZE - 1);
-+
-+	if (block_len == 0) {
-+		u8 p[SECTOR_SIZE];
-+
-+		block_len = SECTOR_SIZE;
-+		ext4fs_block_dev_desc->block_read(ext4fs_block_dev_desc->dev,
-+						  part_info.start + sector,
-+						  1, (unsigned long *)p);
-+		memcpy(buf, p, byte_len);
-+		return 1;
-+	}
-+
-+	if (ext4fs_block_dev_desc->block_read(ext4fs_block_dev_desc->dev,
-+					part_info.start + sector,
-+					block_len / SECTOR_SIZE,
-+					(unsigned long *) buf) !=
-+					block_len / SECTOR_SIZE) {
-+		printf(" ** %s read error - block\n", __func__);
-+		return 0;
-+	}
-+	block_len = byte_len & ~(SECTOR_SIZE - 1);
-+	buf += block_len;
-+	byte_len -= block_len;
-+	sector += block_len / SECTOR_SIZE;
-+
-+	if (byte_len != 0) {
-+		/* read rest of data which are not in whole sector */
-+		if (ext4fs_block_dev_desc->
-+		    block_read(ext4fs_block_dev_desc->dev,
-+				part_info.start + sector, 1,
-+				(unsigned long *) sec_buf) != 1) {
-+			printf("* %s read error - last part\n", __func__);
-+			return 0;
-+		}
-+		memcpy(buf, sec_buf, byte_len);
-+	}
-+	return 1;
-+}
-diff --git a/fs/ext4/ext4_common.c b/fs/ext4/ext4_common.c
-new file mode 100644
-index 0000000..d9deefe
---- /dev/null
-+++ b/fs/ext4/ext4_common.c
-@@ -0,0 +1,875 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * ext4ls and ext4load : Based on ext2 ls load support in Uboot.
-+ *
-+ * (C) Copyright 2004
-+ * esd gmbh <www.esd-electronics.com>
-+ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
-+ *
-+ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
-+ * GRUB  --  GRand Unified Bootloader
-+ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+ */
-+
-+#include <common.h>
-+#include <ext_common.h>
-+#include <ext4fs.h>
-+#include <malloc.h>
-+#include <stddef.h>
-+#include <linux/stat.h>
-+#include <linux/time.h>
-+#include <asm/byteorder.h>
-+#include "ext4_common.h"
-+
-+struct ext2_data *ext4fs_root;
-+struct ext2fs_node *ext4fs_file;
-+uint32_t *ext4fs_indir1_block;
-+int ext4fs_indir1_size;
-+int ext4fs_indir1_blkno = -1;
-+uint32_t *ext4fs_indir2_block;
-+int ext4fs_indir2_size;
-+int ext4fs_indir2_blkno = -1;
-+
-+uint32_t *ext4fs_indir3_block;
-+int ext4fs_indir3_size;
-+int ext4fs_indir3_blkno = -1;
-+struct ext2_inode *g_parent_inode;
-+static int symlinknest;
-+
-+static struct ext4_extent_header *ext4fs_get_extent_block
-+	(struct ext2_data *data, char *buf,
-+		struct ext4_extent_header *ext_block,
-+		uint32_t fileblock, int log2_blksz)
-+{
-+	struct ext4_extent_idx *index;
-+	unsigned long long block;
-+	struct ext_filesystem *fs = get_fs();
-+	int i;
-+
-+	while (1) {
-+		index = (struct ext4_extent_idx *)(ext_block + 1);
-+
-+		if (le32_to_cpu(ext_block->eh_magic) != EXT4_EXT_MAGIC)
-+			return 0;
-+
-+		if (ext_block->eh_depth == 0)
-+			return ext_block;
-+		i = -1;
-+		do {
-+			i++;
-+			if (i >= le32_to_cpu(ext_block->eh_entries))
-+				break;
-+		} while (fileblock > le32_to_cpu(index[i].ei_block));
-+
-+		if (--i < 0)
-+			return 0;
-+
-+		block = le32_to_cpu(index[i].ei_leaf_hi);
-+		block = (block << 32) + le32_to_cpu(index[i].ei_leaf_lo);
-+
-+		if (ext4fs_devread(block << log2_blksz, 0, fs->blksz, buf))
-+			ext_block = (struct ext4_extent_header *)buf;
-+		else
-+			return 0;
-+	}
-+}
-+
-+static int ext4fs_blockgroup
-+	(struct ext2_data *data, int group, struct ext2_block_group *blkgrp)
-+{
-+	long int blkno;
-+	unsigned int blkoff, desc_per_blk;
-+
-+	desc_per_blk = EXT2_BLOCK_SIZE(data) / sizeof(struct ext2_block_group);
-+
-+	blkno = __le32_to_cpu(data->sblock.first_data_block) + 1 +
-+	    group / desc_per_blk;
-+	blkoff = (group % desc_per_blk) * sizeof(struct ext2_block_group);
-+
-+	debug("ext4fs read %d group descriptor (blkno %ld blkoff %u)\n",
-+	      group, blkno, blkoff);
-+
-+	return ext4fs_devread(blkno << LOG2_EXT2_BLOCK_SIZE(data),
-+			      blkoff, sizeof(struct ext2_block_group),
-+			      (char *)blkgrp);
-+}
-+
-+int ext4fs_read_inode(struct ext2_data *data, int ino, struct ext2_inode *inode)
-+{
-+	struct ext2_block_group blkgrp;
-+	struct ext2_sblock *sblock = &data->sblock;
-+	struct ext_filesystem *fs = get_fs();
-+	int inodes_per_block, status;
-+	long int blkno;
-+	unsigned int blkoff;
-+
-+	/* It is easier to calculate if the first inode is 0. */
-+	ino--;
-+	status = ext4fs_blockgroup(data, ino / __le32_to_cpu
-+				   (sblock->inodes_per_group), &blkgrp);
-+	if (status == 0)
-+		return 0;
-+
-+	inodes_per_block = EXT2_BLOCK_SIZE(data) / fs->inodesz;
-+	blkno = __le32_to_cpu(blkgrp.inode_table_id) +
-+	    (ino % __le32_to_cpu(sblock->inodes_per_group)) / inodes_per_block;
-+	blkoff = (ino % inodes_per_block) * fs->inodesz;
-+	/* Read the inode. */
-+	status = ext4fs_devread(blkno << LOG2_EXT2_BLOCK_SIZE(data), blkoff,
-+				sizeof(struct ext2_inode), (char *)inode);
-+	if (status == 0)
-+		return 0;
-+
-+	return 1;
-+}
-+
-+long int read_allocated_block(struct ext2_inode *inode, int fileblock)
-+{
-+	long int blknr;
-+	int blksz;
-+	int log2_blksz;
-+	int status;
-+	long int rblock;
-+	long int perblock_parent;
-+	long int perblock_child;
-+	unsigned long long start;
-+	/* get the blocksize of the filesystem */
-+	blksz = EXT2_BLOCK_SIZE(ext4fs_root);
-+	log2_blksz = LOG2_EXT2_BLOCK_SIZE(ext4fs_root);
-+	if (le32_to_cpu(inode->flags) & EXT4_EXTENTS_FL) {
-+		char *buf = zalloc(blksz);
-+		if (!buf)
-+			return -ENOMEM;
-+		struct ext4_extent_header *ext_block;
-+		struct ext4_extent *extent;
-+		int i = -1;
-+		ext_block = ext4fs_get_extent_block(ext4fs_root, buf,
-+						    (struct ext4_extent_header
-+						     *)inode->b.
-+						    blocks.dir_blocks,
-+						    fileblock, log2_blksz);
-+		if (!ext_block) {
-+			printf("invalid extent block\n");
-+			free(buf);
-+			return -EINVAL;
-+		}
-+
-+		extent = (struct ext4_extent *)(ext_block + 1);
-+
-+		do {
-+			i++;
-+			if (i >= le32_to_cpu(ext_block->eh_entries))
-+				break;
-+		} while (fileblock >= le32_to_cpu(extent[i].ee_block));
-+		if (--i >= 0) {
-+			fileblock -= le32_to_cpu(extent[i].ee_block);
-+			if (fileblock >= le32_to_cpu(extent[i].ee_len)) {
-+				free(buf);
-+				return 0;
-+			}
-+
-+			start = le32_to_cpu(extent[i].ee_start_hi);
-+			start = (start << 32) +
-+			    le32_to_cpu(extent[i].ee_start_lo);
-+			free(buf);
-+			return fileblock + start;
-+		}
-+
-+		printf("Extent Error\n");
-+		free(buf);
-+		return -1;
-+	}
-+
-+	/* Direct blocks. */
-+	if (fileblock < INDIRECT_BLOCKS)
-+		blknr = __le32_to_cpu(inode->b.blocks.dir_blocks[fileblock]);
-+
-+	/* Indirect. */
-+	else if (fileblock < (INDIRECT_BLOCKS + (blksz / 4))) {
-+		if (ext4fs_indir1_block == NULL) {
-+			ext4fs_indir1_block = zalloc(blksz);
-+			if (ext4fs_indir1_block == NULL) {
-+				printf("** SI ext2fs read block (indir 1)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_size = blksz;
-+			ext4fs_indir1_blkno = -1;
-+		}
-+		if (blksz != ext4fs_indir1_size) {
-+			free(ext4fs_indir1_block);
-+			ext4fs_indir1_block = NULL;
-+			ext4fs_indir1_size = 0;
-+			ext4fs_indir1_blkno = -1;
-+			ext4fs_indir1_block = zalloc(blksz);
-+			if (ext4fs_indir1_block == NULL) {
-+				printf("** SI ext2fs read block (indir 1):"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_size = blksz;
-+		}
-+		if ((__le32_to_cpu(inode->b.blocks.indir_block) <<
-+		     log2_blksz) != ext4fs_indir1_blkno) {
-+			status =
-+			    ext4fs_devread(__le32_to_cpu
-+					   (inode->b.blocks.
-+					    indir_block) << log2_blksz, 0,
-+					   blksz, (char *)ext4fs_indir1_block);
-+			if (status == 0) {
-+				printf("** SI ext2fs read block (indir 1)"
-+				       "failed. **\n");
-+				return 0;
-+			}
-+			ext4fs_indir1_blkno =
-+			    __le32_to_cpu(inode->b.blocks.
-+					  indir_block) << log2_blksz;
-+		}
-+		blknr = __le32_to_cpu(ext4fs_indir1_block
-+				      [fileblock - INDIRECT_BLOCKS]);
-+	}
-+	/* Double indirect. */
-+	else if (fileblock < (INDIRECT_BLOCKS + (blksz / 4 *
-+					(blksz / 4 + 1)))) {
-+
-+		long int perblock = blksz / 4;
-+		long int rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4);
-+
-+		if (ext4fs_indir1_block == NULL) {
-+			ext4fs_indir1_block = zalloc(blksz);
-+			if (ext4fs_indir1_block == NULL) {
-+				printf("** DI ext2fs read block (indir 2 1)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_size = blksz;
-+			ext4fs_indir1_blkno = -1;
-+		}
-+		if (blksz != ext4fs_indir1_size) {
-+			free(ext4fs_indir1_block);
-+			ext4fs_indir1_block = NULL;
-+			ext4fs_indir1_size = 0;
-+			ext4fs_indir1_blkno = -1;
-+			ext4fs_indir1_block = zalloc(blksz);
-+			if (ext4fs_indir1_block == NULL) {
-+				printf("** DI ext2fs read block (indir 2 1)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_size = blksz;
-+		}
-+		if ((__le32_to_cpu(inode->b.blocks.double_indir_block) <<
-+		     log2_blksz) != ext4fs_indir1_blkno) {
-+			status =
-+			    ext4fs_devread(__le32_to_cpu
-+					   (inode->b.blocks.
-+					    double_indir_block) << log2_blksz,
-+					   0, blksz,
-+					   (char *)ext4fs_indir1_block);
-+			if (status == 0) {
-+				printf("** DI ext2fs read block (indir 2 1)"
-+				       "failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_blkno =
-+			    __le32_to_cpu(inode->b.blocks.double_indir_block) <<
-+			    log2_blksz;
-+		}
-+
-+		if (ext4fs_indir2_block == NULL) {
-+			ext4fs_indir2_block = zalloc(blksz);
-+			if (ext4fs_indir2_block == NULL) {
-+				printf("** DI ext2fs read block (indir 2 2)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir2_size = blksz;
-+			ext4fs_indir2_blkno = -1;
-+		}
-+		if (blksz != ext4fs_indir2_size) {
-+			free(ext4fs_indir2_block);
-+			ext4fs_indir2_block = NULL;
-+			ext4fs_indir2_size = 0;
-+			ext4fs_indir2_blkno = -1;
-+			ext4fs_indir2_block = zalloc(blksz);
-+			if (ext4fs_indir2_block == NULL) {
-+				printf("** DI ext2fs read block (indir 2 2)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir2_size = blksz;
-+		}
-+		if ((__le32_to_cpu(ext4fs_indir1_block[rblock / perblock]) <<
-+		     log2_blksz) != ext4fs_indir2_blkno) {
-+			status = ext4fs_devread(__le32_to_cpu
-+						(ext4fs_indir1_block
-+						 [rblock /
-+						  perblock]) << log2_blksz, 0,
-+						blksz,
-+						(char *)ext4fs_indir2_block);
-+			if (status == 0) {
-+				printf("** DI ext2fs read block (indir 2 2)"
-+				       "failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir2_blkno =
-+			    __le32_to_cpu(ext4fs_indir1_block[rblock
-+							      /
-+							      perblock]) <<
-+			    log2_blksz;
-+		}
-+		blknr = __le32_to_cpu(ext4fs_indir2_block[rblock % perblock]);
-+	}
-+	/* Tripple indirect. */
-+	else {
-+		rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4 +
-+				      (blksz / 4 * blksz / 4));
-+		perblock_child = blksz / 4;
-+		perblock_parent = ((blksz / 4) * (blksz / 4));
-+
-+		if (ext4fs_indir1_block == NULL) {
-+			ext4fs_indir1_block = zalloc(blksz);
-+			if (ext4fs_indir1_block == NULL) {
-+				printf("** TI ext2fs read block (indir 2 1)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_size = blksz;
-+			ext4fs_indir1_blkno = -1;
-+		}
-+		if (blksz != ext4fs_indir1_size) {
-+			free(ext4fs_indir1_block);
-+			ext4fs_indir1_block = NULL;
-+			ext4fs_indir1_size = 0;
-+			ext4fs_indir1_blkno = -1;
-+			ext4fs_indir1_block = zalloc(blksz);
-+			if (ext4fs_indir1_block == NULL) {
-+				printf("** TI ext2fs read block (indir 2 1)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_size = blksz;
-+		}
-+		if ((__le32_to_cpu(inode->b.blocks.triple_indir_block) <<
-+		     log2_blksz) != ext4fs_indir1_blkno) {
-+			status = ext4fs_devread
-+			    (__le32_to_cpu(inode->b.blocks.triple_indir_block)
-+			     << log2_blksz, 0, blksz,
-+			     (char *)ext4fs_indir1_block);
-+			if (status == 0) {
-+				printf("** TI ext2fs read block (indir 2 1)"
-+				       "failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir1_blkno =
-+			    __le32_to_cpu(inode->b.blocks.triple_indir_block) <<
-+			    log2_blksz;
-+		}
-+
-+		if (ext4fs_indir2_block == NULL) {
-+			ext4fs_indir2_block = zalloc(blksz);
-+			if (ext4fs_indir2_block == NULL) {
-+				printf("** TI ext2fs read block (indir 2 2)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir2_size = blksz;
-+			ext4fs_indir2_blkno = -1;
-+		}
-+		if (blksz != ext4fs_indir2_size) {
-+			free(ext4fs_indir2_block);
-+			ext4fs_indir2_block = NULL;
-+			ext4fs_indir2_size = 0;
-+			ext4fs_indir2_blkno = -1;
-+			ext4fs_indir2_block = zalloc(blksz);
-+			if (ext4fs_indir2_block == NULL) {
-+				printf("** TI ext2fs read block (indir 2 2)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir2_size = blksz;
-+		}
-+		if ((__le32_to_cpu(ext4fs_indir1_block[rblock /
-+						       perblock_parent]) <<
-+		     log2_blksz)
-+		    != ext4fs_indir2_blkno) {
-+			status = ext4fs_devread(__le32_to_cpu
-+						(ext4fs_indir1_block
-+						 [rblock /
-+						  perblock_parent]) <<
-+						log2_blksz, 0, blksz,
-+						(char *)ext4fs_indir2_block);
-+			if (status == 0) {
-+				printf("** TI ext2fs read block (indir 2 2)"
-+				       "failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir2_blkno =
-+			    __le32_to_cpu(ext4fs_indir1_block[rblock /
-+							      perblock_parent])
-+			    << log2_blksz;
-+		}
-+
-+		if (ext4fs_indir3_block == NULL) {
-+			ext4fs_indir3_block = zalloc(blksz);
-+			if (ext4fs_indir3_block == NULL) {
-+				printf("** TI ext2fs read block (indir 2 2)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir3_size = blksz;
-+			ext4fs_indir3_blkno = -1;
-+		}
-+		if (blksz != ext4fs_indir3_size) {
-+			free(ext4fs_indir3_block);
-+			ext4fs_indir3_block = NULL;
-+			ext4fs_indir3_size = 0;
-+			ext4fs_indir3_blkno = -1;
-+			ext4fs_indir3_block = zalloc(blksz);
-+			if (ext4fs_indir3_block == NULL) {
-+				printf("** TI ext2fs read block (indir 2 2)"
-+				       "malloc failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir3_size = blksz;
-+		}
-+		if ((__le32_to_cpu(ext4fs_indir2_block[rblock
-+						       /
-+						       perblock_child]) <<
-+		     log2_blksz) != ext4fs_indir3_blkno) {
-+			status =
-+			    ext4fs_devread(__le32_to_cpu
-+					   (ext4fs_indir2_block
-+					    [(rblock / perblock_child)
-+					     % (blksz / 4)]) << log2_blksz, 0,
-+					   blksz, (char *)ext4fs_indir3_block);
-+			if (status == 0) {
-+				printf("** TI ext2fs read block (indir 2 2)"
-+				       "failed. **\n");
-+				return -1;
-+			}
-+			ext4fs_indir3_blkno =
-+			    __le32_to_cpu(ext4fs_indir2_block[(rblock /
-+							       perblock_child) %
-+							      (blksz /
-+							       4)]) <<
-+			    log2_blksz;
-+		}
-+
-+		blknr = __le32_to_cpu(ext4fs_indir3_block
-+				      [rblock % perblock_child]);
-+	}
-+	debug("ext4fs_read_block %ld\n", blknr);
-+
-+	return blknr;
-+}
-+
-+void ext4fs_close(void)
-+{
-+	if ((ext4fs_file != NULL) && (ext4fs_root != NULL)) {
-+		ext4fs_free_node(ext4fs_file, &ext4fs_root->diropen);
-+		ext4fs_file = NULL;
-+	}
-+	if (ext4fs_root != NULL) {
-+		free(ext4fs_root);
-+		ext4fs_root = NULL;
-+	}
-+	if (ext4fs_indir1_block != NULL) {
-+		free(ext4fs_indir1_block);
-+		ext4fs_indir1_block = NULL;
-+		ext4fs_indir1_size = 0;
-+		ext4fs_indir1_blkno = -1;
-+	}
-+	if (ext4fs_indir2_block != NULL) {
-+		free(ext4fs_indir2_block);
-+		ext4fs_indir2_block = NULL;
-+		ext4fs_indir2_size = 0;
-+		ext4fs_indir2_blkno = -1;
-+	}
-+	if (ext4fs_indir3_block != NULL) {
-+		free(ext4fs_indir3_block);
-+		ext4fs_indir3_block = NULL;
-+		ext4fs_indir3_size = 0;
-+		ext4fs_indir3_blkno = -1;
-+	}
-+}
-+
-+int ext4fs_iterate_dir(struct ext2fs_node *dir, char *name,
-+		       struct ext2fs_node **fnode, int *ftype)
-+{
-+	unsigned int fpos = 0;
-+	int status;
-+	struct ext2fs_node *diro = (struct ext2fs_node *)dir;
-+
-+#ifdef DEBUG
-+	if (name != NULL)
-+		printf("Iterate dir %s\n", name);
-+#endif				/* of DEBUG */
-+	if (!diro->inode_read) {
-+		status = ext4fs_read_inode(diro->data, diro->ino, &diro->inode);
-+		if (status == 0)
-+			return 0;
-+	}
-+	/* Search the file.  */
-+	while (fpos < __le32_to_cpu(diro->inode.size)) {
-+		struct ext2_dirent dirent;
-+
-+		status = ext4fs_read_file(diro, fpos,
-+					  sizeof(struct ext2_dirent),
-+					  (char *)&dirent);
-+		if (status < 1)
-+			return 0;
-+
-+		if (dirent.namelen != 0) {
-+			char filename[dirent.namelen + 1];
-+			struct ext2fs_node *fdiro;
-+			int type = FILETYPE_UNKNOWN;
-+
-+			status = ext4fs_read_file(diro,
-+						  fpos +
-+						  sizeof(struct ext2_dirent),
-+						  dirent.namelen, filename);
-+			if (status < 1)
-+				return 0;
-+
-+			fdiro = zalloc(sizeof(struct ext2fs_node));
-+			if (!fdiro)
-+				return 0;
-+
-+			fdiro->data = diro->data;
-+			fdiro->ino = __le32_to_cpu(dirent.inode);
-+
-+			filename[dirent.namelen] = '\0';
-+
-+			if (dirent.filetype != FILETYPE_UNKNOWN) {
-+				fdiro->inode_read = 0;
-+
-+				if (dirent.filetype == FILETYPE_DIRECTORY)
-+					type = FILETYPE_DIRECTORY;
-+				else if (dirent.filetype == FILETYPE_SYMLINK)
-+					type = FILETYPE_SYMLINK;
-+				else if (dirent.filetype == FILETYPE_REG)
-+					type = FILETYPE_REG;
-+			} else {
-+				status = ext4fs_read_inode(diro->data,
-+							   __le32_to_cpu
-+							   (dirent.inode),
-+							   &fdiro->inode);
-+				if (status == 0) {
-+					free(fdiro);
-+					return 0;
-+				}
-+				fdiro->inode_read = 1;
-+
-+				if ((__le16_to_cpu(fdiro->inode.mode) &
-+				     FILETYPE_INO_MASK) ==
-+				    FILETYPE_INO_DIRECTORY) {
-+					type = FILETYPE_DIRECTORY;
-+				} else if ((__le16_to_cpu(fdiro->inode.mode)
-+					    & FILETYPE_INO_MASK) ==
-+					   FILETYPE_INO_SYMLINK) {
-+					type = FILETYPE_SYMLINK;
-+				} else if ((__le16_to_cpu(fdiro->inode.mode)
-+					    & FILETYPE_INO_MASK) ==
-+					   FILETYPE_INO_REG) {
-+					type = FILETYPE_REG;
-+				}
-+			}
-+#ifdef DEBUG
-+			printf("iterate >%s<\n", filename);
-+#endif				/* of DEBUG */
-+			if ((name != NULL) && (fnode != NULL)
-+			    && (ftype != NULL)) {
-+				if (strcmp(filename, name) == 0) {
-+					*ftype = type;
-+					*fnode = fdiro;
-+					return 1;
-+				}
-+			} else {
-+				if (fdiro->inode_read == 0) {
-+					status = ext4fs_read_inode(diro->data,
-+								 __le32_to_cpu(
-+								 dirent.inode),
-+								 &fdiro->inode);
-+					if (status == 0) {
-+						free(fdiro);
-+						return 0;
-+					}
-+					fdiro->inode_read = 1;
-+				}
-+				switch (type) {
-+				case FILETYPE_DIRECTORY:
-+					printf("<DIR> ");
-+					break;
-+				case FILETYPE_SYMLINK:
-+					printf("<SYM> ");
-+					break;
-+				case FILETYPE_REG:
-+					printf("      ");
-+					break;
-+				default:
-+					printf("< ? > ");
-+					break;
-+				}
-+				printf("%10d %s\n",
-+				       __le32_to_cpu(fdiro->inode.size),
-+				       filename);
-+			}
-+			free(fdiro);
-+		}
-+		fpos += __le16_to_cpu(dirent.direntlen);
-+	}
-+	return 0;
-+}
-+
-+static char *ext4fs_read_symlink(struct ext2fs_node *node)
-+{
-+	char *symlink;
-+	struct ext2fs_node *diro = node;
-+	int status;
-+
-+	if (!diro->inode_read) {
-+		status = ext4fs_read_inode(diro->data, diro->ino, &diro->inode);
-+		if (status == 0)
-+			return 0;
-+	}
-+	symlink = zalloc(__le32_to_cpu(diro->inode.size) + 1);
-+	if (!symlink)
-+		return 0;
-+
-+	if (__le32_to_cpu(diro->inode.size) <= 60) {
-+		strncpy(symlink, diro->inode.b.symlink,
-+			__le32_to_cpu(diro->inode.size));
-+	} else {
-+		status = ext4fs_read_file(diro, 0,
-+					  __le32_to_cpu(diro->inode.size),
-+					  symlink);
-+		if (status == 0) {
-+			free(symlink);
-+			return 0;
-+		}
-+	}
-+	symlink[__le32_to_cpu(diro->inode.size)] = '\0';
-+	return symlink;
-+}
-+
-+static int ext4fs_find_file1(const char *currpath,
-+			     struct ext2fs_node *currroot,
-+			     struct ext2fs_node **currfound, int *foundtype)
-+{
-+	char fpath[strlen(currpath) + 1];
-+	char *name = fpath;
-+	char *next;
-+	int status;
-+	int type = FILETYPE_DIRECTORY;
-+	struct ext2fs_node *currnode = currroot;
-+	struct ext2fs_node *oldnode = currroot;
-+
-+	strncpy(fpath, currpath, strlen(currpath) + 1);
-+
-+	/* Remove all leading slashes. */
-+	while (*name == '/')
-+		name++;
-+
-+	if (!*name) {
-+		*currfound = currnode;
-+		return 1;
-+	}
-+
-+	for (;;) {
-+		int found;
-+
-+		/* Extract the actual part from the pathname. */
-+		next = strchr(name, '/');
-+		if (next) {
-+			/* Remove all leading slashes. */
-+			while (*next == '/')
-+				*(next++) = '\0';
-+		}
-+
-+		if (type != FILETYPE_DIRECTORY) {
-+			ext4fs_free_node(currnode, currroot);
-+			return 0;
-+		}
-+
-+		oldnode = currnode;
-+
-+		/* Iterate over the directory. */
-+		found = ext4fs_iterate_dir(currnode, name, &currnode, &type);
-+		if (found == 0)
-+			return 0;
-+
-+		if (found == -1)
-+			break;
-+
-+		/* Read in the symlink and follow it. */
-+		if (type == FILETYPE_SYMLINK) {
-+			char *symlink;
-+
-+			/* Test if the symlink does not loop. */
-+			if (++symlinknest == 8) {
-+				ext4fs_free_node(currnode, currroot);
-+				ext4fs_free_node(oldnode, currroot);
-+				return 0;
-+			}
-+
-+			symlink = ext4fs_read_symlink(currnode);
-+			ext4fs_free_node(currnode, currroot);
-+
-+			if (!symlink) {
-+				ext4fs_free_node(oldnode, currroot);
-+				return 0;
-+			}
-+
-+			debug("Got symlink >%s<\n", symlink);
-+
-+			if (symlink[0] == '/') {
-+				ext4fs_free_node(oldnode, currroot);
-+				oldnode = &ext4fs_root->diropen;
-+			}
-+
-+			/* Lookup the node the symlink points to. */
-+			status = ext4fs_find_file1(symlink, oldnode,
-+						   &currnode, &type);
-+
-+			free(symlink);
-+
-+			if (status == 0) {
-+				ext4fs_free_node(oldnode, currroot);
-+				return 0;
-+			}
-+		}
-+
-+		ext4fs_free_node(oldnode, currroot);
-+
-+		/* Found the node! */
-+		if (!next || *next == '\0') {
-+			*currfound = currnode;
-+			*foundtype = type;
-+			return 1;
-+		}
-+		name = next;
-+	}
-+	return -1;
-+}
-+
-+int ext4fs_find_file(const char *path, struct ext2fs_node *rootnode,
-+	struct ext2fs_node **foundnode, int expecttype)
-+{
-+	int status;
-+	int foundtype = FILETYPE_DIRECTORY;
-+
-+	symlinknest = 0;
-+	if (!path)
-+		return 0;
-+
-+	status = ext4fs_find_file1(path, rootnode, foundnode, &foundtype);
-+	if (status == 0)
-+		return 0;
-+
-+	/* Check if the node that was found was of the expected type. */
-+	if ((expecttype == FILETYPE_REG) && (foundtype != expecttype))
-+		return 0;
-+	else if ((expecttype == FILETYPE_DIRECTORY)
-+		   && (foundtype != expecttype))
-+		return 0;
-+
-+	return 1;
-+}
-+
-+int ext4fs_open(const char *filename)
-+{
-+	struct ext2fs_node *fdiro = NULL;
-+	int status;
-+	int len;
-+
-+	if (ext4fs_root == NULL)
-+		return -1;
-+
-+	ext4fs_file = NULL;
-+	status = ext4fs_find_file(filename, &ext4fs_root->diropen, &fdiro,
-+				  FILETYPE_REG);
-+	if (status == 0)
-+		goto fail;
-+
-+	if (!fdiro->inode_read) {
-+		status = ext4fs_read_inode(fdiro->data, fdiro->ino,
-+					   &fdiro->inode);
-+		if (status == 0)
-+			goto fail;
-+	}
-+	len = __le32_to_cpu(fdiro->inode.size);
-+	ext4fs_file = fdiro;
-+
-+	return len;
-+ fail:
-+	ext4fs_free_node(fdiro, &ext4fs_root->diropen);
-+
-+	return -1;
-+}
-+
-+int ext4fs_mount(unsigned part_length)
-+{
-+	struct ext2_data *data;
-+	int status;
-+	struct ext_filesystem *fs = get_fs();
-+	data = zalloc(sizeof(struct ext2_data));
-+	if (!data)
-+		return 0;
-+
-+	/* Read the superblock. */
-+	status = ext4fs_devread(1 * 2, 0, sizeof(struct ext2_sblock),
-+				(char *)&data->sblock);
-+
-+	if (status == 0)
-+		goto fail;
-+
-+	/* Make sure this is an ext2 filesystem. */
-+	if (__le16_to_cpu(data->sblock.magic) != EXT2_MAGIC)
-+		goto fail;
-+
-+	if (__le32_to_cpu(data->sblock.revision_level == 0))
-+		fs->inodesz = 128;
-+	else
-+		fs->inodesz = __le16_to_cpu(data->sblock.inode_size);
-+
-+	debug("EXT2 rev %d, inode_size %d\n",
-+	      __le32_to_cpu(data->sblock.revision_level), fs->inodesz);
-+
-+	data->diropen.data = data;
-+	data->diropen.ino = 2;
-+	data->diropen.inode_read = 1;
-+	data->inode = &data->diropen.inode;
-+
-+	status = ext4fs_read_inode(data, 2, data->inode);
-+	if (status == 0)
-+		goto fail;
-+
-+	ext4fs_root = data;
-+
-+	return 1;
-+ fail:
-+	printf("Failed to mount ext2 filesystem...\n");
-+	free(data);
-+	ext4fs_root = NULL;
-+
-+	return 0;
-+}
-diff --git a/fs/ext4/ext4_common.h b/fs/ext4/ext4_common.h
-new file mode 100644
-index 0000000..18e6ad1
---- /dev/null
-+++ b/fs/ext4/ext4_common.h
-@@ -0,0 +1,63 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * ext4ls and ext4load :  based on ext2 ls load support in Uboot.
-+ *
-+ * (C) Copyright 2004
-+ * esd gmbh <www.esd-electronics.com>
-+ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
-+ *
-+ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
-+ * GRUB  --  GRand Unified Bootloader
-+ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+ */
-+
-+#ifndef __EXT4_COMMON__
-+#define __EXT4_COMMON__
-+#include <ext_common.h>
-+#include <ext4fs.h>
-+#include <malloc.h>
-+#include <asm/errno.h>
-+
-+#define YES		1
-+#define NO		0
-+#define TRUE		1
-+#define FALSE		0
-+#define RECOVER	1
-+#define SCAN		0
-+
-+#define S_IFLNK	0120000		/* symbolic link */
-+#define BLOCK_NO_ONE		1
-+#define SUPERBLOCK_SECTOR	2
-+#define SUPERBLOCK_SIZE	1024
-+#define F_FILE			1
-+
-+#define zalloc(size) calloc(1, size)
-+
-+extern unsigned long part_offset;
-+int ext4fs_read_inode(struct ext2_data *data, int ino,
-+		      struct ext2_inode *inode);
-+int ext4fs_read_file(struct ext2fs_node *node, int pos,
-+		unsigned int len, char *buf);
-+int ext4fs_find_file(const char *path, struct ext2fs_node *rootnode,
-+			struct ext2fs_node **foundnode, int expecttype);
-+int ext4fs_iterate_dir(struct ext2fs_node *dir, char *name,
-+			struct ext2fs_node **fnode, int *ftype);
-+#endif
-diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
-new file mode 100644
-index 0000000..7933769
---- /dev/null
-+++ b/fs/ext4/ext4fs.c
-@@ -0,0 +1,228 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * ext4ls and ext4load : Based on ext2 ls and load support in Uboot.
-+ *		       Ext4 read optimization taken from Open-Moko
-+ *		       Qi bootloader
-+ *
-+ * (C) Copyright 2004
-+ * esd gmbh <www.esd-electronics.com>
-+ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
-+ *
-+ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
-+ * GRUB  --  GRand Unified Bootloader
-+ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+ */
-+
-+#include <common.h>
-+#include <malloc.h>
-+#include <ext_common.h>
-+#include <ext4fs.h>
-+#include <linux/stat.h>
-+#include <linux/time.h>
-+#include <asm/byteorder.h>
-+#include "ext4_common.h"
-+
-+int ext4fs_symlinknest;
-+block_dev_desc_t *ext4_dev_desc;
-+
-+struct ext_filesystem *get_fs(void)
-+{
-+	if (ext4_dev_desc == NULL || ext4_dev_desc->priv == NULL)
-+		printf("Invalid Input Arguments %s\n", __func__);
-+
-+	return ext4_dev_desc->priv;
-+}
-+
-+int init_fs(block_dev_desc_t *dev_desc)
-+{
-+	struct ext_filesystem *fs;
-+	if (dev_desc == NULL) {
-+		printf("Invalid Input Arguments %s\n", __func__);
-+		return -EINVAL;
-+	}
-+
-+	fs = zalloc(sizeof(struct ext_filesystem));
-+	if (fs == NULL) {
-+		printf("malloc failed: %s\n", __func__);
-+		return -ENOMEM;
-+	}
-+
-+	fs->dev_desc = dev_desc;
-+	dev_desc->priv = fs;
-+
-+	return 0;
-+}
-+
-+void deinit_fs(block_dev_desc_t *dev_desc)
-+{
-+	if (dev_desc == NULL) {
-+		printf("Invalid Input Arguments %s\n", __func__);
-+		return;
-+	}
-+	free(dev_desc->priv);
-+	dev_desc->priv = NULL;
-+}
-+
-+void ext4fs_free_node(struct ext2fs_node *node, struct ext2fs_node *currroot)
-+{
-+	if ((node != &ext4fs_root->diropen) && (node != currroot))
-+		free(node);
-+}
-+
-+/*
-+ * Taken from openmoko-kernel mailing list: By Andy green
-+ * Optimized read file API : collects and defers contiguous sector
-+ * reads into one potentially more efficient larger sequential read action
-+ */
-+int ext4fs_read_file(struct ext2fs_node *node, int pos,
-+		     unsigned int len, char *buf)
-+{
-+	int i;
-+	int blockcnt;
-+	int log2blocksize = LOG2_EXT2_BLOCK_SIZE(node->data);
-+	int blocksize = 1 << (log2blocksize + DISK_SECTOR_BITS);
-+	unsigned int filesize = __le32_to_cpu(node->inode.size);
-+	int previous_block_number = -1;
-+	int delayed_start = 0;
-+	int delayed_extent = 0;
-+	int delayed_skipfirst = 0;
-+	int delayed_next = 0;
-+	char *delayed_buf = NULL;
-+	short status;
-+
-+	/* Adjust len so it we can't read past the end of the file. */
-+	if (len > filesize)
-+		len = filesize;
-+
-+	blockcnt = ((len + pos) + blocksize - 1) / blocksize;
-+
-+	for (i = pos / blocksize; i < blockcnt; i++) {
-+		int blknr;
-+		int blockoff = pos % blocksize;
-+		int blockend = blocksize;
-+		int skipfirst = 0;
-+		blknr = read_allocated_block(&(node->inode), i);
-+		if (blknr < 0)
-+			return -1;
-+
-+		blknr = blknr << log2blocksize;
-+
-+		/* Last block.  */
-+		if (i == blockcnt - 1) {
-+			blockend = (len + pos) % blocksize;
-+
-+			/* The last portion is exactly blocksize. */
-+			if (!blockend)
-+				blockend = blocksize;
-+		}
-+
-+		/* First block. */
-+		if (i == pos / blocksize) {
-+			skipfirst = blockoff;
-+			blockend -= skipfirst;
-+		}
-+		if (blknr) {
-+			int status;
-+
-+			if (previous_block_number != -1) {
-+				if (delayed_next == blknr) {
-+					delayed_extent += blockend;
-+					delayed_next += blockend >> SECTOR_BITS;
-+				} else {	/* spill */
-+					status = ext4fs_devread(delayed_start,
-+							delayed_skipfirst,
-+							delayed_extent,
-+							delayed_buf);
-+					if (status == 0)
-+						return -1;
-+					previous_block_number = blknr;
-+					delayed_start = blknr;
-+					delayed_extent = blockend;
-+					delayed_skipfirst = skipfirst;
-+					delayed_buf = buf;
-+					delayed_next = blknr +
-+					    (blockend >> SECTOR_BITS);
-+				}
-+			} else {
-+				previous_block_number = blknr;
-+				delayed_start = blknr;
-+				delayed_extent = blockend;
-+				delayed_skipfirst = skipfirst;
-+				delayed_buf = buf;
-+				delayed_next = blknr +
-+				    (blockend >> SECTOR_BITS);
-+			}
-+		} else {
-+			if (previous_block_number != -1) {
-+				/* spill */
-+				status = ext4fs_devread(delayed_start,
-+							delayed_skipfirst,
-+							delayed_extent,
-+							delayed_buf);
-+				if (status == 0)
-+					return -1;
-+				previous_block_number = -1;
-+			}
-+			memset(buf, 0, blocksize - skipfirst);
-+		}
-+		buf += blocksize - skipfirst;
-+	}
-+	if (previous_block_number != -1) {
-+		/* spill */
-+		status = ext4fs_devread(delayed_start,
-+					delayed_skipfirst, delayed_extent,
-+					delayed_buf);
-+		if (status == 0)
-+			return -1;
-+		previous_block_number = -1;
-+	}
-+
-+	return len;
-+}
-+
-+int ext4fs_ls(const char *dirname)
-+{
-+	struct ext2fs_node *dirnode;
-+	int status;
-+
-+	if (dirname == NULL)
-+		return 0;
-+
-+	status = ext4fs_find_file(dirname, &ext4fs_root->diropen, &dirnode,
-+				  FILETYPE_DIRECTORY);
-+	if (status != 1) {
-+		printf("** Can not find directory. **\n");
-+		return 1;
-+	}
-+
-+	ext4fs_iterate_dir(dirnode, NULL, NULL, NULL);
-+	ext4fs_free_node(dirnode, &ext4fs_root->diropen);
-+
-+	return 0;
-+}
-+
-+int ext4fs_read(char *buf, unsigned len)
-+{
-+	if (ext4fs_root == NULL || ext4fs_file == NULL)
-+		return 0;
-+
-+	return ext4fs_read_file(ext4fs_file, 0, len, buf);
-+}
-diff --git a/include/ext4fs.h b/include/ext4fs.h
-new file mode 100644
-index 0000000..58a6a1d
---- /dev/null
-+++ b/include/ext4fs.h
-@@ -0,0 +1,132 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * Ext4 Extent data structures are taken from  original ext4 fs code
-+ * as found in the linux kernel.
-+ *
-+ * Copyright (c) 2003-2006, Cluster File Systems, Inc, info@clusterfs.com
-+ * Written by Alex Tomas <alex@clusterfs.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+ */
-+
-+#ifndef __EXT4__
-+#define __EXT4__
-+#include <ext_common.h>
-+
-+#define EXT4_EXTENTS_FL		0x00080000 /* Inode uses extents */
-+#define EXT4_EXT_MAGIC			0xf30a
-+#define EXT4_FEATURE_RO_COMPAT_GDT_CSUM	0x0010
-+#define EXT4_FEATURE_INCOMPAT_EXTENTS	0x0040
-+#define EXT4_INDIRECT_BLOCKS		12
-+
-+#define EXT4_BG_INODE_UNINIT		0x0001
-+#define EXT4_BG_BLOCK_UNINIT		0x0002
-+#define EXT4_BG_INODE_ZEROED		0x0004
-+
-+/*
-+ * ext4_inode has i_block array (60 bytes total).
-+ * The first 12 bytes store ext4_extent_header;
-+ * the remainder stores an array of ext4_extent.
-+ */
-+
-+/*
-+ * This is the extent on-disk structure.
-+ * It's used at the bottom of the tree.
-+ */
-+struct ext4_extent {
-+	__le32	ee_block;	/* first logical block extent covers */
-+	__le16	ee_len;		/* number of blocks covered by extent */
-+	__le16	ee_start_hi;	/* high 16 bits of physical block */
-+	__le32	ee_start_lo;	/* low 32 bits of physical block */
-+};
-+
-+/*
-+ * This is index on-disk structure.
-+ * It's used at all the levels except the bottom.
-+ */
-+struct ext4_extent_idx {
-+	__le32	ei_block;	/* index covers logical blocks from 'block' */
-+	__le32	ei_leaf_lo;	/* pointer to the physical block of the next *
-+				 * level. leaf or next index could be there */
-+	__le16	ei_leaf_hi;	/* high 16 bits of physical block */
-+	__u16	ei_unused;
-+};
-+
-+/* Each block (leaves and indexes), even inode-stored has header. */
-+struct ext4_extent_header {
-+	__le16	eh_magic;	/* probably will support different formats */
-+	__le16	eh_entries;	/* number of valid entries */
-+	__le16	eh_max;		/* capacity of store in entries */
-+	__le16	eh_depth;	/* has tree real underlying blocks? */
-+	__le32	eh_generation;	/* generation of the tree */
-+};
-+
-+struct ext_filesystem {
-+	/* Total Sector of partition */
-+	uint64_t total_sect;
-+	/* Block size  of partition */
-+	uint32_t blksz;
-+	/* Inode size of partition */
-+	uint32_t inodesz;
-+	/* Sectors per Block */
-+	uint32_t sect_perblk;
-+	/* Group Descriptor Block Number */
-+	uint32_t gdtable_blkno;
-+	/* Total block groups of partition */
-+	uint32_t no_blkgrp;
-+	/* No of blocks required for bgdtable */
-+	uint32_t no_blk_pergdt;
-+	/* Superblock */
-+	struct ext2_sblock *sb;
-+	/* Block group descritpor table */
-+	struct ext2_block_group *gd;
-+	char *gdtable;
-+
-+	/* Block Bitmap Related */
-+	unsigned char **blk_bmaps;
-+	long int curr_blkno;
-+	uint16_t first_pass_bbmap;
-+
-+	/* Inode Bitmap Related */
-+	unsigned char **inode_bmaps;
-+	int curr_inode_no;
-+	uint16_t first_pass_ibmap;
-+
-+	/* Journal Related */
-+
-+	/* Block Device Descriptor */
-+	block_dev_desc_t *dev_desc;
-+};
-+
-+extern block_dev_desc_t *ext4_dev_desc;
-+extern struct ext2_data *ext4fs_root;
-+extern struct ext2fs_node *ext4fs_file;
-+
-+struct ext_filesystem *get_fs(void);
-+int init_fs(block_dev_desc_t *dev_desc);
-+void deinit_fs(block_dev_desc_t *dev_desc);
-+int ext4fs_open(const char *filename);
-+int ext4fs_read(char *buf, unsigned len);
-+int ext4fs_mount(unsigned part_length);
-+void ext4fs_close(void);
-+int ext4fs_ls(const char *dirname);
-+void ext4fs_free_node(struct ext2fs_node *node, struct ext2fs_node *currroot);
-+int ext4fs_devread(int sector, int byte_offset, int byte_len, char *buf);
-+int ext4fs_set_blk_dev(block_dev_desc_t *rbdd, int part);
-+long int read_allocated_block(struct ext2_inode *inode, int fileblock);
-+#endif
-diff --git a/include/ext_common.h b/include/ext_common.h
-new file mode 100644
-index 0000000..5d48021
---- /dev/null
-+++ b/include/ext_common.h
-@@ -0,0 +1,188 @@
-+/*
-+ * (C) Copyright 2011 - 2012 Samsung Electronics
-+ * EXT4 filesystem implementation in Uboot by
-+ * Uma Shankar <uma.shankar@samsung.com>
-+ * Manjunatha C Achar <a.manjunatha@samsung.com>
-+ *
-+ * Data structures and headers for ext4 support have been taken from
-+ * ext2 ls load support in Uboot
-+ *
-+ * (C) Copyright 2004
-+ * esd gmbh <www.esd-electronics.com>
-+ * Reinhard Arlt <reinhard.arlt@esd-electronics.com>
-+ *
-+ * based on code from grub2 fs/ext2.c and fs/fshelp.c by
-+ * GRUB  --  GRand Unified Bootloader
-+ * Copyright (C) 2003, 2004  Free Software Foundation, Inc.
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-+ */
-+
-+#ifndef __EXT_COMMON__
-+#define __EXT_COMMON__
-+
-+#define SECTOR_SIZE		0x200
-+#define SECTOR_BITS		9
-+
-+/* Magic value used to identify an ext2 filesystem.  */
-+#define	EXT2_MAGIC		0xEF53
-+/* Amount of indirect blocks in an inode.  */
-+#define INDIRECT_BLOCKS		12
-+/* Maximum lenght of a pathname.  */
-+#define EXT2_PATH_MAX			4096
-+/* Maximum nesting of symlinks, used to prevent a loop.  */
-+#define	EXT2_MAX_SYMLINKCNT		8
-+
-+/* Filetype used in directory entry.  */
-+#define	FILETYPE_UNKNOWN		0
-+#define	FILETYPE_REG			1
-+#define	FILETYPE_DIRECTORY		2
-+#define	FILETYPE_SYMLINK		7
-+
-+/* Filetype information as used in inodes.  */
-+#define FILETYPE_INO_MASK		0170000
-+#define FILETYPE_INO_REG		0100000
-+#define FILETYPE_INO_DIRECTORY		0040000
-+#define FILETYPE_INO_SYMLINK		0120000
-+#define EXT2_ROOT_INO			2 /* Root inode */
-+
-+/* Bits used as offset in sector */
-+#define DISK_SECTOR_BITS		9
-+/* The size of an ext2 block in bytes.  */
-+#define EXT2_BLOCK_SIZE(data)	   (1 << LOG2_BLOCK_SIZE(data))
-+
-+/* Log2 size of ext2 block in 512 blocks.  */
-+#define LOG2_EXT2_BLOCK_SIZE(data) (__le32_to_cpu \
-+				(data->sblock.log2_block_size) + 1)
-+
-+/* Log2 size of ext2 block in bytes.  */
-+#define LOG2_BLOCK_SIZE(data)	   (__le32_to_cpu \
-+		(data->sblock.log2_block_size) + 10)
-+#define INODE_SIZE_FILESYSTEM(data)	(__le32_to_cpu \
-+			(data->sblock.inode_size))
-+
-+#define EXT2_FT_DIR	2
-+#define SUCCESS	1
-+
-+/* Macro-instructions used to manage several block sizes  */
-+#define EXT2_MIN_BLOCK_LOG_SIZE	10 /* 1024 */
-+#define EXT2_MAX_BLOCK_LOG_SIZE	16 /* 65536 */
-+#define EXT2_MIN_BLOCK_SIZE		(1 << EXT2_MIN_BLOCK_LOG_SIZE)
-+#define EXT2_MAX_BLOCK_SIZE		(1 << EXT2_MAX_BLOCK_LOG_SIZE)
-+
-+/* The ext2 superblock.  */
-+struct ext2_sblock {
-+	uint32_t total_inodes;
-+	uint32_t total_blocks;
-+	uint32_t reserved_blocks;
-+	uint32_t free_blocks;
-+	uint32_t free_inodes;
-+	uint32_t first_data_block;
-+	uint32_t log2_block_size;
-+	uint32_t log2_fragment_size;
-+	uint32_t blocks_per_group;
-+	uint32_t fragments_per_group;
-+	uint32_t inodes_per_group;
-+	uint32_t mtime;
-+	uint32_t utime;
-+	uint16_t mnt_count;
-+	uint16_t max_mnt_count;
-+	uint16_t magic;
-+	uint16_t fs_state;
-+	uint16_t error_handling;
-+	uint16_t minor_revision_level;
-+	uint32_t lastcheck;
-+	uint32_t checkinterval;
-+	uint32_t creator_os;
-+	uint32_t revision_level;
-+	uint16_t uid_reserved;
-+	uint16_t gid_reserved;
-+	uint32_t first_inode;
-+	uint16_t inode_size;
-+	uint16_t block_group_number;
-+	uint32_t feature_compatibility;
-+	uint32_t feature_incompat;
-+	uint32_t feature_ro_compat;
-+	uint32_t unique_id[4];
-+	char volume_name[16];
-+	char last_mounted_on[64];
-+	uint32_t compression_info;
-+};
-+
-+struct ext2_block_group {
-+	__u32 block_id;	/* Blocks bitmap block */
-+	__u32 inode_id;	/* Inodes bitmap block */
-+	__u32 inode_table_id;	/* Inodes table block */
-+	__u16 free_blocks;	/* Free blocks count */
-+	__u16 free_inodes;	/* Free inodes count */
-+	__u16 used_dir_cnt;	/* Directories count */
-+	__u16 bg_flags;
-+	__u32 bg_reserved[2];
-+	__u16 bg_itable_unused; /* Unused inodes count */
-+	__u16 bg_checksum;	/* crc16(s_uuid+grouo_num+group_desc)*/
-+};
-+
-+/* The ext2 inode. */
-+struct ext2_inode {
-+	uint16_t mode;
-+	uint16_t uid;
-+	uint32_t size;
-+	uint32_t atime;
-+	uint32_t ctime;
-+	uint32_t mtime;
-+	uint32_t dtime;
-+	uint16_t gid;
-+	uint16_t nlinks;
-+	uint32_t blockcnt;	/* Blocks of 512 bytes!! */
-+	uint32_t flags;
-+	uint32_t osd1;
-+	union {
-+		struct datablocks {
-+			uint32_t dir_blocks[INDIRECT_BLOCKS];
-+			uint32_t indir_block;
-+			uint32_t double_indir_block;
-+			uint32_t triple_indir_block;
-+		} blocks;
-+		char symlink[60];
-+	} b;
-+	uint32_t version;
-+	uint32_t acl;
-+	uint32_t dir_acl;
-+	uint32_t fragment_addr;
-+	uint32_t osd2[3];
-+};
-+
-+/* The header of an ext2 directory entry. */
-+struct ext2_dirent {
-+	uint32_t inode;
-+	uint16_t direntlen;
-+	uint8_t namelen;
-+	uint8_t filetype;
-+};
-+
-+struct ext2fs_node {
-+	struct ext2_data *data;
-+	struct ext2_inode inode;
-+	int ino;
-+	int inode_read;
-+};
-+
-+/* Information about a "mounted" ext2 filesystem. */
-+struct ext2_data {
-+	struct ext2_sblock sblock;
-+	struct ext2_inode *inode;
-+	struct ext2fs_node diropen;
-+};
-+#endif
--- 
-1.7.2.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch
deleted file mode 100644
index 3a93289..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0015-am335x-switch-to-ext4-mode.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 89f08384d5048059ac0a8ab72b6a7a194513dc64 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 4 Apr 2012 00:06:31 +0200
-Subject: [PATCH 15/15] am335x: switch to ext4 mode
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- include/configs/am335x_evm.h |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index b2628c5..18d2cac 100755
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -76,6 +76,7 @@
- 		"env import -t $loadaddr $filesize\0" \
- 	"mmc_load_uimage=fatload mmc ${mmc_dev}:1 0x80007fc0 ${bootfile}\0" \
- 	"mmc_load_uimage_ext2=ext2load mmc ${mmc_dev}:2 0x80007fc0 /boot/${bootfile}\0" \
-+	"mmc_load_uimage_ext4=ext4load mmc ${mmc_dev}:2 0x80007fc0 /boot/${bootfile}\0" \
- 	"optargs=\0" \
- 	"bootargs_defaults=setenv bootargs " \
- 		"console=${console} " \
-@@ -102,7 +103,7 @@
- 		"nfsroot=${serverip}:${rootpath},${nfsopts} rw " \
- 		"ip=dhcp\0" \
- 	"mmc_boot=run mmc_args; " \
--		"run mmc_load_uimage_ext2; " \
-+		"run mmc_load_uimage_ext4; " \
- 		"bootm 0x80007fc0\0" \
- 	"nand_boot=echo Booting from nand ...; " \
- 		"run nand_args; " \
-@@ -136,7 +137,7 @@
- 			"echo Running uenvcmd ...;" \
- 			"run uenvcmd;" \
- 		"fi;" \
--		"if run mmc_load_uimage_ext2; then " \
-+		"if run mmc_load_uimage_ext4; then " \
- 			"run mmc_args;" \
- 			"bootm 0x80007fc0;" \
- 		"fi;" \
-@@ -404,6 +405,7 @@
- #define CONFIG_DOS_PARTITION
- #define CONFIG_CMD_FAT
- #define CONFIG_CMD_EXT2
-+#define CONFIG_CMD_EXT4
- #endif
- 
- /* Unsupported features */
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


