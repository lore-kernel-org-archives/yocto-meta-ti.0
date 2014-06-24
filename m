Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9B36E00524; Mon, 23 Jun 2014 20:16:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2AE4E003C1
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 20:16:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N001UML3AMZB0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Jun 2014 22:16:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D1D9F200BD; Mon,
	23 Jun 2014 23:16:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Jun 2014 23:16:19 -0400
Message-id: <1403579781-6436-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/3] u-boot-am37x: remove old machine-specific version in favor of mainline
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
X-List-Received-Date: Tue, 24 Jun 2014 03:16:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch | 172 ---------------------
 .../0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch     |  31 ----
 ...e-add-usbethaddr-setting-to-enable-networ.patch |  40 -----
 ...dded-function-calls-to-set-volts-speed-on.patch | 146 -----------------
 ...17evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch |  73 ---------
 ...2-omap3evm-Make-the-board-start-at-800MHz.patch |  36 -----
 ...gleboard-Load-uImage-from-VFAT-by-default.patch |  34 ----
 ...03-beagleboard-Make-xM-rev-C-go-to-800MHz.patch |  34 ----
 ...-Load-uImage-to-the-default-kernel-linux-.patch |  57 -------
 recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb      |  41 -----
 10 files changed, 664 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb

diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch
deleted file mode 100644
index d36d809..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From e0820ccc38315d88192c19e98ea9b59d3ec7d4c8 Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Tue, 8 May 2012 07:29:31 +0000
-Subject: [PATCH] ARM: omap3: Set SPL stack size to 8KB, image to 54KB.
-
-With older toolchains it is possible to not fit entirely into the 45KB
-that we had assigned to SPL.  Adjust to allow for 8KB of stack (which
-should be more than required) and 54KB of text/data.
-
-Cc: Vaibhav Hiremath <hvaibhav@ti.com>
-Cc: Nagendra T S <nagendra@mistralsolutions.com>
-Cc: Thomas Weber <weber@corscience.de>
-Cc: Ilya Yanok <yanok@emcraft.com>
-Cc: Steve Sakoman <sakoman@gmail.com>
-Cc: Stefano Babic <sbabic@denx.de>
-Signed-off-by: Tom Rini <trini@ti.com>
-Acked-by: Stefano Babic <sbabic@denx.de>
-Acked-by: Vaibhav Hiremath <hvaibhav@ti.com>
----
- doc/SPL/README.omap3               |    4 ++--
- include/configs/am3517_crane.h     |    2 +-
- include/configs/am3517_evm.h       |    2 +-
- include/configs/devkit8000.h       |    2 +-
- include/configs/mcx.h              |    2 +-
- include/configs/omap3_beagle.h     |    2 +-
- include/configs/omap3_evm_common.h |    2 +-
- include/configs/omap3_overo.h      |    2 +-
- include/configs/tam3517-common.h   |    2 +-
- include/configs/tricorder.h        |    2 +-
- 10 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/doc/SPL/README.omap3 b/doc/SPL/README.omap3
-index cc5d5c0..a543e65 100644
---- a/doc/SPL/README.omap3
-+++ b/doc/SPL/README.omap3
-@@ -34,14 +34,14 @@ DDR1: 0x80000000 - 0xBFFFFFFF
- 
- Option 1 (SPL only):
- 0x40200800 - 0x4020BBFF: Area for SPL text, data and rodata
--0x4020BC00 - 0x4020FFFC: Area for the SPL stack.
-+0x4020E000 - 0x4020FFFC: Area for the SPL stack.
- 0x80000000 - 0x8007FFFF: Area for the SPL BSS.
- 0x80100000: CONFIG_SYS_TEXT_BASE of U-Boot
- 0x80208000 - 0x80307FFF: malloc() pool available to SPL.
- 
- Option 2 (SPL or X-Loader):
- 0x40200800 - 0x4020BBFF: Area for SPL text, data and rodata
--0x4020BC00 - 0x4020FFFC: Area for the SPL stack.
-+0x4020E000 - 0x4020FFFC: Area for the SPL stack.
- 0x80008000: CONFIG_SYS_TEXT_BASE of U-Boot
- 0x87000000 - 0x8707FFFF: Area for the SPL BSS.
- 0x87080000 - 0x870FFFFF: malloc() pool available to SPL.
-diff --git a/include/configs/am3517_crane.h b/include/configs/am3517_crane.h
-index 71321f3..1233985 100644
---- a/include/configs/am3517_crane.h
-+++ b/include/configs/am3517_crane.h
-@@ -325,7 +325,7 @@
- #define CONFIG_SPL
- #define CONFIG_SPL_NAND_SIMPLE
- #define CONFIG_SPL_TEXT_BASE		0x40200800
--#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SPL_BSS_START_ADDR	0x80000000
-diff --git a/include/configs/am3517_evm.h b/include/configs/am3517_evm.h
-index bbd19de..ff8d1b0 100644
---- a/include/configs/am3517_evm.h
-+++ b/include/configs/am3517_evm.h
-@@ -324,7 +324,7 @@
- #define CONFIG_SPL
- #define CONFIG_SPL_NAND_SIMPLE
- #define CONFIG_SPL_TEXT_BASE		0x40200800
--#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SPL_BSS_START_ADDR	0x80000000
-diff --git a/include/configs/devkit8000.h b/include/configs/devkit8000.h
-index eb7c376..248a5b2 100644
---- a/include/configs/devkit8000.h
-+++ b/include/configs/devkit8000.h
-@@ -324,7 +324,7 @@
- #define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR 0x300 /* address 0x60000 */
- 
- #define CONFIG_SPL_TEXT_BASE		0x40200000 /*CONFIG_SYS_SRAM_START*/
--#define CONFIG_SPL_MAX_SIZE		0xB400  /* 45 K */
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SPL_BSS_START_ADDR       0x80000500 /* leave space for bootargs*/
-diff --git a/include/configs/mcx.h b/include/configs/mcx.h
-index e190e3e..f6a83a8 100644
---- a/include/configs/mcx.h
-+++ b/include/configs/mcx.h
-@@ -325,7 +325,7 @@
- #define CONFIG_SPL_LDSCRIPT		"$(CPUDIR)/omap-common/u-boot-spl.lds"
- 
- #define CONFIG_SPL_TEXT_BASE		0x40200000 /*CONFIG_SYS_SRAM_START*/
--#define CONFIG_SPL_MAX_SIZE		(45 << 10)
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- /* move malloc and bss high to prevent clashing with the main image */
-diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
-index ddeb414..6bdc2c3 100644
---- a/include/configs/omap3_beagle.h
-+++ b/include/configs/omap3_beagle.h
-@@ -399,7 +399,7 @@
- #define CONFIG_SPL
- #define CONFIG_SPL_NAND_SIMPLE
- #define CONFIG_SPL_TEXT_BASE		0x40200800
--#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SPL_BSS_START_ADDR	0x80000000
-diff --git a/include/configs/omap3_evm_common.h b/include/configs/omap3_evm_common.h
-index 4910dda..47ebbef 100644
---- a/include/configs/omap3_evm_common.h
-+++ b/include/configs/omap3_evm_common.h
-@@ -282,7 +282,7 @@
- /* Defines for SPL */
- #define CONFIG_SPL
- #define CONFIG_SPL_TEXT_BASE		0x40200800
--#define CONFIG_SPL_MAX_SIZE		(45 * 1024)	/* 45 KB */
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SPL_BSS_START_ADDR	0x80000000
-diff --git a/include/configs/omap3_overo.h b/include/configs/omap3_overo.h
-index 64adc74..b0d144f 100644
---- a/include/configs/omap3_overo.h
-+++ b/include/configs/omap3_overo.h
-@@ -303,7 +303,7 @@
- #define CONFIG_SPL
- #define CONFIG_SPL_NAND_SIMPLE
- #define CONFIG_SPL_TEXT_BASE		0x40200800
--#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- /* move malloc and bss high to prevent clashing with the main image */
-diff --git a/include/configs/tam3517-common.h b/include/configs/tam3517-common.h
-index 37eb87b..3fc2c44 100644
---- a/include/configs/tam3517-common.h
-+++ b/include/configs/tam3517-common.h
-@@ -257,7 +257,7 @@
- #define CONFIG_SPL_LDSCRIPT		"$(CPUDIR)/omap-common/u-boot-spl.lds"
- 
- #define CONFIG_SPL_TEXT_BASE		0x40200000 /*CONFIG_SYS_SRAM_START*/
--#define CONFIG_SPL_MAX_SIZE		(45 << 10)	/* 45 K */
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SYS_SPL_MALLOC_START	0x8f000000
-diff --git a/include/configs/tricorder.h b/include/configs/tricorder.h
-index 801a24f..ab911aa 100644
---- a/include/configs/tricorder.h
-+++ b/include/configs/tricorder.h
-@@ -293,7 +293,7 @@
- #define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR 0x300 /* address 0x60000 */
- 
- #define CONFIG_SPL_TEXT_BASE		0x40200000 /*CONFIG_SYS_SRAM_START*/
--#define CONFIG_SPL_MAX_SIZE		0xB400  /* 45 K */
-+#define CONFIG_SPL_MAX_SIZE		(54 * 1024)	/* 8 KB for stack */
- #define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
- 
- #define CONFIG_SPL_BSS_START_ADDR	0x80000000 /*CONFIG_SYS_SDRAM_BASE*/
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch
deleted file mode 100644
index 4fb89e1..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 55161fca67023d6be30bdea495cc0fdbae316a64 Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Wed, 9 Nov 2011 11:48:21 -0700
-Subject: [PATCH 1/4] OMAP3 Beagle: Set BOOTDELAY to 3
-
-This is TI Sitara SDK specific (unified user experience, 3s delay).
-
-Upstream-Status: Pending
-    * This will be submitted upstream by Tom Rini
-
-Signed-off-by: Tom Rini <trini@ti.com>
----
- include/configs/omap3_beagle.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
-index 58a29b8..ba73aa6 100644
---- a/include/configs/omap3_beagle.h
-+++ b/include/configs/omap3_beagle.h
-@@ -213,7 +213,7 @@
- 							/* partition */
- 
- /* Environment information */
--#define CONFIG_BOOTDELAY		2
-+#define CONFIG_BOOTDELAY		3
- 
- #define CONFIG_EXTRA_ENV_SETTINGS \
- 	"loadaddr=0x80200000\0" \
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch
deleted file mode 100644
index 05df322..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c56786770eb0ccb95204cb72b961c44c65ff343b Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Thu, 17 May 2012 09:51:50 -0500
-Subject: [PATCH] omap3_beagle: add usbethaddr setting to enable networking
-
-* In order for the SMSC USB ethernet device to work the
-  usbethaddr setting must be set when the "usb start" command
-  is executed and the network device is discovered.
-* Currently set this for de:ad:be:ef until we can start
-  generating random or semi-random MAC addresses.
-* Based on work by Steve Kipisz and Joel Fernandez
-
-Upstream-Status: Not Upstreamable
-    * We cannot upstream this hard coded MAC address setting.
-    * User's should look at the following web page for information on
-      how to generate a MAC address, but this patch enables the out
-      of box experience for the SDK.
-        http://www.denx.de/wiki/view/DULG/WhereCanIGetAValidMACAddress
-
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- include/configs/omap3_beagle.h |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
-index ddeb414..58a29b8 100644
---- a/include/configs/omap3_beagle.h
-+++ b/include/configs/omap3_beagle.h
-@@ -219,6 +219,7 @@
- 	"loadaddr=0x80200000\0" \
- 	"rdaddr=0x81000000\0" \
- 	"usbtty=cdc_acm\0" \
-+	"usbethaddr=de:ad:be:ef\0" \
- 	"bootfile=uImage.beagle\0" \
- 	"console=ttyO2,115200n8\0" \
- 	"mpurate=auto\0" \
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch
deleted file mode 100644
index 4fc6e98..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From eff8924b57d21eadfe749e500617340b1a730c17 Mon Sep 17 00:00:00 2001
-From: Schuyler Patton <spatton@ti.com>
-Date: Thu, 30 Jun 2011 13:39:25 -0500
-Subject: [PATCH 1/3] omap3_evm: Added function calls to set volts, speed on OMAP36xx parts
-
-* evm.c
-
-*  Added setup calls to set voltage and speed
-
-*  Added calls in misc_init_r to twl4030_power_mpu_init and set_mpu_clock
-   functions. These set VDD1 to 1.35v and mpu clock to 1GHz respectively.
-   There is a check performed to make sure that this is only called on
-   omap36xx class parts.
-
-* twl4030.c
-
-* Added twl4030_power_mpu_init function to set VDD1 to 1.35 Volts
-
-* This is done to allow omap36xx parts to run at 1GHz.
-
-* clock.c
-
-* Added set_mpu_clk function to allow u-boot to set the clock
-  rate.
-
-* sys_proto.h
-
-* Added the function prototype set_mpu_clock
-
-* twl4030.h
-
-* Added twl4030_power_mpu_init function prototype
-
-Upstream-Status: Pending
-
-Signed-off-by: Schuyler Patton <spatton@ti.com>
----
- arch/arm/cpu/armv7/omap3/clock.c            |   15 +++++++++++++++
- arch/arm/include/asm/arch-omap3/sys_proto.h |    2 ++
- board/ti/evm/evm.c                          |    5 +++++
- drivers/power/twl4030.c                     |   12 ++++++++++++
- include/twl4030.h                           |    3 +++
- 5 files changed, 37 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/cpu/armv7/omap3/clock.c b/arch/arm/cpu/armv7/omap3/clock.c
-index 567817e..46a28a3 100644
---- a/arch/arm/cpu/armv7/omap3/clock.c
-+++ b/arch/arm/cpu/armv7/omap3/clock.c
-@@ -35,6 +35,21 @@
- #include <command.h>
- 
- /******************************************************************************
-+ * Setting the Clock speed 
-+ *
-+ *****************************************************************************/
-+void set_mpu_clk(int speed)
-+{
-+	struct prcm *prcm_base = (struct prcm *)PRCM_BASE;
-+
-+
-+	/* Set M */
-+	sr32(&prcm_base->clksel1_pll_mpu, 8, 11, speed);
-+	/* lock mode */
-+	sr32(&prcm_base->clken_pll_mpu, 0, 3, PLL_LOCK);
-+}
-+
-+/******************************************************************************
-  * get_sys_clk_speed() - determine reference oscillator speed
-  *                       based on known 32kHz clock and gptimer.
-  *****************************************************************************/
-diff --git a/arch/arm/include/asm/arch-omap3/sys_proto.h b/arch/arm/include/asm/arch-omap3/sys_proto.h
-index 2a89e56..9db13d7 100644
---- a/arch/arm/include/asm/arch-omap3/sys_proto.h
-+++ b/arch/arm/include/asm/arch-omap3/sys_proto.h
-@@ -36,6 +36,8 @@ void prcm_init(void);
- void per_clocks_enable(void);
- void ehci_clocks_enable(void);
- 
-+void set_mpu_clk(int speed);
-+
- void memif_init(void);
- void sdrc_init(void);
- void do_sdrc_init(u32, u32);
-diff --git a/board/ti/evm/evm.c b/board/ti/evm/evm.c
-index 8497aee..91eb93d 100644
---- a/board/ti/evm/evm.c
-+++ b/board/ti/evm/evm.c
-@@ -39,6 +39,7 @@
- #include <asm/mach-types.h>
- #include <linux/mtd/nand.h>
- #include "evm.h"
-+#include <twl4030.h>
- 
- #define OMAP3EVM_GPIO_ETH_RST_GEN1		64
- #define OMAP3EVM_GPIO_ETH_RST_GEN2		7
-@@ -177,6 +178,10 @@ int misc_init_r(void)
- #endif
- 	dieid_num_r();
- 
-+        if (get_cpu_family() == CPU_OMAP36XX) {
-+   		twl4030_power_mpu_init();
-+	        set_mpu_clk(500);
-+	}
- 	return 0;
- }
- 
-diff --git a/drivers/power/twl4030.c b/drivers/power/twl4030.c
-index 36b2144..670b4cb 100644
---- a/drivers/power/twl4030.c
-+++ b/drivers/power/twl4030.c
-@@ -105,6 +105,18 @@ void twl4030_power_init(void)
- 				TWL4030_PM_RECEIVER_DEV_GRP_P1);
- }
- 
-+#define VDD1_VSEL_135	0x3C
-+
-+void twl4030_power_mpu_init(void)
-+{
-+        unsigned char byte;
-+
-+        /* 1.4 Volts */
-+        byte = VDD1_VSEL_135;
-+        twl4030_i2c_write_u8(TWL4030_CHIP_PM_RECEIVER, byte,
-+                             TWL4030_PM_RECEIVER_VDD1_VSEL);
-+}
-+
- void twl4030_power_mmc_init(void)
- {
- 	/* Set VMMC1 to 3.15 Volts */
-diff --git a/include/twl4030.h b/include/twl4030.h
-index 9cd32ab..91d36b8 100644
---- a/include/twl4030.h
-+++ b/include/twl4030.h
-@@ -510,6 +510,9 @@ static inline int twl4030_i2c_read_u8(u8 chip_no, u8 *val, u8 reg)
-  * Power
-  */
- 
-+/*For setting VDD1  */
-+void twl4030_power_mpu_init(void);
-+
- /* For hardware resetting */
- void twl4030_power_reset_init(void);
- /* For setting device group and voltage */
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch
deleted file mode 100644
index 53657c0..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 883551659d9b15dfb1ed7ad8ae4b34bfd1fa0fd9 Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Wed, 16 Nov 2011 14:50:49 -0700
-Subject: [PATCH 2/4] am335x/am3517evm/beagleboard/am37x: Add CONFIG_CMD_ASKENV
-
-This is TI Sitara SDK specific (unified user experience, askenv command).
-
-Upstream-Status: Pending
-    * This will be submitted upstream by Tom Rini
-
-Signed-off-by: Tom Rini <trini@ti.com>
----
- include/configs/am335x_evm.h   |    2 ++
- include/configs/am3517_evm.h   |    2 ++
- include/configs/omap3_beagle.h |    2 ++
- include/configs/omap3_evm.h    |    2 ++
- 4 files changed, 8 insertions(+), 0 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index d0fbc88..5cd7d6d 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -26,6 +26,8 @@
- #include <asm/arch/cpu.h>
- #include <asm/arch/hardware.h>
- 
-+#define CONFIG_CMD_ASKENV
-+
- #define CONFIG_ENV_SIZE			0x400
- #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + (8 * 1024))
- #define CONFIG_SYS_PROMPT		"U-Boot# "
-diff --git a/include/configs/am3517_evm.h b/include/configs/am3517_evm.h
-index b5f75d1..2b3fce7 100644
---- a/include/configs/am3517_evm.h
-+++ b/include/configs/am3517_evm.h
-@@ -137,6 +137,8 @@
- /* commands to include */
- #include <config_cmd_default.h>
- 
-+#define CONFIG_CMD_ASKENV
-+
- #define CONFIG_CMD_EXT2		/* EXT2 Support			*/
- #define CONFIG_CMD_FAT		/* FAT support			*/
- #define CONFIG_CMD_JFFS2	/* JFFS2 Support		*/
-diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
-index ba73aa6..b270598 100644
---- a/include/configs/omap3_beagle.h
-+++ b/include/configs/omap3_beagle.h
-@@ -146,6 +146,8 @@
- /* commands to include */
- #include <config_cmd_default.h>
- 
-+#define CONFIG_CMD_ASKENV
-+
- #define CONFIG_CMD_CACHE
- #define CONFIG_CMD_EXT2		/* EXT2 Support			*/
- #define CONFIG_CMD_FAT		/* FAT support			*/
-diff --git a/include/configs/omap3_evm.h b/include/configs/omap3_evm.h
-index 1fcb7af..215d67d 100644
---- a/include/configs/omap3_evm.h
-+++ b/include/configs/omap3_evm.h
-@@ -42,6 +42,8 @@
-  */
- #include <config_cmd_default.h>
- 
-+#define CONFIG_CMD_ASKENV
-+
- #define CONFIG_CMD_EXT2
- #define CONFIG_CMD_FAT
- #define CONFIG_CMD_JFFS2
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch
deleted file mode 100644
index 6170ddf..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0002-omap3evm-Make-the-board-start-at-800MHz.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From a0f4f7b85d004db36a24cc05e9c34f137186270b Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Wed, 23 May 2012 09:25:06 -0500
-Subject: [PATCH 2/3] omap3evm: Make the board start at 800MHz
-
-* It is safe to start the the 3630 silicon at 800MHz for all
-  revisions.  Go ahead and bump the speed to 800MHz during boot
-  instead of using the default 500MHz speed.
-* This patch was based on work by Tom Rini <trini@ti.com> at
-  http://arago-project.org/git/projects/?p=u-boot-am33x.git;a=commit;h=ad130035df754931f2939902e453cc3736412f5f
-
-Upstream-Status: Pending
-    * Will be submitted upstream since it is safe for all silicon
-      revisions to boot at 800MHz according to HW team.
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- board/ti/evm/evm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/board/ti/evm/evm.c b/board/ti/evm/evm.c
-index 91eb93d..0d0b4a2 100644
---- a/board/ti/evm/evm.c
-+++ b/board/ti/evm/evm.c
-@@ -180,7 +180,7 @@ int misc_init_r(void)
- 
-         if (get_cpu_family() == CPU_OMAP36XX) {
-    		twl4030_power_mpu_init();
--	        set_mpu_clk(500);
-+	        set_mpu_clk(800);
- 	}
- 	return 0;
- }
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch
deleted file mode 100644
index c40da83..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Load-uImage-from-VFAT-by-default.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f2a15cd9e96648e05cb39159ba74cbfbfc8ff999 Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Thu, 17 Nov 2011 08:41:42 -0700
-Subject: [PATCH 3/4] beagleboard: Load uImage from VFAT by default.
-
-This is TI Sitara SDK specific (unified user experience, load uImage
-from vfat).
-
-Upstream-Status: Not Appropriate
-    * This patch is to make the u-boot for beagleboard consistent
-      with other versions used in the AMSDK and doesn't make
-      sense up stream.
-
-Signed-off-by: Tom Rini <trini@ti.com>
----
- include/configs/omap3_beagle.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
-index b270598..ea62580 100644
---- a/include/configs/omap3_beagle.h
-+++ b/include/configs/omap3_beagle.h
-@@ -305,7 +305,7 @@
- 			"echo Running uenvcmd ...;" \
- 			"run uenvcmd;" \
- 		"fi;" \
--		"if run loaduimage; then " \
-+		"if run loaduimagefat; then " \
- 			"run mmcboot;" \
- 		"fi;" \
- 	"fi;" \
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch
deleted file mode 100644
index 20b47d0..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 372d110126f37f9f8b7d4bbedd3f02cf80e587de Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Wed, 30 Nov 2011 16:16:21 -0700
-Subject: [PATCH 3/3] beagleboard: Make xM rev C go to 800MHz
-
-* This is the highest frequency supported on xM without BIAS
-  drivers.
-
-Upstream-Status: Pending
-    * Will be submitted upstream since it is safe for all silicon
-      revisions to boot at 800MHz according to HW team.
-
-Signed-off-by: Tom Rini <trini@ti.com>
----
- board/ti/beagle/beagle.c |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
-index e26b387..69a7b4e 100644
---- a/board/ti/beagle/beagle.c
-+++ b/board/ti/beagle/beagle.c
-@@ -346,6 +346,9 @@ int misc_init_r(void)
- 					TWL4030_PM_RECEIVER_VAUX2_VSEL_18,
- 					TWL4030_PM_RECEIVER_VAUX2_DEV_GRP,
- 					TWL4030_PM_RECEIVER_DEV_GRP_P1);
-+		/* 800MHz support */
-+		twl4030_power_mpu_init();
-+		set_mpu_clk(800);
- 		break;
- 	default:
- 		printf("Beagle unknown 0x%02x\n", get_board_revision());
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch b/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch
deleted file mode 100644
index 86d6622..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x-2012.04.01/0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 715afb049d2675106e26c5225e7e321374c32f85 Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@ti.com>
-Date: Thu, 17 Nov 2011 16:54:01 -0700
-Subject: [PATCH 4/4] beagleboard: Load uImage to the default kernel linux address
-
-This is TI Sitara SDK specific (unified user experience, load uImage
-to an 'XIP' location).
-
-Upstream-Status: Pending
-    * This functionality is being discussed upstream and there
-      is not a concensus yet.
-
-Signed-off-by: Tom Rini <trini@ti.com>
----
- include/configs/omap3_beagle.h |   13 +++++++------
- 1 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
-index ea62580..00b2abe 100644
---- a/include/configs/omap3_beagle.h
-+++ b/include/configs/omap3_beagle.h
-@@ -219,6 +219,7 @@
- 
- #define CONFIG_EXTRA_ENV_SETTINGS \
- 	"loadaddr=0x80200000\0" \
-+	"kloadaddr=0x80007fc0\0" \
- 	"rdaddr=0x81000000\0" \
- 	"usbtty=cdc_acm\0" \
- 	"usbethaddr=de:ad:be:ef\0" \
-@@ -272,18 +273,18 @@
- 		"root=${ramroot} " \
- 		"rootfstype=${ramrootfstype}\0" \
- 	"loadramdisk=fatload mmc ${mmcdev} ${rdaddr} ramdisk.gz\0" \
--	"loaduimagefat=fatload mmc ${mmcdev} ${loadaddr} uImage\0" \
--	"loaduimage=ext2load mmc ${mmcdev}:2 ${loadaddr} /boot/uImage\0" \
-+	"loaduimagefat=fatload mmc ${mmcdev} ${kloadaddr} uImage\0" \
-+	"loaduimage=ext2load mmc ${mmcdev}:2 ${kloadaddr} /boot/uImage\0" \
- 	"mmcboot=echo Booting from mmc ...; " \
- 		"run mmcargs; " \
--		"bootm ${loadaddr}\0" \
-+		"bootm ${kloadaddr}\0" \
- 	"nandboot=echo Booting from nand ...; " \
- 		"run nandargs; " \
--		"nand read ${loadaddr} 280000 400000; " \
--		"bootm ${loadaddr}\0" \
-+		"nand read ${kloadaddr} 280000 400000; " \
-+		"bootm ${kloadaddr}\0" \
- 	"ramboot=echo Booting from ramdisk ...; " \
- 		"run ramargs; " \
--		"bootm ${loadaddr}\0" \
-+		"bootm ${kloadaddr}\0" \
- 	"userbutton=if gpio input 173; then run userbutton_xm; " \
- 		"else run userbutton_nonxm; fi;\0" \
- 	"userbutton_xm=gpio input 4;\0" \
--- 
-1.7.0.4
-
diff --git a/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb b/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
deleted file mode 100644
index 1cd96b6..0000000
--- a/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-
-COMPATIBLE_MACHINE = "am37x-evm|beagleboard"
-
-BRANCH ?= "master"
-
-PR = "r1+gitr${SRCPV}"
-
-# v2012.04.01
-SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
-
-SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
-
-# Add patches for the AMSDK
-#  - 0001-omap3-beagle-add-usbethaddr....Not for Upstream
-#  - 0001-OMAP3-Beagle-Set-BOOTDELAY....Pending Upstream
-#  - 0002-am335x-am3517evm-beagleboard....Pending Upstream
-#  - 0003-beagleboard-Load-uImage-from....Not for Upstream
-#  - 0004-beagleboard-Load-uImage-to....Pending Upstream
-#  - 0001-omap3_evm-Added-function....Pending Upstream
-#  - 0002-omap3evm-Make-the-board....Pending Upstream
-#  - 0003-beagleboard-Make-xM-rev....Pending Upstream
-#  - 0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch....Upstreamed
-
-# Add a patch to set a default usbethaddr address to enable the out of box
-# experience.
-SRC_URI += "file://0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.patch \
-            file://0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch \
-            file://0002-am335x-am3517evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch \
-            file://0003-beagleboard-Load-uImage-from-VFAT-by-default.patch \
-            file://0004-beagleboard-Load-uImage-to-the-default-kernel-linux-.patch \
-            file://0001-omap3_evm-Added-function-calls-to-set-volts-speed-on.patch \
-            file://0002-omap3evm-Make-the-board-start-at-800MHz.patch \
-            file://0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch \
-            file://0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch \
-            file://0001-armv7-Unaligned-access-fix.patch \
-            "
-
-SPL_BINARY = "MLO"
-- 
2.0.0


