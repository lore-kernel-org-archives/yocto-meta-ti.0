Return-Path: <denys@ti.com>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DAC1E01303
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2012 19:56:15 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCU00GLNATN9DW1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 01 Nov 2012 21:56:15 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 332B820011; Thu,
	01 Nov 2012 22:56:11 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 01 Nov 2012 22:56:10 -0400
Message-id: <1351824970-11580-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH] linux-omap-psp 2.6.37: add more recent version of OMAP3 kernel
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
X-List-Received-Date: Fri, 02 Nov 2012 02:56:16 -0000

Ported from Arago the kernel that corresponds to PSP version 04.02.00.07 with
corresponding SDK patches applied on top.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...date-PIO-mode-help-information-in-Kconfig.patch |   44 +
 .../linux-omap-psp-2.6.37/am3517-evm/defconfig     | 2358 +++++++
 .../omap3/0001-Fix-matrix-suspend.patch            |  111 +
 ...upport-remove-support-for-non-TI-hardware.patch |  130 +
 ...001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch |  319 +
 ...ux-omap3-Add-OCF-support-to-2.6.37-kernel.patch | 7043 ++++++++++++++++++++
 ...nable-clock-pad-register-in-configuration.patch |   29 +
 .../0001-nlcp-sdio-fixes-for-wowlan-support.patch  |   96 +
 ...7evm-Allow-for-NAND-to-really-be-disabled.patch |   48 +
 ...vm-add-support-for-the-WL12xx-WLAN-module.patch |  147 +
 .../0001-omap3evm-add-wake-on-wlan-support.patch   |   49 +
 ...0001-omap_hsmmc-make-default-dto-value-14.patch |   34 +
 ...musb-am35x-set-default-VBUS-timeout-value.patch |   38 +
 ...ecting-WL12XX_PLATFROM_DATA-independently.patch |   37 +
 ...pport-suspend-resume-while-runtime-suspen.patch |   82 +
 ...map3-am3517evm-Update-NOR-partition-table.patch |   58 +
 ...map3_evm_defconfig-add-OCF-driver-support.patch | 2292 +++++++
 ...2-usb-musb-am35x-fix-role-switching-issue.patch |   67 +
 .../0003-AM3517-Add-am3517_evn_nor_defconfig.patch |  256 +
 ...detection-of-nonremovable-cards-on-rescan.patch |   43 +
 .../omap3/0003-mmc_card_keep_power-cleanups.patch  |   69 +
 ...ap3_evm_defconfig-add-WLAN-config-options.patch |  283 +
 ...-not-switch-to-1-bit-mode-if-not-required.patch |   43 +
 ...n-t-reinitialize-nonremovable-powered-res.patch |   77 +
 ...0005-mmc-fix-division-by-zero-in-MMC-core.patch |   41 +
 ...io-don-t-power-up-cards-on-system-suspend.patch |  112 +
 ...icate-insertion-of-mmc_card_keep_power-fu.patch |   30 +
 ...0006-wl12xx-Backport-wl12xx-platform-data.patch |   64 +
 .../omap3/0007-activate-wireless-extensions.patch  |   26 +
 .../linux/linux-omap-psp-2.6.37/omap3/defconfig    | 2505 +++++++
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb      |   89 +
 31 files changed, 16620 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/defconfig
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-Fix-matrix-suspend.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-OCF-support-remove-support-for-non-TI-hardware.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-linux-omap3-Add-OCF-support-to-2.6.37-kernel.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-mt9t111-enable-clock-pad-register-in-configuration.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-nlcp-sdio-fixes-for-wowlan-support.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3-am3517evm-Allow-for-NAND-to-really-be-disabled.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-support-for-the-WL12xx-WLAN-module.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-wake-on-wlan-support.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap_hsmmc-make-default-dto-value-14.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-usb-musb-am35x-set-default-VBUS-timeout-value.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-allow-selecting-WL12XX_PLATFROM_DATA-independently.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-mmc-sdio-support-suspend-resume-while-runtime-suspen.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3-am3517evm-Update-NOR-partition-table.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3_evm_defconfig-add-OCF-driver-support.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-usb-musb-am35x-fix-role-switching-issue.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-AM3517-Add-am3517_evn_nor_defconfig.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc-skip-detection-of-nonremovable-cards-on-rescan.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc_card_keep_power-cleanups.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-omap3_evm_defconfig-add-WLAN-config-options.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-do-not-switch-to-1-bit-mode-if-not-required.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-sdio-don-t-reinitialize-nonremovable-powered-res.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-fix-division-by-zero-in-MMC-core.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-sdio-don-t-power-up-cards-on-system-suspend.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-revert-duplicate-insertion-of-mmc_card_keep_power-fu.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-wl12xx-Backport-wl12xx-platform-data.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0007-activate-wireless-extensions.patch
 create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/defconfig
 create mode 100644 recipes-kernel/linux/linux-omap-psp_2.6.37.bb

diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
new file mode 100644
index 0000000..ff1c430
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
@@ -0,0 +1,44 @@
+From 10fbd32a96aedd644b6bf38888a2af64cc13a35f Mon Sep 17 00:00:00 2001
+From: Matt Porter <mporter@ti.com>
+Date: Mon, 5 Dec 2011 15:29:35 -0600
+Subject: [PATCH] musb: update PIO mode help information in Kconfig
+
+* Updated the Kconfig help information for the PIO mode for MUSB
+  to make it more clear to the customer when to select this option
+  and which devices currently have issues with this option.
+* This is in accordance with the findings for CPPI4.1 DMA usage
+  for MUSB
+
+Upstream-Status: Submitted
+    * Submitted to the PSP team using the lpr list
+
+Signed-off-by: Matt Porter <mporter@ti.com>
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ drivers/usb/musb/Kconfig |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
+index ee75cbc..d56f23d 100644
+--- a/drivers/usb/musb/Kconfig
++++ b/drivers/usb/musb/Kconfig
+@@ -107,10 +107,13 @@ config MUSB_PIO_ONLY
+	  All data is copied between memory and FIFO by the CPU.
+	  DMA controllers are ignored.
+
+-	  Do not select 'n' here unless DMA support for your SOC or board
+-	  is unavailable (or unstable).  When DMA is enabled at compile time,
+-	  you can still disable it at run time using the "use_dma=n" module
+-	  parameter.
++	  Select 'y' here if DMA support for your SOC or board
++	  is unavailable (or unstable). On CPPI 4.1 DMA based
++	  systems (AM335x, AM35x, and AM180x) DMA support is
++	  considered unstable and this option should be enabled
++	  in production. When DMA is enabled at compile time,
++	  you can still disable it at run time using the "use_dma=n"
++	  module parameter.
+
+ config USB_UX500_DMA_HW
+	select USB_UX500_DMA
+--
+1.7.0.4
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/defconfig b/recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/defconfig
new file mode 100644
index 0000000..83586ae
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/am3517-evm/defconfig
@@ -0,0 +1,2358 @@
+#
+# Automatically generated make config: don't edit
+# Linux/arm 2.6.37 Kernel Configuration
+# Mon Dec  5 14:46:59 2011
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_ARM_L1_CACHE_SHIFT_6=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
+CONFIG_BSD_PROCESS_ACCT=y
+# CONFIG_BSD_PROCESS_ACCT_V3 is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+# CONFIG_HAVE_GENERIC_HARDIRQS is not set
+# CONFIG_SPARSE_IRQ is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+# CONFIG_CGROUPS is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_LZO is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_KALLSYMS_EXTRA_PASS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+CONFIG_PROFILING=y
+CONFIG_TRACEPOINTS=y
+CONFIG_OPROFILE=y
+CONFIG_HAVE_OPROFILE=y
+CONFIG_KPROBES=y
+CONFIG_KRETPROBES=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_HW_BREAKPOINT=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_READ_UNLOCK is not set
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_WRITE_UNLOCK is not set
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_NUC93X is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5P6442 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_S5PV310 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+CONFIG_ARCH_OMAP=y
+# CONFIG_PLAT_SPEAR is not set
+
+#
+# TI OMAP Common Features
+#
+CONFIG_ARCH_OMAP_OTG=y
+# CONFIG_ARCH_OMAP1 is not set
+CONFIG_ARCH_OMAP2PLUS=y
+
+#
+# OMAP Feature Selections
+#
+# CONFIG_OMAP_SMARTREFLEX is not set
+CONFIG_OMAP_RESET_CLOCKS=y
+CONFIG_OMAP_MUX=y
+CONFIG_OMAP_MUX_DEBUG=y
+CONFIG_OMAP_MUX_WARNINGS=y
+CONFIG_OMAP_MCBSP=y
+# CONFIG_OMAP_MBOX_FWK is not set
+CONFIG_OMAP_IOMMU=y
+# CONFIG_OMAP_IOMMU_DEBUG is not set
+# CONFIG_OMAP_MPU_TIMER is not set
+CONFIG_OMAP_32K_TIMER=y
+# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
+CONFIG_OMAP_32K_TIMER_HZ=128
+CONFIG_OMAP_DM_TIMER=y
+# CONFIG_OMAP_PM_NONE is not set
+CONFIG_OMAP_PM_NOOP=y
+
+#
+# TI OMAP2/3/4 Specific Features
+#
+CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
+# CONFIG_ARCH_OMAP2 is not set
+CONFIG_ARCH_OMAP3=y
+# CONFIG_ARCH_OMAP4 is not set
+# CONFIG_ARCH_TI81XX is not set
+CONFIG_ARCH_OMAP3430=y
+CONFIG_OMAP_PACKAGE_CBB=y
+
+#
+# OMAP Board Type
+#
+# CONFIG_MACH_OMAP3_BEAGLE is not set
+# CONFIG_MACH_DEVKIT8000 is not set
+# CONFIG_MACH_OMAP_LDP is not set
+# CONFIG_MACH_OMAP3530_LV_SOM is not set
+# CONFIG_MACH_OMAP3_TORPEDO is not set
+# CONFIG_MACH_OVERO is not set
+# CONFIG_MACH_OMAP3EVM is not set
+CONFIG_MACH_OMAP3517EVM=y
+# CONFIG_MACH_CRANEBOARD is not set
+# CONFIG_MACH_OMAP3_PANDORA is not set
+# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
+# CONFIG_MACH_OMAP_3430SDP is not set
+# CONFIG_MACH_NOKIA_RM680 is not set
+# CONFIG_MACH_NOKIA_RX51 is not set
+# CONFIG_MACH_OMAP_ZOOM2 is not set
+# CONFIG_MACH_OMAP_ZOOM3 is not set
+# CONFIG_MACH_CM_T35 is not set
+# CONFIG_MACH_CM_T3517 is not set
+# CONFIG_MACH_IGEP0020 is not set
+# CONFIG_MACH_IGEP0030 is not set
+# CONFIG_MACH_SBC3530 is not set
+# CONFIG_MACH_OMAP_3630SDP is not set
+# CONFIG_OMAP3_EMU is not set
+CONFIG_OMAP3_PM_DISABLE_VT_SWITCH=y
+# CONFIG_OMAP3_SDRC_AC_TIMING is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32v6K=y
+CONFIG_CPU_V7=y
+CONFIG_CPU_32v7=y
+CONFIG_CPU_ABRT_EV7=y
+CONFIG_CPU_PABRT_V7=y
+CONFIG_CPU_CACHE_V7=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V7=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=6
+CONFIG_ARM_DMA_MEM_BUFFERABLE=y
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_458693=y
+CONFIG_ARM_ERRATA_460075=y
+# CONFIG_ARM_ERRATA_743622 is not set
+CONFIG_COMMON_CLKDEV=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=128
+# CONFIG_THUMB2_KERNEL is not set
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_NEED_PER_CPU_KM=y
+CONFIG_FORCE_MAX_ZONEORDER=11
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_AUTO_ZRELADDR is not set
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+CONFIG_VFP=y
+CONFIG_VFPv3=y
+CONFIG_NEON=y
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+CONFIG_BINFMT_MISC=y
+
+#
+# Power management options
+#
+CONFIG_PM=y
+CONFIG_PM_DEBUG=y
+# CONFIG_PM_ADVANCED_DEBUG is not set
+# CONFIG_PM_VERBOSE is not set
+CONFIG_CAN_PM_TRACE=y
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND_NVS=y
+CONFIG_SUSPEND=y
+# CONFIG_PM_TEST_SUSPEND is not set
+CONFIG_SUSPEND_FREEZER=y
+# CONFIG_APM_EMULATION is not set
+CONFIG_PM_RUNTIME=y
+CONFIG_PM_OPS=y
+CONFIG_ARCH_HAS_OPP=y
+CONFIG_PM_OPP=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=y
+# CONFIG_XFRM_SUB_POLICY is not set
+CONFIG_XFRM_MIGRATE=y
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETLABEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_NET_TCPPROBE is not set
+# CONFIG_NET_DROP_MONITOR is not set
+# CONFIG_HAMRADIO is not set
+CONFIG_CAN=y
+CONFIG_CAN_RAW=y
+CONFIG_CAN_BCM=y
+
+#
+# CAN Device Drivers
+#
+CONFIG_CAN_VCAN=y
+CONFIG_CAN_DEV=y
+CONFIG_CAN_CALC_BITTIMING=y
+CONFIG_CAN_TI_HECC=y
+# CONFIG_CAN_MCP251X is not set
+# CONFIG_CAN_SJA1000 is not set
+
+#
+# CAN USB interfaces
+#
+# CONFIG_CAN_EMS_USB is not set
+# CONFIG_CAN_ESD_USB2 is not set
+# CONFIG_CAN_DEBUG_DEVICES is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT_SYSFS=y
+# CONFIG_LIB80211 is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+# CONFIG_DEVTMPFS is not set
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_TESTS is not set
+CONFIG_MTD_CONCAT=y
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_SM_FTL is not set
+CONFIG_MTD_OOPS=y
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+CONFIG_MTD_PHYSMAP=y
+# CONFIG_MTD_PHYSMAP_COMPAT is not set
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SST25L is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+CONFIG_MTD_BLOCK2MTD=y
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_OMAP2=y
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=32768
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+CONFIG_MD=y
+# CONFIG_BLK_DEV_MD is not set
+# CONFIG_BLK_DEV_DM is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_MII=y
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+CONFIG_SMSC_PHY=y
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_BCM63XX_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_MICREL_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_SMSC911X_ARCH_HOOKS is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NETDEV_1000=y
+CONFIG_TI_DAVINCI_EMAC=y
+CONFIG_TI_DAVINCI_MDIO=y
+CONFIG_TI_DAVINCI_CPDMA=y
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NETDEV_10000=y
+CONFIG_WLAN=y
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_HOSTAP is not set
+CONFIG_WL12XX_PLATFORM_DATA=y
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+CONFIG_USB_USBNET=y
+# CONFIG_USB_NET_AX8817X is not set
+CONFIG_USB_NET_CDCETHER=y
+# CONFIG_USB_NET_CDC_EEM is not set
+CONFIG_USB_NET_DM9601=y
+# CONFIG_USB_NET_SMSC75XX is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+# CONFIG_USB_NET_ZAURUS is not set
+# CONFIG_USB_NET_CX82310_ETH is not set
+# CONFIG_USB_NET_INT51X1 is not set
+# CONFIG_USB_IPHETH is not set
+# CONFIG_USB_SIERRA_NET is not set
+# CONFIG_WAN is not set
+
+#
+# CAIF transport drivers
+#
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+CONFIG_KEYBOARD_TCA6416=y
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_PS2=y
+CONFIG_MOUSE_PS2_ALPS=y
+CONFIG_MOUSE_PS2_LOGIPS2PP=y
+CONFIG_MOUSE_PS2_SYNAPTICS=y
+CONFIG_MOUSE_PS2_TRACKPOINT=y
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_SENTELIC is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_QT602240 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+CONFIG_TOUCHSCREEN_TSC2004=y
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+# CONFIG_INPUT_UINPUT is not set
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
+# CONFIG_SERIO_PS2MULT is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_N_GSM is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=32
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_SERIAL_OMAP=y
+CONFIG_SERIAL_OMAP_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_TI81XX_HDMI is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+CONFIG_I2C_OMAP=y
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+CONFIG_SPI_OMAP24XX=y
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+# CONFIG_GPIO_BASIC_MMIO is not set
+# CONFIG_GPIO_IT8761E is not set
+# CONFIG_GPIO_VX855 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+CONFIG_GPIO_PCA953X=y
+# CONFIG_GPIO_PCA953X_IRQ is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+# CONFIG_GPIO_ADP5588 is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+CONFIG_HWMON=y
+# CONFIG_HWMON_VID is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+
+#
+# Native drivers
+#
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
+# CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
+# CONFIG_SENSORS_LM73 is not set
+# CONFIG_SENSORS_LM75 is not set
+# CONFIG_SENSORS_LM77 is not set
+# CONFIG_SENSORS_LM78 is not set
+# CONFIG_SENSORS_LM80 is not set
+# CONFIG_SENSORS_LM83 is not set
+# CONFIG_SENSORS_LM85 is not set
+# CONFIG_SENSORS_LM87 is not set
+# CONFIG_SENSORS_LM90 is not set
+# CONFIG_SENSORS_LM92 is not set
+# CONFIG_SENSORS_LM93 is not set
+# CONFIG_SENSORS_LTC4215 is not set
+# CONFIG_SENSORS_LTC4245 is not set
+# CONFIG_SENSORS_LTC4261 is not set
+# CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_MAX1111 is not set
+# CONFIG_SENSORS_MAX1619 is not set
+# CONFIG_SENSORS_MAX6650 is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_SMM665 is not set
+# CONFIG_SENSORS_DME1737 is not set
+# CONFIG_SENSORS_EMC1403 is not set
+# CONFIG_SENSORS_EMC2103 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47M192 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
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
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_OMAP_WATCHDOG=y
+# CONFIG_MAX63XX_WATCHDOG is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_MFD_SUPPORT=y
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC35892 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_TPS6586X is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+CONFIG_REGULATOR_DUMMY=y
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_MAX8649 is not set
+# CONFIG_REGULATOR_MAX8660 is not set
+# CONFIG_REGULATOR_MAX8952 is not set
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_REGULATOR_LP3972 is not set
+CONFIG_REGULATOR_TPS65023=y
+# CONFIG_REGULATOR_TPS6507X is not set
+# CONFIG_REGULATOR_ISL6271A is not set
+# CONFIG_REGULATOR_AD5398 is not set
+CONFIG_MEDIA_SUPPORT=y
+
+#
+# Multimedia core support
+#
+# CONFIG_MEDIA_CONTROLLER is not set
+CONFIG_VIDEO_DEV=y
+CONFIG_VIDEO_V4L2_COMMON=y
+CONFIG_VIDEO_ALLOW_V4L1=y
+CONFIG_VIDEO_V4L1_COMPAT=y
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=y
+
+#
+# Multimedia drivers
+#
+# CONFIG_IR_CORE is not set
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
+CONFIG_MEDIA_TUNER_MC44S803=y
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEO_V4L1=y
+CONFIG_VIDEOBUF_GEN=y
+CONFIG_VIDEOBUF_DMA_CONTIG=y
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
+
+#
+# Encoders/decoders and other helper chips
+#
+
+#
+# Audio decoders
+#
+# CONFIG_VIDEO_TVAUDIO is not set
+# CONFIG_VIDEO_TDA7432 is not set
+# CONFIG_VIDEO_TDA9840 is not set
+# CONFIG_VIDEO_TDA9875 is not set
+# CONFIG_VIDEO_TEA6415C is not set
+# CONFIG_VIDEO_TEA6420 is not set
+# CONFIG_VIDEO_MSP3400 is not set
+# CONFIG_VIDEO_CS5345 is not set
+# CONFIG_VIDEO_CS53L32A is not set
+# CONFIG_VIDEO_M52790 is not set
+# CONFIG_VIDEO_TLV320AIC23B is not set
+# CONFIG_VIDEO_WM8775 is not set
+# CONFIG_VIDEO_WM8739 is not set
+# CONFIG_VIDEO_VP27SMPX is not set
+
+#
+# RDS decoders
+#
+# CONFIG_VIDEO_SAA6588 is not set
+
+#
+# Video decoders
+#
+# CONFIG_VIDEO_ADV7180 is not set
+# CONFIG_VIDEO_BT819 is not set
+# CONFIG_VIDEO_BT856 is not set
+# CONFIG_VIDEO_BT866 is not set
+# CONFIG_VIDEO_KS0127 is not set
+# CONFIG_VIDEO_OV7670 is not set
+# CONFIG_VIDEO_MT9T001 is not set
+# CONFIG_VIDEO_MT9V011 is not set
+# CONFIG_VIDEO_MT9V113 is not set
+# CONFIG_VIDEO_MT9T111 is not set
+# CONFIG_VIDEO_TCM825X is not set
+# CONFIG_VIDEO_SAA7110 is not set
+# CONFIG_VIDEO_SAA711X is not set
+# CONFIG_VIDEO_SAA717X is not set
+# CONFIG_VIDEO_SAA7191 is not set
+CONFIG_VIDEO_TVP514X=y
+# CONFIG_VIDEO_TVP5150 is not set
+# CONFIG_VIDEO_TVP7002 is not set
+# CONFIG_VIDEO_VPX3220 is not set
+
+#
+# Video and audio decoders
+#
+# CONFIG_VIDEO_CX25840 is not set
+
+#
+# MPEG video encoders
+#
+# CONFIG_VIDEO_CX2341X is not set
+
+#
+# Video encoders
+#
+# CONFIG_VIDEO_SAA7127 is not set
+# CONFIG_VIDEO_SAA7185 is not set
+# CONFIG_VIDEO_ADV7170 is not set
+# CONFIG_VIDEO_ADV7175 is not set
+# CONFIG_VIDEO_THS7303 is not set
+# CONFIG_VIDEO_ADV7343 is not set
+# CONFIG_VIDEO_AK881X is not set
+
+#
+# Video improvement chips
+#
+# CONFIG_VIDEO_UPD64031A is not set
+# CONFIG_VIDEO_UPD64083 is not set
+CONFIG_VIDEO_VPSS_SYSTEM=y
+CONFIG_VIDEO_VPFE_CAPTURE=y
+CONFIG_VIDEO_DM6446_CCDC=y
+CONFIG_VIDEO_OMAP2_VOUT=y
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_VIDEO_SR030PC30 is not set
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
+# CONFIG_USB_GSPCA_KONICA is not set
+# CONFIG_USB_GSPCA_MARS is not set
+# CONFIG_USB_GSPCA_MR97310A is not set
+# CONFIG_USB_GSPCA_OV519 is not set
+# CONFIG_USB_GSPCA_OV534 is not set
+# CONFIG_USB_GSPCA_OV534_9 is not set
+# CONFIG_USB_GSPCA_PAC207 is not set
+# CONFIG_USB_GSPCA_PAC7302 is not set
+# CONFIG_USB_GSPCA_PAC7311 is not set
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
+# CONFIG_USB_GSPCA_TV8532 is not set
+# CONFIG_USB_GSPCA_VC032X is not set
+# CONFIG_USB_GSPCA_XIRLINK_CIT is not set
+# CONFIG_USB_GSPCA_ZC3XX is not set
+# CONFIG_VIDEO_PVRUSB2 is not set
+# CONFIG_VIDEO_HDPVR is not set
+# CONFIG_VIDEO_USBVISION is not set
+# CONFIG_USB_VICAM is not set
+# CONFIG_USB_IBMCAM is not set
+# CONFIG_USB_KONICAWC is not set
+# CONFIG_USB_ET61X251 is not set
+# CONFIG_USB_SE401 is not set
+# CONFIG_USB_SN9C102 is not set
+# CONFIG_USB_PWC is not set
+# CONFIG_USB_ZR364XX is not set
+# CONFIG_USB_STKWEBCAM is not set
+# CONFIG_USB_S2255 is not set
+# CONFIG_V4L_MEM2MEM_DRIVERS is not set
+# CONFIG_RADIO_ADAPTERS is not set
+# CONFIG_DAB is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+CONFIG_FIRMWARE_EDID=y
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_TILEBLITTING=y
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
+CONFIG_OMAP2_VRAM=y
+CONFIG_OMAP2_VRFB=y
+CONFIG_OMAP2_DSS=y
+CONFIG_OMAP2_VRAM_SIZE=4
+CONFIG_OMAP2_DSS_DEBUG_SUPPORT=y
+# CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS is not set
+CONFIG_OMAP2_DSS_DPI=y
+# CONFIG_OMAP2_DSS_RFBI is not set
+CONFIG_OMAP2_DSS_VENC=y
+CONFIG_OMAP2_VENC_OUT_TYPE_SVIDEO=y
+# CONFIG_OMAP2_VENC_OUT_TYPE_COMPOSITE is not set
+# CONFIG_OMAP2_DSS_SDI is not set
+CONFIG_OMAP2_DSS_DSI=y
+CONFIG_OMAP2_DSS_USE_DSI_PLL=y
+# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
+CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=1
+CONFIG_FB_OMAP2=y
+CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
+CONFIG_FB_OMAP2_NUM_FBS=1
+
+#
+# OMAP2/3 Display Device Drivers
+#
+CONFIG_PANEL_GENERIC=y
+# CONFIG_PANEL_SHARP_LS037V7DW01 is not set
+CONFIG_PANEL_SHARP_LQ043T1DG01=y
+# CONFIG_PANEL_TAAL is not set
+# CONFIG_PANEL_TOPPOLY_TDO35S is not set
+# CONFIG_PANEL_TPO_TD043MTEA1 is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+CONFIG_LCD_PLATFORM=y
+# CONFIG_LCD_S6E63M0 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=m
+# CONFIG_BACKLIGHT_ADP8860 is not set
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=y
+# CONFIG_SOUND_OSS_CORE is not set
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_HWDEP=y
+CONFIG_SND_RAWMIDI=y
+CONFIG_SND_JACK=y
+# CONFIG_SND_SEQUENCER is not set
+# CONFIG_SND_MIXER_OSS is not set
+# CONFIG_SND_PCM_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=y
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_CAIAQ is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_OMAP_SOC=y
+CONFIG_SND_OMAP_SOC_MCBSP=y
+CONFIG_SND_OMAP_SOC_AM3517EVM=y
+CONFIG_SND_SOC_I2C_AND_SPI=y
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_TLV320AIC23=y
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_3M_PCT is not set
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX_FF is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CANDO is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EGALAX is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MOSART is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_ROCCAT_KONE is not set
+# CONFIG_HID_ROCCAT_PYRA is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_STANTUM is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_OTG=y
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+CONFIG_USB_EHCI_TT_NEWSCHED=y
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+# CONFIG_USB_OHCI_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+CONFIG_USB_MUSB_HDRC=y
+
+#
+# Platform Glue Layer
+#
+# CONFIG_USB_MUSB_TUSB6010_GLUE is not set
+# CONFIG_USB_MUSB_OMAP2PLUS_GLUE is not set
+CONFIG_USB_MUSB_AM35X_GLUE=y
+# CONFIG_USB_MUSB_DAVINCI is not set
+# CONFIG_USB_MUSB_DA8XX is not set
+# CONFIG_USB_MUSB_TUSB6010 is not set
+# CONFIG_USB_MUSB_OMAP2PLUS is not set
+CONFIG_USB_MUSB_AM35X=y
+# CONFIG_USB_MUSB_TI81XX is not set
+# CONFIG_USB_MUSB_BLACKFIN is not set
+# CONFIG_USB_MUSB_UX500 is not set
+# CONFIG_USB_MUSB_HOST is not set
+# CONFIG_USB_MUSB_PERIPHERAL is not set
+CONFIG_USB_MUSB_OTG=y
+CONFIG_USB_GADGET_MUSB_HDRC=y
+CONFIG_USB_MUSB_HDRC_HCD=y
+CONFIG_MUSB_PIO_ONLY=y
+# CONFIG_USB_INVENTRA_DMA is not set
+# CONFIG_USB_TI_CPPI_DMA is not set
+# CONFIG_USB_TI_CPPI41_DMA is not set
+# CONFIG_USB_TUSB_OMAP_DMA is not set
+CONFIG_USB_MUSB_DEBUG=y
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+CONFIG_USB_TEST=y
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_R8A66597 is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_ETH_EEM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FUNCTIONFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_MASS_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_MULTI is not set
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+# CONFIG_USB_G_WEBCAM is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_ISP1301_OMAP is not set
+# CONFIG_USB_ULPI is not set
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+CONFIG_SDIO_UART=y
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+CONFIG_MMC_OMAP=y
+CONFIG_MMC_OMAP_HS=y
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+CONFIG_RTC_DRV_S35390A=y
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+# CONFIG_RTC_DRV_PCF2123 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
+# CONFIG_EXT3_FS_XATTR is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+CONFIG_QUOTA=y
+# CONFIG_QUOTA_NETLINK_INTERFACE is not set
+CONFIG_PRINT_QUOTA_WARNING=y
+# CONFIG_QUOTA_DEBUG is not set
+CONFIG_QUOTA_TREE=y
+# CONFIG_QFMT_V1 is not set
+CONFIG_QFMT_V2=y
+CONFIG_QUOTACTL=y
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
+CONFIG_JFFS2_FS_POSIX_ACL=y
+CONFIG_JFFS2_FS_SECURITY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+CONFIG_RPCSEC_GSS_KRB5=y
+# CONFIG_CEPH_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=y
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+CONFIG_SCHEDSTATS=y
+CONFIG_TIMER_STATS=y
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_BKL=y
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_PROVE_LOCKING=y
+# CONFIG_PROVE_RCU is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+CONFIG_LOCKDEP=y
+CONFIG_LOCK_STAT=y
+# CONFIG_DEBUG_LOCKDEP is not set
+CONFIG_TRACE_IRQFLAGS=y
+CONFIG_DEBUG_SPINLOCK_SLEEP=y
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+CONFIG_STACKTRACE=y
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_INFO_REDUCED is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_KPROBES_SANITY_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+# CONFIG_PAGE_POISONING is not set
+CONFIG_NOP_TRACER=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_RING_BUFFER=y
+CONFIG_EVENT_TRACING=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+CONFIG_KPROBE_EVENT=y
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=y
+# CONFIG_EARLY_PRINTK is not set
+# CONFIG_DEBUG_ICEDCC is not set
+# CONFIG_OC_ETM is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+CONFIG_SECURITY=y
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_NETWORK is not set
+# CONFIG_SECURITY_PATH is not set
+# CONFIG_SECURITY_TOMOYO is not set
+# CONFIG_SECURITY_APPARMOR is not set
+# CONFIG_IMA is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=y
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=y
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=y
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_CRYPTO_DEV_OMAP_SHAM is not set
+# CONFIG_CRYPTO_DEV_OMAP_AES is not set
+
+#
+# OCF Configuration
+#
+CONFIG_OCF_OCF=y
+# CONFIG_OCF_RANDOMHARVEST is not set
+CONFIG_OCF_CRYPTODEV=y
+# CONFIG_OCF_CRYPTOSOFT is not set
+# CONFIG_OCF_BENCH is not set
+CONFIG_BINARY_PRINTF=y
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+CONFIG_CRC_CCITT=y
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+CONFIG_LIBCRC32C=y
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-Fix-matrix-suspend.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-Fix-matrix-suspend.patch
new file mode 100644
index 0000000..49d97da
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-Fix-matrix-suspend.patch
@@ -0,0 +1,111 @@
+From a520a30ffd932bce334d894adce12a6ceec2be00 Mon Sep 17 00:00:00 2001
+From: Greg Guyotte <gguyotte@ti.com>
+Date: Tue, 21 Jun 2011 21:56:06 -0500
+Subject: [PATCH] Fix matrix suspend
+
+* Added new OMAP config option OMAP3_PM_DISABLE_VT_SWITCH which
+  disables the VT console switch which normally occurs during
+  suspend.  This console switch, when performed with Matrix
+  running, hangs.  The VT switch is considered unnecessary.
+* Modified OMAP3 EVM and OMAP3 Beagle defconfig files to default
+  the OMAP3_PM_DISABLE_VT_SWITCH=y, and also to default
+  MMC_UNSAFE_RESUME=y.  The latter case causes a hang during suspend
+  if the root filesystem is located on the MMC card.  This
+  fix has actually been done in another patch, but the defconfigs
+  were not updated.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+
+Fix mistake in Kconfig
+
+Did not mean to add the two lines in Kconfig under ARCH_OMAP3.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+---
+ arch/arm/configs/omap3_beagle_defconfig |    3 ++-
+ arch/arm/configs/omap3_evm_defconfig    |    3 ++-
+ arch/arm/mach-omap2/Kconfig             |   10 ++++++++++
+ arch/arm/mach-omap2/pm34xx.c            |    4 ++++
+ 4 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/configs/omap3_beagle_defconfig b/arch/arm/configs/omap3_beagle_defconfig
+index cef7597..6e8d50c 100644
+--- a/arch/arm/configs/omap3_beagle_defconfig
++++ b/arch/arm/configs/omap3_beagle_defconfig
+@@ -97,6 +97,7 @@ CONFIG_MACH_OMAP3_BEAGLE=y
+ # CONFIG_MACH_OMAP_3630SDP is not set
+ # CONFIG_OMAP3_EMU is not set
+ # CONFIG_OMAP3_SDRC_AC_TIMING is not set
++CONFIG_OMAP3_PM_DISABLE_VT_SWITCH=y
+ 
+ #
+ # Processor Features
+@@ -504,7 +505,7 @@ CONFIG_USB_ETH=y
+ CONFIG_USB_ETH_RNDIS=y
+ CONFIG_MMC=y
+ # CONFIG_MMC_DEBUG is not set
+-# CONFIG_MMC_UNSAFE_RESUME is not set
++CONFIG_MMC_UNSAFE_RESUME=y
+ 
+ #
+ # MMC/SD/SDIO Card Drivers
+diff --git a/arch/arm/configs/omap3_evm_defconfig b/arch/arm/configs/omap3_evm_defconfig
+index 675ae9c..8db3574 100644
+--- a/arch/arm/configs/omap3_evm_defconfig
++++ b/arch/arm/configs/omap3_evm_defconfig
+@@ -97,6 +97,7 @@ CONFIG_MACH_OMAP3EVM=y
+ # CONFIG_MACH_OMAP_3630SDP is not set
+ # CONFIG_OMAP3_EMU is not set
+ # CONFIG_OMAP3_SDRC_AC_TIMING is not set
++CONFIG_OMAP3_PM_DISABLE_VT_SWITCH=y
+ 
+ #
+ # Processor Features
+@@ -557,7 +558,7 @@ CONFIG_USB_ETH=y
+ CONFIG_USB_ETH_RNDIS=y
+ CONFIG_MMC=y
+ # CONFIG_MMC_DEBUG is not set
+-# CONFIG_MMC_UNSAFE_RESUME is not set
++CONFIG_MMC_UNSAFE_RESUME=y
+ 
+ #
+ # MMC/SD/SDIO Card Drivers
+diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
+index dfa5464..43dc070 100644
+--- a/arch/arm/mach-omap2/Kconfig
++++ b/arch/arm/mach-omap2/Kconfig
+@@ -338,6 +338,16 @@ config OMAP3_EMU
+ 	help
+ 	  Say Y here to enable debugging hardware of omap3
+ 
++config OMAP3_PM_DISABLE_VT_SWITCH
++        bool "OMAP3 Disable PM Console Switch"
++        depends on ARCH_OMAP3
++        default y
++        help
++          This option disables the default PM VT switch behavior for OMAP3.
++          Some platforms hang during suspend due to a failed attempt to 
++          perform the VT switch.  The VT switch is unnecessary on many 
++          platforms.
++
+ config OMAP3_SDRC_AC_TIMING
+ 	bool "Enable SDRC AC timing register changes"
+ 	depends on ARCH_OMAP3
+diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
+index 242babc..1d23b55 100644
+--- a/arch/arm/mach-omap2/pm34xx.c
++++ b/arch/arm/mach-omap2/pm34xx.c
+@@ -1072,6 +1072,10 @@ static int __init omap3_pm_init(void)
+ 
+ 	printk(KERN_ERR "Power Management for TI OMAP3.\n");
+ 
++#ifdef CONFIG_OMAP3_PM_DISABLE_VT_SWITCH
++        pm_set_vt_switch(0);
++#endif
++
+ 	/* XXX prcm_setup_regs needs to be before enabling hw
+ 	 * supervised mode for powerdomains */
+ 	prcm_setup_regs();
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-OCF-support-remove-support-for-non-TI-hardware.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-OCF-support-remove-support-for-non-TI-hardware.patch
new file mode 100644
index 0000000..bfe0b87
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-OCF-support-remove-support-for-non-TI-hardware.patch
@@ -0,0 +1,130 @@
+From f4019d96a708b09a804f59667d5dfd2a9eaaced5 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 27 Jun 2011 13:33:43 -0500
+Subject: [PATCH 1/3] OCF support: remove support for non-TI hardware
+
+* Base OCF patch was updated to not patch in support for non-TI
+  hardware.
+* Makefile and Kconfig needed updating to remove these options
+
+Upstream-Status: Inappropriate [TI SDK specific]
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ crypto/ocf/Kconfig  |   77 ---------------------------------------------------
+ crypto/ocf/Makefile |   11 -------
+ 2 files changed, 0 insertions(+), 88 deletions(-)
+
+diff --git a/crypto/ocf/Kconfig b/crypto/ocf/Kconfig
+index b9c24ff..805cb4c 100644
+--- a/crypto/ocf/Kconfig
++++ b/crypto/ocf/Kconfig
+@@ -31,83 +31,6 @@ config OCF_CRYPTOSOFT
+ 	  A software driver for the OCF framework that uses
+ 	  the kernel CryptoAPI.
+ 
+-config OCF_SAFE
+-	tristate "safenet (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  A driver for a number of the safenet Excel crypto accelerators.
+-	  Currently tested and working on the 1141 and 1741.
+-
+-config OCF_IXP4XX
+-	tristate "IXP4xx (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  XScale IXP4xx crypto accelerator driver.  Requires the
+-	  Intel Access library.
+-
+-config OCF_IXP4XX_SHA1_MD5
+-	bool "IXP4xx SHA1 and MD5 Hashing"
+-	depends on OCF_IXP4XX
+-	help
+-	  Allows the IXP4xx crypto accelerator to perform SHA1 and MD5 hashing.
+-	  Note: this is MUCH slower than using cryptosoft (software crypto engine).
+-
+-config OCF_HIFN
+-	tristate "hifn (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for various HIFN based crypto accelerators.
+-	  (7951, 7955, 7956, 7751, 7811)
+-
+-config OCF_HIFNHIPP
+-	tristate "Hifn HIPP (HW packet crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for various HIFN (HIPP) based crypto accelerators
+-	  (7855)
+-
+-config OCF_TALITOS
+-	tristate "talitos (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for Freescale's security engine (SEC/talitos).
+-
+-config OCF_PASEMI
+-	tristate "pasemi (HW crypto engine)"
+-	depends on OCF_OCF && PPC_PASEMI
+-	help
+-	  OCF driver for the PA Semi PWRficient DMA Engine
+-
+-config OCF_EP80579
+-	tristate "ep80579 (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for the Intel EP80579 Integrated Processor Product Line.
+-
+-config OCF_CRYPTOCTEON
+-	tristate "cryptocteon (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for the Cavium OCTEON Processors.
+-
+-config OCF_KIRKWOOD
+-	tristate "kirkwood (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for the Marvell Kirkwood (88F6xxx) Processors.
+-
+-config OCF_C7108
+-	tristate "Micronas 7108 (HW crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for the Microna 7108 Cipher processors.
+-
+-config OCF_OCFNULL
+-	tristate "ocfnull (fake crypto engine)"
+-	depends on OCF_OCF
+-	help
+-	  OCF driver for measuring ipsec overheads (does no crypto)
+-
+ config OCF_BENCH
+ 	tristate "ocf-bench (HW crypto in-kernel benchmark)"
+ 	depends on OCF_OCF
+diff --git a/crypto/ocf/Makefile b/crypto/ocf/Makefile
+index fa951f4..aab3fae 100644
+--- a/crypto/ocf/Makefile
++++ b/crypto/ocf/Makefile
+@@ -37,17 +37,6 @@ obj-$(CONFIG_OCF_CRYPTODEV)   += cryptodev.o
+ obj-$(CONFIG_OCF_CRYPTOSOFT)  += cryptosoft.o
+ obj-$(CONFIG_OCF_BENCH)       += ocf-bench.o
+ 
+-$(_obj)-$(CONFIG_OCF_SAFE)    += safe$(_slash)
+-$(_obj)-$(CONFIG_OCF_HIFN)    += hifn$(_slash)
+-$(_obj)-$(CONFIG_OCF_IXP4XX)  += ixp4xx$(_slash)
+-$(_obj)-$(CONFIG_OCF_TALITOS) += talitos$(_slash)
+-$(_obj)-$(CONFIG_OCF_PASEMI)  += pasemi$(_slash)
+-$(_obj)-$(CONFIG_OCF_EP80579) += ep80579$(_slash)
+-$(_obj)-$(CONFIG_OCF_CRYPTOCTEON) += cryptocteon$(_slash)
+-$(_obj)-$(CONFIG_OCF_KIRKWOOD) += kirkwood$(_slash)
+-$(_obj)-$(CONFIG_OCF_OCFNULL) += ocfnull$(_slash)
+-$(_obj)-$(CONFIG_OCF_C7108) += c7108$(_slash)
+-
+ ocf-objs := $(OCF_OBJS)
+ 
+ $(list-multi) dummy1: $(ocf-objs)
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch
new file mode 100644
index 0000000..12cb1de
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch
@@ -0,0 +1,319 @@
+From 0192a1d0731d3e8959b817bbc458c21e1c51408f Mon Sep 17 00:00:00 2001
+From: Greg Guyotte <gguyotte@ti.com>
+Date: Tue, 5 Jun 2012 16:54:26 -0500
+Subject: [PATCH] am37x: Adding ABB Support for 1GHz OPP
+
+This patch adds ABB support for the AM37x 1GHz OPP.  When 1GHz
+operation occurs, the ABB LDO will be enabled, effectively
+boosting MPU voltage.  At any time that we are not operating
+at 1GHz, the ABB LDO will be bypassed.  This change is
+required for operation at 1GHz on the AM37x device.
+
+This patch only affects AM37x.  In the course of booting,
+it boosts the MPU rate to 1GHz and turns on the ABB LDO.  It
+is expected that the system will be operating at 800MHz
+prior to this time, as set by Uboot.  Also note that after
+MPU rate is changed, the loops_per_jiffy global is updated,
+which is required in order to get the proper readout from
+BogoMIPS.
+
+Upstream-Status: Not Appropriate
+    * This patch is a quick fix based on an old kernel.
+    * This will be reworked for the Linux mainline kernel.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+---
+ arch/arm/mach-omap2/pm.c               |   30 +++++++-
+ arch/arm/mach-omap2/prm-regbits-34xx.h |   20 +++++
+ arch/arm/mach-omap2/prm2xxx_3xxx.h     |    5 ++
+ arch/arm/mach-omap2/voltage.c          |  123 ++++++++++++++++++++++++++++++++
+ 4 files changed, 176 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
+index f7e4d1b..678877c 100644
+--- a/arch/arm/mach-omap2/pm.c
++++ b/arch/arm/mach-omap2/pm.c
+@@ -27,6 +27,8 @@
+ #include "cm2xxx_3xxx.h"
+ #include "pm.h"
+ 
++#define RATE_1GHZ 1000000000
++
+ static struct omap_device_pm_latency *pm_lats;
+ 
+ static struct device *mpu_dev;
+@@ -61,7 +63,6 @@ struct device *omap4_get_dsp_device(void)
+ }
+ EXPORT_SYMBOL(omap4_get_dsp_device);
+ 
+-#ifndef CONFIG_CPU_FREQ
+ static unsigned long compute_lpj(unsigned long ref, u_int div, u_int mult)
+ {
+ 	unsigned long new_jiffy_l, new_jiffy_h;
+@@ -81,7 +82,6 @@ static unsigned long compute_lpj(unsigned long ref, u_int div, u_int mult)
+ 
+ 	return new_jiffy_h + new_jiffy_l * 100;
+ }
+-#endif
+ 
+ /* static int _init_omap_device(struct omap_hwmod *oh, void *user) */
+ static int _init_omap_device(char *name, struct device **new_dev)
+@@ -289,6 +289,7 @@ static int __init omap2_set_init_voltage(char *vdd_name, char *clk_name,
+ 	struct clk *clk;
+ 	struct opp *opp;
+ 	unsigned long freq, bootup_volt;
++	int ret;
+ 
+ 	if (!vdd_name || !clk_name || !dev) {
+ 		printk(KERN_ERR "%s: Invalid parameters!\n", __func__);
+@@ -311,6 +312,11 @@ static int __init omap2_set_init_voltage(char *vdd_name, char *clk_name,
+ 
+ 	freq = clk->rate;
+ 	clk_put(clk);
++	
++	/* set up for a voltage to support 1GHz */
++	if (cpu_is_omap3630())
++		if (!strcmp(vdd_name, "mpu"))
++			freq = RATE_1GHZ;
+ 
+ 	opp = opp_find_freq_ceil(dev, &freq);
+ 	if (IS_ERR(opp)) {
+@@ -327,6 +333,26 @@ static int __init omap2_set_init_voltage(char *vdd_name, char *clk_name,
+ 	}
+ 
+ 	omap_voltage_scale_vdd(voltdm, bootup_volt);
++
++	/* once voltage is changed, we can scale freq to max */
++	if (cpu_is_omap3630()) {
++		if (!strcmp(vdd_name, "mpu")) {
++			unsigned long cur_rate;
++			cur_rate = clk->rate;
++
++			ret = clk_set_rate(clk, RATE_1GHZ);
++			if (ret) {
++				dev_warn(dev, "%s: Unable to set rate to %d\n",
++					 __func__, RATE_1GHZ);
++				return ret;
++			}
++			/* Update loops_per_jiffy because processor speed is 
++			   being changed.  Necessary to keep BogoMIPS happy. */
++			loops_per_jiffy = compute_lpj(loops_per_jiffy,
++						      cur_rate / 1000000, 
++						      RATE_1GHZ / 1000000);
++		}
++	}
+ 	return 0;
+ 
+ exit:
+diff --git a/arch/arm/mach-omap2/prm-regbits-34xx.h b/arch/arm/mach-omap2/prm-regbits-34xx.h
+index 64c087a..2758fa3 100644
+--- a/arch/arm/mach-omap2/prm-regbits-34xx.h
++++ b/arch/arm/mach-omap2/prm-regbits-34xx.h
+@@ -89,6 +89,7 @@
+ #define OMAP3430_LASTPOWERSTATEENTERED_MASK		(0x3 << 0)
+ 
+ /* PRM_IRQSTATUS_IVA2, PRM_IRQSTATUS_MPU shared bits */
++#define OMAP3630_ABB_LDO_TRANXDONE_ST                   (1 << 26)
+ #define OMAP3430_WKUP_ST_MASK				(1 << 0)
+ 
+ /* PRM_IRQENABLE_IVA2, PRM_IRQENABLE_MPU shared bits */
+@@ -216,6 +217,9 @@
+ /* PRM_SYSCONFIG specific bits */
+ 
+ /* PRM_IRQSTATUS_MPU specific bits */
++#define OMAP3630_VC_BYPASS_ACK_EN                       (1 << 28)
++#define OMAP3630_VC_VP1_ACK_EN                          (1 << 27)
++#define OMAP3630_VC_ABB_LDO_TRANXDONE_EN                (1 << 26)
+ #define OMAP3430ES2_SND_PERIPH_DPLL_ST_SHIFT		25
+ #define OMAP3430ES2_SND_PERIPH_DPLL_ST_MASK		(1 << 25)
+ #define OMAP3430_VC_TIMEOUTERR_ST_MASK			(1 << 24)
+@@ -587,6 +591,22 @@
+ 
+ /* PRM_VP2_STATUS specific bits */
+ 
++/* PRM_LDO_ABB_SETUP */
++#define OMAP3630_SR2_IN_TRANSITION                     (1 << 6)
++#define OMAP3630_SR2_STATUS_SHIFT                      3
++#define OMAP3630_SR2_STATUS_MASK                       (0x3 << 3)
++#define OMAP3630_OPP_CHANGE                            (1 << 2)
++#define OMAP3630_OPP_SEL_SHIFT                         0
++#define OMAP3630_OPP_SEL_MASK                          (0x3 << 0)
++
++/* PRM_LDO_ABB_CTRL */
++#define OMAP3630_SR2_WTCNT_VALUE_SHIFT                 8
++#define OMAP3630_SR2_WTCNT_VALUE_MASK                  (0xff << 8)
++#define OMAP3630_SLEEP_RBB_SEL                         (1 << 3)
++#define OMAP3630_ACTIVE_FBB_SEL                        (1 << 2)
++#define OMAP3630_ACTIVE_RBB_SEL                        (1 << 1)
++#define OMAP3630_SR2EN                                 (1 << 0)
++
+ /* RM_RSTST_NEON specific bits */
+ 
+ /* PM_WKDEP_NEON specific bits */
+diff --git a/arch/arm/mach-omap2/prm2xxx_3xxx.h b/arch/arm/mach-omap2/prm2xxx_3xxx.h
+index 613f83c..79c9ad5 100644
+--- a/arch/arm/mach-omap2/prm2xxx_3xxx.h
++++ b/arch/arm/mach-omap2/prm2xxx_3xxx.h
+@@ -171,6 +171,11 @@
+ #define OMAP3_PRM_VP2_STATUS_OFFSET	0x00e4
+ #define OMAP3430_PRM_VP2_STATUS		OMAP34XX_PRM_REGADDR(OMAP3430_GR_MOD, 0x00e4)
+ 
++#define OMAP3_PRM_LDO_ABB_SETUP_OFFSET  0x00f0
++#define OMAP3430_PRM_LDO_ABB_SETUP	OMAP34XX_PRM_REGADDR(OMAP3430_GR_MOD, 0x00f0)
++#define OMAP3_PRM_LDO_ABB_CTRL_OFFSET	0x00f4
++#define OMAP3430_PRM_LDO_ABB_CTRL	OMAP34XX_PRM_REGADDR(OMAP3430_GR_MOD, 0x00f4)
++
+ #define OMAP3_PRM_CLKSEL_OFFSET	0x0040
+ #define OMAP3430_PRM_CLKSEL		OMAP34XX_PRM_REGADDR(OMAP3430_CCR_MOD, 0x0040)
+ #define OMAP3_PRM_CLKOUT_CTRL_OFFSET	0x0070
+diff --git a/arch/arm/mach-omap2/voltage.c b/arch/arm/mach-omap2/voltage.c
+index 2e015a7..32944d0 100644
+--- a/arch/arm/mach-omap2/voltage.c
++++ b/arch/arm/mach-omap2/voltage.c
+@@ -45,6 +45,10 @@
+ #define VP_TRANXDONE_TIMEOUT	300
+ #define VOLTAGE_DIR_SIZE	16
+ 
++#define ABB_TRANXDONE_TIMEOUT   100
++#define ABB_FAST_OPP            1
++#define ABB_NOMINAL_OPP         2
++
+ /* Voltage processor register offsets */
+ struct vp_reg_offs {
+ 	u8 vpconfig;
+@@ -764,6 +768,112 @@ static int vc_bypass_scale_voltage(struct omap_vdd_info *vdd,
+ 	return 0;
+ }
+ 
++/**
++ * omap3630_abb_change_active_opp - handle OPP changes with Adaptive Body-Bias
++ * @target_opp_no: ABB_FAST_OPP or ABB_NOMINAL_OPP
++ *
++ * Adaptive Body-Bias is a 3630-specific technique to boost voltage in high
++ * OPPs for silicon with weak characteristics as well as lower voltage in low
++ * OPPs for silicon with strong characteristics.
++ *
++ * Only Foward Body-Bias for operating at high OPPs is implemented below.
++ * Reverse Body-Bias for saving power in active cases and sleep cases is not
++ * yet implemented.
++ */
++static int omap3630_abb_change_active_opp(u32 target_opp_no)
++{
++       u32 sr2en_enabled;
++       int timeout;
++
++       /* has SR2EN been enabled previously? */
++       sr2en_enabled = (omap2_prm_read_mod_reg(OMAP3430_GR_MOD,
++                               OMAP3_PRM_LDO_ABB_CTRL_OFFSET) &
++                       OMAP3630_SR2EN);
++
++       /* select OPP */
++       /* FIXME: shouldn't be hardcoded OPP here */
++       if (target_opp_no == ABB_FAST_OPP) {
++               /* program for fast opp - enable fbb */
++               omap2_prm_rmw_mod_reg_bits(OMAP3630_OPP_SEL_MASK,
++                               (ABB_FAST_OPP << OMAP3630_OPP_SEL_SHIFT),
++                               OMAP3430_GR_MOD,
++                               OMAP3_PRM_LDO_ABB_SETUP_OFFSET);
++
++               /* enable the ABB ldo if not done already */
++               if (!sr2en_enabled)
++                       omap2_prm_set_mod_reg_bits(OMAP3630_SR2EN,
++                                       OMAP3430_GR_MOD,
++                                       OMAP3_PRM_LDO_ABB_CTRL_OFFSET);
++	       pr_debug("ABB: ABB LDO Enabled\n");
++       } else if (sr2en_enabled) {
++               /* program for nominal opp - bypass abb ldo */
++               omap2_prm_rmw_mod_reg_bits(OMAP3630_OPP_SEL_MASK,
++                               (ABB_NOMINAL_OPP << OMAP3630_OPP_SEL_SHIFT),
++                               OMAP3430_GR_MOD,
++                               OMAP3_PRM_LDO_ABB_SETUP_OFFSET);
++	       pr_debug("ABB: ABB LDO Bypassed\n");
++       } else {
++               /* nothing to do here */
++               return 0;
++       }
++
++       /* set ACTIVE_FBB_SEL for all 3630 silicon */
++       omap2_prm_set_mod_reg_bits(OMAP3630_ACTIVE_FBB_SEL,
++                       OMAP3430_GR_MOD,
++                       OMAP3_PRM_LDO_ABB_CTRL_OFFSET);
++
++       /* program settling time of 30us for ABB ldo transition */
++       omap2_prm_rmw_mod_reg_bits(OMAP3630_SR2_WTCNT_VALUE_MASK,
++                       (0x62 << OMAP3630_SR2_WTCNT_VALUE_SHIFT),
++                       OMAP3430_GR_MOD,
++                       OMAP3_PRM_LDO_ABB_CTRL_OFFSET);
++
++       /* clear ABB ldo interrupt status */
++       omap2_prm_write_mod_reg(OMAP3630_ABB_LDO_TRANXDONE_ST,
++                       OCP_MOD,
++                       OMAP3_PRM_IRQSTATUS_MPU_OFFSET);
++
++       /* enable ABB LDO OPP change */
++       omap2_prm_set_mod_reg_bits(OMAP3630_OPP_CHANGE,
++                       OMAP3430_GR_MOD,
++                       OMAP3_PRM_LDO_ABB_SETUP_OFFSET);
++
++       timeout = 0;
++
++       /* wait until OPP change completes */
++       while ((timeout < ABB_TRANXDONE_TIMEOUT ) &&
++                       (!(omap2_prm_read_mod_reg(OCP_MOD,
++                                           OMAP3_PRM_IRQSTATUS_MPU_OFFSET) &
++                          OMAP3630_ABB_LDO_TRANXDONE_ST))) {
++               udelay(1);
++               timeout++;
++       }
++
++       if (timeout == ABB_TRANXDONE_TIMEOUT)
++               pr_warning("ABB: TRANXDONE timed out waiting for OPP change\n");
++
++       timeout = 0;
++
++       /* Clear all pending TRANXDONE interrupts/status */
++       while (timeout < ABB_TRANXDONE_TIMEOUT) {
++               omap2_prm_write_mod_reg(OMAP3630_ABB_LDO_TRANXDONE_ST,
++                               OCP_MOD,
++                               OMAP3_PRM_IRQSTATUS_MPU_OFFSET);
++               if (!(omap2_prm_read_mod_reg(OCP_MOD,
++                                       OMAP3_PRM_IRQSTATUS_MPU_OFFSET)
++                                       & OMAP3630_ABB_LDO_TRANXDONE_ST))
++                       break;
++
++               udelay(1);
++               timeout++;
++       }
++
++       if (timeout == ABB_TRANXDONE_TIMEOUT)
++               pr_warning("ABB: TRANXDONE timed out trying to clear status\n");
++
++       return 0;
++}
++
+ /* VP force update method of voltage scaling */
+ static int vp_forceupdate_scale_voltage(struct omap_vdd_info *vdd,
+ 		unsigned long target_volt)
+@@ -858,6 +968,19 @@ static int vp_forceupdate_scale_voltage(struct omap_vdd_info *vdd,
+ 	vpconfig &= ~vdd->vp_reg.vpconfig_forceupdate;
+ 	vdd->write_reg(vpconfig, mod, vdd->vp_offs.vpconfig);
+ 
++	if (cpu_is_omap3630() && !strcmp(vdd->voltdm.name, "mpu")) {
++		if (vdd->curr_volt == OMAP3630_VDD_MPU_OPP1G_UV) {
++			pr_debug("%s: vdd_%s: Attempting ABB enable\n",
++				   __func__, vdd->voltdm.name);
++			omap3630_abb_change_active_opp(ABB_FAST_OPP);
++		}
++		else {
++			pr_debug("%s: vdd_%s: Attempting ABB disable\n", 
++				   __func__, vdd->voltdm.name);
++			omap3630_abb_change_active_opp(ABB_NOMINAL_OPP);
++		}
++	}
++
+ 	return 0;
+ }
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-linux-omap3-Add-OCF-support-to-2.6.37-kernel.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-linux-omap3-Add-OCF-support-to-2.6.37-kernel.patch
new file mode 100644
index 0000000..8ad7bf4
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-linux-omap3-Add-OCF-support-to-2.6.37-kernel.patch
@@ -0,0 +1,7043 @@
+From d27b15fcf6b97acf8657ef6635e7e3ec95961f14 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Thu, 16 Jun 2011 09:35:15 -0500
+Subject: [PATCH] linux-omap3: Add OCF support to 2.6.37 kernel
+
+* Patch kernel with OCF (community source)
+* Mod to defconfig to build OCF statically in to kernel
+* cryptodev.ko is built as a loadable module
+* cryptodev.h header file moved to include/crypto
+
+Signed-off-by: Greg Turner <gregturner@ti.com>
+---
+ crypto/Kconfig             |    3 +
+ crypto/Makefile            |    2 +
+ crypto/ocf/ChangeLog       |  205 +++++
+ crypto/ocf/Config.in       |   36 +
+ crypto/ocf/Kconfig         |  119 +++
+ crypto/ocf/Makefile        |  124 +++
+ crypto/ocf/criov.c         |  215 ++++++
+ crypto/ocf/crypto.c        | 1784 ++++++++++++++++++++++++++++++++++++++++++++
+ crypto/ocf/cryptodev.c     | 1063 ++++++++++++++++++++++++++
+ crypto/ocf/cryptosoft.c    | 1210 ++++++++++++++++++++++++++++++
+ crypto/ocf/ocf-bench.c     |  436 +++++++++++
+ crypto/ocf/ocf-compat.h    |  294 ++++++++
+ crypto/ocf/random.c        |  322 ++++++++
+ crypto/ocf/rndtest.c       |  300 ++++++++
+ crypto/ocf/rndtest.h       |   54 ++
+ crypto/ocf/uio.h           |   54 ++
+ drivers/char/random.c      |   65 ++
+ fs/fcntl.c                 |    1 +
+ include/crypto/cryptodev.h |  479 ++++++++++++
+ include/linux/miscdevice.h |    1 +
+ include/linux/random.h     |   29 +
+ kernel/pid.c               |    1 +
+ 22 files changed, 6797 insertions(+), 0 deletions(-)
+ create mode 100644 crypto/ocf/ChangeLog
+ create mode 100644 crypto/ocf/Config.in
+ create mode 100644 crypto/ocf/Kconfig
+ create mode 100644 crypto/ocf/Makefile
+ create mode 100644 crypto/ocf/criov.c
+ create mode 100644 crypto/ocf/crypto.c
+ create mode 100644 crypto/ocf/cryptodev.c
+ create mode 100644 crypto/ocf/cryptosoft.c
+ create mode 100644 crypto/ocf/ocf-bench.c
+ create mode 100644 crypto/ocf/ocf-compat.h
+ create mode 100644 crypto/ocf/random.c
+ create mode 100644 crypto/ocf/rndtest.c
+ create mode 100644 crypto/ocf/rndtest.h
+ create mode 100644 crypto/ocf/uio.h
+ create mode 100644 include/crypto/cryptodev.h
+
+diff --git a/crypto/Kconfig b/crypto/Kconfig
+index e4bac29..3154b22 100644
+--- a/crypto/Kconfig
++++ b/crypto/Kconfig
+@@ -844,3 +844,6 @@ config CRYPTO_ANSI_CPRNG
+ source "drivers/crypto/Kconfig"
+ 
+ endif	# if CRYPTO
++
++source "crypto/ocf/Kconfig"
++
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 423b7de..14ec6e9 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -86,6 +86,8 @@ obj-$(CONFIG_CRYPTO_ANSI_CPRNG) += ansi_cprng.o
+ obj-$(CONFIG_CRYPTO_TEST) += tcrypt.o
+ obj-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
+ 
++obj-$(CONFIG_OCF_OCF) += ocf/
++
+ #
+ # generic algorithms and the async_tx api
+ #
+diff --git a/crypto/ocf/ChangeLog b/crypto/ocf/ChangeLog
+new file mode 100644
+index 0000000..8101340
+--- /dev/null
++++ b/crypto/ocf/ChangeLog
+@@ -0,0 +1,205 @@
++2009-08-20 19:05  toby
++
++	* cryptocteon/Makefile, ep80579/Makefile:
++	Add some makefile
++	changes to let a linux-2.4 build from head work when doing 'make
++	dep'.
++
++2009-08-12 21:42  davidm
++
++	* cryptodev.c:
++	
++	if crypto_dispatch fails,  make sure we bail immediately rather
++	than go on to do other error checking that we should only do if
++	crypto_dispatch worked.
++
++2009-08-12 21:30  davidm
++
++	* crypto.c:
++	
++	To avoid a race while we have the Q's unlcked we must stage the
++	blocking of the driver, so,  we assume the driver to be blocked, 
++	but if any unblocks come in while we are unlocked,  we do not block
++	the driver.
++	
++	At worst this means we will try again and get another block.
++	
++	Without this change we can lose an unblock request and give up on
++	the driver.
++
++2009-08-12 21:04  davidm
++
++	* crypto.c:
++	
++	kill_proc needs to be defined for kernels at or after 2.6.27
++
++2009-08-12 21:03  davidm
++
++	* ep80579/environment.mk:
++	
++	Allow OCF to be with the kernel,  or within the uClinux-dist
++	modules dir.
++
++2009-08-12 20:52  davidm
++
++	* ocf-compat.h:
++	
++	if IS_ERR_VALUE is not defined,  try and get it,  if it doesn't
++	exist, make our own.
++
++2009-05-27 01:52  davidm
++
++	* cryptodev.c:
++	
++	Order a crd combination of cipher/hmac just as ipsec would.  That
++	way it's easier to test results against cryptosoft and the HW
++	drivers that automatically fix this.
++	
++	cryptosoft processes algs in crd order,  thus they get different
++	results to when compared to cryptosoft.
++	
++	encrypt = cipher then hmac decrypt = hmac then cipher
++
++2009-05-27 01:48  davidm
++
++	* ocf-compat.h:
++	
++	Make sure we have an late_initcall macro even on old systems.
++
++2009-05-27 01:47  davidm
++
++	* cryptosoft.c:
++	
++	make sure that cryptosoft it started after the kernel crypto, 
++	otherwise it will not detect the kernels algs correctly.
++
++2009-05-27 01:41  davidm
++
++	* cryptocteon/: cavium_crypto.c, cryptocteon.c:
++	
++	aes/des/3des + md5/sha1 working with ipsec.
++
++2009-05-20 19:11  davidm
++
++	* cryptocteon/: README.txt, cavium_crypto.c, cryptocteon.c:
++	
++	Complete rework of the driver to setup a framework that can handle
++	all the combinations we need properly.
++	
++	Currently only DES is working.	Need to knock out a DES-MD5 version
++	so we can bench ipsec, then cleanup the AES/SHA bits.
++
++2009-05-14 20:53  asallawa
++
++	* ixp4xx/ixp4xx.c:
++	
++	Remove call to flush_scheduled_work(). Doesn't appear to be
++	necessary and can cause 'scheduling while atomic' kernel errors.
++
++2009-05-14 01:17  asallawa
++
++	* crypto.c:
++	
++	In particular situations, the crypto kernel thread can run forever
++	without ever calling wait_event_interruptible() which meant that it
++	could starve the rest of the system of CPU time.  To fix this, set
++	a maximum number of crypto operations to do consecutively before
++	calling schedule(). Default value is 1000, which should be less
++	than a second on most of our platforms.
++
++2009-05-08 20:10  davidm
++
++	* crypto.c:
++	
++	Currently we are queuing requests that fail for callback.  The
++	callback will never happen because the request failed.	This can
++	cause "busy loops" in the crypto support threads.
++	
++	Make sure we track the error status when processing a request to
++	the driver and only return 0 if everything worked.
++	
++	The original code had this right,  just bad locking,  the locking
++	fixes broke the error reporting.
++
++2009-03-31 20:41  davidm
++
++	* crypto.c:
++	
++	We cannot use sys_kill (not experted),	so switch to using send_sig
++	and the appropriate task finding functions.
++
++2009-03-27 03:50  gerg
++
++	* crypto.c:
++	
++	From linux-2.6.29 onwards there is no kill_proc() routine.  On
++	these newer systems call direct to the sys_kill() system call.
++
++2009-03-14 07:00  davidm
++
++	* ep80579/Makefile:
++	
++	merge makefile fix from head so that make clean works properly.
++
++2009-03-10 22:57  davidm
++
++	* hifn/hifn7751.c:
++	
++	Fix up cache line size for hifns,  not all get it right.  Patch
++	suggested and tested by Donald Lai <dlai@hifn.com>.
++
++2009-03-10 21:36  davidm
++
++	* ep80579/Makefile:
++	
++	Make sure we do not break non-tolapai builds (when running clean
++	etc)
++
++2009-02-07 00:32  davidm
++
++	* Kconfig, Makefile, cryptocteon/Makefile, cryptocteon/README.txt,
++	cryptocteon/cavium_crypto.c, cryptocteon/cryptocteon.c:
++	
++	First pass slightly working (3des/aes) crypto driver for the cavium
++	5010.
++	
++	Still a fair bit needed here (hmac+cipher and hash processing). 
++	Need to revisit the faster cavium example ipsec code.
++
++2009-01-20 01:06  gerg
++
++	* cryptosoft.c:
++	
++	Include linux/scatterlist.h instead of asm/scatterlist.h. Otherwise
++	we don't get the generic sg macros (only the asm specific
++	difinitions).
++
++2009-01-16 20:05  davidm
++
++	* cryptosoft.c:
++	
++	clean up some debug output (sign extension fo chars)
++
++2008-11-20 22:50  davidm
++
++	* ocf-compat.h:
++	
++	We need to include mm.h to get page_address on some kernels. 
++	reported by Paul Wouters <paul@xelerance.com>
++
++2008-11-14 06:14  davidm
++
++	* patches/linux-2.6.26-ocf.patch:
++	
++	make sure we patch into the kernel properly.  Paul Wouters
++	<paul@xelerance.com>
++
++2008-09-20 02:20  davidm
++
++	* crypto.c, cryptodev.h:
++	
++	Fix up session migration so that a driver can be removed while
++	ipsec is up and running and the tunnel will auto-migrate to a
++	backup driver (ie., cryptosoft).
++	
++	Brad Vrabete <brad.vrabete@intel.com>
+diff --git a/crypto/ocf/Config.in b/crypto/ocf/Config.in
+new file mode 100644
+index 0000000..d722cba
+--- /dev/null
++++ b/crypto/ocf/Config.in
+@@ -0,0 +1,36 @@
++#############################################################################
++
++mainmenu_option next_comment
++comment 'OCF Configuration'
++tristate 'OCF (Open Cryptograhic Framework)' CONFIG_OCF_OCF
++dep_mbool '  enable fips RNG checks (fips check on RNG data before use)' \
++				CONFIG_OCF_FIPS $CONFIG_OCF_OCF
++dep_mbool '  enable harvesting entropy for /dev/random' \
++				CONFIG_OCF_RANDOMHARVEST $CONFIG_OCF_OCF
++dep_tristate '  cryptodev (user space support)' \
++				CONFIG_OCF_CRYPTODEV $CONFIG_OCF_OCF
++dep_tristate '  cryptosoft (software crypto engine)' \
++				CONFIG_OCF_CRYPTOSOFT $CONFIG_OCF_OCF
++dep_tristate '  safenet (HW crypto engine)' \
++				CONFIG_OCF_SAFE $CONFIG_OCF_OCF
++dep_tristate '  IXP4xx (HW crypto engine)' \
++				CONFIG_OCF_IXP4XX $CONFIG_OCF_OCF
++dep_mbool    '  Enable IXP4xx HW to perform SHA1 and MD5 hashing (very slow)' \
++				CONFIG_OCF_IXP4XX_SHA1_MD5 $CONFIG_OCF_IXP4XX
++dep_tristate '  hifn (HW crypto engine)' \
++				CONFIG_OCF_HIFN $CONFIG_OCF_OCF
++dep_tristate '  talitos (HW crypto engine)' \
++				CONFIG_OCF_TALITOS $CONFIG_OCF_OCF
++dep_tristate '  pasemi (HW crypto engine)' \
++				CONFIG_OCF_PASEMI $CONFIG_OCF_OCF
++dep_tristate '  ep80579 (HW crypto engine)' \
++				CONFIG_OCF_EP80579 $CONFIG_OCF_OCF
++dep_tristate '  Micronas c7108 (HW crypto engine)' \
++				CONFIG_OCF_C7108 $CONFIG_OCF_OCF
++dep_tristate '  ocfnull (does no crypto)' \
++				CONFIG_OCF_OCFNULL $CONFIG_OCF_OCF
++dep_tristate '  ocf-bench (HW crypto in-kernel benchmark)' \
++				CONFIG_OCF_BENCH $CONFIG_OCF_OCF
++endmenu
++
++#############################################################################
+diff --git a/crypto/ocf/Kconfig b/crypto/ocf/Kconfig
+new file mode 100644
+index 0000000..b9c24ff
+--- /dev/null
++++ b/crypto/ocf/Kconfig
+@@ -0,0 +1,119 @@
++menu "OCF Configuration"
++
++config OCF_OCF
++	tristate "OCF (Open Cryptograhic Framework)"
++	help
++	  A linux port of the OpenBSD/FreeBSD crypto framework.
++
++config OCF_RANDOMHARVEST
++	bool "crypto random --- harvest entropy for /dev/random"
++	depends on OCF_OCF
++	help
++	  Includes code to harvest random numbers from devices that support it.
++
++config OCF_FIPS
++	bool "enable fips RNG checks"
++	depends on OCF_OCF && OCF_RANDOMHARVEST
++	help
++	  Run all RNG provided data through a fips check before
++	  adding it /dev/random's entropy pool.
++
++config OCF_CRYPTODEV
++	tristate "cryptodev (user space support)"
++	depends on OCF_OCF
++	help
++	  The user space API to access crypto hardware.
++
++config OCF_CRYPTOSOFT
++	tristate "cryptosoft (software crypto engine)"
++	depends on OCF_OCF
++	help
++	  A software driver for the OCF framework that uses
++	  the kernel CryptoAPI.
++
++config OCF_SAFE
++	tristate "safenet (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  A driver for a number of the safenet Excel crypto accelerators.
++	  Currently tested and working on the 1141 and 1741.
++
++config OCF_IXP4XX
++	tristate "IXP4xx (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  XScale IXP4xx crypto accelerator driver.  Requires the
++	  Intel Access library.
++
++config OCF_IXP4XX_SHA1_MD5
++	bool "IXP4xx SHA1 and MD5 Hashing"
++	depends on OCF_IXP4XX
++	help
++	  Allows the IXP4xx crypto accelerator to perform SHA1 and MD5 hashing.
++	  Note: this is MUCH slower than using cryptosoft (software crypto engine).
++
++config OCF_HIFN
++	tristate "hifn (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for various HIFN based crypto accelerators.
++	  (7951, 7955, 7956, 7751, 7811)
++
++config OCF_HIFNHIPP
++	tristate "Hifn HIPP (HW packet crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for various HIFN (HIPP) based crypto accelerators
++	  (7855)
++
++config OCF_TALITOS
++	tristate "talitos (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for Freescale's security engine (SEC/talitos).
++
++config OCF_PASEMI
++	tristate "pasemi (HW crypto engine)"
++	depends on OCF_OCF && PPC_PASEMI
++	help
++	  OCF driver for the PA Semi PWRficient DMA Engine
++
++config OCF_EP80579
++	tristate "ep80579 (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for the Intel EP80579 Integrated Processor Product Line.
++
++config OCF_CRYPTOCTEON
++	tristate "cryptocteon (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for the Cavium OCTEON Processors.
++
++config OCF_KIRKWOOD
++	tristate "kirkwood (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for the Marvell Kirkwood (88F6xxx) Processors.
++
++config OCF_C7108
++	tristate "Micronas 7108 (HW crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for the Microna 7108 Cipher processors.
++
++config OCF_OCFNULL
++	tristate "ocfnull (fake crypto engine)"
++	depends on OCF_OCF
++	help
++	  OCF driver for measuring ipsec overheads (does no crypto)
++
++config OCF_BENCH
++	tristate "ocf-bench (HW crypto in-kernel benchmark)"
++	depends on OCF_OCF
++	help
++	  A very simple encryption test for the in-kernel interface
++	  of OCF.  Also includes code to benchmark the IXP Access library
++	  for comparison.
++
++endmenu
+diff --git a/crypto/ocf/Makefile b/crypto/ocf/Makefile
+new file mode 100644
+index 0000000..fa951f4
+--- /dev/null
++++ b/crypto/ocf/Makefile
+@@ -0,0 +1,124 @@
++# for SGlinux builds
++-include $(ROOTDIR)/modules/.config
++
++OCF_OBJS = crypto.o criov.o
++
++ifdef CONFIG_OCF_RANDOMHARVEST
++	OCF_OBJS += random.o
++endif
++
++ifdef CONFIG_OCF_FIPS
++	OCF_OBJS += rndtest.o
++endif
++
++# Add in autoconf.h to get #defines for CONFIG_xxx
++AUTOCONF_H=$(ROOTDIR)/modules/autoconf.h
++ifeq ($(AUTOCONF_H), $(wildcard $(AUTOCONF_H)))
++	EXTRA_CFLAGS += -include $(AUTOCONF_H)
++	export EXTRA_CFLAGS
++endif
++
++ifndef obj
++	obj ?= .
++	_obj = subdir
++	mod-subdirs := safe hifn ixp4xx talitos ocfnull
++	export-objs += crypto.o criov.o random.o
++	list-multi += ocf.o
++	_slash :=
++else
++	_obj = obj
++	_slash := /
++endif
++
++EXTRA_CFLAGS += -I$(obj)/.
++
++obj-$(CONFIG_OCF_OCF)         += ocf.o
++obj-$(CONFIG_OCF_CRYPTODEV)   += cryptodev.o
++obj-$(CONFIG_OCF_CRYPTOSOFT)  += cryptosoft.o
++obj-$(CONFIG_OCF_BENCH)       += ocf-bench.o
++
++$(_obj)-$(CONFIG_OCF_SAFE)    += safe$(_slash)
++$(_obj)-$(CONFIG_OCF_HIFN)    += hifn$(_slash)
++$(_obj)-$(CONFIG_OCF_IXP4XX)  += ixp4xx$(_slash)
++$(_obj)-$(CONFIG_OCF_TALITOS) += talitos$(_slash)
++$(_obj)-$(CONFIG_OCF_PASEMI)  += pasemi$(_slash)
++$(_obj)-$(CONFIG_OCF_EP80579) += ep80579$(_slash)
++$(_obj)-$(CONFIG_OCF_CRYPTOCTEON) += cryptocteon$(_slash)
++$(_obj)-$(CONFIG_OCF_KIRKWOOD) += kirkwood$(_slash)
++$(_obj)-$(CONFIG_OCF_OCFNULL) += ocfnull$(_slash)
++$(_obj)-$(CONFIG_OCF_C7108) += c7108$(_slash)
++
++ocf-objs := $(OCF_OBJS)
++
++$(list-multi) dummy1: $(ocf-objs)
++	$(LD) -r -o $@ $(ocf-objs)
++
++.PHONY:
++clean:
++	rm -f *.o *.ko .*.o.flags .*.ko.cmd .*.o.cmd .*.mod.o.cmd *.mod.c
++	rm -f */*.o */*.ko */.*.o.cmd */.*.ko.cmd */.*.mod.o.cmd */*.mod.c */.*.o.flags
++
++ifdef TOPDIR
++-include $(TOPDIR)/Rules.make
++endif
++
++#
++# release gen targets
++#
++
++.PHONY: patch
++patch:
++	REL=`date +%Y%m%d`; \
++		patch=ocf-linux-$$REL.patch; \
++		patch24=ocf-linux-24-$$REL.patch; \
++		patch26=ocf-linux-26-$$REL.patch; \
++		( \
++			find . -name Makefile; \
++			find . -name Config.in; \
++			find . -name Kconfig; \
++			find . -name README; \
++			find . -name '*.[ch]' | grep -v '.mod.c'; \
++		) | while read t; do \
++			diff -Nau /dev/null $$t | sed 's?^+++ \./?+++ linux/crypto/ocf/?'; \
++		done > $$patch; \
++		cat patches/linux-2.4.35-ocf.patch $$patch > $$patch24; \
++		cat patches/linux-2.6.33-ocf.patch $$patch > $$patch26
++
++.PHONY: tarball
++tarball:
++	REL=`date +%Y%m%d`; RELDIR=/tmp/ocf-linux-$$REL; \
++		CURDIR=`pwd`; \
++		rm -rf /tmp/ocf-linux-$$REL*; \
++		mkdir -p $$RELDIR/tools; \
++		cp README* $$RELDIR; \
++		cp patches/openss*.patch $$RELDIR; \
++		cp patches/crypto-tools.patch $$RELDIR; \
++		cp tools/[!C]* $$RELDIR/tools; \
++		cd ..; \
++		tar cvf $$RELDIR/ocf-linux.tar \
++					--exclude=CVS \
++					--exclude=.* \
++					--exclude=*.o \
++					--exclude=*.ko \
++					--exclude=*.mod.* \
++					--exclude=README* \
++					--exclude=ocf-*.patch \
++					--exclude=ocf/patches/openss*.patch \
++					--exclude=ocf/patches/crypto-tools.patch \
++					--exclude=ocf/tools \
++					ocf; \
++		gzip -9 $$RELDIR/ocf-linux.tar; \
++		cd /tmp; \
++		tar cvf ocf-linux-$$REL.tar ocf-linux-$$REL; \
++		gzip -9 ocf-linux-$$REL.tar; \
++		cd $$CURDIR/../../user; \
++		rm -rf /tmp/crypto-tools-$$REL*; \
++		tar cvf /tmp/crypto-tools-$$REL.tar \
++					--exclude=CVS \
++					--exclude=.* \
++					--exclude=*.o \
++					--exclude=cryptotest \
++					--exclude=cryptokeytest \
++					crypto-tools; \
++		gzip -9 /tmp/crypto-tools-$$REL.tar
++
+diff --git a/crypto/ocf/criov.c b/crypto/ocf/criov.c
+new file mode 100644
+index 0000000..5fe9040
+--- /dev/null
++++ b/crypto/ocf/criov.c
+@@ -0,0 +1,215 @@
++/*      $OpenBSD: criov.c,v 1.9 2002/01/29 15:48:29 jason Exp $	*/
++
++/*
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Copyright (c) 1999 Theo de Raadt
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in the
++ *   documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *   derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++__FBSDID("$FreeBSD: src/sys/opencrypto/criov.c,v 1.5 2006/06/04 22:15:13 pjd Exp $");
++ */
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/slab.h>
++#include <linux/uio.h>
++#include <linux/skbuff.h>
++#include <linux/kernel.h>
++#include <linux/mm.h>
++#include <asm/io.h>
++
++#include <uio.h>
++#include <crypto/cryptodev.h>
++
++/*
++ * This macro is only for avoiding code duplication, as we need to skip
++ * given number of bytes in the same way in three functions below.
++ */
++#define	CUIO_SKIP()	do {						\
++	KASSERT(off >= 0, ("%s: off %d < 0", __func__, off));		\
++	KASSERT(len >= 0, ("%s: len %d < 0", __func__, len));		\
++	while (off > 0) {						\
++		KASSERT(iol >= 0, ("%s: empty in skip", __func__));	\
++		if (off < iov->iov_len)					\
++			break;						\
++		off -= iov->iov_len;					\
++		iol--;							\
++		iov++;							\
++	}								\
++} while (0)
++
++void
++cuio_copydata(struct uio* uio, int off, int len, caddr_t cp)
++{
++	struct iovec *iov = uio->uio_iov;
++	int iol = uio->uio_iovcnt;
++	unsigned count;
++
++	CUIO_SKIP();
++	while (len > 0) {
++		KASSERT(iol >= 0, ("%s: empty", __func__));
++		count = min((int)(iov->iov_len - off), len);
++		memcpy(cp, ((caddr_t)iov->iov_base) + off, count);
++		len -= count;
++		cp += count;
++		off = 0;
++		iol--;
++		iov++;
++	}
++}
++
++void
++cuio_copyback(struct uio* uio, int off, int len, caddr_t cp)
++{
++	struct iovec *iov = uio->uio_iov;
++	int iol = uio->uio_iovcnt;
++	unsigned count;
++
++	CUIO_SKIP();
++	while (len > 0) {
++		KASSERT(iol >= 0, ("%s: empty", __func__));
++		count = min((int)(iov->iov_len - off), len);
++		memcpy(((caddr_t)iov->iov_base) + off, cp, count);
++		len -= count;
++		cp += count;
++		off = 0;
++		iol--;
++		iov++;
++	}
++}
++
++/*
++ * Return a pointer to iov/offset of location in iovec list.
++ */
++struct iovec *
++cuio_getptr(struct uio *uio, int loc, int *off)
++{
++	struct iovec *iov = uio->uio_iov;
++	int iol = uio->uio_iovcnt;
++
++	while (loc >= 0) {
++		/* Normal end of search */
++		if (loc < iov->iov_len) {
++	    		*off = loc;
++	    		return (iov);
++		}
++
++		loc -= iov->iov_len;
++		if (iol == 0) {
++			if (loc == 0) {
++				/* Point at the end of valid data */
++				*off = iov->iov_len;
++				return (iov);
++			} else
++				return (NULL);
++		} else {
++			iov++, iol--;
++		}
++    	}
++
++	return (NULL);
++}
++
++EXPORT_SYMBOL(cuio_copyback);
++EXPORT_SYMBOL(cuio_copydata);
++EXPORT_SYMBOL(cuio_getptr);
++
++
++static void
++skb_copy_bits_back(struct sk_buff *skb, int offset, caddr_t cp, int len)
++{
++	int i;
++	if (offset < skb_headlen(skb)) {
++		memcpy(skb->data + offset, cp, min_t(int, skb_headlen(skb), len));
++		len -= skb_headlen(skb);
++		cp += skb_headlen(skb);
++	}
++	offset -= skb_headlen(skb);
++	for (i = 0; len > 0 && i < skb_shinfo(skb)->nr_frags; i++) {
++		if (offset < skb_shinfo(skb)->frags[i].size) {
++			memcpy(page_address(skb_shinfo(skb)->frags[i].page) +
++					skb_shinfo(skb)->frags[i].page_offset,
++					cp, min_t(int, skb_shinfo(skb)->frags[i].size, len));
++			len -= skb_shinfo(skb)->frags[i].size;
++			cp += skb_shinfo(skb)->frags[i].size;
++		}
++		offset -= skb_shinfo(skb)->frags[i].size;
++	}
++}
++
++void
++crypto_copyback(int flags, caddr_t buf, int off, int size, caddr_t in)
++{
++
++	if ((flags & CRYPTO_F_SKBUF) != 0)
++		skb_copy_bits_back((struct sk_buff *)buf, off, in, size);
++	else if ((flags & CRYPTO_F_IOV) != 0)
++		cuio_copyback((struct uio *)buf, off, size, in);
++	else
++		bcopy(in, buf + off, size);
++}
++
++void
++crypto_copydata(int flags, caddr_t buf, int off, int size, caddr_t out)
++{
++
++	if ((flags & CRYPTO_F_SKBUF) != 0)
++		skb_copy_bits((struct sk_buff *)buf, off, out, size);
++	else if ((flags & CRYPTO_F_IOV) != 0)
++		cuio_copydata((struct uio *)buf, off, size, out);
++	else
++		bcopy(buf + off, out, size);
++}
++
++int
++crypto_apply(int flags, caddr_t buf, int off, int len,
++    int (*f)(void *, void *, u_int), void *arg)
++{
++#if 0
++	int error;
++
++	if ((flags & CRYPTO_F_SKBUF) != 0)
++		error = XXXXXX((struct mbuf *)buf, off, len, f, arg);
++	else if ((flags & CRYPTO_F_IOV) != 0)
++		error = cuio_apply((struct uio *)buf, off, len, f, arg);
++	else
++		error = (*f)(arg, buf + off, len);
++	return (error);
++#else
++	KASSERT(0, ("crypto_apply not implemented!\n"));
++#endif
++	return 0;
++}
++
++EXPORT_SYMBOL(crypto_copyback);
++EXPORT_SYMBOL(crypto_copydata);
++EXPORT_SYMBOL(crypto_apply);
++
+diff --git a/crypto/ocf/crypto.c b/crypto/ocf/crypto.c
+new file mode 100644
+index 0000000..9e60ac9
+--- /dev/null
++++ b/crypto/ocf/crypto.c
+@@ -0,0 +1,1784 @@
++/*-
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * Copyright (c) 2002-2006 Sam Leffler.  All rights reserved.
++ *
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#if 0
++#include <sys/cdefs.h>
++__FBSDID("$FreeBSD: src/sys/opencrypto/crypto.c,v 1.27 2007/03/21 03:42:51 sam Exp $");
++#endif
++
++/*
++ * Cryptographic Subsystem.
++ *
++ * This code is derived from the Openbsd Cryptographic Framework (OCF)
++ * that has the copyright shown below.  Very little of the original
++ * code remains.
++ */
++/*-
++ * The author of this code is Angelos D. Keromytis (angelos@cis.upenn.edu)
++ *
++ * This code was written by Angelos D. Keromytis in Athens, Greece, in
++ * February 2000. Network Security Technologies Inc. (NSTI) kindly
++ * supported the development of this code.
++ *
++ * Copyright (c) 2000, 2001 Angelos D. Keromytis
++ *
++ * Permission to use, copy, and modify this software with or without fee
++ * is hereby granted, provided that this entire notice is included in
++ * all source code copies of any software which is or includes a copy or
++ * modification of this software.
++ *
++ * THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR
++ * IMPLIED WARRANTY. IN PARTICULAR, NONE OF THE AUTHORS MAKES ANY
++ * REPRESENTATION OR WARRANTY OF ANY KIND CONCERNING THE
++ * MERCHANTABILITY OF THIS SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR
++ * PURPOSE.
++ *
++__FBSDID("$FreeBSD: src/sys/opencrypto/crypto.c,v 1.16 2005/01/07 02:29:16 imp Exp $");
++ */
++
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/wait.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/version.h>
++#include <crypto/cryptodev.h>
++
++/*
++ * keep track of whether or not we have been initialised, a big
++ * issue if we are linked into the kernel and a driver gets started before
++ * us
++ */
++static int crypto_initted = 0;
++
++/*
++ * Crypto drivers register themselves by allocating a slot in the
++ * crypto_drivers table with crypto_get_driverid() and then registering
++ * each algorithm they support with crypto_register() and crypto_kregister().
++ */
++
++/*
++ * lock on driver table
++ * we track its state as spin_is_locked does not do anything on non-SMP boxes
++ */
++static spinlock_t	crypto_drivers_lock;
++static int			crypto_drivers_locked;		/* for non-SMP boxes */
++
++#define	CRYPTO_DRIVER_LOCK() \
++			({ \
++				spin_lock_irqsave(&crypto_drivers_lock, d_flags); \
++			 	crypto_drivers_locked = 1; \
++				dprintk("%s,%d: DRIVER_LOCK()\n", __FILE__, __LINE__); \
++			 })
++#define	CRYPTO_DRIVER_UNLOCK() \
++			({ \
++			 	dprintk("%s,%d: DRIVER_UNLOCK()\n", __FILE__, __LINE__); \
++			 	crypto_drivers_locked = 0; \
++				spin_unlock_irqrestore(&crypto_drivers_lock, d_flags); \
++			 })
++#define	CRYPTO_DRIVER_ASSERT() \
++			({ \
++			 	if (!crypto_drivers_locked) { \
++					dprintk("%s,%d: DRIVER_ASSERT!\n", __FILE__, __LINE__); \
++			 	} \
++			 })
++
++/*
++ * Crypto device/driver capabilities structure.
++ *
++ * Synchronization:
++ * (d) - protected by CRYPTO_DRIVER_LOCK()
++ * (q) - protected by CRYPTO_Q_LOCK()
++ * Not tagged fields are read-only.
++ */
++struct cryptocap {
++	device_t	cc_dev;			/* (d) device/driver */
++	u_int32_t	cc_sessions;		/* (d) # of sessions */
++	u_int32_t	cc_koperations;		/* (d) # os asym operations */
++	/*
++	 * Largest possible operator length (in bits) for each type of
++	 * encryption algorithm. XXX not used
++	 */
++	u_int16_t	cc_max_op_len[CRYPTO_ALGORITHM_MAX + 1];
++	u_int8_t	cc_alg[CRYPTO_ALGORITHM_MAX + 1];
++	u_int8_t	cc_kalg[CRK_ALGORITHM_MAX + 1];
++
++	int		cc_flags;		/* (d) flags */
++#define CRYPTOCAP_F_CLEANUP	0x80000000	/* needs resource cleanup */
++	int		cc_qblocked;		/* (q) symmetric q blocked */
++	int		cc_kqblocked;		/* (q) asymmetric q blocked */
++
++	int		cc_unqblocked;		/* (q) symmetric q blocked */
++	int		cc_unkqblocked;		/* (q) asymmetric q blocked */
++};
++static struct cryptocap *crypto_drivers = NULL;
++static int crypto_drivers_num = 0;
++
++/*
++ * There are two queues for crypto requests; one for symmetric (e.g.
++ * cipher) operations and one for asymmetric (e.g. MOD)operations.
++ * A single mutex is used to lock access to both queues.  We could
++ * have one per-queue but having one simplifies handling of block/unblock
++ * operations.
++ */
++static	int crp_sleep = 0;
++static LIST_HEAD(crp_q);		/* request queues */
++static LIST_HEAD(crp_kq);
++
++static spinlock_t crypto_q_lock;
++
++int crypto_all_qblocked = 0;  /* protect with Q_LOCK */
++module_param(crypto_all_qblocked, int, 0444);
++MODULE_PARM_DESC(crypto_all_qblocked, "Are all crypto queues blocked");
++
++int crypto_all_kqblocked = 0; /* protect with Q_LOCK */
++module_param(crypto_all_kqblocked, int, 0444);
++MODULE_PARM_DESC(crypto_all_kqblocked, "Are all asym crypto queues blocked");
++
++#define	CRYPTO_Q_LOCK() \
++			({ \
++				spin_lock_irqsave(&crypto_q_lock, q_flags); \
++			 	dprintk("%s,%d: Q_LOCK()\n", __FILE__, __LINE__); \
++			 })
++#define	CRYPTO_Q_UNLOCK() \
++			({ \
++			 	dprintk("%s,%d: Q_UNLOCK()\n", __FILE__, __LINE__); \
++				spin_unlock_irqrestore(&crypto_q_lock, q_flags); \
++			 })
++
++/*
++ * There are two queues for processing completed crypto requests; one
++ * for the symmetric and one for the asymmetric ops.  We only need one
++ * but have two to avoid type futzing (cryptop vs. cryptkop).  A single
++ * mutex is used to lock access to both queues.  Note that this lock
++ * must be separate from the lock on request queues to insure driver
++ * callbacks don't generate lock order reversals.
++ */
++static LIST_HEAD(crp_ret_q);		/* callback queues */
++static LIST_HEAD(crp_ret_kq);
++
++static spinlock_t crypto_ret_q_lock;
++#define	CRYPTO_RETQ_LOCK() \
++			({ \
++				spin_lock_irqsave(&crypto_ret_q_lock, r_flags); \
++				dprintk("%s,%d: RETQ_LOCK\n", __FILE__, __LINE__); \
++			 })
++#define	CRYPTO_RETQ_UNLOCK() \
++			({ \
++			 	dprintk("%s,%d: RETQ_UNLOCK\n", __FILE__, __LINE__); \
++				spin_unlock_irqrestore(&crypto_ret_q_lock, r_flags); \
++			 })
++#define	CRYPTO_RETQ_EMPTY()	(list_empty(&crp_ret_q) && list_empty(&crp_ret_kq))
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
++static kmem_cache_t *cryptop_zone;
++static kmem_cache_t *cryptodesc_zone;
++#else
++static struct kmem_cache *cryptop_zone;
++static struct kmem_cache *cryptodesc_zone;
++#endif
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)
++#include <linux/sched.h>
++#define	kill_proc(p,s,v)	send_sig(s,find_task_by_vpid(p),0)
++#endif
++
++#define debug crypto_debug
++int crypto_debug = 0;
++module_param(crypto_debug, int, 0644);
++MODULE_PARM_DESC(crypto_debug, "Enable debug");
++EXPORT_SYMBOL(crypto_debug);
++
++/*
++ * Maximum number of outstanding crypto requests before we start
++ * failing requests.  We need this to prevent DOS when too many
++ * requests are arriving for us to keep up.  Otherwise we will
++ * run the system out of memory.  Since crypto is slow,  we are
++ * usually the bottleneck that needs to say, enough is enough.
++ *
++ * We cannot print errors when this condition occurs,  we are already too
++ * slow,  printing anything will just kill us
++ */
++
++static int crypto_q_cnt = 0;
++module_param(crypto_q_cnt, int, 0444);
++MODULE_PARM_DESC(crypto_q_cnt,
++		"Current number of outstanding crypto requests");
++
++static int crypto_q_max = 1000;
++module_param(crypto_q_max, int, 0644);
++MODULE_PARM_DESC(crypto_q_max,
++		"Maximum number of outstanding crypto requests");
++
++#define bootverbose crypto_verbose
++static int crypto_verbose = 0;
++module_param(crypto_verbose, int, 0644);
++MODULE_PARM_DESC(crypto_verbose,
++		"Enable verbose crypto startup");
++
++int	crypto_usercrypto = 1;	/* userland may do crypto reqs */
++module_param(crypto_usercrypto, int, 0644);
++MODULE_PARM_DESC(crypto_usercrypto,
++	   "Enable/disable user-mode access to crypto support");
++
++int	crypto_userasymcrypto = 1;	/* userland may do asym crypto reqs */
++module_param(crypto_userasymcrypto, int, 0644);
++MODULE_PARM_DESC(crypto_userasymcrypto,
++	   "Enable/disable user-mode access to asymmetric crypto support");
++
++int	crypto_devallowsoft = 0;	/* only use hardware crypto */
++module_param(crypto_devallowsoft, int, 0644);
++MODULE_PARM_DESC(crypto_devallowsoft,
++	   "Enable/disable use of software crypto support");
++
++/*
++ * This parameter controls the maximum number of crypto operations to 
++ * do consecutively in the crypto kernel thread before scheduling to allow 
++ * other processes to run. Without it, it is possible to get into a 
++ * situation where the crypto thread never allows any other processes to run.
++ * Default to 1000 which should be less than one second.
++ */
++static int crypto_max_loopcount = 1000;
++module_param(crypto_max_loopcount, int, 0644);
++MODULE_PARM_DESC(crypto_max_loopcount,
++	   "Maximum number of crypto ops to do before yielding to other processes");
++
++static pid_t	cryptoproc = (pid_t) -1;
++static struct	completion cryptoproc_exited;
++static DECLARE_WAIT_QUEUE_HEAD(cryptoproc_wait);
++static pid_t	cryptoretproc = (pid_t) -1;
++static struct	completion cryptoretproc_exited;
++static DECLARE_WAIT_QUEUE_HEAD(cryptoretproc_wait);
++
++static	int crypto_proc(void *arg);
++static	int crypto_ret_proc(void *arg);
++static	int crypto_invoke(struct cryptocap *cap, struct cryptop *crp, int hint);
++static	int crypto_kinvoke(struct cryptkop *krp, int flags);
++static	void crypto_exit(void);
++static  int crypto_init(void);
++
++static	struct cryptostats cryptostats;
++
++static struct cryptocap *
++crypto_checkdriver(u_int32_t hid)
++{
++	if (crypto_drivers == NULL)
++		return NULL;
++	return (hid >= crypto_drivers_num ? NULL : &crypto_drivers[hid]);
++}
++
++/*
++ * Compare a driver's list of supported algorithms against another
++ * list; return non-zero if all algorithms are supported.
++ */
++static int
++driver_suitable(const struct cryptocap *cap, const struct cryptoini *cri)
++{
++	const struct cryptoini *cr;
++
++	/* See if all the algorithms are supported. */
++	for (cr = cri; cr; cr = cr->cri_next)
++		if (cap->cc_alg[cr->cri_alg] == 0)
++			return 0;
++	return 1;
++}
++
++/*
++ * Select a driver for a new session that supports the specified
++ * algorithms and, optionally, is constrained according to the flags.
++ * The algorithm we use here is pretty stupid; just use the
++ * first driver that supports all the algorithms we need. If there
++ * are multiple drivers we choose the driver with the fewest active
++ * sessions.  We prefer hardware-backed drivers to software ones.
++ *
++ * XXX We need more smarts here (in real life too, but that's
++ * XXX another story altogether).
++ */
++static struct cryptocap *
++crypto_select_driver(const struct cryptoini *cri, int flags)
++{
++	struct cryptocap *cap, *best;
++	int match, hid;
++
++	CRYPTO_DRIVER_ASSERT();
++
++	/*
++	 * Look first for hardware crypto devices if permitted.
++	 */
++	if (flags & CRYPTOCAP_F_HARDWARE)
++		match = CRYPTOCAP_F_HARDWARE;
++	else
++		match = CRYPTOCAP_F_SOFTWARE;
++	best = NULL;
++again:
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		cap = &crypto_drivers[hid];
++		/*
++		 * If it's not initialized, is in the process of
++		 * going away, or is not appropriate (hardware
++		 * or software based on match), then skip.
++		 */
++		if (cap->cc_dev == NULL ||
++		    (cap->cc_flags & CRYPTOCAP_F_CLEANUP) ||
++		    (cap->cc_flags & match) == 0)
++			continue;
++
++		/* verify all the algorithms are supported. */
++		if (driver_suitable(cap, cri)) {
++			if (best == NULL ||
++			    cap->cc_sessions < best->cc_sessions)
++				best = cap;
++		}
++	}
++	if (best != NULL)
++		return best;
++	if (match == CRYPTOCAP_F_HARDWARE && (flags & CRYPTOCAP_F_SOFTWARE)) {
++		/* sort of an Algol 68-style for loop */
++		match = CRYPTOCAP_F_SOFTWARE;
++		goto again;
++	}
++	return best;
++}
++
++/*
++ * Create a new session.  The crid argument specifies a crypto
++ * driver to use or constraints on a driver to select (hardware
++ * only, software only, either).  Whatever driver is selected
++ * must be capable of the requested crypto algorithms.
++ */
++int
++crypto_newsession(u_int64_t *sid, struct cryptoini *cri, int crid)
++{
++	struct cryptocap *cap;
++	u_int32_t hid, lid;
++	int err;
++	unsigned long d_flags;
++
++	CRYPTO_DRIVER_LOCK();
++	if ((crid & (CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE)) == 0) {
++		/*
++		 * Use specified driver; verify it is capable.
++		 */
++		cap = crypto_checkdriver(crid);
++		if (cap != NULL && !driver_suitable(cap, cri))
++			cap = NULL;
++	} else {
++		/*
++		 * No requested driver; select based on crid flags.
++		 */
++		cap = crypto_select_driver(cri, crid);
++		/*
++		 * if NULL then can't do everything in one session.
++		 * XXX Fix this. We need to inject a "virtual" session
++		 * XXX layer right about here.
++		 */
++	}
++	if (cap != NULL) {
++		/* Call the driver initialization routine. */
++		hid = cap - crypto_drivers;
++		lid = hid;		/* Pass the driver ID. */
++		cap->cc_sessions++;
++		CRYPTO_DRIVER_UNLOCK();
++		err = CRYPTODEV_NEWSESSION(cap->cc_dev, &lid, cri);
++		CRYPTO_DRIVER_LOCK();
++		if (err == 0) {
++			(*sid) = (cap->cc_flags & 0xff000000)
++			       | (hid & 0x00ffffff);
++			(*sid) <<= 32;
++			(*sid) |= (lid & 0xffffffff);
++		} else
++			cap->cc_sessions--;
++	} else
++		err = EINVAL;
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++static void
++crypto_remove(struct cryptocap *cap)
++{
++	CRYPTO_DRIVER_ASSERT();
++	if (cap->cc_sessions == 0 && cap->cc_koperations == 0)
++		bzero(cap, sizeof(*cap));
++}
++
++/*
++ * Delete an existing session (or a reserved session on an unregistered
++ * driver).
++ */
++int
++crypto_freesession(u_int64_t sid)
++{
++	struct cryptocap *cap;
++	u_int32_t hid;
++	int err = 0;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++
++	if (crypto_drivers == NULL) {
++		err = EINVAL;
++		goto done;
++	}
++
++	/* Determine two IDs. */
++	hid = CRYPTO_SESID2HID(sid);
++
++	if (hid >= crypto_drivers_num) {
++		dprintk("%s - INVALID DRIVER NUM %d\n", __FUNCTION__, hid);
++		err = ENOENT;
++		goto done;
++	}
++	cap = &crypto_drivers[hid];
++
++	if (cap->cc_dev) {
++		CRYPTO_DRIVER_UNLOCK();
++		/* Call the driver cleanup routine, if available, unlocked. */
++		err = CRYPTODEV_FREESESSION(cap->cc_dev, sid);
++		CRYPTO_DRIVER_LOCK();
++	}
++
++	if (cap->cc_sessions)
++		cap->cc_sessions--;
++
++	if (cap->cc_flags & CRYPTOCAP_F_CLEANUP)
++		crypto_remove(cap);
++
++done:
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++/*
++ * Return an unused driver id.  Used by drivers prior to registering
++ * support for the algorithms they handle.
++ */
++int32_t
++crypto_get_driverid(device_t dev, int flags)
++{
++	struct cryptocap *newdrv;
++	int i;
++	unsigned long d_flags;
++
++	if ((flags & (CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE)) == 0) {
++		printf("%s: no flags specified when registering driver\n",
++		    device_get_nameunit(dev));
++		return -1;
++	}
++
++	CRYPTO_DRIVER_LOCK();
++
++	for (i = 0; i < crypto_drivers_num; i++) {
++		if (crypto_drivers[i].cc_dev == NULL &&
++		    (crypto_drivers[i].cc_flags & CRYPTOCAP_F_CLEANUP) == 0) {
++			break;
++		}
++	}
++
++	/* Out of entries, allocate some more. */
++	if (i == crypto_drivers_num) {
++		/* Be careful about wrap-around. */
++		if (2 * crypto_drivers_num <= crypto_drivers_num) {
++			CRYPTO_DRIVER_UNLOCK();
++			printk("crypto: driver count wraparound!\n");
++			return -1;
++		}
++
++		newdrv = kmalloc(2 * crypto_drivers_num * sizeof(struct cryptocap),
++				GFP_KERNEL);
++		if (newdrv == NULL) {
++			CRYPTO_DRIVER_UNLOCK();
++			printk("crypto: no space to expand driver table!\n");
++			return -1;
++		}
++
++		memcpy(newdrv, crypto_drivers,
++				crypto_drivers_num * sizeof(struct cryptocap));
++		memset(&newdrv[crypto_drivers_num], 0,
++				crypto_drivers_num * sizeof(struct cryptocap));
++
++		crypto_drivers_num *= 2;
++
++		kfree(crypto_drivers);
++		crypto_drivers = newdrv;
++	}
++
++	/* NB: state is zero'd on free */
++	crypto_drivers[i].cc_sessions = 1;	/* Mark */
++	crypto_drivers[i].cc_dev = dev;
++	crypto_drivers[i].cc_flags = flags;
++	if (bootverbose)
++		printf("crypto: assign %s driver id %u, flags %u\n",
++		    device_get_nameunit(dev), i, flags);
++
++	CRYPTO_DRIVER_UNLOCK();
++
++	return i;
++}
++
++/*
++ * Lookup a driver by name.  We match against the full device
++ * name and unit, and against just the name.  The latter gives
++ * us a simple widlcarding by device name.  On success return the
++ * driver/hardware identifier; otherwise return -1.
++ */
++int
++crypto_find_driver(const char *match)
++{
++	int i, len = strlen(match);
++	unsigned long d_flags;
++
++	CRYPTO_DRIVER_LOCK();
++	for (i = 0; i < crypto_drivers_num; i++) {
++		device_t dev = crypto_drivers[i].cc_dev;
++		if (dev == NULL ||
++		    (crypto_drivers[i].cc_flags & CRYPTOCAP_F_CLEANUP))
++			continue;
++		if (strncmp(match, device_get_nameunit(dev), len) == 0 ||
++		    strncmp(match, device_get_name(dev), len) == 0)
++			break;
++	}
++	CRYPTO_DRIVER_UNLOCK();
++	return i < crypto_drivers_num ? i : -1;
++}
++
++/*
++ * Return the device_t for the specified driver or NULL
++ * if the driver identifier is invalid.
++ */
++device_t
++crypto_find_device_byhid(int hid)
++{
++	struct cryptocap *cap = crypto_checkdriver(hid);
++	return cap != NULL ? cap->cc_dev : NULL;
++}
++
++/*
++ * Return the device/driver capabilities.
++ */
++int
++crypto_getcaps(int hid)
++{
++	struct cryptocap *cap = crypto_checkdriver(hid);
++	return cap != NULL ? cap->cc_flags : 0;
++}
++
++/*
++ * Register support for a key-related algorithm.  This routine
++ * is called once for each algorithm supported a driver.
++ */
++int
++crypto_kregister(u_int32_t driverid, int kalg, u_int32_t flags)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL &&
++	    (CRK_ALGORITM_MIN <= kalg && kalg <= CRK_ALGORITHM_MAX)) {
++		/*
++		 * XXX Do some performance testing to determine placing.
++		 * XXX We probably need an auxiliary data structure that
++		 * XXX describes relative performances.
++		 */
++
++		cap->cc_kalg[kalg] = flags | CRYPTO_ALG_FLAG_SUPPORTED;
++		if (bootverbose)
++			printf("crypto: %s registers key alg %u flags %u\n"
++				, device_get_nameunit(cap->cc_dev)
++				, kalg
++				, flags
++			);
++		err = 0;
++	} else
++		err = EINVAL;
++
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++/*
++ * Register support for a non-key-related algorithm.  This routine
++ * is called once for each such algorithm supported by a driver.
++ */
++int
++crypto_register(u_int32_t driverid, int alg, u_int16_t maxoplen,
++    u_int32_t flags)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long d_flags;
++
++	dprintk("%s(id=0x%x, alg=%d, maxoplen=%d, flags=0x%x)\n", __FUNCTION__,
++			driverid, alg, maxoplen, flags);
++
++	CRYPTO_DRIVER_LOCK();
++
++	cap = crypto_checkdriver(driverid);
++	/* NB: algorithms are in the range [1..max] */
++	if (cap != NULL &&
++	    (CRYPTO_ALGORITHM_MIN <= alg && alg <= CRYPTO_ALGORITHM_MAX)) {
++		/*
++		 * XXX Do some performance testing to determine placing.
++		 * XXX We probably need an auxiliary data structure that
++		 * XXX describes relative performances.
++		 */
++
++		cap->cc_alg[alg] = flags | CRYPTO_ALG_FLAG_SUPPORTED;
++		cap->cc_max_op_len[alg] = maxoplen;
++		if (bootverbose)
++			printf("crypto: %s registers alg %u flags %u maxoplen %u\n"
++				, device_get_nameunit(cap->cc_dev)
++				, alg
++				, flags
++				, maxoplen
++			);
++		cap->cc_sessions = 0;		/* Unmark */
++		err = 0;
++	} else
++		err = EINVAL;
++
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++static void
++driver_finis(struct cryptocap *cap)
++{
++	u_int32_t ses, kops;
++
++	CRYPTO_DRIVER_ASSERT();
++
++	ses = cap->cc_sessions;
++	kops = cap->cc_koperations;
++	bzero(cap, sizeof(*cap));
++	if (ses != 0 || kops != 0) {
++		/*
++		 * If there are pending sessions,
++		 * just mark as invalid.
++		 */
++		cap->cc_flags |= CRYPTOCAP_F_CLEANUP;
++		cap->cc_sessions = ses;
++		cap->cc_koperations = kops;
++	}
++}
++
++/*
++ * Unregister a crypto driver. If there are pending sessions using it,
++ * leave enough information around so that subsequent calls using those
++ * sessions will correctly detect the driver has been unregistered and
++ * reroute requests.
++ */
++int
++crypto_unregister(u_int32_t driverid, int alg)
++{
++	struct cryptocap *cap;
++	int i, err;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL &&
++	    (CRYPTO_ALGORITHM_MIN <= alg && alg <= CRYPTO_ALGORITHM_MAX) &&
++	    cap->cc_alg[alg] != 0) {
++		cap->cc_alg[alg] = 0;
++		cap->cc_max_op_len[alg] = 0;
++
++		/* Was this the last algorithm ? */
++		for (i = 1; i <= CRYPTO_ALGORITHM_MAX; i++)
++			if (cap->cc_alg[i] != 0)
++				break;
++
++		if (i == CRYPTO_ALGORITHM_MAX + 1)
++			driver_finis(cap);
++		err = 0;
++	} else
++		err = EINVAL;
++	CRYPTO_DRIVER_UNLOCK();
++	return err;
++}
++
++/*
++ * Unregister all algorithms associated with a crypto driver.
++ * If there are pending sessions using it, leave enough information
++ * around so that subsequent calls using those sessions will
++ * correctly detect the driver has been unregistered and reroute
++ * requests.
++ */
++int
++crypto_unregister_all(u_int32_t driverid)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	CRYPTO_DRIVER_LOCK();
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL) {
++		driver_finis(cap);
++		err = 0;
++	} else
++		err = EINVAL;
++	CRYPTO_DRIVER_UNLOCK();
++
++	return err;
++}
++
++/*
++ * Clear blockage on a driver.  The what parameter indicates whether
++ * the driver is now ready for cryptop's and/or cryptokop's.
++ */
++int
++crypto_unblock(u_int32_t driverid, int what)
++{
++	struct cryptocap *cap;
++	int err;
++	unsigned long q_flags;
++
++	CRYPTO_Q_LOCK();
++	cap = crypto_checkdriver(driverid);
++	if (cap != NULL) {
++		if (what & CRYPTO_SYMQ) {
++			cap->cc_qblocked = 0;
++			cap->cc_unqblocked = 0;
++			crypto_all_qblocked = 0;
++		}
++		if (what & CRYPTO_ASYMQ) {
++			cap->cc_kqblocked = 0;
++			cap->cc_unkqblocked = 0;
++			crypto_all_kqblocked = 0;
++		}
++		if (crp_sleep)
++			wake_up_interruptible(&cryptoproc_wait);
++		err = 0;
++	} else
++		err = EINVAL;
++	CRYPTO_Q_UNLOCK(); //DAVIDM should this be a driver lock
++
++	return err;
++}
++
++/*
++ * Add a crypto request to a queue, to be processed by the kernel thread.
++ */
++int
++crypto_dispatch(struct cryptop *crp)
++{
++	struct cryptocap *cap;
++	int result = -1;
++	unsigned long q_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	cryptostats.cs_ops++;
++
++	CRYPTO_Q_LOCK();
++	if (crypto_q_cnt >= crypto_q_max) {
++		CRYPTO_Q_UNLOCK();
++		cryptostats.cs_drops++;
++		return ENOMEM;
++	}
++	crypto_q_cnt++;
++
++	/* make sure we are starting a fresh run on this crp. */
++	crp->crp_flags &= ~CRYPTO_F_DONE;
++	crp->crp_etype = 0;
++
++	/*
++	 * Caller marked the request to be processed immediately; dispatch
++	 * it directly to the driver unless the driver is currently blocked.
++	 */
++	if ((crp->crp_flags & CRYPTO_F_BATCH) == 0) {
++		int hid = CRYPTO_SESID2HID(crp->crp_sid);
++		cap = crypto_checkdriver(hid);
++		/* Driver cannot disappear when there is an active session. */
++		KASSERT(cap != NULL, ("%s: Driver disappeared.", __func__));
++		if (!cap->cc_qblocked) {
++			crypto_all_qblocked = 0;
++			crypto_drivers[hid].cc_unqblocked = 1;
++			CRYPTO_Q_UNLOCK();
++			result = crypto_invoke(cap, crp, 0);
++			CRYPTO_Q_LOCK();
++			if (result == ERESTART)
++				if (crypto_drivers[hid].cc_unqblocked)
++					crypto_drivers[hid].cc_qblocked = 1;
++			crypto_drivers[hid].cc_unqblocked = 0;
++		}
++	}
++	if (result == ERESTART) {
++		/*
++		 * The driver ran out of resources, mark the
++		 * driver ``blocked'' for cryptop's and put
++		 * the request back in the queue.  It would
++		 * best to put the request back where we got
++		 * it but that's hard so for now we put it
++		 * at the front.  This should be ok; putting
++		 * it at the end does not work.
++		 */
++		list_add(&crp->crp_next, &crp_q);
++		cryptostats.cs_blocks++;
++		result = 0;
++	} else if (result == -1) {
++		TAILQ_INSERT_TAIL(&crp_q, crp, crp_next);
++		result = 0;
++	}
++	if (crp_sleep)
++		wake_up_interruptible(&cryptoproc_wait);
++	CRYPTO_Q_UNLOCK();
++	return result;
++}
++
++/*
++ * Add an asymetric crypto request to a queue,
++ * to be processed by the kernel thread.
++ */
++int
++crypto_kdispatch(struct cryptkop *krp)
++{
++	int error;
++	unsigned long q_flags;
++
++	cryptostats.cs_kops++;
++
++	error = crypto_kinvoke(krp, krp->krp_crid);
++	if (error == ERESTART) {
++		CRYPTO_Q_LOCK();
++		TAILQ_INSERT_TAIL(&crp_kq, krp, krp_next);
++		if (crp_sleep)
++			wake_up_interruptible(&cryptoproc_wait);
++		CRYPTO_Q_UNLOCK();
++		error = 0;
++	}
++	return error;
++}
++
++/*
++ * Verify a driver is suitable for the specified operation.
++ */
++static __inline int
++kdriver_suitable(const struct cryptocap *cap, const struct cryptkop *krp)
++{
++	return (cap->cc_kalg[krp->krp_op] & CRYPTO_ALG_FLAG_SUPPORTED) != 0;
++}
++
++/*
++ * Select a driver for an asym operation.  The driver must
++ * support the necessary algorithm.  The caller can constrain
++ * which device is selected with the flags parameter.  The
++ * algorithm we use here is pretty stupid; just use the first
++ * driver that supports the algorithms we need. If there are
++ * multiple suitable drivers we choose the driver with the
++ * fewest active operations.  We prefer hardware-backed
++ * drivers to software ones when either may be used.
++ */
++static struct cryptocap *
++crypto_select_kdriver(const struct cryptkop *krp, int flags)
++{
++	struct cryptocap *cap, *best, *blocked;
++	int match, hid;
++
++	CRYPTO_DRIVER_ASSERT();
++
++	/*
++	 * Look first for hardware crypto devices if permitted.
++	 */
++	if (flags & CRYPTOCAP_F_HARDWARE)
++		match = CRYPTOCAP_F_HARDWARE;
++	else
++		match = CRYPTOCAP_F_SOFTWARE;
++	best = NULL;
++	blocked = NULL;
++again:
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		cap = &crypto_drivers[hid];
++		/*
++		 * If it's not initialized, is in the process of
++		 * going away, or is not appropriate (hardware
++		 * or software based on match), then skip.
++		 */
++		if (cap->cc_dev == NULL ||
++		    (cap->cc_flags & CRYPTOCAP_F_CLEANUP) ||
++		    (cap->cc_flags & match) == 0)
++			continue;
++
++		/* verify all the algorithms are supported. */
++		if (kdriver_suitable(cap, krp)) {
++			if (best == NULL ||
++			    cap->cc_koperations < best->cc_koperations)
++				best = cap;
++		}
++	}
++	if (best != NULL)
++		return best;
++	if (match == CRYPTOCAP_F_HARDWARE && (flags & CRYPTOCAP_F_SOFTWARE)) {
++		/* sort of an Algol 68-style for loop */
++		match = CRYPTOCAP_F_SOFTWARE;
++		goto again;
++	}
++	return best;
++}
++
++/*
++ * Dispatch an assymetric crypto request.
++ */
++static int
++crypto_kinvoke(struct cryptkop *krp, int crid)
++{
++	struct cryptocap *cap = NULL;
++	int error;
++	unsigned long d_flags;
++
++	KASSERT(krp != NULL, ("%s: krp == NULL", __func__));
++	KASSERT(krp->krp_callback != NULL,
++	    ("%s: krp->crp_callback == NULL", __func__));
++
++	CRYPTO_DRIVER_LOCK();
++	if ((crid & (CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE)) == 0) {
++		cap = crypto_checkdriver(crid);
++		if (cap != NULL) {
++			/*
++			 * Driver present, it must support the necessary
++			 * algorithm and, if s/w drivers are excluded,
++			 * it must be registered as hardware-backed.
++			 */
++			if (!kdriver_suitable(cap, krp) ||
++			    (!crypto_devallowsoft &&
++			     (cap->cc_flags & CRYPTOCAP_F_HARDWARE) == 0))
++				cap = NULL;
++		}
++	} else {
++		/*
++		 * No requested driver; select based on crid flags.
++		 */
++		if (!crypto_devallowsoft)	/* NB: disallow s/w drivers */
++			crid &= ~CRYPTOCAP_F_SOFTWARE;
++		cap = crypto_select_kdriver(krp, crid);
++	}
++	if (cap != NULL && !cap->cc_kqblocked) {
++		krp->krp_hid = cap - crypto_drivers;
++		cap->cc_koperations++;
++		CRYPTO_DRIVER_UNLOCK();
++		error = CRYPTODEV_KPROCESS(cap->cc_dev, krp, 0);
++		CRYPTO_DRIVER_LOCK();
++		if (error == ERESTART) {
++			cap->cc_koperations--;
++			CRYPTO_DRIVER_UNLOCK();
++			return (error);
++		}
++		/* return the actual device used */
++		krp->krp_crid = krp->krp_hid;
++	} else {
++		/*
++		 * NB: cap is !NULL if device is blocked; in
++		 *     that case return ERESTART so the operation
++		 *     is resubmitted if possible.
++		 */
++		error = (cap == NULL) ? ENODEV : ERESTART;
++	}
++	CRYPTO_DRIVER_UNLOCK();
++
++	if (error) {
++		krp->krp_status = error;
++		crypto_kdone(krp);
++	}
++	return 0;
++}
++
++
++/*
++ * Dispatch a crypto request to the appropriate crypto devices.
++ */
++static int
++crypto_invoke(struct cryptocap *cap, struct cryptop *crp, int hint)
++{
++	KASSERT(crp != NULL, ("%s: crp == NULL", __func__));
++	KASSERT(crp->crp_callback != NULL,
++	    ("%s: crp->crp_callback == NULL", __func__));
++	KASSERT(crp->crp_desc != NULL, ("%s: crp->crp_desc == NULL", __func__));
++
++	dprintk("%s()\n", __FUNCTION__);
++
++#ifdef CRYPTO_TIMING
++	if (crypto_timing)
++		crypto_tstat(&cryptostats.cs_invoke, &crp->crp_tstamp);
++#endif
++	if (cap->cc_flags & CRYPTOCAP_F_CLEANUP) {
++		struct cryptodesc *crd;
++		u_int64_t nid;
++
++		/*
++		 * Driver has unregistered; migrate the session and return
++		 * an error to the caller so they'll resubmit the op.
++		 *
++		 * XXX: What if there are more already queued requests for this
++		 *      session?
++		 */
++		crypto_freesession(crp->crp_sid);
++
++		for (crd = crp->crp_desc; crd->crd_next; crd = crd->crd_next)
++			crd->CRD_INI.cri_next = &(crd->crd_next->CRD_INI);
++
++		/* XXX propagate flags from initial session? */
++		if (crypto_newsession(&nid, &(crp->crp_desc->CRD_INI),
++		    CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE) == 0)
++			crp->crp_sid = nid;
++
++		crp->crp_etype = EAGAIN;
++		crypto_done(crp);
++		return 0;
++	} else {
++		/*
++		 * Invoke the driver to process the request.
++		 */
++		return CRYPTODEV_PROCESS(cap->cc_dev, crp, hint);
++	}
++}
++
++/*
++ * Release a set of crypto descriptors.
++ */
++void
++crypto_freereq(struct cryptop *crp)
++{
++	struct cryptodesc *crd;
++
++	if (crp == NULL)
++		return;
++
++#ifdef DIAGNOSTIC
++	{
++		struct cryptop *crp2;
++		unsigned long q_flags;
++
++		CRYPTO_Q_LOCK();
++		TAILQ_FOREACH(crp2, &crp_q, crp_next) {
++			KASSERT(crp2 != crp,
++			    ("Freeing cryptop from the crypto queue (%p).",
++			    crp));
++		}
++		CRYPTO_Q_UNLOCK();
++		CRYPTO_RETQ_LOCK();
++		TAILQ_FOREACH(crp2, &crp_ret_q, crp_next) {
++			KASSERT(crp2 != crp,
++			    ("Freeing cryptop from the return queue (%p).",
++			    crp));
++		}
++		CRYPTO_RETQ_UNLOCK();
++	}
++#endif
++
++	while ((crd = crp->crp_desc) != NULL) {
++		crp->crp_desc = crd->crd_next;
++		kmem_cache_free(cryptodesc_zone, crd);
++	}
++	kmem_cache_free(cryptop_zone, crp);
++}
++
++/*
++ * Acquire a set of crypto descriptors.
++ */
++struct cryptop *
++crypto_getreq(int num)
++{
++	struct cryptodesc *crd;
++	struct cryptop *crp;
++
++	crp = kmem_cache_alloc(cryptop_zone, SLAB_ATOMIC);
++	if (crp != NULL) {
++		memset(crp, 0, sizeof(*crp));
++		INIT_LIST_HEAD(&crp->crp_next);
++		init_waitqueue_head(&crp->crp_waitq);
++		while (num--) {
++			crd = kmem_cache_alloc(cryptodesc_zone, SLAB_ATOMIC);
++			if (crd == NULL) {
++				crypto_freereq(crp);
++				return NULL;
++			}
++			memset(crd, 0, sizeof(*crd));
++			crd->crd_next = crp->crp_desc;
++			crp->crp_desc = crd;
++		}
++	}
++	return crp;
++}
++
++/*
++ * Invoke the callback on behalf of the driver.
++ */
++void
++crypto_done(struct cryptop *crp)
++{
++	unsigned long q_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if ((crp->crp_flags & CRYPTO_F_DONE) == 0) {
++		crp->crp_flags |= CRYPTO_F_DONE;
++		CRYPTO_Q_LOCK();
++		crypto_q_cnt--;
++		CRYPTO_Q_UNLOCK();
++	} else
++		printk("crypto: crypto_done op already done, flags 0x%x",
++				crp->crp_flags);
++	if (crp->crp_etype != 0)
++		cryptostats.cs_errs++;
++	/*
++	 * CBIMM means unconditionally do the callback immediately;
++	 * CBIFSYNC means do the callback immediately only if the
++	 * operation was done synchronously.  Both are used to avoid
++	 * doing extraneous context switches; the latter is mostly
++	 * used with the software crypto driver.
++	 */
++	if ((crp->crp_flags & CRYPTO_F_CBIMM) ||
++	    ((crp->crp_flags & CRYPTO_F_CBIFSYNC) &&
++	     (CRYPTO_SESID2CAPS(crp->crp_sid) & CRYPTOCAP_F_SYNC))) {
++		/*
++		 * Do the callback directly.  This is ok when the
++		 * callback routine does very little (e.g. the
++		 * /dev/crypto callback method just does a wakeup).
++		 */
++		crp->crp_callback(crp);
++	} else {
++		unsigned long r_flags;
++		/*
++		 * Normal case; queue the callback for the thread.
++		 */
++		CRYPTO_RETQ_LOCK();
++		if (CRYPTO_RETQ_EMPTY())
++			wake_up_interruptible(&cryptoretproc_wait);/* shared wait channel */
++		TAILQ_INSERT_TAIL(&crp_ret_q, crp, crp_next);
++		CRYPTO_RETQ_UNLOCK();
++	}
++}
++
++/*
++ * Invoke the callback on behalf of the driver.
++ */
++void
++crypto_kdone(struct cryptkop *krp)
++{
++	struct cryptocap *cap;
++	unsigned long d_flags;
++
++	if ((krp->krp_flags & CRYPTO_KF_DONE) != 0)
++		printk("crypto: crypto_kdone op already done, flags 0x%x",
++				krp->krp_flags);
++	krp->krp_flags |= CRYPTO_KF_DONE;
++	if (krp->krp_status != 0)
++		cryptostats.cs_kerrs++;
++
++	CRYPTO_DRIVER_LOCK();
++	/* XXX: What if driver is loaded in the meantime? */
++	if (krp->krp_hid < crypto_drivers_num) {
++		cap = &crypto_drivers[krp->krp_hid];
++		cap->cc_koperations--;
++		KASSERT(cap->cc_koperations >= 0, ("cc_koperations < 0"));
++		if (cap->cc_flags & CRYPTOCAP_F_CLEANUP)
++			crypto_remove(cap);
++	}
++	CRYPTO_DRIVER_UNLOCK();
++
++	/*
++	 * CBIMM means unconditionally do the callback immediately;
++	 * This is used to avoid doing extraneous context switches
++	 */
++	if ((krp->krp_flags & CRYPTO_KF_CBIMM)) {
++		/*
++		 * Do the callback directly.  This is ok when the
++		 * callback routine does very little (e.g. the
++		 * /dev/crypto callback method just does a wakeup).
++		 */
++		krp->krp_callback(krp);
++	} else {
++		unsigned long r_flags;
++		/*
++		 * Normal case; queue the callback for the thread.
++		 */
++		CRYPTO_RETQ_LOCK();
++		if (CRYPTO_RETQ_EMPTY())
++			wake_up_interruptible(&cryptoretproc_wait);/* shared wait channel */
++		TAILQ_INSERT_TAIL(&crp_ret_kq, krp, krp_next);
++		CRYPTO_RETQ_UNLOCK();
++	}
++}
++
++int
++crypto_getfeat(int *featp)
++{
++	int hid, kalg, feat = 0;
++	unsigned long d_flags;
++
++	CRYPTO_DRIVER_LOCK();
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		const struct cryptocap *cap = &crypto_drivers[hid];
++
++		if ((cap->cc_flags & CRYPTOCAP_F_SOFTWARE) &&
++		    !crypto_devallowsoft) {
++			continue;
++		}
++		for (kalg = 0; kalg < CRK_ALGORITHM_MAX; kalg++)
++			if (cap->cc_kalg[kalg] & CRYPTO_ALG_FLAG_SUPPORTED)
++				feat |=  1 << kalg;
++	}
++	CRYPTO_DRIVER_UNLOCK();
++	*featp = feat;
++	return (0);
++}
++
++/*
++ * Crypto thread, dispatches crypto requests.
++ */
++static int
++crypto_proc(void *arg)
++{
++	struct cryptop *crp, *submit;
++	struct cryptkop *krp, *krpp;
++	struct cryptocap *cap;
++	u_int32_t hid;
++	int result, hint;
++	unsigned long q_flags;
++	int loopcount = 0;
++
++	ocf_daemonize("crypto");
++
++	CRYPTO_Q_LOCK();
++	for (;;) {
++		/*
++		 * we need to make sure we don't get into a busy loop with nothing
++		 * to do,  the two crypto_all_*blocked vars help us find out when
++		 * we are all full and can do nothing on any driver or Q.  If so we
++		 * wait for an unblock.
++		 */
++		crypto_all_qblocked  = !list_empty(&crp_q);
++
++		/*
++		 * Find the first element in the queue that can be
++		 * processed and look-ahead to see if multiple ops
++		 * are ready for the same driver.
++		 */
++		submit = NULL;
++		hint = 0;
++		list_for_each_entry(crp, &crp_q, crp_next) {
++			hid = CRYPTO_SESID2HID(crp->crp_sid);
++			cap = crypto_checkdriver(hid);
++			/*
++			 * Driver cannot disappear when there is an active
++			 * session.
++			 */
++			KASSERT(cap != NULL, ("%s:%u Driver disappeared.",
++			    __func__, __LINE__));
++			if (cap == NULL || cap->cc_dev == NULL) {
++				/* Op needs to be migrated, process it. */
++				if (submit == NULL)
++					submit = crp;
++				break;
++			}
++			if (!cap->cc_qblocked) {
++				if (submit != NULL) {
++					/*
++					 * We stop on finding another op,
++					 * regardless whether its for the same
++					 * driver or not.  We could keep
++					 * searching the queue but it might be
++					 * better to just use a per-driver
++					 * queue instead.
++					 */
++					if (CRYPTO_SESID2HID(submit->crp_sid) == hid)
++						hint = CRYPTO_HINT_MORE;
++					break;
++				} else {
++					submit = crp;
++					if ((submit->crp_flags & CRYPTO_F_BATCH) == 0)
++						break;
++					/* keep scanning for more are q'd */
++				}
++			}
++		}
++		if (submit != NULL) {
++			hid = CRYPTO_SESID2HID(submit->crp_sid);
++			crypto_all_qblocked = 0;
++			list_del(&submit->crp_next);
++			crypto_drivers[hid].cc_unqblocked = 1;
++			cap = crypto_checkdriver(hid);
++			CRYPTO_Q_UNLOCK();
++			KASSERT(cap != NULL, ("%s:%u Driver disappeared.",
++			    __func__, __LINE__));
++			result = crypto_invoke(cap, submit, hint);
++			CRYPTO_Q_LOCK();
++			if (result == ERESTART) {
++				/*
++				 * The driver ran out of resources, mark the
++				 * driver ``blocked'' for cryptop's and put
++				 * the request back in the queue.  It would
++				 * best to put the request back where we got
++				 * it but that's hard so for now we put it
++				 * at the front.  This should be ok; putting
++				 * it at the end does not work.
++				 */
++				/* XXX validate sid again? */
++				list_add(&submit->crp_next, &crp_q);
++				cryptostats.cs_blocks++;
++				if (crypto_drivers[hid].cc_unqblocked)
++					crypto_drivers[hid].cc_qblocked=0;
++				crypto_drivers[hid].cc_unqblocked=0;
++			}
++			crypto_drivers[hid].cc_unqblocked = 0;
++		}
++
++		crypto_all_kqblocked = !list_empty(&crp_kq);
++
++		/* As above, but for key ops */
++		krp = NULL;
++		list_for_each_entry(krpp, &crp_kq, krp_next) {
++			cap = crypto_checkdriver(krpp->krp_hid);
++			if (cap == NULL || cap->cc_dev == NULL) {
++				/*
++				 * Operation needs to be migrated, invalidate
++				 * the assigned device so it will reselect a
++				 * new one below.  Propagate the original
++				 * crid selection flags if supplied.
++				 */
++				krp->krp_hid = krp->krp_crid &
++				    (CRYPTOCAP_F_SOFTWARE|CRYPTOCAP_F_HARDWARE);
++				if (krp->krp_hid == 0)
++					krp->krp_hid =
++				    CRYPTOCAP_F_SOFTWARE|CRYPTOCAP_F_HARDWARE;
++				break;
++			}
++			if (!cap->cc_kqblocked) {
++				krp = krpp;
++				break;
++			}
++		}
++		if (krp != NULL) {
++			crypto_all_kqblocked = 0;
++			list_del(&krp->krp_next);
++			crypto_drivers[krp->krp_hid].cc_kqblocked = 1;
++			CRYPTO_Q_UNLOCK();
++			result = crypto_kinvoke(krp, krp->krp_hid);
++			CRYPTO_Q_LOCK();
++			if (result == ERESTART) {
++				/*
++				 * The driver ran out of resources, mark the
++				 * driver ``blocked'' for cryptkop's and put
++				 * the request back in the queue.  It would
++				 * best to put the request back where we got
++				 * it but that's hard so for now we put it
++				 * at the front.  This should be ok; putting
++				 * it at the end does not work.
++				 */
++				/* XXX validate sid again? */
++				list_add(&krp->krp_next, &crp_kq);
++				cryptostats.cs_kblocks++;
++			} else
++				crypto_drivers[krp->krp_hid].cc_kqblocked = 0;
++		}
++
++		if (submit == NULL && krp == NULL) {
++			/*
++			 * Nothing more to be processed.  Sleep until we're
++			 * woken because there are more ops to process.
++			 * This happens either by submission or by a driver
++			 * becoming unblocked and notifying us through
++			 * crypto_unblock.  Note that when we wakeup we
++			 * start processing each queue again from the
++			 * front. It's not clear that it's important to
++			 * preserve this ordering since ops may finish
++			 * out of order if dispatched to different devices
++			 * and some become blocked while others do not.
++			 */
++			dprintk("%s - sleeping (qe=%d qb=%d kqe=%d kqb=%d)\n",
++					__FUNCTION__,
++					list_empty(&crp_q), crypto_all_qblocked,
++					list_empty(&crp_kq), crypto_all_kqblocked);
++			loopcount = 0;
++			CRYPTO_Q_UNLOCK();
++			crp_sleep = 1;
++			wait_event_interruptible(cryptoproc_wait,
++					!(list_empty(&crp_q) || crypto_all_qblocked) ||
++					!(list_empty(&crp_kq) || crypto_all_kqblocked) ||
++					cryptoproc == (pid_t) -1);
++			crp_sleep = 0;
++			if (signal_pending (current)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_lock_irq(&current->sigmask_lock);
++#endif
++				flush_signals(current);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_unlock_irq(&current->sigmask_lock);
++#endif
++			}
++			CRYPTO_Q_LOCK();
++			dprintk("%s - awake\n", __FUNCTION__);
++			if (cryptoproc == (pid_t) -1)
++				break;
++			cryptostats.cs_intrs++;
++		} else if (loopcount > crypto_max_loopcount) {
++			/*
++			 * Give other processes a chance to run if we've 
++			 * been using the CPU exclusively for a while.
++			 */
++			loopcount = 0;
++			schedule();
++		}
++		loopcount++;
++	}
++	CRYPTO_Q_UNLOCK();
++	complete_and_exit(&cryptoproc_exited, 0);
++}
++
++/*
++ * Crypto returns thread, does callbacks for processed crypto requests.
++ * Callbacks are done here, rather than in the crypto drivers, because
++ * callbacks typically are expensive and would slow interrupt handling.
++ */
++static int
++crypto_ret_proc(void *arg)
++{
++	struct cryptop *crpt;
++	struct cryptkop *krpt;
++	unsigned long  r_flags;
++
++	ocf_daemonize("crypto_ret");
++
++	CRYPTO_RETQ_LOCK();
++	for (;;) {
++		/* Harvest return q's for completed ops */
++		crpt = NULL;
++		if (!list_empty(&crp_ret_q))
++			crpt = list_entry(crp_ret_q.next, typeof(*crpt), crp_next);
++		if (crpt != NULL)
++			list_del(&crpt->crp_next);
++
++		krpt = NULL;
++		if (!list_empty(&crp_ret_kq))
++			krpt = list_entry(crp_ret_kq.next, typeof(*krpt), krp_next);
++		if (krpt != NULL)
++			list_del(&krpt->krp_next);
++
++		if (crpt != NULL || krpt != NULL) {
++			CRYPTO_RETQ_UNLOCK();
++			/*
++			 * Run callbacks unlocked.
++			 */
++			if (crpt != NULL)
++				crpt->crp_callback(crpt);
++			if (krpt != NULL)
++				krpt->krp_callback(krpt);
++			CRYPTO_RETQ_LOCK();
++		} else {
++			/*
++			 * Nothing more to be processed.  Sleep until we're
++			 * woken because there are more returns to process.
++			 */
++			dprintk("%s - sleeping\n", __FUNCTION__);
++			CRYPTO_RETQ_UNLOCK();
++			wait_event_interruptible(cryptoretproc_wait,
++					cryptoretproc == (pid_t) -1 ||
++					!list_empty(&crp_ret_q) ||
++					!list_empty(&crp_ret_kq));
++			if (signal_pending (current)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_lock_irq(&current->sigmask_lock);
++#endif
++				flush_signals(current);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++				spin_unlock_irq(&current->sigmask_lock);
++#endif
++			}
++			CRYPTO_RETQ_LOCK();
++			dprintk("%s - awake\n", __FUNCTION__);
++			if (cryptoretproc == (pid_t) -1) {
++				dprintk("%s - EXITING!\n", __FUNCTION__);
++				break;
++			}
++			cryptostats.cs_rets++;
++		}
++	}
++	CRYPTO_RETQ_UNLOCK();
++	complete_and_exit(&cryptoretproc_exited, 0);
++}
++
++
++#if 0 /* should put this into /proc or something */
++static void
++db_show_drivers(void)
++{
++	int hid;
++
++	db_printf("%12s %4s %4s %8s %2s %2s\n"
++		, "Device"
++		, "Ses"
++		, "Kops"
++		, "Flags"
++		, "QB"
++		, "KB"
++	);
++	for (hid = 0; hid < crypto_drivers_num; hid++) {
++		const struct cryptocap *cap = &crypto_drivers[hid];
++		if (cap->cc_dev == NULL)
++			continue;
++		db_printf("%-12s %4u %4u %08x %2u %2u\n"
++		    , device_get_nameunit(cap->cc_dev)
++		    , cap->cc_sessions
++		    , cap->cc_koperations
++		    , cap->cc_flags
++		    , cap->cc_qblocked
++		    , cap->cc_kqblocked
++		);
++	}
++}
++
++DB_SHOW_COMMAND(crypto, db_show_crypto)
++{
++	struct cryptop *crp;
++
++	db_show_drivers();
++	db_printf("\n");
++
++	db_printf("%4s %8s %4s %4s %4s %4s %8s %8s\n",
++	    "HID", "Caps", "Ilen", "Olen", "Etype", "Flags",
++	    "Desc", "Callback");
++	TAILQ_FOREACH(crp, &crp_q, crp_next) {
++		db_printf("%4u %08x %4u %4u %4u %04x %8p %8p\n"
++		    , (int) CRYPTO_SESID2HID(crp->crp_sid)
++		    , (int) CRYPTO_SESID2CAPS(crp->crp_sid)
++		    , crp->crp_ilen, crp->crp_olen
++		    , crp->crp_etype
++		    , crp->crp_flags
++		    , crp->crp_desc
++		    , crp->crp_callback
++		);
++	}
++	if (!TAILQ_EMPTY(&crp_ret_q)) {
++		db_printf("\n%4s %4s %4s %8s\n",
++		    "HID", "Etype", "Flags", "Callback");
++		TAILQ_FOREACH(crp, &crp_ret_q, crp_next) {
++			db_printf("%4u %4u %04x %8p\n"
++			    , (int) CRYPTO_SESID2HID(crp->crp_sid)
++			    , crp->crp_etype
++			    , crp->crp_flags
++			    , crp->crp_callback
++			);
++		}
++	}
++}
++
++DB_SHOW_COMMAND(kcrypto, db_show_kcrypto)
++{
++	struct cryptkop *krp;
++
++	db_show_drivers();
++	db_printf("\n");
++
++	db_printf("%4s %5s %4s %4s %8s %4s %8s\n",
++	    "Op", "Status", "#IP", "#OP", "CRID", "HID", "Callback");
++	TAILQ_FOREACH(krp, &crp_kq, krp_next) {
++		db_printf("%4u %5u %4u %4u %08x %4u %8p\n"
++		    , krp->krp_op
++		    , krp->krp_status
++		    , krp->krp_iparams, krp->krp_oparams
++		    , krp->krp_crid, krp->krp_hid
++		    , krp->krp_callback
++		);
++	}
++	if (!TAILQ_EMPTY(&crp_ret_q)) {
++		db_printf("%4s %5s %8s %4s %8s\n",
++		    "Op", "Status", "CRID", "HID", "Callback");
++		TAILQ_FOREACH(krp, &crp_ret_kq, krp_next) {
++			db_printf("%4u %5u %08x %4u %8p\n"
++			    , krp->krp_op
++			    , krp->krp_status
++			    , krp->krp_crid, krp->krp_hid
++			    , krp->krp_callback
++			);
++		}
++	}
++}
++#endif
++
++
++static int
++crypto_init(void)
++{
++	int error;
++
++	dprintk("%s(%p)\n", __FUNCTION__, (void *) crypto_init);
++
++	if (crypto_initted)
++		return 0;
++	crypto_initted = 1;
++
++	spin_lock_init(&crypto_drivers_lock);
++	spin_lock_init(&crypto_q_lock);
++	spin_lock_init(&crypto_ret_q_lock);
++
++	cryptop_zone = kmem_cache_create("cryptop", sizeof(struct cryptop),
++				       0, SLAB_HWCACHE_ALIGN, NULL
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
++				       , NULL
++#endif
++					);
++
++	cryptodesc_zone = kmem_cache_create("cryptodesc", sizeof(struct cryptodesc),
++				       0, SLAB_HWCACHE_ALIGN, NULL
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
++				       , NULL
++#endif
++					);
++
++	if (cryptodesc_zone == NULL || cryptop_zone == NULL) {
++		printk("crypto: crypto_init cannot setup crypto zones\n");
++		error = ENOMEM;
++		goto bad;
++	}
++
++	crypto_drivers_num = CRYPTO_DRIVERS_INITIAL;
++	crypto_drivers = kmalloc(crypto_drivers_num * sizeof(struct cryptocap),
++			GFP_KERNEL);
++	if (crypto_drivers == NULL) {
++		printk("crypto: crypto_init cannot setup crypto drivers\n");
++		error = ENOMEM;
++		goto bad;
++	}
++
++	memset(crypto_drivers, 0, crypto_drivers_num * sizeof(struct cryptocap));
++
++	init_completion(&cryptoproc_exited);
++	init_completion(&cryptoretproc_exited);
++
++	cryptoproc = 0; /* to avoid race condition where proc runs first */
++	cryptoproc = kernel_thread(crypto_proc, NULL, CLONE_FS|CLONE_FILES);
++	if (cryptoproc < 0) {
++		error = cryptoproc;
++		printk("crypto: crypto_init cannot start crypto thread; error %d",
++			error);
++		goto bad;
++	}
++
++	cryptoretproc = 0; /* to avoid race condition where proc runs first */
++	cryptoretproc = kernel_thread(crypto_ret_proc, NULL, CLONE_FS|CLONE_FILES);
++	if (cryptoretproc < 0) {
++		error = cryptoretproc;
++		printk("crypto: crypto_init cannot start cryptoret thread; error %d",
++				error);
++		goto bad;
++	}
++
++	return 0;
++bad:
++	crypto_exit();
++	return error;
++}
++
++
++static void
++crypto_exit(void)
++{
++	pid_t p;
++	unsigned long d_flags;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	/*
++	 * Terminate any crypto threads.
++	 */
++
++	CRYPTO_DRIVER_LOCK();
++	p = cryptoproc;
++	cryptoproc = (pid_t) -1;
++	kill_proc(p, SIGTERM, 1);
++	wake_up_interruptible(&cryptoproc_wait);
++	CRYPTO_DRIVER_UNLOCK();
++
++	wait_for_completion(&cryptoproc_exited);
++
++	CRYPTO_DRIVER_LOCK();
++	p = cryptoretproc;
++	cryptoretproc = (pid_t) -1;
++	kill_proc(p, SIGTERM, 1);
++	wake_up_interruptible(&cryptoretproc_wait);
++	CRYPTO_DRIVER_UNLOCK();
++
++	wait_for_completion(&cryptoretproc_exited);
++
++	/* XXX flush queues??? */
++
++	/* 
++	 * Reclaim dynamically allocated resources.
++	 */
++	if (crypto_drivers != NULL)
++		kfree(crypto_drivers);
++
++	if (cryptodesc_zone != NULL)
++		kmem_cache_destroy(cryptodesc_zone);
++	if (cryptop_zone != NULL)
++		kmem_cache_destroy(cryptop_zone);
++}
++
++
++EXPORT_SYMBOL(crypto_newsession);
++EXPORT_SYMBOL(crypto_freesession);
++EXPORT_SYMBOL(crypto_get_driverid);
++EXPORT_SYMBOL(crypto_kregister);
++EXPORT_SYMBOL(crypto_register);
++EXPORT_SYMBOL(crypto_unregister);
++EXPORT_SYMBOL(crypto_unregister_all);
++EXPORT_SYMBOL(crypto_unblock);
++EXPORT_SYMBOL(crypto_dispatch);
++EXPORT_SYMBOL(crypto_kdispatch);
++EXPORT_SYMBOL(crypto_freereq);
++EXPORT_SYMBOL(crypto_getreq);
++EXPORT_SYMBOL(crypto_done);
++EXPORT_SYMBOL(crypto_kdone);
++EXPORT_SYMBOL(crypto_getfeat);
++EXPORT_SYMBOL(crypto_userasymcrypto);
++EXPORT_SYMBOL(crypto_getcaps);
++EXPORT_SYMBOL(crypto_find_driver);
++EXPORT_SYMBOL(crypto_find_device_byhid);
++
++module_init(crypto_init);
++module_exit(crypto_exit);
++
++MODULE_LICENSE("BSD");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("OCF (OpenBSD Cryptographic Framework)");
+diff --git a/crypto/ocf/cryptodev.c b/crypto/ocf/cryptodev.c
+new file mode 100644
+index 0000000..badf802
+--- /dev/null
++++ b/crypto/ocf/cryptodev.c
+@@ -0,0 +1,1063 @@
++/*	$OpenBSD: cryptodev.c,v 1.52 2002/06/19 07:22:46 deraadt Exp $	*/
++
++/*-
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Copyright (c) 2001 Theo de Raadt
++ * Copyright (c) 2002-2006 Sam Leffler, Errno Consulting
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in the
++ *   documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *   derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Effort sponsored in part by the Defense Advanced Research Projects
++ * Agency (DARPA) and Air Force Research Laboratory, Air Force
++ * Materiel Command, USAF, under agreement number F30602-01-2-0537.
++ *
++__FBSDID("$FreeBSD: src/sys/opencrypto/cryptodev.c,v 1.34 2007/05/09 19:37:02 gnn Exp $");
++ */
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/types.h>
++#include <linux/time.h>
++#include <linux/delay.h>
++#include <linux/list.h>
++#include <linux/init.h>
++#include <linux/sched.h>
++#include <linux/unistd.h>
++#include <linux/module.h>
++#include <linux/wait.h>
++#include <linux/slab.h>
++#include <linux/fs.h>
++#include <linux/dcache.h>
++#include <linux/file.h>
++#include <linux/mount.h>
++#include <linux/miscdevice.h>
++#include <linux/version.h>
++#include <asm/uaccess.h>
++
++#include <crypto/cryptodev.h>
++#include <uio.h>
++
++extern asmlinkage long sys_dup(unsigned int fildes);
++
++#define debug cryptodev_debug
++int cryptodev_debug = 0;
++module_param(cryptodev_debug, int, 0644);
++MODULE_PARM_DESC(cryptodev_debug, "Enable cryptodev debug");
++
++struct csession_info {
++	u_int16_t	blocksize;
++	u_int16_t	minkey, maxkey;
++
++	u_int16_t	keysize;
++	/* u_int16_t	hashsize;  */
++	u_int16_t	authsize;
++	u_int16_t	authkey;
++	/* u_int16_t	ctxsize; */
++};
++
++struct csession {
++	struct list_head	list;
++	u_int64_t	sid;
++	u_int32_t	ses;
++
++	wait_queue_head_t waitq;
++
++	u_int32_t	cipher;
++
++	u_int32_t	mac;
++
++	caddr_t		key;
++	int		keylen;
++	u_char		tmp_iv[EALG_MAX_BLOCK_LEN];
++
++	caddr_t		mackey;
++	int		mackeylen;
++
++	struct csession_info info;
++
++	struct iovec	iovec;
++	struct uio	uio;
++	int		error;
++};
++
++struct fcrypt {
++	struct list_head	csessions;
++	int		sesn;
++};
++
++static struct csession *csefind(struct fcrypt *, u_int);
++static int csedelete(struct fcrypt *, struct csession *);
++static struct csession *cseadd(struct fcrypt *, struct csession *);
++static struct csession *csecreate(struct fcrypt *, u_int64_t,
++		struct cryptoini *crie, struct cryptoini *cria, struct csession_info *);
++static int csefree(struct csession *);
++
++static	int cryptodev_op(struct csession *, struct crypt_op *);
++static	int cryptodev_key(struct crypt_kop *);
++static	int cryptodev_find(struct crypt_find_op *);
++
++static int cryptodev_cb(void *);
++static int cryptodev_open(struct inode *inode, struct file *filp);
++
++/*
++ * Check a crypto identifier to see if it requested
++ * a valid crid and it's capabilities match.
++ */
++static int
++checkcrid(int crid)
++{
++	int hid = crid & ~(CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_HARDWARE);
++	int typ = crid & (CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_HARDWARE);
++	int caps = 0;
++	
++	/* if the user hasn't selected a driver, then just call newsession */
++	if (hid == 0 && typ != 0)
++		return 0;
++
++	caps = crypto_getcaps(hid);
++
++	/* didn't find anything with capabilities */
++	if (caps == 0) {
++		dprintk("%s: hid=%x typ=%x not matched\n", __FUNCTION__, hid, typ);
++		return EINVAL;
++	}
++	
++	/* the user didn't specify SW or HW, so the driver is ok */
++	if (typ == 0)
++		return 0;
++
++	/* if the type specified didn't match */
++	if (typ != (caps & (CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_HARDWARE))) {
++		dprintk("%s: hid=%x typ=%x caps=%x not matched\n", __FUNCTION__,
++				hid, typ, caps);
++		return EINVAL;
++	}
++
++	return 0;
++}
++
++static int
++cryptodev_op(struct csession *cse, struct crypt_op *cop)
++{
++	struct cryptop *crp = NULL;
++	struct cryptodesc *crde = NULL, *crda = NULL;
++	int error = 0;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (cop->len > CRYPTO_MAX_DATA_LEN) {
++		dprintk("%s: %d > %d\n", __FUNCTION__, cop->len, CRYPTO_MAX_DATA_LEN);
++		return (E2BIG);
++	}
++
++	if (cse->info.blocksize && (cop->len % cse->info.blocksize) != 0) {
++		dprintk("%s: blocksize=%d len=%d\n", __FUNCTION__, cse->info.blocksize,
++				cop->len);
++		return (EINVAL);
++	}
++
++	cse->uio.uio_iov = &cse->iovec;
++	cse->uio.uio_iovcnt = 1;
++	cse->uio.uio_offset = 0;
++#if 0
++	cse->uio.uio_resid = cop->len;
++	cse->uio.uio_segflg = UIO_SYSSPACE;
++	cse->uio.uio_rw = UIO_WRITE;
++	cse->uio.uio_td = td;
++#endif
++	cse->uio.uio_iov[0].iov_len = cop->len;
++	if (cse->info.authsize)
++		cse->uio.uio_iov[0].iov_len += cse->info.authsize;
++	cse->uio.uio_iov[0].iov_base = kmalloc(cse->uio.uio_iov[0].iov_len,
++			GFP_KERNEL);
++
++	if (cse->uio.uio_iov[0].iov_base == NULL) {
++		dprintk("%s: iov_base kmalloc(%d) failed\n", __FUNCTION__,
++				(int)cse->uio.uio_iov[0].iov_len);
++		return (ENOMEM);
++	}
++
++	crp = crypto_getreq((cse->info.blocksize != 0) + (cse->info.authsize != 0));
++	if (crp == NULL) {
++		dprintk("%s: ENOMEM\n", __FUNCTION__);
++		error = ENOMEM;
++		goto bail;
++	}
++
++	if (cse->info.authsize && cse->info.blocksize) {
++		if (cop->op == COP_ENCRYPT) {
++			crde = crp->crp_desc;
++			crda = crde->crd_next;
++		} else {
++			crda = crp->crp_desc;
++			crde = crda->crd_next;
++		}
++	} else if (cse->info.authsize) {
++		crda = crp->crp_desc;
++	} else if (cse->info.blocksize) {
++		crde = crp->crp_desc;
++	} else {
++		dprintk("%s: bad request\n", __FUNCTION__);
++		error = EINVAL;
++		goto bail;
++	}
++
++	if ((error = copy_from_user(cse->uio.uio_iov[0].iov_base, cop->src,
++					cop->len))) {
++		dprintk("%s: bad copy\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (crda) {
++		crda->crd_skip = 0;
++		crda->crd_len = cop->len;
++		crda->crd_inject = cop->len;
++
++		crda->crd_alg = cse->mac;
++		crda->crd_key = cse->mackey;
++		crda->crd_klen = cse->mackeylen * 8;
++	}
++
++	if (crde) {
++		if (cop->op == COP_ENCRYPT)
++			crde->crd_flags |= CRD_F_ENCRYPT;
++		else
++			crde->crd_flags &= ~CRD_F_ENCRYPT;
++		crde->crd_len = cop->len;
++		crde->crd_inject = 0;
++
++		crde->crd_alg = cse->cipher;
++		crde->crd_key = cse->key;
++		crde->crd_klen = cse->keylen * 8;
++	}
++
++	crp->crp_ilen = cse->uio.uio_iov[0].iov_len;
++	crp->crp_flags = CRYPTO_F_IOV | CRYPTO_F_CBIMM
++		       | (cop->flags & COP_F_BATCH);
++	crp->crp_buf = (caddr_t)&cse->uio;
++	crp->crp_callback = (int (*) (struct cryptop *)) cryptodev_cb;
++	crp->crp_sid = cse->sid;
++	crp->crp_opaque = (void *)cse;
++
++	if (cop->iv) {
++		if (crde == NULL) {
++			error = EINVAL;
++			dprintk("%s no crde\n", __FUNCTION__);
++			goto bail;
++		}
++		if (cse->cipher == CRYPTO_ARC4) { /* XXX use flag? */
++			error = EINVAL;
++			dprintk("%s arc4 with IV\n", __FUNCTION__);
++			goto bail;
++		}
++		if ((error = copy_from_user(cse->tmp_iv, cop->iv,
++						cse->info.blocksize))) {
++			dprintk("%s bad iv copy\n", __FUNCTION__);
++			goto bail;
++		}
++		memcpy(crde->crd_iv, cse->tmp_iv, cse->info.blocksize);
++		crde->crd_flags |= CRD_F_IV_EXPLICIT | CRD_F_IV_PRESENT;
++		crde->crd_skip = 0;
++	} else if (cse->cipher == CRYPTO_ARC4) { /* XXX use flag? */
++		crde->crd_skip = 0;
++	} else if (crde) {
++		crde->crd_flags |= CRD_F_IV_PRESENT;
++		crde->crd_skip = cse->info.blocksize;
++		crde->crd_len -= cse->info.blocksize;
++	}
++
++	if (cop->mac && crda == NULL) {
++		error = EINVAL;
++		dprintk("%s no crda\n", __FUNCTION__);
++		goto bail;
++	}
++
++	/*
++	 * Let the dispatch run unlocked, then, interlock against the
++	 * callback before checking if the operation completed and going
++	 * to sleep.  This insures drivers don't inherit our lock which
++	 * results in a lock order reversal between crypto_dispatch forced
++	 * entry and the crypto_done callback into us.
++	 */
++	error = crypto_dispatch(crp);
++	if (error) {
++		dprintk("%s error in crypto_dispatch\n", __FUNCTION__);
++		goto bail;
++	}
++
++	dprintk("%s about to WAIT\n", __FUNCTION__);
++	/*
++	 * we really need to wait for driver to complete to maintain
++	 * state,  luckily interrupts will be remembered
++	 */
++	do {
++		error = wait_event_interruptible(crp->crp_waitq,
++				((crp->crp_flags & CRYPTO_F_DONE) != 0));
++		/*
++		 * we can't break out of this loop or we will leave behind
++		 * a huge mess,  however,  staying here means if your driver
++		 * is broken user applications can hang and not be killed.
++		 * The solution,  fix your driver :-)
++		 */
++		if (error) {
++			schedule();
++			error = 0;
++		}
++	} while ((crp->crp_flags & CRYPTO_F_DONE) == 0);
++	dprintk("%s finished WAITING error=%d\n", __FUNCTION__, error);
++
++	if (crp->crp_etype != 0) {
++		error = crp->crp_etype;
++		dprintk("%s error in crp processing\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (cse->error) {
++		error = cse->error;
++		dprintk("%s error in cse processing\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (cop->dst && (error = copy_to_user(cop->dst,
++					cse->uio.uio_iov[0].iov_base, cop->len))) {
++		dprintk("%s bad dst copy\n", __FUNCTION__);
++		goto bail;
++	}
++
++	if (cop->mac &&
++			(error=copy_to_user(cop->mac,
++				(caddr_t)cse->uio.uio_iov[0].iov_base + cop->len,
++				cse->info.authsize))) {
++		dprintk("%s bad mac copy\n", __FUNCTION__);
++		goto bail;
++	}
++
++bail:
++	if (crp)
++		crypto_freereq(crp);
++	if (cse->uio.uio_iov[0].iov_base)
++		kfree(cse->uio.uio_iov[0].iov_base);
++
++	return (error);
++}
++
++static int
++cryptodev_cb(void *op)
++{
++	struct cryptop *crp = (struct cryptop *) op;
++	struct csession *cse = (struct csession *)crp->crp_opaque;
++	int error;
++
++	dprintk("%s()\n", __FUNCTION__);
++	error = crp->crp_etype;
++	if (error == EAGAIN) {
++		crp->crp_flags &= ~CRYPTO_F_DONE;
++#ifdef NOTYET
++		/*
++		 * DAVIDM I am fairly sure that we should turn this into a batch
++		 * request to stop bad karma/lockup, revisit
++		 */
++		crp->crp_flags |= CRYPTO_F_BATCH;
++#endif
++		return crypto_dispatch(crp);
++	}
++	if (error != 0 || (crp->crp_flags & CRYPTO_F_DONE)) {
++		cse->error = error;
++		wake_up_interruptible(&crp->crp_waitq);
++	}
++	return (0);
++}
++
++static int
++cryptodevkey_cb(void *op)
++{
++	struct cryptkop *krp = (struct cryptkop *) op;
++	dprintk("%s()\n", __FUNCTION__);
++	wake_up_interruptible(&krp->krp_waitq);
++	return (0);
++}
++
++static int
++cryptodev_key(struct crypt_kop *kop)
++{
++	struct cryptkop *krp = NULL;
++	int error = EINVAL;
++	int in, out, size, i;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (kop->crk_iparams + kop->crk_oparams > CRK_MAXPARAM) {
++		dprintk("%s params too big\n", __FUNCTION__);
++		return (EFBIG);
++	}
++
++	in = kop->crk_iparams;
++	out = kop->crk_oparams;
++	switch (kop->crk_op) {
++	case CRK_MOD_EXP:
++		if (in == 3 && out == 1)
++			break;
++		return (EINVAL);
++	case CRK_MOD_EXP_CRT:
++		if (in == 6 && out == 1)
++			break;
++		return (EINVAL);
++	case CRK_DSA_SIGN:
++		if (in == 5 && out == 2)
++			break;
++		return (EINVAL);
++	case CRK_DSA_VERIFY:
++		if (in == 7 && out == 0)
++			break;
++		return (EINVAL);
++	case CRK_DH_COMPUTE_KEY:
++		if (in == 3 && out == 1)
++			break;
++		return (EINVAL);
++	default:
++		return (EINVAL);
++	}
++
++	krp = (struct cryptkop *)kmalloc(sizeof *krp, GFP_KERNEL);
++	if (!krp)
++		return (ENOMEM);
++	bzero(krp, sizeof *krp);
++	krp->krp_op = kop->crk_op;
++	krp->krp_status = kop->crk_status;
++	krp->krp_iparams = kop->crk_iparams;
++	krp->krp_oparams = kop->crk_oparams;
++	krp->krp_crid = kop->crk_crid;
++	krp->krp_status = 0;
++	krp->krp_flags = CRYPTO_KF_CBIMM;
++	krp->krp_callback = (int (*) (struct cryptkop *)) cryptodevkey_cb;
++	init_waitqueue_head(&krp->krp_waitq);
++
++	for (i = 0; i < CRK_MAXPARAM; i++)
++		krp->krp_param[i].crp_nbits = kop->crk_param[i].crp_nbits;
++	for (i = 0; i < krp->krp_iparams + krp->krp_oparams; i++) {
++		size = (krp->krp_param[i].crp_nbits + 7) / 8;
++		if (size == 0)
++			continue;
++		krp->krp_param[i].crp_p = (caddr_t) kmalloc(size, GFP_KERNEL);
++		if (i >= krp->krp_iparams)
++			continue;
++		error = copy_from_user(krp->krp_param[i].crp_p,
++				kop->crk_param[i].crp_p, size);
++		if (error)
++			goto fail;
++	}
++
++	error = crypto_kdispatch(krp);
++	if (error)
++		goto fail;
++
++	do {
++		error = wait_event_interruptible(krp->krp_waitq,
++				((krp->krp_flags & CRYPTO_KF_DONE) != 0));
++		/*
++		 * we can't break out of this loop or we will leave behind
++		 * a huge mess,  however,  staying here means if your driver
++		 * is broken user applications can hang and not be killed.
++		 * The solution,  fix your driver :-)
++		 */
++		if (error) {
++			schedule();
++			error = 0;
++		}
++	} while ((krp->krp_flags & CRYPTO_KF_DONE) == 0);
++
++	dprintk("%s finished WAITING error=%d\n", __FUNCTION__, error);
++	
++	kop->crk_crid = krp->krp_crid;		/* device that did the work */
++	if (krp->krp_status != 0) {
++		error = krp->krp_status;
++		goto fail;
++	}
++
++	for (i = krp->krp_iparams; i < krp->krp_iparams + krp->krp_oparams; i++) {
++		size = (krp->krp_param[i].crp_nbits + 7) / 8;
++		if (size == 0)
++			continue;
++		error = copy_to_user(kop->crk_param[i].crp_p, krp->krp_param[i].crp_p,
++				size);
++		if (error)
++			goto fail;
++	}
++
++fail:
++	if (krp) {
++		kop->crk_status = krp->krp_status;
++		for (i = 0; i < CRK_MAXPARAM; i++) {
++			if (krp->krp_param[i].crp_p)
++				kfree(krp->krp_param[i].crp_p);
++		}
++		kfree(krp);
++	}
++	return (error);
++}
++
++static int
++cryptodev_find(struct crypt_find_op *find)
++{
++	device_t dev;
++
++	if (find->crid != -1) {
++		dev = crypto_find_device_byhid(find->crid);
++		if (dev == NULL)
++			return (ENOENT);
++		strlcpy(find->name, device_get_nameunit(dev),
++		    sizeof(find->name));
++	} else {
++		find->crid = crypto_find_driver(find->name);
++		if (find->crid == -1)
++			return (ENOENT);
++	}
++	return (0);
++}
++
++static struct csession *
++csefind(struct fcrypt *fcr, u_int ses)
++{
++	struct csession *cse;
++
++	dprintk("%s()\n", __FUNCTION__);
++	list_for_each_entry(cse, &fcr->csessions, list)
++		if (cse->ses == ses)
++			return (cse);
++	return (NULL);
++}
++
++static int
++csedelete(struct fcrypt *fcr, struct csession *cse_del)
++{
++	struct csession *cse;
++
++	dprintk("%s()\n", __FUNCTION__);
++	list_for_each_entry(cse, &fcr->csessions, list) {
++		if (cse == cse_del) {
++			list_del(&cse->list);
++			return (1);
++		}
++	}
++	return (0);
++}
++	
++static struct csession *
++cseadd(struct fcrypt *fcr, struct csession *cse)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	list_add_tail(&cse->list, &fcr->csessions);
++	cse->ses = fcr->sesn++;
++	return (cse);
++}
++
++static struct csession *
++csecreate(struct fcrypt *fcr, u_int64_t sid, struct cryptoini *crie,
++	struct cryptoini *cria, struct csession_info *info)
++{
++	struct csession *cse;
++
++	dprintk("%s()\n", __FUNCTION__);
++	cse = (struct csession *) kmalloc(sizeof(struct csession), GFP_KERNEL);
++	if (cse == NULL)
++		return NULL;
++	memset(cse, 0, sizeof(struct csession));
++
++	INIT_LIST_HEAD(&cse->list);
++	init_waitqueue_head(&cse->waitq);
++
++	cse->key = crie->cri_key;
++	cse->keylen = crie->cri_klen/8;
++	cse->mackey = cria->cri_key;
++	cse->mackeylen = cria->cri_klen/8;
++	cse->sid = sid;
++	cse->cipher = crie->cri_alg;
++	cse->mac = cria->cri_alg;
++	cse->info = *info;
++	cseadd(fcr, cse);
++	return (cse);
++}
++
++static int
++csefree(struct csession *cse)
++{
++	int error;
++
++	dprintk("%s()\n", __FUNCTION__);
++	error = crypto_freesession(cse->sid);
++	if (cse->key)
++		kfree(cse->key);
++	if (cse->mackey)
++		kfree(cse->mackey);
++	kfree(cse);
++	return(error);
++}
++
++static int
++cryptodev_ioctl(
++	struct inode *inode,
++	struct file *filp,
++	unsigned int cmd,
++	unsigned long arg)
++{
++	struct cryptoini cria, crie;
++	struct fcrypt *fcr = filp->private_data;
++	struct csession *cse;
++	struct csession_info info;
++	struct session2_op sop;
++	struct crypt_op cop;
++	struct crypt_kop kop;
++	struct crypt_find_op fop;
++	u_int64_t sid;
++	u_int32_t ses = 0;
++	int feat, fd, error = 0, crid;
++	mm_segment_t fs;
++
++	dprintk("%s(cmd=%x arg=%lx)\n", __FUNCTION__, cmd, arg);
++
++	switch (cmd) {
++
++	case CRIOGET: {
++		dprintk("%s(CRIOGET)\n", __FUNCTION__);
++		fs = get_fs();
++		set_fs(get_ds());
++		for (fd = 0; fd < files_fdtable(current->files)->max_fds; fd++)
++			if (files_fdtable(current->files)->fd[fd] == filp)
++				break;
++		fd = sys_dup(fd);
++		set_fs(fs);
++		put_user(fd, (int *) arg);
++		return IS_ERR_VALUE(fd) ? fd : 0;
++		}
++
++#define	CIOCGSESSSTR	(cmd == CIOCGSESSION ? "CIOCGSESSION" : "CIOCGSESSION2")
++	case CIOCGSESSION:
++	case CIOCGSESSION2:
++		dprintk("%s(%s)\n", __FUNCTION__, CIOCGSESSSTR);
++		memset(&crie, 0, sizeof(crie));
++		memset(&cria, 0, sizeof(cria));
++		memset(&info, 0, sizeof(info));
++		memset(&sop, 0, sizeof(sop));
++
++		if (copy_from_user(&sop, (void*)arg, (cmd == CIOCGSESSION) ?
++					sizeof(struct session_op) : sizeof(sop))) {
++			dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EFAULT;
++			goto bail;
++		}
++
++		switch (sop.cipher) {
++		case 0:
++			dprintk("%s(%s) - no cipher\n", __FUNCTION__, CIOCGSESSSTR);
++			break;
++		case CRYPTO_NULL_CBC:
++			info.blocksize = NULL_BLOCK_LEN;
++			info.minkey = NULL_MIN_KEY_LEN;
++			info.maxkey = NULL_MAX_KEY_LEN;
++			break;
++		case CRYPTO_DES_CBC:
++			info.blocksize = DES_BLOCK_LEN;
++			info.minkey = DES_MIN_KEY_LEN;
++			info.maxkey = DES_MAX_KEY_LEN;
++			break;
++		case CRYPTO_3DES_CBC:
++			info.blocksize = DES3_BLOCK_LEN;
++			info.minkey = DES3_MIN_KEY_LEN;
++			info.maxkey = DES3_MAX_KEY_LEN;
++			break;
++		case CRYPTO_BLF_CBC:
++			info.blocksize = BLOWFISH_BLOCK_LEN;
++			info.minkey = BLOWFISH_MIN_KEY_LEN;
++			info.maxkey = BLOWFISH_MAX_KEY_LEN;
++			break;
++		case CRYPTO_CAST_CBC:
++			info.blocksize = CAST128_BLOCK_LEN;
++			info.minkey = CAST128_MIN_KEY_LEN;
++			info.maxkey = CAST128_MAX_KEY_LEN;
++			break;
++		case CRYPTO_SKIPJACK_CBC:
++			info.blocksize = SKIPJACK_BLOCK_LEN;
++			info.minkey = SKIPJACK_MIN_KEY_LEN;
++			info.maxkey = SKIPJACK_MAX_KEY_LEN;
++			break;
++		case CRYPTO_AES_CBC:
++			info.blocksize = AES_BLOCK_LEN;
++			info.minkey = AES_MIN_KEY_LEN;
++			info.maxkey = AES_MAX_KEY_LEN;
++			break;
++		case CRYPTO_ARC4:
++			info.blocksize = ARC4_BLOCK_LEN;
++			info.minkey = ARC4_MIN_KEY_LEN;
++			info.maxkey = ARC4_MAX_KEY_LEN;
++			break;
++		case CRYPTO_CAMELLIA_CBC:
++			info.blocksize = CAMELLIA_BLOCK_LEN;
++			info.minkey = CAMELLIA_MIN_KEY_LEN;
++			info.maxkey = CAMELLIA_MAX_KEY_LEN;
++			break;
++		default:
++			dprintk("%s(%s) - bad cipher\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EINVAL;
++			goto bail;
++		}
++
++		switch (sop.mac) {
++		case 0:
++			dprintk("%s(%s) - no mac\n", __FUNCTION__, CIOCGSESSSTR);
++			break;
++		case CRYPTO_NULL_HMAC:
++			info.authsize = NULL_HASH_LEN;
++			break;
++		case CRYPTO_MD5:
++			info.authsize = MD5_HASH_LEN;
++			break;
++		case CRYPTO_SHA1:
++			info.authsize = SHA1_HASH_LEN;
++			break;
++		case CRYPTO_SHA2_256:
++			info.authsize = SHA2_256_HASH_LEN;
++			break;
++		case CRYPTO_SHA2_384:
++			info.authsize = SHA2_384_HASH_LEN;
++  			break;
++		case CRYPTO_SHA2_512:
++			info.authsize = SHA2_512_HASH_LEN;
++			break;
++		case CRYPTO_RIPEMD160:
++			info.authsize = RIPEMD160_HASH_LEN;
++			break;
++		case CRYPTO_MD5_HMAC:
++			info.authsize = MD5_HASH_LEN;
++			info.authkey = 16;
++			break;
++		case CRYPTO_SHA1_HMAC:
++			info.authsize = SHA1_HASH_LEN;
++			info.authkey = 20;
++			break;
++		case CRYPTO_SHA2_256_HMAC:
++			info.authsize = SHA2_256_HASH_LEN;
++			info.authkey = 32;
++			break;
++		case CRYPTO_SHA2_384_HMAC:
++			info.authsize = SHA2_384_HASH_LEN;
++			info.authkey = 48;
++  			break;
++		case CRYPTO_SHA2_512_HMAC:
++			info.authsize = SHA2_512_HASH_LEN;
++			info.authkey = 64;
++			break;
++		case CRYPTO_RIPEMD160_HMAC:
++			info.authsize = RIPEMD160_HASH_LEN;
++			info.authkey = 20;
++			break;
++		default:
++			dprintk("%s(%s) - bad mac\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EINVAL;
++			goto bail;
++		}
++
++		if (info.blocksize) {
++			crie.cri_alg = sop.cipher;
++			crie.cri_klen = sop.keylen * 8;
++			if ((info.maxkey && sop.keylen > info.maxkey) ||
++				   	sop.keylen < info.minkey) {
++				dprintk("%s(%s) - bad key\n", __FUNCTION__, CIOCGSESSSTR);
++				error = EINVAL;
++				goto bail;
++			}
++
++			crie.cri_key = (u_int8_t *) kmalloc(crie.cri_klen/8+1, GFP_KERNEL);
++			if (copy_from_user(crie.cri_key, sop.key,
++							crie.cri_klen/8)) {
++				dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++				error = EFAULT;
++				goto bail;
++			}
++			if (info.authsize)
++				crie.cri_next = &cria;
++		}
++
++		if (info.authsize) {
++			cria.cri_alg = sop.mac;
++			cria.cri_klen = sop.mackeylen * 8;
++			if (info.authkey && sop.mackeylen != info.authkey) {
++				dprintk("%s(%s) - mackeylen %d != %d\n", __FUNCTION__,
++						CIOCGSESSSTR, sop.mackeylen, info.authkey);
++				error = EINVAL;
++				goto bail;
++			}
++
++			if (cria.cri_klen) {
++				cria.cri_key = (u_int8_t *) kmalloc(cria.cri_klen/8,GFP_KERNEL);
++				if (copy_from_user(cria.cri_key, sop.mackey,
++								cria.cri_klen / 8)) {
++					dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++					error = EFAULT;
++					goto bail;
++				}
++			}
++		}
++
++		/* NB: CIOGSESSION2 has the crid */
++		if (cmd == CIOCGSESSION2) {
++			crid = sop.crid;
++			error = checkcrid(crid);
++			if (error) {
++				dprintk("%s(%s) - checkcrid %x\n", __FUNCTION__,
++						CIOCGSESSSTR, error);
++				goto bail;
++			}
++		} else {
++			/* allow either HW or SW to be used */
++			crid = CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE;
++		}
++		error = crypto_newsession(&sid, (info.blocksize ? &crie : &cria), crid);
++		if (error) {
++			dprintk("%s(%s) - newsession %d\n",__FUNCTION__,CIOCGSESSSTR,error);
++			goto bail;
++		}
++
++		cse = csecreate(fcr, sid, &crie, &cria, &info);
++		if (cse == NULL) {
++			crypto_freesession(sid);
++			error = EINVAL;
++			dprintk("%s(%s) - csecreate failed\n", __FUNCTION__, CIOCGSESSSTR);
++			goto bail;
++		}
++		sop.ses = cse->ses;
++
++		if (cmd == CIOCGSESSION2) {
++			/* return hardware/driver id */
++			sop.crid = CRYPTO_SESID2HID(cse->sid);
++		}
++
++		if (copy_to_user((void*)arg, &sop, (cmd == CIOCGSESSION) ?
++					sizeof(struct session_op) : sizeof(sop))) {
++			dprintk("%s(%s) - bad copy\n", __FUNCTION__, CIOCGSESSSTR);
++			error = EFAULT;
++		}
++bail:
++		if (error) {
++			dprintk("%s(%s) - bail %d\n", __FUNCTION__, CIOCGSESSSTR, error);
++			if (crie.cri_key)
++				kfree(crie.cri_key);
++			if (cria.cri_key)
++				kfree(cria.cri_key);
++		}
++		break;
++	case CIOCFSESSION:
++		dprintk("%s(CIOCFSESSION)\n", __FUNCTION__);
++		get_user(ses, (uint32_t*)arg);
++		cse = csefind(fcr, ses);
++		if (cse == NULL) {
++			error = EINVAL;
++			dprintk("%s(CIOCFSESSION) - Fail %d\n", __FUNCTION__, error);
++			break;
++		}
++		csedelete(fcr, cse);
++		error = csefree(cse);
++		break;
++	case CIOCCRYPT:
++		dprintk("%s(CIOCCRYPT)\n", __FUNCTION__);
++		if(copy_from_user(&cop, (void*)arg, sizeof(cop))) {
++			dprintk("%s(CIOCCRYPT) - bad copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		cse = csefind(fcr, cop.ses);
++		if (cse == NULL) {
++			error = EINVAL;
++			dprintk("%s(CIOCCRYPT) - Fail %d\n", __FUNCTION__, error);
++			break;
++		}
++		error = cryptodev_op(cse, &cop);
++		if(copy_to_user((void*)arg, &cop, sizeof(cop))) {
++			dprintk("%s(CIOCCRYPT) - bad return copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		break;
++	case CIOCKEY:
++	case CIOCKEY2:
++		dprintk("%s(CIOCKEY)\n", __FUNCTION__);
++		if (!crypto_userasymcrypto)
++			return (EPERM);		/* XXX compat? */
++		if(copy_from_user(&kop, (void*)arg, sizeof(kop))) {
++			dprintk("%s(CIOCKEY) - bad copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		if (cmd == CIOCKEY) {
++			/* NB: crypto core enforces s/w driver use */
++			kop.crk_crid =
++			    CRYPTOCAP_F_HARDWARE | CRYPTOCAP_F_SOFTWARE;
++		}
++		error = cryptodev_key(&kop);
++		if(copy_to_user((void*)arg, &kop, sizeof(kop))) {
++			dprintk("%s(CIOCGKEY) - bad return copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		break;
++	case CIOCASYMFEAT:
++		dprintk("%s(CIOCASYMFEAT)\n", __FUNCTION__);
++		if (!crypto_userasymcrypto) {
++			/*
++			 * NB: if user asym crypto operations are
++			 * not permitted return "no algorithms"
++			 * so well-behaved applications will just
++			 * fallback to doing them in software.
++			 */
++			feat = 0;
++		} else
++			error = crypto_getfeat(&feat);
++		if (!error) {
++		  error = copy_to_user((void*)arg, &feat, sizeof(feat));
++		}
++		break;
++	case CIOCFINDDEV:
++		if (copy_from_user(&fop, (void*)arg, sizeof(fop))) {
++			dprintk("%s(CIOCFINDDEV) - bad copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		error = cryptodev_find(&fop);
++		if (copy_to_user((void*)arg, &fop, sizeof(fop))) {
++			dprintk("%s(CIOCFINDDEV) - bad return copy\n", __FUNCTION__);
++			error = EFAULT;
++			goto bail;
++		}
++		break;
++	default:
++		dprintk("%s(unknown ioctl 0x%x)\n", __FUNCTION__, cmd);
++		error = EINVAL;
++		break;
++	}
++	return(-error);
++}
++
++#ifdef HAVE_UNLOCKED_IOCTL
++static long
++cryptodev_unlocked_ioctl(
++	struct file *filp,
++	unsigned int cmd,
++	unsigned long arg)
++{
++	return cryptodev_ioctl(NULL, filp, cmd, arg);
++}
++#endif
++
++static int
++cryptodev_open(struct inode *inode, struct file *filp)
++{
++	struct fcrypt *fcr;
++
++	dprintk("%s()\n", __FUNCTION__);
++	//if (filp->private_data) {
++	//	printk("cryptodev: Private data already exists !\n");
++	//	return(0);
++	//}
++
++	fcr = kmalloc(sizeof(*fcr), GFP_KERNEL);
++	if (!fcr) {
++		dprintk("%s() - malloc failed\n", __FUNCTION__);
++		return(-ENOMEM);
++	}
++	memset(fcr, 0, sizeof(*fcr));
++
++	INIT_LIST_HEAD(&fcr->csessions);
++	filp->private_data = fcr;
++	return(0);
++}
++
++static int
++cryptodev_release(struct inode *inode, struct file *filp)
++{
++	struct fcrypt *fcr = filp->private_data;
++	struct csession *cse, *tmp;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (!filp) {
++		printk("cryptodev: No private data on release\n");
++		return(0);
++	}
++
++	list_for_each_entry_safe(cse, tmp, &fcr->csessions, list) {
++		list_del(&cse->list);
++		(void)csefree(cse);
++	}
++	filp->private_data = NULL;
++	kfree(fcr);
++	return(0);
++}
++
++static struct file_operations cryptodev_fops = {
++	.owner = THIS_MODULE,
++	.open = cryptodev_open,
++	.release = cryptodev_release,
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,36)
++	.ioctl = cryptodev_ioctl,
++#endif
++#ifdef HAVE_UNLOCKED_IOCTL
++	.unlocked_ioctl = cryptodev_unlocked_ioctl,
++#endif
++};
++
++static struct miscdevice cryptodev = {
++	.minor = CRYPTODEV_MINOR,
++	.name = "crypto",
++	.fops = &cryptodev_fops,
++};
++
++static int __init
++cryptodev_init(void)
++{
++	int rc;
++
++	dprintk("%s(%p)\n", __FUNCTION__, cryptodev_init);
++	rc = misc_register(&cryptodev);
++	if (rc) {
++		printk(KERN_ERR "cryptodev: registration of /dev/crypto failed\n");
++		return(rc);
++	}
++
++	return(0);
++}
++
++static void __exit
++cryptodev_exit(void)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	misc_deregister(&cryptodev);
++}
++
++module_init(cryptodev_init);
++module_exit(cryptodev_exit);
++
++MODULE_LICENSE("BSD");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("Cryptodev (user interface to OCF)");
+diff --git a/crypto/ocf/cryptosoft.c b/crypto/ocf/cryptosoft.c
+new file mode 100644
+index 0000000..52e1570
+--- /dev/null
++++ b/crypto/ocf/cryptosoft.c
+@@ -0,0 +1,1210 @@
++/*
++ * An OCF module that uses the linux kernel cryptoapi, based on the
++ * original cryptosoft for BSD by Angelos D. Keromytis (angelos@cis.upenn.edu)
++ * but is mostly unrecognisable,
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2004-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ * ---------------------------------------------------------------------------
++ */
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/sched.h>
++#include <linux/wait.h>
++#include <linux/crypto.h>
++#include <linux/mm.h>
++#include <linux/skbuff.h>
++#include <linux/random.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10)
++#include <linux/scatterlist.h>
++#endif
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,29)
++#include <crypto/hash.h>
++#endif
++
++#include <cryptodev.h>
++#include <uio.h>
++
++struct {
++	softc_device_decl	sc_dev;
++} swcr_softc;
++
++#define offset_in_page(p) ((unsigned long)(p) & ~PAGE_MASK)
++
++#define SW_TYPE_CIPHER		0x01
++#define SW_TYPE_HMAC		0x02
++#define SW_TYPE_HASH		0x04
++#define SW_TYPE_COMP		0x08
++#define SW_TYPE_BLKCIPHER	0x10
++#define SW_TYPE_ALG_MASK	0x1f
++
++#define SW_TYPE_ASYNC		0x8000
++
++/* We change some of the above if we have an async interface */
++
++#define SW_TYPE_ALG_AMASK	(SW_TYPE_ALG_MASK | SW_TYPE_ASYNC)
++
++#define SW_TYPE_ABLKCIPHER	(SW_TYPE_BLKCIPHER | SW_TYPE_ASYNC)
++#define SW_TYPE_AHASH		(SW_TYPE_HASH | SW_TYPE_ASYNC)
++#define SW_TYPE_AHMAC		(SW_TYPE_HMAC | SW_TYPE_ASYNC)
++
++#define SCATTERLIST_MAX 16
++
++struct swcr_data {
++	int					sw_type;
++	int					sw_alg;
++	struct crypto_tfm	*sw_tfm;
++	union {
++		struct {
++			char *sw_key;
++			int  sw_klen;
++			int  sw_mlen;
++		} hmac;
++		void *sw_comp_buf;
++	} u;
++	struct swcr_data	*sw_next;
++};
++
++struct swcr_req {
++	struct swcr_data	*sw_head;
++	struct swcr_data	*sw;
++	struct cryptop		*crp;
++	struct cryptodesc	*crd;
++	struct scatterlist	 sg[SCATTERLIST_MAX];
++	unsigned char		 iv[EALG_MAX_BLOCK_LEN];
++	char				 result[HASH_MAX_LEN];
++	void				*crypto_req;
++};
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
++static kmem_cache_t *swcr_req_cache;
++#else
++static struct kmem_cache *swcr_req_cache;
++#endif
++
++#ifndef CRYPTO_TFM_MODE_CBC
++/*
++ * As of linux-2.6.21 this is no longer defined, and presumably no longer
++ * needed to be passed into the crypto core code.
++ */
++#define	CRYPTO_TFM_MODE_CBC	0
++#define	CRYPTO_TFM_MODE_ECB	0
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
++	/*
++	 * Linux 2.6.19 introduced a new Crypto API, setup macro's to convert new
++	 * API into old API.
++	 */
++
++	/* Symmetric/Block Cipher */
++	struct blkcipher_desc
++	{
++		struct crypto_tfm *tfm;
++		void *info;
++	};
++	#define ecb(X)								#X , CRYPTO_TFM_MODE_ECB
++	#define cbc(X)								#X , CRYPTO_TFM_MODE_CBC
++	#define crypto_has_blkcipher(X, Y, Z)		crypto_alg_available(X, 0)
++	#define crypto_blkcipher_cast(X)			X
++	#define crypto_blkcipher_tfm(X)				X
++	#define crypto_alloc_blkcipher(X, Y, Z)		crypto_alloc_tfm(X, mode)
++	#define crypto_blkcipher_ivsize(X)			crypto_tfm_alg_ivsize(X)
++	#define crypto_blkcipher_blocksize(X)		crypto_tfm_alg_blocksize(X)
++	#define crypto_blkcipher_setkey(X, Y, Z)	crypto_cipher_setkey(X, Y, Z)
++	#define crypto_blkcipher_encrypt_iv(W, X, Y, Z)	\
++				crypto_cipher_encrypt_iv((W)->tfm, X, Y, Z, (u8 *)((W)->info))
++	#define crypto_blkcipher_decrypt_iv(W, X, Y, Z)	\
++				crypto_cipher_decrypt_iv((W)->tfm, X, Y, Z, (u8 *)((W)->info))
++	#define crypto_blkcipher_set_flags(x, y)	/* nop */
++
++	/* Hash/HMAC/Digest */
++	struct hash_desc
++	{
++		struct crypto_tfm *tfm;
++	};
++	#define hmac(X)							#X , 0
++	#define crypto_has_hash(X, Y, Z)		crypto_alg_available(X, 0)
++	#define crypto_hash_cast(X)				X
++	#define crypto_hash_tfm(X)				X
++	#define crypto_alloc_hash(X, Y, Z)		crypto_alloc_tfm(X, mode)
++	#define crypto_hash_digestsize(X)		crypto_tfm_alg_digestsize(X)
++	#define crypto_hash_digest(W, X, Y, Z)	\
++				crypto_digest_digest((W)->tfm, X, sg_num, Z)
++
++	/* Asymmetric Cipher */
++	#define crypto_has_cipher(X, Y, Z)		crypto_alg_available(X, 0)
++
++	/* Compression */
++	#define crypto_has_comp(X, Y, Z)		crypto_alg_available(X, 0)
++	#define crypto_comp_tfm(X)				X
++	#define crypto_comp_cast(X)				X
++	#define crypto_alloc_comp(X, Y, Z)		crypto_alloc_tfm(X, mode)
++	#define plain(X)	#X , 0
++#else
++	#define ecb(X)	"ecb(" #X ")" , 0
++	#define cbc(X)	"cbc(" #X ")" , 0
++	#define hmac(X)	"hmac(" #X ")" , 0
++	#define plain(X)	#X , 0
++#endif /* if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19) */
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,22)
++/* no ablkcipher in older kernels */
++#define crypto_alloc_ablkcipher(a,b,c)		(NULL)
++#define crypto_ablkcipher_tfm(x)			((struct crypto_tfm *)(x))
++#define crypto_ablkcipher_set_flags(a, b)	/* nop */
++#define crypto_ablkcipher_setkey(x, y, z)	(-EINVAL)
++#define	crypto_has_ablkcipher(a,b,c)		(0)
++#else
++#define	HAVE_ABLKCIPHER
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,32)
++/* no ahash in older kernels */
++#define crypto_ahash_tfm(x)					((struct crypto_tfm *)(x))
++#define	crypto_alloc_ahash(a,b,c)			(NULL)
++#define	crypto_ahash_digestsize(x)			0
++#else
++#define	HAVE_AHASH
++#endif
++
++struct crypto_details {
++	char *alg_name;
++	int mode;
++	int sw_type;
++};
++
++static struct crypto_details crypto_details[] = {
++	[CRYPTO_DES_CBC]         = { cbc(des),          SW_TYPE_BLKCIPHER, },
++	[CRYPTO_3DES_CBC]        = { cbc(des3_ede),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_BLF_CBC]         = { cbc(blowfish),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_CAST_CBC]        = { cbc(cast5),        SW_TYPE_BLKCIPHER, },
++	[CRYPTO_SKIPJACK_CBC]    = { cbc(skipjack),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_MD5_HMAC]        = { hmac(md5),         SW_TYPE_HMAC, },
++	[CRYPTO_SHA1_HMAC]       = { hmac(sha1),        SW_TYPE_HMAC, },
++	[CRYPTO_RIPEMD160_HMAC]  = { hmac(ripemd160),   SW_TYPE_HMAC, },
++	[CRYPTO_MD5_KPDK]        = { plain(md5-kpdk),   SW_TYPE_HASH, },
++	[CRYPTO_SHA1_KPDK]       = { plain(sha1-kpdk),  SW_TYPE_HASH, },
++	[CRYPTO_AES_CBC]         = { cbc(aes),          SW_TYPE_BLKCIPHER, },
++	[CRYPTO_ARC4]            = { ecb(arc4),         SW_TYPE_BLKCIPHER, },
++	[CRYPTO_MD5]             = { plain(md5),        SW_TYPE_HASH, },
++	[CRYPTO_SHA1]            = { plain(sha1),       SW_TYPE_HASH, },
++	[CRYPTO_NULL_HMAC]       = { hmac(digest_null), SW_TYPE_HMAC, },
++	[CRYPTO_NULL_CBC]        = { cbc(cipher_null),  SW_TYPE_BLKCIPHER, },
++	[CRYPTO_DEFLATE_COMP]    = { plain(deflate),    SW_TYPE_COMP, },
++	[CRYPTO_SHA2_256_HMAC]   = { hmac(sha256),      SW_TYPE_HMAC, },
++	[CRYPTO_SHA2_384_HMAC]   = { hmac(sha384),      SW_TYPE_HMAC, },
++	[CRYPTO_SHA2_512_HMAC]   = { hmac(sha512),      SW_TYPE_HMAC, },
++	[CRYPTO_CAMELLIA_CBC]    = { cbc(camellia),     SW_TYPE_BLKCIPHER, },
++	[CRYPTO_SHA2_256]        = { plain(sha256),     SW_TYPE_HASH, },
++	[CRYPTO_SHA2_384]        = { plain(sha384),     SW_TYPE_HASH, },
++	[CRYPTO_SHA2_512]        = { plain(sha512),     SW_TYPE_HASH, },
++	[CRYPTO_RIPEMD160]       = { plain(ripemd160),  SW_TYPE_HASH, },
++};
++
++int32_t swcr_id = -1;
++module_param(swcr_id, int, 0444);
++MODULE_PARM_DESC(swcr_id, "Read-Only OCF ID for cryptosoft driver");
++
++int swcr_fail_if_compression_grows = 1;
++module_param(swcr_fail_if_compression_grows, int, 0644);
++MODULE_PARM_DESC(swcr_fail_if_compression_grows,
++                "Treat compression that results in more data as a failure");
++
++int swcr_no_ahash = 0;
++module_param(swcr_no_ahash, int, 0644);
++MODULE_PARM_DESC(swcr_no_ahash,
++                "Do not use async hash/hmac even if available");
++
++int swcr_no_ablk = 0;
++module_param(swcr_no_ablk, int, 0644);
++MODULE_PARM_DESC(swcr_no_ablk,
++                "Do not use async blk ciphers even if available");
++
++static struct swcr_data **swcr_sessions = NULL;
++static u_int32_t swcr_sesnum = 0;
++
++static	int swcr_process(device_t, struct cryptop *, int);
++static	int swcr_newsession(device_t, u_int32_t *, struct cryptoini *);
++static	int swcr_freesession(device_t, u_int64_t);
++
++static device_method_t swcr_methods = {
++	/* crypto device methods */
++	DEVMETHOD(cryptodev_newsession,	swcr_newsession),
++	DEVMETHOD(cryptodev_freesession,swcr_freesession),
++	DEVMETHOD(cryptodev_process,	swcr_process),
++};
++
++#define debug swcr_debug
++int swcr_debug = 0;
++module_param(swcr_debug, int, 0644);
++MODULE_PARM_DESC(swcr_debug, "Enable debug");
++
++static void swcr_process_req(struct swcr_req *req);
++
++/*
++ * Generate a new software session.
++ */
++static int
++swcr_newsession(device_t dev, u_int32_t *sid, struct cryptoini *cri)
++{
++	struct swcr_data **swd;
++	u_int32_t i;
++	int error;
++	char *algo;
++	int mode;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (sid == NULL || cri == NULL) {
++		dprintk("%s,%d - EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	if (swcr_sessions) {
++		for (i = 1; i < swcr_sesnum; i++)
++			if (swcr_sessions[i] == NULL)
++				break;
++	} else
++		i = 1;		/* NB: to silence compiler warning */
++
++	if (swcr_sessions == NULL || i == swcr_sesnum) {
++		if (swcr_sessions == NULL) {
++			i = 1; /* We leave swcr_sessions[0] empty */
++			swcr_sesnum = CRYPTO_SW_SESSIONS;
++		} else
++			swcr_sesnum *= 2;
++
++		swd = kmalloc(swcr_sesnum * sizeof(struct swcr_data *), SLAB_ATOMIC);
++		if (swd == NULL) {
++			/* Reset session number */
++			if (swcr_sesnum == CRYPTO_SW_SESSIONS)
++				swcr_sesnum = 0;
++			else
++				swcr_sesnum /= 2;
++			dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++			return ENOBUFS;
++		}
++		memset(swd, 0, swcr_sesnum * sizeof(struct swcr_data *));
++
++		/* Copy existing sessions */
++		if (swcr_sessions) {
++			memcpy(swd, swcr_sessions,
++			    (swcr_sesnum / 2) * sizeof(struct swcr_data *));
++			kfree(swcr_sessions);
++		}
++
++		swcr_sessions = swd;
++	}
++
++	swd = &swcr_sessions[i];
++	*sid = i;
++
++	while (cri) {
++		*swd = (struct swcr_data *) kmalloc(sizeof(struct swcr_data),
++				SLAB_ATOMIC);
++		if (*swd == NULL) {
++			swcr_freesession(NULL, i);
++			dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++			return ENOBUFS;
++		}
++		memset(*swd, 0, sizeof(struct swcr_data));
++
++		if (cri->cri_alg < 0 ||
++				cri->cri_alg>=sizeof(crypto_details)/sizeof(crypto_details[0])){
++			printk("cryptosoft: Unknown algorithm 0x%x\n", cri->cri_alg);
++			swcr_freesession(NULL, i);
++			return EINVAL;
++		}
++
++		algo = crypto_details[cri->cri_alg].alg_name;
++		if (!algo || !*algo) {
++			printk("cryptosoft: Unsupported algorithm 0x%x\n", cri->cri_alg);
++			swcr_freesession(NULL, i);
++			return EINVAL;
++		}
++
++		mode = crypto_details[cri->cri_alg].mode;
++		(*swd)->sw_type = crypto_details[cri->cri_alg].sw_type;
++		(*swd)->sw_alg = cri->cri_alg;
++
++		/* Algorithm specific configuration */
++		switch (cri->cri_alg) {
++		case CRYPTO_NULL_CBC:
++			cri->cri_klen = 0; /* make it work with crypto API */
++			break;
++		default:
++			break;
++		}
++
++		if ((*swd)->sw_type & SW_TYPE_BLKCIPHER) {
++			dprintk("%s crypto_alloc_*blkcipher(%s, 0x%x)\n", __FUNCTION__,
++					algo, mode);
++
++			/* try async first */
++			(*swd)->sw_tfm = swcr_no_ablk ? NULL :
++					crypto_ablkcipher_tfm(crypto_alloc_ablkcipher(algo, 0, 0));
++			if ((*swd)->sw_tfm) {
++				dprintk("%s %s cipher is async\n", __FUNCTION__, algo);
++				(*swd)->sw_type |= SW_TYPE_ASYNC;
++			} else {
++				dprintk("%s %s cipher is sync\n", __FUNCTION__, algo);
++				(*swd)->sw_tfm = crypto_blkcipher_tfm(
++						crypto_alloc_blkcipher(algo, 0, CRYPTO_ALG_ASYNC));
++			}
++			if (!(*swd)->sw_tfm) {
++				dprintk("cryptosoft: crypto_alloc_blkcipher failed(%s, 0x%x)\n",
++						algo,mode);
++				swcr_freesession(NULL, i);
++				return EINVAL;
++			}
++
++			if (debug) {
++				dprintk("%s key:cri->cri_klen=%d,(cri->cri_klen + 7)/8=%d",
++						__FUNCTION__, cri->cri_klen, (cri->cri_klen + 7) / 8);
++				for (i = 0; i < (cri->cri_klen + 7) / 8; i++)
++					dprintk("%s0x%x", (i % 8) ? " " : "\n    ",
++							cri->cri_key[i] & 0xff);
++				dprintk("\n");
++			}
++			if ((*swd)->sw_type & SW_TYPE_ASYNC) {
++				/* OCF doesn't enforce keys */
++				crypto_ablkcipher_set_flags(
++						__crypto_ablkcipher_cast((*swd)->sw_tfm),
++							CRYPTO_TFM_REQ_WEAK_KEY);
++				error = crypto_ablkcipher_setkey(
++							__crypto_ablkcipher_cast((*swd)->sw_tfm),
++								cri->cri_key, (cri->cri_klen + 7) / 8);
++			} else {
++				/* OCF doesn't enforce keys */
++				crypto_blkcipher_set_flags(
++						crypto_blkcipher_cast((*swd)->sw_tfm),
++							CRYPTO_TFM_REQ_WEAK_KEY);
++				error = crypto_blkcipher_setkey(
++							crypto_blkcipher_cast((*swd)->sw_tfm),
++								cri->cri_key, (cri->cri_klen + 7) / 8);
++			}
++			if (error) {
++				printk("cryptosoft: setkey failed %d (crt_flags=0x%x)\n", error,
++						(*swd)->sw_tfm->crt_flags);
++				swcr_freesession(NULL, i);
++				return error;
++			}
++		} else if ((*swd)->sw_type & (SW_TYPE_HMAC | SW_TYPE_HASH)) {
++			dprintk("%s crypto_alloc_*hash(%s, 0x%x)\n", __FUNCTION__,
++					algo, mode);
++
++			/* try async first */
++			(*swd)->sw_tfm = swcr_no_ahash ? NULL :
++					crypto_ahash_tfm(crypto_alloc_ahash(algo, 0, 0));
++			if ((*swd)->sw_tfm) {
++				dprintk("%s %s hash is async\n", __FUNCTION__, algo);
++				(*swd)->sw_type |= SW_TYPE_ASYNC;
++			} else {
++				dprintk("%s %s hash is sync\n", __FUNCTION__, algo);
++				(*swd)->sw_tfm = crypto_hash_tfm(
++						crypto_alloc_hash(algo, 0, CRYPTO_ALG_ASYNC));
++			}
++
++			if (!(*swd)->sw_tfm) {
++				dprintk("cryptosoft: crypto_alloc_hash failed(%s,0x%x)\n",
++						algo, mode);
++				swcr_freesession(NULL, i);
++				return EINVAL;
++			}
++
++			(*swd)->u.hmac.sw_klen = (cri->cri_klen + 7) / 8;
++			(*swd)->u.hmac.sw_key = (char *)kmalloc((*swd)->u.hmac.sw_klen,
++					SLAB_ATOMIC);
++			if ((*swd)->u.hmac.sw_key == NULL) {
++				swcr_freesession(NULL, i);
++				dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++				return ENOBUFS;
++			}
++			memcpy((*swd)->u.hmac.sw_key, cri->cri_key, (*swd)->u.hmac.sw_klen);
++			if (cri->cri_mlen) {
++				(*swd)->u.hmac.sw_mlen = cri->cri_mlen;
++			} else if ((*swd)->sw_type & SW_TYPE_ASYNC) {
++				(*swd)->u.hmac.sw_mlen = crypto_ahash_digestsize(
++						__crypto_ahash_cast((*swd)->sw_tfm));
++			} else  {
++				(*swd)->u.hmac.sw_mlen = crypto_hash_digestsize(
++						crypto_hash_cast((*swd)->sw_tfm));
++			}
++		} else if ((*swd)->sw_type & SW_TYPE_COMP) {
++			(*swd)->sw_tfm = crypto_comp_tfm(
++					crypto_alloc_comp(algo, 0, CRYPTO_ALG_ASYNC));
++			if (!(*swd)->sw_tfm) {
++				dprintk("cryptosoft: crypto_alloc_comp failed(%s,0x%x)\n",
++						algo, mode);
++				swcr_freesession(NULL, i);
++				return EINVAL;
++			}
++			(*swd)->u.sw_comp_buf = kmalloc(CRYPTO_MAX_DATA_LEN, SLAB_ATOMIC);
++			if ((*swd)->u.sw_comp_buf == NULL) {
++				swcr_freesession(NULL, i);
++				dprintk("%s,%d: ENOBUFS\n", __FILE__, __LINE__);
++				return ENOBUFS;
++			}
++		} else {
++			printk("cryptosoft: Unhandled sw_type %d\n", (*swd)->sw_type);
++			swcr_freesession(NULL, i);
++			return EINVAL;
++		}
++
++		cri = cri->cri_next;
++		swd = &((*swd)->sw_next);
++	}
++	return 0;
++}
++
++/*
++ * Free a session.
++ */
++static int
++swcr_freesession(device_t dev, u_int64_t tid)
++{
++	struct swcr_data *swd;
++	u_int32_t sid = CRYPTO_SESID2LID(tid);
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (sid > swcr_sesnum || swcr_sessions == NULL ||
++			swcr_sessions[sid] == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		return(EINVAL);
++	}
++
++	/* Silently accept and return */
++	if (sid == 0)
++		return(0);
++
++	while ((swd = swcr_sessions[sid]) != NULL) {
++		swcr_sessions[sid] = swd->sw_next;
++		if (swd->sw_tfm) {
++			switch (swd->sw_type & SW_TYPE_ALG_AMASK) {
++#ifdef HAVE_AHASH
++			case SW_TYPE_AHMAC:
++			case SW_TYPE_AHASH:
++				crypto_free_ahash(__crypto_ahash_cast(swd->sw_tfm));
++				break;
++#endif
++#ifdef HAVE_ABLKCIPHER
++			case SW_TYPE_ABLKCIPHER:
++				crypto_free_ablkcipher(__crypto_ablkcipher_cast(swd->sw_tfm));
++				break;
++#endif
++			case SW_TYPE_BLKCIPHER:
++				crypto_free_blkcipher(crypto_blkcipher_cast(swd->sw_tfm));
++				break;
++			case SW_TYPE_HMAC:
++			case SW_TYPE_HASH:
++				crypto_free_hash(crypto_hash_cast(swd->sw_tfm));
++				break;
++			case SW_TYPE_COMP:
++				crypto_free_comp(crypto_comp_cast(swd->sw_tfm));
++			default:
++				crypto_free_tfm(swd->sw_tfm);
++				break;
++			}
++			swd->sw_tfm = NULL;
++		}
++		if (swd->sw_type & SW_TYPE_COMP) {
++			if (swd->u.sw_comp_buf)
++				kfree(swd->u.sw_comp_buf);
++		} else {
++			if (swd->u.hmac.sw_key)
++				kfree(swd->u.hmac.sw_key);
++		}
++		kfree(swd);
++	}
++	return 0;
++}
++
++#if defined(HAVE_ABLKCIPHER) || defined(HAVE_AHASH)
++/* older kernels had no async interface */
++
++static void swcr_process_callback(struct crypto_async_request *creq, int err)
++{
++	struct swcr_req *req = creq->data;
++
++	dprintk("%s()\n", __FUNCTION__);
++	if (err) {
++		if (err == -EINPROGRESS)
++			return;
++		dprintk("%s() fail %d\n", __FUNCTION__, -err);
++		req->crp->crp_etype = -err;
++		goto done;
++	}
++
++	switch (req->sw->sw_type & SW_TYPE_ALG_AMASK) {
++	case SW_TYPE_AHMAC:
++	case SW_TYPE_AHASH:
++		crypto_copyback(req->crp->crp_flags, req->crp->crp_buf,
++				req->crd->crd_inject, req->sw->u.hmac.sw_mlen, req->result);
++		ahash_request_free(req->crypto_req);
++		break;
++	case SW_TYPE_ABLKCIPHER:
++		ablkcipher_request_free(req->crypto_req);
++		break;
++	default:
++		req->crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++	req->crd = req->crd->crd_next;
++	if (req->crd) {
++		swcr_process_req(req);
++		return;
++	}
++
++done:
++	dprintk("%s crypto_done %p\n", __FUNCTION__, req);
++	crypto_done(req->crp);
++	kmem_cache_free(swcr_req_cache, req);
++}
++#endif /* defined(HAVE_ABLKCIPHER) || defined(HAVE_AHASH) */
++
++
++static void swcr_process_req(struct swcr_req *req)
++{
++	struct swcr_data *sw;
++	struct cryptop *crp = req->crp;
++	struct cryptodesc *crd = req->crd;
++	struct sk_buff *skb = (struct sk_buff *) crp->crp_buf;
++	struct uio *uiop = (struct uio *) crp->crp_buf;
++	int sg_num, sg_len, skip;
++
++	dprintk("%s()\n", __FUNCTION__);
++
++	/*
++	 * Find the crypto context.
++	 *
++	 * XXX Note that the logic here prevents us from having
++	 * XXX the same algorithm multiple times in a session
++	 * XXX (or rather, we can but it won't give us the right
++	 * XXX results). To do that, we'd need some way of differentiating
++	 * XXX between the various instances of an algorithm (so we can
++	 * XXX locate the correct crypto context).
++	 */
++	for (sw = req->sw_head; sw && sw->sw_alg != crd->crd_alg; sw = sw->sw_next)
++		;
++
++	/* No such context ? */
++	if (sw == NULL) {
++		crp->crp_etype = EINVAL;
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		goto done;
++	}
++
++	req->sw = sw;
++	skip = crd->crd_skip;
++
++	/*
++	 * setup the SG list skip from the start of the buffer
++	 */
++	memset(req->sg, 0, sizeof(req->sg));
++	sg_init_table(req->sg, SCATTERLIST_MAX);
++	if (crp->crp_flags & CRYPTO_F_SKBUF) {
++		int i, len;
++
++		sg_num = 0;
++		sg_len = 0;
++
++		if (skip < skb_headlen(skb)) {
++			len = skb_headlen(skb) - skip;
++			if (len + sg_len > crd->crd_len)
++				len = crd->crd_len - sg_len;
++			sg_set_page(&req->sg[sg_num],
++				virt_to_page(skb->data + skip), len,
++				offset_in_page(skb->data + skip));
++			sg_len += len;
++			sg_num++;
++			skip = 0;
++		} else
++			skip -= skb_headlen(skb);
++
++		for (i = 0; sg_len < crd->crd_len &&
++					i < skb_shinfo(skb)->nr_frags &&
++					sg_num < SCATTERLIST_MAX; i++) {
++			if (skip < skb_shinfo(skb)->frags[i].size) {
++				len = skb_shinfo(skb)->frags[i].size - skip;
++				if (len + sg_len > crd->crd_len)
++					len = crd->crd_len - sg_len;
++				sg_set_page(&req->sg[sg_num],
++					skb_shinfo(skb)->frags[i].page,
++					len,
++					skb_shinfo(skb)->frags[i].page_offset + skip);
++				sg_len += len;
++				sg_num++;
++				skip = 0;
++			} else
++				skip -= skb_shinfo(skb)->frags[i].size;
++		}
++	} else if (crp->crp_flags & CRYPTO_F_IOV) {
++		int len;
++
++		sg_len = 0;
++		for (sg_num = 0; sg_len < crd->crd_len &&
++				sg_num < uiop->uio_iovcnt &&
++				sg_num < SCATTERLIST_MAX; sg_num++) {
++			if (skip <= uiop->uio_iov[sg_num].iov_len) {
++				len = uiop->uio_iov[sg_num].iov_len - skip;
++				if (len + sg_len > crd->crd_len)
++					len = crd->crd_len - sg_len;
++				sg_set_page(&req->sg[sg_num],
++					virt_to_page(uiop->uio_iov[sg_num].iov_base+skip),
++					len,
++					offset_in_page(uiop->uio_iov[sg_num].iov_base+skip));
++				sg_len += len;
++				skip = 0;
++			} else 
++				skip -= uiop->uio_iov[sg_num].iov_len;
++		}
++	} else {
++		sg_len = (crp->crp_ilen - skip);
++		if (sg_len > crd->crd_len)
++			sg_len = crd->crd_len;
++		sg_set_page(&req->sg[0], virt_to_page(crp->crp_buf + skip),
++			sg_len, offset_in_page(crp->crp_buf + skip));
++		sg_num = 1;
++	}
++
++	switch (sw->sw_type & SW_TYPE_ALG_AMASK) {
++
++#ifdef HAVE_AHASH
++	case SW_TYPE_AHMAC:
++	case SW_TYPE_AHASH:
++		{
++		int ret;
++
++		/* check we have room for the result */
++		if (crp->crp_ilen - crd->crd_inject < sw->u.hmac.sw_mlen) {
++			dprintk("cryptosoft: EINVAL crp_ilen=%d, len=%d, inject=%d "
++					"digestsize=%d\n", crp->crp_ilen, crd->crd_skip + sg_len,
++					crd->crd_inject, sw->u.hmac.sw_mlen);
++			crp->crp_etype = EINVAL;
++			goto done;
++		}
++
++		req->crypto_req =
++				ahash_request_alloc(__crypto_ahash_cast(sw->sw_tfm),GFP_KERNEL);
++		if (!req->crypto_req) {
++			crp->crp_etype = ENOMEM;
++			dprintk("%s,%d: ENOMEM ahash_request_alloc", __FILE__, __LINE__);
++			goto done;
++		}
++
++		ahash_request_set_callback(req->crypto_req,
++				CRYPTO_TFM_REQ_MAY_BACKLOG, swcr_process_callback, req);
++
++		memset(req->result, 0, sizeof(req->result));
++
++		if (sw->sw_type & SW_TYPE_AHMAC)
++			crypto_ahash_setkey(__crypto_ahash_cast(sw->sw_tfm),
++					sw->u.hmac.sw_key, sw->u.hmac.sw_klen);
++		ahash_request_set_crypt(req->crypto_req, req->sg, req->result, sg_len);
++		ret = crypto_ahash_digest(req->crypto_req);
++		switch (ret) {
++		case -EINPROGRESS:
++		case -EBUSY:
++			return;
++		default:
++		case 0:
++			dprintk("hash OP %s %d\n", ret ? "failed" : "success", ret);
++			crp->crp_etype = ret;
++			ahash_request_free(req->crypto_req);
++			goto done;
++		}
++		} break;
++#endif /* HAVE_AHASH */
++
++#ifdef HAVE_ABLKCIPHER
++	case SW_TYPE_ABLKCIPHER: {
++		int ret;
++		unsigned char *ivp = req->iv;
++		int ivsize = 
++			crypto_ablkcipher_ivsize(__crypto_ablkcipher_cast(sw->sw_tfm));
++
++		if (sg_len < crypto_ablkcipher_blocksize(
++				__crypto_ablkcipher_cast(sw->sw_tfm))) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL len %d < %d\n", __FILE__, __LINE__,
++					sg_len, crypto_ablkcipher_blocksize(
++						__crypto_ablkcipher_cast(sw->sw_tfm)));
++			goto done;
++		}
++
++		if (ivsize > sizeof(req->iv)) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++			goto done;
++		}
++
++		req->crypto_req = ablkcipher_request_alloc(
++				__crypto_ablkcipher_cast(sw->sw_tfm), GFP_KERNEL);
++		if (!req->crypto_req) {
++			crp->crp_etype = ENOMEM;
++			dprintk("%s,%d: ENOMEM ablkcipher_request_alloc",
++					__FILE__, __LINE__);
++			goto done;
++		}
++
++		ablkcipher_request_set_callback(req->crypto_req,
++				CRYPTO_TFM_REQ_MAY_BACKLOG, swcr_process_callback, req);
++
++		if (crd->crd_flags & CRD_F_KEY_EXPLICIT) {
++			int i, error;
++
++			if (debug) {
++				dprintk("%s key:", __FUNCTION__);
++				for (i = 0; i < (crd->crd_klen + 7) / 8; i++)
++					dprintk("%s0x%x", (i % 8) ? " " : "\n    ",
++							crd->crd_key[i] & 0xff);
++				dprintk("\n");
++			}
++			/* OCF doesn't enforce keys */
++			crypto_ablkcipher_set_flags(__crypto_ablkcipher_cast(sw->sw_tfm),
++					CRYPTO_TFM_REQ_WEAK_KEY);
++			error = crypto_ablkcipher_setkey(
++						__crypto_ablkcipher_cast(sw->sw_tfm), crd->crd_key,
++						(crd->crd_klen + 7) / 8);
++			if (error) {
++				dprintk("cryptosoft: setkey failed %d (crt_flags=0x%x)\n",
++						error, sw->sw_tfm->crt_flags);
++				crp->crp_etype = -error;
++			}
++		}
++
++		if (crd->crd_flags & CRD_F_ENCRYPT) { /* encrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT)
++				ivp = crd->crd_iv;
++			else
++				get_random_bytes(ivp, ivsize);
++			/*
++			 * do we have to copy the IV back to the buffer ?
++			 */
++			if ((crd->crd_flags & CRD_F_IV_PRESENT) == 0) {
++				crypto_copyback(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			}
++			ablkcipher_request_set_crypt(req->crypto_req, req->sg, req->sg,
++					sg_len, ivp);
++			ret = crypto_ablkcipher_encrypt(req->crypto_req);
++
++		} else { /*decrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT)
++				ivp = crd->crd_iv;
++			else
++				crypto_copydata(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			ablkcipher_request_set_crypt(req->crypto_req, req->sg, req->sg,
++					sg_len, ivp);
++			ret = crypto_ablkcipher_decrypt(req->crypto_req);
++		}
++
++		switch (ret) {
++		case -EINPROGRESS:
++		case -EBUSY:
++			return;
++		default:
++		case 0:
++			dprintk("crypto OP %s %d\n", ret ? "failed" : "success", ret);
++			crp->crp_etype = ret;
++			goto done;
++		}
++		} break;
++#endif /* HAVE_ABLKCIPHER */
++
++	case SW_TYPE_BLKCIPHER: {
++		unsigned char iv[EALG_MAX_BLOCK_LEN];
++		unsigned char *ivp = iv;
++		struct blkcipher_desc desc;
++		int ivsize = crypto_blkcipher_ivsize(crypto_blkcipher_cast(sw->sw_tfm));
++
++		if (sg_len < crypto_blkcipher_blocksize(
++				crypto_blkcipher_cast(sw->sw_tfm))) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL len %d < %d\n", __FILE__, __LINE__,
++					sg_len, crypto_blkcipher_blocksize(
++						crypto_blkcipher_cast(sw->sw_tfm)));
++			goto done;
++		}
++
++		if (ivsize > sizeof(iv)) {
++			crp->crp_etype = EINVAL;
++			dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++			goto done;
++		}
++
++		if (crd->crd_flags & CRD_F_KEY_EXPLICIT) {
++			int i, error;
++
++			if (debug) {
++				dprintk("%s key:", __FUNCTION__);
++				for (i = 0; i < (crd->crd_klen + 7) / 8; i++)
++					dprintk("%s0x%x", (i % 8) ? " " : "\n    ",
++							crd->crd_key[i] & 0xff);
++				dprintk("\n");
++			}
++			/* OCF doesn't enforce keys */
++			crypto_blkcipher_set_flags(crypto_blkcipher_cast(sw->sw_tfm),
++					CRYPTO_TFM_REQ_WEAK_KEY);
++			error = crypto_blkcipher_setkey(
++						crypto_blkcipher_cast(sw->sw_tfm), crd->crd_key,
++						(crd->crd_klen + 7) / 8);
++			if (error) {
++				dprintk("cryptosoft: setkey failed %d (crt_flags=0x%x)\n",
++						error, sw->sw_tfm->crt_flags);
++				crp->crp_etype = -error;
++			}
++		}
++
++		memset(&desc, 0, sizeof(desc));
++		desc.tfm = crypto_blkcipher_cast(sw->sw_tfm);
++
++		if (crd->crd_flags & CRD_F_ENCRYPT) { /* encrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT) {
++				ivp = crd->crd_iv;
++			} else {
++				get_random_bytes(ivp, ivsize);
++			}
++			/*
++			 * do we have to copy the IV back to the buffer ?
++			 */
++			if ((crd->crd_flags & CRD_F_IV_PRESENT) == 0) {
++				crypto_copyback(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			}
++			desc.info = ivp;
++			crypto_blkcipher_encrypt_iv(&desc, req->sg, req->sg, sg_len);
++
++		} else { /*decrypt */
++
++			if (crd->crd_flags & CRD_F_IV_EXPLICIT) {
++				ivp = crd->crd_iv;
++			} else {
++				crypto_copydata(crp->crp_flags, crp->crp_buf,
++						crd->crd_inject, ivsize, (caddr_t)ivp);
++			}
++			desc.info = ivp;
++			crypto_blkcipher_decrypt_iv(&desc, req->sg, req->sg, sg_len);
++		}
++		} break;
++
++	case SW_TYPE_HMAC:
++	case SW_TYPE_HASH:
++		{
++		char result[HASH_MAX_LEN];
++		struct hash_desc desc;
++
++		/* check we have room for the result */
++		if (crp->crp_ilen - crd->crd_inject < sw->u.hmac.sw_mlen) {
++			dprintk("cryptosoft: EINVAL crp_ilen=%d, len=%d, inject=%d "
++					"digestsize=%d\n", crp->crp_ilen, crd->crd_skip + sg_len,
++					crd->crd_inject, sw->u.hmac.sw_mlen);
++			crp->crp_etype = EINVAL;
++			goto done;
++		}
++
++		memset(&desc, 0, sizeof(desc));
++		desc.tfm = crypto_hash_cast(sw->sw_tfm);
++
++		memset(result, 0, sizeof(result));
++
++		if (sw->sw_type & SW_TYPE_HMAC) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
++			crypto_hmac(sw->sw_tfm, sw->u.hmac.sw_key, &sw->u.hmac.sw_klen,
++					req->sg, sg_num, result);
++#else
++			crypto_hash_setkey(desc.tfm, sw->u.hmac.sw_key,
++					sw->u.hmac.sw_klen);
++			crypto_hash_digest(&desc, req->sg, sg_len, result);
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19) */
++			
++		} else { /* SW_TYPE_HASH */
++			crypto_hash_digest(&desc, req->sg, sg_len, result);
++		}
++
++		crypto_copyback(crp->crp_flags, crp->crp_buf,
++				crd->crd_inject, sw->u.hmac.sw_mlen, result);
++		}
++		break;
++
++	case SW_TYPE_COMP: {
++		void *ibuf = NULL;
++		void *obuf = sw->u.sw_comp_buf;
++		int ilen = sg_len, olen = CRYPTO_MAX_DATA_LEN;
++		int ret = 0;
++
++		/*
++		 * we need to use an additional copy if there is more than one
++		 * input chunk since the kernel comp routines do not handle
++		 * SG yet.  Otherwise we just use the input buffer as is.
++		 * Rather than allocate another buffer we just split the tmp
++		 * buffer we already have.
++		 * Perhaps we should just use zlib directly ?
++		 */
++		if (sg_num > 1) {
++			int blk;
++
++			ibuf = obuf;
++			for (blk = 0; blk < sg_num; blk++) {
++				memcpy(obuf, sg_virt(&req->sg[blk]),
++						req->sg[blk].length);
++				obuf += req->sg[blk].length;
++			}
++			olen -= sg_len;
++		} else
++			ibuf = sg_virt(&req->sg[0]);
++
++		if (crd->crd_flags & CRD_F_ENCRYPT) { /* compress */
++			ret = crypto_comp_compress(crypto_comp_cast(sw->sw_tfm),
++					ibuf, ilen, obuf, &olen);
++			if (!ret && olen > crd->crd_len) {
++				dprintk("cryptosoft: ERANGE compress %d into %d\n",
++						crd->crd_len, olen);
++				if (swcr_fail_if_compression_grows)
++					ret = ERANGE;
++			}
++		} else { /* decompress */
++			ret = crypto_comp_decompress(crypto_comp_cast(sw->sw_tfm),
++					ibuf, ilen, obuf, &olen);
++			if (!ret && (olen + crd->crd_inject) > crp->crp_olen) {
++				dprintk("cryptosoft: ETOOSMALL decompress %d into %d, "
++						"space for %d,at offset %d\n",
++						crd->crd_len, olen, crp->crp_olen, crd->crd_inject);
++				ret = ETOOSMALL;
++			}
++		}
++		if (ret)
++			dprintk("%s,%d: ret = %d\n", __FILE__, __LINE__, ret);
++
++		/*
++		 * on success copy result back,
++		 * linux crpyto API returns -errno,  we need to fix that
++		 */
++		crp->crp_etype = ret < 0 ? -ret : ret;
++		if (ret == 0) {
++			/* copy back the result and return it's size */
++			crypto_copyback(crp->crp_flags, crp->crp_buf,
++					crd->crd_inject, olen, obuf);
++			crp->crp_olen = olen;
++		}
++
++
++		} break;
++
++	default:
++		/* Unknown/unsupported algorithm */
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++done:
++	crypto_done(crp);
++	kmem_cache_free(swcr_req_cache, req);
++}
++
++
++/*
++ * Process a crypto request.
++ */
++static int
++swcr_process(device_t dev, struct cryptop *crp, int hint)
++{
++	struct swcr_req *req = NULL;
++	u_int32_t lid;
++
++	dprintk("%s()\n", __FUNCTION__);
++	/* Sanity check */
++	if (crp == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		return EINVAL;
++	}
++
++	crp->crp_etype = 0;
++
++	if (crp->crp_desc == NULL || crp->crp_buf == NULL) {
++		dprintk("%s,%d: EINVAL\n", __FILE__, __LINE__);
++		crp->crp_etype = EINVAL;
++		goto done;
++	}
++
++	lid = crp->crp_sid & 0xffffffff;
++	if (lid >= swcr_sesnum || lid == 0 || swcr_sessions == NULL ||
++			swcr_sessions[lid] == NULL) {
++		crp->crp_etype = ENOENT;
++		dprintk("%s,%d: ENOENT\n", __FILE__, __LINE__);
++		goto done;
++	}
++
++	/*
++	 * do some error checking outside of the loop for SKB and IOV processing
++	 * this leaves us with valid skb or uiop pointers for later
++	 */
++	if (crp->crp_flags & CRYPTO_F_SKBUF) {
++		struct sk_buff *skb = (struct sk_buff *) crp->crp_buf;
++		if (skb_shinfo(skb)->nr_frags >= SCATTERLIST_MAX) {
++			printk("%s,%d: %d nr_frags > SCATTERLIST_MAX", __FILE__, __LINE__,
++					skb_shinfo(skb)->nr_frags);
++			goto done;
++		}
++	} else if (crp->crp_flags & CRYPTO_F_IOV) {
++		struct uio *uiop = (struct uio *) crp->crp_buf;
++		if (uiop->uio_iovcnt > SCATTERLIST_MAX) {
++			printk("%s,%d: %d uio_iovcnt > SCATTERLIST_MAX", __FILE__, __LINE__,
++					uiop->uio_iovcnt);
++			goto done;
++		}
++	}
++
++	/*
++	 * setup a new request ready for queuing
++	 */
++	req = kmem_cache_alloc(swcr_req_cache, SLAB_ATOMIC);
++	if (req == NULL) {
++		dprintk("%s,%d: ENOMEM\n", __FILE__, __LINE__);
++		crp->crp_etype = ENOMEM;
++		goto done;
++	}
++	memset(req, 0, sizeof(*req));
++
++	req->sw_head = swcr_sessions[lid];
++	req->crp = crp;
++	req->crd = crp->crp_desc;
++
++	swcr_process_req(req);
++	return 0;
++
++done:
++	crypto_done(crp);
++	if (req)
++		kmem_cache_free(swcr_req_cache, req);
++	return 0;
++}
++
++
++static int
++cryptosoft_init(void)
++{
++	int i, sw_type, mode;
++	char *algo;
++
++	dprintk("%s(%p)\n", __FUNCTION__, cryptosoft_init);
++
++	swcr_req_cache = kmem_cache_create("cryptosoft_req",
++				sizeof(struct swcr_req), 0, SLAB_HWCACHE_ALIGN, NULL
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,23)
++				, NULL
++#endif
++				);
++	if (!swcr_req_cache) {
++		printk("cryptosoft: failed to create request cache\n");
++		return -ENOENT;
++	}
++
++	softc_device_init(&swcr_softc, "cryptosoft", 0, swcr_methods);
++
++	swcr_id = crypto_get_driverid(softc_get_device(&swcr_softc),
++			CRYPTOCAP_F_SOFTWARE | CRYPTOCAP_F_SYNC);
++	if (swcr_id < 0) {
++		printk("cryptosoft: Software crypto device cannot initialize!");
++		return -ENODEV;
++	}
++
++#define	REGISTER(alg) \
++		crypto_register(swcr_id, alg, 0,0)
++
++	for (i = 0; i < sizeof(crypto_details)/sizeof(crypto_details[0]); i++) {
++		int found;
++		
++		algo = crypto_details[i].alg_name;
++		if (!algo || !*algo) {
++			dprintk("%s:Algorithm %d not supported\n", __FUNCTION__, i);
++			continue;
++		}
++
++		mode = crypto_details[i].mode;
++		sw_type = crypto_details[i].sw_type;
++
++		found = 0;
++		switch (sw_type & SW_TYPE_ALG_MASK) {
++		case SW_TYPE_CIPHER:
++			found = crypto_has_cipher(algo, 0, CRYPTO_ALG_ASYNC);
++			break;
++		case SW_TYPE_HMAC:
++			found = crypto_has_hash(algo, 0, swcr_no_ahash?CRYPTO_ALG_ASYNC:0);
++			break;
++		case SW_TYPE_HASH:
++			found = crypto_has_hash(algo, 0, swcr_no_ahash?CRYPTO_ALG_ASYNC:0);
++			break;
++		case SW_TYPE_COMP:
++			found = crypto_has_comp(algo, 0, CRYPTO_ALG_ASYNC);
++			break;
++		case SW_TYPE_BLKCIPHER:
++			found = crypto_has_blkcipher(algo, 0, CRYPTO_ALG_ASYNC);
++			if (!found && !swcr_no_ablk)
++				found = crypto_has_ablkcipher(algo, 0, 0);
++			break;
++		}
++		if (found) {
++			REGISTER(i);
++		} else {
++			dprintk("%s:Algorithm Type %d not supported (algorithm %d:'%s')\n",
++					__FUNCTION__, sw_type, i, algo);
++		}
++	}
++	return 0;
++}
++
++static void
++cryptosoft_exit(void)
++{
++	dprintk("%s()\n", __FUNCTION__);
++	crypto_unregister_all(swcr_id);
++	swcr_id = -1;
++	kmem_cache_destroy(swcr_req_cache);
++}
++
++late_initcall(cryptosoft_init);
++module_exit(cryptosoft_exit);
++
++MODULE_LICENSE("Dual BSD/GPL");
++MODULE_AUTHOR("David McCullough <david_mccullough@securecomputing.com>");
++MODULE_DESCRIPTION("Cryptosoft (OCF module for kernel crypto)");
+diff --git a/crypto/ocf/ocf-bench.c b/crypto/ocf/ocf-bench.c
+new file mode 100644
+index 0000000..d325231
+--- /dev/null
++++ b/crypto/ocf/ocf-bench.c
+@@ -0,0 +1,436 @@
++/*
++ * A loadable module that benchmarks the OCF crypto speed from kernel space.
++ *
++ * Copyright (C) 2004-2010 David McCullough <david_mccullough@mcafee.com>
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/wait.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/version.h>
++#include <linux/interrupt.h>
++#include <cryptodev.h>
++
++#ifdef I_HAVE_AN_XSCALE_WITH_INTEL_SDK
++#define BENCH_IXP_ACCESS_LIB 1
++#endif
++#ifdef BENCH_IXP_ACCESS_LIB
++#include <IxTypes.h>
++#include <IxOsBuffMgt.h>
++#include <IxNpeDl.h>
++#include <IxCryptoAcc.h>
++#include <IxQMgr.h>
++#include <IxOsServices.h>
++#include <IxOsCacheMMU.h>
++#endif
++
++/*
++ * support for access lib version 1.4
++ */
++#ifndef IX_MBUF_PRIV
++#define IX_MBUF_PRIV(x) ((x)->priv)
++#endif
++
++/*
++ * the number of simultaneously active requests
++ */
++static int request_q_len = 20;
++module_param(request_q_len, int, 0);
++MODULE_PARM_DESC(request_q_len, "Number of outstanding requests");
++/*
++ * how many requests we want to have processed
++ */
++static int request_num = 1024;
++module_param(request_num, int, 0);
++MODULE_PARM_DESC(request_num, "run for at least this many requests");
++/*
++ * the size of each request
++ */
++static int request_size = 1500;
++module_param(request_size, int, 0);
++MODULE_PARM_DESC(request_size, "size of each request");
++
++/*
++ * a structure for each request
++ */
++typedef struct  {
++	struct work_struct work;
++#ifdef BENCH_IXP_ACCESS_LIB
++	IX_MBUF mbuf;
++#endif
++	unsigned char *buffer;
++} request_t;
++
++static request_t *requests;
++
++static int outstanding;
++static int total;
++
++/*************************************************************************/
++/*
++ * OCF benchmark routines
++ */
++
++static uint64_t ocf_cryptoid;
++static int ocf_init(void);
++static int ocf_cb(struct cryptop *crp);
++static void ocf_request(void *arg);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void ocf_request_wq(struct work_struct *work);
++#endif
++
++static int
++ocf_init(void)
++{
++	int error;
++	struct cryptoini crie, cria;
++	struct cryptodesc crda, crde;
++
++	memset(&crie, 0, sizeof(crie));
++	memset(&cria, 0, sizeof(cria));
++	memset(&crde, 0, sizeof(crde));
++	memset(&crda, 0, sizeof(crda));
++
++	cria.cri_alg  = CRYPTO_SHA1_HMAC;
++	cria.cri_klen = 20 * 8;
++	cria.cri_key  = "0123456789abcdefghij";
++
++	crie.cri_alg  = CRYPTO_3DES_CBC;
++	crie.cri_klen = 24 * 8;
++	crie.cri_key  = "0123456789abcdefghijklmn";
++
++	crie.cri_next = &cria;
++
++	error = crypto_newsession(&ocf_cryptoid, &crie, 0);
++	if (error) {
++		printk("crypto_newsession failed %d\n", error);
++		return -1;
++	}
++	return 0;
++}
++
++static int
++ocf_cb(struct cryptop *crp)
++{
++	request_t *r = (request_t *) crp->crp_opaque;
++
++	if (crp->crp_etype)
++		printk("Error in OCF processing: %d\n", crp->crp_etype);
++	total++;
++	crypto_freereq(crp);
++	crp = NULL;
++
++	if (total > request_num) {
++		outstanding--;
++		return 0;
++	}
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++	INIT_WORK(&r->work, ocf_request_wq);
++#else
++	INIT_WORK(&r->work, ocf_request, r);
++#endif
++	schedule_work(&r->work);
++	return 0;
++}
++
++
++static void
++ocf_request(void *arg)
++{
++	request_t *r = arg;
++	struct cryptop *crp = crypto_getreq(2);
++	struct cryptodesc *crde, *crda;
++
++	if (!crp) {
++		outstanding--;
++		return;
++	}
++
++	crde = crp->crp_desc;
++	crda = crde->crd_next;
++
++	crda->crd_skip = 0;
++	crda->crd_flags = 0;
++	crda->crd_len = request_size;
++	crda->crd_inject = request_size;
++	crda->crd_alg = CRYPTO_SHA1_HMAC;
++	crda->crd_key = "0123456789abcdefghij";
++	crda->crd_klen = 20 * 8;
++
++	crde->crd_skip = 0;
++	crde->crd_flags = CRD_F_IV_EXPLICIT | CRD_F_ENCRYPT;
++	crde->crd_len = request_size;
++	crde->crd_inject = request_size;
++	crde->crd_alg = CRYPTO_3DES_CBC;
++	crde->crd_key = "0123456789abcdefghijklmn";
++	crde->crd_klen = 24 * 8;
++
++	crp->crp_ilen = request_size + 64;
++	crp->crp_flags = CRYPTO_F_CBIMM;
++	crp->crp_buf = (caddr_t) r->buffer;
++	crp->crp_callback = ocf_cb;
++	crp->crp_sid = ocf_cryptoid;
++	crp->crp_opaque = (caddr_t) r;
++	crypto_dispatch(crp);
++}
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void
++ocf_request_wq(struct work_struct *work)
++{
++	request_t *r = container_of(work, request_t, work);
++	ocf_request(r);
++}
++#endif
++
++/*************************************************************************/
++#ifdef BENCH_IXP_ACCESS_LIB
++/*************************************************************************/
++/*
++ * CryptoAcc benchmark routines
++ */
++
++static IxCryptoAccCtx ixp_ctx;
++static UINT32 ixp_ctx_id;
++static IX_MBUF ixp_pri;
++static IX_MBUF ixp_sec;
++static int ixp_registered = 0;
++
++static void ixp_register_cb(UINT32 ctx_id, IX_MBUF *bufp,
++					IxCryptoAccStatus status);
++static void ixp_perform_cb(UINT32 ctx_id, IX_MBUF *sbufp, IX_MBUF *dbufp,
++					IxCryptoAccStatus status);
++static void ixp_request(void *arg);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void ixp_request_wq(struct work_struct *work);
++#endif
++
++static int
++ixp_init(void)
++{
++	IxCryptoAccStatus status;
++
++	ixp_ctx.cipherCtx.cipherAlgo = IX_CRYPTO_ACC_CIPHER_3DES;
++	ixp_ctx.cipherCtx.cipherMode = IX_CRYPTO_ACC_MODE_CBC;
++	ixp_ctx.cipherCtx.cipherKeyLen = 24;
++	ixp_ctx.cipherCtx.cipherBlockLen = IX_CRYPTO_ACC_DES_BLOCK_64;
++	ixp_ctx.cipherCtx.cipherInitialVectorLen = IX_CRYPTO_ACC_DES_IV_64;
++	memcpy(ixp_ctx.cipherCtx.key.cipherKey, "0123456789abcdefghijklmn", 24);
++
++	ixp_ctx.authCtx.authAlgo = IX_CRYPTO_ACC_AUTH_SHA1;
++	ixp_ctx.authCtx.authDigestLen = 12;
++	ixp_ctx.authCtx.aadLen = 0;
++	ixp_ctx.authCtx.authKeyLen = 20;
++	memcpy(ixp_ctx.authCtx.key.authKey, "0123456789abcdefghij", 20);
++
++	ixp_ctx.useDifferentSrcAndDestMbufs = 0;
++	ixp_ctx.operation = IX_CRYPTO_ACC_OP_ENCRYPT_AUTH ;
++
++	IX_MBUF_MLEN(&ixp_pri)  = IX_MBUF_PKT_LEN(&ixp_pri) = 128;
++	IX_MBUF_MDATA(&ixp_pri) = (unsigned char *) kmalloc(128, SLAB_ATOMIC);
++	IX_MBUF_MLEN(&ixp_sec)  = IX_MBUF_PKT_LEN(&ixp_sec) = 128;
++	IX_MBUF_MDATA(&ixp_sec) = (unsigned char *) kmalloc(128, SLAB_ATOMIC);
++
++	status = ixCryptoAccCtxRegister(&ixp_ctx, &ixp_pri, &ixp_sec,
++			ixp_register_cb, ixp_perform_cb, &ixp_ctx_id);
++
++	if (IX_CRYPTO_ACC_STATUS_SUCCESS == status) {
++		while (!ixp_registered)
++			schedule();
++		return ixp_registered < 0 ? -1 : 0;
++	}
++
++	printk("ixp: ixCryptoAccCtxRegister failed %d\n", status);
++	return -1;
++}
++
++static void
++ixp_register_cb(UINT32 ctx_id, IX_MBUF *bufp, IxCryptoAccStatus status)
++{
++	if (bufp) {
++		IX_MBUF_MLEN(bufp) = IX_MBUF_PKT_LEN(bufp) = 0;
++		kfree(IX_MBUF_MDATA(bufp));
++		IX_MBUF_MDATA(bufp) = NULL;
++	}
++
++	if (IX_CRYPTO_ACC_STATUS_WAIT == status)
++		return;
++	if (IX_CRYPTO_ACC_STATUS_SUCCESS == status)
++		ixp_registered = 1;
++	else
++		ixp_registered = -1;
++}
++
++static void
++ixp_perform_cb(
++	UINT32 ctx_id,
++	IX_MBUF *sbufp,
++	IX_MBUF *dbufp,
++	IxCryptoAccStatus status)
++{
++	request_t *r = NULL;
++
++	total++;
++	if (total > request_num) {
++		outstanding--;
++		return;
++	}
++
++	if (!sbufp || !(r = IX_MBUF_PRIV(sbufp))) {
++		printk("crappo %p %p\n", sbufp, r);
++		outstanding--;
++		return;
++	}
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++	INIT_WORK(&r->work, ixp_request_wq);
++#else
++	INIT_WORK(&r->work, ixp_request, r);
++#endif
++	schedule_work(&r->work);
++}
++
++static void
++ixp_request(void *arg)
++{
++	request_t *r = arg;
++	IxCryptoAccStatus status;
++
++	memset(&r->mbuf, 0, sizeof(r->mbuf));
++	IX_MBUF_MLEN(&r->mbuf) = IX_MBUF_PKT_LEN(&r->mbuf) = request_size + 64;
++	IX_MBUF_MDATA(&r->mbuf) = r->buffer;
++	IX_MBUF_PRIV(&r->mbuf) = r;
++	status = ixCryptoAccAuthCryptPerform(ixp_ctx_id, &r->mbuf, NULL,
++			0, request_size, 0, request_size, request_size, r->buffer);
++	if (IX_CRYPTO_ACC_STATUS_SUCCESS != status) {
++		printk("status1 = %d\n", status);
++		outstanding--;
++		return;
++	}
++	return;
++}
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,20)
++static void
++ixp_request_wq(struct work_struct *work)
++{
++	request_t *r = container_of(work, request_t, work);
++	ixp_request(r);
++}
++#endif
++
++/*************************************************************************/
++#endif /* BENCH_IXP_ACCESS_LIB */
++/*************************************************************************/
++
++int
++ocfbench_init(void)
++{
++	int i, jstart, jstop;
++
++	printk("Crypto Speed tests\n");
++
++	requests = kmalloc(sizeof(request_t) * request_q_len, GFP_KERNEL);
++	if (!requests) {
++		printk("malloc failed\n");
++		return -EINVAL;
++	}
++
++	for (i = 0; i < request_q_len; i++) {
++		/* +64 for return data */
++		requests[i].buffer = kmalloc(request_size + 128, GFP_DMA);
++		if (!requests[i].buffer) {
++			printk("malloc failed\n");
++			return -EINVAL;
++		}
++		memset(requests[i].buffer, '0' + i, request_size + 128);
++	}
++
++	/*
++	 * OCF benchmark
++	 */
++	printk("OCF: testing ...\n");
++	ocf_init();
++	total = outstanding = 0;
++	jstart = jiffies;
++	for (i = 0; i < request_q_len; i++) {
++		outstanding++;
++		ocf_request(&requests[i]);
++	}
++	while (outstanding > 0)
++		schedule();
++	jstop = jiffies;
++
++	printk("OCF: %d requests of %d bytes in %d jiffies\n", total, request_size,
++			jstop - jstart);
++
++#ifdef BENCH_IXP_ACCESS_LIB
++	/*
++	 * IXP benchmark
++	 */
++	printk("IXP: testing ...\n");
++	ixp_init();
++	total = outstanding = 0;
++	jstart = jiffies;
++	for (i = 0; i < request_q_len; i++) {
++		outstanding++;
++		ixp_request(&requests[i]);
++	}
++	while (outstanding > 0)
++		schedule();
++	jstop = jiffies;
++
++	printk("IXP: %d requests of %d bytes in %d jiffies\n", total, request_size,
++			jstop - jstart);
++#endif /* BENCH_IXP_ACCESS_LIB */
++
++	for (i = 0; i < request_q_len; i++)
++		kfree(requests[i].buffer);
++	kfree(requests);
++	return -EINVAL; /* always fail to load so it can be re-run quickly ;-) */
++}
++
++static void __exit ocfbench_exit(void)
++{
++}
++
++module_init(ocfbench_init);
++module_exit(ocfbench_exit);
++
++MODULE_LICENSE("BSD");
++MODULE_AUTHOR("David McCullough <david_mccullough@mcafee.com>");
++MODULE_DESCRIPTION("Benchmark various in-kernel crypto speeds");
+diff --git a/crypto/ocf/ocf-compat.h b/crypto/ocf/ocf-compat.h
+new file mode 100644
+index 0000000..212f971
+--- /dev/null
++++ b/crypto/ocf/ocf-compat.h
+@@ -0,0 +1,294 @@
++#ifndef _BSD_COMPAT_H_
++#define _BSD_COMPAT_H_ 1
++/****************************************************************************/
++/*
++ * Provide compat routines for older linux kernels and BSD kernels
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2010 David McCullough <david_mccullough@mcafee.com>
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this file
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++/****************************************************************************/
++#ifdef __KERNEL__
++/*
++ * fake some BSD driver interface stuff specifically for OCF use
++ */
++
++typedef struct ocf_device *device_t;
++
++typedef struct {
++	int (*cryptodev_newsession)(device_t dev, u_int32_t *sidp, struct cryptoini *cri);
++	int (*cryptodev_freesession)(device_t dev, u_int64_t tid);
++	int (*cryptodev_process)(device_t dev, struct cryptop *crp, int hint);
++	int (*cryptodev_kprocess)(device_t dev, struct cryptkop *krp, int hint);
++} device_method_t;
++#define DEVMETHOD(id, func)	id: func
++
++struct ocf_device {
++	char name[32];		/* the driver name */
++	char nameunit[32];	/* the driver name + HW instance */
++	int  unit;
++	device_method_t	methods;
++	void *softc;
++};
++
++#define CRYPTODEV_NEWSESSION(dev, sid, cri) \
++	((*(dev)->methods.cryptodev_newsession)(dev,sid,cri))
++#define CRYPTODEV_FREESESSION(dev, sid) \
++	((*(dev)->methods.cryptodev_freesession)(dev, sid))
++#define CRYPTODEV_PROCESS(dev, crp, hint) \
++	((*(dev)->methods.cryptodev_process)(dev, crp, hint))
++#define CRYPTODEV_KPROCESS(dev, krp, hint) \
++	((*(dev)->methods.cryptodev_kprocess)(dev, krp, hint))
++
++#define device_get_name(dev)	((dev)->name)
++#define device_get_nameunit(dev)	((dev)->nameunit)
++#define device_get_unit(dev)	((dev)->unit)
++#define device_get_softc(dev)	((dev)->softc)
++
++#define	softc_device_decl \
++		struct ocf_device _device; \
++		device_t
++
++#define	softc_device_init(_sc, _name, _unit, _methods) \
++	if (1) {\
++	strncpy((_sc)->_device.name, _name, sizeof((_sc)->_device.name) - 1); \
++	snprintf((_sc)->_device.nameunit, sizeof((_sc)->_device.name), "%s%d", _name, _unit); \
++	(_sc)->_device.unit = _unit; \
++	(_sc)->_device.methods = _methods; \
++	(_sc)->_device.softc = (void *) _sc; \
++	*(device_t *)((softc_get_device(_sc))+1) = &(_sc)->_device; \
++	} else
++
++#define	softc_get_device(_sc)	(&(_sc)->_device)
++
++/*
++ * iomem support for 2.4 and 2.6 kernels
++ */
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++#define ocf_iomem_t	unsigned long
++
++/*
++ * implement simple workqueue like support for older kernels
++ */
++
++#include <linux/tqueue.h>
++
++#define work_struct tq_struct
++
++#define INIT_WORK(wp, fp, ap) \
++	do { \
++		(wp)->sync = 0; \
++		(wp)->routine = (fp); \
++		(wp)->data = (ap); \
++	} while (0)
++
++#define schedule_work(wp) \
++	do { \
++		queue_task((wp), &tq_immediate); \
++		mark_bh(IMMEDIATE_BH); \
++	} while (0)
++
++#define flush_scheduled_work()	run_task_queue(&tq_immediate)
++
++#else
++#define ocf_iomem_t	void __iomem *
++
++#include <linux/workqueue.h>
++
++#endif
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26)
++#include <linux/fdtable.h>
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,6,11)
++#define files_fdtable(files)	(files)
++#endif
++
++#ifdef MODULE_PARM
++#undef module_param	/* just in case */
++#define	module_param(a,b,c)		MODULE_PARM(a,"i")
++#endif
++
++#define bzero(s,l)		memset(s,0,l)
++#define bcopy(s,d,l)	memcpy(d,s,l)
++#define bcmp(x, y, l)	memcmp(x,y,l)
++
++#define MIN(x,y)	((x) < (y) ? (x) : (y))
++
++#define device_printf(dev, a...) ({ \
++				printk("%s: ", device_get_nameunit(dev)); printk(a); \
++			})
++
++#undef printf
++#define printf(fmt...)	printk(fmt)
++
++#define KASSERT(c,p)	if (!(c)) { printk p ; } else
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++#define ocf_daemonize(str) \
++	daemonize(); \
++	spin_lock_irq(&current->sigmask_lock); \
++	sigemptyset(&current->blocked); \
++	recalc_sigpending(current); \
++	spin_unlock_irq(&current->sigmask_lock); \
++	sprintf(current->comm, str);
++#else
++#define ocf_daemonize(str) daemonize(str);
++#endif
++
++#define	TAILQ_INSERT_TAIL(q,d,m) list_add_tail(&(d)->m, (q))
++#define	TAILQ_EMPTY(q)	list_empty(q)
++#define	TAILQ_FOREACH(v, q, m) list_for_each_entry(v, q, m)
++
++#define read_random(p,l) get_random_bytes(p,l)
++
++#define DELAY(x)	((x) > 2000 ? mdelay((x)/1000) : udelay(x))
++#define strtoul simple_strtoul
++
++#define pci_get_vendor(dev)	((dev)->vendor)
++#define pci_get_device(dev)	((dev)->device)
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++#define pci_set_consistent_dma_mask(dev, mask) (0)
++#endif
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,10)
++#define pci_dma_sync_single_for_cpu pci_dma_sync_single
++#endif
++
++#ifndef DMA_32BIT_MASK
++#define DMA_32BIT_MASK  0x00000000ffffffffULL
++#endif
++
++#ifndef htole32
++#define htole32(x)	cpu_to_le32(x)
++#endif
++#ifndef htobe32
++#define htobe32(x)	cpu_to_be32(x)
++#endif
++#ifndef htole16
++#define htole16(x)	cpu_to_le16(x)
++#endif
++#ifndef htobe16
++#define htobe16(x)	cpu_to_be16(x)
++#endif
++
++/* older kernels don't have these */
++
++#include <asm/irq.h>
++#if !defined(IRQ_NONE) && !defined(IRQ_RETVAL)
++#define IRQ_NONE
++#define IRQ_HANDLED
++#define IRQ_WAKE_THREAD
++#define IRQ_RETVAL
++#define irqreturn_t void
++typedef irqreturn_t (*irq_handler_t)(int irq, void *arg, struct pt_regs *regs);
++#endif
++#ifndef IRQF_SHARED
++#define IRQF_SHARED	SA_SHIRQ
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
++# define strlcpy(dest,src,len) \
++		({strncpy(dest,src,(len)-1); ((char *)dest)[(len)-1] = '\0'; })
++#endif
++
++#ifndef MAX_ERRNO
++#define MAX_ERRNO	4095
++#endif
++#ifndef IS_ERR_VALUE
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,5)
++#include <linux/err.h>
++#endif
++#ifndef IS_ERR_VALUE
++#define IS_ERR_VALUE(x) ((unsigned long)(x) >= (unsigned long)-MAX_ERRNO)
++#endif
++#endif
++
++/*
++ * common debug for all
++ */
++#if 1
++#define dprintk(a...)	do { if (debug) printk(a); } while(0)
++#else
++#define dprintk(a...)
++#endif
++
++#ifndef SLAB_ATOMIC
++/* Changed in 2.6.20, must use GFP_ATOMIC now */
++#define	SLAB_ATOMIC	GFP_ATOMIC
++#endif
++
++/*
++ * need some additional support for older kernels */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,2)
++#define pci_register_driver_compat(driver, rc) \
++	do { \
++		if ((rc) > 0) { \
++			(rc) = 0; \
++		} else if (rc == 0) { \
++			(rc) = -ENODEV; \
++		} else { \
++			pci_unregister_driver(driver); \
++		} \
++	} while (0)
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,6,10)
++#define pci_register_driver_compat(driver,rc) ((rc) = (rc) < 0 ? (rc) : 0)
++#else
++#define pci_register_driver_compat(driver,rc)
++#endif
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,24)
++
++#include <linux/mm.h>
++#include <asm/scatterlist.h>
++
++static inline void sg_set_page(struct scatterlist *sg,  struct page *page,
++			       unsigned int len, unsigned int offset)
++{
++	sg->page = page;
++	sg->offset = offset;
++	sg->length = len;
++}
++
++static inline void *sg_virt(struct scatterlist *sg)
++{
++	return page_address(sg->page) + sg->offset;
++}
++
++#define sg_init_table(sg, n)
++
++#endif
++
++#ifndef late_initcall
++#define late_initcall(init) module_init(init)
++#endif
++
++#endif /* __KERNEL__ */
++
++/****************************************************************************/
++#endif /* _BSD_COMPAT_H_ */
+diff --git a/crypto/ocf/random.c b/crypto/ocf/random.c
+new file mode 100644
+index 0000000..2088822
+--- /dev/null
++++ b/crypto/ocf/random.c
+@@ -0,0 +1,322 @@
++/*
++ * A system independant way of adding entropy to the kernels pool
++ * this way the drivers can focus on the real work and we can take
++ * care of pushing it to the appropriate place in the kernel.
++ *
++ * This should be fast and callable from timers/interrupts
++ *
++ * Written by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ */
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/slab.h>
++#include <linux/wait.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/version.h>
++#include <linux/unistd.h>
++#include <linux/poll.h>
++#include <linux/random.h>
++#include <crypto/cryptodev.h>
++
++#ifdef CONFIG_OCF_FIPS
++#include "rndtest.h"
++#endif
++
++#ifndef HAS_RANDOM_INPUT_WAIT
++#error "Please do not enable OCF_RANDOMHARVEST unless you have applied patches"
++#endif
++
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)
++#include <linux/sched.h>
++#define	kill_proc(p,s,v)	send_sig(s,find_task_by_vpid(p),0)
++#endif
++
++/*
++ * a hack to access the debug levels from the crypto driver
++ */
++extern int crypto_debug;
++#define debug crypto_debug
++
++/*
++ * a list of all registered random providers
++ */
++static LIST_HEAD(random_ops);
++static int started = 0;
++static int initted = 0;
++
++struct random_op {
++	struct list_head random_list;
++	u_int32_t driverid;
++	int (*read_random)(void *arg, u_int32_t *buf, int len);
++	void *arg;
++};
++
++static int random_proc(void *arg);
++
++static pid_t		randomproc = (pid_t) -1;
++static spinlock_t	random_lock;
++
++/*
++ * just init the spin locks
++ */
++static int
++crypto_random_init(void)
++{
++	spin_lock_init(&random_lock);
++	initted = 1;
++	return(0);
++}
++
++/*
++ * Add the given random reader to our list (if not present)
++ * and start the thread (if not already started)
++ *
++ * we have to assume that driver id is ok for now
++ */
++int
++crypto_rregister(
++	u_int32_t driverid,
++	int (*read_random)(void *arg, u_int32_t *buf, int len),
++	void *arg)
++{
++	unsigned long flags;
++	int ret = 0;
++	struct random_op	*rops, *tmp;
++
++	dprintk("%s,%d: %s(0x%x, %p, %p)\n", __FILE__, __LINE__,
++			__FUNCTION__, driverid, read_random, arg);
++
++	if (!initted)
++		crypto_random_init();
++
++#if 0
++	struct cryptocap	*cap;
++
++	cap = crypto_checkdriver(driverid);
++	if (!cap)
++		return EINVAL;
++#endif
++
++	list_for_each_entry_safe(rops, tmp, &random_ops, random_list) {
++		if (rops->driverid == driverid && rops->read_random == read_random)
++			return EEXIST;
++	}
++
++	rops = (struct random_op *) kmalloc(sizeof(*rops), GFP_KERNEL);
++	if (!rops)
++		return ENOMEM;
++
++	rops->driverid    = driverid;
++	rops->read_random = read_random;
++	rops->arg = arg;
++
++	spin_lock_irqsave(&random_lock, flags);
++	list_add_tail(&rops->random_list, &random_ops);
++	if (!started) {
++		randomproc = kernel_thread(random_proc, NULL, CLONE_FS|CLONE_FILES);
++		if (randomproc < 0) {
++			ret = randomproc;
++			printk("crypto: crypto_rregister cannot start random thread; "
++					"error %d", ret);
++		} else
++			started = 1;
++	}
++	spin_unlock_irqrestore(&random_lock, flags);
++
++	return ret;
++}
++EXPORT_SYMBOL(crypto_rregister);
++
++int
++crypto_runregister_all(u_int32_t driverid)
++{
++	struct random_op *rops, *tmp;
++	unsigned long flags;
++
++	dprintk("%s,%d: %s(0x%x)\n", __FILE__, __LINE__, __FUNCTION__, driverid);
++
++	list_for_each_entry_safe(rops, tmp, &random_ops, random_list) {
++		if (rops->driverid == driverid) {
++			list_del(&rops->random_list);
++			kfree(rops);
++		}
++	}
++
++	spin_lock_irqsave(&random_lock, flags);
++	if (list_empty(&random_ops) && started)
++		kill_proc(randomproc, SIGKILL, 1);
++	spin_unlock_irqrestore(&random_lock, flags);
++	return(0);
++}
++EXPORT_SYMBOL(crypto_runregister_all);
++
++/*
++ * while we can add entropy to random.c continue to read random data from
++ * the drivers and push it to random.
++ */
++static int
++random_proc(void *arg)
++{
++	int n;
++	int wantcnt;
++	int bufcnt = 0;
++	int retval = 0;
++	int *buf = NULL;
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++	daemonize();
++	spin_lock_irq(&current->sigmask_lock);
++	sigemptyset(&current->blocked);
++	recalc_sigpending(current);
++	spin_unlock_irq(&current->sigmask_lock);
++	sprintf(current->comm, "ocf-random");
++#else
++	daemonize("ocf-random");
++	allow_signal(SIGKILL);
++#endif
++
++	(void) get_fs();
++	set_fs(get_ds());
++
++#ifdef CONFIG_OCF_FIPS
++#define NUM_INT (RNDTEST_NBYTES/sizeof(int))
++#else
++#define NUM_INT 32
++#endif
++
++	/*
++	 * some devices can transferr their RNG data direct into memory,
++	 * so make sure it is device friendly
++	 */
++	buf = kmalloc(NUM_INT * sizeof(int), GFP_DMA);
++	if (NULL == buf) {
++		printk("crypto: RNG could not allocate memory\n");
++		retval = -ENOMEM;
++		goto bad_alloc;
++	}
++
++	wantcnt = NUM_INT;   /* start by adding some entropy */
++
++	/*
++	 * its possible due to errors or driver removal that we no longer
++	 * have anything to do,  if so exit or we will consume all the CPU
++	 * doing nothing
++	 */
++	while (!list_empty(&random_ops)) {
++		struct random_op	*rops, *tmp;
++
++#ifdef CONFIG_OCF_FIPS
++		if (wantcnt)
++			wantcnt = NUM_INT; /* FIPs mode can do 20000 bits or none */
++#endif
++
++		/* see if we can get enough entropy to make the world
++		 * a better place.
++		 */
++		while (bufcnt < wantcnt && bufcnt < NUM_INT) {
++			list_for_each_entry_safe(rops, tmp, &random_ops, random_list) {
++
++				n = (*rops->read_random)(rops->arg, &buf[bufcnt],
++							 NUM_INT - bufcnt);
++
++				/* on failure remove the random number generator */
++				if (n == -1) {
++					list_del(&rops->random_list);
++					printk("crypto: RNG (driverid=0x%x) failed, disabling\n",
++							rops->driverid);
++					kfree(rops);
++				} else if (n > 0)
++					bufcnt += n;
++			}
++			/* give up CPU for a bit, just in case as this is a loop */
++			schedule();
++		}
++
++
++#ifdef CONFIG_OCF_FIPS
++		if (bufcnt > 0 && rndtest_buf((unsigned char *) &buf[0])) {
++			dprintk("crypto: buffer had fips errors, discarding\n");
++			bufcnt = 0;
++		}
++#endif
++
++		/*
++		 * if we have a certified buffer,  we can send some data
++		 * to /dev/random and move along
++		 */
++		if (bufcnt > 0) {
++			/* add what we have */
++			random_input_words(buf, bufcnt, bufcnt*sizeof(int)*8);
++			bufcnt = 0;
++		}
++
++		/* give up CPU for a bit so we don't hog while filling */
++		schedule();
++
++		/* wait for needing more */
++		wantcnt = random_input_wait();
++
++		if (wantcnt <= 0)
++			wantcnt = 0; /* try to get some info again */
++		else
++		 	/* round up to one word or we can loop forever */
++			wantcnt = (wantcnt + (sizeof(int)*8)) / (sizeof(int)*8);
++		if (wantcnt > NUM_INT) {
++			wantcnt = NUM_INT;
++		}
++
++		if (signal_pending(current)) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++			spin_lock_irq(&current->sigmask_lock);
++#endif
++			flush_signals(current);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
++			spin_unlock_irq(&current->sigmask_lock);
++#endif
++		}
++	}
++	
++	kfree(buf);
++
++bad_alloc:
++	spin_lock_irq(&random_lock);
++	randomproc = (pid_t) -1;
++	started = 0;
++	spin_unlock_irq(&random_lock);
++
++	return retval;
++}
++
+diff --git a/crypto/ocf/rndtest.c b/crypto/ocf/rndtest.c
+new file mode 100644
+index 0000000..2295e9b
+--- /dev/null
++++ b/crypto/ocf/rndtest.c
+@@ -0,0 +1,300 @@
++/*	$OpenBSD$	*/
++
++/*
++ * OCF/Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * Copyright (c) 2002 Jason L. Wright (jason@thought.net)
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. All advertising materials mentioning features or use of this software
++ *    must display the following acknowledgement:
++ *	This product includes software developed by Jason L. Wright
++ * 4. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
++ * DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
++ * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
++ * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
++ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
++ * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#ifndef AUTOCONF_INCLUDED
++#include <linux/config.h>
++#endif
++#include <linux/module.h>
++#include <linux/list.h>
++#include <linux/wait.h>
++#include <linux/time.h>
++#include <linux/version.h>
++#include <linux/unistd.h>
++#include <linux/kernel.h>
++#include <linux/string.h>
++#include <linux/time.h>
++#include <crypto/cryptodev.h>
++#include "rndtest.h"
++
++static struct rndtest_stats rndstats;
++
++static	void rndtest_test(struct rndtest_state *);
++
++/* The tests themselves */
++static	int rndtest_monobit(struct rndtest_state *);
++static	int rndtest_runs(struct rndtest_state *);
++static	int rndtest_longruns(struct rndtest_state *);
++static	int rndtest_chi_4(struct rndtest_state *);
++
++static	int rndtest_runs_check(struct rndtest_state *, int, int *);
++static	void rndtest_runs_record(struct rndtest_state *, int, int *);
++
++static const struct rndtest_testfunc {
++	int (*test)(struct rndtest_state *);
++} rndtest_funcs[] = {
++	{ rndtest_monobit },
++	{ rndtest_runs },
++	{ rndtest_chi_4 },
++	{ rndtest_longruns },
++};
++
++#define	RNDTEST_NTESTS	(sizeof(rndtest_funcs)/sizeof(rndtest_funcs[0]))
++
++static void
++rndtest_test(struct rndtest_state *rsp)
++{
++	int i, rv = 0;
++
++	rndstats.rst_tests++;
++	for (i = 0; i < RNDTEST_NTESTS; i++)
++		rv |= (*rndtest_funcs[i].test)(rsp);
++	rsp->rs_discard = (rv != 0);
++}
++
++
++extern int crypto_debug;
++#define rndtest_verbose 2
++#define rndtest_report(rsp, failure, fmt, a...) \
++	{ if (failure || crypto_debug) { printk("rng_test: " fmt "\n", a); } else; }
++
++#define	RNDTEST_MONOBIT_MINONES	9725
++#define	RNDTEST_MONOBIT_MAXONES	10275
++
++static int
++rndtest_monobit(struct rndtest_state *rsp)
++{
++	int i, ones = 0, j;
++	u_int8_t r;
++
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		r = rsp->rs_buf[i];
++		for (j = 0; j < 8; j++, r <<= 1)
++			if (r & 0x80)
++				ones++;
++	}
++	if (ones > RNDTEST_MONOBIT_MINONES &&
++	    ones < RNDTEST_MONOBIT_MAXONES) {
++		if (rndtest_verbose > 1)
++			rndtest_report(rsp, 0, "monobit pass (%d < %d < %d)",
++			    RNDTEST_MONOBIT_MINONES, ones,
++			    RNDTEST_MONOBIT_MAXONES);
++		return (0);
++	} else {
++		if (rndtest_verbose)
++			rndtest_report(rsp, 1,
++			    "monobit failed (%d ones)", ones);
++		rndstats.rst_monobit++;
++		return (-1);
++	}
++}
++
++#define	RNDTEST_RUNS_NINTERVAL	6
++
++static const struct rndtest_runs_tabs {
++	u_int16_t min, max;
++} rndtest_runs_tab[] = {
++	{ 2343, 2657 },
++	{ 1135, 1365 },
++	{ 542, 708 },
++	{ 251, 373 },
++	{ 111, 201 },
++	{ 111, 201 },
++};
++
++static int
++rndtest_runs(struct rndtest_state *rsp)
++{
++	int i, j, ones, zeros, rv = 0;
++	int onei[RNDTEST_RUNS_NINTERVAL], zeroi[RNDTEST_RUNS_NINTERVAL];
++	u_int8_t c;
++
++	bzero(onei, sizeof(onei));
++	bzero(zeroi, sizeof(zeroi));
++	ones = zeros = 0;
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		c = rsp->rs_buf[i];
++		for (j = 0; j < 8; j++, c <<= 1) {
++			if (c & 0x80) {
++				ones++;
++				rndtest_runs_record(rsp, zeros, zeroi);
++				zeros = 0;
++			} else {
++				zeros++;
++				rndtest_runs_record(rsp, ones, onei);
++				ones = 0;
++			}
++		}
++	}
++	rndtest_runs_record(rsp, ones, onei);
++	rndtest_runs_record(rsp, zeros, zeroi);
++
++	rv |= rndtest_runs_check(rsp, 0, zeroi);
++	rv |= rndtest_runs_check(rsp, 1, onei);
++
++	if (rv)
++		rndstats.rst_runs++;
++
++	return (rv);
++}
++
++static void
++rndtest_runs_record(struct rndtest_state *rsp, int len, int *intrv)
++{
++	if (len == 0)
++		return;
++	if (len > RNDTEST_RUNS_NINTERVAL)
++		len = RNDTEST_RUNS_NINTERVAL;
++	len -= 1;
++	intrv[len]++;
++}
++
++static int
++rndtest_runs_check(struct rndtest_state *rsp, int val, int *src)
++{
++	int i, rv = 0;
++
++	for (i = 0; i < RNDTEST_RUNS_NINTERVAL; i++) {
++		if (src[i] < rndtest_runs_tab[i].min ||
++		    src[i] > rndtest_runs_tab[i].max) {
++			rndtest_report(rsp, 1,
++			    "%s interval %d failed (%d, %d-%d)",
++			    val ? "ones" : "zeros",
++			    i + 1, src[i], rndtest_runs_tab[i].min,
++			    rndtest_runs_tab[i].max);
++			rv = -1;
++		} else {
++			rndtest_report(rsp, 0,
++			    "runs pass %s interval %d (%d < %d < %d)",
++			    val ? "ones" : "zeros",
++			    i + 1, rndtest_runs_tab[i].min, src[i],
++			    rndtest_runs_tab[i].max);
++		}
++	}
++	return (rv);
++}
++
++static int
++rndtest_longruns(struct rndtest_state *rsp)
++{
++	int i, j, ones = 0, zeros = 0, maxones = 0, maxzeros = 0;
++	u_int8_t c;
++
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		c = rsp->rs_buf[i];
++		for (j = 0; j < 8; j++, c <<= 1) {
++			if (c & 0x80) {
++				zeros = 0;
++				ones++;
++				if (ones > maxones)
++					maxones = ones;
++			} else {
++				ones = 0;
++				zeros++;
++				if (zeros > maxzeros)
++					maxzeros = zeros;
++			}
++		}
++	}
++
++	if (maxones < 26 && maxzeros < 26) {
++		rndtest_report(rsp, 0, "longruns pass (%d ones, %d zeros)",
++			maxones, maxzeros);
++		return (0);
++	} else {
++		rndtest_report(rsp, 1, "longruns fail (%d ones, %d zeros)",
++			maxones, maxzeros);
++		rndstats.rst_longruns++;
++		return (-1);
++	}
++}
++
++/*
++ * chi^2 test over 4 bits: (this is called the poker test in FIPS 140-2,
++ * but it is really the chi^2 test over 4 bits (the poker test as described
++ * by Knuth vol 2 is something different, and I take him as authoritative
++ * on nomenclature over NIST).
++ */
++#define	RNDTEST_CHI4_K	16
++#define	RNDTEST_CHI4_K_MASK	(RNDTEST_CHI4_K - 1)
++
++/*
++ * The unnormalized values are used so that we don't have to worry about
++ * fractional precision.  The "real" value is found by:
++ *	(V - 1562500) * (16 / 5000) = Vn   (where V is the unnormalized value)
++ */
++#define	RNDTEST_CHI4_VMIN	1563181		/* 2.1792 */
++#define	RNDTEST_CHI4_VMAX	1576929		/* 46.1728 */
++
++static int
++rndtest_chi_4(struct rndtest_state *rsp)
++{
++	unsigned int freq[RNDTEST_CHI4_K], i, sum;
++
++	for (i = 0; i < RNDTEST_CHI4_K; i++)
++		freq[i] = 0;
++
++	/* Get number of occurances of each 4 bit pattern */
++	for (i = 0; i < RNDTEST_NBYTES; i++) {
++		freq[(rsp->rs_buf[i] >> 4) & RNDTEST_CHI4_K_MASK]++;
++		freq[(rsp->rs_buf[i] >> 0) & RNDTEST_CHI4_K_MASK]++;
++	}
++
++	for (i = 0, sum = 0; i < RNDTEST_CHI4_K; i++)
++		sum += freq[i] * freq[i];
++
++	if (sum >= 1563181 && sum <= 1576929) {
++		rndtest_report(rsp, 0, "chi^2(4): pass (sum %u)", sum);
++		return (0);
++	} else {
++		rndtest_report(rsp, 1, "chi^2(4): failed (sum %u)", sum);
++		rndstats.rst_chi++;
++		return (-1);
++	}
++}
++
++int
++rndtest_buf(unsigned char *buf)
++{
++	struct rndtest_state rsp;
++
++	memset(&rsp, 0, sizeof(rsp));
++	rsp.rs_buf = buf;
++	rndtest_test(&rsp);
++	return(rsp.rs_discard);
++}
++
+diff --git a/crypto/ocf/rndtest.h b/crypto/ocf/rndtest.h
+new file mode 100644
+index 0000000..e9d8ec8
+--- /dev/null
++++ b/crypto/ocf/rndtest.h
+@@ -0,0 +1,54 @@
++/*	$FreeBSD: src/sys/dev/rndtest/rndtest.h,v 1.1 2003/03/11 22:54:44 sam Exp $	*/
++/*	$OpenBSD$	*/
++
++/*
++ * Copyright (c) 2002 Jason L. Wright (jason@thought.net)
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. All advertising materials mentioning features or use of this software
++ *    must display the following acknowledgement:
++ *	This product includes software developed by Jason L. Wright
++ * 4. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
++ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
++ * DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
++ * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
++ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
++ * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
++ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
++ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
++ * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++
++/* Some of the tests depend on these values */
++#define	RNDTEST_NBYTES	2500
++#define	RNDTEST_NBITS	(8 * RNDTEST_NBYTES)
++
++struct rndtest_state {
++	int		rs_discard;	/* discard/accept random data */
++	u_int8_t	*rs_buf;
++};
++
++struct rndtest_stats {
++	u_int32_t	rst_discard;	/* number of bytes discarded */
++	u_int32_t	rst_tests;	/* number of test runs */
++	u_int32_t	rst_monobit;	/* monobit test failures */
++	u_int32_t	rst_runs;	/* 0/1 runs failures */
++	u_int32_t	rst_longruns;	/* longruns failures */
++	u_int32_t	rst_chi;	/* chi^2 failures */
++};
++
++extern int rndtest_buf(unsigned char *buf);
+diff --git a/crypto/ocf/uio.h b/crypto/ocf/uio.h
+new file mode 100644
+index 0000000..03a6249
+--- /dev/null
++++ b/crypto/ocf/uio.h
+@@ -0,0 +1,54 @@
++#ifndef _OCF_UIO_H_
++#define _OCF_UIO_H_
++
++#include <linux/uio.h>
++
++/*
++ * The linux uio.h doesn't have all we need.  To be fully api compatible
++ * with the BSD cryptodev,  we need to keep this around.  Perhaps this can
++ * be moved back into the linux/uio.h
++ *
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ *
++ * LICENSE TERMS
++ *
++ * The free distribution and use of this software in both source and binary
++ * form is allowed (with or without changes) provided that:
++ *
++ *   1. distributions of this source code include the above copyright
++ *      notice, this list of conditions and the following disclaimer;
++ *
++ *   2. distributions in binary form include the above copyright
++ *      notice, this list of conditions and the following disclaimer
++ *      in the documentation and/or other associated materials;
++ *
++ *   3. the copyright holder's name is not used to endorse products
++ *      built using this software without specific written permission.
++ *
++ * ALTERNATIVELY, provided that this notice is retained in full, this product
++ * may be distributed under the terms of the GNU General Public License (GPL),
++ * in which case the provisions of the GPL apply INSTEAD OF those given above.
++ *
++ * DISCLAIMER
++ *
++ * This software is provided 'as is' with no explicit or implied warranties
++ * in respect of its properties, including, but not limited to, correctness
++ * and/or fitness for purpose.
++ * ---------------------------------------------------------------------------
++ */
++
++struct uio {
++	struct	iovec *uio_iov;
++	int		uio_iovcnt;
++	off_t	uio_offset;
++	int		uio_resid;
++#if 0
++	enum	uio_seg uio_segflg;
++	enum	uio_rw uio_rw;
++	struct  thread *uio_td;
++#endif
++};
++
++#endif
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 5a1aa64..0554f18 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -129,6 +129,9 @@
+  *                                unsigned int value);
+  * 	void add_interrupt_randomness(int irq);
+  *
++ *      void random_input_words(__u32 *buf, size_t wordcount, int ent_count)
++ *      int random_input_wait(void);
++ *
+  * add_input_randomness() uses the input layer interrupt timing, as well as
+  * the event type information from the hardware.
+  *
+@@ -140,6 +143,13 @@
+  * a better measure, since the timing of the disk interrupts are more
+  * unpredictable.
+  *
++ * random_input_words() just provides a raw block of entropy to the input
++ * pool, such as from a hardware entropy generator.
++ *
++ * random_input_wait() suspends the caller until such time as the
++ * entropy pool falls below the write threshold, and returns a count of how
++ * much entropy (in bits) is needed to sustain the pool.
++ *
+  * All of these routines try to estimate how many bits of randomness a
+  * particular randomness source.  They do this by keeping track of the
+  * first and second order deltas of the event timings.
+@@ -715,6 +725,61 @@ void add_disk_randomness(struct gendisk *disk)
+ }
+ #endif
+ 
++/*
++ * random_input_words - add bulk entropy to pool
++ *
++ * @buf: buffer to add
++ * @wordcount: number of __u32 words to add
++ * @ent_count: total amount of entropy (in bits) to credit
++ *
++ * this provides bulk input of entropy to the input pool
++ *
++ */
++void random_input_words(__u32 *buf, size_t wordcount, int ent_count)
++{
++	mix_pool_bytes(&input_pool, buf, wordcount*4);
++
++	credit_entropy_bits(&input_pool, ent_count);
++
++	DEBUG_ENT("crediting %d bits => %d\n",
++		  ent_count, input_pool.entropy_count);
++	/*
++	 * Wake up waiting processes if we have enough
++	 * entropy.
++	 */
++	if (input_pool.entropy_count >= random_read_wakeup_thresh)
++		wake_up_interruptible(&random_read_wait);
++}
++EXPORT_SYMBOL(random_input_words);
++
++/*
++ * random_input_wait - wait until random needs entropy
++ *
++ * this function sleeps until the /dev/random subsystem actually
++ * needs more entropy, and then return the amount of entropy
++ * that it would be nice to have added to the system.
++ */
++int random_input_wait(void)
++{
++	int count;
++
++	wait_event_interruptible(random_write_wait, 
++			 input_pool.entropy_count < random_write_wakeup_thresh);
++
++	count = random_write_wakeup_thresh - input_pool.entropy_count;
++
++        /* likely we got woken up due to a signal */
++	if (count <= 0) count = random_read_wakeup_thresh; 
++
++	DEBUG_ENT("requesting %d bits from input_wait()er %d<%d\n",
++		  count,
++		  input_pool.entropy_count, random_write_wakeup_thresh);
++
++	return count;
++}
++EXPORT_SYMBOL(random_input_wait);
++
++
+ /*********************************************************************
+  *
+  * Entropy extraction routines
+diff --git a/fs/fcntl.c b/fs/fcntl.c
+index ecc8b39..1b1dcfb 100644
+--- a/fs/fcntl.c
++++ b/fs/fcntl.c
+@@ -142,6 +142,7 @@ SYSCALL_DEFINE1(dup, unsigned int, fildes)
+ 	}
+ 	return ret;
+ }
++EXPORT_SYMBOL(sys_dup);
+ 
+ #define SETFL_MASK (O_APPEND | O_NONBLOCK | O_NDELAY | O_DIRECT | O_NOATIME)
+ 
+diff --git a/include/crypto/cryptodev.h b/include/crypto/cryptodev.h
+new file mode 100644
+index 0000000..6032317
+--- /dev/null
++++ b/include/crypto/cryptodev.h
+@@ -0,0 +1,479 @@
++/*	$FreeBSD: src/sys/opencrypto/cryptodev.h,v 1.25 2007/05/09 19:37:02 gnn Exp $	*/
++/*	$OpenBSD: cryptodev.h,v 1.31 2002/06/11 11:14:29 beck Exp $	*/
++
++/*-
++ * Linux port done by David McCullough <david_mccullough@mcafee.com>
++ * Copyright (C) 2006-2010 David McCullough
++ * Copyright (C) 2004-2005 Intel Corporation.
++ * The license and original author are listed below.
++ *
++ * The author of this code is Angelos D. Keromytis (angelos@cis.upenn.edu)
++ * Copyright (c) 2002-2006 Sam Leffler, Errno Consulting
++ *
++ * This code was written by Angelos D. Keromytis in Athens, Greece, in
++ * February 2000. Network Security Technologies Inc. (NSTI) kindly
++ * supported the development of this code.
++ *
++ * Copyright (c) 2000 Angelos D. Keromytis
++ *
++ * Permission to use, copy, and modify this software with or without fee
++ * is hereby granted, provided that this entire notice is included in
++ * all source code copies of any software which is or includes a copy or
++ * modification of this software.
++ *
++ * THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR
++ * IMPLIED WARRANTY. IN PARTICULAR, NONE OF THE AUTHORS MAKES ANY
++ * REPRESENTATION OR WARRANTY OF ANY KIND CONCERNING THE
++ * MERCHANTABILITY OF THIS SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR
++ * PURPOSE.
++ *
++ * Copyright (c) 2001 Theo de Raadt
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ *
++ * 1. Redistributions of source code must retain the above copyright
++ *   notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *   notice, this list of conditions and the following disclaimer in the
++ *   documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *   derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Effort sponsored in part by the Defense Advanced Research Projects
++ * Agency (DARPA) and Air Force Research Laboratory, Air Force
++ * Materiel Command, USAF, under agreement number F30602-01-2-0537.
++ *
++ */
++
++#ifndef _CRYPTO_CRYPTO_H_
++#define _CRYPTO_CRYPTO_H_
++
++/* Some initial values */
++#define CRYPTO_DRIVERS_INITIAL	4
++#define CRYPTO_SW_SESSIONS	32
++
++/* Hash values */
++#define NULL_HASH_LEN		0
++#define MD5_HASH_LEN		16
++#define SHA1_HASH_LEN		20
++#define RIPEMD160_HASH_LEN	20
++#define SHA2_256_HASH_LEN	32
++#define SHA2_384_HASH_LEN	48
++#define SHA2_512_HASH_LEN	64
++#define MD5_KPDK_HASH_LEN	16
++#define SHA1_KPDK_HASH_LEN	20
++/* Maximum hash algorithm result length */
++#define HASH_MAX_LEN		SHA2_512_HASH_LEN /* Keep this updated */
++
++/* HMAC values */
++#define NULL_HMAC_BLOCK_LEN			1
++#define MD5_HMAC_BLOCK_LEN			64
++#define SHA1_HMAC_BLOCK_LEN			64
++#define RIPEMD160_HMAC_BLOCK_LEN	64
++#define SHA2_256_HMAC_BLOCK_LEN		64
++#define SHA2_384_HMAC_BLOCK_LEN		128
++#define SHA2_512_HMAC_BLOCK_LEN		128
++/* Maximum HMAC block length */
++#define HMAC_MAX_BLOCK_LEN		SHA2_512_HMAC_BLOCK_LEN /* Keep this updated */
++#define HMAC_IPAD_VAL			0x36
++#define HMAC_OPAD_VAL			0x5C
++
++/* Encryption algorithm block sizes */
++#define NULL_BLOCK_LEN			1
++#define DES_BLOCK_LEN			8
++#define DES3_BLOCK_LEN			8
++#define BLOWFISH_BLOCK_LEN		8
++#define SKIPJACK_BLOCK_LEN		8
++#define CAST128_BLOCK_LEN		8
++#define RIJNDAEL128_BLOCK_LEN	16
++#define AES_BLOCK_LEN			RIJNDAEL128_BLOCK_LEN
++#define CAMELLIA_BLOCK_LEN		16
++#define ARC4_BLOCK_LEN			1
++#define EALG_MAX_BLOCK_LEN		AES_BLOCK_LEN /* Keep this updated */
++
++/* Encryption algorithm min and max key sizes */
++#define NULL_MIN_KEY_LEN		0
++#define NULL_MAX_KEY_LEN		0
++#define DES_MIN_KEY_LEN			8
++#define DES_MAX_KEY_LEN			8
++#define DES3_MIN_KEY_LEN		24
++#define DES3_MAX_KEY_LEN		24
++#define BLOWFISH_MIN_KEY_LEN	4
++#define BLOWFISH_MAX_KEY_LEN	56
++#define SKIPJACK_MIN_KEY_LEN	10
++#define SKIPJACK_MAX_KEY_LEN	10
++#define CAST128_MIN_KEY_LEN		5
++#define CAST128_MAX_KEY_LEN		16
++#define RIJNDAEL128_MIN_KEY_LEN	16
++#define RIJNDAEL128_MAX_KEY_LEN	32
++#define AES_MIN_KEY_LEN			RIJNDAEL128_MIN_KEY_LEN
++#define AES_MAX_KEY_LEN			RIJNDAEL128_MAX_KEY_LEN
++#define CAMELLIA_MIN_KEY_LEN	16
++#define CAMELLIA_MAX_KEY_LEN	32
++#define ARC4_MIN_KEY_LEN		1
++#define ARC4_MAX_KEY_LEN		256
++
++/* Max size of data that can be processed */
++#define CRYPTO_MAX_DATA_LEN		64*1024 - 1
++
++#define CRYPTO_ALGORITHM_MIN	1
++#define CRYPTO_DES_CBC			1
++#define CRYPTO_3DES_CBC			2
++#define CRYPTO_BLF_CBC			3
++#define CRYPTO_CAST_CBC			4
++#define CRYPTO_SKIPJACK_CBC		5
++#define CRYPTO_MD5_HMAC			6
++#define CRYPTO_SHA1_HMAC		7
++#define CRYPTO_RIPEMD160_HMAC	8
++#define CRYPTO_MD5_KPDK			9
++#define CRYPTO_SHA1_KPDK		10
++#define CRYPTO_RIJNDAEL128_CBC	11 /* 128 bit blocksize */
++#define CRYPTO_AES_CBC			11 /* 128 bit blocksize -- the same as above */
++#define CRYPTO_ARC4				12
++#define CRYPTO_MD5				13
++#define CRYPTO_SHA1				14
++#define CRYPTO_NULL_HMAC		15
++#define CRYPTO_NULL_CBC			16
++#define CRYPTO_DEFLATE_COMP		17 /* Deflate compression algorithm */
++#define CRYPTO_SHA2_256_HMAC	18
++#define CRYPTO_SHA2_384_HMAC	19
++#define CRYPTO_SHA2_512_HMAC	20
++#define CRYPTO_CAMELLIA_CBC		21
++#define CRYPTO_SHA2_256			22
++#define CRYPTO_SHA2_384			23
++#define CRYPTO_SHA2_512			24
++#define CRYPTO_RIPEMD160		25
++#define CRYPTO_ALGORITHM_MAX	25 /* Keep updated - see below */
++
++/* Algorithm flags */
++#define CRYPTO_ALG_FLAG_SUPPORTED	0x01 /* Algorithm is supported */
++#define CRYPTO_ALG_FLAG_RNG_ENABLE	0x02 /* Has HW RNG for DH/DSA */
++#define CRYPTO_ALG_FLAG_DSA_SHA		0x04 /* Can do SHA on msg */
++
++/*
++ * Crypto driver/device flags.  They can set in the crid
++ * parameter when creating a session or submitting a key
++ * op to affect the device/driver assigned.  If neither
++ * of these are specified then the crid is assumed to hold
++ * the driver id of an existing (and suitable) device that
++ * must be used to satisfy the request.
++ */
++#define CRYPTO_FLAG_HARDWARE	0x01000000	/* hardware accelerated */
++#define CRYPTO_FLAG_SOFTWARE	0x02000000	/* software implementation */
++
++/* NB: deprecated */
++struct session_op {
++	u_int32_t	cipher;		/* ie. CRYPTO_DES_CBC */
++	u_int32_t	mac;		/* ie. CRYPTO_MD5_HMAC */
++
++	u_int32_t	keylen;		/* cipher key */
++	caddr_t		key;
++	int		mackeylen;	/* mac key */
++	caddr_t		mackey;
++
++  	u_int32_t	ses;		/* returns: session # */ 
++};
++
++struct session2_op {
++	u_int32_t	cipher;		/* ie. CRYPTO_DES_CBC */
++	u_int32_t	mac;		/* ie. CRYPTO_MD5_HMAC */
++
++	u_int32_t	keylen;		/* cipher key */
++	caddr_t		key;
++	int		mackeylen;	/* mac key */
++	caddr_t		mackey;
++
++  	u_int32_t	ses;		/* returns: session # */ 
++	int		crid;		/* driver id + flags (rw) */
++	int		pad[4];		/* for future expansion */
++};
++
++struct crypt_op {
++	u_int32_t	ses;
++	u_int16_t	op;		/* i.e. COP_ENCRYPT */
++#define COP_NONE	0
++#define COP_ENCRYPT	1
++#define COP_DECRYPT	2
++	u_int16_t	flags;
++#define	COP_F_BATCH	0x0008		/* Batch op if possible */
++	u_int		len;
++	caddr_t		src, dst;	/* become iov[] inside kernel */
++	caddr_t		mac;		/* must be big enough for chosen MAC */
++	caddr_t		iv;
++};
++
++/*
++ * Parameters for looking up a crypto driver/device by
++ * device name or by id.  The latter are returned for
++ * created sessions (crid) and completed key operations.
++ */
++struct crypt_find_op {
++	int		crid;		/* driver id + flags */
++	char		name[32];	/* device/driver name */
++};
++
++/* bignum parameter, in packed bytes, ... */
++struct crparam {
++	caddr_t		crp_p;
++	u_int		crp_nbits;
++};
++
++#define CRK_MAXPARAM	8
++
++struct crypt_kop {
++	u_int		crk_op;		/* ie. CRK_MOD_EXP or other */
++	u_int		crk_status;	/* return status */
++	u_short		crk_iparams;	/* # of input parameters */
++	u_short		crk_oparams;	/* # of output parameters */
++	u_int		crk_crid;	/* NB: only used by CIOCKEY2 (rw) */
++	struct crparam	crk_param[CRK_MAXPARAM];
++};
++#define CRK_ALGORITM_MIN	0
++#define CRK_MOD_EXP		0
++#define CRK_MOD_EXP_CRT		1
++#define CRK_DSA_SIGN		2
++#define CRK_DSA_VERIFY		3
++#define CRK_DH_COMPUTE_KEY	4
++#define CRK_ALGORITHM_MAX	4 /* Keep updated - see below */
++
++#define CRF_MOD_EXP		(1 << CRK_MOD_EXP)
++#define CRF_MOD_EXP_CRT		(1 << CRK_MOD_EXP_CRT)
++#define CRF_DSA_SIGN		(1 << CRK_DSA_SIGN)
++#define CRF_DSA_VERIFY		(1 << CRK_DSA_VERIFY)
++#define CRF_DH_COMPUTE_KEY	(1 << CRK_DH_COMPUTE_KEY)
++
++/*
++ * done against open of /dev/crypto, to get a cloned descriptor.
++ * Please use F_SETFD against the cloned descriptor.
++ */
++#define CRIOGET		_IOWR('c', 100, u_int32_t)
++#define CRIOASYMFEAT	CIOCASYMFEAT
++#define CRIOFINDDEV	CIOCFINDDEV
++
++/* the following are done against the cloned descriptor */
++#define CIOCGSESSION	_IOWR('c', 101, struct session_op)
++#define CIOCFSESSION	_IOW('c', 102, u_int32_t)
++#define CIOCCRYPT	_IOWR('c', 103, struct crypt_op)
++#define CIOCKEY		_IOWR('c', 104, struct crypt_kop)
++#define CIOCASYMFEAT	_IOR('c', 105, u_int32_t)
++#define CIOCGSESSION2	_IOWR('c', 106, struct session2_op)
++#define CIOCKEY2	_IOWR('c', 107, struct crypt_kop)
++#define CIOCFINDDEV	_IOWR('c', 108, struct crypt_find_op)
++
++struct cryptotstat {
++	struct timespec	acc;		/* total accumulated time */
++	struct timespec	min;		/* min time */
++	struct timespec	max;		/* max time */
++	u_int32_t	count;		/* number of observations */
++};
++
++struct cryptostats {
++	u_int32_t	cs_ops;		/* symmetric crypto ops submitted */
++	u_int32_t	cs_errs;	/* symmetric crypto ops that failed */
++	u_int32_t	cs_kops;	/* asymetric/key ops submitted */
++	u_int32_t	cs_kerrs;	/* asymetric/key ops that failed */
++	u_int32_t	cs_intrs;	/* crypto swi thread activations */
++	u_int32_t	cs_rets;	/* crypto return thread activations */
++	u_int32_t	cs_blocks;	/* symmetric op driver block */
++	u_int32_t	cs_kblocks;	/* symmetric op driver block */
++	/*
++	 * When CRYPTO_TIMING is defined at compile time and the
++	 * sysctl debug.crypto is set to 1, the crypto system will
++	 * accumulate statistics about how long it takes to process
++	 * crypto requests at various points during processing.
++	 */
++	struct cryptotstat cs_invoke;	/* crypto_dipsatch -> crypto_invoke */
++	struct cryptotstat cs_done;	/* crypto_invoke -> crypto_done */
++	struct cryptotstat cs_cb;	/* crypto_done -> callback */
++	struct cryptotstat cs_finis;	/* callback -> callback return */
++
++	u_int32_t	cs_drops;		/* crypto ops dropped due to congestion */
++};
++
++#ifdef __KERNEL__
++
++/* Standard initialization structure beginning */
++struct cryptoini {
++	int		cri_alg;	/* Algorithm to use */
++	int		cri_klen;	/* Key length, in bits */
++	int		cri_mlen;	/* Number of bytes we want from the
++					   entire hash. 0 means all. */
++	caddr_t		cri_key;	/* key to use */
++	u_int8_t	cri_iv[EALG_MAX_BLOCK_LEN];	/* IV to use */
++	struct cryptoini *cri_next;
++};
++
++/* Describe boundaries of a single crypto operation */
++struct cryptodesc {
++	int		crd_skip;	/* How many bytes to ignore from start */
++	int		crd_len;	/* How many bytes to process */
++	int		crd_inject;	/* Where to inject results, if applicable */
++	int		crd_flags;
++
++#define CRD_F_ENCRYPT		0x01	/* Set when doing encryption */
++#define CRD_F_IV_PRESENT	0x02	/* When encrypting, IV is already in
++					   place, so don't copy. */
++#define CRD_F_IV_EXPLICIT	0x04	/* IV explicitly provided */
++#define CRD_F_DSA_SHA_NEEDED	0x08	/* Compute SHA-1 of buffer for DSA */
++#define CRD_F_KEY_EXPLICIT	0x10	/* Key explicitly provided */
++#define CRD_F_COMP		0x0f    /* Set when doing compression */
++
++	struct cryptoini	CRD_INI; /* Initialization/context data */
++#define crd_iv		CRD_INI.cri_iv
++#define crd_key		CRD_INI.cri_key
++#define crd_alg		CRD_INI.cri_alg
++#define crd_klen	CRD_INI.cri_klen
++#define crd_mlen	CRD_INI.cri_mlen
++
++	struct cryptodesc *crd_next;
++};
++
++/* Structure describing complete operation */
++struct cryptop {
++	struct list_head crp_next;
++	wait_queue_head_t crp_waitq;
++
++	u_int64_t	crp_sid;	/* Session ID */
++	int		crp_ilen;	/* Input data total length */
++	int		crp_olen;	/* Result total length */
++
++	int		crp_etype;	/*
++					 * Error type (zero means no error).
++					 * All error codes except EAGAIN
++					 * indicate possible data corruption (as in,
++					 * the data have been touched). On all
++					 * errors, the crp_sid may have changed
++					 * (reset to a new one), so the caller
++					 * should always check and use the new
++					 * value on future requests.
++					 */
++	int		crp_flags;
++
++#define CRYPTO_F_SKBUF		0x0001	/* Input/output are skbuf chains */
++#define CRYPTO_F_IOV		0x0002	/* Input/output are uio */
++#define CRYPTO_F_REL		0x0004	/* Must return data in same place */
++#define CRYPTO_F_BATCH		0x0008	/* Batch op if possible */
++#define CRYPTO_F_CBIMM		0x0010	/* Do callback immediately */
++#define CRYPTO_F_DONE		0x0020	/* Operation completed */
++#define CRYPTO_F_CBIFSYNC	0x0040	/* Do CBIMM if op is synchronous */
++
++	caddr_t		crp_buf;	/* Data to be processed */
++	caddr_t		crp_opaque;	/* Opaque pointer, passed along */
++	struct cryptodesc *crp_desc;	/* Linked list of processing descriptors */
++
++	int (*crp_callback)(struct cryptop *); /* Callback function */
++};
++
++#define CRYPTO_BUF_CONTIG	0x0
++#define CRYPTO_BUF_IOV		0x1
++#define CRYPTO_BUF_SKBUF		0x2
++
++#define CRYPTO_OP_DECRYPT	0x0
++#define CRYPTO_OP_ENCRYPT	0x1
++
++/*
++ * Hints passed to process methods.
++ */
++#define CRYPTO_HINT_MORE	0x1	/* more ops coming shortly */
++
++struct cryptkop {
++	struct list_head krp_next;
++	wait_queue_head_t krp_waitq;
++
++	int		krp_flags;
++#define CRYPTO_KF_DONE		0x0001	/* Operation completed */
++#define CRYPTO_KF_CBIMM		0x0002	/* Do callback immediately */
++
++	u_int		krp_op;		/* ie. CRK_MOD_EXP or other */
++	u_int		krp_status;	/* return status */
++	u_short		krp_iparams;	/* # of input parameters */
++	u_short		krp_oparams;	/* # of output parameters */
++	u_int		krp_crid;	/* desired device, etc. */
++	u_int32_t	krp_hid;
++	struct crparam	krp_param[CRK_MAXPARAM];	/* kvm */
++	int		(*krp_callback)(struct cryptkop *);
++};
++
++#include <ocf-compat.h>
++
++/*
++ * Session ids are 64 bits.  The lower 32 bits contain a "local id" which
++ * is a driver-private session identifier.  The upper 32 bits contain a
++ * "hardware id" used by the core crypto code to identify the driver and
++ * a copy of the driver's capabilities that can be used by client code to
++ * optimize operation.
++ */
++#define CRYPTO_SESID2HID(_sid)	(((_sid) >> 32) & 0x00ffffff)
++#define CRYPTO_SESID2CAPS(_sid)	(((_sid) >> 32) & 0xff000000)
++#define CRYPTO_SESID2LID(_sid)	(((u_int32_t) (_sid)) & 0xffffffff)
++
++extern	int crypto_newsession(u_int64_t *sid, struct cryptoini *cri, int hard);
++extern	int crypto_freesession(u_int64_t sid);
++#define CRYPTOCAP_F_HARDWARE	CRYPTO_FLAG_HARDWARE
++#define CRYPTOCAP_F_SOFTWARE	CRYPTO_FLAG_SOFTWARE
++#define CRYPTOCAP_F_SYNC	0x04000000	/* operates synchronously */
++extern	int32_t crypto_get_driverid(device_t dev, int flags);
++extern	int crypto_find_driver(const char *);
++extern	device_t crypto_find_device_byhid(int hid);
++extern	int crypto_getcaps(int hid);
++extern	int crypto_register(u_int32_t driverid, int alg, u_int16_t maxoplen,
++	    u_int32_t flags);
++extern	int crypto_kregister(u_int32_t, int, u_int32_t);
++extern	int crypto_unregister(u_int32_t driverid, int alg);
++extern	int crypto_unregister_all(u_int32_t driverid);
++extern	int crypto_dispatch(struct cryptop *crp);
++extern	int crypto_kdispatch(struct cryptkop *);
++#define CRYPTO_SYMQ	0x1
++#define CRYPTO_ASYMQ	0x2
++extern	int crypto_unblock(u_int32_t, int);
++extern	void crypto_done(struct cryptop *crp);
++extern	void crypto_kdone(struct cryptkop *);
++extern	int crypto_getfeat(int *);
++
++extern	void crypto_freereq(struct cryptop *crp);
++extern	struct cryptop *crypto_getreq(int num);
++
++extern  int crypto_usercrypto;      /* userland may do crypto requests */
++extern  int crypto_userasymcrypto;  /* userland may do asym crypto reqs */
++extern  int crypto_devallowsoft;    /* only use hardware crypto */
++
++/*
++ * random number support,  crypto_unregister_all will unregister
++ */
++extern int crypto_rregister(u_int32_t driverid,
++		int (*read_random)(void *arg, u_int32_t *buf, int len), void *arg);
++extern int crypto_runregister_all(u_int32_t driverid);
++
++/*
++ * Crypto-related utility routines used mainly by drivers.
++ *
++ * XXX these don't really belong here; but for now they're
++ *     kept apart from the rest of the system.
++ */
++struct uio;
++extern	void cuio_copydata(struct uio* uio, int off, int len, caddr_t cp);
++extern	void cuio_copyback(struct uio* uio, int off, int len, caddr_t cp);
++extern	struct iovec *cuio_getptr(struct uio *uio, int loc, int *off);
++
++extern	void crypto_copyback(int flags, caddr_t buf, int off, int size,
++	    caddr_t in);
++extern	void crypto_copydata(int flags, caddr_t buf, int off, int size,
++	    caddr_t out);
++extern	int crypto_apply(int flags, caddr_t buf, int off, int len,
++	    int (*f)(void *, void *, u_int), void *arg);
++
++#endif /* __KERNEL__ */
++#endif /* _CRYPTO_CRYPTO_H_ */
+diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
+index 18fd130..a469480 100644
+--- a/include/linux/miscdevice.h
++++ b/include/linux/miscdevice.h
+@@ -18,6 +18,7 @@
+ #define APOLLO_MOUSE_MINOR	7
+ #define PC110PAD_MINOR		9
+ /*#define ADB_MOUSE_MINOR	10	FIXME OBSOLETE */
++#define CRYPTODEV_MINOR		70	/* /dev/crypto */
+ #define WATCHDOG_MINOR		130	/* Watchdog timer     */
+ #define TEMP_MINOR		131	/* Temperature Sensor */
+ #define RTC_MINOR		135
+diff --git a/include/linux/random.h b/include/linux/random.h
+index fb7ab9d..26ab66b 100644
+--- a/include/linux/random.h
++++ b/include/linux/random.h
+@@ -9,6 +9,7 @@
+ 
+ #include <linux/types.h>
+ #include <linux/ioctl.h>
++#include <linux/types.h> /* for __u32 in user space */
+ #include <linux/irqnr.h>
+ 
+ /* ioctl()'s for the random number generator */
+@@ -34,6 +35,30 @@
+ /* Clear the entropy pool and associated counters.  (Superuser only.) */
+ #define RNDCLEARPOOL	_IO( 'R', 0x06 )
+ 
++#ifdef CONFIG_FIPS_RNG
++
++/* Size of seed value - equal to AES blocksize */
++#define AES_BLOCK_SIZE_BYTES	16
++#define SEED_SIZE_BYTES			AES_BLOCK_SIZE_BYTES
++/* Size of AES key */
++#define KEY_SIZE_BYTES		16
++
++/* ioctl() structure used by FIPS 140-2 Tests */
++struct rand_fips_test {
++	unsigned char key[KEY_SIZE_BYTES];			/* Input */
++	unsigned char datetime[SEED_SIZE_BYTES];	/* Input */
++	unsigned char seed[SEED_SIZE_BYTES];		/* Input */
++	unsigned char result[SEED_SIZE_BYTES];		/* Output */
++};
++
++/* FIPS 140-2 RNG Variable Seed Test. (Superuser only.) */
++#define RNDFIPSVST	_IOWR('R', 0x10, struct rand_fips_test)
++
++/* FIPS 140-2 RNG Monte Carlo Test. (Superuser only.) */
++#define RNDFIPSMCT	_IOWR('R', 0x11, struct rand_fips_test)
++
++#endif /* #ifdef CONFIG_FIPS_RNG */
++
+ struct rand_pool_info {
+ 	int	entropy_count;
+ 	int	buf_size;
+@@ -54,6 +79,10 @@ extern void add_input_randomness(unsigned int type, unsigned int code,
+ 				 unsigned int value);
+ extern void add_interrupt_randomness(int irq);
+ 
++extern void random_input_words(__u32 *buf, size_t wordcount, int ent_count);
++extern int random_input_wait(void);
++#define HAS_RANDOM_INPUT_WAIT 1
++
+ extern void get_random_bytes(void *buf, int nbytes);
+ void generate_random_uuid(unsigned char uuid_out[16]);
+ 
+diff --git a/kernel/pid.c b/kernel/pid.c
+index 39b65b6..1cccf44 100644
+--- a/kernel/pid.c
++++ b/kernel/pid.c
+@@ -424,6 +424,7 @@ struct task_struct *find_task_by_vpid(pid_t vnr)
+ {
+ 	return find_task_by_pid_ns(vnr, current->nsproxy->pid_ns);
+ }
++EXPORT_SYMBOL(find_task_by_vpid);
+ 
+ struct pid *get_task_pid(struct task_struct *task, enum pid_type type)
+ {
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-mt9t111-enable-clock-pad-register-in-configuration.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-mt9t111-enable-clock-pad-register-in-configuration.patch
new file mode 100644
index 0000000..d4e6c79
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-mt9t111-enable-clock-pad-register-in-configuration.patch
@@ -0,0 +1,29 @@
+From ac7635211d2a5b133bac56fec4b6ed087f553e49 Mon Sep 17 00:00:00 2001
+From: Punya Prakash <pprakash@ti.com>
+Date: Thu, 30 Jun 2011 13:52:18 -0500
+Subject: [PATCH]  mt9t111: enable clock pad register in configuration
+
+* fixes the issue where sensor sync pulses were not generated during first loopback after boot-up
+
+Upstream-Status: Pending
+
+Signed-off-by: Punya Prakash <pprakash@ti.com>
+---
+ drivers/media/video/mt9t111.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/media/video/mt9t111.c b/drivers/media/video/mt9t111.c
+index f18aa24..02c18a5 100644
+--- a/drivers/media/video/mt9t111.c
++++ b/drivers/media/video/mt9t111.c
+@@ -290,6 +290,9 @@ static int mt9t111_configure(struct v4l2_subdev *subdev)
+ 	if (err)
+ 		goto out;
+ 
++	// Enable Clock pad
++	err = mt9t111_write_reg(client, 0x0016, 0x0400);
++
+ 	err = mt9t111_write_regs(client, def_regs1,
+ 			   sizeof(def_regs1) / sizeof(mt9t111_regs));
+ 	if (err)
+-- 
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-nlcp-sdio-fixes-for-wowlan-support.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-nlcp-sdio-fixes-for-wowlan-support.patch
new file mode 100644
index 0000000..a26d02e
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-nlcp-sdio-fixes-for-wowlan-support.patch
@@ -0,0 +1,96 @@
+From 33f43b37f82038e8383e76d621448a9983ed35e4 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 3 Aug 2011 14:48:18 +0300
+Subject: [PATCH 1/6] nlcp: sdio fixes for wowlan support
+
+Upstream status: pending
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ drivers/mmc/core/core.c       |    8 ++++++--
+ drivers/mmc/core/sdio.c       |    2 +-
+ drivers/mmc/host/omap_hsmmc.c |    2 ++
+ include/linux/mmc/host.h      |    9 +++++++++
+ 4 files changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
+index 2762ad2..55bc015 100644
+--- a/drivers/mmc/core/core.c
++++ b/drivers/mmc/core/core.c
+@@ -1705,7 +1705,7 @@ int mmc_suspend_host(struct mmc_host *host)
+ 	}
+ 	mmc_bus_put(host);
+ 
+-	if (!err && !(host->pm_flags & MMC_PM_KEEP_POWER))
++	if (!err && !mmc_card_keep_power(host))
+ 		mmc_power_off(host);
+ 
+ 	return err;
+@@ -1723,7 +1723,7 @@ int mmc_resume_host(struct mmc_host *host)
+ 
+ 	mmc_bus_get(host);
+ 	if (host->bus_ops && !host->bus_dead) {
+-		if (!(host->pm_flags & MMC_PM_KEEP_POWER)) {
++		if (!mmc_card_keep_power(host)) {
+ 			mmc_power_up(host);
+ 			mmc_select_voltage(host, host->ocr);
+ 			/*
+@@ -1748,6 +1748,10 @@ int mmc_resume_host(struct mmc_host *host)
+ 			err = 0;
+ 		}
+ 	}
++
++	/* clear flag */
++	host->pm_flags &= ~MMC_PM_KEEP_POWER;
++
+ 	mmc_bus_put(host);
+ 
+ 	return err;
+diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
+index b424fbe..4a198b2 100644
+--- a/drivers/mmc/core/sdio.c
++++ b/drivers/mmc/core/sdio.c
+@@ -616,7 +616,7 @@ static int mmc_sdio_suspend(struct mmc_host *host)
+ 		}
+ 	}
+ 
+-	if (!err && host->pm_flags & MMC_PM_KEEP_POWER) {
++	if (!err && mmc_card_keep_power(host) && mmc_card_wake_sdio_irq(host)) {
+ 		mmc_claim_host(host);
+ 		sdio_disable_wide(host->card);
+ 		mmc_release_host(host);
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index c75c799..b5f496d 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
+@@ -2222,6 +2222,8 @@ static int __init omap_hsmmc_probe(struct platform_device *pdev)
+ 	if (mmc_slot(host).nonremovable)
+ 		mmc->caps |= MMC_CAP_NONREMOVABLE;
+ 
++	mmc->pm_caps |= MMC_PM_KEEP_POWER;
++
+ 	omap_hsmmc_conf_bus_power(host);
+ 
+ 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
+index 86d74a5..74694c4 100644
+--- a/include/linux/mmc/host.h
++++ b/include/linux/mmc/host.h
+@@ -312,5 +312,14 @@ static inline int mmc_card_is_powered_resumed(struct mmc_host *host)
+ 	return host->pm_flags & MMC_PM_KEEP_POWER;
+ }
+ 
++static inline int mmc_card_keep_power(struct mmc_host *host)
++{
++	return host->pm_flags & MMC_PM_KEEP_POWER;
++}
++
++static inline int mmc_card_wake_sdio_irq(struct mmc_host *host)
++{
++	return host->pm_flags & MMC_PM_WAKE_SDIO_IRQ;
++}
+ #endif
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3-am3517evm-Allow-for-NAND-to-really-be-disabled.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3-am3517evm-Allow-for-NAND-to-really-be-disabled.patch
new file mode 100644
index 0000000..89f01f9
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3-am3517evm-Allow-for-NAND-to-really-be-disabled.patch
@@ -0,0 +1,48 @@
+From 2056c6802c5afbd722fcffc99a5cf50bbaee23c8 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@ti.com>
+Date: Tue, 15 Nov 2011 17:43:31 -0700
+Subject: [PATCH 1/3] omap3:am3517evm: Allow for NAND to really be disabled
+
+On boards with both NAND and NOR and NOR being selected, NAND needs
+to be disabled fully.
+
+Signed-off-by: Tom Rini <trini@ti.com>
+---
+ .../arch/arm/mach-omap2/board-am3517evm.c          |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am3517evm.c b/arch/arm/mach-omap2/board-am3517evm.c
+index 3992b86..1d17415 100644
+--- a/arch/arm/mach-omap2/board-am3517evm.c
++++ b/arch/arm/mach-omap2/board-am3517evm.c
+@@ -59,6 +59,7 @@
+ 
+ #define NAND_BLOCK_SIZE        SZ_128K
+ 
++#ifdef CONFIG_MTD_NAND_OMAP2
+ static struct mtd_partition am3517evm_nand_partitions[] = {
+ /* All the partition sizes are listed in terms of NAND block size */
+ 	{
+@@ -89,6 +90,7 @@ static struct mtd_partition am3517evm_nand_partitions[] = {
+ 		.offset         = MTDPART_OFS_APPEND,
+ 	},
+ };
++#endif
+ 
+ static struct mdio_platform_data am3517_evm_mdio_pdata = {
+ 	.bus_freq	= AM35XX_EVM_MDIO_FREQUENCY,
+@@ -926,9 +928,11 @@ static void __init am3517_evm_init(void)
+ 	/* DSS */
+ 	am3517_evm_display_init();
+ 
++#ifdef CONFIG_MTD_NAND_OMAP2
+ 	/* NAND */
+ 	board_nand_init(am3517evm_nand_partitions,
+ 					ARRAY_SIZE(am3517evm_nand_partitions), 0, NAND_BUSWIDTH_16);
++#endif
+ 
+ 	/* RTC - S35390A */
+ 	am3517_evm_rtc_init();
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-support-for-the-WL12xx-WLAN-module.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-support-for-the-WL12xx-WLAN-module.patch
new file mode 100644
index 0000000..1451bfb
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-support-for-the-WL12xx-WLAN-module.patch
@@ -0,0 +1,147 @@
+From 20a525629de613000b6f22f91f40063b0a43e7cc Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Tue, 12 Apr 2011 22:50:51 +0300
+Subject: [PATCH] omap3evm:add support for the WL12xx WLAN module
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ arch/arm/mach-omap2/board-omap3evm.c |   89 ++++++++++++++++++++++++++++++++++
+ 1 files changed, 89 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3evm.c b/arch/arm/mach-omap2/board-omap3evm.c
+index c8aabff..4088840 100644
+--- a/arch/arm/mach-omap2/board-omap3evm.c
++++ b/arch/arm/mach-omap2/board-omap3evm.c
+@@ -31,6 +31,8 @@
+ #include <linux/usb/otg.h>
+ #include <linux/smsc911x.h>
+
++#include <linux/wl12xx.h>
++#include <linux/regulator/fixed.h>
+ #include <linux/regulator/machine.h>
+ #include <linux/mmc/host.h>
+
+@@ -452,6 +454,16 @@ static struct omap2_hsmmc_info mmc[] = {
+		.gpio_cd	= -EINVAL,
+		.gpio_wp	= 63,
+	},
++#ifdef CONFIG_WL12XX_PLATFORM_DATA
++	{
++		.name		= "wl1271",
++		.mmc		= 2,
++		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_POWER_OFF_CARD,
++		.gpio_wp	= -EINVAL,
++		.gpio_cd	= -EINVAL,
++		.nonremovable	= true,
++	},
++#endif
+	{}	/* Terminator */
+ };
+
+@@ -671,6 +683,47 @@ static struct regulator_init_data omap3_evm_vio = {
+	.consumer_supplies      = omap3_evm_vio_supply,
+ };
+
++#ifdef CONFIG_WL12XX_PLATFORM_DATA
++
++#define OMAP3EVM_WLAN_PMENA_GPIO	(150)
++#define OMAP3EVM_WLAN_IRQ_GPIO		(149)
++
++static struct regulator_consumer_supply omap3evm_vmmc2_supply =
++	REGULATOR_SUPPLY("vmmc", "mmci-omap-hs.1");
++
++/* VMMC2 for driving the WL12xx module */
++static struct regulator_init_data omap3evm_vmmc2 = {
++	.constraints = {
++		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
++	},
++	.num_consumer_supplies	= 1,
++	.consumer_supplies = &omap3evm_vmmc2_supply,
++};
++
++static struct fixed_voltage_config omap3evm_vwlan = {
++	.supply_name		= "vwl1271",
++	.microvolts		= 1800000, /* 1.80V */
++	.gpio			= OMAP3EVM_WLAN_PMENA_GPIO,
++	.startup_delay		= 70000, /* 70ms */
++	.enable_high		= 1,
++	.enabled_at_boot	= 0,
++	.init_data		= &omap3evm_vmmc2,
++};
++
++static struct platform_device omap3evm_wlan_regulator = {
++	.name		= "reg-fixed-voltage",
++	.id		= 1,
++	.dev = {
++		.platform_data	= &omap3evm_vwlan,
++	},
++};
++
++struct wl12xx_platform_data omap3evm_wlan_data __initdata = {
++	.irq = OMAP_GPIO_IRQ(OMAP3EVM_WLAN_IRQ_GPIO),
++	.board_ref_clock = WL12XX_REFCLOCK_38, /* 38.4 MHz */
++};
++#endif
++
+ static struct twl4030_platform_data omap3evm_twldata = {
+	.irq_base	= TWL4030_IRQ_BASE,
+	.irq_end	= TWL4030_IRQ_END,
+@@ -876,6 +929,21 @@ static struct omap_board_mux omap35x_board_mux[] __initdata = {
+				OMAP_PIN_OFF_NONE),
+	OMAP3_MUX(MCBSP1_FSR, OMAP_MUX_MODE4 | OMAP_PIN_INPUT_PULLUP |
+				OMAP_PIN_OFF_NONE),
++#ifdef CONFIG_WL12XX_PLATFORM_DATA
++	/* WLAN IRQ - GPIO 149 */
++	OMAP3_MUX(UART1_RTS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT),
++
++	/* WLAN POWER ENABLE - GPIO 150 */
++	OMAP3_MUX(UART1_CTS, OMAP_MUX_MODE4 | OMAP_PIN_OUTPUT),
++
++	/* MMC2 SDIO pin muxes for WL12xx */
++	OMAP3_MUX(SDMMC2_CLK, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_CMD, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT0, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT1, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT2, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT3, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++#endif
+	{ .reg_offset = OMAP_MUX_TERMINATOR },
+ };
+
+@@ -901,6 +969,21 @@ static struct omap_board_mux omap36x_board_mux[] __initdata = {
+	OMAP3_MUX(SYS_BOOT4, OMAP_MUX_MODE3 | OMAP_PIN_OFF_NONE),
+	OMAP3_MUX(SYS_BOOT5, OMAP_MUX_MODE3 | OMAP_PIN_OFF_NONE),
+	OMAP3_MUX(SYS_BOOT6, OMAP_MUX_MODE3 | OMAP_PIN_OFF_NONE),
++#ifdef CONFIG_WL12XX_PLATFORM_DATA
++	/* WLAN IRQ - GPIO 149 */
++	OMAP3_MUX(UART1_RTS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT),
++
++	/* WLAN POWER ENABLE - GPIO 150 */
++	OMAP3_MUX(UART1_CTS, OMAP_MUX_MODE4 | OMAP_PIN_OUTPUT),
++
++	/* MMC2 SDIO pin muxes for WL12xx */
++	OMAP3_MUX(SDMMC2_CLK, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_CMD, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT0, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT1, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT2, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++	OMAP3_MUX(SDMMC2_DAT3, OMAP_MUX_MODE0 | OMAP_PIN_INPUT_PULLUP),
++#endif
+	{ .reg_offset = OMAP_MUX_TERMINATOR },
+ };
+ #else
+@@ -976,6 +1059,12 @@ static void __init omap3_evm_init(void)
+			0, NAND_BUSWIDTH_16);
+	board_onenand_init(omap3_evm_onenand_partitions,
+			ARRAY_SIZE(omap3_evm_onenand_partitions), 0);
++#ifdef CONFIG_WL12XX_PLATFORM_DATA
++	/* WL12xx WLAN Init */
++	if (wl12xx_set_platform_data(&omap3evm_wlan_data))
++		pr_err("error setting wl12xx data\n");
++	platform_device_register(&omap3evm_wlan_regulator);
++#endif
+ }
+
+ MACHINE_START(OMAP3EVM, "OMAP3 EVM")
+--
+1.7.0.4
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-wake-on-wlan-support.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-wake-on-wlan-support.patch
new file mode 100644
index 0000000..232835d9a
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap3evm-add-wake-on-wlan-support.patch
@@ -0,0 +1,49 @@
+From 5e7643b6e4fe8144e576f2faf9f1e07fd2a7753f Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 3 Aug 2011 14:01:45 +0300
+Subject: [PATCH 1/8] omap3evm: add wake on wlan support
+
+Upstream status: pending
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ arch/arm/mach-omap2/board-omap3evm.c |    9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3evm.c b/arch/arm/mach-omap2/board-omap3evm.c
+index 4088840..08c074a 100644
+--- a/arch/arm/mach-omap2/board-omap3evm.c
++++ b/arch/arm/mach-omap2/board-omap3evm.c
+@@ -458,7 +458,8 @@ static struct omap2_hsmmc_info mmc[] = {
+ 	{
+ 		.name		= "wl1271",
+ 		.mmc		= 2,
+-		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_POWER_OFF_CARD,
++		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_POWER_OFF_CARD
++				| MMC_PM_KEEP_POWER ,
+ 		.gpio_wp	= -EINVAL,
+ 		.gpio_cd	= -EINVAL,
+ 		.nonremovable	= true,
+@@ -931,7 +932,8 @@ static struct omap_board_mux omap35x_board_mux[] __initdata = {
+ 				OMAP_PIN_OFF_NONE),
+ #ifdef CONFIG_WL12XX_PLATFORM_DATA
+ 	/* WLAN IRQ - GPIO 149 */
+-	OMAP3_MUX(UART1_RTS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT),
++	OMAP3_MUX(UART1_RTS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT |
++		  OMAP_PIN_OFF_WAKEUPENABLE),
+ 
+ 	/* WLAN POWER ENABLE - GPIO 150 */
+ 	OMAP3_MUX(UART1_CTS, OMAP_MUX_MODE4 | OMAP_PIN_OUTPUT),
+@@ -971,7 +973,8 @@ static struct omap_board_mux omap36x_board_mux[] __initdata = {
+ 	OMAP3_MUX(SYS_BOOT6, OMAP_MUX_MODE3 | OMAP_PIN_OFF_NONE),
+ #ifdef CONFIG_WL12XX_PLATFORM_DATA
+ 	/* WLAN IRQ - GPIO 149 */
+-	OMAP3_MUX(UART1_RTS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT),
++	OMAP3_MUX(UART1_RTS, OMAP_MUX_MODE4 | OMAP_PIN_INPUT |
++		  OMAP_PIN_OFF_WAKEUPENABLE),
+ 
+ 	/* WLAN POWER ENABLE - GPIO 150 */
+ 	OMAP3_MUX(UART1_CTS, OMAP_MUX_MODE4 | OMAP_PIN_OUTPUT),
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap_hsmmc-make-default-dto-value-14.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap_hsmmc-make-default-dto-value-14.patch
new file mode 100644
index 0000000..d1bd2c3
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-omap_hsmmc-make-default-dto-value-14.patch
@@ -0,0 +1,34 @@
+From a4f14adcde615d2f6689ed9046464dad8a5465f6 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 21 Nov 2011 07:40:40 -0600
+Subject: [PATCH] omap_hsmmc: make default dto value 14
+
+* It seems that making the dto value makes all the various SD
+  cards work.  If not we will sometimes see -110 errors during
+  boot with certain SD cards.
+* Based on input from Steve Kipisz
+
+Upstream-Status: Pending
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ drivers/mmc/host/omap_hsmmc.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index b5f496d..6985331 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
+@@ -1494,6 +1494,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
+ 			dto = 14;
+ 	}
+ 
++    // Use 14 by default because this seems to work will with all cards
++    dto = 14;
++
+ 	reg &= ~DTO_MASK;
+ 	reg |= dto << DTO_SHIFT;
+ 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-usb-musb-am35x-set-default-VBUS-timeout-value.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-usb-musb-am35x-set-default-VBUS-timeout-value.patch
new file mode 100644
index 0000000..a95419b
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0001-usb-musb-am35x-set-default-VBUS-timeout-value.patch
@@ -0,0 +1,38 @@
+From f0cf4495fc1d4dfb71a93eb6e315789c276221da Mon Sep 17 00:00:00 2001
+From: Bin Liu <b-liu@ti.com>
+Date: Wed, 30 May 2012 15:35:07 -0500
+Subject: [PATCH 1/2] usb: musb: am35x: set default VBUS timeout value
+
+The issue was:
+musb->a_wait_bcon was not set so the OTG timer does not start when
+a USB device gets disconnected to reset the OTG back to b_idle state.
+
+Signed-off-by: Bin Liu <b-liu@ti.com>
+---
+ drivers/usb/musb/am35x.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/musb/am35x.c b/drivers/usb/musb/am35x.c
+index 57d4417..a59a5e7 100644
+--- a/drivers/usb/musb/am35x.c
++++ b/drivers/usb/musb/am35x.c
+@@ -79,6 +79,8 @@
+ #define AM35X_TX_INTR_MASK	(AM35X_TX_EP_MASK << AM35X_INTR_TX_SHIFT)
+ #define AM35X_RX_INTR_MASK	(AM35X_RX_EP_MASK << AM35X_INTR_RX_SHIFT)
+ 
++#define A_WAIT_BCON_TIMEOUT     1100            /* in ms */
++
+ /* CPPI 4.1 queue manager registers */
+ #define QMGR_PEND0_REG		0x4090
+ #define QMGR_PEND1_REG		0x4094
+@@ -599,6 +601,7 @@ static int am35x_musb_init(struct musb *musb)
+ 	cppi41_init(musb);
+ #endif
+ 
++	musb->a_wait_bcon = A_WAIT_BCON_TIMEOUT;
+ 	musb->isr = am35x_musb_interrupt;
+ 
+ 	/* clear level interrupt */
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-allow-selecting-WL12XX_PLATFROM_DATA-independently.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-allow-selecting-WL12XX_PLATFROM_DATA-independently.patch
new file mode 100644
index 0000000..c4736d2
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-allow-selecting-WL12XX_PLATFROM_DATA-independently.patch
@@ -0,0 +1,37 @@
+From bc0118889db3c48fd5760fcd8d9633373a18d8fc Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 30 Mar 2011 15:39:26 +0200
+Subject: [PATCH 153/153] allow selecting WL12XX_PLATFROM_DATA independently of whether mac80211
+ and wl12xx drivers are selected in the kernel.
+ Needed for building with compat-wireless
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ arch/arm/mach-omap2/Kconfig         |    1 +
+ drivers/net/wireless/wl12xx/Kconfig |    1 -
+ 2 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
+index c787aef..0f67445 100644
+--- a/arch/arm/mach-omap2/Kconfig
++++ b/arch/arm/mach-omap2/Kconfig
+@@ -37,6 +37,7 @@ config ARCH_OMAP3
+	select ARM_L1_CACHE_SHIFT_6 if !ARCH_OMAP4
+	select ARCH_HAS_OPP
+	select PM_OPP if PM
++	select WL12XX_PLATFORM_DATA
+
+ config ARCH_OMAP4
+	bool "TI OMAP4"
+diff --git a/drivers/net/wireless/wl12xx/Kconfig b/drivers/net/wireless/wl12xx/Kconfig
+index b447559..441aaf6 100644
+--- a/drivers/net/wireless/wl12xx/Kconfig
++++ b/drivers/net/wireless/wl12xx/Kconfig
+@@ -42,5 +42,4 @@ config WL1271_SDIO
+
+ config WL12XX_PLATFORM_DATA
+	bool
+-	depends on WL1271_SDIO != n
+	default y
+--
+1.7.0.4
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-mmc-sdio-support-suspend-resume-while-runtime-suspen.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-mmc-sdio-support-suspend-resume-while-runtime-suspen.patch
new file mode 100644
index 0000000..ef3dc18
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-mmc-sdio-support-suspend-resume-while-runtime-suspen.patch
@@ -0,0 +1,82 @@
+From 3c61d0342093f4fbaeed8f063474ddfb250062fe Mon Sep 17 00:00:00 2001
+From: Ohad Ben-Cohen <ohad@wizery.com>
+Date: Sat, 2 Oct 2010 13:54:13 +0200
+Subject: [PATCH 2/6] mmc: sdio: support suspend/resume while runtime suspended
+
+Bring SDIO devices back to full power before their suspend
+handler is invoked.
+
+Doing so ensures that SDIO suspend/resume semantics are
+maintained (drivers still get to decide whether their
+card should be removed or kept during system suspend,
+and at what power state), and that SDIO suspend/resume
+execution paths are unchanged.
+
+This is achieved by resuming a runtime-suspended SDIO device
+in its ->prepare() PM callback (similary to the PCI subsystem).
+
+Since the PM core always increments the run-time usage
+counter before calling the ->prepare() callback and decrements
+it after calling the ->complete() callback, it is guaranteed
+that when the system will come out of suspend, our device's
+power state will reflect its runtime PM usage counter.
+
+Upstream status: accepted
+
+Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
+Tested-by: Luciano Coelho <luciano.coelho@nokia.com>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Eliad Peller <eliad@wizery.com>
+---
+ drivers/mmc/core/sdio_bus.c |   29 +++++++++++++++++++++++++++++
+ 1 files changed, 29 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
+index d29b9c3..aadb12d 100644
+--- a/drivers/mmc/core/sdio_bus.c
++++ b/drivers/mmc/core/sdio_bus.c
+@@ -197,12 +197,41 @@ out:
+ 
+ #ifdef CONFIG_PM_RUNTIME
+ 
++static int sdio_bus_pm_prepare(struct device *dev)
++{
++	/*
++	 * Resume an SDIO device which was suspended at run time at this
++	 * point, in order to allow standard SDIO suspend/resume paths
++	 * to keep working as usual.
++	 *
++	 * Ultimately, the SDIO driver itself will decide (in its
++	 * suspend handler, or lack thereof) whether the card should be
++	 * removed or kept, and if kept, at what power state.
++	 *
++	 * At this point, PM core have increased our use count, so it's
++	 * safe to directly resume the device. After system is resumed
++	 * again, PM core will drop back its runtime PM use count, and if
++	 * needed device will be suspended again.
++	 *
++	 * The end result is guaranteed to be a power state that is
++	 * coherent with the device's runtime PM use count.
++	 *
++	 * The return value of pm_runtime_resume is deliberately unchecked
++	 * since there is little point in failing system suspend if a
++	 * device can't be resumed.
++	 */
++	pm_runtime_resume(dev);
++
++	return 0;
++}
++
+ static const struct dev_pm_ops sdio_bus_pm_ops = {
+ 	SET_RUNTIME_PM_OPS(
+ 		pm_generic_runtime_suspend,
+ 		pm_generic_runtime_resume,
+ 		pm_generic_runtime_idle
+ 	)
++	.prepare = sdio_bus_pm_prepare,
+ };
+ 
+ #define SDIO_PM_OPS_PTR	(&sdio_bus_pm_ops)
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3-am3517evm-Update-NOR-partition-table.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3-am3517evm-Update-NOR-partition-table.patch
new file mode 100644
index 0000000..c6b512c
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3-am3517evm-Update-NOR-partition-table.patch
@@ -0,0 +1,58 @@
+From 3cf420f85f2ccaf01e8b76a7bbdc0b7119269032 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@ti.com>
+Date: Tue, 15 Nov 2011 17:44:24 -0700
+Subject: [PATCH 2/3] omap3:am3517evm: Update NOR partition table
+
+With newer U-Boot we use a different partition table on NOR
+
+Signed-off-by: Tom Rini <trini@ti.com>
+---
+ .../arch/arm/mach-omap2/board-am3517evm.c          |   19 ++++++-------------
+ 1 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am3517evm.c b/arch/arm/mach-omap2/board-am3517evm.c
+index 1d17415..e559f33 100644
+--- a/arch/arm/mach-omap2/board-am3517evm.c
++++ b/arch/arm/mach-omap2/board-am3517evm.c
+@@ -758,32 +758,25 @@ static const struct ehci_hcd_omap_platform_data ehci_pdata __initconst = {
+ 
+ /* NOR flash information */
+ static struct mtd_partition am3517_evm_norflash_partitions[] = {
+-	/* primiary bootloader (X-loader) in first 4 sectors(32K) */
+-	{
+-		.name           = "X-Loader-NOR",
+-		.offset         = 0,
+-		.size           = 4 * SZ_32K,
+-		.mask_flags     = MTD_WRITEABLE, /* force read-only */
+-	},
+-	/* secondary bootloader (U-Boot, etc) in first 5 sectors(128K) */
++	/* Bootloader (U-Boot) in first 512K */
+ 	{
+ 		.name           = "U-Boot-NOR",
+-		.offset         = MTDPART_OFS_APPEND,
+-		.size           = 5 * SZ_128K,
++		.offset         = 0,
++		.size           = 4 * SZ_128K,
+ 		.mask_flags     = MTD_WRITEABLE, /* force read-only */
+ 	},
+-	/* bootloader params in the next 2 sectors */
++	/* bootloader params in the next sector */
+ 	{
+ 		.name           = "Boot Env-NOR",
+ 		.offset         = MTDPART_OFS_APPEND,
+-		.size           = 2 * SZ_128K,
++		.size           = SZ_128K,
+ 		.mask_flags     = 0,
+ 	},
+ 	/* kernel */
+ 	{
+ 		.name           = "Kernel-NOR",
+ 		.offset         = MTDPART_OFS_APPEND,
+-		.size           = 32 * SZ_128K,
++		.size           = 27 * SZ_128K,
+ 		.mask_flags     = 0
+ 	},
+ 	/* file system */
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3_evm_defconfig-add-OCF-driver-support.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3_evm_defconfig-add-OCF-driver-support.patch
new file mode 100644
index 0000000..add5f92
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-omap3_evm_defconfig-add-OCF-driver-support.patch
@@ -0,0 +1,2292 @@
+From 26186d961f8d9c0874bbd52d2b788db2c82066d2 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 27 Jun 2011 13:42:47 -0500
+Subject: [PATCH 2/3] omap3_evm_defconfig: add OCF driver support
+
+* Updated the defconfig to add OCF driver support.  This was
+  Added by doing:
+    * make omap3_evm_defconfig
+    * make xconfig
+    * Enable OCF - Static
+    * Enable Crypto Random - Static
+    * Enable RNG support - Static
+    * Enable Cryptodev - Module
+
+Upstream-Status: Inappropriate [SDK specific changes]
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ arch/arm/configs/omap3_evm_defconfig | 1738 +++++++++++++++++++++++++++++++++-
+ 1 files changed, 1725 insertions(+), 13 deletions(-)
+
+diff --git a/arch/arm/configs/omap3_evm_defconfig b/arch/arm/configs/omap3_evm_defconfig
+index 8db3574..6b9c736 100644
+--- a/arch/arm/configs/omap3_evm_defconfig
++++ b/arch/arm/configs/omap3_evm_defconfig
+@@ -1,39 +1,249 @@
++#
++# Automatically generated make config: don't edit
++# Linux/arm 2.6.37 Kernel Configuration
++# Mon Jun 27 13:40:14 2011
++#
+ CONFIG_ARM=y
++CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+ CONFIG_GENERIC_GPIO=y
++# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
++CONFIG_GENERIC_CLOCKEVENTS=y
++CONFIG_HAVE_PROC_CPU=y
++CONFIG_GENERIC_HARDIRQS=y
++CONFIG_STACKTRACE_SUPPORT=y
++CONFIG_HAVE_LATENCYTOP_SUPPORT=y
++CONFIG_LOCKDEP_SUPPORT=y
++CONFIG_TRACE_IRQFLAGS_SUPPORT=y
++CONFIG_HARDIRQS_SW_RESEND=y
++CONFIG_GENERIC_IRQ_PROBE=y
++CONFIG_RWSEM_GENERIC_SPINLOCK=y
++CONFIG_ARCH_HAS_CPUFREQ=y
++CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
++CONFIG_GENERIC_HWEIGHT=y
++CONFIG_GENERIC_CALIBRATE_DELAY=y
++CONFIG_NEED_DMA_MAP_STATE=y
++CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
++CONFIG_ARM_L1_CACHE_SHIFT_6=y
++CONFIG_VECTORS_BASE=0xffff0000
++CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
++CONFIG_CONSTRUCTORS=y
++CONFIG_HAVE_IRQ_WORK=y
++CONFIG_IRQ_WORK=y
++
++#
++# General setup
++#
+ CONFIG_EXPERIMENTAL=y
++CONFIG_BROKEN_ON_SMP=y
++CONFIG_INIT_ENV_ARG_LIMIT=32
++CONFIG_CROSS_COMPILE=""
++CONFIG_LOCALVERSION=""
++CONFIG_LOCALVERSION_AUTO=y
++CONFIG_HAVE_KERNEL_GZIP=y
++CONFIG_HAVE_KERNEL_LZMA=y
++CONFIG_HAVE_KERNEL_LZO=y
++CONFIG_KERNEL_GZIP=y
++# CONFIG_KERNEL_LZMA is not set
++# CONFIG_KERNEL_LZO is not set
++CONFIG_SWAP=y
+ CONFIG_SYSVIPC=y
++CONFIG_SYSVIPC_SYSCTL=y
+ CONFIG_POSIX_MQUEUE=y
++CONFIG_POSIX_MQUEUE_SYSCTL=y
+ CONFIG_BSD_PROCESS_ACCT=y
++# CONFIG_BSD_PROCESS_ACCT_V3 is not set
++# CONFIG_TASKSTATS is not set
++# CONFIG_AUDIT is not set
++# CONFIG_HAVE_GENERIC_HARDIRQS is not set
++# CONFIG_SPARSE_IRQ is not set
++
++#
++# RCU Subsystem
++#
++CONFIG_TINY_RCU=y
++# CONFIG_PREEMPT_RCU is not set
++# CONFIG_TREE_RCU_TRACE is not set
+ CONFIG_IKCONFIG=y
+ CONFIG_IKCONFIG_PROC=y
+ CONFIG_LOG_BUF_SHIFT=16
++# CONFIG_CGROUPS is not set
++# CONFIG_NAMESPACES is not set
++# CONFIG_SYSFS_DEPRECATED is not set
++# CONFIG_RELAY is not set
+ CONFIG_BLK_DEV_INITRD=y
++CONFIG_INITRAMFS_SOURCE=""
++CONFIG_RD_GZIP=y
++# CONFIG_RD_BZIP2 is not set
++# CONFIG_RD_LZMA is not set
++# CONFIG_RD_LZO is not set
++CONFIG_CC_OPTIMIZE_FOR_SIZE=y
++CONFIG_SYSCTL=y
++CONFIG_ANON_INODES=y
+ CONFIG_EMBEDDED=y
++CONFIG_UID16=y
+ # CONFIG_SYSCTL_SYSCALL is not set
++CONFIG_KALLSYMS=y
++CONFIG_KALLSYMS_ALL=y
+ CONFIG_KALLSYMS_EXTRA_PASS=y
++CONFIG_HOTPLUG=y
++CONFIG_PRINTK=y
++CONFIG_BUG=y
++CONFIG_ELF_CORE=y
++CONFIG_BASE_FULL=y
++CONFIG_FUTEX=y
++CONFIG_EPOLL=y
++CONFIG_SIGNALFD=y
++CONFIG_TIMERFD=y
++CONFIG_EVENTFD=y
++CONFIG_SHMEM=y
++CONFIG_AIO=y
++CONFIG_HAVE_PERF_EVENTS=y
++CONFIG_PERF_USE_VMALLOC=y
+ 
+ #
+ # Kernel Performance Events And Counters
+ #
++CONFIG_PERF_EVENTS=y
++# CONFIG_PERF_COUNTERS is not set
++# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
++CONFIG_VM_EVENT_COUNTERS=y
++CONFIG_COMPAT_BRK=y
+ CONFIG_SLAB=y
++# CONFIG_SLUB is not set
++# CONFIG_SLOB is not set
+ CONFIG_PROFILING=y
++CONFIG_TRACEPOINTS=y
+ CONFIG_OPROFILE=y
++CONFIG_HAVE_OPROFILE=y
+ CONFIG_KPROBES=y
++CONFIG_KRETPROBES=y
++CONFIG_HAVE_KPROBES=y
++CONFIG_HAVE_KRETPROBES=y
++CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
++CONFIG_HAVE_CLK=y
++CONFIG_HAVE_HW_BREAKPOINT=y
++
++#
++# GCOV-based kernel profiling
++#
++# CONFIG_GCOV_KERNEL is not set
++CONFIG_HAVE_GENERIC_DMA_COHERENT=y
++CONFIG_SLABINFO=y
++CONFIG_RT_MUTEXES=y
++CONFIG_BASE_SMALL=0
+ CONFIG_MODULES=y
+ # CONFIG_MODULE_FORCE_LOAD is not set
+ CONFIG_MODULE_UNLOAD=y
+ # CONFIG_MODULE_FORCE_UNLOAD is not set
+ CONFIG_MODVERSIONS=y
+ CONFIG_MODULE_SRCVERSION_ALL=y
++CONFIG_BLOCK=y
++CONFIG_LBDAF=y
+ # CONFIG_BLK_DEV_BSG is not set
++# CONFIG_BLK_DEV_INTEGRITY is not set
+ 
+-
++#
++# IO Schedulers
++#
++CONFIG_IOSCHED_NOOP=y
++CONFIG_IOSCHED_DEADLINE=y
++CONFIG_IOSCHED_CFQ=y
++# CONFIG_DEFAULT_DEADLINE is not set
++CONFIG_DEFAULT_CFQ=y
++# CONFIG_DEFAULT_NOOP is not set
++CONFIG_DEFAULT_IOSCHED="cfq"
++# CONFIG_INLINE_SPIN_TRYLOCK is not set
++# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
++# CONFIG_INLINE_SPIN_LOCK is not set
++# CONFIG_INLINE_SPIN_LOCK_BH is not set
++# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
++# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
++# CONFIG_INLINE_SPIN_UNLOCK is not set
++# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
++# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
++# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
++# CONFIG_INLINE_READ_TRYLOCK is not set
++# CONFIG_INLINE_READ_LOCK is not set
++# CONFIG_INLINE_READ_LOCK_BH is not set
++# CONFIG_INLINE_READ_LOCK_IRQ is not set
++# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
++# CONFIG_INLINE_READ_UNLOCK is not set
++# CONFIG_INLINE_READ_UNLOCK_BH is not set
++# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
++# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
++# CONFIG_INLINE_WRITE_TRYLOCK is not set
++# CONFIG_INLINE_WRITE_LOCK is not set
++# CONFIG_INLINE_WRITE_LOCK_BH is not set
++# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
++# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
++# CONFIG_INLINE_WRITE_UNLOCK is not set
++# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
++# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
++# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
++# CONFIG_MUTEX_SPIN_ON_OWNER is not set
++CONFIG_FREEZER=y
+ 
+ #
+ # System Type
+ #
+ CONFIG_MMU=y
++# CONFIG_ARCH_AAEC2000 is not set
++# CONFIG_ARCH_INTEGRATOR is not set
++# CONFIG_ARCH_REALVIEW is not set
++# CONFIG_ARCH_VERSATILE is not set
++# CONFIG_ARCH_VEXPRESS is not set
++# CONFIG_ARCH_AT91 is not set
++# CONFIG_ARCH_BCMRING is not set
++# CONFIG_ARCH_CLPS711X is not set
++# CONFIG_ARCH_CNS3XXX is not set
++# CONFIG_ARCH_GEMINI is not set
++# CONFIG_ARCH_EBSA110 is not set
++# CONFIG_ARCH_EP93XX is not set
++# CONFIG_ARCH_FOOTBRIDGE is not set
++# CONFIG_ARCH_MXC is not set
++# CONFIG_ARCH_STMP3XXX is not set
++# CONFIG_ARCH_NETX is not set
++# CONFIG_ARCH_H720X is not set
++# CONFIG_ARCH_IOP13XX is not set
++# CONFIG_ARCH_IOP32X is not set
++# CONFIG_ARCH_IOP33X is not set
++# CONFIG_ARCH_IXP23XX is not set
++# CONFIG_ARCH_IXP2000 is not set
++# CONFIG_ARCH_IXP4XX is not set
++# CONFIG_ARCH_DOVE is not set
++# CONFIG_ARCH_KIRKWOOD is not set
++# CONFIG_ARCH_LOKI is not set
++# CONFIG_ARCH_LPC32XX is not set
++# CONFIG_ARCH_MV78XX0 is not set
++# CONFIG_ARCH_ORION5X is not set
++# CONFIG_ARCH_MMP is not set
++# CONFIG_ARCH_KS8695 is not set
++# CONFIG_ARCH_NS9XXX is not set
++# CONFIG_ARCH_W90X900 is not set
++# CONFIG_ARCH_NUC93X is not set
++# CONFIG_ARCH_TEGRA is not set
++# CONFIG_ARCH_PNX4008 is not set
++# CONFIG_ARCH_PXA is not set
++# CONFIG_ARCH_MSM is not set
++# CONFIG_ARCH_SHMOBILE is not set
++# CONFIG_ARCH_RPC is not set
++# CONFIG_ARCH_SA1100 is not set
++# CONFIG_ARCH_S3C2410 is not set
++# CONFIG_ARCH_S3C64XX is not set
++# CONFIG_ARCH_S5P64X0 is not set
++# CONFIG_ARCH_S5P6442 is not set
++# CONFIG_ARCH_S5PC100 is not set
++# CONFIG_ARCH_S5PV210 is not set
++# CONFIG_ARCH_S5PV310 is not set
++# CONFIG_ARCH_SHARK is not set
++# CONFIG_ARCH_TCC_926 is not set
++# CONFIG_ARCH_LH7A40X is not set
++# CONFIG_ARCH_U300 is not set
++# CONFIG_ARCH_U8500 is not set
++# CONFIG_ARCH_NOMADIK is not set
++# CONFIG_ARCH_DAVINCI is not set
+ CONFIG_ARCH_OMAP=y
++# CONFIG_PLAT_SPEAR is not set
+ 
+ #
+ # TI OMAP Common Features
+@@ -51,6 +261,11 @@ CONFIG_OMAP_RESET_CLOCKS=y
+ CONFIG_OMAP_MUX=y
+ CONFIG_OMAP_MUX_DEBUG=y
+ CONFIG_OMAP_MUX_WARNINGS=y
++CONFIG_OMAP_MCBSP=y
++# CONFIG_OMAP_MBOX_FWK is not set
++CONFIG_OMAP_IOMMU=y
++# CONFIG_OMAP_IOMMU_DEBUG is not set
++# CONFIG_OMAP_MPU_TIMER is not set
+ CONFIG_OMAP_32K_TIMER=y
+ # CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
+ CONFIG_OMAP_32K_TIMER_HZ=128
+@@ -68,7 +283,6 @@ CONFIG_ARCH_OMAP3=y
+ # CONFIG_ARCH_TI81XX is not set
+ CONFIG_ARCH_OMAP3430=y
+ CONFIG_OMAP_PACKAGE_CBB=y
+-# CONFIG_OMAP_PACKAGE_CUS is not set
+ 
+ #
+ # OMAP Board Type
+@@ -96,17 +310,47 @@ CONFIG_MACH_OMAP3EVM=y
+ # CONFIG_MACH_SBC3530 is not set
+ # CONFIG_MACH_OMAP_3630SDP is not set
+ # CONFIG_OMAP3_EMU is not set
+-# CONFIG_OMAP3_SDRC_AC_TIMING is not set
+ CONFIG_OMAP3_PM_DISABLE_VT_SWITCH=y
++# CONFIG_OMAP3_SDRC_AC_TIMING is not set
++
++#
++# Processor Type
++#
++CONFIG_CPU_32v6K=y
++CONFIG_CPU_V7=y
++CONFIG_CPU_32v7=y
++CONFIG_CPU_ABRT_EV7=y
++CONFIG_CPU_PABRT_V7=y
++CONFIG_CPU_CACHE_V7=y
++CONFIG_CPU_CACHE_VIPT=y
++CONFIG_CPU_COPY_V6=y
++CONFIG_CPU_TLB_V7=y
++CONFIG_CPU_HAS_ASID=y
++CONFIG_CPU_CP15=y
++CONFIG_CPU_CP15_MMU=y
+ 
+ #
+ # Processor Features
+ #
+ CONFIG_ARM_THUMB=y
+ CONFIG_ARM_THUMBEE=y
++# CONFIG_CPU_ICACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_DISABLE is not set
++# CONFIG_CPU_BPREDICT_DISABLE is not set
++CONFIG_ARM_L1_CACHE_SHIFT=6
++CONFIG_ARM_DMA_MEM_BUFFERABLE=y
+ CONFIG_ARM_ERRATA_430973=y
+ CONFIG_ARM_ERRATA_458693=y
+ CONFIG_ARM_ERRATA_460075=y
++# CONFIG_ARM_ERRATA_743622 is not set
++CONFIG_COMMON_CLKDEV=y
++
++#
++# Bus support
++#
++# CONFIG_PCI_SYSCALL is not set
++# CONFIG_ARCH_SUPPORTS_MSI is not set
++# CONFIG_PCCARD is not set
+ 
+ #
+ # Kernel Features
+@@ -114,11 +358,42 @@ CONFIG_ARM_ERRATA_460075=y
+ CONFIG_TICK_ONESHOT=y
+ CONFIG_NO_HZ=y
+ CONFIG_HIGH_RES_TIMERS=y
++CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
++CONFIG_VMSPLIT_3G=y
++# CONFIG_VMSPLIT_2G is not set
++# CONFIG_VMSPLIT_1G is not set
++CONFIG_PAGE_OFFSET=0xC0000000
+ CONFIG_PREEMPT_NONE=y
++# CONFIG_PREEMPT_VOLUNTARY is not set
++# CONFIG_PREEMPT is not set
+ CONFIG_HZ=128
++# CONFIG_THUMB2_KERNEL is not set
+ CONFIG_AEABI=y
++CONFIG_OABI_COMPAT=y
+ CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
++# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
++# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
++# CONFIG_HIGHMEM is not set
++CONFIG_SELECT_MEMORY_MODEL=y
++CONFIG_FLATMEM_MANUAL=y
++CONFIG_FLATMEM=y
++CONFIG_FLAT_NODE_MEM_MAP=y
++CONFIG_HAVE_MEMBLOCK=y
++CONFIG_PAGEFLAGS_EXTENDED=y
++CONFIG_SPLIT_PTLOCK_CPUS=999999
++# CONFIG_PHYS_ADDR_T_64BIT is not set
++CONFIG_ZONE_DMA_FLAG=0
++CONFIG_VIRT_TO_BUS=y
++# CONFIG_KSM is not set
++CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
++CONFIG_NEED_PER_CPU_KM=y
++CONFIG_FORCE_MAX_ZONEORDER=11
+ # CONFIG_LEDS is not set
++CONFIG_ALIGNMENT_TRAP=y
++# CONFIG_UACCESS_WITH_MEMCPY is not set
++# CONFIG_SECCOMP is not set
++# CONFIG_CC_STACKPROTECTOR is not set
++# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+ 
+ #
+ # Boot options
+@@ -126,19 +401,32 @@ CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
+ CONFIG_ZBOOT_ROM_TEXT=0x0
+ CONFIG_ZBOOT_ROM_BSS=0x0
+ CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
++# CONFIG_CMDLINE_FORCE is not set
++# CONFIG_XIP_KERNEL is not set
+ CONFIG_KEXEC=y
+ CONFIG_ATAGS_PROC=y
++# CONFIG_AUTO_ZRELADDR is not set
+ 
+ #
+ # CPU Power Management
+ #
+ CONFIG_CPU_FREQ=y
+ CONFIG_CPU_FREQ_TABLE=y
++# CONFIG_CPU_FREQ_DEBUG is not set
+ CONFIG_CPU_FREQ_STAT=y
+ CONFIG_CPU_FREQ_STAT_DETAILS=y
++# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
++# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+ CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
++# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
++# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
++# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
++# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+ CONFIG_CPU_FREQ_GOV_USERSPACE=y
+ CONFIG_CPU_FREQ_GOV_ONDEMAND=y
++# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
++# CONFIG_CPU_IDLE is not set
++
+ #
+ # Floating point emulation
+ #
+@@ -147,6 +435,8 @@ CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+ # At least one emulation must be selected
+ #
+ CONFIG_FPE_NWFPE=y
++# CONFIG_FPE_NWFPE_XP is not set
++# CONFIG_FPE_FASTFPE is not set
+ CONFIG_VFP=y
+ CONFIG_VFPv3=y
+ CONFIG_NEON=y
+@@ -155,7 +445,9 @@ CONFIG_NEON=y
+ # Userspace binary formats
+ #
+ CONFIG_BINFMT_ELF=y
++CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
+ CONFIG_HAVE_AOUT=y
++# CONFIG_BINFMT_AOUT is not set
+ CONFIG_BINFMT_MISC=y
+ 
+ #
+@@ -163,9 +455,20 @@ CONFIG_BINFMT_MISC=y
+ #
+ CONFIG_PM=y
+ CONFIG_PM_DEBUG=y
++# CONFIG_PM_ADVANCED_DEBUG is not set
++# CONFIG_PM_VERBOSE is not set
++CONFIG_CAN_PM_TRACE=y
+ CONFIG_PM_SLEEP=y
++CONFIG_SUSPEND_NVS=y
+ CONFIG_SUSPEND=y
++# CONFIG_PM_TEST_SUSPEND is not set
++CONFIG_SUSPEND_FREEZER=y
++# CONFIG_APM_EMULATION is not set
+ CONFIG_PM_RUNTIME=y
++CONFIG_PM_OPS=y
++CONFIG_ARCH_HAS_OPP=y
++CONFIG_PM_OPP=y
++CONFIG_ARCH_SUSPEND_POSSIBLE=y
+ CONFIG_NET=y
+ 
+ #
+@@ -175,129 +478,516 @@ CONFIG_PACKET=y
+ CONFIG_UNIX=y
+ CONFIG_XFRM=y
+ CONFIG_XFRM_USER=y
++# CONFIG_XFRM_SUB_POLICY is not set
++CONFIG_XFRM_MIGRATE=y
++# CONFIG_XFRM_STATISTICS is not set
+ CONFIG_NET_KEY=y
+ CONFIG_NET_KEY_MIGRATE=y
+ CONFIG_INET=y
+ CONFIG_IP_MULTICAST=y
++# CONFIG_IP_ADVANCED_ROUTER is not set
++CONFIG_IP_FIB_HASH=y
+ CONFIG_IP_PNP=y
+ CONFIG_IP_PNP_DHCP=y
+ CONFIG_IP_PNP_BOOTP=y
+ CONFIG_IP_PNP_RARP=y
++# CONFIG_NET_IPIP is not set
++# CONFIG_NET_IPGRE_DEMUX is not set
++# CONFIG_IP_MROUTE is not set
++# CONFIG_ARPD is not set
++# CONFIG_SYN_COOKIES is not set
++# CONFIG_INET_AH is not set
++# CONFIG_INET_ESP is not set
++# CONFIG_INET_IPCOMP is not set
++# CONFIG_INET_XFRM_TUNNEL is not set
++# CONFIG_INET_TUNNEL is not set
++CONFIG_INET_XFRM_MODE_TRANSPORT=y
++CONFIG_INET_XFRM_MODE_TUNNEL=y
++CONFIG_INET_XFRM_MODE_BEET=y
+ # CONFIG_INET_LRO is not set
++CONFIG_INET_DIAG=y
++CONFIG_INET_TCP_DIAG=y
++# CONFIG_TCP_CONG_ADVANCED is not set
+ CONFIG_TCP_CONG_CUBIC=y
+ CONFIG_DEFAULT_TCP_CONG="cubic"
++# CONFIG_TCP_MD5SIG is not set
+ # CONFIG_IPV6 is not set
++# CONFIG_NETLABEL is not set
++# CONFIG_NETWORK_SECMARK is not set
++# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
++# CONFIG_NETFILTER is not set
++# CONFIG_IP_DCCP is not set
++# CONFIG_IP_SCTP is not set
++# CONFIG_RDS is not set
++# CONFIG_TIPC is not set
++# CONFIG_ATM is not set
++# CONFIG_L2TP is not set
++# CONFIG_BRIDGE is not set
++# CONFIG_NET_DSA is not set
++# CONFIG_VLAN_8021Q is not set
++# CONFIG_DECNET is not set
++# CONFIG_LLC2 is not set
++# CONFIG_IPX is not set
++# CONFIG_ATALK is not set
++# CONFIG_X25 is not set
++# CONFIG_LAPB is not set
++# CONFIG_ECONET is not set
++# CONFIG_WAN_ROUTER is not set
++# CONFIG_PHONET is not set
++# CONFIG_IEEE802154 is not set
++# CONFIG_NET_SCHED is not set
++# CONFIG_DCB is not set
++CONFIG_DNS_RESOLVER=y
+ 
+ #
+ # Network testing
+ #
++# CONFIG_NET_PKTGEN is not set
++# CONFIG_NET_TCPPROBE is not set
++# CONFIG_NET_DROP_MONITOR is not set
++# CONFIG_HAMRADIO is not set
++# CONFIG_CAN is not set
++# CONFIG_IRDA is not set
++# CONFIG_BT is not set
++# CONFIG_AF_RXRPC is not set
+ CONFIG_WIRELESS=y
++CONFIG_WIRELESS_EXT=y
++CONFIG_WEXT_CORE=y
++CONFIG_WEXT_PROC=y
++# CONFIG_CFG80211 is not set
++CONFIG_WIRELESS_EXT_SYSFS=y
++# CONFIG_LIB80211 is not set
++
++#
++# CFG80211 needs to be enabled for MAC80211
++#
++
++#
++# Some wireless drivers require a rate control algorithm
++#
++# CONFIG_WIMAX is not set
++# CONFIG_RFKILL is not set
++# CONFIG_NET_9P is not set
++# CONFIG_CAIF is not set
++# CONFIG_CEPH_LIB is not set
++
++#
++# Device Drivers
++#
+ 
+ #
+ # Generic Driver Options
+ #
+ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++# CONFIG_DEVTMPFS is not set
++CONFIG_STANDALONE=y
+ CONFIG_PREVENT_FIRMWARE_BUILD=y
++CONFIG_FW_LOADER=y
++CONFIG_FIRMWARE_IN_KERNEL=y
++CONFIG_EXTRA_FIRMWARE=""
++# CONFIG_DEBUG_DRIVER is not set
++# CONFIG_DEBUG_DEVRES is not set
++# CONFIG_SYS_HYPERVISOR is not set
++# CONFIG_CONNECTOR is not set
+ CONFIG_MTD=y
++# CONFIG_MTD_DEBUG is not set
++# CONFIG_MTD_TESTS is not set
+ CONFIG_MTD_CONCAT=y
++CONFIG_MTD_PARTITIONS=y
++# CONFIG_MTD_REDBOOT_PARTS is not set
+ CONFIG_MTD_CMDLINE_PARTS=y
++# CONFIG_MTD_AFS_PARTS is not set
++# CONFIG_MTD_AR7_PARTS is not set
++
+ #
+ # User Modules And Translation Layers
+ #
+ CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLKDEVS=y
+ CONFIG_MTD_BLOCK=y
++# CONFIG_FTL is not set
++# CONFIG_NFTL is not set
++# CONFIG_INFTL is not set
++# CONFIG_RFD_FTL is not set
++# CONFIG_SSFDC is not set
++# CONFIG_SM_FTL is not set
+ CONFIG_MTD_OOPS=y
++
+ #
+ # RAM/ROM/Flash chip drivers
+ #
+ CONFIG_MTD_CFI=y
++# CONFIG_MTD_JEDECPROBE is not set
++CONFIG_MTD_GEN_PROBE=y
++# CONFIG_MTD_CFI_ADV_OPTIONS is not set
++CONFIG_MTD_MAP_BANK_WIDTH_1=y
++CONFIG_MTD_MAP_BANK_WIDTH_2=y
++CONFIG_MTD_MAP_BANK_WIDTH_4=y
++# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
++CONFIG_MTD_CFI_I1=y
++CONFIG_MTD_CFI_I2=y
++# CONFIG_MTD_CFI_I4 is not set
++# CONFIG_MTD_CFI_I8 is not set
+ CONFIG_MTD_CFI_INTELEXT=y
++# CONFIG_MTD_CFI_AMDSTD is not set
++# CONFIG_MTD_CFI_STAA is not set
++CONFIG_MTD_CFI_UTIL=y
++# CONFIG_MTD_RAM is not set
++# CONFIG_MTD_ROM is not set
++# CONFIG_MTD_ABSENT is not set
++
++#
++# Mapping drivers for chip access
++#
++# CONFIG_MTD_COMPLEX_MAPPINGS is not set
++# CONFIG_MTD_PHYSMAP is not set
++# CONFIG_MTD_ARM_INTEGRATOR is not set
++# CONFIG_MTD_PLATRAM is not set
++
++#
++# Self-contained MTD device drivers
++#
++# CONFIG_MTD_DATAFLASH is not set
++# CONFIG_MTD_M25P80 is not set
++# CONFIG_MTD_SST25L is not set
++# CONFIG_MTD_SLRAM is not set
++# CONFIG_MTD_PHRAM is not set
++# CONFIG_MTD_MTDRAM is not set
++# CONFIG_MTD_BLOCK2MTD is not set
+ 
+ #
+ # Disk-On-Chip Device Drivers
+ #
++# CONFIG_MTD_DOC2000 is not set
++# CONFIG_MTD_DOC2001 is not set
++# CONFIG_MTD_DOC2001PLUS is not set
++CONFIG_MTD_NAND_ECC=y
++# CONFIG_MTD_NAND_ECC_SMC is not set
+ CONFIG_MTD_NAND=y
++# CONFIG_MTD_NAND_VERIFY_WRITE is not set
++# CONFIG_MTD_SM_COMMON is not set
++# CONFIG_MTD_NAND_MUSEUM_IDS is not set
++# CONFIG_MTD_NAND_GPIO is not set
+ CONFIG_MTD_NAND_OMAP2=y
++CONFIG_MTD_NAND_IDS=y
++# CONFIG_MTD_NAND_DISKONCHIP is not set
++# CONFIG_MTD_NAND_NANDSIM is not set
++# CONFIG_MTD_NAND_PLATFORM is not set
++# CONFIG_MTD_ALAUDA is not set
+ CONFIG_MTD_ONENAND=y
+ CONFIG_MTD_ONENAND_VERIFY_WRITE=y
++# CONFIG_MTD_ONENAND_GENERIC is not set
+ CONFIG_MTD_ONENAND_OMAP2=y
++# CONFIG_MTD_ONENAND_OTP is not set
++# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
++# CONFIG_MTD_ONENAND_SIM is not set
+ 
+ #
+-# UBI - Unsorted block images
++# LPDDR flash memory drivers
+ #
++# CONFIG_MTD_LPDDR is not set
++# CONFIG_MTD_UBI is not set
++# CONFIG_PARPORT is not set
+ CONFIG_BLK_DEV=y
++# CONFIG_BLK_DEV_COW_COMMON is not set
+ CONFIG_BLK_DEV_LOOP=y
+-CONFIG_BLK_DEV_RAM=y
+-CONFIG_BLK_DEV_RAM_SIZE=32768
++# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+ 
+ #
+-# EEPROM support
++# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+ #
+-CONFIG_EEPROM_LEGACY=y
++# CONFIG_BLK_DEV_NBD is not set
++# CONFIG_BLK_DEV_UB is not set
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_COUNT=16
++CONFIG_BLK_DEV_RAM_SIZE=32768
++# CONFIG_BLK_DEV_XIP is not set
++# CONFIG_CDROM_PKTCDVD is not set
++# CONFIG_ATA_OVER_ETH is not set
++# CONFIG_MG_DISK is not set
++# CONFIG_BLK_DEV_RBD is not set
++# CONFIG_MISC_DEVICES is not set
++CONFIG_HAVE_IDE=y
++# CONFIG_IDE is not set
+ 
+ #
+ # SCSI device support
+ #
++CONFIG_SCSI_MOD=y
++# CONFIG_RAID_ATTRS is not set
+ CONFIG_SCSI=y
+ CONFIG_SCSI_DMA=y
++# CONFIG_SCSI_TGT is not set
++# CONFIG_SCSI_NETLINK is not set
++CONFIG_SCSI_PROC_FS=y
+ 
+ #
+ # SCSI support type (disk, tape, CD-ROM)
+ #
+ CONFIG_BLK_DEV_SD=y
++# CONFIG_CHR_DEV_ST is not set
++# CONFIG_CHR_DEV_OSST is not set
++# CONFIG_BLK_DEV_SR is not set
++# CONFIG_CHR_DEV_SG is not set
++# CONFIG_CHR_DEV_SCH is not set
+ CONFIG_SCSI_MULTI_LUN=y
++# CONFIG_SCSI_CONSTANTS is not set
++# CONFIG_SCSI_LOGGING is not set
+ CONFIG_SCSI_SCAN_ASYNC=y
++CONFIG_SCSI_WAIT_SCAN=m
+ 
+ #
+ # SCSI Transports
+ #
++# CONFIG_SCSI_SPI_ATTRS is not set
++# CONFIG_SCSI_FC_ATTRS is not set
++# CONFIG_SCSI_ISCSI_ATTRS is not set
++# CONFIG_SCSI_SAS_ATTRS is not set
++# CONFIG_SCSI_SAS_LIBSAS is not set
++# CONFIG_SCSI_SRP_ATTRS is not set
++CONFIG_SCSI_LOWLEVEL=y
++# CONFIG_ISCSI_TCP is not set
++# CONFIG_ISCSI_BOOT_SYSFS is not set
++# CONFIG_LIBFC is not set
++# CONFIG_LIBFCOE is not set
++# CONFIG_SCSI_DEBUG is not set
++# CONFIG_SCSI_DH is not set
++# CONFIG_SCSI_OSD_INITIATOR is not set
++# CONFIG_ATA is not set
+ CONFIG_MD=y
++# CONFIG_BLK_DEV_MD is not set
++# CONFIG_BLK_DEV_DM is not set
+ CONFIG_NETDEVICES=y
++# CONFIG_DUMMY is not set
++# CONFIG_BONDING is not set
++# CONFIG_MACVLAN is not set
++# CONFIG_EQUALIZER is not set
++# CONFIG_TUN is not set
++# CONFIG_VETH is not set
++CONFIG_MII=y
++CONFIG_PHYLIB=y
+ 
+ #
+ # MII PHY device drivers
+ #
++# CONFIG_MARVELL_PHY is not set
++# CONFIG_DAVICOM_PHY is not set
++# CONFIG_QSEMI_PHY is not set
++# CONFIG_LXT_PHY is not set
++# CONFIG_CICADA_PHY is not set
++# CONFIG_VITESSE_PHY is not set
+ CONFIG_SMSC_PHY=y
++# CONFIG_BROADCOM_PHY is not set
++# CONFIG_BCM63XX_PHY is not set
++# CONFIG_ICPLUS_PHY is not set
++# CONFIG_REALTEK_PHY is not set
++# CONFIG_NATIONAL_PHY is not set
++# CONFIG_STE10XP is not set
++# CONFIG_LSI_ET1011C_PHY is not set
++# CONFIG_MICREL_PHY is not set
++# CONFIG_FIXED_PHY is not set
++# CONFIG_MDIO_BITBANG is not set
+ CONFIG_NET_ETHERNET=y
+-CONFIG_MII=y
++# CONFIG_AX88796 is not set
++# CONFIG_SMC91X is not set
++# CONFIG_DM9000 is not set
++# CONFIG_ENC28J60 is not set
++# CONFIG_ETHOC is not set
++# CONFIG_SMC911X is not set
+ CONFIG_SMSC911X=y
++# CONFIG_SMSC911X_ARCH_HOOKS is not set
++# CONFIG_DNET is not set
++# CONFIG_IBM_NEW_EMAC_ZMII is not set
++# CONFIG_IBM_NEW_EMAC_RGMII is not set
++# CONFIG_IBM_NEW_EMAC_TAH is not set
++# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
++# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
++# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
++# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
++# CONFIG_B44 is not set
++# CONFIG_KS8851 is not set
++# CONFIG_KS8851_MLL is not set
++CONFIG_NETDEV_1000=y
++# CONFIG_TI_DAVINCI_EMAC is not set
++# CONFIG_TI_DAVINCI_MDIO is not set
++# CONFIG_STMMAC_ETH is not set
++CONFIG_NETDEV_10000=y
++CONFIG_WLAN=y
++# CONFIG_USB_ZD1201 is not set
++# CONFIG_HOSTAP is not set
++CONFIG_WL12XX_PLATFORM_DATA=y
++
++#
++# Enable WiMAX (Networking options) to see the WiMAX drivers
++#
+ 
+ #
+ # USB Network Adapters
+ #
++# CONFIG_USB_CATC is not set
++# CONFIG_USB_KAWETH is not set
++# CONFIG_USB_PEGASUS is not set
++# CONFIG_USB_RTL8150 is not set
+ CONFIG_USB_USBNET=y
++CONFIG_USB_NET_AX8817X=y
++CONFIG_USB_NET_CDCETHER=y
++# CONFIG_USB_NET_CDC_EEM is not set
++# CONFIG_USB_NET_DM9601 is not set
++# CONFIG_USB_NET_SMSC75XX is not set
++# CONFIG_USB_NET_SMSC95XX is not set
++# CONFIG_USB_NET_GL620A is not set
++CONFIG_USB_NET_NET1080=y
++# CONFIG_USB_NET_PLUSB is not set
++# CONFIG_USB_NET_MCS7830 is not set
++# CONFIG_USB_NET_RNDIS_HOST is not set
++CONFIG_USB_NET_CDC_SUBSET=y
+ CONFIG_USB_ALI_M5632=y
+ CONFIG_USB_AN2720=y
++CONFIG_USB_BELKIN=y
++CONFIG_USB_ARMLINUX=y
+ CONFIG_USB_EPSON2888=y
+ CONFIG_USB_KC2190=y
++CONFIG_USB_NET_ZAURUS=y
++# CONFIG_USB_NET_CX82310_ETH is not set
++# CONFIG_USB_NET_INT51X1 is not set
++# CONFIG_USB_IPHETH is not set
++# CONFIG_USB_SIERRA_NET is not set
++# CONFIG_WAN is not set
++
++#
++# CAIF transport drivers
++#
++# CONFIG_PPP is not set
++# CONFIG_SLIP is not set
++# CONFIG_NETCONSOLE is not set
++# CONFIG_NETPOLL is not set
++# CONFIG_NET_POLL_CONTROLLER is not set
++# CONFIG_ISDN is not set
++# CONFIG_PHONE is not set
+ 
+ #
+ # Input device support
+ #
+ CONFIG_INPUT=y
++# CONFIG_INPUT_FF_MEMLESS is not set
++# CONFIG_INPUT_POLLDEV is not set
++# CONFIG_INPUT_SPARSEKMAP is not set
+ 
+ #
+ # Userland interfaces
+ #
++CONFIG_INPUT_MOUSEDEV=y
++CONFIG_INPUT_MOUSEDEV_PSAUX=y
++CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
++CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+ CONFIG_INPUT_JOYDEV=y
+ CONFIG_INPUT_EVDEV=y
++# CONFIG_INPUT_EVBUG is not set
+ 
+ #
+ # Input Device Drivers
+ #
+ CONFIG_INPUT_KEYBOARD=y
++# CONFIG_KEYBOARD_ADP5588 is not set
++CONFIG_KEYBOARD_ATKBD=y
++# CONFIG_KEYBOARD_QT2160 is not set
++# CONFIG_KEYBOARD_LKKBD is not set
+ CONFIG_KEYBOARD_GPIO=y
++# CONFIG_KEYBOARD_GPIO_POLLED is not set
++# CONFIG_KEYBOARD_TCA6416 is not set
++# CONFIG_KEYBOARD_MATRIX is not set
++# CONFIG_KEYBOARD_MAX7359 is not set
++# CONFIG_KEYBOARD_MCS is not set
++# CONFIG_KEYBOARD_NEWTON is not set
++# CONFIG_KEYBOARD_OPENCORES is not set
++# CONFIG_KEYBOARD_STOWAWAY is not set
++# CONFIG_KEYBOARD_SUNKBD is not set
+ CONFIG_KEYBOARD_TWL4030=y
++# CONFIG_KEYBOARD_XTKBD is not set
++CONFIG_INPUT_MOUSE=y
++CONFIG_MOUSE_PS2=y
++CONFIG_MOUSE_PS2_ALPS=y
++CONFIG_MOUSE_PS2_LOGIPS2PP=y
++CONFIG_MOUSE_PS2_SYNAPTICS=y
++CONFIG_MOUSE_PS2_TRACKPOINT=y
++# CONFIG_MOUSE_PS2_ELANTECH is not set
++# CONFIG_MOUSE_PS2_SENTELIC is not set
++# CONFIG_MOUSE_PS2_TOUCHKIT is not set
++# CONFIG_MOUSE_SERIAL is not set
++# CONFIG_MOUSE_APPLETOUCH is not set
++# CONFIG_MOUSE_BCM5974 is not set
++# CONFIG_MOUSE_VSXXXAA is not set
++# CONFIG_MOUSE_GPIO is not set
++# CONFIG_MOUSE_SYNAPTICS_I2C is not set
++# CONFIG_INPUT_JOYSTICK is not set
++# CONFIG_INPUT_TABLET is not set
+ CONFIG_INPUT_TOUCHSCREEN=y
+ CONFIG_TOUCHSCREEN_ADS7846=y
++# CONFIG_TOUCHSCREEN_AD7877 is not set
++# CONFIG_TOUCHSCREEN_AD7879 is not set
++# CONFIG_TOUCHSCREEN_BU21013 is not set
++# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
++# CONFIG_TOUCHSCREEN_DYNAPRO is not set
++# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
++# CONFIG_TOUCHSCREEN_EETI is not set
++# CONFIG_TOUCHSCREEN_FUJITSU is not set
++# CONFIG_TOUCHSCREEN_GUNZE is not set
++# CONFIG_TOUCHSCREEN_ELO is not set
++# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
++# CONFIG_TOUCHSCREEN_MCS5000 is not set
++# CONFIG_TOUCHSCREEN_MTOUCH is not set
++# CONFIG_TOUCHSCREEN_INEXIO is not set
++# CONFIG_TOUCHSCREEN_MK712 is not set
++# CONFIG_TOUCHSCREEN_PENMOUNT is not set
++# CONFIG_TOUCHSCREEN_QT602240 is not set
++# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
++# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
++# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
++# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
++# CONFIG_TOUCHSCREEN_TSC2007 is not set
++# CONFIG_TOUCHSCREEN_TSC2004 is not set
++# CONFIG_TOUCHSCREEN_W90X900 is not set
++# CONFIG_TOUCHSCREEN_TPS6507X is not set
+ CONFIG_INPUT_MISC=y
++# CONFIG_INPUT_AD714X is not set
++# CONFIG_INPUT_ATI_REMOTE is not set
++# CONFIG_INPUT_ATI_REMOTE2 is not set
++# CONFIG_INPUT_KEYSPAN_REMOTE is not set
++# CONFIG_INPUT_POWERMATE is not set
++# CONFIG_INPUT_YEALINK is not set
++# CONFIG_INPUT_CM109 is not set
+ CONFIG_INPUT_TWL4030_PWRBUTTON=y
++# CONFIG_INPUT_TWL4030_VIBRA is not set
++# CONFIG_INPUT_UINPUT is not set
++# CONFIG_INPUT_PCF8574 is not set
++# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
++# CONFIG_INPUT_ADXL34X is not set
++
++#
++# Hardware I/O ports
++#
++CONFIG_SERIO=y
++CONFIG_SERIO_SERPORT=y
++CONFIG_SERIO_LIBPS2=y
++# CONFIG_SERIO_RAW is not set
++# CONFIG_SERIO_ALTERA_PS2 is not set
++# CONFIG_SERIO_PS2MULT is not set
++# CONFIG_GAMEPORT is not set
+ 
+ #
+ # Character devices
+ #
++CONFIG_VT=y
++CONFIG_CONSOLE_TRANSLATIONS=y
++CONFIG_VT_CONSOLE=y
++CONFIG_HW_CONSOLE=y
+ CONFIG_VT_HW_CONSOLE_BINDING=y
+ CONFIG_DEVKMEM=y
++# CONFIG_SERIAL_NONSTANDARD is not set
++# CONFIG_N_GSM is not set
++
+ #
+ # Serial drivers
+ #
+@@ -314,47 +1004,295 @@ CONFIG_SERIAL_8250_RSA=y
+ #
+ # Non-8250 serial port support
+ #
++# CONFIG_SERIAL_MAX3100 is not set
++# CONFIG_SERIAL_MAX3107 is not set
+ CONFIG_SERIAL_CORE=y
+ CONFIG_SERIAL_CORE_CONSOLE=y
++CONFIG_SERIAL_OMAP=y
++CONFIG_SERIAL_OMAP_CONSOLE=y
++# CONFIG_SERIAL_TIMBERDALE is not set
++# CONFIG_SERIAL_ALTERA_JTAGUART is not set
++# CONFIG_SERIAL_ALTERA_UART is not set
++CONFIG_UNIX98_PTYS=y
++# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+ # CONFIG_LEGACY_PTYS is not set
++# CONFIG_TTY_PRINTK is not set
++# CONFIG_IPMI_HANDLER is not set
+ CONFIG_HW_RANDOM=y
++# CONFIG_HW_RANDOM_TIMERIOMEM is not set
++# CONFIG_R3964 is not set
++# CONFIG_RAW_DRIVER is not set
++# CONFIG_TCG_TPM is not set
++# CONFIG_TI81XX_HDMI is not set
++# CONFIG_RAMOOPS is not set
+ CONFIG_I2C=y
+ CONFIG_I2C_BOARDINFO=y
+ CONFIG_I2C_COMPAT=y
+ CONFIG_I2C_CHARDEV=y
++# CONFIG_I2C_MUX is not set
++CONFIG_I2C_HELPER_AUTO=y
++
++#
++# I2C Hardware Bus support
++#
++
+ #
+ # I2C system bus drivers (mostly embedded / system-on-chip)
+ #
++# CONFIG_I2C_DESIGNWARE is not set
++# CONFIG_I2C_GPIO is not set
++# CONFIG_I2C_OCORES is not set
+ CONFIG_I2C_OMAP=y
++# CONFIG_I2C_PCA_PLATFORM is not set
++# CONFIG_I2C_SIMTEC is not set
++# CONFIG_I2C_XILINX is not set
++
++#
++# External I2C/SMBus adapter drivers
++#
++# CONFIG_I2C_PARPORT_LIGHT is not set
++# CONFIG_I2C_TAOS_EVM is not set
++# CONFIG_I2C_TINY_USB is not set
++
++#
++# Other I2C/SMBus bus drivers
++#
++# CONFIG_I2C_STUB is not set
++# CONFIG_I2C_DEBUG_CORE is not set
++# CONFIG_I2C_DEBUG_ALGO is not set
++# CONFIG_I2C_DEBUG_BUS is not set
+ CONFIG_SPI=y
++# CONFIG_SPI_DEBUG is not set
++CONFIG_SPI_MASTER=y
++
+ #
+ # SPI Master Controller Drivers
+ #
++# CONFIG_SPI_BITBANG is not set
++# CONFIG_SPI_GPIO is not set
+ CONFIG_SPI_OMAP24XX=y
++# CONFIG_SPI_XILINX is not set
++# CONFIG_SPI_DESIGNWARE is not set
++
++#
++# SPI Protocol Masters
++#
++# CONFIG_SPI_SPIDEV is not set
++# CONFIG_SPI_TLE62X0 is not set
+ 
+ #
+ # PPS support
+ #
++# CONFIG_PPS is not set
++CONFIG_ARCH_REQUIRE_GPIOLIB=y
++CONFIG_GPIOLIB=y
+ CONFIG_DEBUG_GPIO=y
+ CONFIG_GPIO_SYSFS=y
++
++#
++# Memory mapped GPIO expanders:
++#
++# CONFIG_GPIO_BASIC_MMIO is not set
++# CONFIG_GPIO_IT8761E is not set
++# CONFIG_GPIO_VX855 is not set
++
+ #
+ # I2C GPIO expanders:
+ #
++# CONFIG_GPIO_MAX7300 is not set
++# CONFIG_GPIO_MAX732X is not set
++# CONFIG_GPIO_PCA953X is not set
++# CONFIG_GPIO_PCF857X is not set
++# CONFIG_GPIO_SX150X is not set
+ CONFIG_GPIO_TWL4030=y
++# CONFIG_GPIO_ADP5588 is not set
++
++#
++# PCI GPIO expanders:
++#
++
++#
++# SPI GPIO expanders:
++#
++# CONFIG_GPIO_MAX7301 is not set
++# CONFIG_GPIO_MCP23S08 is not set
++# CONFIG_GPIO_MC33880 is not set
++# CONFIG_GPIO_74X164 is not set
++
++#
++# AC97 GPIO expanders:
++#
+ 
+ #
+ # MODULbus GPIO expanders:
+ #
+ # CONFIG_W1 is not set
+ CONFIG_POWER_SUPPLY=y
++# CONFIG_POWER_SUPPLY_DEBUG is not set
++# CONFIG_PDA_POWER is not set
++# CONFIG_TEST_POWER is not set
++# CONFIG_BATTERY_DS2782 is not set
++# CONFIG_BATTERY_BQ20Z75 is not set
++# CONFIG_BATTERY_BQ27x00 is not set
++# CONFIG_BATTERY_MAX17040 is not set
++# CONFIG_CHARGER_ISP1704 is not set
++# CONFIG_CHARGER_TWL4030 is not set
++CONFIG_HWMON=y
++# CONFIG_HWMON_VID is not set
++# CONFIG_HWMON_DEBUG_CHIP is not set
++
++#
++# Native drivers
++#
++# CONFIG_SENSORS_AD7414 is not set
++# CONFIG_SENSORS_AD7418 is not set
++# CONFIG_SENSORS_ADCXX is not set
++# CONFIG_SENSORS_ADM1021 is not set
++# CONFIG_SENSORS_ADM1025 is not set
++# CONFIG_SENSORS_ADM1026 is not set
++# CONFIG_SENSORS_ADM1029 is not set
++# CONFIG_SENSORS_ADM1031 is not set
++# CONFIG_SENSORS_ADM9240 is not set
++# CONFIG_SENSORS_ADT7411 is not set
++# CONFIG_SENSORS_ADT7462 is not set
++# CONFIG_SENSORS_ADT7470 is not set
++# CONFIG_SENSORS_ADT7475 is not set
++# CONFIG_SENSORS_ASC7621 is not set
++# CONFIG_SENSORS_ATXP1 is not set
++# CONFIG_SENSORS_DS1621 is not set
++# CONFIG_SENSORS_F71805F is not set
++# CONFIG_SENSORS_F71882FG is not set
++# CONFIG_SENSORS_F75375S is not set
++# CONFIG_SENSORS_G760A is not set
++# CONFIG_SENSORS_GL518SM is not set
++# CONFIG_SENSORS_GL520SM is not set
++# CONFIG_SENSORS_GPIO_FAN is not set
++# CONFIG_SENSORS_IT87 is not set
++# CONFIG_SENSORS_JC42 is not set
++# CONFIG_SENSORS_LM63 is not set
++# CONFIG_SENSORS_LM70 is not set
++# CONFIG_SENSORS_LM73 is not set
++# CONFIG_SENSORS_LM75 is not set
++# CONFIG_SENSORS_LM77 is not set
++# CONFIG_SENSORS_LM78 is not set
++# CONFIG_SENSORS_LM80 is not set
++# CONFIG_SENSORS_LM83 is not set
++# CONFIG_SENSORS_LM85 is not set
++# CONFIG_SENSORS_LM87 is not set
++# CONFIG_SENSORS_LM90 is not set
++# CONFIG_SENSORS_LM92 is not set
++# CONFIG_SENSORS_LM93 is not set
++# CONFIG_SENSORS_LTC4215 is not set
++# CONFIG_SENSORS_LTC4245 is not set
++# CONFIG_SENSORS_LTC4261 is not set
++# CONFIG_SENSORS_LM95241 is not set
++# CONFIG_SENSORS_MAX1111 is not set
++# CONFIG_SENSORS_MAX1619 is not set
++# CONFIG_SENSORS_MAX6650 is not set
++# CONFIG_SENSORS_PC87360 is not set
++# CONFIG_SENSORS_PC87427 is not set
++# CONFIG_SENSORS_PCF8591 is not set
++# CONFIG_SENSORS_SHT15 is not set
++# CONFIG_SENSORS_SMM665 is not set
++# CONFIG_SENSORS_DME1737 is not set
++# CONFIG_SENSORS_EMC1403 is not set
++# CONFIG_SENSORS_EMC2103 is not set
++# CONFIG_SENSORS_SMSC47M1 is not set
++# CONFIG_SENSORS_SMSC47M192 is not set
++# CONFIG_SENSORS_SMSC47B397 is not set
++# CONFIG_SENSORS_ADS7828 is not set
++# CONFIG_SENSORS_ADS7871 is not set
++# CONFIG_SENSORS_AMC6821 is not set
++# CONFIG_SENSORS_THMC50 is not set
++# CONFIG_SENSORS_TMP102 is not set
++# CONFIG_SENSORS_TMP401 is not set
++# CONFIG_SENSORS_TMP421 is not set
++# CONFIG_SENSORS_VT1211 is not set
++# CONFIG_SENSORS_W83781D is not set
++# CONFIG_SENSORS_W83791D is not set
++# CONFIG_SENSORS_W83792D is not set
++# CONFIG_SENSORS_W83793 is not set
++# CONFIG_SENSORS_W83795 is not set
++# CONFIG_SENSORS_W83L785TS is not set
++# CONFIG_SENSORS_W83L786NG is not set
++# CONFIG_SENSORS_W83627HF is not set
++# CONFIG_SENSORS_W83627EHF is not set
++# CONFIG_SENSORS_LIS3_SPI is not set
++# CONFIG_SENSORS_LIS3_I2C is not set
++# CONFIG_THERMAL is not set
+ CONFIG_WATCHDOG=y
+ CONFIG_WATCHDOG_NOWAYOUT=y
++
++#
++# Watchdog Device Drivers
++#
++# CONFIG_SOFT_WATCHDOG is not set
+ CONFIG_OMAP_WATCHDOG=y
++# CONFIG_TWL4030_WATCHDOG is not set
++# CONFIG_MAX63XX_WATCHDOG is not set
++
++#
++# USB-based Watchdog Cards
++#
++# CONFIG_USBPCWATCHDOG is not set
++CONFIG_SSB_POSSIBLE=y
++
++#
++# Sonics Silicon Backplane
++#
++# CONFIG_SSB is not set
++CONFIG_MFD_SUPPORT=y
++CONFIG_MFD_CORE=y
++# CONFIG_MFD_88PM860X is not set
++# CONFIG_MFD_SM501 is not set
++# CONFIG_MFD_ASIC3 is not set
++# CONFIG_HTC_EGPIO is not set
++# CONFIG_HTC_PASIC3 is not set
++# CONFIG_HTC_I2CPLD is not set
++# CONFIG_TPS65010 is not set
++# CONFIG_TPS6507X is not set
+ CONFIG_TWL4030_CORE=y
+ CONFIG_TWL4030_POWER=y
++CONFIG_TWL4030_CODEC=y
++# CONFIG_TWL6030_PWM is not set
++# CONFIG_MFD_STMPE is not set
++# CONFIG_MFD_TC35892 is not set
++# CONFIG_MFD_TMIO is not set
++# CONFIG_MFD_T7L66XB is not set
++# CONFIG_MFD_TC6387XB is not set
++# CONFIG_MFD_TC6393XB is not set
++# CONFIG_PMIC_DA903X is not set
++# CONFIG_PMIC_ADP5520 is not set
++# CONFIG_MFD_MAX8925 is not set
++# CONFIG_MFD_MAX8998 is not set
++# CONFIG_MFD_WM8400 is not set
++# CONFIG_MFD_WM831X_I2C is not set
++# CONFIG_MFD_WM831X_SPI is not set
++# CONFIG_MFD_WM8350_I2C is not set
++# CONFIG_MFD_WM8994 is not set
++# CONFIG_MFD_PCF50633 is not set
++# CONFIG_MFD_MC13XXX is not set
++# CONFIG_ABX500_CORE is not set
++# CONFIG_EZX_PCAP is not set
++# CONFIG_MFD_TPS6586X is not set
+ CONFIG_REGULATOR=y
++# CONFIG_REGULATOR_DEBUG is not set
+ CONFIG_REGULATOR_DUMMY=y
++# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
++# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
++# CONFIG_REGULATOR_BQ24022 is not set
++# CONFIG_REGULATOR_MAX1586 is not set
++# CONFIG_REGULATOR_MAX8649 is not set
++# CONFIG_REGULATOR_MAX8660 is not set
++# CONFIG_REGULATOR_MAX8952 is not set
+ CONFIG_REGULATOR_TWL4030=y
++# CONFIG_REGULATOR_LP3971 is not set
++# CONFIG_REGULATOR_LP3972 is not set
++# CONFIG_REGULATOR_TPS65023 is not set
++# CONFIG_REGULATOR_TPS6507X is not set
++# CONFIG_REGULATOR_ISL6271A is not set
++# CONFIG_REGULATOR_AD5398 is not set
+ CONFIG_MEDIA_SUPPORT=y
+ 
+ #
+@@ -366,6 +1304,7 @@ CONFIG_VIDEO_V4L2_COMMON=y
+ CONFIG_VIDEO_ALLOW_V4L1=y
+ CONFIG_VIDEO_V4L1_COMPAT=y
+ CONFIG_VIDEO_V4L2_SUBDEV_API=y
++# CONFIG_DVB_CORE is not set
+ CONFIG_VIDEO_MEDIA=y
+ 
+ #
+@@ -373,56 +1312,224 @@ CONFIG_VIDEO_MEDIA=y
+ #
+ # CONFIG_IR_CORE is not set
+ # CONFIG_MEDIA_ATTACH is not set
+-# CONFIG_MEDIA_TUNER is not set
++CONFIG_MEDIA_TUNER=y
+ # CONFIG_MEDIA_TUNER_CUSTOMISE is not set
++CONFIG_MEDIA_TUNER_SIMPLE=y
++CONFIG_MEDIA_TUNER_TDA8290=y
++CONFIG_MEDIA_TUNER_TDA827X=y
++CONFIG_MEDIA_TUNER_TDA18271=y
++CONFIG_MEDIA_TUNER_TDA9887=y
++CONFIG_MEDIA_TUNER_TEA5761=y
++CONFIG_MEDIA_TUNER_TEA5767=y
++CONFIG_MEDIA_TUNER_MT20XX=y
++CONFIG_MEDIA_TUNER_XC2028=y
++CONFIG_MEDIA_TUNER_XC5000=y
++CONFIG_MEDIA_TUNER_MC44S803=y
+ CONFIG_VIDEO_V4L2=y
+ CONFIG_VIDEO_V4L1=y
+ CONFIG_VIDEOBUF_GEN=y
+ CONFIG_VIDEOBUF_DMA_CONTIG=y
+-CONFIG_VIDEOBUF_DMA_SG=y
+ CONFIG_VIDEO_CAPTURE_DRIVERS=y
++# CONFIG_VIDEO_ADV_DEBUG is not set
++# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
++# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
++
++#
++# Encoders/decoders and other helper chips
++#
++
++#
++# Audio decoders
++#
++# CONFIG_VIDEO_TVAUDIO is not set
++# CONFIG_VIDEO_TDA7432 is not set
++# CONFIG_VIDEO_TDA9840 is not set
++# CONFIG_VIDEO_TDA9875 is not set
++# CONFIG_VIDEO_TEA6415C is not set
++# CONFIG_VIDEO_TEA6420 is not set
++# CONFIG_VIDEO_MSP3400 is not set
++# CONFIG_VIDEO_CS5345 is not set
++# CONFIG_VIDEO_CS53L32A is not set
++# CONFIG_VIDEO_M52790 is not set
++# CONFIG_VIDEO_TLV320AIC23B is not set
++# CONFIG_VIDEO_WM8775 is not set
++# CONFIG_VIDEO_WM8739 is not set
++# CONFIG_VIDEO_VP27SMPX is not set
++
++#
++# RDS decoders
++#
++# CONFIG_VIDEO_SAA6588 is not set
+ 
+ #
+ # Video decoders
+ #
++# CONFIG_VIDEO_ADV7180 is not set
++# CONFIG_VIDEO_BT819 is not set
++# CONFIG_VIDEO_BT856 is not set
++# CONFIG_VIDEO_BT866 is not set
++# CONFIG_VIDEO_KS0127 is not set
++# CONFIG_VIDEO_OV7670 is not set
++# CONFIG_VIDEO_MT9T001 is not set
++# CONFIG_VIDEO_MT9V011 is not set
++# CONFIG_VIDEO_MT9V032 is not set
++# CONFIG_VIDEO_MT9V113 is not set
+ CONFIG_VIDEO_MT9T111=y
++# CONFIG_VIDEO_TCM825X is not set
++# CONFIG_VIDEO_SAA7110 is not set
++# CONFIG_VIDEO_SAA711X is not set
++# CONFIG_VIDEO_SAA717X is not set
++# CONFIG_VIDEO_SAA7191 is not set
+ CONFIG_VIDEO_TVP514X=y
++# CONFIG_VIDEO_TVP5150 is not set
++# CONFIG_VIDEO_TVP7002 is not set
++# CONFIG_VIDEO_VPX3220 is not set
++
++#
++# Video and audio decoders
++#
++# CONFIG_VIDEO_CX25840 is not set
++
++#
++# MPEG video encoders
++#
++# CONFIG_VIDEO_CX2341X is not set
++
++#
++# Video encoders
++#
++# CONFIG_VIDEO_SAA7127 is not set
++# CONFIG_VIDEO_SAA7185 is not set
++# CONFIG_VIDEO_ADV7170 is not set
++# CONFIG_VIDEO_ADV7175 is not set
++# CONFIG_VIDEO_THS7303 is not set
++# CONFIG_VIDEO_ADV7343 is not set
++# CONFIG_VIDEO_AK881X is not set
+ 
+ #
+ # Video improvement chips
+ #
++# CONFIG_VIDEO_UPD64031A is not set
++# CONFIG_VIDEO_UPD64083 is not set
++# CONFIG_VIDEO_VPSS_SYSTEM is not set
++# CONFIG_VIDEO_VPFE_CAPTURE is not set
+ CONFIG_VIDEO_OMAP2_VOUT=y
++# CONFIG_VIDEO_CPIA2 is not set
++# CONFIG_VIDEO_SR030PC30 is not set
+ CONFIG_VIDEO_OMAP3=y
++# CONFIG_VIDEO_OMAP3_DEBUG is not set
++# CONFIG_SOC_CAMERA is not set
+ CONFIG_V4L_USB_DRIVERS=y
+ CONFIG_USB_VIDEO_CLASS=y
+ CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
++CONFIG_USB_GSPCA=m
++# CONFIG_USB_M5602 is not set
++# CONFIG_USB_STV06XX is not set
++# CONFIG_USB_GL860 is not set
++# CONFIG_USB_GSPCA_BENQ is not set
++# CONFIG_USB_GSPCA_CONEX is not set
++# CONFIG_USB_GSPCA_CPIA1 is not set
++# CONFIG_USB_GSPCA_ETOMS is not set
++# CONFIG_USB_GSPCA_FINEPIX is not set
++# CONFIG_USB_GSPCA_JEILINJ is not set
++# CONFIG_USB_GSPCA_KONICA is not set
++# CONFIG_USB_GSPCA_MARS is not set
++# CONFIG_USB_GSPCA_MR97310A is not set
++# CONFIG_USB_GSPCA_OV519 is not set
++# CONFIG_USB_GSPCA_OV534 is not set
++# CONFIG_USB_GSPCA_OV534_9 is not set
++# CONFIG_USB_GSPCA_PAC207 is not set
++# CONFIG_USB_GSPCA_PAC7302 is not set
++# CONFIG_USB_GSPCA_PAC7311 is not set
++# CONFIG_USB_GSPCA_SN9C2028 is not set
++# CONFIG_USB_GSPCA_SN9C20X is not set
++# CONFIG_USB_GSPCA_SONIXB is not set
++# CONFIG_USB_GSPCA_SONIXJ is not set
++# CONFIG_USB_GSPCA_SPCA500 is not set
++# CONFIG_USB_GSPCA_SPCA501 is not set
++# CONFIG_USB_GSPCA_SPCA505 is not set
++# CONFIG_USB_GSPCA_SPCA506 is not set
++# CONFIG_USB_GSPCA_SPCA508 is not set
++# CONFIG_USB_GSPCA_SPCA561 is not set
++# CONFIG_USB_GSPCA_SPCA1528 is not set
++# CONFIG_USB_GSPCA_SQ905 is not set
++# CONFIG_USB_GSPCA_SQ905C is not set
++# CONFIG_USB_GSPCA_SQ930X is not set
++# CONFIG_USB_GSPCA_STK014 is not set
++# CONFIG_USB_GSPCA_STV0680 is not set
++# CONFIG_USB_GSPCA_SUNPLUS is not set
++# CONFIG_USB_GSPCA_T613 is not set
++# CONFIG_USB_GSPCA_TV8532 is not set
++# CONFIG_USB_GSPCA_VC032X is not set
++# CONFIG_USB_GSPCA_XIRLINK_CIT is not set
++# CONFIG_USB_GSPCA_ZC3XX is not set
++# CONFIG_VIDEO_PVRUSB2 is not set
++# CONFIG_VIDEO_HDPVR is not set
++# CONFIG_VIDEO_USBVISION is not set
++# CONFIG_USB_VICAM is not set
++# CONFIG_USB_IBMCAM is not set
++# CONFIG_USB_KONICAWC is not set
++# CONFIG_USB_ET61X251 is not set
++# CONFIG_USB_SE401 is not set
++# CONFIG_USB_SN9C102 is not set
++# CONFIG_USB_PWC is not set
++# CONFIG_USB_ZR364XX is not set
++# CONFIG_USB_STKWEBCAM is not set
++# CONFIG_USB_S2255 is not set
++# CONFIG_V4L_MEM2MEM_DRIVERS is not set
+ # CONFIG_RADIO_ADAPTERS is not set
+ # CONFIG_DAB is not set
+ 
+ #
+ # Graphics support
+ #
++# CONFIG_DRM is not set
++# CONFIG_VGASTATE is not set
++# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+ CONFIG_FB=y
+ CONFIG_FIRMWARE_EDID=y
++# CONFIG_FB_DDC is not set
++# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+ CONFIG_FB_CFB_FILLRECT=y
+ CONFIG_FB_CFB_COPYAREA=y
+ CONFIG_FB_CFB_IMAGEBLIT=y
++# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
++# CONFIG_FB_SYS_FILLRECT is not set
++# CONFIG_FB_SYS_COPYAREA is not set
++# CONFIG_FB_SYS_IMAGEBLIT is not set
++# CONFIG_FB_FOREIGN_ENDIAN is not set
++# CONFIG_FB_SYS_FOPS is not set
++# CONFIG_FB_SVGALIB is not set
++# CONFIG_FB_MACMODES is not set
++# CONFIG_FB_BACKLIGHT is not set
+ CONFIG_FB_MODE_HELPERS=y
+ CONFIG_FB_TILEBLITTING=y
+ 
+ #
+ # Frame buffer hardware drivers
+ #
++# CONFIG_FB_S1D13XXX is not set
++# CONFIG_FB_TMIO is not set
++# CONFIG_FB_VIRTUAL is not set
++# CONFIG_FB_METRONOME is not set
++# CONFIG_FB_MB862XX is not set
++# CONFIG_FB_BROADSHEET is not set
++# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
+ CONFIG_OMAP2_VRAM=y
+ CONFIG_OMAP2_VRFB=y
+ CONFIG_OMAP2_DSS=y
+ CONFIG_OMAP2_VRAM_SIZE=4
+ CONFIG_OMAP2_DSS_DEBUG_SUPPORT=y
++# CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS is not set
+ CONFIG_OMAP2_DSS_DPI=y
++# CONFIG_OMAP2_DSS_RFBI is not set
+ CONFIG_OMAP2_DSS_VENC=y
+ CONFIG_OMAP2_VENC_OUT_TYPE_SVIDEO=y
++# CONFIG_OMAP2_VENC_OUT_TYPE_COMPOSITE is not set
++# CONFIG_OMAP2_DSS_SDI is not set
+ CONFIG_OMAP2_DSS_DSI=y
+ CONFIG_OMAP2_DSS_USE_DSI_PLL=y
++# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
+ CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=1
+ CONFIG_FB_OMAP2=y
+ CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
+@@ -433,34 +1540,143 @@ CONFIG_FB_OMAP2_NUM_FBS=1
+ #
+ CONFIG_PANEL_GENERIC=y
+ CONFIG_PANEL_SHARP_LS037V7DW01=y
++# CONFIG_PANEL_SHARP_LQ043T1DG01 is not set
++# CONFIG_PANEL_TAAL is not set
++# CONFIG_PANEL_TOPPOLY_TDO35S is not set
++# CONFIG_PANEL_TPO_TD043MTEA1 is not set
+ CONFIG_BACKLIGHT_LCD_SUPPORT=y
+ CONFIG_LCD_CLASS_DEVICE=y
++# CONFIG_LCD_L4F00242T03 is not set
++# CONFIG_LCD_LMS283GF05 is not set
++# CONFIG_LCD_LTV350QV is not set
++# CONFIG_LCD_TDO24M is not set
++# CONFIG_LCD_VGG2432A4 is not set
+ CONFIG_LCD_PLATFORM=y
++# CONFIG_LCD_S6E63M0 is not set
+ CONFIG_BACKLIGHT_CLASS_DEVICE=y
+ CONFIG_BACKLIGHT_GENERIC=m
++# CONFIG_BACKLIGHT_ADP8860 is not set
+ 
+ #
+ # Display device support
+ #
+ CONFIG_DISPLAY_SUPPORT=y
++
++#
++# Display hardware drivers
++#
++
+ #
+ # Console display driver support
+ #
++CONFIG_DUMMY_CONSOLE=y
++# CONFIG_FRAMEBUFFER_CONSOLE is not set
+ CONFIG_LOGO=y
+ CONFIG_LOGO_LINUX_MONO=y
+ CONFIG_LOGO_LINUX_VGA16=y
+ CONFIG_LOGO_LINUX_CLUT224=y
+ CONFIG_SOUND=y
++# CONFIG_SOUND_OSS_CORE is not set
+ CONFIG_SND=y
++CONFIG_SND_TIMER=y
++CONFIG_SND_PCM=y
++CONFIG_SND_HWDEP=y
++CONFIG_SND_RAWMIDI=y
++CONFIG_SND_JACK=y
++# CONFIG_SND_SEQUENCER is not set
++# CONFIG_SND_MIXER_OSS is not set
++# CONFIG_SND_PCM_OSS is not set
++# CONFIG_SND_HRTIMER is not set
++# CONFIG_SND_DYNAMIC_MINORS is not set
++CONFIG_SND_SUPPORT_OLD_API=y
++CONFIG_SND_VERBOSE_PROCFS=y
++# CONFIG_SND_VERBOSE_PRINTK is not set
++# CONFIG_SND_DEBUG is not set
++# CONFIG_SND_RAWMIDI_SEQ is not set
++# CONFIG_SND_OPL3_LIB_SEQ is not set
++# CONFIG_SND_OPL4_LIB_SEQ is not set
++# CONFIG_SND_SBAWE_SEQ is not set
++# CONFIG_SND_EMU10K1_SEQ is not set
++CONFIG_SND_DRIVERS=y
++# CONFIG_SND_DUMMY is not set
++# CONFIG_SND_ALOOP is not set
++# CONFIG_SND_MTPAV is not set
++# CONFIG_SND_SERIAL_U16550 is not set
++# CONFIG_SND_MPU401 is not set
++CONFIG_SND_ARM=y
++CONFIG_SND_SPI=y
+ CONFIG_SND_USB=y
+ CONFIG_SND_USB_AUDIO=y
++# CONFIG_SND_USB_UA101 is not set
++# CONFIG_SND_USB_CAIAQ is not set
+ CONFIG_SND_SOC=y
+ CONFIG_SND_OMAP_SOC=y
++CONFIG_SND_OMAP_SOC_MCBSP=y
+ CONFIG_SND_OMAP_SOC_OMAP3EVM=y
+ CONFIG_SND_SOC_I2C_AND_SPI=y
++# CONFIG_SND_SOC_ALL_CODECS is not set
++CONFIG_SND_SOC_TWL4030=y
++# CONFIG_SOUND_PRIME is not set
+ CONFIG_HID_SUPPORT=y
+ CONFIG_HID=y
++# CONFIG_HIDRAW is not set
+ 
++#
++# USB Input Devices
++#
++CONFIG_USB_HID=y
++# CONFIG_HID_PID is not set
++# CONFIG_USB_HIDDEV is not set
++
++#
++# Special HID drivers
++#
++# CONFIG_HID_3M_PCT is not set
++# CONFIG_HID_A4TECH is not set
++# CONFIG_HID_ACRUX_FF is not set
++# CONFIG_HID_APPLE is not set
++# CONFIG_HID_BELKIN is not set
++# CONFIG_HID_CANDO is not set
++# CONFIG_HID_CHERRY is not set
++# CONFIG_HID_CHICONY is not set
++# CONFIG_HID_PRODIKEYS is not set
++# CONFIG_HID_CYPRESS is not set
++# CONFIG_HID_DRAGONRISE is not set
++# CONFIG_HID_EGALAX is not set
++# CONFIG_HID_EZKEY is not set
++# CONFIG_HID_KYE is not set
++# CONFIG_HID_UCLOGIC is not set
++# CONFIG_HID_WALTOP is not set
++# CONFIG_HID_GYRATION is not set
++# CONFIG_HID_TWINHAN is not set
++# CONFIG_HID_KENSINGTON is not set
++# CONFIG_HID_LOGITECH is not set
++# CONFIG_HID_MICROSOFT is not set
++# CONFIG_HID_MOSART is not set
++# CONFIG_HID_MONTEREY is not set
++# CONFIG_HID_NTRIG is not set
++# CONFIG_HID_ORTEK is not set
++# CONFIG_HID_PANTHERLORD is not set
++# CONFIG_HID_PETALYNX is not set
++# CONFIG_HID_PICOLCD is not set
++# CONFIG_HID_QUANTA is not set
++# CONFIG_HID_ROCCAT is not set
++# CONFIG_HID_ROCCAT_KONE is not set
++# CONFIG_HID_ROCCAT_PYRA is not set
++# CONFIG_HID_SAMSUNG is not set
++# CONFIG_HID_SONY is not set
++# CONFIG_HID_STANTUM is not set
++# CONFIG_HID_SUNPLUS is not set
++# CONFIG_HID_GREENASIA is not set
++# CONFIG_HID_SMARTJOYPLUS is not set
++# CONFIG_HID_TOPSEED is not set
++# CONFIG_HID_THRUSTMASTER is not set
++# CONFIG_HID_ZEROPLUS is not set
++# CONFIG_HID_ZYDACRON is not set
++CONFIG_USB_SUPPORT=y
++CONFIG_USB_ARCH_HAS_HCD=y
++CONFIG_USB_ARCH_HAS_OHCI=y
++CONFIG_USB_ARCH_HAS_EHCI=y
+ CONFIG_USB=y
+ # CONFIG_USB_DEBUG is not set
+ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+@@ -542,20 +1758,93 @@ CONFIG_USB_MUSB_DEBUG=y
+ # also be needed; see USB_STORAGE Help for more info
+ #
+ CONFIG_USB_STORAGE=y
++# CONFIG_USB_STORAGE_DEBUG is not set
++# CONFIG_USB_STORAGE_DATAFAB is not set
++# CONFIG_USB_STORAGE_FREECOM is not set
++# CONFIG_USB_STORAGE_ISD200 is not set
++# CONFIG_USB_STORAGE_USBAT is not set
++# CONFIG_USB_STORAGE_SDDR09 is not set
++# CONFIG_USB_STORAGE_SDDR55 is not set
++# CONFIG_USB_STORAGE_JUMPSHOT is not set
++# CONFIG_USB_STORAGE_ALAUDA is not set
++# CONFIG_USB_STORAGE_ONETOUCH is not set
++# CONFIG_USB_STORAGE_KARMA is not set
++# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
++# CONFIG_USB_UAS is not set
+ # CONFIG_USB_LIBUSUAL is not set
++
++#
++# USB Imaging devices
++#
++# CONFIG_USB_MDC800 is not set
++# CONFIG_USB_MICROTEK is not set
++
++#
++# USB port drivers
++#
++# CONFIG_USB_SERIAL is not set
++
+ #
+ # USB Miscellaneous drivers
+ #
++# CONFIG_USB_EMI62 is not set
++# CONFIG_USB_EMI26 is not set
++# CONFIG_USB_ADUTUX is not set
++# CONFIG_USB_SEVSEG is not set
++# CONFIG_USB_RIO500 is not set
++# CONFIG_USB_LEGOTOWER is not set
++# CONFIG_USB_LCD is not set
++# CONFIG_USB_LED is not set
++# CONFIG_USB_CYPRESS_CY7C63 is not set
++# CONFIG_USB_CYTHERM is not set
++# CONFIG_USB_IDMOUSE is not set
++# CONFIG_USB_FTDI_ELAN is not set
++# CONFIG_USB_APPLEDISPLAY is not set
++# CONFIG_USB_SISUSBVGA is not set
++# CONFIG_USB_LD is not set
++# CONFIG_USB_TRANCEVIBRATOR is not set
++# CONFIG_USB_IOWARRIOR is not set
+ CONFIG_USB_TEST=y
++# CONFIG_USB_ISIGHTFW is not set
++# CONFIG_USB_YUREX is not set
+ CONFIG_USB_GADGET=y
+ # CONFIG_USB_GADGET_DEBUG is not set
+ # CONFIG_USB_GADGET_DEBUG_FILES is not set
+ # CONFIG_USB_GADGET_DEBUG_FS is not set
++CONFIG_USB_GADGET_VBUS_DRAW=2
++CONFIG_USB_GADGET_SELECTED=y
++# CONFIG_USB_GADGET_OMAP is not set
++# CONFIG_USB_GADGET_R8A66597 is not set
++# CONFIG_USB_GADGET_M66592 is not set
++# CONFIG_USB_GADGET_DUMMY_HCD is not set
+ CONFIG_USB_GADGET_DUALSPEED=y
+ # CONFIG_USB_ZERO is not set
+ # CONFIG_USB_AUDIO is not set
+ CONFIG_USB_ETH=y
+ CONFIG_USB_ETH_RNDIS=y
++# CONFIG_USB_ETH_EEM is not set
++# CONFIG_USB_GADGETFS is not set
++# CONFIG_USB_FUNCTIONFS is not set
++# CONFIG_USB_FILE_STORAGE is not set
++# CONFIG_USB_MASS_STORAGE is not set
++# CONFIG_USB_G_SERIAL is not set
++# CONFIG_USB_MIDI_GADGET is not set
++# CONFIG_USB_G_PRINTER is not set
++# CONFIG_USB_CDC_COMPOSITE is not set
++# CONFIG_USB_G_MULTI is not set
++# CONFIG_USB_G_HID is not set
++# CONFIG_USB_G_DBGP is not set
++# CONFIG_USB_G_WEBCAM is not set
++
++#
++# OTG and related infrastructure
++#
++CONFIG_USB_OTG_UTILS=y
++# CONFIG_USB_GPIO_VBUS is not set
++# CONFIG_ISP1301_OMAP is not set
++# CONFIG_USB_ULPI is not set
++# CONFIG_TWL4030_USB is not set
++CONFIG_NOP_USB_XCEIV=y
+ CONFIG_MMC=y
+ # CONFIG_MMC_DEBUG is not set
+ CONFIG_MMC_UNSAFE_RESUME=y
+@@ -563,15 +1852,28 @@ CONFIG_MMC_UNSAFE_RESUME=y
+ #
+ # MMC/SD/SDIO Card Drivers
+ #
++CONFIG_MMC_BLOCK=y
++CONFIG_MMC_BLOCK_MINORS=8
++CONFIG_MMC_BLOCK_BOUNCE=y
+ CONFIG_SDIO_UART=y
++# CONFIG_MMC_TEST is not set
+ 
+ #
+ # MMC/SD/SDIO Host Controller Drivers
+ #
++# CONFIG_MMC_SDHCI is not set
+ CONFIG_MMC_OMAP=y
+ CONFIG_MMC_OMAP_HS=y
++# CONFIG_MMC_SPI is not set
++# CONFIG_MMC_USHC is not set
++# CONFIG_MEMSTICK is not set
++# CONFIG_NEW_LEDS is not set
++# CONFIG_ACCESSIBILITY is not set
+ CONFIG_RTC_LIB=y
+ CONFIG_RTC_CLASS=y
++CONFIG_RTC_HCTOSYS=y
++CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
++# CONFIG_RTC_DEBUG is not set
+ 
+ #
+ # RTC interfaces
+@@ -579,94 +1881,504 @@ CONFIG_RTC_CLASS=y
+ CONFIG_RTC_INTF_SYSFS=y
+ CONFIG_RTC_INTF_PROC=y
+ CONFIG_RTC_INTF_DEV=y
++# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
++# CONFIG_RTC_DRV_TEST is not set
+ 
+ #
+ # I2C RTC drivers
+ #
++# CONFIG_RTC_DRV_DS1307 is not set
++# CONFIG_RTC_DRV_DS1374 is not set
++# CONFIG_RTC_DRV_DS1672 is not set
++# CONFIG_RTC_DRV_DS3232 is not set
++# CONFIG_RTC_DRV_MAX6900 is not set
++# CONFIG_RTC_DRV_RS5C372 is not set
++# CONFIG_RTC_DRV_ISL1208 is not set
++# CONFIG_RTC_DRV_ISL12022 is not set
++# CONFIG_RTC_DRV_X1205 is not set
++# CONFIG_RTC_DRV_PCF8563 is not set
++# CONFIG_RTC_DRV_PCF8583 is not set
++# CONFIG_RTC_DRV_M41T80 is not set
++# CONFIG_RTC_DRV_BQ32K is not set
+ CONFIG_RTC_DRV_TWL4030=y
++# CONFIG_RTC_DRV_S35390A is not set
++# CONFIG_RTC_DRV_FM3130 is not set
++# CONFIG_RTC_DRV_RX8581 is not set
++# CONFIG_RTC_DRV_RX8025 is not set
++
++#
++# SPI RTC drivers
++#
++# CONFIG_RTC_DRV_M41T94 is not set
++# CONFIG_RTC_DRV_DS1305 is not set
++# CONFIG_RTC_DRV_DS1390 is not set
++# CONFIG_RTC_DRV_MAX6902 is not set
++# CONFIG_RTC_DRV_R9701 is not set
++# CONFIG_RTC_DRV_RS5C348 is not set
++# CONFIG_RTC_DRV_DS3234 is not set
++# CONFIG_RTC_DRV_PCF2123 is not set
++
++#
++# Platform RTC drivers
++#
++# CONFIG_RTC_DRV_CMOS is not set
++# CONFIG_RTC_DRV_DS1286 is not set
++# CONFIG_RTC_DRV_DS1511 is not set
++# CONFIG_RTC_DRV_DS1553 is not set
++# CONFIG_RTC_DRV_DS1742 is not set
++# CONFIG_RTC_DRV_STK17TA8 is not set
++# CONFIG_RTC_DRV_M48T86 is not set
++# CONFIG_RTC_DRV_M48T35 is not set
++# CONFIG_RTC_DRV_M48T59 is not set
++# CONFIG_RTC_DRV_MSM6242 is not set
++# CONFIG_RTC_DRV_BQ4802 is not set
++# CONFIG_RTC_DRV_RP5C01 is not set
++# CONFIG_RTC_DRV_V3020 is not set
++
++#
++# on-CPU RTC drivers
++#
++# CONFIG_DMADEVICES is not set
++# CONFIG_AUXDISPLAY is not set
++# CONFIG_UIO is not set
++# CONFIG_STAGING is not set
+ 
+ #
+ # File systems
+ #
+ CONFIG_EXT2_FS=y
++# CONFIG_EXT2_FS_XATTR is not set
++# CONFIG_EXT2_FS_XIP is not set
+ CONFIG_EXT3_FS=y
++CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
+ # CONFIG_EXT3_FS_XATTR is not set
+-CONFIG_INOTIFY=y
++# CONFIG_EXT4_FS is not set
++CONFIG_JBD=y
++# CONFIG_JBD_DEBUG is not set
++# CONFIG_REISERFS_FS is not set
++# CONFIG_JFS_FS is not set
++CONFIG_FS_POSIX_ACL=y
++# CONFIG_XFS_FS is not set
++# CONFIG_GFS2_FS is not set
++# CONFIG_OCFS2_FS is not set
++# CONFIG_BTRFS_FS is not set
++# CONFIG_NILFS2_FS is not set
++CONFIG_FILE_LOCKING=y
++CONFIG_FSNOTIFY=y
++CONFIG_DNOTIFY=y
++CONFIG_INOTIFY_USER=y
++# CONFIG_FANOTIFY is not set
+ CONFIG_QUOTA=y
++# CONFIG_QUOTA_NETLINK_INTERFACE is not set
++CONFIG_PRINT_QUOTA_WARNING=y
++# CONFIG_QUOTA_DEBUG is not set
++CONFIG_QUOTA_TREE=y
++# CONFIG_QFMT_V1 is not set
+ CONFIG_QFMT_V2=y
++CONFIG_QUOTACTL=y
++# CONFIG_AUTOFS4_FS is not set
++# CONFIG_FUSE_FS is not set
++
++#
++# Caches
++#
++# CONFIG_FSCACHE is not set
++
++#
++# CD-ROM/DVD Filesystems
++#
++# CONFIG_ISO9660_FS is not set
++# CONFIG_UDF_FS is not set
+ 
+ #
+ # DOS/FAT/NT Filesystems
+ #
++CONFIG_FAT_FS=y
+ CONFIG_MSDOS_FS=y
+ CONFIG_VFAT_FS=y
++CONFIG_FAT_DEFAULT_CODEPAGE=437
++CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
++# CONFIG_NTFS_FS is not set
++
+ #
+ # Pseudo filesystems
+ #
+ CONFIG_PROC_FS=y
++CONFIG_PROC_SYSCTL=y
++CONFIG_PROC_PAGE_MONITOR=y
+ CONFIG_SYSFS=y
+ CONFIG_TMPFS=y
++# CONFIG_TMPFS_POSIX_ACL is not set
++# CONFIG_HUGETLB_PAGE is not set
++# CONFIG_CONFIGFS_FS is not set
++CONFIG_MISC_FILESYSTEMS=y
++# CONFIG_ADFS_FS is not set
++# CONFIG_AFFS_FS is not set
++# CONFIG_ECRYPT_FS is not set
++# CONFIG_HFS_FS is not set
++# CONFIG_HFSPLUS_FS is not set
++# CONFIG_BEFS_FS is not set
++# CONFIG_BFS_FS is not set
++# CONFIG_EFS_FS is not set
+ CONFIG_JFFS2_FS=y
++CONFIG_JFFS2_FS_DEBUG=0
++CONFIG_JFFS2_FS_WRITEBUFFER=y
++# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+ CONFIG_JFFS2_SUMMARY=y
+ CONFIG_JFFS2_FS_XATTR=y
++CONFIG_JFFS2_FS_POSIX_ACL=y
++CONFIG_JFFS2_FS_SECURITY=y
+ CONFIG_JFFS2_COMPRESSION_OPTIONS=y
++CONFIG_JFFS2_ZLIB=y
+ CONFIG_JFFS2_LZO=y
++CONFIG_JFFS2_RTIME=y
+ CONFIG_JFFS2_RUBIN=y
++# CONFIG_JFFS2_CMODE_NONE is not set
++CONFIG_JFFS2_CMODE_PRIORITY=y
++# CONFIG_JFFS2_CMODE_SIZE is not set
++# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
++# CONFIG_LOGFS is not set
+ CONFIG_CRAMFS=y
++# CONFIG_SQUASHFS is not set
++# CONFIG_VXFS_FS is not set
++# CONFIG_MINIX_FS is not set
++# CONFIG_OMFS_FS is not set
++# CONFIG_HPFS_FS is not set
++# CONFIG_QNX4FS_FS is not set
++# CONFIG_ROMFS_FS is not set
++# CONFIG_SYSV_FS is not set
++# CONFIG_UFS_FS is not set
++CONFIG_NETWORK_FILESYSTEMS=y
+ CONFIG_NFS_FS=y
+ CONFIG_NFS_V3=y
+ CONFIG_NFS_V3_ACL=y
+ CONFIG_NFS_V4=y
++# CONFIG_NFS_V4_1 is not set
+ CONFIG_ROOT_NFS=y
++# CONFIG_NFS_USE_LEGACY_DNS is not set
++CONFIG_NFS_USE_KERNEL_DNS=y
++# CONFIG_NFS_USE_NEW_IDMAPPER is not set
++# CONFIG_NFSD is not set
+ CONFIG_LOCKD=y
+ CONFIG_LOCKD_V4=y
++CONFIG_NFS_ACL_SUPPORT=y
++CONFIG_NFS_COMMON=y
++CONFIG_SUNRPC=y
++CONFIG_SUNRPC_GSS=y
++CONFIG_RPCSEC_GSS_KRB5=y
++# CONFIG_CEPH_FS is not set
++# CONFIG_CIFS is not set
++# CONFIG_NCP_FS is not set
++# CONFIG_CODA_FS is not set
++# CONFIG_AFS_FS is not set
+ 
+ #
+ # Partition Types
+ #
+ CONFIG_PARTITION_ADVANCED=y
++# CONFIG_ACORN_PARTITION is not set
++# CONFIG_OSF_PARTITION is not set
++# CONFIG_AMIGA_PARTITION is not set
++# CONFIG_ATARI_PARTITION is not set
++# CONFIG_MAC_PARTITION is not set
+ CONFIG_MSDOS_PARTITION=y
++# CONFIG_BSD_DISKLABEL is not set
++# CONFIG_MINIX_SUBPARTITION is not set
++# CONFIG_SOLARIS_X86_PARTITION is not set
++# CONFIG_UNIXWARE_DISKLABEL is not set
++# CONFIG_LDM_PARTITION is not set
++# CONFIG_SGI_PARTITION is not set
++# CONFIG_ULTRIX_PARTITION is not set
++# CONFIG_SUN_PARTITION is not set
++# CONFIG_KARMA_PARTITION is not set
++# CONFIG_EFI_PARTITION is not set
++# CONFIG_SYSV68_PARTITION is not set
+ CONFIG_NLS=y
+ CONFIG_NLS_DEFAULT="iso8859-1"
+ CONFIG_NLS_CODEPAGE_437=y
++# CONFIG_NLS_CODEPAGE_737 is not set
++# CONFIG_NLS_CODEPAGE_775 is not set
++# CONFIG_NLS_CODEPAGE_850 is not set
++# CONFIG_NLS_CODEPAGE_852 is not set
++# CONFIG_NLS_CODEPAGE_855 is not set
++# CONFIG_NLS_CODEPAGE_857 is not set
++# CONFIG_NLS_CODEPAGE_860 is not set
++# CONFIG_NLS_CODEPAGE_861 is not set
++# CONFIG_NLS_CODEPAGE_862 is not set
++# CONFIG_NLS_CODEPAGE_863 is not set
++# CONFIG_NLS_CODEPAGE_864 is not set
++# CONFIG_NLS_CODEPAGE_865 is not set
++# CONFIG_NLS_CODEPAGE_866 is not set
++# CONFIG_NLS_CODEPAGE_869 is not set
++# CONFIG_NLS_CODEPAGE_936 is not set
++# CONFIG_NLS_CODEPAGE_950 is not set
++# CONFIG_NLS_CODEPAGE_932 is not set
++# CONFIG_NLS_CODEPAGE_949 is not set
++# CONFIG_NLS_CODEPAGE_874 is not set
++# CONFIG_NLS_ISO8859_8 is not set
++# CONFIG_NLS_CODEPAGE_1250 is not set
++# CONFIG_NLS_CODEPAGE_1251 is not set
++# CONFIG_NLS_ASCII is not set
+ CONFIG_NLS_ISO8859_1=y
++# CONFIG_NLS_ISO8859_2 is not set
++# CONFIG_NLS_ISO8859_3 is not set
++# CONFIG_NLS_ISO8859_4 is not set
++# CONFIG_NLS_ISO8859_5 is not set
++# CONFIG_NLS_ISO8859_6 is not set
++# CONFIG_NLS_ISO8859_7 is not set
++# CONFIG_NLS_ISO8859_9 is not set
++# CONFIG_NLS_ISO8859_13 is not set
++# CONFIG_NLS_ISO8859_14 is not set
++# CONFIG_NLS_ISO8859_15 is not set
++# CONFIG_NLS_KOI8_R is not set
++# CONFIG_NLS_KOI8_U is not set
++# CONFIG_NLS_UTF8 is not set
++# CONFIG_DLM is not set
+ 
+ #
+ # Kernel hacking
+ #
+ CONFIG_PRINTK_TIME=y
++CONFIG_ENABLE_WARN_DEPRECATED=y
++CONFIG_ENABLE_MUST_CHECK=y
++CONFIG_FRAME_WARN=1024
+ CONFIG_MAGIC_SYSRQ=y
++# CONFIG_STRIP_ASM_SYMS is not set
++# CONFIG_UNUSED_SYMBOLS is not set
+ CONFIG_DEBUG_FS=y
++# CONFIG_HEADERS_CHECK is not set
+ CONFIG_DEBUG_KERNEL=y
++# CONFIG_DEBUG_SHIRQ is not set
++# CONFIG_LOCKUP_DETECTOR is not set
++# CONFIG_HARDLOCKUP_DETECTOR is not set
++# CONFIG_DETECT_HUNG_TASK is not set
++CONFIG_SCHED_DEBUG=y
+ CONFIG_SCHEDSTATS=y
+ CONFIG_TIMER_STATS=y
++# CONFIG_DEBUG_OBJECTS is not set
++# CONFIG_DEBUG_SLAB is not set
++# CONFIG_DEBUG_KMEMLEAK is not set
++# CONFIG_DEBUG_RT_MUTEXES is not set
++# CONFIG_RT_MUTEX_TESTER is not set
++CONFIG_DEBUG_SPINLOCK=y
++CONFIG_DEBUG_MUTEXES=y
++CONFIG_BKL=y
++CONFIG_DEBUG_LOCK_ALLOC=y
+ CONFIG_PROVE_LOCKING=y
++# CONFIG_PROVE_RCU is not set
++# CONFIG_SPARSE_RCU_POINTER is not set
++CONFIG_LOCKDEP=y
+ CONFIG_LOCK_STAT=y
++# CONFIG_DEBUG_LOCKDEP is not set
++CONFIG_TRACE_IRQFLAGS=y
+ CONFIG_DEBUG_SPINLOCK_SLEEP=y
++# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+ CONFIG_STACKTRACE=y
++# CONFIG_DEBUG_KOBJECT is not set
++CONFIG_DEBUG_BUGVERBOSE=y
+ CONFIG_DEBUG_INFO=y
+-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
++# CONFIG_DEBUG_INFO_REDUCED is not set
++# CONFIG_DEBUG_VM is not set
++# CONFIG_DEBUG_WRITECOUNT is not set
++# CONFIG_DEBUG_MEMORY_INIT is not set
++# CONFIG_DEBUG_LIST is not set
++# CONFIG_TEST_LIST_SORT is not set
++# CONFIG_DEBUG_SG is not set
++# CONFIG_DEBUG_NOTIFIERS is not set
++# CONFIG_DEBUG_CREDENTIALS is not set
++# CONFIG_BOOT_PRINTK_DELAY is not set
++# CONFIG_RCU_TORTURE_TEST is not set
++# CONFIG_KPROBES_SANITY_TEST is not set
++# CONFIG_BACKTRACE_SELF_TEST is not set
++# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
++# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
++# CONFIG_LKDTM is not set
++# CONFIG_FAULT_INJECTION is not set
++# CONFIG_LATENCYTOP is not set
++# CONFIG_SYSCTL_SYSCALL_CHECK is not set
++# CONFIG_PAGE_POISONING is not set
++CONFIG_NOP_TRACER=y
++CONFIG_HAVE_FUNCTION_TRACER=y
++CONFIG_HAVE_DYNAMIC_FTRACE=y
++CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
++CONFIG_RING_BUFFER=y
++CONFIG_EVENT_TRACING=y
++CONFIG_CONTEXT_SWITCH_TRACER=y
++CONFIG_RING_BUFFER_ALLOW_SWAP=y
++CONFIG_TRACING=y
++CONFIG_TRACING_SUPPORT=y
++CONFIG_FTRACE=y
++# CONFIG_FUNCTION_TRACER is not set
++# CONFIG_IRQSOFF_TRACER is not set
++# CONFIG_SCHED_TRACER is not set
++# CONFIG_ENABLE_DEFAULT_TRACERS is not set
++CONFIG_BRANCH_PROFILE_NONE=y
++# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
++# CONFIG_PROFILE_ALL_BRANCHES is not set
++# CONFIG_STACK_TRACER is not set
++# CONFIG_BLK_DEV_IO_TRACE is not set
++CONFIG_KPROBE_EVENT=y
++# CONFIG_RING_BUFFER_BENCHMARK is not set
++# CONFIG_DYNAMIC_DEBUG is not set
++# CONFIG_ATOMIC64_SELFTEST is not set
++# CONFIG_SAMPLES is not set
++CONFIG_HAVE_ARCH_KGDB=y
++# CONFIG_KGDB is not set
++# CONFIG_STRICT_DEVMEM is not set
+ CONFIG_ARM_UNWIND=y
++# CONFIG_DEBUG_USER is not set
++# CONFIG_DEBUG_ERRORS is not set
++# CONFIG_DEBUG_STACK_USAGE is not set
+ CONFIG_DEBUG_LL=y
+ # CONFIG_EARLY_PRINTK is not set
++# CONFIG_DEBUG_ICEDCC is not set
++# CONFIG_OC_ETM is not set
+ 
+ #
+ # Security options
+ #
++CONFIG_KEYS=y
++# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
++# CONFIG_SECURITY_DMESG_RESTRICT is not set
+ CONFIG_SECURITY=y
++# CONFIG_SECURITYFS is not set
++# CONFIG_SECURITY_NETWORK is not set
++# CONFIG_SECURITY_PATH is not set
++# CONFIG_SECURITY_TOMOYO is not set
++# CONFIG_SECURITY_APPARMOR is not set
++# CONFIG_IMA is not set
++CONFIG_DEFAULT_SECURITY_DAC=y
++CONFIG_DEFAULT_SECURITY=""
++CONFIG_CRYPTO=y
++
++#
++# Crypto core or helper
++#
++CONFIG_CRYPTO_ALGAPI=y
++CONFIG_CRYPTO_ALGAPI2=y
++CONFIG_CRYPTO_AEAD2=y
++CONFIG_CRYPTO_BLKCIPHER=y
++CONFIG_CRYPTO_BLKCIPHER2=y
++CONFIG_CRYPTO_HASH=y
++CONFIG_CRYPTO_HASH2=y
++CONFIG_CRYPTO_RNG2=y
++CONFIG_CRYPTO_PCOMP2=y
++CONFIG_CRYPTO_MANAGER=y
++CONFIG_CRYPTO_MANAGER2=y
++CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
++# CONFIG_CRYPTO_GF128MUL is not set
++# CONFIG_CRYPTO_NULL is not set
++CONFIG_CRYPTO_WORKQUEUE=y
++# CONFIG_CRYPTO_CRYPTD is not set
++# CONFIG_CRYPTO_AUTHENC is not set
++# CONFIG_CRYPTO_TEST is not set
++
++#
++# Authenticated Encryption with Associated Data
++#
++# CONFIG_CRYPTO_CCM is not set
++# CONFIG_CRYPTO_GCM is not set
++# CONFIG_CRYPTO_SEQIV is not set
++
++#
++# Block modes
++#
++CONFIG_CRYPTO_CBC=y
++# CONFIG_CRYPTO_CTR is not set
++# CONFIG_CRYPTO_CTS is not set
++# CONFIG_CRYPTO_ECB is not set
++# CONFIG_CRYPTO_LRW is not set
++# CONFIG_CRYPTO_PCBC is not set
++# CONFIG_CRYPTO_XTS is not set
++
++#
++# Hash modes
++#
++# CONFIG_CRYPTO_HMAC is not set
++# CONFIG_CRYPTO_XCBC is not set
++# CONFIG_CRYPTO_VMAC is not set
+ 
++#
++# Digest
++#
++CONFIG_CRYPTO_CRC32C=y
++# CONFIG_CRYPTO_GHASH is not set
++# CONFIG_CRYPTO_MD4 is not set
++CONFIG_CRYPTO_MD5=y
++# CONFIG_CRYPTO_MICHAEL_MIC is not set
++# CONFIG_CRYPTO_RMD128 is not set
++# CONFIG_CRYPTO_RMD160 is not set
++# CONFIG_CRYPTO_RMD256 is not set
++# CONFIG_CRYPTO_RMD320 is not set
++# CONFIG_CRYPTO_SHA1 is not set
++# CONFIG_CRYPTO_SHA256 is not set
++# CONFIG_CRYPTO_SHA512 is not set
++# CONFIG_CRYPTO_TGR192 is not set
++# CONFIG_CRYPTO_WP512 is not set
++
++#
++# Ciphers
++#
++# CONFIG_CRYPTO_AES is not set
++# CONFIG_CRYPTO_ANUBIS is not set
++# CONFIG_CRYPTO_ARC4 is not set
++# CONFIG_CRYPTO_BLOWFISH is not set
++# CONFIG_CRYPTO_CAMELLIA is not set
++# CONFIG_CRYPTO_CAST5 is not set
++# CONFIG_CRYPTO_CAST6 is not set
++CONFIG_CRYPTO_DES=y
++# CONFIG_CRYPTO_FCRYPT is not set
++# CONFIG_CRYPTO_KHAZAD is not set
++# CONFIG_CRYPTO_SALSA20 is not set
++# CONFIG_CRYPTO_SEED is not set
++# CONFIG_CRYPTO_SERPENT is not set
++# CONFIG_CRYPTO_TEA is not set
++# CONFIG_CRYPTO_TWOFISH is not set
++
++#
++# Compression
++#
++# CONFIG_CRYPTO_DEFLATE is not set
++# CONFIG_CRYPTO_ZLIB is not set
++# CONFIG_CRYPTO_LZO is not set
+ 
+ #
+ # Random Number Generation
+ #
+ # CONFIG_CRYPTO_ANSI_CPRNG is not set
+ CONFIG_CRYPTO_HW=y
++# CONFIG_CRYPTO_DEV_OMAP_SHAM is not set
++# CONFIG_CRYPTO_DEV_OMAP_AES is not set
++
++#
++# OCF Configuration
++#
++CONFIG_OCF_OCF=y
++CONFIG_OCF_RANDOMHARVEST=y
++CONFIG_OCF_FIPS=y
++CONFIG_OCF_CRYPTODEV=m
++# CONFIG_OCF_CRYPTOSOFT is not set
++# CONFIG_OCF_BENCH is not set
++CONFIG_BINARY_PRINTF=y
++
+ #
+ # Library routines
+ #
++CONFIG_BITREVERSE=y
++CONFIG_GENERIC_FIND_LAST_BIT=y
+ CONFIG_CRC_CCITT=y
++# CONFIG_CRC16 is not set
++# CONFIG_CRC_T10DIF is not set
++# CONFIG_CRC_ITU_T is not set
+ CONFIG_CRC32=y
++# CONFIG_CRC7 is not set
+ CONFIG_LIBCRC32C=y
++CONFIG_ZLIB_INFLATE=y
++CONFIG_ZLIB_DEFLATE=y
++CONFIG_LZO_COMPRESS=y
++CONFIG_LZO_DECOMPRESS=y
++CONFIG_DECOMPRESS_GZIP=y
+ CONFIG_HAS_IOMEM=y
+ CONFIG_HAS_IOPORT=y
+ CONFIG_HAS_DMA=y
++CONFIG_NLATTR=y
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-usb-musb-am35x-fix-role-switching-issue.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-usb-musb-am35x-fix-role-switching-issue.patch
new file mode 100644
index 0000000..1ab6bdd
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0002-usb-musb-am35x-fix-role-switching-issue.patch
@@ -0,0 +1,67 @@
+From 96fa47d92d10382f4e0d9b6e3ab2c627e4671716 Mon Sep 17 00:00:00 2001
+From: Bin Liu <b-liu@ti.com>
+Date: Wed, 30 May 2012 18:28:07 -0500
+Subject: [PATCH 2/2] usb: musb: am35x: fix role switching issue
+
+Fixing the role switching issue seen when followed steps below:
+
+a) Configure port in OTG mode
+b) Connect MSC device through micro-A-plug to std-A-receptacle
+c) MSC enumerated and works fine
+d) Disconnect MSC device and let cable be connected to port
+e) Now disconnect cable also
+f) Connect port to host PC using micro-B plug to std-A plug
+e) PC doesn't recognise the gadget driver
+
+Signed-off-by: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Signed-off-by: Bin Liu <b-liu@ti.com>
+---
+ drivers/usb/musb/am35x.c |   25 ++++++++++++++++++++-----
+ 1 files changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/musb/am35x.c b/drivers/usb/musb/am35x.c
+index a59a5e7..d32fb77 100644
+--- a/drivers/usb/musb/am35x.c
++++ b/drivers/usb/musb/am35x.c
+@@ -368,6 +368,13 @@ static void otg_timer(unsigned long _musb)
+ 		devctl = musb_readb(mregs, MUSB_DEVCTL);
+ 		if (devctl & MUSB_DEVCTL_BDEVICE)
+ 			mod_timer(&otg_workaround, jiffies + POLL_SECONDS * HZ);
++		else if ((devctl & MUSB_DEVCTL_SESSION) &&
++				!(devctl & MUSB_DEVCTL_BDEVICE)) {
++			mod_timer(&otg_workaround,
++					jiffies + POLL_SECONDS * HZ);
++			musb_writeb(musb->mregs, MUSB_DEVCTL, devctl &
++					~MUSB_DEVCTL_SESSION);
++		}
+ 		else
+ 			musb->xceiv->state = OTG_STATE_A_IDLE;
+ 		break;
+@@ -502,11 +509,19 @@ static irqreturn_t am35x_musb_interrupt(int irq, void *hci)
+ 			mod_timer(&otg_workaround, jiffies + POLL_SECONDS * HZ);
+ 			WARNING("VBUS error workaround (delay coming)\n");
+ 		} else if (is_host_enabled(musb) && drvvbus) {
+-			MUSB_HST_MODE(musb);
+-			musb->xceiv->default_a = 1;
+-			musb->xceiv->state = OTG_STATE_A_WAIT_VRISE;
+-			portstate(musb->port1_status |= USB_PORT_STAT_POWER);
+-			del_timer(&otg_workaround);
++			if (!(devctl & MUSB_DEVCTL_SESSION) ||
++			   (devctl & MUSB_DEVCTL_BDEVICE) ||
++			   (devctl & MUSB_DEVCTL_HM)) {
++				if (musb->is_active)
++					del_timer(&otg_workaround);
++				else
++					musb->is_active = 1;
++
++				MUSB_HST_MODE(musb);
++				musb->xceiv->default_a = 1;
++				musb->xceiv->state = OTG_STATE_A_WAIT_VRISE;
++				portstate(musb->port1_status |= USB_PORT_STAT_POWER);
++			}
+ 		} else {
+ 			musb->is_active = 0;
+ 			MUSB_DEV_MODE(musb);
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-AM3517-Add-am3517_evn_nor_defconfig.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-AM3517-Add-am3517_evn_nor_defconfig.patch
new file mode 100644
index 0000000..fac87de
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-AM3517-Add-am3517_evn_nor_defconfig.patch
@@ -0,0 +1,256 @@
+From 0fa5a9c5cf331d5df578797e778f18de223e02aa Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@ti.com>
+Date: Wed, 16 Nov 2011 09:02:23 -0700
+Subject: [PATCH 3/3] AM3517: Add am3517_evn_nor_defconfig
+
+When building for NOR, we need to disable NAND.  Provide a config
+that does so.
+
+Signed-off-by: Tom Rini <trini@ti.com>
+---
+ arch/arm/configs/am3517_evm_nor_defconfig      |  233 ++++++++++++++++++++
+ 1 files changed, 233 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/configs/am3517_evm_nor_defconfig
+
+diff --git a/arch/arm/configs/am3517_evm_nor_defconfig b/arch/arm/configs/am3517_evm_nor_defconfig
+new file mode 100644
+index 0000000..70bd7dd
+--- /dev/null
++++ b/arch/arm/configs/am3517_evm_nor_defconfig
+@@ -0,0 +1,233 @@
++CONFIG_EXPERIMENTAL=y
++CONFIG_SYSVIPC=y
++CONFIG_POSIX_MQUEUE=y
++CONFIG_BSD_PROCESS_ACCT=y
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=16
++CONFIG_BLK_DEV_INITRD=y
++CONFIG_EMBEDDED=y
++# CONFIG_SYSCTL_SYSCALL is not set
++CONFIG_KALLSYMS_EXTRA_PASS=y
++CONFIG_SLAB=y
++CONFIG_PROFILING=y
++CONFIG_OPROFILE=y
++CONFIG_KPROBES=y
++CONFIG_MODULES=y
++CONFIG_MODULE_UNLOAD=y
++CONFIG_MODVERSIONS=y
++CONFIG_MODULE_SRCVERSION_ALL=y
++# CONFIG_BLK_DEV_BSG is not set
++CONFIG_ARCH_OMAP=y
++CONFIG_OMAP_RESET_CLOCKS=y
++CONFIG_OMAP_MUX_DEBUG=y
++# CONFIG_ARCH_OMAP2 is not set
++# CONFIG_ARCH_OMAP4 is not set
++# CONFIG_MACH_OMAP3_BEAGLE is not set
++# CONFIG_MACH_DEVKIT8000 is not set
++# CONFIG_MACH_OMAP_LDP is not set
++# CONFIG_MACH_OMAP3530_LV_SOM is not set
++# CONFIG_MACH_OMAP3_TORPEDO is not set
++# CONFIG_MACH_OVERO is not set
++# CONFIG_MACH_OMAP3EVM is not set
++# CONFIG_MACH_OMAP3_PANDORA is not set
++# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
++# CONFIG_MACH_OMAP_3430SDP is not set
++# CONFIG_MACH_NOKIA_RM680 is not set
++# CONFIG_MACH_NOKIA_RX51 is not set
++# CONFIG_MACH_OMAP_ZOOM2 is not set
++# CONFIG_MACH_OMAP_ZOOM3 is not set
++# CONFIG_MACH_CM_T35 is not set
++# CONFIG_MACH_CM_T3517 is not set
++# CONFIG_MACH_IGEP0020 is not set
++# CONFIG_MACH_IGEP0030 is not set
++# CONFIG_MACH_SBC3530 is not set
++# CONFIG_MACH_OMAP_3630SDP is not set
++CONFIG_ARM_THUMBEE=y
++CONFIG_ARM_ERRATA_430973=y
++CONFIG_ARM_ERRATA_458693=y
++CONFIG_ARM_ERRATA_460075=y
++CONFIG_NO_HZ=y
++CONFIG_HIGH_RES_TIMERS=y
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
++CONFIG_KEXEC=y
++CONFIG_FPE_NWFPE=y
++CONFIG_BINFMT_MISC=y
++CONFIG_PM_DEBUG=y
++CONFIG_NET=y
++CONFIG_PACKET=y
++CONFIG_UNIX=y
++CONFIG_XFRM_USER=y
++CONFIG_NET_KEY=y
++CONFIG_NET_KEY_MIGRATE=y
++CONFIG_INET=y
++CONFIG_IP_MULTICAST=y
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_DHCP=y
++CONFIG_IP_PNP_BOOTP=y
++CONFIG_IP_PNP_RARP=y
++# CONFIG_INET_LRO is not set
++# CONFIG_IPV6 is not set
++CONFIG_CAN=y
++CONFIG_CAN_RAW=y
++CONFIG_CAN_BCM=y
++CONFIG_CAN_VCAN=y
++CONFIG_CAN_DEV=y
++CONFIG_CAN_CALC_BITTIMING=y
++CONFIG_CAN_TI_HECC=y
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++CONFIG_MTD=y
++CONFIG_MTD_CONCAT=y
++CONFIG_MTD_PARTITIONS=y
++CONFIG_MTD_CMDLINE_PARTS=y
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLOCK=y
++CONFIG_MTD_OOPS=y
++CONFIG_MTD_CFI=y
++CONFIG_MTD_CFI_INTELEXT=y
++CONFIG_MTD_CFI_AMDSTD=y
++CONFIG_MTD_PHYSMAP=y
++CONFIG_MTD_BLOCK2MTD=y
++CONFIG_BLK_DEV_LOOP=y
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_SIZE=32768
++CONFIG_SCSI=y
++CONFIG_BLK_DEV_SD=y
++CONFIG_SCSI_MULTI_LUN=y
++CONFIG_SCSI_SCAN_ASYNC=y
++CONFIG_MD=y
++CONFIG_NETDEVICES=y
++CONFIG_SMSC_PHY=y
++CONFIG_NET_ETHERNET=y
++CONFIG_SMSC911X=y
++CONFIG_TI_DAVINCI_EMAC=y
++CONFIG_USB_USBNET=y
++# CONFIG_USB_NET_AX8817X is not set
++CONFIG_USB_NET_DM9601=y
++# CONFIG_USB_NET_NET1080 is not set
++# CONFIG_USB_NET_CDC_SUBSET is not set
++# CONFIG_USB_NET_ZAURUS is not set
++CONFIG_INPUT_JOYDEV=y
++CONFIG_INPUT_EVDEV=y
++CONFIG_KEYBOARD_TCA6416=y
++CONFIG_INPUT_TOUCHSCREEN=y
++CONFIG_TOUCHSCREEN_TSC2004=y
++CONFIG_INPUT_MISC=y
++CONFIG_VT_HW_CONSOLE_BINDING=y
++CONFIG_SERIAL_8250=y
++CONFIG_SERIAL_8250_CONSOLE=y
++CONFIG_SERIAL_8250_NR_UARTS=32
++CONFIG_SERIAL_8250_EXTENDED=y
++CONFIG_SERIAL_8250_MANY_PORTS=y
++CONFIG_SERIAL_8250_SHARE_IRQ=y
++CONFIG_SERIAL_8250_DETECT_IRQ=y
++CONFIG_SERIAL_8250_RSA=y
++# CONFIG_LEGACY_PTYS is not set
++CONFIG_HW_RANDOM=y
++CONFIG_I2C_CHARDEV=y
++CONFIG_SPI=y
++CONFIG_SPI_OMAP24XX=y
++CONFIG_DEBUG_GPIO=y
++CONFIG_GPIO_SYSFS=y
++CONFIG_GPIO_PCA953X=y
++CONFIG_POWER_SUPPLY=y
++CONFIG_WATCHDOG=y
++CONFIG_WATCHDOG_NOWAYOUT=y
++CONFIG_OMAP_WATCHDOG=y
++CONFIG_REGULATOR_DUMMY=y
++CONFIG_REGULATOR_TPS65023=y
++CONFIG_MEDIA_SUPPORT=y
++CONFIG_VIDEO_DEV=y
++# CONFIG_IR_CORE is not set
++# CONFIG_MEDIA_TUNER_CUSTOMISE is not set
++CONFIG_VIDEO_TVP514X=y
++CONFIG_VIDEO_VPFE_CAPTURE=y
++CONFIG_VIDEO_OMAP2_VOUT=y
++CONFIG_USB_VIDEO_CLASS=y
++# CONFIG_RADIO_ADAPTERS is not set
++CONFIG_FB=y
++CONFIG_FIRMWARE_EDID=y
++CONFIG_FB_MODE_HELPERS=y
++CONFIG_FB_TILEBLITTING=y
++CONFIG_OMAP2_VRAM_SIZE=4
++CONFIG_OMAP2_DSS_DSI=y
++CONFIG_OMAP2_DSS_USE_DSI_PLL=y
++CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=1
++CONFIG_FB_OMAP2=y
++CONFIG_FB_OMAP2_NUM_FBS=1
++CONFIG_PANEL_GENERIC=y
++CONFIG_PANEL_SHARP_LQ043T1DG01=y
++CONFIG_BACKLIGHT_LCD_SUPPORT=y
++CONFIG_LCD_CLASS_DEVICE=y
++CONFIG_LCD_PLATFORM=y
++CONFIG_BACKLIGHT_CLASS_DEVICE=y
++CONFIG_BACKLIGHT_GENERIC=m
++CONFIG_DISPLAY_SUPPORT=y
++CONFIG_LOGO=y
++CONFIG_SOUND=y
++CONFIG_SND=y
++CONFIG_SND_USB_AUDIO=y
++CONFIG_SND_SOC=y
++CONFIG_SND_OMAP_SOC=y
++CONFIG_SND_OMAP_SOC_AM3517EVM=y
++CONFIG_USB=y
++CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
++CONFIG_USB_DEVICEFS=y
++CONFIG_USB_SUSPEND=y
++# CONFIG_USB_OTG_WHITELIST is not set
++CONFIG_USB_EHCI_HCD=y
++CONFIG_USB_MUSB_HDRC=y
++CONFIG_USB_MUSB_AM35X_GLUE=y
++CONFIG_USB_MUSB_OTG=y
++CONFIG_USB_GADGET_MUSB_HDRC=y
++CONFIG_USB_MUSB_DEBUG=y
++CONFIG_USB_STORAGE=y
++CONFIG_USB_TEST=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_ETH=y
++CONFIG_NOP_USB_XCEIV=y
++CONFIG_MMC=y
++CONFIG_SDIO_UART=y
++CONFIG_MMC_OMAP=y
++CONFIG_MMC_OMAP_HS=y
++CONFIG_RTC_CLASS=y
++CONFIG_RTC_DRV_S35390A=y
++CONFIG_EXT2_FS=y
++CONFIG_EXT3_FS=y
++# CONFIG_EXT3_FS_XATTR is not set
++CONFIG_QUOTA=y
++CONFIG_QFMT_V2=y
++CONFIG_MSDOS_FS=y
++CONFIG_VFAT_FS=y
++CONFIG_TMPFS=y
++CONFIG_JFFS2_FS=y
++CONFIG_JFFS2_SUMMARY=y
++CONFIG_JFFS2_FS_XATTR=y
++CONFIG_JFFS2_COMPRESSION_OPTIONS=y
++CONFIG_JFFS2_LZO=y
++CONFIG_JFFS2_RUBIN=y
++CONFIG_CRAMFS=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++CONFIG_NFS_V3_ACL=y
++CONFIG_NFS_V4=y
++CONFIG_ROOT_NFS=y
++CONFIG_PARTITION_ADVANCED=y
++CONFIG_NLS_CODEPAGE_437=y
++CONFIG_NLS_ISO8859_1=y
++CONFIG_PRINTK_TIME=y
++CONFIG_MAGIC_SYSRQ=y
++CONFIG_DEBUG_KERNEL=y
++CONFIG_SCHEDSTATS=y
++CONFIG_TIMER_STATS=y
++CONFIG_PROVE_LOCKING=y
++CONFIG_LOCK_STAT=y
++CONFIG_DEBUG_SPINLOCK_SLEEP=y
++CONFIG_DEBUG_INFO=y
++CONFIG_DEBUG_LL=y
++CONFIG_SECURITY=y
++# CONFIG_CRYPTO_ANSI_CPRNG is not set
++CONFIG_CRC_CCITT=y
++CONFIG_LIBCRC32C=y
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc-skip-detection-of-nonremovable-cards-on-rescan.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc-skip-detection-of-nonremovable-cards-on-rescan.patch
new file mode 100644
index 0000000..a9b1773
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc-skip-detection-of-nonremovable-cards-on-rescan.patch
@@ -0,0 +1,43 @@
+From 3627429b1a0cbe9380a9834fb91419fcb81be2ef Mon Sep 17 00:00:00 2001
+From: Ohad Ben-Cohen <ohad@wizery.com>
+Date: Sun, 28 Nov 2010 07:21:28 +0200
+Subject: [PATCH 1/6] mmc: skip detection of nonremovable cards on rescan
+
+mmc_rescan() checks whether registered cards are still present before
+skipping them, by calling the bus-specific ->detect() handler.
+
+With buses that support runtime PM, the card may be powered off at
+this point, so they need to be powered on and fully reinitialized before
+->detect() executes.
+
+This whole process is redundant with nonremovable cards; in those cases,
+we can safely skip calling ->detect() and implicitly assume its success.
+
+Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
+Reviewed-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+---
+ drivers/mmc/core/core.c |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
+index 57dcf8f..305e2a5 100644
+--- a/drivers/mmc/core/core.c
++++ b/drivers/mmc/core/core.c
+@@ -1446,8 +1446,12 @@ void mmc_rescan(struct work_struct *work)
+
+	mmc_bus_get(host);
+
+-	/* if there is a card registered, check whether it is still present */
+-	if ((host->bus_ops != NULL) && host->bus_ops->detect && !host->bus_dead)
++	/*
++	 * if there is a _removable_ card registered, check whether it is
++	 * still present
++	 */
++	if (host->bus_ops && host->bus_ops->detect && !host->bus_dead
++	    && mmc_card_is_removable(host))
+		host->bus_ops->detect(host);
+
+	mmc_bus_put(host);
+--
+1.7.1
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc_card_keep_power-cleanups.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc_card_keep_power-cleanups.patch
new file mode 100644
index 0000000..070e019
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-mmc_card_keep_power-cleanups.patch
@@ -0,0 +1,69 @@
+From 92093bb141b85f6f7396a0efd79d9f93c264baa3 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 3 Aug 2011 15:03:46 +0300
+Subject: [PATCH 3/6] mmc_card_keep_power cleanups
+
+mmc_card_is_powered_resumed is a mouthful; instead, simply use
+mmc_card_keep_power, which also better explains the purpose of
+the macro.
+
+Employ mmc_card_keep_power() where possible.
+
+Upstream status: accepted
+
+Based on Ohad Ben-Cohen <ohad@wizery.com> original patch.
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ drivers/mmc/core/sdio.c  |   14 +++++++-------
+ include/linux/mmc/host.h |    2 +-
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
+index 4a198b2..e43ff56 100644
+--- a/drivers/mmc/core/sdio.c
++++ b/drivers/mmc/core/sdio.c
+@@ -635,12 +635,12 @@ static int mmc_sdio_resume(struct mmc_host *host)
+ 	/* Basic card reinitialization. */
+ 	mmc_claim_host(host);
+ 
+-	/* No need to reinitialize powered-resumed nonremovable cards */
+-	if (mmc_card_is_removable(host) || !mmc_card_is_powered_resumed(host))
+-		err = mmc_sdio_init_card(host, host->ocr, host->card,
+-				 (host->pm_flags & MMC_PM_KEEP_POWER));
+-	else if (mmc_card_is_powered_resumed(host)) {
+-		/* We may have switched to 1-bit mode during suspend */
++ 	/* No need to reinitialize powered-resumed nonremovable cards */
++	if (mmc_card_is_removable(host) || !mmc_card_keep_power(host))
++ 		err = mmc_sdio_init_card(host, host->ocr, host->card,
++					mmc_card_keep_power(host));
++	else if (mmc_card_keep_power(host)) {
++ 		/* We may have switched to 1-bit mode during suspend */
+ 		err = sdio_enable_4bit_bus(host->card);
+ 		if (err > 0) {
+ 			mmc_set_bus_width(host, MMC_BUS_WIDTH_4);
+@@ -682,7 +682,7 @@ static int mmc_sdio_power_restore(struct mmc_host *host)
+ 
+ 	mmc_claim_host(host);
+ 	ret = mmc_sdio_init_card(host, host->ocr, host->card,
+-			(host->pm_flags & MMC_PM_KEEP_POWER));
++				mmc_card_keep_power(host));
+ 	if (!ret && host->sdio_irqs)
+ 		mmc_signal_sdio_irq(host);
+ 	mmc_release_host(host);
+diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
+index 74694c4..db2548f 100644
+--- a/include/linux/mmc/host.h
++++ b/include/linux/mmc/host.h
+@@ -307,7 +307,7 @@ static inline int mmc_card_is_removable(struct mmc_host *host)
+ 	return !(host->caps & MMC_CAP_NONREMOVABLE) && mmc_assume_removable;
+ }
+ 
+-static inline int mmc_card_is_powered_resumed(struct mmc_host *host)
++static inline int mmc_card_keep_power(struct mmc_host *host)
+ {
+ 	return host->pm_flags & MMC_PM_KEEP_POWER;
+ }
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-omap3_evm_defconfig-add-WLAN-config-options.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-omap3_evm_defconfig-add-WLAN-config-options.patch
new file mode 100644
index 0000000..02fe3ad
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0003-omap3_evm_defconfig-add-WLAN-config-options.patch
@@ -0,0 +1,283 @@
+From c49824d3d41982eb6d655f5cc4cc4c7e20d511c4 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Mon, 27 Jun 2011 14:06:58 -0500
+Subject: [PATCH 3/3] omap3_evm_defconfig: add WLAN config options
+
+* Added the WLAN config options to be base default configuration.
+
+Upstream-Status: Inappropriate [SDK specific changes]
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ arch/arm/configs/omap3_evm_defconfig |  167 +++++++++++++++++++++++++++++++--
+ 1 files changed, 156 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/configs/omap3_evm_defconfig b/arch/arm/configs/omap3_evm_defconfig
+index 6b9c736..5d44b2d 100644
+--- a/arch/arm/configs/omap3_evm_defconfig
++++ b/arch/arm/configs/omap3_evm_defconfig
+@@ -1,7 +1,7 @@
+ #
+ # Automatically generated make config: don't edit
+ # Linux/arm 2.6.37 Kernel Configuration
+-# Mon Jun 27 13:40:14 2011
++# Tue Jun 28 07:29:21 2011
+ #
+ CONFIG_ARM=y
+ CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+@@ -515,7 +515,123 @@ CONFIG_DEFAULT_TCP_CONG="cubic"
+ # CONFIG_NETLABEL is not set
+ # CONFIG_NETWORK_SECMARK is not set
+ # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+-# CONFIG_NETFILTER is not set
++CONFIG_NETFILTER=y
++# CONFIG_NETFILTER_DEBUG is not set
++CONFIG_NETFILTER_ADVANCED=y
++
++#
++# Core Netfilter Configuration
++#
++# CONFIG_NETFILTER_NETLINK_QUEUE is not set
++# CONFIG_NETFILTER_NETLINK_LOG is not set
++CONFIG_NF_CONNTRACK=y
++# CONFIG_NF_CONNTRACK_MARK is not set
++# CONFIG_NF_CONNTRACK_EVENTS is not set
++# CONFIG_NF_CT_PROTO_DCCP is not set
++# CONFIG_NF_CT_PROTO_SCTP is not set
++# CONFIG_NF_CT_PROTO_UDPLITE is not set
++# CONFIG_NF_CONNTRACK_AMANDA is not set
++# CONFIG_NF_CONNTRACK_FTP is not set
++# CONFIG_NF_CONNTRACK_H323 is not set
++# CONFIG_NF_CONNTRACK_IRC is not set
++# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
++# CONFIG_NF_CONNTRACK_PPTP is not set
++# CONFIG_NF_CONNTRACK_SANE is not set
++# CONFIG_NF_CONNTRACK_SIP is not set
++# CONFIG_NF_CONNTRACK_TFTP is not set
++# CONFIG_NF_CT_NETLINK is not set
++CONFIG_NETFILTER_XTABLES=y
++
++#
++# Xtables combined modules
++#
++# CONFIG_NETFILTER_XT_MARK is not set
++# CONFIG_NETFILTER_XT_CONNMARK is not set
++
++#
++# Xtables targets
++#
++# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
++# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
++# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
++# CONFIG_NETFILTER_XT_TARGET_MARK is not set
++# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
++# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
++# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
++# CONFIG_NETFILTER_XT_TARGET_TEE is not set
++# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
++
++#
++# Xtables matches
++#
++# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
++# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
++# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
++# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
++# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
++# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
++# CONFIG_NETFILTER_XT_MATCH_CPU is not set
++# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
++# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
++# CONFIG_NETFILTER_XT_MATCH_ESP is not set
++# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
++# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
++# CONFIG_NETFILTER_XT_MATCH_HL is not set
++# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
++# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
++# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
++# CONFIG_NETFILTER_XT_MATCH_MAC is not set
++# CONFIG_NETFILTER_XT_MATCH_MARK is not set
++# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
++# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
++# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
++# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
++# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
++# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
++# CONFIG_NETFILTER_XT_MATCH_REALM is not set
++# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
++# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
++# CONFIG_NETFILTER_XT_MATCH_STATE is not set
++# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
++# CONFIG_NETFILTER_XT_MATCH_STRING is not set
++# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
++# CONFIG_NETFILTER_XT_MATCH_TIME is not set
++# CONFIG_NETFILTER_XT_MATCH_U32 is not set
++# CONFIG_IP_VS is not set
++
++#
++# IP: Netfilter Configuration
++#
++CONFIG_NF_DEFRAG_IPV4=y
++CONFIG_NF_CONNTRACK_IPV4=y
++CONFIG_NF_CONNTRACK_PROC_COMPAT=y
++# CONFIG_IP_NF_QUEUE is not set
++CONFIG_IP_NF_IPTABLES=y
++# CONFIG_IP_NF_MATCH_ADDRTYPE is not set
++# CONFIG_IP_NF_MATCH_AH is not set
++# CONFIG_IP_NF_MATCH_ECN is not set
++# CONFIG_IP_NF_MATCH_TTL is not set
++CONFIG_IP_NF_FILTER=y
++# CONFIG_IP_NF_TARGET_REJECT is not set
++CONFIG_IP_NF_TARGET_LOG=y
++# CONFIG_IP_NF_TARGET_ULOG is not set
++CONFIG_NF_NAT=y
++CONFIG_NF_NAT_NEEDED=y
++CONFIG_IP_NF_TARGET_MASQUERADE=y
++# CONFIG_IP_NF_TARGET_NETMAP is not set
++# CONFIG_IP_NF_TARGET_REDIRECT is not set
++# CONFIG_NF_NAT_SNMP_BASIC is not set
++# CONFIG_NF_NAT_FTP is not set
++# CONFIG_NF_NAT_IRC is not set
++# CONFIG_NF_NAT_TFTP is not set
++# CONFIG_NF_NAT_AMANDA is not set
++# CONFIG_NF_NAT_PPTP is not set
++# CONFIG_NF_NAT_H323 is not set
++# CONFIG_NF_NAT_SIP is not set
++# CONFIG_IP_NF_MANGLE is not set
++# CONFIG_IP_NF_RAW is not set
++# CONFIG_IP_NF_SECURITY is not set
++# CONFIG_IP_NF_ARPTABLES is not set
+ # CONFIG_IP_DCCP is not set
+ # CONFIG_IP_SCTP is not set
+ # CONFIG_RDS is not set
+@@ -548,7 +664,31 @@ CONFIG_DNS_RESOLVER=y
+ # CONFIG_HAMRADIO is not set
+ # CONFIG_CAN is not set
+ # CONFIG_IRDA is not set
+-# CONFIG_BT is not set
++CONFIG_BT=y
++CONFIG_BT_L2CAP=y
++CONFIG_BT_SCO=y
++CONFIG_BT_RFCOMM=y
++CONFIG_BT_RFCOMM_TTY=y
++CONFIG_BT_BNEP=y
++CONFIG_BT_BNEP_MC_FILTER=y
++CONFIG_BT_BNEP_PROTO_FILTER=y
++CONFIG_BT_HIDP=y
++
++#
++# Bluetooth device drivers
++#
++# CONFIG_BT_HCIBTUSB is not set
++# CONFIG_BT_HCIBTSDIO is not set
++CONFIG_BT_HCIUART=y
++CONFIG_BT_HCIUART_H4=y
++# CONFIG_BT_HCIUART_BCSP is not set
++# CONFIG_BT_HCIUART_ATH3K is not set
++CONFIG_BT_HCIUART_LL=y
++# CONFIG_BT_HCIBCM203X is not set
++# CONFIG_BT_HCIBPA10X is not set
++# CONFIG_BT_HCIBFUSB is not set
++# CONFIG_BT_HCIVHCI is not set
++# CONFIG_BT_MRVL is not set
+ # CONFIG_AF_RXRPC is not set
+ CONFIG_WIRELESS=y
+ CONFIG_WIRELESS_EXT=y
+@@ -566,7 +706,8 @@ CONFIG_WIRELESS_EXT_SYSFS=y
+ # Some wireless drivers require a rate control algorithm
+ #
+ # CONFIG_WIMAX is not set
+-# CONFIG_RFKILL is not set
++CONFIG_RFKILL=y
++# CONFIG_RFKILL_INPUT is not set
+ # CONFIG_NET_9P is not set
+ # CONFIG_CAIF is not set
+ # CONFIG_CEPH_LIB is not set
+@@ -851,6 +992,7 @@ CONFIG_USB_EPSON2888=y
+ CONFIG_USB_KC2190=y
+ CONFIG_USB_NET_ZAURUS=y
+ # CONFIG_USB_NET_CX82310_ETH is not set
++# CONFIG_USB_HSO is not set
+ # CONFIG_USB_NET_INT51X1 is not set
+ # CONFIG_USB_IPHETH is not set
+ # CONFIG_USB_SIERRA_NET is not set
+@@ -1278,7 +1420,7 @@ CONFIG_TWL4030_CODEC=y
+ CONFIG_REGULATOR=y
+ # CONFIG_REGULATOR_DEBUG is not set
+ CONFIG_REGULATOR_DUMMY=y
+-# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++CONFIG_REGULATOR_FIXED_VOLTAGE=y
+ # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+ # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+ # CONFIG_REGULATOR_BQ24022 is not set
+@@ -1643,6 +1785,7 @@ CONFIG_USB_HID=y
+ # CONFIG_HID_CYPRESS is not set
+ # CONFIG_HID_DRAGONRISE is not set
+ # CONFIG_HID_EGALAX is not set
++# CONFIG_HID_ELECOM is not set
+ # CONFIG_HID_EZKEY is not set
+ # CONFIG_HID_KYE is not set
+ # CONFIG_HID_UCLOGIC is not set
+@@ -1651,6 +1794,7 @@ CONFIG_USB_HID=y
+ # CONFIG_HID_TWINHAN is not set
+ # CONFIG_HID_KENSINGTON is not set
+ # CONFIG_HID_LOGITECH is not set
++# CONFIG_HID_MAGICMOUSE is not set
+ # CONFIG_HID_MICROSOFT is not set
+ # CONFIG_HID_MOSART is not set
+ # CONFIG_HID_MONTEREY is not set
+@@ -1671,6 +1815,7 @@ CONFIG_USB_HID=y
+ # CONFIG_HID_SMARTJOYPLUS is not set
+ # CONFIG_HID_TOPSEED is not set
+ # CONFIG_HID_THRUSTMASTER is not set
++# CONFIG_HID_WACOM is not set
+ # CONFIG_HID_ZEROPLUS is not set
+ # CONFIG_HID_ZYDACRON is not set
+ CONFIG_USB_SUPPORT=y
+@@ -2286,7 +2431,7 @@ CONFIG_CRYPTO_WORKQUEUE=y
+ CONFIG_CRYPTO_CBC=y
+ # CONFIG_CRYPTO_CTR is not set
+ # CONFIG_CRYPTO_CTS is not set
+-# CONFIG_CRYPTO_ECB is not set
++CONFIG_CRYPTO_ECB=y
+ # CONFIG_CRYPTO_LRW is not set
+ # CONFIG_CRYPTO_PCBC is not set
+ # CONFIG_CRYPTO_XTS is not set
+@@ -2305,7 +2450,7 @@ CONFIG_CRYPTO_CRC32C=y
+ # CONFIG_CRYPTO_GHASH is not set
+ # CONFIG_CRYPTO_MD4 is not set
+ CONFIG_CRYPTO_MD5=y
+-# CONFIG_CRYPTO_MICHAEL_MIC is not set
++CONFIG_CRYPTO_MICHAEL_MIC=y
+ # CONFIG_CRYPTO_RMD128 is not set
+ # CONFIG_CRYPTO_RMD160 is not set
+ # CONFIG_CRYPTO_RMD256 is not set
+@@ -2319,9 +2464,9 @@ CONFIG_CRYPTO_MD5=y
+ #
+ # Ciphers
+ #
+-# CONFIG_CRYPTO_AES is not set
++CONFIG_CRYPTO_AES=y
+ # CONFIG_CRYPTO_ANUBIS is not set
+-# CONFIG_CRYPTO_ARC4 is not set
++CONFIG_CRYPTO_ARC4=y
+ # CONFIG_CRYPTO_BLOWFISH is not set
+ # CONFIG_CRYPTO_CAMELLIA is not set
+ # CONFIG_CRYPTO_CAST5 is not set
+@@ -2367,11 +2512,11 @@ CONFIG_BINARY_PRINTF=y
+ CONFIG_BITREVERSE=y
+ CONFIG_GENERIC_FIND_LAST_BIT=y
+ CONFIG_CRC_CCITT=y
+-# CONFIG_CRC16 is not set
++CONFIG_CRC16=y
+ # CONFIG_CRC_T10DIF is not set
+ # CONFIG_CRC_ITU_T is not set
+ CONFIG_CRC32=y
+-# CONFIG_CRC7 is not set
++CONFIG_CRC7=y
+ CONFIG_LIBCRC32C=y
+ CONFIG_ZLIB_INFLATE=y
+ CONFIG_ZLIB_DEFLATE=y
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-do-not-switch-to-1-bit-mode-if-not-required.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-do-not-switch-to-1-bit-mode-if-not-required.patch
new file mode 100644
index 0000000..c1e356f
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-do-not-switch-to-1-bit-mode-if-not-required.patch
@@ -0,0 +1,43 @@
+From fbd81cb717ed6a875abd1f09e32e8f803a066a91 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Wed, 3 Aug 2011 15:10:30 +0300
+Subject: [PATCH 4/6] mmc: do not switch to 1-bit mode if not required
+
+6b5eda36 followed SDIO spec part E1 section 8, which states that
+in case SDIO interrupts are being used to wake up a suspended host,
+then it is required to switch to 1-bit mode before stopping the clock.
+
+Before switching to 1-bit mode (or back to 4-bit mode on resume),
+make sure that SDIO interrupts are really being used to wake the host.
+
+This is helpful for devices which have an external irq line (e.g.
+wl1271), and do not use SDIO interrupts to wake up the host.
+
+In this case, switching to 1-bit mode (and back to 4-bit mode on resume)
+is not necessary.
+
+Upstream status: accepted
+
+Based on patch made by Ohad Ben-Cohen <ohad@wizery.com>
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ drivers/mmc/core/sdio.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
+index e43ff56..2eeeaa2 100644
+--- a/drivers/mmc/core/sdio.c
++++ b/drivers/mmc/core/sdio.c
+@@ -639,7 +639,7 @@ static int mmc_sdio_resume(struct mmc_host *host)
+ 	if (mmc_card_is_removable(host) || !mmc_card_keep_power(host))
+  		err = mmc_sdio_init_card(host, host->ocr, host->card,
+ 					mmc_card_keep_power(host));
+-	else if (mmc_card_keep_power(host)) {
++	else if (mmc_card_keep_power(host) && mmc_card_wake_sdio_irq(host)) {
+  		/* We may have switched to 1-bit mode during suspend */
+ 		err = sdio_enable_4bit_bus(host->card);
+ 		if (err > 0) {
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-sdio-don-t-reinitialize-nonremovable-powered-res.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-sdio-don-t-reinitialize-nonremovable-powered-res.patch
new file mode 100644
index 0000000..f173bf5
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0004-mmc-sdio-don-t-reinitialize-nonremovable-powered-res.patch
@@ -0,0 +1,77 @@
+From 756d4919d44948a7a7d2860db75077c753a75039 Mon Sep 17 00:00:00 2001
+From: Ohad Ben-Cohen <ohad@wizery.com>
+Date: Sun, 28 Nov 2010 07:21:29 +0200
+Subject: [PATCH 2/6] mmc: sdio: don't reinitialize nonremovable powered-resumed cards
+
+Upon system resume, SDIO core must reinitialize cards that were
+powered off during suspend.
+
+If the card had its power kept during suspend (and thus it is
+'powered-resumed'), SDIO core performs only a limited reinitializing,
+mainly needed to make sure that the card wasn't removed/replaced.
+
+If a __nonremovable__ card is powered-resumed, we can safely skip the
+reinitializing phase.
+
+Note: 9b966aa (mmc: sdio: fully reconfigure oldcard on resume) removed
+the bus width reconfiguration since mmc_sdio_init_card already does it.
+It is brought back now in case mmc_sdio_init_card is skipped.
+
+Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+---
+ drivers/mmc/core/sdio.c  |   16 ++++++++++++++--
+ include/linux/mmc/host.h |    5 +++++
+ 2 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
+index efef5f9..b424fbe 100644
+--- a/drivers/mmc/core/sdio.c
++++ b/drivers/mmc/core/sdio.c
+@@ -627,15 +627,27 @@ static int mmc_sdio_suspend(struct mmc_host *host)
+
+ static int mmc_sdio_resume(struct mmc_host *host)
+ {
+-	int i, err;
++	int i, err = 0;
+
+	BUG_ON(!host);
+	BUG_ON(!host->card);
+
+	/* Basic card reinitialization. */
+	mmc_claim_host(host);
+-	err = mmc_sdio_init_card(host, host->ocr, host->card,
++
++	/* No need to reinitialize powered-resumed nonremovable cards */
++	if (mmc_card_is_removable(host) || !mmc_card_is_powered_resumed(host))
++		err = mmc_sdio_init_card(host, host->ocr, host->card,
+				 (host->pm_flags & MMC_PM_KEEP_POWER));
++	else if (mmc_card_is_powered_resumed(host)) {
++		/* We may have switched to 1-bit mode during suspend */
++		err = sdio_enable_4bit_bus(host->card);
++		if (err > 0) {
++			mmc_set_bus_width(host, MMC_BUS_WIDTH_4);
++			err = 0;
++		}
++	}
++
+	if (!err && host->sdio_irqs)
+		mmc_signal_sdio_irq(host);
+	mmc_release_host(host);
+diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
+index 30f6fad..86d74a5 100644
+--- a/include/linux/mmc/host.h
++++ b/include/linux/mmc/host.h
+@@ -307,5 +307,10 @@ static inline int mmc_card_is_removable(struct mmc_host *host)
+	return !(host->caps & MMC_CAP_NONREMOVABLE) && mmc_assume_removable;
+ }
+
++static inline int mmc_card_is_powered_resumed(struct mmc_host *host)
++{
++	return host->pm_flags & MMC_PM_KEEP_POWER;
++}
++
+ #endif
+
+--
+1.7.1
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-fix-division-by-zero-in-MMC-core.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-fix-division-by-zero-in-MMC-core.patch
new file mode 100644
index 0000000..66fed25
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-fix-division-by-zero-in-MMC-core.patch
@@ -0,0 +1,41 @@
+From 6dc280ffc189b8d534e7e9ff758b12f31a8d3234 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@stericsson.com>
+Date: Wed, 5 Jan 2011 00:44:32 +0100
+Subject: [PATCH 5/6] mmc: fix division by zero in MMC core
+
+The card is not always clocked and the clock frequency zero is perfectly
+legal, thus this code in mmc_set_data_timeout() may cause a division by
+zero. It will be triggered more often if you're using software clock
+gating but can be triggered under other conditions too.
+
+Upstream status: accepted
+
+Reported-by: Pierre Tardy <tardyp@gmail.com>
+Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
+Reviewed-by: Chris Ball <cjb@laptop.org>
+Cc: <stable@kernel.org>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Eliad Peller <eliad@wizery.com>
+---
+ drivers/mmc/core/core.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
+index 55bc015..6448c6b 100644
+--- a/drivers/mmc/core/core.c
++++ b/drivers/mmc/core/core.c
+@@ -296,8 +296,9 @@ void mmc_set_data_timeout(struct mmc_data *data, const struct mmc_card *card)
+ 		unsigned int timeout_us, limit_us;
+ 
+ 		timeout_us = data->timeout_ns / 1000;
+-		timeout_us += data->timeout_clks * 1000 /
+-			(card->host->ios.clock / 1000);
++		if (card->host->ios.clock)
++			timeout_us += data->timeout_clks * 1000 /
++				(card->host->ios.clock / 1000);
+ 
+ 		if (data->flags & MMC_DATA_WRITE)
+ 			/*
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-sdio-don-t-power-up-cards-on-system-suspend.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-sdio-don-t-power-up-cards-on-system-suspend.patch
new file mode 100644
index 0000000..c135cbf
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0005-mmc-sdio-don-t-power-up-cards-on-system-suspend.patch
@@ -0,0 +1,112 @@
+From 3d72f4e09138025931b1e0cb2ef921478f7d6d11 Mon Sep 17 00:00:00 2001
+From: Ohad Ben-Cohen <ohad@wizery.com>
+Date: Sun, 28 Nov 2010 07:21:30 +0200
+Subject: [PATCH 3/6] mmc: sdio: don't power up cards on system suspend
+
+Initial SDIO runtime PM implementation took a conservative approach
+of powering up cards (and fully reinitializing them) on system suspend,
+just before the suspend handlers of the relevant drivers were executed.
+
+To avoid redundant power and reinitialization cycles, this patch removes
+this behavior: if a card is already powered off when system suspend kicks
+in, it is left at that state.
+
+If a card is active when a system sleep starts, everything is
+straightforward and works exactly like before. But if the card was
+already suspended before the sleep began, then when the MMC core powers
+it back up on resume, its run-time PM status has to be updated to reflect
+the actual post-system sleep status.
+
+The technique to do that is borrowed from the I2C runtime PM
+implementation (for more info see Documentation/power/runtime_pm.txt).
+
+Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
+Reviewed-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+---
+ drivers/mmc/core/core.c     |   13 +++++++++++++
+ drivers/mmc/core/sdio_bus.c |   32 --------------------------------
+ 2 files changed, 13 insertions(+), 32 deletions(-)
+
+diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
+index 305e2a5..2762ad2 100644
+--- a/drivers/mmc/core/core.c
++++ b/drivers/mmc/core/core.c
+@@ -22,6 +22,7 @@
+ #include <linux/scatterlist.h>
+ #include <linux/log2.h>
+ #include <linux/regulator/consumer.h>
++#include <linux/pm_runtime.h>
+
+ #include <linux/mmc/card.h>
+ #include <linux/mmc/host.h>
+@@ -1725,6 +1726,18 @@ int mmc_resume_host(struct mmc_host *host)
+		if (!(host->pm_flags & MMC_PM_KEEP_POWER)) {
+			mmc_power_up(host);
+			mmc_select_voltage(host, host->ocr);
++			/*
++			 * Tell runtime PM core we just powered up the card,
++			 * since it still believes the card is powered off.
++			 * Note that currently runtime PM is only enabled
++			 * for SDIO cards that are MMC_CAP_POWER_OFF_CARD
++			 */
++			if (mmc_card_sdio(host->card) &&
++			    (host->caps & MMC_CAP_POWER_OFF_CARD)) {
++				pm_runtime_disable(&host->card->dev);
++				pm_runtime_set_active(&host->card->dev);
++				pm_runtime_enable(&host->card->dev);
++			}
+		}
+		BUG_ON(!host->bus_ops->resume);
+		err = host->bus_ops->resume(host);
+diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
+index 203da44..d29b9c3 100644
+--- a/drivers/mmc/core/sdio_bus.c
++++ b/drivers/mmc/core/sdio_bus.c
+@@ -197,44 +197,12 @@ out:
+
+ #ifdef CONFIG_PM_RUNTIME
+
+-static int sdio_bus_pm_prepare(struct device *dev)
+-{
+-	struct sdio_func *func = dev_to_sdio_func(dev);
+-
+-	/*
+-	 * Resume an SDIO device which was suspended at run time at this
+-	 * point, in order to allow standard SDIO suspend/resume paths
+-	 * to keep working as usual.
+-	 *
+-	 * Ultimately, the SDIO driver itself will decide (in its
+-	 * suspend handler, or lack thereof) whether the card should be
+-	 * removed or kept, and if kept, at what power state.
+-	 *
+-	 * At this point, PM core have increased our use count, so it's
+-	 * safe to directly resume the device. After system is resumed
+-	 * again, PM core will drop back its runtime PM use count, and if
+-	 * needed device will be suspended again.
+-	 *
+-	 * The end result is guaranteed to be a power state that is
+-	 * coherent with the device's runtime PM use count.
+-	 *
+-	 * The return value of pm_runtime_resume is deliberately unchecked
+-	 * since there is little point in failing system suspend if a
+-	 * device can't be resumed.
+-	 */
+-	if (func->card->host->caps & MMC_CAP_POWER_OFF_CARD)
+-		pm_runtime_resume(dev);
+-
+-	return 0;
+-}
+-
+ static const struct dev_pm_ops sdio_bus_pm_ops = {
+	SET_RUNTIME_PM_OPS(
+		pm_generic_runtime_suspend,
+		pm_generic_runtime_resume,
+		pm_generic_runtime_idle
+	)
+-	.prepare = sdio_bus_pm_prepare,
+ };
+
+ #define SDIO_PM_OPS_PTR	(&sdio_bus_pm_ops)
+--
+1.7.1
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-revert-duplicate-insertion-of-mmc_card_keep_power-fu.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-revert-duplicate-insertion-of-mmc_card_keep_power-fu.patch
new file mode 100644
index 0000000..fc24053
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-revert-duplicate-insertion-of-mmc_card_keep_power-fu.patch
@@ -0,0 +1,30 @@
+From ddcdd25ae15a5b6ec1d179ce018c09e0880f36a8 Mon Sep 17 00:00:00 2001
+From: Ido Reis <idor@ti.com>
+Date: Thu, 7 Jul 2011 00:21:55 +0300
+Subject: [PATCH 6/6] revert duplicate insertion of mmc_card_keep_power function in include/linux/mmc/host.h
+
+Upstream status: accepted
+
+---
+ include/linux/mmc/host.h |    5 -----
+ 1 files changed, 0 insertions(+), 5 deletions(-)
+
+diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
+index db2548f..c797318 100644
+--- a/include/linux/mmc/host.h
++++ b/include/linux/mmc/host.h
+@@ -312,11 +312,6 @@ static inline int mmc_card_keep_power(struct mmc_host *host)
+ 	return host->pm_flags & MMC_PM_KEEP_POWER;
+ }
+ 
+-static inline int mmc_card_keep_power(struct mmc_host *host)
+-{
+-	return host->pm_flags & MMC_PM_KEEP_POWER;
+-}
+-
+ static inline int mmc_card_wake_sdio_irq(struct mmc_host *host)
+ {
+ 	return host->pm_flags & MMC_PM_WAKE_SDIO_IRQ;
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-wl12xx-Backport-wl12xx-platform-data.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-wl12xx-Backport-wl12xx-platform-data.patch
new file mode 100644
index 0000000..b977793
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0006-wl12xx-Backport-wl12xx-platform-data.patch
@@ -0,0 +1,64 @@
+From c3c1429faed56c53d96bf5c98dcaa7140a616ea5 Mon Sep 17 00:00:00 2001
+From: Ido Yariv <ido@wizery.com>
+Date: Wed, 6 Apr 2011 00:36:41 +0300
+Subject: [PATCH 5/6] wl12xx: Backport wl12xx platform data
+
+In order to build a more recent wl12xx driver externally (using
+compat-wireless), the builtin platform data structure needs to match the
+one used in the driver.
+
+Fix this by backporting wl12xx.h from Luciano's tree.
+
+Signed-off-by: Ido Yariv <ido@wizery.com>
+---
+ include/linux/wl12xx.h |   27 +++++++++++++++++++++++++++
+ 1 files changed, 27 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/wl12xx.h b/include/linux/wl12xx.h
+index 4f902e1..4b69739 100644
+--- a/include/linux/wl12xx.h
++++ b/include/linux/wl12xx.h
+@@ -24,14 +24,41 @@
+ #ifndef _LINUX_WL12XX_H
+ #define _LINUX_WL12XX_H
+
++/* Reference clock values */
++enum {
++	WL12XX_REFCLOCK_19	= 0, /* 19.2 MHz */
++	WL12XX_REFCLOCK_26	= 1, /* 26 MHz */
++	WL12XX_REFCLOCK_38	= 2, /* 38.4 MHz */
++	WL12XX_REFCLOCK_52	= 3, /* 52 MHz */
++	WL12XX_REFCLOCK_38_XTAL = 4, /* 38.4 MHz, XTAL */
++	WL12XX_REFCLOCK_26_XTAL = 5, /* 26 MHz, XTAL */
++};
++
++/* TCXO clock values */
++enum {
++	WL12XX_TCXOCLOCK_19_2	= 0, /* 19.2MHz */
++	WL12XX_TCXOCLOCK_26	= 1, /* 26 MHz */
++	WL12XX_TCXOCLOCK_38_4	= 2, /* 38.4MHz */
++	WL12XX_TCXOCLOCK_52	= 3, /* 52 MHz */
++	WL12XX_TCXOCLOCK_16_368	= 4, /* 16.368 MHz */
++	WL12XX_TCXOCLOCK_32_736	= 5, /* 32.736 MHz */
++	WL12XX_TCXOCLOCK_16_8	= 6, /* 16.8 MHz */
++	WL12XX_TCXOCLOCK_33_6	= 7, /* 33.6 MHz */
++};
++
+ struct wl12xx_platform_data {
+	void (*set_power)(bool enable);
+	/* SDIO only: IRQ number if WLAN_IRQ line is used, 0 for SDIO IRQs */
+	int irq;
+	bool use_eeprom;
+	int board_ref_clock;
++	int board_tcxo_clock;
++	unsigned long platform_quirks;
+ };
+
++/* Platform does not support level trigger interrupts */
++#define WL12XX_PLATFORM_QUIRK_EDGE_IRQ	BIT(0)
++
+ #ifdef CONFIG_WL12XX_PLATFORM_DATA
+
+ int wl12xx_set_platform_data(const struct wl12xx_platform_data *data);
+--
+1.7.1
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0007-activate-wireless-extensions.patch b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0007-activate-wireless-extensions.patch
new file mode 100644
index 0000000..df13209
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/0007-activate-wireless-extensions.patch
@@ -0,0 +1,26 @@
+From 6133415cf067d656c40997e00eace06d07aeab34 Mon Sep 17 00:00:00 2001
+From: Eyal Reizer <eyalr@ti.com>
+Date: Mon, 16 May 2011 17:47:46 +0300
+Subject: [PATCH] PSP04.02.00.07.sdk: activate wireless extensions interface used by iwconfig
+
+Signed-off-by: Eyal Reizer <eyalr@ti.com>
+---
+ arch/arm/mach-omap2/Kconfig |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
+index dfa5464..8152b72 100644
+--- a/arch/arm/mach-omap2/Kconfig
++++ b/arch/arm/mach-omap2/Kconfig
+@@ -34,6 +34,7 @@ config ARCH_OMAP3
+ 	select ARM_L1_CACHE_SHIFT_6 if !ARCH_OMAP4
+ 	select ARCH_HAS_OPP
+ 	select PM_OPP if PM
+	select WL12XX_PLATFORM_DATA
++	select WIRELESS_EXT
+ 
+ config ARCH_OMAP4
+ 	bool "TI OMAP4"
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/defconfig b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/defconfig
new file mode 100644
index 0000000..97640a2
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp-2.6.37/omap3/defconfig
@@ -0,0 +1,2505 @@
+#
+# Automatically generated make config: don't edit
+# Linux/arm 2.6.37 Kernel Configuration
+# Tue Jun 28 07:29:21 2011
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_ARM_L1_CACHE_SHIFT_6=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
+CONFIG_BSD_PROCESS_ACCT=y
+# CONFIG_BSD_PROCESS_ACCT_V3 is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+# CONFIG_HAVE_GENERIC_HARDIRQS is not set
+# CONFIG_SPARSE_IRQ is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+# CONFIG_CGROUPS is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_LZO is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_KALLSYMS_EXTRA_PASS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+CONFIG_PROFILING=y
+CONFIG_TRACEPOINTS=y
+CONFIG_OPROFILE=y
+CONFIG_HAVE_OPROFILE=y
+CONFIG_KPROBES=y
+CONFIG_KRETPROBES=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_HW_BREAKPOINT=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=y
+CONFIG_MODULE_SRCVERSION_ALL=y
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_READ_UNLOCK is not set
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_WRITE_UNLOCK is not set
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_NUC93X is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5P6442 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_S5PV310 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+CONFIG_ARCH_OMAP=y
+# CONFIG_PLAT_SPEAR is not set
+
+#
+# TI OMAP Common Features
+#
+CONFIG_ARCH_OMAP_OTG=y
+# CONFIG_ARCH_OMAP1 is not set
+CONFIG_ARCH_OMAP2PLUS=y
+
+#
+# OMAP Feature Selections
+#
+CONFIG_OMAP_SMARTREFLEX=y
+CONFIG_OMAP_SMARTREFLEX_CLASS3=y
+CONFIG_OMAP_RESET_CLOCKS=y
+CONFIG_OMAP_MUX=y
+CONFIG_OMAP_MUX_DEBUG=y
+CONFIG_OMAP_MUX_WARNINGS=y
+CONFIG_OMAP_MCBSP=y
+# CONFIG_OMAP_MBOX_FWK is not set
+CONFIG_OMAP_IOMMU=y
+# CONFIG_OMAP_IOMMU_DEBUG is not set
+# CONFIG_OMAP_MPU_TIMER is not set
+CONFIG_OMAP_32K_TIMER=y
+# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
+CONFIG_OMAP_32K_TIMER_HZ=128
+CONFIG_OMAP_DM_TIMER=y
+# CONFIG_OMAP_PM_NONE is not set
+CONFIG_OMAP_PM_NOOP=y
+
+#
+# TI OMAP2/3/4 Specific Features
+#
+CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
+# CONFIG_ARCH_OMAP2 is not set
+CONFIG_ARCH_OMAP3=y
+# CONFIG_ARCH_OMAP4 is not set
+# CONFIG_ARCH_TI81XX is not set
+CONFIG_ARCH_OMAP3430=y
+CONFIG_OMAP_PACKAGE_CBB=y
+
+#
+# OMAP Board Type
+#
+# CONFIG_MACH_OMAP3_BEAGLE is not set
+# CONFIG_MACH_DEVKIT8000 is not set
+# CONFIG_MACH_OMAP_LDP is not set
+# CONFIG_MACH_OMAP3530_LV_SOM is not set
+# CONFIG_MACH_OMAP3_TORPEDO is not set
+# CONFIG_MACH_OVERO is not set
+CONFIG_MACH_OMAP3EVM=y
+# CONFIG_MACH_OMAP3517EVM is not set
+# CONFIG_MACH_CRANEBOARD is not set
+# CONFIG_MACH_OMAP3_PANDORA is not set
+# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
+# CONFIG_MACH_OMAP_3430SDP is not set
+# CONFIG_MACH_NOKIA_RM680 is not set
+# CONFIG_MACH_NOKIA_RX51 is not set
+# CONFIG_MACH_OMAP_ZOOM2 is not set
+# CONFIG_MACH_OMAP_ZOOM3 is not set
+# CONFIG_MACH_CM_T35 is not set
+# CONFIG_MACH_CM_T3517 is not set
+# CONFIG_MACH_IGEP0020 is not set
+# CONFIG_MACH_IGEP0030 is not set
+# CONFIG_MACH_SBC3530 is not set
+# CONFIG_MACH_OMAP_3630SDP is not set
+# CONFIG_OMAP3_EMU is not set
+CONFIG_OMAP3_PM_DISABLE_VT_SWITCH=y
+# CONFIG_OMAP3_SDRC_AC_TIMING is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32v6K=y
+CONFIG_CPU_V7=y
+CONFIG_CPU_32v7=y
+CONFIG_CPU_ABRT_EV7=y
+CONFIG_CPU_PABRT_V7=y
+CONFIG_CPU_CACHE_V7=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V7=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT=6
+CONFIG_ARM_DMA_MEM_BUFFERABLE=y
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_458693=y
+CONFIG_ARM_ERRATA_460075=y
+# CONFIG_ARM_ERRATA_743622 is not set
+CONFIG_COMMON_CLKDEV=y
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=128
+# CONFIG_THUMB2_KERNEL is not set
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_NEED_PER_CPU_KM=y
+CONFIG_FORCE_MAX_ZONEORDER=11
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+# CONFIG_AUTO_ZRELADDR is not set
+
+#
+# CPU Power Management
+#
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+# CONFIG_CPU_FREQ_DEBUG is not set
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_STAT_DETAILS=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+CONFIG_VFP=y
+CONFIG_VFPv3=y
+CONFIG_NEON=y
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+CONFIG_BINFMT_MISC=y
+
+#
+# Power management options
+#
+CONFIG_PM=y
+CONFIG_PM_DEBUG=y
+# CONFIG_PM_ADVANCED_DEBUG is not set
+# CONFIG_PM_VERBOSE is not set
+CONFIG_CAN_PM_TRACE=y
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND_NVS=y
+CONFIG_SUSPEND=y
+# CONFIG_PM_TEST_SUSPEND is not set
+CONFIG_SUSPEND_FREEZER=y
+# CONFIG_APM_EMULATION is not set
+CONFIG_PM_RUNTIME=y
+CONFIG_PM_OPS=y
+CONFIG_ARCH_HAS_OPP=y
+CONFIG_PM_OPP=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=y
+# CONFIG_XFRM_SUB_POLICY is not set
+CONFIG_XFRM_MIGRATE=y
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETLABEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+CONFIG_NF_CONNTRACK=y
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+# CONFIG_NF_CONNTRACK_FTP is not set
+# CONFIG_NF_CONNTRACK_H323 is not set
+# CONFIG_NF_CONNTRACK_IRC is not set
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+# CONFIG_NF_CONNTRACK_SIP is not set
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
+CONFIG_NETFILTER_XTABLES=y
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+# CONFIG_NETFILTER_XT_MATCH_HL is not set
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+CONFIG_NF_DEFRAG_IPV4=y
+CONFIG_NF_CONNTRACK_IPV4=y
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=y
+# CONFIG_IP_NF_MATCH_ADDRTYPE is not set
+# CONFIG_IP_NF_MATCH_AH is not set
+# CONFIG_IP_NF_MATCH_ECN is not set
+# CONFIG_IP_NF_MATCH_TTL is not set
+CONFIG_IP_NF_FILTER=y
+# CONFIG_IP_NF_TARGET_REJECT is not set
+CONFIG_IP_NF_TARGET_LOG=y
+# CONFIG_IP_NF_TARGET_ULOG is not set
+CONFIG_NF_NAT=y
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+# CONFIG_IP_NF_TARGET_NETMAP is not set
+# CONFIG_IP_NF_TARGET_REDIRECT is not set
+# CONFIG_NF_NAT_SNMP_BASIC is not set
+# CONFIG_NF_NAT_FTP is not set
+# CONFIG_NF_NAT_IRC is not set
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+# CONFIG_NF_NAT_H323 is not set
+# CONFIG_NF_NAT_SIP is not set
+# CONFIG_IP_NF_MANGLE is not set
+# CONFIG_IP_NF_RAW is not set
+# CONFIG_IP_NF_SECURITY is not set
+# CONFIG_IP_NF_ARPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_NET_TCPPROBE is not set
+# CONFIG_NET_DROP_MONITOR is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT_SYSFS=y
+# CONFIG_LIB80211 is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+
+#
+# Some wireless drivers require a rate control algorithm
+#
+# CONFIG_WIMAX is not set
+CONFIG_RFKILL=y
+# CONFIG_RFKILL_INPUT is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+# CONFIG_DEVTMPFS is not set
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_TESTS is not set
+CONFIG_MTD_CONCAT=y
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_SM_FTL is not set
+CONFIG_MTD_OOPS=y
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+# CONFIG_MTD_CFI_AMDSTD is not set
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PHYSMAP is not set
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SST25L is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_OMAP2=y
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+CONFIG_MTD_ONENAND=y
+CONFIG_MTD_ONENAND_VERIFY_WRITE=y
+# CONFIG_MTD_ONENAND_GENERIC is not set
+CONFIG_MTD_ONENAND_OMAP2=y
+# CONFIG_MTD_ONENAND_OTP is not set
+# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
+# CONFIG_MTD_ONENAND_SIM is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=32768
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+CONFIG_MD=y
+# CONFIG_BLK_DEV_MD is not set
+# CONFIG_BLK_DEV_DM is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_MII=y
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+CONFIG_SMSC_PHY=y
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_BCM63XX_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_MICREL_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_SMSC911X_ARCH_HOOKS is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+CONFIG_NETDEV_1000=y
+# CONFIG_TI_DAVINCI_EMAC is not set
+# CONFIG_TI_DAVINCI_MDIO is not set
+# CONFIG_STMMAC_ETH is not set
+CONFIG_NETDEV_10000=y
+CONFIG_WLAN=y
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_HOSTAP is not set
+CONFIG_WL12XX_PLATFORM_DATA=y
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+CONFIG_USB_USBNET=y
+CONFIG_USB_NET_AX8817X=y
+CONFIG_USB_NET_CDCETHER=y
+# CONFIG_USB_NET_CDC_EEM is not set
+# CONFIG_USB_NET_DM9601 is not set
+# CONFIG_USB_NET_SMSC75XX is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+CONFIG_USB_NET_NET1080=y
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+CONFIG_USB_NET_CDC_SUBSET=y
+CONFIG_USB_ALI_M5632=y
+CONFIG_USB_AN2720=y
+CONFIG_USB_BELKIN=y
+CONFIG_USB_ARMLINUX=y
+CONFIG_USB_EPSON2888=y
+CONFIG_USB_KC2190=y
+CONFIG_USB_NET_ZAURUS=y
+# CONFIG_USB_NET_CX82310_ETH is not set
+# CONFIG_USB_HSO is not set
+# CONFIG_USB_NET_INT51X1 is not set
+# CONFIG_USB_IPHETH is not set
+# CONFIG_USB_SIERRA_NET is not set
+# CONFIG_WAN is not set
+
+#
+# CAIF transport drivers
+#
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+CONFIG_KEYBOARD_TWL4030=y
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_PS2=y
+CONFIG_MOUSE_PS2_ALPS=y
+CONFIG_MOUSE_PS2_LOGIPS2PP=y
+CONFIG_MOUSE_PS2_SYNAPTICS=y
+CONFIG_MOUSE_PS2_TRACKPOINT=y
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_SENTELIC is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_QT602240 is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_TSC2004 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_TWL4030_PWRBUTTON=y
+# CONFIG_INPUT_TWL4030_VIBRA is not set
+CONFIG_INPUT_UINPUT=y
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
+# CONFIG_SERIO_PS2MULT is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_N_GSM is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=32
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_SERIAL_OMAP=y
+CONFIG_SERIAL_OMAP_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_TTY_PRINTK is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_TI81XX_HDMI is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+CONFIG_I2C_OMAP=y
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+CONFIG_SPI_OMAP24XX=y
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+# CONFIG_GPIO_BASIC_MMIO is not set
+# CONFIG_GPIO_IT8761E is not set
+# CONFIG_GPIO_VX855 is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+CONFIG_GPIO_TWL4030=y
+# CONFIG_GPIO_ADP5588 is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_TWL4030 is not set
+CONFIG_HWMON=y
+# CONFIG_HWMON_VID is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+
+#
+# Native drivers
+#
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
+# CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
+# CONFIG_SENSORS_LM73 is not set
+# CONFIG_SENSORS_LM75 is not set
+# CONFIG_SENSORS_LM77 is not set
+# CONFIG_SENSORS_LM78 is not set
+# CONFIG_SENSORS_LM80 is not set
+# CONFIG_SENSORS_LM83 is not set
+# CONFIG_SENSORS_LM85 is not set
+# CONFIG_SENSORS_LM87 is not set
+# CONFIG_SENSORS_LM90 is not set
+# CONFIG_SENSORS_LM92 is not set
+# CONFIG_SENSORS_LM93 is not set
+# CONFIG_SENSORS_LTC4215 is not set
+# CONFIG_SENSORS_LTC4245 is not set
+# CONFIG_SENSORS_LTC4261 is not set
+# CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_MAX1111 is not set
+# CONFIG_SENSORS_MAX1619 is not set
+# CONFIG_SENSORS_MAX6650 is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_SMM665 is not set
+# CONFIG_SENSORS_DME1737 is not set
+# CONFIG_SENSORS_EMC1403 is not set
+# CONFIG_SENSORS_EMC2103 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47M192 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
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
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_OMAP_WATCHDOG=y
+# CONFIG_TWL4030_WATCHDOG is not set
+# CONFIG_MAX63XX_WATCHDOG is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_MFD_SUPPORT=y
+CONFIG_MFD_CORE=y
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+CONFIG_TWL4030_CORE=y
+CONFIG_TWL4030_POWER=y
+CONFIG_TWL4030_CODEC=y
+# CONFIG_TWL6030_PWM is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC35892 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_TPS6586X is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+CONFIG_REGULATOR_DUMMY=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_MAX8649 is not set
+# CONFIG_REGULATOR_MAX8660 is not set
+# CONFIG_REGULATOR_MAX8952 is not set
+CONFIG_REGULATOR_TWL4030=y
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_REGULATOR_LP3972 is not set
+# CONFIG_REGULATOR_TPS65023 is not set
+# CONFIG_REGULATOR_TPS6507X is not set
+# CONFIG_REGULATOR_ISL6271A is not set
+# CONFIG_REGULATOR_AD5398 is not set
+CONFIG_MEDIA_SUPPORT=y
+
+#
+# Multimedia core support
+#
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_DEV=y
+CONFIG_VIDEO_V4L2_COMMON=y
+CONFIG_VIDEO_ALLOW_V4L1=y
+CONFIG_VIDEO_V4L1_COMPAT=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=y
+
+#
+# Multimedia drivers
+#
+# CONFIG_IR_CORE is not set
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
+CONFIG_MEDIA_TUNER_MC44S803=y
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEO_V4L1=y
+CONFIG_VIDEOBUF_GEN=y
+CONFIG_VIDEOBUF_DMA_CONTIG=y
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
+
+#
+# Encoders/decoders and other helper chips
+#
+
+#
+# Audio decoders
+#
+# CONFIG_VIDEO_TVAUDIO is not set
+# CONFIG_VIDEO_TDA7432 is not set
+# CONFIG_VIDEO_TDA9840 is not set
+# CONFIG_VIDEO_TDA9875 is not set
+# CONFIG_VIDEO_TEA6415C is not set
+# CONFIG_VIDEO_TEA6420 is not set
+# CONFIG_VIDEO_MSP3400 is not set
+# CONFIG_VIDEO_CS5345 is not set
+# CONFIG_VIDEO_CS53L32A is not set
+# CONFIG_VIDEO_M52790 is not set
+# CONFIG_VIDEO_TLV320AIC23B is not set
+# CONFIG_VIDEO_WM8775 is not set
+# CONFIG_VIDEO_WM8739 is not set
+# CONFIG_VIDEO_VP27SMPX is not set
+
+#
+# RDS decoders
+#
+# CONFIG_VIDEO_SAA6588 is not set
+
+#
+# Video decoders
+#
+# CONFIG_VIDEO_ADV7180 is not set
+# CONFIG_VIDEO_BT819 is not set
+# CONFIG_VIDEO_BT856 is not set
+# CONFIG_VIDEO_BT866 is not set
+# CONFIG_VIDEO_KS0127 is not set
+# CONFIG_VIDEO_OV7670 is not set
+# CONFIG_VIDEO_MT9T001 is not set
+# CONFIG_VIDEO_MT9V011 is not set
+# CONFIG_VIDEO_MT9V032 is not set
+# CONFIG_VIDEO_MT9V113 is not set
+CONFIG_VIDEO_MT9T111=y
+# CONFIG_VIDEO_TCM825X is not set
+# CONFIG_VIDEO_SAA7110 is not set
+# CONFIG_VIDEO_SAA711X is not set
+# CONFIG_VIDEO_SAA717X is not set
+# CONFIG_VIDEO_SAA7191 is not set
+CONFIG_VIDEO_TVP514X=y
+# CONFIG_VIDEO_TVP5150 is not set
+# CONFIG_VIDEO_TVP7002 is not set
+# CONFIG_VIDEO_VPX3220 is not set
+
+#
+# Video and audio decoders
+#
+# CONFIG_VIDEO_CX25840 is not set
+
+#
+# MPEG video encoders
+#
+# CONFIG_VIDEO_CX2341X is not set
+
+#
+# Video encoders
+#
+# CONFIG_VIDEO_SAA7127 is not set
+# CONFIG_VIDEO_SAA7185 is not set
+# CONFIG_VIDEO_ADV7170 is not set
+# CONFIG_VIDEO_ADV7175 is not set
+# CONFIG_VIDEO_THS7303 is not set
+# CONFIG_VIDEO_ADV7343 is not set
+# CONFIG_VIDEO_AK881X is not set
+
+#
+# Video improvement chips
+#
+# CONFIG_VIDEO_UPD64031A is not set
+# CONFIG_VIDEO_UPD64083 is not set
+# CONFIG_VIDEO_VPSS_SYSTEM is not set
+# CONFIG_VIDEO_VPFE_CAPTURE is not set
+CONFIG_VIDEO_OMAP2_VOUT=y
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_VIDEO_SR030PC30 is not set
+CONFIG_VIDEO_OMAP3=y
+# CONFIG_VIDEO_OMAP3_DEBUG is not set
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
+# CONFIG_USB_GSPCA_KONICA is not set
+# CONFIG_USB_GSPCA_MARS is not set
+# CONFIG_USB_GSPCA_MR97310A is not set
+# CONFIG_USB_GSPCA_OV519 is not set
+# CONFIG_USB_GSPCA_OV534 is not set
+# CONFIG_USB_GSPCA_OV534_9 is not set
+# CONFIG_USB_GSPCA_PAC207 is not set
+# CONFIG_USB_GSPCA_PAC7302 is not set
+# CONFIG_USB_GSPCA_PAC7311 is not set
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
+# CONFIG_USB_GSPCA_TV8532 is not set
+# CONFIG_USB_GSPCA_VC032X is not set
+# CONFIG_USB_GSPCA_XIRLINK_CIT is not set
+# CONFIG_USB_GSPCA_ZC3XX is not set
+# CONFIG_VIDEO_PVRUSB2 is not set
+# CONFIG_VIDEO_HDPVR is not set
+# CONFIG_VIDEO_USBVISION is not set
+# CONFIG_USB_VICAM is not set
+# CONFIG_USB_IBMCAM is not set
+# CONFIG_USB_KONICAWC is not set
+# CONFIG_USB_ET61X251 is not set
+# CONFIG_USB_SE401 is not set
+# CONFIG_USB_SN9C102 is not set
+# CONFIG_USB_PWC is not set
+# CONFIG_USB_ZR364XX is not set
+# CONFIG_USB_STKWEBCAM is not set
+# CONFIG_USB_S2255 is not set
+# CONFIG_V4L_MEM2MEM_DRIVERS is not set
+# CONFIG_RADIO_ADAPTERS is not set
+# CONFIG_DAB is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+CONFIG_FIRMWARE_EDID=y
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_TILEBLITTING=y
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_TMIO is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
+CONFIG_OMAP2_VRAM=y
+CONFIG_OMAP2_VRFB=y
+CONFIG_OMAP2_DSS=y
+CONFIG_OMAP2_VRAM_SIZE=4
+CONFIG_OMAP2_DSS_DEBUG_SUPPORT=y
+# CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS is not set
+CONFIG_OMAP2_DSS_DPI=y
+# CONFIG_OMAP2_DSS_RFBI is not set
+CONFIG_OMAP2_DSS_VENC=y
+CONFIG_OMAP2_VENC_OUT_TYPE_SVIDEO=y
+# CONFIG_OMAP2_VENC_OUT_TYPE_COMPOSITE is not set
+# CONFIG_OMAP2_DSS_SDI is not set
+CONFIG_OMAP2_DSS_DSI=y
+CONFIG_OMAP2_DSS_USE_DSI_PLL=y
+# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
+CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=1
+CONFIG_FB_OMAP2=y
+CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
+CONFIG_FB_OMAP2_NUM_FBS=1
+
+#
+# OMAP2/3 Display Device Drivers
+#
+CONFIG_PANEL_GENERIC=y
+CONFIG_PANEL_SHARP_LS037V7DW01=y
+# CONFIG_PANEL_SHARP_LQ043T1DG01 is not set
+# CONFIG_PANEL_TAAL is not set
+# CONFIG_PANEL_TOPPOLY_TDO35S is not set
+# CONFIG_PANEL_TPO_TD043MTEA1 is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+CONFIG_LCD_PLATFORM=y
+# CONFIG_LCD_S6E63M0 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=m
+# CONFIG_BACKLIGHT_ADP8860 is not set
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE is not set
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=y
+# CONFIG_SOUND_OSS_CORE is not set
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_HWDEP=y
+CONFIG_SND_RAWMIDI=y
+CONFIG_SND_JACK=y
+# CONFIG_SND_SEQUENCER is not set
+# CONFIG_SND_MIXER_OSS is not set
+# CONFIG_SND_PCM_OSS is not set
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=y
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_CAIAQ is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_OMAP_SOC=y
+CONFIG_SND_OMAP_SOC_MCBSP=y
+CONFIG_SND_OMAP_SOC_OMAP3EVM=y
+CONFIG_SND_SOC_I2C_AND_SPI=y
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_TWL4030=y
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_3M_PCT is not set
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX_FF is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CANDO is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EGALAX is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MOSART is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_ROCCAT_KONE is not set
+# CONFIG_HID_ROCCAT_PYRA is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_STANTUM is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_OTG=y
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+CONFIG_USB_EHCI_TT_NEWSCHED=y
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+# CONFIG_USB_OHCI_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+CONFIG_USB_MUSB_HDRC=y
+
+#
+# Platform Glue Layer
+#
+# CONFIG_USB_MUSB_TUSB6010_GLUE is not set
+CONFIG_USB_MUSB_OMAP2PLUS_GLUE=y
+# CONFIG_USB_MUSB_AM35X_GLUE is not set
+# CONFIG_USB_MUSB_DAVINCI is not set
+# CONFIG_USB_MUSB_DA8XX is not set
+# CONFIG_USB_MUSB_TUSB6010 is not set
+CONFIG_USB_MUSB_OMAP2PLUS=y
+# CONFIG_USB_MUSB_AM35X is not set
+# CONFIG_USB_MUSB_TI81XX is not set
+# CONFIG_USB_MUSB_BLACKFIN is not set
+# CONFIG_USB_MUSB_UX500 is not set
+# CONFIG_USB_MUSB_HOST is not set
+# CONFIG_USB_MUSB_PERIPHERAL is not set
+CONFIG_USB_MUSB_OTG=y
+CONFIG_USB_GADGET_MUSB_HDRC=y
+CONFIG_USB_MUSB_HDRC_HCD=y
+# CONFIG_MUSB_PIO_ONLY is not set
+CONFIG_USB_INVENTRA_DMA_HW=y
+# CONFIG_USB_TI_CPPI_DMA_HW is not set
+# CONFIG_USB_TI_CPPI41_DMA_HW is not set
+CONFIG_USB_INVENTRA_DMA=y
+CONFIG_MUSB_USE_SYSTEM_DMA_WORKAROUND=y
+# CONFIG_USB_TI_CPPI_DMA is not set
+# CONFIG_USB_TI_CPPI41_DMA is not set
+# CONFIG_USB_TUSB_OMAP_DMA is not set
+CONFIG_USB_MUSB_DEBUG=y
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_UAS is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+CONFIG_USB_TEST=y
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_R8A66597 is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=y
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_ETH_EEM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FUNCTIONFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_MASS_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_MULTI is not set
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_DBGP is not set
+# CONFIG_USB_G_WEBCAM is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_ISP1301_OMAP is not set
+# CONFIG_USB_ULPI is not set
+# CONFIG_TWL4030_USB is not set
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+CONFIG_SDIO_UART=y
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+CONFIG_MMC_OMAP=y
+CONFIG_MMC_OMAP_HS=y
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+CONFIG_RTC_DRV_TWL4030=y
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+# CONFIG_RTC_DRV_PCF2123 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+# CONFIG_STAGING is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
+# CONFIG_EXT3_FS_XATTR is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=y
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+CONFIG_QUOTA=y
+# CONFIG_QUOTA_NETLINK_INTERFACE is not set
+CONFIG_PRINT_QUOTA_WARNING=y
+# CONFIG_QUOTA_DEBUG is not set
+CONFIG_QUOTA_TREE=y
+# CONFIG_QFMT_V1 is not set
+CONFIG_QFMT_V2=y
+CONFIG_QUOTACTL=y
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
+CONFIG_JFFS2_FS_POSIX_ACL=y
+CONFIG_JFFS2_FS_SECURITY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RTIME=y
+CONFIG_JFFS2_RUBIN=y
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+CONFIG_RPCSEC_GSS_KRB5=y
+# CONFIG_CEPH_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=y
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+CONFIG_SCHED_DEBUG=y
+CONFIG_SCHEDSTATS=y
+CONFIG_TIMER_STATS=y
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_BKL=y
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_PROVE_LOCKING=y
+# CONFIG_PROVE_RCU is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+CONFIG_LOCKDEP=y
+CONFIG_LOCK_STAT=y
+# CONFIG_DEBUG_LOCKDEP is not set
+CONFIG_TRACE_IRQFLAGS=y
+CONFIG_DEBUG_SPINLOCK_SLEEP=y
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+CONFIG_STACKTRACE=y
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_INFO_REDUCED is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_KPROBES_SANITY_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+# CONFIG_PAGE_POISONING is not set
+CONFIG_NOP_TRACER=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_RING_BUFFER=y
+CONFIG_EVENT_TRACING=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+CONFIG_KPROBE_EVENT=y
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=y
+# CONFIG_EARLY_PRINTK is not set
+# CONFIG_DEBUG_ICEDCC is not set
+# CONFIG_OC_ETM is not set
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+CONFIG_SECURITY=y
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_NETWORK is not set
+# CONFIG_SECURITY_PATH is not set
+# CONFIG_SECURITY_TOMOYO is not set
+# CONFIG_SECURITY_APPARMOR is not set
+# CONFIG_IMA is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=y
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=y
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MICHAEL_MIC=y
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=y
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=y
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=y
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_CRYPTO_DEV_OMAP_SHAM is not set
+# CONFIG_CRYPTO_DEV_OMAP_AES is not set
+
+#
+# OCF Configuration
+#
+CONFIG_OCF_OCF=y
+CONFIG_OCF_RANDOMHARVEST=y
+CONFIG_OCF_FIPS=y
+CONFIG_OCF_CRYPTODEV=m
+# CONFIG_OCF_CRYPTOSOFT is not set
+# CONFIG_OCF_BENCH is not set
+CONFIG_BINARY_PRINTF=y
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=y
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
new file mode 100644
index 0000000..bafeba5
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -0,0 +1,89 @@
+require linux.inc
+
+DESCRIPTION = "Linux kernel for OMAP3 EVM from PSP, based on linux-omap3 kernel"
+
+COMPATIBLE_MACHINE = "omap3"
+
+SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
+
+SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
+           file://defconfig"
+
+# The following patches below have been upstreamed to linux kernel 2.6.39 tree
+# and will not be needed once we move to this kernel.
+# The only exception is "0002-allow-selecting-WL12XX_PLATFROM_DATA-independently.patch"
+# which is needed for building against a compat-wireless package
+SRC_URI += " \
+    file://0001-linux-omap3-Add-OCF-support-to-2.6.37-kernel.patch \
+    file://0001-omap3evm-add-support-for-the-WL12xx-WLAN-module.patch \
+    file://0002-allow-selecting-WL12XX_PLATFROM_DATA-independently.patch \
+    file://0003-mmc-skip-detection-of-nonremovable-cards-on-rescan.patch \
+    file://0004-mmc-sdio-don-t-reinitialize-nonremovable-powered-res.patch \
+    file://0005-mmc-sdio-don-t-power-up-cards-on-system-suspend.patch \
+    file://0006-wl12xx-Backport-wl12xx-platform-data.patch \
+    file://0007-activate-wireless-extensions.patch \
+"
+
+# Update the kernel to support suspend/resume when the file system is located
+# on the SD card.  This is also being submitted to the PSP team for inclusion
+# in future releases.
+SRC_URI += " \
+    file://0001-Fix-matrix-suspend.patch \
+"
+
+# Update the OCF kernel patch to remove non-existing components for
+# non-TI hardware.  This allows the make clean target to work.
+# Update the defconfig for omap3 to enable OCF and WLAN by default
+SRC_URI += " \
+    file://0001-OCF-support-remove-support-for-non-TI-hardware.patch \
+    file://0002-omap3_evm_defconfig-add-OCF-driver-support.patch \
+    file://0003-omap3_evm_defconfig-add-WLAN-config-options.patch \
+"
+
+# Enable clock pad register in mt9t111 sensor driver. This fixes the issue where
+# sensor sync pulses were not generated during first loopback after boot-up.
+SRC_URI += " \
+    file://0001-mt9t111-enable-clock-pad-register-in-configuration.patch \
+"
+
+# The following patches add support for wake on wlan (WoWlan)
+# which is supported in nlcp R4 release
+SRC_URI += "file://0001-omap3evm-add-wake-on-wlan-support.patch \
+    file://0001-nlcp-sdio-fixes-for-wowlan-support.patch \
+    file://0002-mmc-sdio-support-suspend-resume-while-runtime-suspen.patch \
+    file://0003-mmc_card_keep_power-cleanups.patch \
+    file://0004-mmc-do-not-switch-to-1-bit-mode-if-not-required.patch \
+    file://0005-mmc-fix-division-by-zero-in-MMC-core.patch \
+    file://0006-revert-duplicate-insertion-of-mmc_card_keep_power-fu.patch \
+"
+
+# The following patches allow for NOR to be enabled and built
+# easily.
+SRC_URI += " \
+    file://0001-omap3-am3517evm-Allow-for-NAND-to-really-be-disabled.patch \
+    file://0002-omap3-am3517evm-Update-NOR-partition-table.patch \
+    file://0003-AM3517-Add-am3517_evn_nor_defconfig.patch \
+"
+
+# The following patch sets the dto timeout for SD cards to the max of 14.
+# This has been found to make SD cards work more reliably in the omap3 systems
+SRC_URI += " \
+    file://0001-omap_hsmmc-make-default-dto-value-14.patch \
+"
+
+# Add ABB support to the Linux kernel to enable 1GHz OPP and to allow
+# booting at 1GHz
+SRC_URI += " \
+    file://0001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch \
+"
+
+# Fix USB role switching when leaving USB cable connected
+SRC_URI += " \
+    file://0001-usb-musb-am35x-set-default-VBUS-timeout-value.patch \
+    file://0002-usb-musb-am35x-fix-role-switching-issue.patch \
+"
+
+# Updated PIO mode for MUSB help description
+SRC_URI_append_am3517-evm = " file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
+
+S = "${WORKDIR}/git"
-- 
1.7.12.4


