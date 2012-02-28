Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68561E00596
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 15:28:23 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SNSKZn021684
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 17:28:21 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SNSJCT008328
	for <meta-ti@yoctoproject.org>; Wed, 29 Feb 2012 04:58:20 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Feb 2012 04:58:19 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SNSGMK021522;
	Wed, 29 Feb 2012 04:58:18 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 28 Feb 2012 17:28:14 -0600
Message-ID: <1330471694-9335-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Tue, 28 Feb 2012 23:28:23 -0000
Content-Type: text/plain

* Added a defconfig file for the am335x-evm and moved the common
  configs directory from the beaglebone directory to the top
  of the kernel files tree.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../am335x-evm/defconfig                           |  630 +++++++++++++++-----
 .../{beaglebone => }/configs/empty                 |    0
 2 files changed, 485 insertions(+), 145 deletions(-)
 copy recipes-kernel/linux/{linux-ti33x-psp-3.1/tipspkernel => linux-ti33x-psp-3.2}/am335x-evm/defconfig (82%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{beaglebone => }/configs/empty (100%)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/tipspkernel/am335x-evm/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/defconfig
similarity index 82%
copy from recipes-kernel/linux/linux-ti33x-psp-3.1/tipspkernel/am335x-evm/defconfig
copy to recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/defconfig
index 02ee0c3..39db9ab 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/tipspkernel/am335x-evm/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-evm/defconfig
@@ -1,8 +1,9 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.1.0-rc8 Kernel Configuration
+# Linux/arm 3.2.6 Kernel Configuration
 #
 CONFIG_ARM=y
+CONFIG_HAVE_PWM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
 CONFIG_HAVE_SCHED_CLOCK=y
 CONFIG_GENERIC_GPIO=y
@@ -23,7 +24,8 @@ CONFIG_GENERIC_HWEIGHT=y
 CONFIG_GENERIC_CALIBRATE_DELAY=y
 CONFIG_NEED_DMA_MAP_STATE=y
 CONFIG_VECTORS_BASE=0xffff0000
-# CONFIG_ARM_PATCH_PHYS_VIRT is not set
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
 CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
 CONFIG_HAVE_IRQ_WORK=y
 
@@ -62,6 +64,7 @@ CONFIG_GENERIC_HARDIRQS=y
 CONFIG_HAVE_SPARSE_IRQ=y
 CONFIG_GENERIC_IRQ_SHOW=y
 CONFIG_GENERIC_IRQ_CHIP=y
+CONFIG_IRQ_DOMAIN=y
 # CONFIG_SPARSE_IRQ is not set
 
 #
@@ -96,7 +99,7 @@ CONFIG_SYSCTL=y
 CONFIG_ANON_INODES=y
 # CONFIG_EXPERT is not set
 CONFIG_UID16=y
-CONFIG_SYSCTL_SYSCALL=y
+# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_KALLSYMS=y
 CONFIG_HOTPLUG=y
 CONFIG_PRINTK=y
@@ -123,7 +126,8 @@ CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_COMPAT_BRK=y
 CONFIG_SLAB=y
 # CONFIG_SLUB is not set
-# CONFIG_PROFILING is not set
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
 CONFIG_HAVE_OPROFILE=y
 # CONFIG_KPROBES is not set
 CONFIG_HAVE_KPROBES=y
@@ -191,7 +195,7 @@ CONFIG_INLINE_WRITE_UNLOCK=y
 CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
 # CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
 # CONFIG_MUTEX_SPIN_ON_OWNER is not set
-CONFIG_FREEZER=y
+# CONFIG_FREEZER is not set
 
 #
 # System Type
@@ -203,6 +207,7 @@ CONFIG_MMU=y
 # CONFIG_ARCH_VEXPRESS is not set
 # CONFIG_ARCH_AT91 is not set
 # CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
 # CONFIG_ARCH_CLPS711X is not set
 # CONFIG_ARCH_CNS3XXX is not set
 # CONFIG_ARCH_GEMINI is not set
@@ -228,8 +233,8 @@ CONFIG_MMU=y
 # CONFIG_ARCH_MMP is not set
 # CONFIG_ARCH_KS8695 is not set
 # CONFIG_ARCH_W90X900 is not set
-# CONFIG_ARCH_NUC93X is not set
 # CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
 # CONFIG_ARCH_PNX4008 is not set
 # CONFIG_ARCH_PXA is not set
 # CONFIG_ARCH_MSM is not set
@@ -241,7 +246,7 @@ CONFIG_MMU=y
 # CONFIG_ARCH_S5P64X0 is not set
 # CONFIG_ARCH_S5PC100 is not set
 # CONFIG_ARCH_S5PV210 is not set
-# CONFIG_ARCH_EXYNOS4 is not set
+# CONFIG_ARCH_EXYNOS is not set
 # CONFIG_ARCH_SHARK is not set
 # CONFIG_ARCH_TCC_926 is not set
 # CONFIG_ARCH_U300 is not set
@@ -270,11 +275,13 @@ CONFIG_OMAP_MUX=y
 CONFIG_OMAP_MUX_DEBUG=y
 CONFIG_OMAP_MUX_WARNINGS=y
 # CONFIG_OMAP_MCBSP is not set
-# CONFIG_OMAP_MBOX_FWK is not set
+CONFIG_OMAP_MBOX_FWK=y
+CONFIG_OMAP_MBOX_KFIFO_SIZE=256
 # CONFIG_OMAP_32K_TIMER is not set
 # CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
 CONFIG_OMAP_DM_TIMER=y
 CONFIG_OMAP_PM_NOOP=y
+CONFIG_MACH_OMAP_GENERIC=y
 
 #
 # TI OMAP2/3/4 Specific Features
@@ -284,7 +291,7 @@ CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
 CONFIG_ARCH_OMAP3=y
 # CONFIG_ARCH_OMAP4 is not set
 # CONFIG_SOC_OMAP3430 is not set
-# CONFIG_SOC_OMAPTI816X is not set
+CONFIG_SOC_OMAPTI81XX=y
 CONFIG_SOC_OMAPAM33XX=y
 CONFIG_OMAP_PACKAGE_CBB=y
 
@@ -314,6 +321,8 @@ CONFIG_MACH_OMAP3_BEAGLE=y
 # CONFIG_MACH_IGEP0030 is not set
 # CONFIG_MACH_SBC3530 is not set
 # CONFIG_MACH_OMAP_3630SDP is not set
+CONFIG_MACH_TI8168EVM=y
+CONFIG_MACH_TI8148EVM=y
 CONFIG_MACH_AM335XEVM=y
 CONFIG_MACH_AM335XIAEVM=y
 # CONFIG_OMAP3_EMU is not set
@@ -352,10 +361,13 @@ CONFIG_ARM_THUMBEE=y
 CONFIG_ARM_L1_CACHE_SHIFT_6=y
 CONFIG_ARM_L1_CACHE_SHIFT=6
 CONFIG_ARM_DMA_MEM_BUFFERABLE=y
+CONFIG_MULTI_IRQ_HANDLER=y
 # CONFIG_ARM_ERRATA_430973 is not set
 # CONFIG_ARM_ERRATA_458693 is not set
 # CONFIG_ARM_ERRATA_460075 is not set
+# CONFIG_ARM_ERRATA_720789 is not set
 # CONFIG_ARM_ERRATA_743622 is not set
+# CONFIG_ARM_ERRATA_751472 is not set
 # CONFIG_ARM_ERRATA_754322 is not set
 
 #
@@ -414,9 +426,10 @@ CONFIG_ALIGNMENT_TRAP=y
 #
 # Boot options
 #
-# CONFIG_USE_OF is not set
+CONFIG_USE_OF=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
+# CONFIG_ARM_APPENDED_DTB is not set
 CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO0,115200"
 CONFIG_CMDLINE_FROM_BOOTLOADER=y
 # CONFIG_CMDLINE_EXTEND is not set
@@ -433,8 +446,26 @@ CONFIG_CMDLINE_FROM_BOOTLOADER=y
 #
 # CPU Frequency scaling
 #
-# CONFIG_CPU_FREQ is not set
-# CONFIG_CPU_IDLE is not set
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+CONFIG_CPU_FREQ_STAT=y
+# CONFIG_CPU_FREQ_STAT_DETAILS is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+
+#
+# ARM CPU frequency scaling drivers
+#
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_LADDER=y
+CONFIG_CPU_IDLE_GOV_MENU=y
 
 #
 # Floating point emulation
@@ -462,9 +493,7 @@ CONFIG_BINFMT_MISC=y
 #
 # Power management options
 #
-CONFIG_SUSPEND=y
-CONFIG_SUSPEND_FREEZER=y
-CONFIG_PM_SLEEP=y
+# CONFIG_SUSPEND is not set
 CONFIG_PM_RUNTIME=y
 CONFIG_PM=y
 # CONFIG_PM_DEBUG is not set
@@ -472,7 +501,9 @@ CONFIG_PM=y
 CONFIG_ARCH_HAS_OPP=y
 CONFIG_PM_OPP=y
 CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
 CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
 CONFIG_NET=y
 
 #
@@ -658,33 +689,34 @@ CONFIG_DNS_RESOLVER=y
 #
 # CONFIG_NET_PKTGEN is not set
 # CONFIG_HAMRADIO is not set
-# CONFIG_CAN is not set
+CONFIG_CAN=y
+CONFIG_CAN_RAW=y
+CONFIG_CAN_BCM=y
+# CONFIG_CAN_GW is not set
+
+#
+# CAN Device Drivers
+#
+# CONFIG_CAN_VCAN is not set
+# CONFIG_CAN_SLCAN is not set
+CONFIG_CAN_DEV=y
+CONFIG_CAN_CALC_BITTIMING=y
+# CONFIG_CAN_TI_HECC is not set
+# CONFIG_CAN_MCP251X is not set
+# CONFIG_CAN_SJA1000 is not set
+# CONFIG_CAN_C_CAN is not set
+CONFIG_CAN_D_CAN=y
+CONFIG_CAN_D_CAN_PLATFORM=y
+
+#
+# CAN USB interfaces
+#
+# CONFIG_CAN_EMS_USB is not set
+# CONFIG_CAN_ESD_USB2 is not set
+# CONFIG_CAN_SOFTING is not set
+# CONFIG_CAN_DEBUG_DEVICES is not set
 # CONFIG_IRDA is not set
-CONFIG_BT=y
-CONFIG_BT_L2CAP=y
-CONFIG_BT_SCO=y
-CONFIG_BT_RFCOMM=y
-CONFIG_BT_RFCOMM_TTY=y
-CONFIG_BT_BNEP=y
-CONFIG_BT_BNEP_MC_FILTER=y
-CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_HIDP=y
-
-#
-# Bluetooth device drivers
-#
-# CONFIG_BT_HCIBTUSB is not set
-# CONFIG_BT_HCIBTSDIO is not set
-CONFIG_BT_HCIUART=y
-CONFIG_BT_HCIUART_H4=y
-# CONFIG_BT_HCIUART_BCSP is not set
-# CONFIG_BT_HCIUART_ATH3K is not set
-CONFIG_BT_HCIUART_LL=y
-# CONFIG_BT_HCIBCM203X is not set
-# CONFIG_BT_HCIBPA10X is not set
-# CONFIG_BT_HCIBFUSB is not set
-# CONFIG_BT_HCIVHCI is not set
-# CONFIG_BT_MRVL is not set
+# CONFIG_BT is not set
 # CONFIG_AF_RXRPC is not set
 CONFIG_WIRELESS=y
 CONFIG_WIRELESS_EXT=y
@@ -722,6 +754,9 @@ CONFIG_FW_LOADER=y
 CONFIG_FIRMWARE_IN_KERNEL=y
 CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_SYS_HYPERVISOR is not set
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=y
+CONFIG_REGMAP_SPI=y
 
 #
 # CBUS support
@@ -729,11 +764,11 @@ CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_CBUS is not set
 # CONFIG_CONNECTOR is not set
 CONFIG_MTD=y
-# CONFIG_MTD_DEBUG is not set
 # CONFIG_MTD_TESTS is not set
 # CONFIG_MTD_REDBOOT_PARTS is not set
 CONFIG_MTD_CMDLINE_PARTS=y
 # CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_OF_PARTS is not set
 # CONFIG_MTD_AR7_PARTS is not set
 
 #
@@ -781,7 +816,7 @@ CONFIG_MTD_CFI_UTIL=y
 #
 # CONFIG_MTD_COMPLEX_MAPPINGS is not set
 # CONFIG_MTD_PHYSMAP is not set
-# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_PHYSMAP_OF is not set
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -802,6 +837,7 @@ CONFIG_M25PXX_USE_FAST_READ=y
 # CONFIG_MTD_DOC2000 is not set
 # CONFIG_MTD_DOC2001 is not set
 # CONFIG_MTD_DOC2001PLUS is not set
+# CONFIG_MTD_DOCG3 is not set
 CONFIG_MTD_NAND_ECC=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 CONFIG_MTD_NAND=y
@@ -833,6 +869,23 @@ CONFIG_MTD_UBI_WL_THRESHOLD=4096
 CONFIG_MTD_UBI_BEB_RESERVE=1
 # CONFIG_MTD_UBI_GLUEBI is not set
 # CONFIG_MTD_UBI_DEBUG is not set
+CONFIG_DTC=y
+CONFIG_OF=y
+
+#
+# Device Tree and Open Firmware support
+#
+CONFIG_PROC_DEVICETREE=y
+CONFIG_OF_FLATTREE=y
+CONFIG_OF_EARLY_FLATTREE=y
+CONFIG_OF_ADDRESS=y
+CONFIG_OF_IRQ=y
+CONFIG_OF_DEVICE=y
+CONFIG_OF_GPIO=y
+CONFIG_OF_I2C=y
+CONFIG_OF_NET=y
+CONFIG_OF_SPI=y
+CONFIG_OF_MDIO=y
 # CONFIG_PARPORT is not set
 CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_COW_COMMON is not set
@@ -853,15 +906,16 @@ CONFIG_BLK_DEV_RAM_SIZE=16384
 # CONFIG_ATA_OVER_ETH is not set
 # CONFIG_MG_DISK is not set
 # CONFIG_BLK_DEV_RBD is not set
-# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_SENSORS_LIS3LV02D=y
 CONFIG_MISC_DEVICES=y
 # CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
 # CONFIG_ICS932S401 is not set
 # CONFIG_ENCLOSURE_SERVICES is not set
 # CONFIG_APDS9802ALS is not set
 # CONFIG_ISL29003 is not set
 # CONFIG_ISL29020 is not set
-# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_SENSORS_TSL2550=y
 # CONFIG_SENSORS_BH1780 is not set
 # CONFIG_SENSORS_BH1770 is not set
 # CONFIG_SENSORS_APDS990X is not set
@@ -888,9 +942,12 @@ CONFIG_EEPROM_AT24=y
 #
 # CONFIG_TI_ST is not set
 # CONFIG_SENSORS_LIS3_SPI is not set
-# CONFIG_SENSORS_LIS3_I2C is not set
-CONFIG_HAVE_IDE=y
-# CONFIG_IDE is not set
+CONFIG_SENSORS_LIS3_I2C=y
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
 
 #
 # SCSI device support
@@ -939,13 +996,57 @@ CONFIG_SCSI_LOWLEVEL=y
 # CONFIG_MD is not set
 # CONFIG_TARGET_CORE is not set
 CONFIG_NETDEVICES=y
-# CONFIG_DUMMY is not set
+CONFIG_NET_CORE=y
 # CONFIG_BONDING is not set
-# CONFIG_MACVLAN is not set
+# CONFIG_DUMMY is not set
 # CONFIG_EQUALIZER is not set
+CONFIG_MII=y
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
 # CONFIG_TUN is not set
 # CONFIG_VETH is not set
-CONFIG_MII=y
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_FARADAY=y
+# CONFIG_FTMAC100 is not set
+# CONFIG_FTGMAC100 is not set
+CONFIG_NET_VENDOR_INTEL=y
+CONFIG_NET_VENDOR_I825XX=y
+CONFIG_NET_VENDOR_MARVELL=y
+CONFIG_NET_VENDOR_MICREL=y
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NET_VENDOR_MICROCHIP=y
+# CONFIG_ENC28J60 is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_AX88796 is not set
+# CONFIG_ETHOC is not set
+CONFIG_NET_VENDOR_SEEQ=y
+# CONFIG_SEEQ8005 is not set
+CONFIG_NET_VENDOR_SMSC=y
+CONFIG_SMC91X=y
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_SMSC911X_ARCH_HOOKS is not set
+CONFIG_NET_VENDOR_STMICRO=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NET_VENDOR_TI=y
+# CONFIG_TI_DAVINCI_EMAC is not set
+CONFIG_TI_DAVINCI_MDIO=y
+CONFIG_TI_DAVINCI_CPDMA=y
+CONFIG_TI_CPSW=y
+CONFIG_TLK110_WORKAROUND=y
 CONFIG_PHYLIB=y
 
 #
@@ -967,44 +1068,8 @@ CONFIG_SMSC_PHY=y
 # CONFIG_MICREL_PHY is not set
 # CONFIG_FIXED_PHY is not set
 # CONFIG_MDIO_BITBANG is not set
-CONFIG_NET_ETHERNET=y
-# CONFIG_AX88796 is not set
-CONFIG_SMC91X=y
-# CONFIG_TI_DAVINCI_EMAC is not set
-CONFIG_TI_DAVINCI_MDIO=y
-CONFIG_TI_DAVINCI_CPDMA=y
-CONFIG_TI_CPSW=y
-CONFIG_TLK110_WORKAROUND=y
-# CONFIG_DM9000 is not set
-# CONFIG_ENC28J60 is not set
-# CONFIG_ETHOC is not set
-# CONFIG_SMC911X is not set
-CONFIG_SMSC911X=y
-# CONFIG_SMSC911X_ARCH_HOOKS is not set
-# CONFIG_DNET is not set
-# CONFIG_IBM_NEW_EMAC_ZMII is not set
-# CONFIG_IBM_NEW_EMAC_RGMII is not set
-# CONFIG_IBM_NEW_EMAC_TAH is not set
-# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
-# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
-# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
-# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
-# CONFIG_B44 is not set
-# CONFIG_KS8851 is not set
-# CONFIG_KS8851_MLL is not set
-# CONFIG_FTMAC100 is not set
-CONFIG_NETDEV_1000=y
-# CONFIG_STMMAC_ETH is not set
-# CONFIG_FTGMAC100 is not set
-CONFIG_NETDEV_10000=y
-CONFIG_WLAN=y
-# CONFIG_USB_ZD1201 is not set
-# CONFIG_HOSTAP is not set
-CONFIG_WL12XX_PLATFORM_DATA=y
-
-#
-# Enable WiMAX (Networking options) to see the WiMAX drivers
-#
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
 
 #
 # USB Network Adapters
@@ -1041,16 +1106,15 @@ CONFIG_USB_NET_CDC_SUBSET=y
 # CONFIG_USB_IPHETH is not set
 # CONFIG_USB_SIERRA_NET is not set
 # CONFIG_USB_VL600 is not set
-# CONFIG_WAN is not set
+CONFIG_WLAN=y
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_HOSTAP is not set
+CONFIG_WL12XX_PLATFORM_DATA=y
 
 #
-# CAIF transport drivers
+# Enable WiMAX (Networking options) to see the WiMAX drivers
 #
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
-# CONFIG_NETCONSOLE is not set
-# CONFIG_NETPOLL is not set
-# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_WAN is not set
 # CONFIG_ISDN is not set
 # CONFIG_PHONE is not set
 
@@ -1059,7 +1123,7 @@ CONFIG_USB_NET_CDC_SUBSET=y
 #
 CONFIG_INPUT=y
 # CONFIG_INPUT_FF_MEMLESS is not set
-# CONFIG_INPUT_POLLDEV is not set
+CONFIG_INPUT_POLLDEV=y
 # CONFIG_INPUT_SPARSEKMAP is not set
 
 #
@@ -1079,13 +1143,13 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_KEYBOARD=y
 # CONFIG_KEYBOARD_ADP5588 is not set
 # CONFIG_KEYBOARD_ADP5589 is not set
-CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_KEYBOARD_QT1070 is not set
 # CONFIG_KEYBOARD_QT2160 is not set
 # CONFIG_KEYBOARD_LKKBD is not set
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_KEYBOARD_TCA6416 is not set
-# CONFIG_KEYBOARD_MATRIX is not set
+CONFIG_KEYBOARD_MATRIX=y
 # CONFIG_KEYBOARD_MAX7359 is not set
 # CONFIG_KEYBOARD_MCS is not set
 # CONFIG_KEYBOARD_MPR121 is not set
@@ -1137,6 +1201,7 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_TI_TSCADC=y
 # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
 # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
 # CONFIG_TOUCHSCREEN_TSC2005 is not set
 # CONFIG_TOUCHSCREEN_TSC2007 is not set
 # CONFIG_TOUCHSCREEN_W90X900 is not set
@@ -1144,9 +1209,9 @@ CONFIG_TOUCHSCREEN_TI_TSCADC=y
 # CONFIG_TOUCHSCREEN_TPS6507X is not set
 CONFIG_INPUT_MISC=y
 # CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_BMA150 is not set
 # CONFIG_INPUT_MMA8450 is not set
 # CONFIG_INPUT_MPU3050 is not set
-# CONFIG_INPUT_ATI_REMOTE is not set
 # CONFIG_INPUT_ATI_REMOTE2 is not set
 # CONFIG_INPUT_KEYSPAN_REMOTE is not set
 # CONFIG_INPUT_KXTJ9 is not set
@@ -1158,6 +1223,7 @@ CONFIG_INPUT_MISC=y
 # CONFIG_INPUT_TWL6040_VIBRA is not set
 # CONFIG_INPUT_UINPUT is not set
 # CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_PWM_BEEPER is not set
 # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
 # CONFIG_INPUT_ADXL34X is not set
 # CONFIG_INPUT_CMA3000 is not set
@@ -1192,15 +1258,7 @@ CONFIG_DEVKMEM=y
 #
 # Serial drivers
 #
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=32
-CONFIG_SERIAL_8250_RUNTIME_UARTS=4
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_DETECT_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
+# CONFIG_SERIAL_8250 is not set
 
 #
 # Non-8250 serial port support
@@ -1237,7 +1295,7 @@ CONFIG_I2C_HELPER_AUTO=y
 #
 # I2C system bus drivers (mostly embedded / system-on-chip)
 #
-# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
 # CONFIG_I2C_GPIO is not set
 # CONFIG_I2C_OCORES is not set
 CONFIG_I2C_OMAP=y
@@ -1337,9 +1395,109 @@ CONFIG_GPIO_SYSFS=y
 #
 # MODULbus GPIO expanders:
 #
+CONFIG_GPIO_TPS65910=y
+CONFIG_GENERIC_PWM=y
+CONFIG_DAVINCI_EHRPWM=y
+CONFIG_ECAP_PWM=y
 # CONFIG_W1 is not set
 # CONFIG_POWER_SUPPLY is not set
-# CONFIG_HWMON is not set
+CONFIG_HWMON=y
+# CONFIG_HWMON_VID is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+
+#
+# Native drivers
+#
+# CONFIG_SENSORS_AD7314 is not set
+# CONFIG_SENSORS_AD7414 is not set
+# CONFIG_SENSORS_AD7418 is not set
+# CONFIG_SENSORS_ADCXX is not set
+# CONFIG_SENSORS_ADM1021 is not set
+# CONFIG_SENSORS_ADM1025 is not set
+# CONFIG_SENSORS_ADM1026 is not set
+# CONFIG_SENSORS_ADM1029 is not set
+# CONFIG_SENSORS_ADM1031 is not set
+# CONFIG_SENSORS_ADM9240 is not set
+# CONFIG_SENSORS_ADT7411 is not set
+# CONFIG_SENSORS_ADT7462 is not set
+# CONFIG_SENSORS_ADT7470 is not set
+# CONFIG_SENSORS_ADT7475 is not set
+# CONFIG_SENSORS_ASC7621 is not set
+# CONFIG_SENSORS_ATXP1 is not set
+# CONFIG_SENSORS_DS620 is not set
+# CONFIG_SENSORS_DS1621 is not set
+# CONFIG_SENSORS_F71805F is not set
+# CONFIG_SENSORS_F71882FG is not set
+# CONFIG_SENSORS_F75375S is not set
+# CONFIG_SENSORS_G760A is not set
+# CONFIG_SENSORS_GL518SM is not set
+# CONFIG_SENSORS_GL520SM is not set
+# CONFIG_SENSORS_GPIO_FAN is not set
+# CONFIG_SENSORS_IT87 is not set
+# CONFIG_SENSORS_JC42 is not set
+# CONFIG_SENSORS_LINEAGE is not set
+# CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
+# CONFIG_SENSORS_LM73 is not set
+CONFIG_SENSORS_LM75=y
+# CONFIG_SENSORS_LM77 is not set
+# CONFIG_SENSORS_LM78 is not set
+# CONFIG_SENSORS_LM80 is not set
+# CONFIG_SENSORS_LM83 is not set
+# CONFIG_SENSORS_LM85 is not set
+# CONFIG_SENSORS_LM87 is not set
+# CONFIG_SENSORS_LM90 is not set
+# CONFIG_SENSORS_LM92 is not set
+# CONFIG_SENSORS_LM93 is not set
+# CONFIG_SENSORS_LTC4151 is not set
+# CONFIG_SENSORS_LTC4215 is not set
+# CONFIG_SENSORS_LTC4245 is not set
+# CONFIG_SENSORS_LTC4261 is not set
+# CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_LM95245 is not set
+# CONFIG_SENSORS_MAX1111 is not set
+# CONFIG_SENSORS_MAX16065 is not set
+# CONFIG_SENSORS_MAX1619 is not set
+# CONFIG_SENSORS_MAX1668 is not set
+# CONFIG_SENSORS_MAX6639 is not set
+# CONFIG_SENSORS_MAX6642 is not set
+# CONFIG_SENSORS_MAX6650 is not set
+# CONFIG_SENSORS_NTC_THERMISTOR is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_PMBUS is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_SHT21 is not set
+# CONFIG_SENSORS_SMM665 is not set
+# CONFIG_SENSORS_DME1737 is not set
+# CONFIG_SENSORS_EMC1403 is not set
+# CONFIG_SENSORS_EMC2103 is not set
+# CONFIG_SENSORS_EMC6W201 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47M192 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
+# CONFIG_SENSORS_SCH56XX_COMMON is not set
+# CONFIG_SENSORS_SCH5627 is not set
+# CONFIG_SENSORS_SCH5636 is not set
+# CONFIG_SENSORS_ADS1015 is not set
+# CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_AMC6821 is not set
+# CONFIG_SENSORS_THMC50 is not set
+# CONFIG_SENSORS_TMP102 is not set
+# CONFIG_SENSORS_TMP401 is not set
+# CONFIG_SENSORS_TMP421 is not set
+# CONFIG_SENSORS_VT1211 is not set
+# CONFIG_SENSORS_W83781D is not set
+# CONFIG_SENSORS_W83791D is not set
+# CONFIG_SENSORS_W83792D is not set
+# CONFIG_SENSORS_W83793 is not set
+# CONFIG_SENSORS_W83795 is not set
+# CONFIG_SENSORS_W83L785TS is not set
+# CONFIG_SENSORS_W83L786NG is not set
+# CONFIG_SENSORS_W83627HF is not set
+# CONFIG_SENSORS_W83627EHF is not set
 # CONFIG_THERMAL is not set
 CONFIG_WATCHDOG=y
 # CONFIG_WATCHDOG_CORE is not set
@@ -1370,8 +1528,11 @@ CONFIG_BCMA_POSSIBLE=y
 # Broadcom specific AMBA
 #
 # CONFIG_BCMA is not set
-CONFIG_MFD_SUPPORT=y
-# CONFIG_MFD_CORE is not set
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_CORE=y
 # CONFIG_MFD_88PM860X is not set
 # CONFIG_MFD_SM501 is not set
 # CONFIG_MFD_ASIC3 is not set
@@ -1381,8 +1542,9 @@ CONFIG_MFD_SUPPORT=y
 # CONFIG_TPS6105X is not set
 # CONFIG_TPS65010 is not set
 # CONFIG_TPS6507X is not set
+CONFIG_MFD_TPS65217=y
 # CONFIG_MFD_TPS6586X is not set
-# CONFIG_MFD_TPS65910 is not set
+CONFIG_MFD_TPS65910=y
 # CONFIG_MFD_TPS65912_I2C is not set
 # CONFIG_MFD_TPS65912_SPI is not set
 CONFIG_TWL4030_CORE=y
@@ -1419,6 +1581,7 @@ CONFIG_REGULATOR_DUMMY=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
 # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_GPIO is not set
 # CONFIG_REGULATOR_BQ24022 is not set
 # CONFIG_REGULATOR_MAX1586 is not set
 # CONFIG_REGULATOR_MAX8649 is not set
@@ -1429,10 +1592,185 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 # CONFIG_REGULATOR_LP3972 is not set
 # CONFIG_REGULATOR_TPS65023 is not set
 # CONFIG_REGULATOR_TPS6507X is not set
+CONFIG_REGULATOR_TPS65217=y
 # CONFIG_REGULATOR_ISL6271A is not set
 # CONFIG_REGULATOR_AD5398 is not set
 # CONFIG_REGULATOR_TPS6524X is not set
-# CONFIG_MEDIA_SUPPORT is not set
+CONFIG_REGULATOR_TPS65910=y
+CONFIG_MEDIA_SUPPORT=y
+
+#
+# Multimedia core support
+#
+# CONFIG_MEDIA_CONTROLLER is not set
+CONFIG_VIDEO_DEV=y
+CONFIG_VIDEO_V4L2_COMMON=y
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=y
+
+#
+# Multimedia drivers
+#
+CONFIG_RC_CORE=y
+CONFIG_LIRC=y
+CONFIG_RC_MAP=y
+CONFIG_IR_NEC_DECODER=y
+CONFIG_IR_RC5_DECODER=y
+CONFIG_IR_RC6_DECODER=y
+CONFIG_IR_JVC_DECODER=y
+CONFIG_IR_SONY_DECODER=y
+CONFIG_IR_RC5_SZ_DECODER=y
+CONFIG_IR_MCE_KBD_DECODER=y
+CONFIG_IR_LIRC_CODEC=y
+# CONFIG_RC_ATI_REMOTE is not set
+# CONFIG_IR_IMON is not set
+# CONFIG_IR_MCEUSB is not set
+# CONFIG_IR_REDRAT3 is not set
+# CONFIG_IR_STREAMZAP is not set
+# CONFIG_RC_LOOPBACK is not set
+# CONFIG_MEDIA_ATTACH is not set
+CONFIG_MEDIA_TUNER=y
+# CONFIG_MEDIA_TUNER_CUSTOMISE is not set
+CONFIG_MEDIA_TUNER_SIMPLE=y
+CONFIG_MEDIA_TUNER_TDA8290=y
+CONFIG_MEDIA_TUNER_TDA827X=y
+CONFIG_MEDIA_TUNER_TDA18271=y
+CONFIG_MEDIA_TUNER_TDA9887=y
+CONFIG_MEDIA_TUNER_TEA5761=y
+CONFIG_MEDIA_TUNER_TEA5767=y
+CONFIG_MEDIA_TUNER_MT20XX=y
+CONFIG_MEDIA_TUNER_XC2028=y
+CONFIG_MEDIA_TUNER_XC5000=y
+CONFIG_MEDIA_TUNER_XC4000=y
+CONFIG_MEDIA_TUNER_MC44S803=y
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
+CONFIG_VIDEO_IR_I2C=y
+
+#
+# Audio decoders, processors and mixers
+#
+
+#
+# RDS decoders
+#
+
+#
+# Video decoders
+#
+
+#
+# Video and audio decoders
+#
+
+#
+# MPEG video encoders
+#
+
+#
+# Video encoders
+#
+
+#
+# Camera sensor devices
+#
+
+#
+# Flash devices
+#
+
+#
+# Video improvement chips
+#
+
+#
+# Miscelaneous helper chips
+#
+# CONFIG_VIDEO_VIVI is not set
+# CONFIG_VIDEO_VPFE_CAPTURE is not set
+# CONFIG_VIDEO_OMAP2_VOUT is not set
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_SOC_CAMERA is not set
+CONFIG_V4L_USB_DRIVERS=y
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
+CONFIG_USB_GSPCA=m
+# CONFIG_USB_M5602 is not set
+# CONFIG_USB_STV06XX is not set
+# CONFIG_USB_GL860 is not set
+# CONFIG_USB_GSPCA_BENQ is not set
+# CONFIG_USB_GSPCA_CONEX is not set
+# CONFIG_USB_GSPCA_CPIA1 is not set
+# CONFIG_USB_GSPCA_ETOMS is not set
+# CONFIG_USB_GSPCA_FINEPIX is not set
+# CONFIG_USB_GSPCA_JEILINJ is not set
+# CONFIG_USB_GSPCA_KINECT is not set
+# CONFIG_USB_GSPCA_KONICA is not set
+# CONFIG_USB_GSPCA_MARS is not set
+# CONFIG_USB_GSPCA_MR97310A is not set
+# CONFIG_USB_GSPCA_NW80X is not set
+# CONFIG_USB_GSPCA_OV519 is not set
+# CONFIG_USB_GSPCA_OV534 is not set
+# CONFIG_USB_GSPCA_OV534_9 is not set
+# CONFIG_USB_GSPCA_PAC207 is not set
+# CONFIG_USB_GSPCA_PAC7302 is not set
+# CONFIG_USB_GSPCA_PAC7311 is not set
+# CONFIG_USB_GSPCA_SE401 is not set
+# CONFIG_USB_GSPCA_SN9C2028 is not set
+# CONFIG_USB_GSPCA_SN9C20X is not set
+# CONFIG_USB_GSPCA_SONIXB is not set
+# CONFIG_USB_GSPCA_SONIXJ is not set
+# CONFIG_USB_GSPCA_SPCA500 is not set
+# CONFIG_USB_GSPCA_SPCA501 is not set
+# CONFIG_USB_GSPCA_SPCA505 is not set
+# CONFIG_USB_GSPCA_SPCA506 is not set
+# CONFIG_USB_GSPCA_SPCA508 is not set
+# CONFIG_USB_GSPCA_SPCA561 is not set
+# CONFIG_USB_GSPCA_SPCA1528 is not set
+# CONFIG_USB_GSPCA_SQ905 is not set
+# CONFIG_USB_GSPCA_SQ905C is not set
+# CONFIG_USB_GSPCA_SQ930X is not set
+# CONFIG_USB_GSPCA_STK014 is not set
+# CONFIG_USB_GSPCA_STV0680 is not set
+# CONFIG_USB_GSPCA_SUNPLUS is not set
+# CONFIG_USB_GSPCA_T613 is not set
+# CONFIG_USB_GSPCA_TOPRO is not set
+# CONFIG_USB_GSPCA_TV8532 is not set
+# CONFIG_USB_GSPCA_VC032X is not set
+# CONFIG_USB_GSPCA_VICAM is not set
+# CONFIG_USB_GSPCA_XIRLINK_CIT is not set
+# CONFIG_USB_GSPCA_ZC3XX is not set
+# CONFIG_VIDEO_PVRUSB2 is not set
+# CONFIG_VIDEO_HDPVR is not set
+# CONFIG_VIDEO_EM28XX is not set
+# CONFIG_VIDEO_CX231XX is not set
+# CONFIG_VIDEO_TM6000 is not set
+# CONFIG_VIDEO_USBVISION is not set
+# CONFIG_USB_ET61X251 is not set
+# CONFIG_USB_SN9C102 is not set
+# CONFIG_USB_PWC is not set
+# CONFIG_USB_ZR364XX is not set
+# CONFIG_USB_STKWEBCAM is not set
+# CONFIG_USB_S2255 is not set
+# CONFIG_V4L_MEM2MEM_DRIVERS is not set
+CONFIG_RADIO_ADAPTERS=y
+# CONFIG_I2C_SI4713 is not set
+# CONFIG_RADIO_SI4713 is not set
+# CONFIG_USB_DSBR is not set
+# CONFIG_RADIO_SI470X is not set
+# CONFIG_USB_MR800 is not set
+# CONFIG_RADIO_TEA5764 is not set
+# CONFIG_RADIO_SAA7706H is not set
+# CONFIG_RADIO_TEF6862 is not set
+# CONFIG_RADIO_WL1273 is not set
+
+#
+# Texas Instruments WL128x FM driver (ST based)
+#
+# CONFIG_RADIO_WL128X is not set
 
 #
 # Graphics support
@@ -1464,12 +1802,15 @@ CONFIG_FB_TILEBLITTING=y
 # Frame buffer hardware drivers
 #
 # CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_TMIO is not set
+# CONFIG_FB_SMSCUFX is not set
 # CONFIG_FB_UDL is not set
 CONFIG_FB_DA8XX=y
 CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=4
 # CONFIG_FB_VIRTUAL is not set
 # CONFIG_FB_METRONOME is not set
 # CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_ST7735 is not set
 # CONFIG_FB_OMAP is not set
 # CONFIG_OMAP2_DSS is not set
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
@@ -1485,6 +1826,7 @@ CONFIG_LCD_PLATFORM=y
 # CONFIG_LCD_AMS369FG06 is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=y
 # CONFIG_BACKLIGHT_ADP8860 is not set
 # CONFIG_BACKLIGHT_ADP8870 is not set
 CONFIG_BACKLIGHT_TLC59108=y
@@ -1584,7 +1926,6 @@ CONFIG_HID_CHICONY=y
 CONFIG_HID_CYPRESS=y
 # CONFIG_HID_DRAGONRISE is not set
 # CONFIG_HID_EMS_FF is not set
-# CONFIG_HID_ELECOM is not set
 CONFIG_HID_EZKEY=y
 # CONFIG_HID_HOLTEK is not set
 # CONFIG_HID_KEYTOUCH is not set
@@ -1596,11 +1937,11 @@ CONFIG_HID_KYE=y
 CONFIG_HID_KENSINGTON=y
 # CONFIG_HID_LCPOWER is not set
 CONFIG_HID_LOGITECH=y
+CONFIG_HID_LOGITECH_DJ=m
 # CONFIG_LOGITECH_FF is not set
 # CONFIG_LOGIRUMBLEPAD2_FF is not set
 # CONFIG_LOGIG940_FF is not set
-# CONFIG_LOGIWII_FF is not set
-# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_LOGIWHEELS_FF is not set
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 # CONFIG_HID_MULTITOUCH is not set
@@ -1609,6 +1950,7 @@ CONFIG_HID_MONTEREY=y
 # CONFIG_HID_PANTHERLORD is not set
 # CONFIG_HID_PETALYNX is not set
 # CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_PRIMAX is not set
 # CONFIG_HID_QUANTA is not set
 # CONFIG_HID_ROCCAT is not set
 # CONFIG_HID_SAMSUNG is not set
@@ -1619,13 +1961,14 @@ CONFIG_HID_MONTEREY=y
 # CONFIG_HID_SMARTJOYPLUS is not set
 # CONFIG_HID_TOPSEED is not set
 # CONFIG_HID_THRUSTMASTER is not set
-# CONFIG_HID_WACOM is not set
 # CONFIG_HID_ZEROPLUS is not set
 # CONFIG_HID_ZYDACRON is not set
 CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=y
 CONFIG_USB_ARCH_HAS_HCD=y
 CONFIG_USB_ARCH_HAS_OHCI=y
 CONFIG_USB_ARCH_HAS_EHCI=y
+# CONFIG_USB_ARCH_HAS_XHCI is not set
 CONFIG_USB=y
 # CONFIG_USB_DEBUG is not set
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
@@ -1636,7 +1979,11 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_DEVICEFS=y
 CONFIG_USB_DEVICE_CLASS=y
 # CONFIG_USB_DYNAMIC_MINORS is not set
-# CONFIG_USB_SUSPEND is not set
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_OTG=y
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
 # CONFIG_USB_MON is not set
 # CONFIG_USB_WUSB is not set
 # CONFIG_USB_WUSB_CBAF is not set
@@ -1671,15 +2018,14 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
 CONFIG_USB_MUSB_TI81XX=y
 # CONFIG_USB_MUSB_BLACKFIN is not set
 # CONFIG_USB_MUSB_UX500 is not set
-# CONFIG_MUSB_PIO_ONLY is not set
-# CONFIG_USB_INVENTRA_DMA_HW is not set
-# CONFIG_USB_TI_CPPI_DMA_HW is not set
 # CONFIG_USB_TI_CPPI41_DMA_HW is not set
+CONFIG_MUSB_PIO_ONLY=y
 # CONFIG_USB_INVENTRA_DMA is not set
 # CONFIG_USB_TI_CPPI_DMA is not set
 # CONFIG_USB_TI_CPPI41_DMA is not set
 # CONFIG_USB_TUSB_OMAP_DMA is not set
 # CONFIG_USB_UX500_DMA is not set
+# CONFIG_USB_RENESAS_USBHS is not set
 
 #
 # USB Device Class drivers
@@ -1761,10 +2107,6 @@ CONFIG_USB_GADGET_MUSB_HDRC=y
 # CONFIG_USB_NET2272 is not set
 # CONFIG_USB_DUMMY_HCD is not set
 CONFIG_USB_GADGET_DUALSPEED=y
-CONFIG_USB_G_DBGP=y
-CONFIG_USB_G_DBGP_PRINTK=y
-CONFIG_USB_GADGET_PORT_USB1=y
-# CONFIG_USB_GADGET_PORT_USB0 is not set
 # CONFIG_USB_ZERO is not set
 # CONFIG_USB_AUDIO is not set
 CONFIG_USB_ETH=m
@@ -1778,9 +2120,13 @@ CONFIG_USB_FILE_STORAGE=m
 CONFIG_USB_MASS_STORAGE=m
 # CONFIG_USB_G_SERIAL is not set
 # CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
 # CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_ACM_MS is not set
 # CONFIG_USB_G_MULTI is not set
 # CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+# CONFIG_USB_G_WEBCAM is not set
 
 #
 # OTG and related infrastructure
@@ -1900,11 +2246,17 @@ CONFIG_RTC_DRV_OMAP=y
 # Virtio drivers
 #
 # CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
 # CONFIG_STAGING is not set
 CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
 CONFIG_CLKSRC_MMIO=y
 # CONFIG_IOMMU_SUPPORT is not set
 # CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
 
 #
 # File systems
@@ -1983,23 +2335,7 @@ CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_DEBUG=0
-CONFIG_JFFS2_FS_WRITEBUFFER=y
-# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
-CONFIG_JFFS2_SUMMARY=y
-CONFIG_JFFS2_FS_XATTR=y
-CONFIG_JFFS2_FS_POSIX_ACL=y
-CONFIG_JFFS2_FS_SECURITY=y
-CONFIG_JFFS2_COMPRESSION_OPTIONS=y
-CONFIG_JFFS2_ZLIB=y
-CONFIG_JFFS2_LZO=y
-CONFIG_JFFS2_RTIME=y
-CONFIG_JFFS2_RUBIN=y
-# CONFIG_JFFS2_CMODE_NONE is not set
-CONFIG_JFFS2_CMODE_PRIORITY=y
-# CONFIG_JFFS2_CMODE_SIZE is not set
-# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+# CONFIG_JFFS2_FS is not set
 CONFIG_UBIFS_FS=y
 # CONFIG_UBIFS_FS_XATTR is not set
 # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
@@ -2130,6 +2466,8 @@ CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
 CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
 CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
 CONFIG_TRACING_SUPPORT=y
 # CONFIG_FTRACE is not set
 # CONFIG_DYNAMIC_DEBUG is not set
@@ -2141,13 +2479,13 @@ CONFIG_HAVE_ARCH_KGDB=y
 # CONFIG_STRICT_DEVMEM is not set
 # CONFIG_ARM_UNWIND is not set
 # CONFIG_DEBUG_USER is not set
-# CONFIG_OC_ETM is not set
 CONFIG_DEBUG_JTAG_ENABLE=y
 
 #
 # Security options
 #
 CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
 # CONFIG_KEYS_DEBUG_PROC_KEYS is not set
 # CONFIG_SECURITY_DMESG_RESTRICT is not set
 CONFIG_SECURITY=y
@@ -2157,6 +2495,7 @@ CONFIG_SECURITY=y
 # CONFIG_SECURITY_TOMOYO is not set
 # CONFIG_SECURITY_APPARMOR is not set
 # CONFIG_IMA is not set
+# CONFIG_EVM is not set
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_DEFAULT_SECURITY=""
 CONFIG_CRYPTO=y
@@ -2175,6 +2514,7 @@ CONFIG_CRYPTO_RNG2=y
 CONFIG_CRYPTO_PCOMP2=y
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
 CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
 # CONFIG_CRYPTO_GF128MUL is not set
 # CONFIG_CRYPTO_NULL is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty b/recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty
similarity index 100%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/configs/empty
-- 
1.7.0.4


