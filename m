Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B03C3E014D5
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 09:21:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MGLwow030709
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 11:21:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MGLwqM009716
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 11:21:58 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 11:21:58 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MGLpaB001894;
	Mon, 22 Apr 2013 11:21:56 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 Apr 2013 11:21:41 -0500
Message-ID: <1366647702-24282-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366647702-24282-1-git-send-email-fcooper@ti.com>
References: <1366647702-24282-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] linux-am335x: Update to latest 3.2 kernel release
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
X-List-Received-Date: Mon, 22 Apr 2013 16:22:00 -0000
Content-Type: text/plain

* Update to the latest PSP release (version 04.06.00.10) of the 3.2 kernel.
* Rename recipe to match meta-ti kernel recipe naming convention.
* Use in tree defconfig instead of providing a separate defconfig. These
  defconfigs were the same anyway.
* Add additional crypto patches that were needed to fix suspend and resume
  issues.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux-am335x-3.2.0-psp04.06.00.08/defconfig    | 2656 --------------------
 ...0-psp04.06.00.08.bb => linux-am335x-psp-3.2.bb} |   31 +-
 ...hwmod-Convert-SHA0-crypto-device-data-to-.patch |  168 ++
 ...-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch |   40 +
 ...odified-WLAN-enable-and-irq-to-match-boar.patch |    0
 ...x-Add-crypto-driver-settings-to-defconfig.patch |   36 +-
 ...m335x-Add-pm_runtime-API-to-crypto-driver.patch |    0
 ...x-enable-pullup-on-the-WLAN-enable-pin-fo.patch |    0
 ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |    0
 ...-using-edge-triggered-interrupts-for-WLAN.patch |    0
 ...x-Add-memory-addresses-for-crypto-modules.patch |    0
 .../0001-am33xx-Add-SmartReflex-support.patch      |    0
 .../0001-mach-omap2-pm33xx-Disable-VT-switch.patch |    0
 ...date-PIO-mode-help-information-in-Kconfig.patch |    0
 ...1-omap-serial-add-delay-before-suspending.patch |    0
 ...emove-check-for-GP-only-device-type-in-RN.patch |   29 +
 .../0002-AM335x-OCF-Driver-for-Linux-3.patch       |    0
 .../0002-Smartreflex-limited-to-ES-1.0.patch       |   35 +
 ...-suspend-resume-routines-to-crypto-driver.patch |    0
 ...Add-crypto-device-and-resource-structures.patch |    0
 ...2-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch |    0
 ...map4-sham-Use-finer-grained-PM-management.patch |   98 +
 ...rypto-device-and-resource-structure-for-T.patch |    0
 ...-omap4-sham-Add-suspend-resume-PM-support.patch |   56 +
 ...d-crypto-drivers-to-Kconfig-and-Makefiles.patch |    0
 ...ap4-sham-Don-t-use-hardcoded-base-address.patch |   45 +
 ...hwmod-Convert-AES0-crypto-device-data-to-.patch |  165 ++
 ...eate-header-file-for-OMAP4-crypto-modules.patch |    0
 ...m33x-Create-driver-for-TRNG-crypto-module.patch |    0
 ...map4-aes-User-finer-grained-PM-management.patch |  127 +
 ...am33x-Create-driver-for-AES-crypto-module.patch |    0
 ...o-omap4-aes-Add-suspend-resume-PM-support.patch |   56 +
 ...x-Create-driver-for-SHA-MD5-crypto-module.patch |    0
 ...map4-aes-Don-t-use-hardcoded-base-address.patch |   45 +
 ...xx-hwmod-Convert-RNG-device-data-to-hwmod.patch |  176 ++
 ...g-omap4-rng-Convert-to-use-pm_runtime-API.patch |   91 +
 .../linux/linux-am335x-psp-3.2/defconfig           |    1 +
 37 files changed, 1174 insertions(+), 2681 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/defconfig
 rename recipes-kernel/linux/{linux-am335x_3.2.0-psp04.06.00.08.bb => linux-am335x-psp-3.2.bb} (68%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch (83%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am33x-Add-memory-addresses-for-crypto-modules.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-am33xx-Add-SmartReflex-support.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-mach-omap2-pm33xx-Disable-VT-switch.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0001-omap-serial-add-delay-before-suspending.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0002-AM335x-OCF-Driver-for-Linux-3.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0002-Smartreflex-limited-to-ES-1.0.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0002-am33x-Add-crypto-device-and-resource-structures.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch (100%)
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0006-am33x-Create-driver-for-TRNG-crypto-module.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0007-am33x-Create-driver-for-AES-crypto-module.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch
 rename recipes-kernel/linux/{linux-am335x-3.2.0-psp04.06.00.08 => linux-am335x-psp-3.2}/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch (100%)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/defconfig

diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/defconfig b/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/defconfig
deleted file mode 100644
index 30223ae..0000000
--- a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/defconfig
+++ /dev/null
@@ -1,2656 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.2.0 Kernel Configuration
-#
-CONFIG_ARM=y
-CONFIG_HAVE_PWM=y
-CONFIG_SYS_SUPPORTS_APM_EMULATION=y
-CONFIG_HAVE_SCHED_CLOCK=y
-CONFIG_GENERIC_GPIO=y
-# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
-CONFIG_GENERIC_CLOCKEVENTS=y
-CONFIG_KTIME_SCALAR=y
-CONFIG_HAVE_PROC_CPU=y
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_HAVE_LATENCYTOP_SUPPORT=y
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_HARDIRQS_SW_RESEND=y
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_RWSEM_GENERIC_SPINLOCK=y
-CONFIG_ARCH_HAS_CPUFREQ=y
-CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_NEED_DMA_MAP_STATE=y
-CONFIG_VECTORS_BASE=0xffff0000
-CONFIG_ARM_PATCH_PHYS_VIRT=y
-CONFIG_GENERIC_BUG=y
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_HAVE_IRQ_WORK=y
-
-#
-# General setup
-#
-CONFIG_EXPERIMENTAL=y
-CONFIG_BROKEN_ON_SMP=y
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_CROSS_COMPILE=""
-CONFIG_LOCALVERSION=""
-CONFIG_LOCALVERSION_AUTO=y
-CONFIG_HAVE_KERNEL_GZIP=y
-CONFIG_HAVE_KERNEL_LZMA=y
-CONFIG_HAVE_KERNEL_LZO=y
-CONFIG_KERNEL_GZIP=y
-# CONFIG_KERNEL_LZMA is not set
-# CONFIG_KERNEL_LZO is not set
-CONFIG_DEFAULT_HOSTNAME="(none)"
-CONFIG_SWAP=y
-CONFIG_SYSVIPC=y
-CONFIG_SYSVIPC_SYSCTL=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_POSIX_MQUEUE_SYSCTL=y
-CONFIG_BSD_PROCESS_ACCT=y
-# CONFIG_BSD_PROCESS_ACCT_V3 is not set
-# CONFIG_FHANDLE is not set
-# CONFIG_TASKSTATS is not set
-# CONFIG_AUDIT is not set
-CONFIG_HAVE_GENERIC_HARDIRQS=y
-
-#
-# IRQ subsystem
-#
-CONFIG_GENERIC_HARDIRQS=y
-CONFIG_HAVE_SPARSE_IRQ=y
-CONFIG_GENERIC_IRQ_SHOW=y
-CONFIG_GENERIC_IRQ_CHIP=y
-CONFIG_IRQ_DOMAIN=y
-# CONFIG_SPARSE_IRQ is not set
-
-#
-# RCU Subsystem
-#
-CONFIG_TINY_RCU=y
-# CONFIG_PREEMPT_RCU is not set
-# CONFIG_RCU_TRACE is not set
-# CONFIG_TREE_RCU_TRACE is not set
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-# CONFIG_CGROUPS is not set
-CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_IPC_NS=y
-CONFIG_USER_NS=y
-CONFIG_PID_NS=y
-CONFIG_NET_NS=y
-# CONFIG_SCHED_AUTOGROUP is not set
-# CONFIG_SYSFS_DEPRECATED is not set
-# CONFIG_RELAY is not set
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
-CONFIG_RD_GZIP=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_RD_XZ=y
-CONFIG_RD_LZO=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SYSCTL=y
-CONFIG_ANON_INODES=y
-# CONFIG_EXPERT is not set
-CONFIG_UID16=y
-# CONFIG_SYSCTL_SYSCALL is not set
-CONFIG_KALLSYMS=y
-CONFIG_HOTPLUG=y
-CONFIG_PRINTK=y
-CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
-CONFIG_FUTEX=y
-CONFIG_EPOLL=y
-CONFIG_SIGNALFD=y
-CONFIG_TIMERFD=y
-CONFIG_EVENTFD=y
-CONFIG_SHMEM=y
-CONFIG_AIO=y
-# CONFIG_EMBEDDED is not set
-CONFIG_HAVE_PERF_EVENTS=y
-CONFIG_PERF_USE_VMALLOC=y
-
-#
-# Kernel Performance Events And Counters
-#
-# CONFIG_PERF_EVENTS is not set
-# CONFIG_PERF_COUNTERS is not set
-CONFIG_VM_EVENT_COUNTERS=y
-CONFIG_COMPAT_BRK=y
-CONFIG_SLAB=y
-# CONFIG_SLUB is not set
-CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
-CONFIG_HAVE_OPROFILE=y
-# CONFIG_KPROBES is not set
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
-CONFIG_HAVE_CLK=y
-CONFIG_HAVE_DMA_API_DEBUG=y
-
-#
-# GCOV-based kernel profiling
-#
-# CONFIG_GCOV_KERNEL is not set
-CONFIG_HAVE_GENERIC_DMA_COHERENT=y
-CONFIG_SLABINFO=y
-CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-CONFIG_BLOCK=y
-CONFIG_LBDAF=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_BLK_DEV_BSGLIB is not set
-# CONFIG_BLK_DEV_INTEGRITY is not set
-
-#
-# IO Schedulers
-#
-CONFIG_IOSCHED_NOOP=y
-CONFIG_IOSCHED_DEADLINE=y
-CONFIG_IOSCHED_CFQ=y
-# CONFIG_DEFAULT_DEADLINE is not set
-CONFIG_DEFAULT_CFQ=y
-# CONFIG_DEFAULT_NOOP is not set
-CONFIG_DEFAULT_IOSCHED="cfq"
-# CONFIG_INLINE_SPIN_TRYLOCK is not set
-# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
-# CONFIG_INLINE_SPIN_LOCK is not set
-# CONFIG_INLINE_SPIN_LOCK_BH is not set
-# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
-# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
-CONFIG_INLINE_SPIN_UNLOCK=y
-# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
-CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
-# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
-# CONFIG_INLINE_READ_TRYLOCK is not set
-# CONFIG_INLINE_READ_LOCK is not set
-# CONFIG_INLINE_READ_LOCK_BH is not set
-# CONFIG_INLINE_READ_LOCK_IRQ is not set
-# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
-CONFIG_INLINE_READ_UNLOCK=y
-# CONFIG_INLINE_READ_UNLOCK_BH is not set
-CONFIG_INLINE_READ_UNLOCK_IRQ=y
-# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
-# CONFIG_INLINE_WRITE_TRYLOCK is not set
-# CONFIG_INLINE_WRITE_LOCK is not set
-# CONFIG_INLINE_WRITE_LOCK_BH is not set
-# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
-# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
-CONFIG_INLINE_WRITE_UNLOCK=y
-# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
-CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
-# CONFIG_MUTEX_SPIN_ON_OWNER is not set
-CONFIG_FREEZER=y
-
-#
-# System Type
-#
-CONFIG_MMU=y
-# CONFIG_ARCH_INTEGRATOR is not set
-# CONFIG_ARCH_REALVIEW is not set
-# CONFIG_ARCH_VERSATILE is not set
-# CONFIG_ARCH_VEXPRESS is not set
-# CONFIG_ARCH_AT91 is not set
-# CONFIG_ARCH_BCMRING is not set
-# CONFIG_ARCH_HIGHBANK is not set
-# CONFIG_ARCH_CLPS711X is not set
-# CONFIG_ARCH_CNS3XXX is not set
-# CONFIG_ARCH_GEMINI is not set
-# CONFIG_ARCH_PRIMA2 is not set
-# CONFIG_ARCH_EBSA110 is not set
-# CONFIG_ARCH_EP93XX is not set
-# CONFIG_ARCH_FOOTBRIDGE is not set
-# CONFIG_ARCH_MXC is not set
-# CONFIG_ARCH_MXS is not set
-# CONFIG_ARCH_NETX is not set
-# CONFIG_ARCH_H720X is not set
-# CONFIG_ARCH_IOP13XX is not set
-# CONFIG_ARCH_IOP32X is not set
-# CONFIG_ARCH_IOP33X is not set
-# CONFIG_ARCH_IXP23XX is not set
-# CONFIG_ARCH_IXP2000 is not set
-# CONFIG_ARCH_IXP4XX is not set
-# CONFIG_ARCH_DOVE is not set
-# CONFIG_ARCH_KIRKWOOD is not set
-# CONFIG_ARCH_LPC32XX is not set
-# CONFIG_ARCH_MV78XX0 is not set
-# CONFIG_ARCH_ORION5X is not set
-# CONFIG_ARCH_MMP is not set
-# CONFIG_ARCH_KS8695 is not set
-# CONFIG_ARCH_W90X900 is not set
-# CONFIG_ARCH_TEGRA is not set
-# CONFIG_ARCH_PICOXCELL is not set
-# CONFIG_ARCH_PNX4008 is not set
-# CONFIG_ARCH_PXA is not set
-# CONFIG_ARCH_MSM is not set
-# CONFIG_ARCH_SHMOBILE is not set
-# CONFIG_ARCH_RPC is not set
-# CONFIG_ARCH_SA1100 is not set
-# CONFIG_ARCH_S3C2410 is not set
-# CONFIG_ARCH_S3C64XX is not set
-# CONFIG_ARCH_S5P64X0 is not set
-# CONFIG_ARCH_S5PC100 is not set
-# CONFIG_ARCH_S5PV210 is not set
-# CONFIG_ARCH_EXYNOS is not set
-# CONFIG_ARCH_SHARK is not set
-# CONFIG_ARCH_TCC_926 is not set
-# CONFIG_ARCH_U300 is not set
-# CONFIG_ARCH_U8500 is not set
-# CONFIG_ARCH_NOMADIK is not set
-# CONFIG_ARCH_DAVINCI is not set
-CONFIG_ARCH_OMAP=y
-# CONFIG_PLAT_SPEAR is not set
-# CONFIG_ARCH_VT8500 is not set
-# CONFIG_ARCH_ZYNQ is not set
-# CONFIG_GPIO_PCA953X is not set
-# CONFIG_KEYBOARD_GPIO_POLLED is not set
-
-#
-# TI OMAP Common Features
-#
-# CONFIG_ARCH_OMAP1 is not set
-CONFIG_ARCH_OMAP2PLUS=y
-
-#
-# OMAP Feature Selections
-#
-CONFIG_AM33XX_SMARTREFLEX=y
-# CONFIG_OMAP_SMARTREFLEX is not set
-CONFIG_OMAP_RESET_CLOCKS=y
-CONFIG_OMAP_MUX=y
-CONFIG_OMAP_MUX_DEBUG=y
-CONFIG_OMAP_MUX_WARNINGS=y
-# CONFIG_OMAP_MCBSP is not set
-CONFIG_OMAP_MBOX_FWK=y
-CONFIG_OMAP_MBOX_KFIFO_SIZE=256
-# CONFIG_OMAP_32K_TIMER is not set
-# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
-CONFIG_OMAP_DM_TIMER=y
-CONFIG_OMAP_PM_NOOP=y
-CONFIG_MACH_OMAP_GENERIC=y
-
-#
-# TI OMAP2/3/4 Specific Features
-#
-CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
-# CONFIG_ARCH_OMAP2 is not set
-CONFIG_ARCH_OMAP3=y
-# CONFIG_ARCH_OMAP4 is not set
-# CONFIG_SOC_OMAP3430 is not set
-CONFIG_SOC_OMAPTI81XX=y
-CONFIG_SOC_OMAPAM33XX=y
-CONFIG_OMAP_PACKAGE_CBB=y
-
-#
-# OMAP Board Type
-#
-CONFIG_MACH_OMAP3_BEAGLE=y
-# CONFIG_MACH_DEVKIT8000 is not set
-# CONFIG_MACH_OMAP_LDP is not set
-# CONFIG_MACH_OMAP3530_LV_SOM is not set
-# CONFIG_MACH_OMAP3_TORPEDO is not set
-# CONFIG_MACH_ENCORE is not set
-# CONFIG_MACH_OVERO is not set
-# CONFIG_MACH_OMAP3EVM is not set
-# CONFIG_MACH_OMAP3517EVM is not set
-# CONFIG_MACH_CRANEBOARD is not set
-# CONFIG_MACH_OMAP3_PANDORA is not set
-# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
-# CONFIG_MACH_OMAP_3430SDP is not set
-# CONFIG_MACH_NOKIA_RM680 is not set
-# CONFIG_MACH_NOKIA_RX51 is not set
-# CONFIG_MACH_OMAP_ZOOM2 is not set
-# CONFIG_MACH_OMAP_ZOOM3 is not set
-# CONFIG_MACH_CM_T35 is not set
-# CONFIG_MACH_CM_T3517 is not set
-# CONFIG_MACH_IGEP0020 is not set
-# CONFIG_MACH_IGEP0030 is not set
-# CONFIG_MACH_SBC3530 is not set
-# CONFIG_MACH_OMAP_3630SDP is not set
-CONFIG_MACH_TI8168EVM=y
-CONFIG_MACH_TI8148EVM=y
-CONFIG_MACH_AM335XEVM=y
-CONFIG_MACH_AM335XIAEVM=y
-# CONFIG_OMAP3_EMU is not set
-CONFIG_TI_PM_DISABLE_VT_SWITCH=y
-# CONFIG_OMAP3_SDRC_AC_TIMING is not set
-CONFIG_OMAP3_EDMA=y
-
-#
-# System MMU
-#
-
-#
-# Processor Type
-#
-CONFIG_CPU_V7=y
-CONFIG_CPU_32v6K=y
-CONFIG_CPU_32v7=y
-CONFIG_CPU_ABRT_EV7=y
-CONFIG_CPU_PABRT_V7=y
-CONFIG_CPU_CACHE_V7=y
-CONFIG_CPU_CACHE_VIPT=y
-CONFIG_CPU_COPY_V6=y
-CONFIG_CPU_TLB_V7=y
-CONFIG_CPU_HAS_ASID=y
-CONFIG_CPU_CP15=y
-CONFIG_CPU_CP15_MMU=y
-
-#
-# Processor Features
-#
-CONFIG_ARM_THUMB=y
-CONFIG_ARM_THUMBEE=y
-# CONFIG_SWP_EMULATE is not set
-# CONFIG_CPU_ICACHE_DISABLE is not set
-# CONFIG_CPU_DCACHE_DISABLE is not set
-# CONFIG_CPU_BPREDICT_DISABLE is not set
-CONFIG_ARM_L1_CACHE_SHIFT_6=y
-CONFIG_ARM_L1_CACHE_SHIFT=6
-CONFIG_ARM_DMA_MEM_BUFFERABLE=y
-CONFIG_MULTI_IRQ_HANDLER=y
-# CONFIG_ARM_ERRATA_430973 is not set
-# CONFIG_ARM_ERRATA_458693 is not set
-# CONFIG_ARM_ERRATA_460075 is not set
-# CONFIG_ARM_ERRATA_720789 is not set
-# CONFIG_ARM_ERRATA_743622 is not set
-# CONFIG_ARM_ERRATA_751472 is not set
-# CONFIG_ARM_ERRATA_754322 is not set
-
-#
-# Bus support
-#
-# CONFIG_PCI_SYSCALL is not set
-# CONFIG_ARCH_SUPPORTS_MSI is not set
-# CONFIG_PCCARD is not set
-
-#
-# Kernel Features
-#
-CONFIG_TICK_ONESHOT=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
-CONFIG_VMSPLIT_3G=y
-# CONFIG_VMSPLIT_2G is not set
-# CONFIG_VMSPLIT_1G is not set
-CONFIG_PAGE_OFFSET=0xC0000000
-CONFIG_PREEMPT_NONE=y
-# CONFIG_PREEMPT_VOLUNTARY is not set
-# CONFIG_PREEMPT is not set
-CONFIG_HZ=100
-# CONFIG_THUMB2_KERNEL is not set
-CONFIG_AEABI=y
-CONFIG_OABI_COMPAT=y
-CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
-# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
-# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
-CONFIG_HAVE_ARCH_PFN_VALID=y
-# CONFIG_HIGHMEM is not set
-CONFIG_SELECT_MEMORY_MODEL=y
-CONFIG_FLATMEM_MANUAL=y
-CONFIG_FLATMEM=y
-CONFIG_FLAT_NODE_MEM_MAP=y
-CONFIG_HAVE_MEMBLOCK=y
-CONFIG_PAGEFLAGS_EXTENDED=y
-CONFIG_SPLIT_PTLOCK_CPUS=4
-# CONFIG_COMPACTION is not set
-# CONFIG_PHYS_ADDR_T_64BIT is not set
-CONFIG_ZONE_DMA_FLAG=0
-CONFIG_VIRT_TO_BUS=y
-# CONFIG_KSM is not set
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-CONFIG_NEED_PER_CPU_KM=y
-# CONFIG_CLEANCACHE is not set
-CONFIG_FORCE_MAX_ZONEORDER=11
-# CONFIG_LEDS is not set
-CONFIG_ALIGNMENT_TRAP=y
-# CONFIG_UACCESS_WITH_MEMCPY is not set
-# CONFIG_SECCOMP is not set
-# CONFIG_CC_STACKPROTECTOR is not set
-# CONFIG_DEPRECATED_PARAM_STRUCT is not set
-
-#
-# Boot options
-#
-CONFIG_USE_OF=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-# CONFIG_ARM_APPENDED_DTB is not set
-CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO0,115200"
-CONFIG_CMDLINE_FROM_BOOTLOADER=y
-# CONFIG_CMDLINE_EXTEND is not set
-# CONFIG_CMDLINE_FORCE is not set
-# CONFIG_XIP_KERNEL is not set
-# CONFIG_KEXEC is not set
-# CONFIG_CRASH_DUMP is not set
-# CONFIG_AUTO_ZRELADDR is not set
-
-#
-# CPU Power Management
-#
-
-#
-# CPU Frequency scaling
-#
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_TABLE=y
-CONFIG_CPU_FREQ_STAT=y
-CONFIG_CPU_FREQ_STAT_DETAILS=y
-# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_POWERSAVE=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
-
-#
-# ARM CPU frequency scaling drivers
-#
-CONFIG_CPU_IDLE=y
-CONFIG_CPU_IDLE_GOV_LADDER=y
-CONFIG_CPU_IDLE_GOV_MENU=y
-
-#
-# Floating point emulation
-#
-
-#
-# At least one emulation must be selected
-#
-CONFIG_FPE_NWFPE=y
-# CONFIG_FPE_NWFPE_XP is not set
-# CONFIG_FPE_FASTFPE is not set
-CONFIG_VFP=y
-CONFIG_VFPv3=y
-CONFIG_NEON=y
-
-#
-# Userspace binary formats
-#
-CONFIG_BINFMT_ELF=y
-CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
-CONFIG_HAVE_AOUT=y
-# CONFIG_BINFMT_AOUT is not set
-CONFIG_BINFMT_MISC=y
-
-#
-# Power management options
-#
-CONFIG_SUSPEND=y
-CONFIG_SUSPEND_FREEZER=y
-CONFIG_PM_SLEEP=y
-CONFIG_PM_RUNTIME=y
-CONFIG_PM=y
-CONFIG_PM_DEBUG=y
-CONFIG_PM_ADVANCED_DEBUG=y
-# CONFIG_PM_TEST_SUSPEND is not set
-CONFIG_CAN_PM_TRACE=y
-# CONFIG_APM_EMULATION is not set
-CONFIG_ARCH_HAS_OPP=y
-CONFIG_PM_OPP=y
-CONFIG_PM_CLK=y
-CONFIG_CPU_PM=y
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-CONFIG_ARM_CPU_SUSPEND=y
-CONFIG_NET=y
-
-#
-# Networking options
-#
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-# CONFIG_NET_KEY is not set
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-# CONFIG_IP_ADVANCED_ROUTER is not set
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-# CONFIG_NET_IPIP is not set
-# CONFIG_NET_IPGRE_DEMUX is not set
-# CONFIG_IP_MROUTE is not set
-# CONFIG_ARPD is not set
-# CONFIG_SYN_COOKIES is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_TCP_CONG_ADVANCED is not set
-CONFIG_TCP_CONG_CUBIC=y
-CONFIG_DEFAULT_TCP_CONG="cubic"
-# CONFIG_TCP_MD5SIG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_NETLABEL is not set
-# CONFIG_NETWORK_SECMARK is not set
-# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
-CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_DEBUG is not set
-CONFIG_NETFILTER_ADVANCED=y
-
-#
-# Core Netfilter Configuration
-#
-# CONFIG_NETFILTER_NETLINK_QUEUE is not set
-# CONFIG_NETFILTER_NETLINK_LOG is not set
-CONFIG_NF_CONNTRACK=y
-# CONFIG_NF_CONNTRACK_MARK is not set
-# CONFIG_NF_CONNTRACK_EVENTS is not set
-# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
-# CONFIG_NF_CT_PROTO_DCCP is not set
-# CONFIG_NF_CT_PROTO_SCTP is not set
-# CONFIG_NF_CT_PROTO_UDPLITE is not set
-# CONFIG_NF_CONNTRACK_AMANDA is not set
-# CONFIG_NF_CONNTRACK_FTP is not set
-# CONFIG_NF_CONNTRACK_H323 is not set
-# CONFIG_NF_CONNTRACK_IRC is not set
-# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
-# CONFIG_NF_CONNTRACK_SNMP is not set
-# CONFIG_NF_CONNTRACK_PPTP is not set
-# CONFIG_NF_CONNTRACK_SANE is not set
-# CONFIG_NF_CONNTRACK_SIP is not set
-# CONFIG_NF_CONNTRACK_TFTP is not set
-# CONFIG_NF_CT_NETLINK is not set
-CONFIG_NETFILTER_XTABLES=y
-
-#
-# Xtables combined modules
-#
-# CONFIG_NETFILTER_XT_MARK is not set
-# CONFIG_NETFILTER_XT_CONNMARK is not set
-
-#
-# Xtables targets
-#
-# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
-# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
-# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
-# CONFIG_NETFILTER_XT_TARGET_LED is not set
-# CONFIG_NETFILTER_XT_TARGET_MARK is not set
-# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
-# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
-# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
-# CONFIG_NETFILTER_XT_TARGET_TEE is not set
-# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
-
-#
-# Xtables matches
-#
-# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
-# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
-# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
-# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
-# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
-# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
-# CONFIG_NETFILTER_XT_MATCH_CPU is not set
-# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
-# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
-# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
-# CONFIG_NETFILTER_XT_MATCH_ESP is not set
-# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
-# CONFIG_NETFILTER_XT_MATCH_HL is not set
-# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
-# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
-# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_MAC is not set
-# CONFIG_NETFILTER_XT_MATCH_MARK is not set
-# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
-# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
-# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
-# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
-# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
-# CONFIG_NETFILTER_XT_MATCH_REALM is not set
-# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
-# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
-# CONFIG_NETFILTER_XT_MATCH_STATE is not set
-# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
-# CONFIG_NETFILTER_XT_MATCH_STRING is not set
-# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
-# CONFIG_NETFILTER_XT_MATCH_TIME is not set
-# CONFIG_NETFILTER_XT_MATCH_U32 is not set
-# CONFIG_IP_VS is not set
-
-#
-# IP: Netfilter Configuration
-#
-CONFIG_NF_DEFRAG_IPV4=y
-CONFIG_NF_CONNTRACK_IPV4=y
-CONFIG_NF_CONNTRACK_PROC_COMPAT=y
-# CONFIG_IP_NF_QUEUE is not set
-CONFIG_IP_NF_IPTABLES=y
-# CONFIG_IP_NF_MATCH_AH is not set
-# CONFIG_IP_NF_MATCH_ECN is not set
-# CONFIG_IP_NF_MATCH_TTL is not set
-CONFIG_IP_NF_FILTER=y
-# CONFIG_IP_NF_TARGET_REJECT is not set
-CONFIG_IP_NF_TARGET_LOG=y
-# CONFIG_IP_NF_TARGET_ULOG is not set
-CONFIG_NF_NAT=y
-CONFIG_NF_NAT_NEEDED=y
-CONFIG_IP_NF_TARGET_MASQUERADE=y
-# CONFIG_IP_NF_TARGET_NETMAP is not set
-# CONFIG_IP_NF_TARGET_REDIRECT is not set
-# CONFIG_NF_NAT_FTP is not set
-# CONFIG_NF_NAT_IRC is not set
-# CONFIG_NF_NAT_TFTP is not set
-# CONFIG_NF_NAT_AMANDA is not set
-# CONFIG_NF_NAT_PPTP is not set
-# CONFIG_NF_NAT_H323 is not set
-# CONFIG_NF_NAT_SIP is not set
-# CONFIG_IP_NF_MANGLE is not set
-# CONFIG_IP_NF_RAW is not set
-# CONFIG_IP_NF_SECURITY is not set
-# CONFIG_IP_NF_ARPTABLES is not set
-# CONFIG_IP_DCCP is not set
-# CONFIG_IP_SCTP is not set
-# CONFIG_RDS is not set
-# CONFIG_TIPC is not set
-# CONFIG_ATM is not set
-# CONFIG_L2TP is not set
-# CONFIG_BRIDGE is not set
-# CONFIG_NET_DSA is not set
-# CONFIG_VLAN_8021Q is not set
-# CONFIG_DECNET is not set
-# CONFIG_LLC2 is not set
-# CONFIG_IPX is not set
-# CONFIG_ATALK is not set
-# CONFIG_X25 is not set
-# CONFIG_LAPB is not set
-# CONFIG_ECONET is not set
-# CONFIG_WAN_ROUTER is not set
-# CONFIG_PHONET is not set
-# CONFIG_IEEE802154 is not set
-# CONFIG_NET_SCHED is not set
-# CONFIG_DCB is not set
-CONFIG_DNS_RESOLVER=y
-# CONFIG_BATMAN_ADV is not set
-
-#
-# Network testing
-#
-# CONFIG_NET_PKTGEN is not set
-# CONFIG_HAMRADIO is not set
-CONFIG_CAN=y
-CONFIG_CAN_RAW=y
-CONFIG_CAN_BCM=y
-# CONFIG_CAN_GW is not set
-
-#
-# CAN Device Drivers
-#
-# CONFIG_CAN_VCAN is not set
-# CONFIG_CAN_SLCAN is not set
-CONFIG_CAN_DEV=y
-CONFIG_CAN_CALC_BITTIMING=y
-# CONFIG_CAN_TI_HECC is not set
-# CONFIG_CAN_MCP251X is not set
-# CONFIG_CAN_SJA1000 is not set
-# CONFIG_CAN_C_CAN is not set
-CONFIG_CAN_D_CAN=y
-CONFIG_CAN_D_CAN_PLATFORM=y
-
-#
-# CAN USB interfaces
-#
-# CONFIG_CAN_EMS_USB is not set
-# CONFIG_CAN_ESD_USB2 is not set
-# CONFIG_CAN_SOFTING is not set
-# CONFIG_CAN_DEBUG_DEVICES is not set
-# CONFIG_IRDA is not set
-# CONFIG_BT is not set
-# CONFIG_AF_RXRPC is not set
-CONFIG_WIRELESS=y
-CONFIG_WIRELESS_EXT=y
-CONFIG_WEXT_CORE=y
-CONFIG_WEXT_PROC=y
-CONFIG_WEXT_PRIV=y
-# CONFIG_CFG80211 is not set
-CONFIG_WIRELESS_EXT_SYSFS=y
-# CONFIG_LIB80211 is not set
-
-#
-# CFG80211 needs to be enabled for MAC80211
-#
-# CONFIG_WIMAX is not set
-CONFIG_RFKILL=y
-CONFIG_RFKILL_LEDS=y
-CONFIG_RFKILL_INPUT=y
-# CONFIG_RFKILL_REGULATOR is not set
-# CONFIG_RFKILL_GPIO is not set
-# CONFIG_NET_9P is not set
-# CONFIG_CAIF is not set
-# CONFIG_CEPH_LIB is not set
-# CONFIG_NFC is not set
-
-#
-# Device Drivers
-#
-
-#
-# Generic Driver Options
-#
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-# CONFIG_DEVTMPFS is not set
-CONFIG_STANDALONE=y
-CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FW_LOADER=y
-CONFIG_FIRMWARE_IN_KERNEL=y
-CONFIG_EXTRA_FIRMWARE="am335x-pm-firmware.bin"
-CONFIG_EXTRA_FIRMWARE_DIR="firmware"
-# CONFIG_SYS_HYPERVISOR is not set
-CONFIG_REGMAP=y
-CONFIG_REGMAP_I2C=y
-CONFIG_REGMAP_SPI=y
-
-#
-# CBUS support
-#
-# CONFIG_CBUS is not set
-# CONFIG_CONNECTOR is not set
-CONFIG_MTD=y
-# CONFIG_MTD_TESTS is not set
-# CONFIG_MTD_REDBOOT_PARTS is not set
-CONFIG_MTD_CMDLINE_PARTS=y
-# CONFIG_MTD_AFS_PARTS is not set
-# CONFIG_MTD_OF_PARTS is not set
-# CONFIG_MTD_AR7_PARTS is not set
-
-#
-# User Modules And Translation Layers
-#
-CONFIG_MTD_CHAR=y
-CONFIG_MTD_BLKDEVS=y
-CONFIG_MTD_BLOCK=y
-# CONFIG_FTL is not set
-# CONFIG_NFTL is not set
-# CONFIG_INFTL is not set
-# CONFIG_RFD_FTL is not set
-# CONFIG_SSFDC is not set
-# CONFIG_SM_FTL is not set
-CONFIG_MTD_OOPS=y
-# CONFIG_MTD_SWAP is not set
-
-#
-# RAM/ROM/Flash chip drivers
-#
-CONFIG_MTD_CFI=y
-# CONFIG_MTD_JEDECPROBE is not set
-CONFIG_MTD_GEN_PROBE=y
-# CONFIG_MTD_CFI_ADV_OPTIONS is not set
-CONFIG_MTD_MAP_BANK_WIDTH_1=y
-CONFIG_MTD_MAP_BANK_WIDTH_2=y
-CONFIG_MTD_MAP_BANK_WIDTH_4=y
-# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
-# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
-# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
-CONFIG_MTD_CFI_I1=y
-CONFIG_MTD_CFI_I2=y
-# CONFIG_MTD_CFI_I4 is not set
-# CONFIG_MTD_CFI_I8 is not set
-# CONFIG_MTD_CFI_INTELEXT is not set
-# CONFIG_MTD_CFI_AMDSTD is not set
-# CONFIG_MTD_CFI_STAA is not set
-CONFIG_MTD_CFI_UTIL=y
-# CONFIG_MTD_RAM is not set
-# CONFIG_MTD_ROM is not set
-# CONFIG_MTD_ABSENT is not set
-
-#
-# Mapping drivers for chip access
-#
-# CONFIG_MTD_COMPLEX_MAPPINGS is not set
-# CONFIG_MTD_PHYSMAP is not set
-# CONFIG_MTD_PHYSMAP_OF is not set
-# CONFIG_MTD_PLATRAM is not set
-
-#
-# Self-contained MTD device drivers
-#
-# CONFIG_MTD_DATAFLASH is not set
-CONFIG_MTD_M25P80=y
-CONFIG_M25PXX_USE_FAST_READ=y
-# CONFIG_MTD_SST25L is not set
-# CONFIG_MTD_SLRAM is not set
-# CONFIG_MTD_PHRAM is not set
-# CONFIG_MTD_MTDRAM is not set
-# CONFIG_MTD_BLOCK2MTD is not set
-
-#
-# Disk-On-Chip Device Drivers
-#
-# CONFIG_MTD_DOC2000 is not set
-# CONFIG_MTD_DOC2001 is not set
-# CONFIG_MTD_DOC2001PLUS is not set
-# CONFIG_MTD_DOCG3 is not set
-CONFIG_MTD_NAND_ECC=y
-# CONFIG_MTD_NAND_ECC_SMC is not set
-CONFIG_MTD_NAND=y
-# CONFIG_MTD_NAND_VERIFY_WRITE is not set
-# CONFIG_MTD_NAND_ECC_BCH is not set
-# CONFIG_MTD_SM_COMMON is not set
-# CONFIG_MTD_NAND_MUSEUM_IDS is not set
-# CONFIG_MTD_NAND_GPIO is not set
-CONFIG_MTD_NAND_OMAP2=y
-CONFIG_MTD_NAND_IDS=y
-# CONFIG_MTD_NAND_DISKONCHIP is not set
-# CONFIG_MTD_NAND_NANDSIM is not set
-# CONFIG_MTD_NAND_PLATFORM is not set
-# CONFIG_MTD_ALAUDA is not set
-CONFIG_MTD_ONENAND=y
-# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
-# CONFIG_MTD_ONENAND_GENERIC is not set
-CONFIG_MTD_ONENAND_OMAP2=y
-# CONFIG_MTD_ONENAND_OTP is not set
-# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
-# CONFIG_MTD_ONENAND_SIM is not set
-
-#
-# LPDDR flash memory drivers
-#
-# CONFIG_MTD_LPDDR is not set
-CONFIG_MTD_UBI=y
-CONFIG_MTD_UBI_WL_THRESHOLD=4096
-CONFIG_MTD_UBI_BEB_RESERVE=1
-# CONFIG_MTD_UBI_GLUEBI is not set
-# CONFIG_MTD_UBI_DEBUG is not set
-CONFIG_DTC=y
-CONFIG_OF=y
-
-#
-# Device Tree and Open Firmware support
-#
-CONFIG_PROC_DEVICETREE=y
-CONFIG_OF_FLATTREE=y
-CONFIG_OF_EARLY_FLATTREE=y
-CONFIG_OF_ADDRESS=y
-CONFIG_OF_IRQ=y
-CONFIG_OF_DEVICE=y
-CONFIG_OF_GPIO=y
-CONFIG_OF_I2C=y
-CONFIG_OF_NET=y
-CONFIG_OF_SPI=y
-CONFIG_OF_MDIO=y
-# CONFIG_PARPORT is not set
-CONFIG_BLK_DEV=y
-# CONFIG_BLK_DEV_COW_COMMON is not set
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
-# CONFIG_BLK_DEV_CRYPTOLOOP is not set
-
-#
-# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
-#
-# CONFIG_BLK_DEV_NBD is not set
-# CONFIG_BLK_DEV_UB is not set
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_COUNT=16
-CONFIG_BLK_DEV_RAM_SIZE=16384
-# CONFIG_BLK_DEV_XIP is not set
-# CONFIG_CDROM_PKTCDVD is not set
-# CONFIG_ATA_OVER_ETH is not set
-# CONFIG_MG_DISK is not set
-# CONFIG_BLK_DEV_RBD is not set
-CONFIG_SENSORS_LIS3LV02D=y
-CONFIG_MISC_DEVICES=y
-# CONFIG_AD525X_DPOT is not set
-# CONFIG_ATMEL_PWM is not set
-# CONFIG_ICS932S401 is not set
-# CONFIG_ENCLOSURE_SERVICES is not set
-# CONFIG_APDS9802ALS is not set
-# CONFIG_ISL29003 is not set
-# CONFIG_ISL29020 is not set
-CONFIG_SENSORS_TSL2550=y
-# CONFIG_SENSORS_BH1780 is not set
-# CONFIG_SENSORS_BH1770 is not set
-# CONFIG_SENSORS_APDS990X is not set
-# CONFIG_HMC6352 is not set
-# CONFIG_DS1682 is not set
-# CONFIG_TI_DAC7512 is not set
-# CONFIG_BMP085 is not set
-# CONFIG_USB_SWITCH_FSA9480 is not set
-# CONFIG_C2PORT is not set
-
-#
-# EEPROM support
-#
-CONFIG_EEPROM_AT24=y
-# CONFIG_EEPROM_AT25 is not set
-# CONFIG_EEPROM_LEGACY is not set
-# CONFIG_EEPROM_MAX6875 is not set
-# CONFIG_EEPROM_93CX6 is not set
-# CONFIG_EEPROM_93XX46 is not set
-# CONFIG_IWMC3200TOP is not set
-
-#
-# Texas Instruments shared transport line discipline
-#
-# CONFIG_TI_ST is not set
-# CONFIG_SENSORS_LIS3_SPI is not set
-CONFIG_SENSORS_LIS3_I2C=y
-
-#
-# Altera FPGA firmware download module
-#
-# CONFIG_ALTERA_STAPL is not set
-
-#
-# SCSI device support
-#
-CONFIG_SCSI_MOD=y
-# CONFIG_RAID_ATTRS is not set
-CONFIG_SCSI=y
-CONFIG_SCSI_DMA=y
-# CONFIG_SCSI_TGT is not set
-# CONFIG_SCSI_NETLINK is not set
-CONFIG_SCSI_PROC_FS=y
-
-#
-# SCSI support type (disk, tape, CD-ROM)
-#
-CONFIG_BLK_DEV_SD=y
-# CONFIG_CHR_DEV_ST is not set
-# CONFIG_CHR_DEV_OSST is not set
-# CONFIG_BLK_DEV_SR is not set
-# CONFIG_CHR_DEV_SG is not set
-# CONFIG_CHR_DEV_SCH is not set
-CONFIG_SCSI_MULTI_LUN=y
-# CONFIG_SCSI_CONSTANTS is not set
-# CONFIG_SCSI_LOGGING is not set
-CONFIG_SCSI_SCAN_ASYNC=y
-CONFIG_SCSI_WAIT_SCAN=m
-
-#
-# SCSI Transports
-#
-# CONFIG_SCSI_SPI_ATTRS is not set
-# CONFIG_SCSI_FC_ATTRS is not set
-# CONFIG_SCSI_ISCSI_ATTRS is not set
-# CONFIG_SCSI_SAS_ATTRS is not set
-# CONFIG_SCSI_SAS_LIBSAS is not set
-# CONFIG_SCSI_SRP_ATTRS is not set
-CONFIG_SCSI_LOWLEVEL=y
-# CONFIG_ISCSI_TCP is not set
-# CONFIG_ISCSI_BOOT_SYSFS is not set
-# CONFIG_LIBFC is not set
-# CONFIG_LIBFCOE is not set
-# CONFIG_SCSI_DEBUG is not set
-# CONFIG_SCSI_DH is not set
-# CONFIG_SCSI_OSD_INITIATOR is not set
-# CONFIG_ATA is not set
-# CONFIG_MD is not set
-# CONFIG_TARGET_CORE is not set
-CONFIG_NETDEVICES=y
-CONFIG_NET_CORE=y
-# CONFIG_BONDING is not set
-# CONFIG_DUMMY is not set
-# CONFIG_EQUALIZER is not set
-CONFIG_MII=y
-# CONFIG_MACVLAN is not set
-# CONFIG_NETCONSOLE is not set
-# CONFIG_NETPOLL is not set
-# CONFIG_NET_POLL_CONTROLLER is not set
-# CONFIG_TUN is not set
-# CONFIG_VETH is not set
-
-#
-# CAIF transport drivers
-#
-CONFIG_ETHERNET=y
-CONFIG_NET_VENDOR_BROADCOM=y
-# CONFIG_B44 is not set
-CONFIG_NET_VENDOR_CHELSIO=y
-# CONFIG_DM9000 is not set
-# CONFIG_DNET is not set
-CONFIG_NET_VENDOR_FARADAY=y
-# CONFIG_FTMAC100 is not set
-# CONFIG_FTGMAC100 is not set
-CONFIG_NET_VENDOR_INTEL=y
-CONFIG_NET_VENDOR_I825XX=y
-CONFIG_NET_VENDOR_MARVELL=y
-CONFIG_NET_VENDOR_MICREL=y
-# CONFIG_KS8851 is not set
-# CONFIG_KS8851_MLL is not set
-CONFIG_NET_VENDOR_MICROCHIP=y
-# CONFIG_ENC28J60 is not set
-CONFIG_NET_VENDOR_NATSEMI=y
-CONFIG_NET_VENDOR_8390=y
-# CONFIG_AX88796 is not set
-# CONFIG_ETHOC is not set
-CONFIG_NET_VENDOR_SEEQ=y
-# CONFIG_SEEQ8005 is not set
-CONFIG_NET_VENDOR_SMSC=y
-CONFIG_SMC91X=y
-# CONFIG_SMC911X is not set
-CONFIG_SMSC911X=y
-# CONFIG_SMSC911X_ARCH_HOOKS is not set
-CONFIG_NET_VENDOR_STMICRO=y
-# CONFIG_STMMAC_ETH is not set
-CONFIG_NET_VENDOR_TI=y
-# CONFIG_TI_DAVINCI_EMAC is not set
-CONFIG_TI_DAVINCI_MDIO=y
-CONFIG_TI_DAVINCI_CPDMA=y
-CONFIG_TI_CPSW=y
-CONFIG_TI_CPSW_DUAL_EMAC=y
-CONFIG_PHYLIB=y
-
-#
-# MII PHY device drivers
-#
-# CONFIG_MARVELL_PHY is not set
-# CONFIG_DAVICOM_PHY is not set
-# CONFIG_QSEMI_PHY is not set
-# CONFIG_LXT_PHY is not set
-# CONFIG_CICADA_PHY is not set
-# CONFIG_VITESSE_PHY is not set
-CONFIG_SMSC_PHY=y
-# CONFIG_BROADCOM_PHY is not set
-# CONFIG_ICPLUS_PHY is not set
-# CONFIG_REALTEK_PHY is not set
-# CONFIG_NATIONAL_PHY is not set
-# CONFIG_STE10XP is not set
-# CONFIG_LSI_ET1011C_PHY is not set
-# CONFIG_MICREL_PHY is not set
-# CONFIG_FIXED_PHY is not set
-# CONFIG_MDIO_BITBANG is not set
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
-
-#
-# USB Network Adapters
-#
-# CONFIG_USB_CATC is not set
-# CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-CONFIG_USB_USBNET=y
-# CONFIG_USB_NET_AX8817X is not set
-CONFIG_USB_NET_CDCETHER=y
-CONFIG_USB_NET_CDC_EEM=y
-CONFIG_USB_NET_CDC_NCM=y
-CONFIG_USB_NET_DM9601=y
-# CONFIG_USB_NET_SMSC75XX is not set
-# CONFIG_USB_NET_SMSC95XX is not set
-# CONFIG_USB_NET_GL620A is not set
-# CONFIG_USB_NET_NET1080 is not set
-# CONFIG_USB_NET_PLUSB is not set
-# CONFIG_USB_NET_MCS7830 is not set
-# CONFIG_USB_NET_RNDIS_HOST is not set
-# CONFIG_USB_NET_CDC_SUBSET is not set
-# CONFIG_USB_NET_ZAURUS is not set
-# CONFIG_USB_NET_CX82310_ETH is not set
-# CONFIG_USB_NET_KALMIA is not set
-# CONFIG_USB_HSO is not set
-# CONFIG_USB_NET_INT51X1 is not set
-# CONFIG_USB_IPHETH is not set
-# CONFIG_USB_SIERRA_NET is not set
-# CONFIG_USB_VL600 is not set
-CONFIG_WLAN=y
-CONFIG_USB_ZD1201=y
-# CONFIG_HOSTAP is not set
-CONFIG_WL12XX_PLATFORM_DATA=y
-
-#
-# Enable WiMAX (Networking options) to see the WiMAX drivers
-#
-# CONFIG_WAN is not set
-# CONFIG_ISDN is not set
-# CONFIG_PHONE is not set
-
-#
-# Input device support
-#
-CONFIG_INPUT=y
-# CONFIG_INPUT_FF_MEMLESS is not set
-CONFIG_INPUT_POLLDEV=y
-# CONFIG_INPUT_SPARSEKMAP is not set
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV=y
-CONFIG_INPUT_MOUSEDEV_PSAUX=y
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
-# CONFIG_INPUT_JOYDEV is not set
-CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_EVBUG is not set
-
-#
-# Input Device Drivers
-#
-CONFIG_INPUT_KEYBOARD=y
-# CONFIG_KEYBOARD_ADP5588 is not set
-# CONFIG_KEYBOARD_ADP5589 is not set
-# CONFIG_KEYBOARD_ATKBD is not set
-# CONFIG_KEYBOARD_QT1070 is not set
-# CONFIG_KEYBOARD_QT2160 is not set
-# CONFIG_KEYBOARD_LKKBD is not set
-CONFIG_KEYBOARD_GPIO=y
-# CONFIG_KEYBOARD_TCA6416 is not set
-CONFIG_KEYBOARD_MATRIX=y
-# CONFIG_KEYBOARD_LM8323 is not set
-# CONFIG_KEYBOARD_MAX7359 is not set
-# CONFIG_KEYBOARD_MCS is not set
-# CONFIG_KEYBOARD_MPR121 is not set
-# CONFIG_KEYBOARD_NEWTON is not set
-# CONFIG_KEYBOARD_OPENCORES is not set
-# CONFIG_KEYBOARD_STOWAWAY is not set
-# CONFIG_KEYBOARD_SUNKBD is not set
-# CONFIG_KEYBOARD_TWL4030 is not set
-# CONFIG_KEYBOARD_XTKBD is not set
-CONFIG_INPUT_MOUSE=y
-CONFIG_MOUSE_PS2=y
-CONFIG_MOUSE_PS2_ALPS=y
-CONFIG_MOUSE_PS2_LOGIPS2PP=y
-CONFIG_MOUSE_PS2_SYNAPTICS=y
-CONFIG_MOUSE_PS2_TRACKPOINT=y
-# CONFIG_MOUSE_PS2_ELANTECH is not set
-# CONFIG_MOUSE_PS2_SENTELIC is not set
-# CONFIG_MOUSE_PS2_TOUCHKIT is not set
-# CONFIG_MOUSE_SERIAL is not set
-# CONFIG_MOUSE_APPLETOUCH is not set
-# CONFIG_MOUSE_BCM5974 is not set
-# CONFIG_MOUSE_VSXXXAA is not set
-# CONFIG_MOUSE_GPIO is not set
-# CONFIG_MOUSE_SYNAPTICS_I2C is not set
-# CONFIG_INPUT_JOYSTICK is not set
-# CONFIG_INPUT_TABLET is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-# CONFIG_TOUCHSCREEN_ADS7846 is not set
-# CONFIG_TOUCHSCREEN_AD7877 is not set
-# CONFIG_TOUCHSCREEN_AD7879 is not set
-# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
-# CONFIG_TOUCHSCREEN_BU21013 is not set
-# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
-# CONFIG_TOUCHSCREEN_DYNAPRO is not set
-# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
-# CONFIG_TOUCHSCREEN_EETI is not set
-# CONFIG_TOUCHSCREEN_FUJITSU is not set
-# CONFIG_TOUCHSCREEN_GUNZE is not set
-# CONFIG_TOUCHSCREEN_ELO is not set
-# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
-# CONFIG_TOUCHSCREEN_MAX11801 is not set
-# CONFIG_TOUCHSCREEN_MCS5000 is not set
-# CONFIG_TOUCHSCREEN_MTOUCH is not set
-# CONFIG_TOUCHSCREEN_INEXIO is not set
-# CONFIG_TOUCHSCREEN_MK712 is not set
-# CONFIG_TOUCHSCREEN_PENMOUNT is not set
-# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
-# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
-CONFIG_TOUCHSCREEN_TI_TSCADC=y
-# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
-# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
-# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
-# CONFIG_TOUCHSCREEN_TSC2005 is not set
-# CONFIG_TOUCHSCREEN_TSC2007 is not set
-# CONFIG_TOUCHSCREEN_W90X900 is not set
-# CONFIG_TOUCHSCREEN_ST1232 is not set
-# CONFIG_TOUCHSCREEN_TPS6507X is not set
-CONFIG_INPUT_MISC=y
-# CONFIG_INPUT_AD714X is not set
-# CONFIG_INPUT_BMA150 is not set
-# CONFIG_INPUT_MMA8450 is not set
-# CONFIG_INPUT_MPU3050 is not set
-# CONFIG_INPUT_ATI_REMOTE2 is not set
-# CONFIG_INPUT_KEYSPAN_REMOTE is not set
-# CONFIG_INPUT_KXTJ9 is not set
-# CONFIG_INPUT_POWERMATE is not set
-# CONFIG_INPUT_YEALINK is not set
-# CONFIG_INPUT_CM109 is not set
-# CONFIG_INPUT_TWL4030_PWRBUTTON is not set
-# CONFIG_INPUT_TWL4030_VIBRA is not set
-# CONFIG_INPUT_TWL6040_VIBRA is not set
-# CONFIG_INPUT_UINPUT is not set
-# CONFIG_INPUT_PCF8574 is not set
-# CONFIG_INPUT_PWM_BEEPER is not set
-# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
-# CONFIG_INPUT_ADXL34X is not set
-# CONFIG_INPUT_CMA3000 is not set
-
-#
-# Hardware I/O ports
-#
-CONFIG_SERIO=y
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIO_LIBPS2=y
-# CONFIG_SERIO_RAW is not set
-# CONFIG_SERIO_ALTERA_PS2 is not set
-# CONFIG_SERIO_PS2MULT is not set
-# CONFIG_GAMEPORT is not set
-
-#
-# Character devices
-#
-CONFIG_VT=y
-CONFIG_CONSOLE_TRANSLATIONS=y
-CONFIG_VT_CONSOLE=y
-CONFIG_VT_CONSOLE_SLEEP=y
-CONFIG_HW_CONSOLE=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_UNIX98_PTYS=y
-# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_SERIAL_NONSTANDARD is not set
-# CONFIG_N_GSM is not set
-# CONFIG_TRACE_SINK is not set
-CONFIG_DEVKMEM=y
-
-#
-# Serial drivers
-#
-# CONFIG_SERIAL_8250 is not set
-
-#
-# Non-8250 serial port support
-#
-# CONFIG_SERIAL_MAX3100 is not set
-# CONFIG_SERIAL_MAX3107 is not set
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
-CONFIG_SERIAL_OMAP=y
-CONFIG_SERIAL_OMAP_CONSOLE=y
-# CONFIG_SERIAL_TIMBERDALE is not set
-# CONFIG_SERIAL_ALTERA_JTAGUART is not set
-# CONFIG_SERIAL_ALTERA_UART is not set
-# CONFIG_SERIAL_IFX6X60 is not set
-# CONFIG_SERIAL_XILINX_PS_UART is not set
-# CONFIG_HVC_DCC is not set
-# CONFIG_IPMI_HANDLER is not set
-# CONFIG_HW_RANDOM is not set
-# CONFIG_R3964 is not set
-# CONFIG_RAW_DRIVER is not set
-# CONFIG_TCG_TPM is not set
-# CONFIG_RAMOOPS is not set
-CONFIG_I2C=y
-CONFIG_I2C_BOARDINFO=y
-CONFIG_I2C_COMPAT=y
-CONFIG_I2C_CHARDEV=y
-# CONFIG_I2C_MUX is not set
-CONFIG_I2C_HELPER_AUTO=y
-
-#
-# I2C Hardware Bus support
-#
-
-#
-# I2C system bus drivers (mostly embedded / system-on-chip)
-#
-# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
-# CONFIG_I2C_GPIO is not set
-# CONFIG_I2C_OCORES is not set
-CONFIG_I2C_OMAP=y
-# CONFIG_I2C_PCA_PLATFORM is not set
-# CONFIG_I2C_PXA_PCI is not set
-# CONFIG_I2C_SIMTEC is not set
-# CONFIG_I2C_XILINX is not set
-
-#
-# External I2C/SMBus adapter drivers
-#
-# CONFIG_I2C_DIOLAN_U2C is not set
-# CONFIG_I2C_PARPORT_LIGHT is not set
-# CONFIG_I2C_TAOS_EVM is not set
-# CONFIG_I2C_TINY_USB is not set
-
-#
-# Other I2C/SMBus bus drivers
-#
-# CONFIG_I2C_STUB is not set
-# CONFIG_I2C_DEBUG_CORE is not set
-# CONFIG_I2C_DEBUG_ALGO is not set
-# CONFIG_I2C_DEBUG_BUS is not set
-CONFIG_SPI=y
-CONFIG_SPI_MASTER=y
-
-#
-# SPI Master Controller Drivers
-#
-# CONFIG_SPI_ALTERA is not set
-# CONFIG_SPI_BITBANG is not set
-# CONFIG_SPI_GPIO is not set
-# CONFIG_SPI_OC_TINY is not set
-CONFIG_SPI_OMAP24XX=y
-# CONFIG_SPI_PXA2XX_PCI is not set
-# CONFIG_SPI_XILINX is not set
-# CONFIG_SPI_DESIGNWARE is not set
-
-#
-# SPI Protocol Masters
-#
-# CONFIG_SPI_SPIDEV is not set
-# CONFIG_SPI_TLE62X0 is not set
-
-#
-# PPS support
-#
-# CONFIG_PPS is not set
-
-#
-# PPS generators support
-#
-
-#
-# PTP clock support
-#
-
-#
-# Enable Device Drivers -> PPS to see the PTP clock options.
-#
-CONFIG_ARCH_REQUIRE_GPIOLIB=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-
-#
-# Memory mapped GPIO drivers:
-#
-# CONFIG_GPIO_GENERIC_PLATFORM is not set
-# CONFIG_GPIO_IT8761E is not set
-
-#
-# I2C GPIO expanders:
-#
-# CONFIG_GPIO_MAX7300 is not set
-# CONFIG_GPIO_MAX732X is not set
-# CONFIG_GPIO_PCF857X is not set
-# CONFIG_GPIO_SX150X is not set
-# CONFIG_GPIO_TWL4030 is not set
-# CONFIG_GPIO_ADP5588 is not set
-
-#
-# PCI GPIO expanders:
-#
-
-#
-# SPI GPIO expanders:
-#
-# CONFIG_GPIO_MAX7301 is not set
-# CONFIG_GPIO_MCP23S08 is not set
-# CONFIG_GPIO_MC33880 is not set
-# CONFIG_GPIO_74X164 is not set
-
-#
-# AC97 GPIO expanders:
-#
-
-#
-# MODULbus GPIO expanders:
-#
-CONFIG_GPIO_TPS65910=y
-CONFIG_GENERIC_PWM=y
-CONFIG_DAVINCI_EHRPWM=y
-CONFIG_ECAP_PWM=y
-# CONFIG_W1 is not set
-# CONFIG_POWER_SUPPLY is not set
-CONFIG_HWMON=y
-# CONFIG_HWMON_VID is not set
-# CONFIG_HWMON_DEBUG_CHIP is not set
-
-#
-# Native drivers
-#
-# CONFIG_SENSORS_AD7314 is not set
-# CONFIG_SENSORS_AD7414 is not set
-# CONFIG_SENSORS_AD7418 is not set
-# CONFIG_SENSORS_ADCXX is not set
-# CONFIG_SENSORS_ADM1021 is not set
-# CONFIG_SENSORS_ADM1025 is not set
-# CONFIG_SENSORS_ADM1026 is not set
-# CONFIG_SENSORS_ADM1029 is not set
-# CONFIG_SENSORS_ADM1031 is not set
-# CONFIG_SENSORS_ADM9240 is not set
-# CONFIG_SENSORS_ADT7411 is not set
-# CONFIG_SENSORS_ADT7462 is not set
-# CONFIG_SENSORS_ADT7470 is not set
-# CONFIG_SENSORS_ADT7475 is not set
-# CONFIG_SENSORS_ASC7621 is not set
-# CONFIG_SENSORS_ATXP1 is not set
-# CONFIG_SENSORS_DS620 is not set
-# CONFIG_SENSORS_DS1621 is not set
-# CONFIG_SENSORS_F71805F is not set
-# CONFIG_SENSORS_F71882FG is not set
-# CONFIG_SENSORS_F75375S is not set
-# CONFIG_SENSORS_G760A is not set
-# CONFIG_SENSORS_GL518SM is not set
-# CONFIG_SENSORS_GL520SM is not set
-# CONFIG_SENSORS_GPIO_FAN is not set
-# CONFIG_SENSORS_IT87 is not set
-# CONFIG_SENSORS_JC42 is not set
-# CONFIG_SENSORS_LINEAGE is not set
-# CONFIG_SENSORS_LM63 is not set
-# CONFIG_SENSORS_LM70 is not set
-# CONFIG_SENSORS_LM73 is not set
-CONFIG_SENSORS_LM75=y
-# CONFIG_SENSORS_LM77 is not set
-# CONFIG_SENSORS_LM78 is not set
-# CONFIG_SENSORS_LM80 is not set
-# CONFIG_SENSORS_LM83 is not set
-# CONFIG_SENSORS_LM85 is not set
-# CONFIG_SENSORS_LM87 is not set
-# CONFIG_SENSORS_LM90 is not set
-# CONFIG_SENSORS_LM92 is not set
-# CONFIG_SENSORS_LM93 is not set
-# CONFIG_SENSORS_LTC4151 is not set
-# CONFIG_SENSORS_LTC4215 is not set
-# CONFIG_SENSORS_LTC4245 is not set
-# CONFIG_SENSORS_LTC4261 is not set
-# CONFIG_SENSORS_LM95241 is not set
-# CONFIG_SENSORS_LM95245 is not set
-# CONFIG_SENSORS_MAX1111 is not set
-# CONFIG_SENSORS_MAX16065 is not set
-# CONFIG_SENSORS_MAX1619 is not set
-# CONFIG_SENSORS_MAX1668 is not set
-# CONFIG_SENSORS_MAX6639 is not set
-# CONFIG_SENSORS_MAX6642 is not set
-# CONFIG_SENSORS_MAX6650 is not set
-# CONFIG_SENSORS_NTC_THERMISTOR is not set
-# CONFIG_SENSORS_PC87360 is not set
-# CONFIG_SENSORS_PC87427 is not set
-# CONFIG_SENSORS_PCF8591 is not set
-# CONFIG_PMBUS is not set
-# CONFIG_SENSORS_SHT15 is not set
-# CONFIG_SENSORS_SHT21 is not set
-# CONFIG_SENSORS_SMM665 is not set
-# CONFIG_SENSORS_DME1737 is not set
-# CONFIG_SENSORS_EMC1403 is not set
-# CONFIG_SENSORS_EMC2103 is not set
-# CONFIG_SENSORS_EMC6W201 is not set
-# CONFIG_SENSORS_SMSC47M1 is not set
-# CONFIG_SENSORS_SMSC47M192 is not set
-# CONFIG_SENSORS_SMSC47B397 is not set
-# CONFIG_SENSORS_SCH56XX_COMMON is not set
-# CONFIG_SENSORS_SCH5627 is not set
-# CONFIG_SENSORS_SCH5636 is not set
-# CONFIG_SENSORS_ADS1015 is not set
-# CONFIG_SENSORS_ADS7828 is not set
-# CONFIG_SENSORS_ADS7871 is not set
-# CONFIG_SENSORS_AMC6821 is not set
-# CONFIG_SENSORS_THMC50 is not set
-# CONFIG_SENSORS_TMP102 is not set
-# CONFIG_SENSORS_TMP401 is not set
-# CONFIG_SENSORS_TMP421 is not set
-# CONFIG_SENSORS_VT1211 is not set
-# CONFIG_SENSORS_W83781D is not set
-# CONFIG_SENSORS_W83791D is not set
-# CONFIG_SENSORS_W83792D is not set
-# CONFIG_SENSORS_W83793 is not set
-# CONFIG_SENSORS_W83795 is not set
-# CONFIG_SENSORS_W83L785TS is not set
-# CONFIG_SENSORS_W83L786NG is not set
-# CONFIG_SENSORS_W83627HF is not set
-# CONFIG_SENSORS_W83627EHF is not set
-# CONFIG_THERMAL is not set
-CONFIG_WATCHDOG=y
-# CONFIG_WATCHDOG_CORE is not set
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-# CONFIG_DW_WATCHDOG is not set
-CONFIG_OMAP_WATCHDOG=y
-# CONFIG_TWL4030_WATCHDOG is not set
-# CONFIG_MAX63XX_WATCHDOG is not set
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Sonics Silicon Backplane
-#
-# CONFIG_SSB is not set
-CONFIG_BCMA_POSSIBLE=y
-
-#
-# Broadcom specific AMBA
-#
-# CONFIG_BCMA is not set
-
-#
-# Multifunction device drivers
-#
-CONFIG_MFD_CORE=y
-# CONFIG_MFD_88PM860X is not set
-# CONFIG_MFD_SM501 is not set
-# CONFIG_MFD_ASIC3 is not set
-# CONFIG_HTC_EGPIO is not set
-# CONFIG_HTC_PASIC3 is not set
-# CONFIG_HTC_I2CPLD is not set
-# CONFIG_TPS6105X is not set
-# CONFIG_TPS65010 is not set
-# CONFIG_TPS6507X is not set
-CONFIG_MFD_TPS65217=y
-# CONFIG_MFD_TPS6586X is not set
-CONFIG_MFD_TPS65910=y
-# CONFIG_MFD_TPS65912_I2C is not set
-# CONFIG_MFD_TPS65912_SPI is not set
-CONFIG_TWL4030_CORE=y
-# CONFIG_TWL4030_MADC is not set
-CONFIG_TWL4030_POWER=y
-# CONFIG_MFD_TWL4030_AUDIO is not set
-# CONFIG_TWL6030_PWM is not set
-# CONFIG_TWL6040_CORE is not set
-# CONFIG_MFD_STMPE is not set
-# CONFIG_MFD_TC3589X is not set
-# CONFIG_MFD_TMIO is not set
-# CONFIG_MFD_T7L66XB is not set
-# CONFIG_MFD_TC6387XB is not set
-# CONFIG_MFD_TC6393XB is not set
-# CONFIG_PMIC_DA903X is not set
-# CONFIG_PMIC_ADP5520 is not set
-# CONFIG_MFD_MAX8925 is not set
-# CONFIG_MFD_MAX8997 is not set
-# CONFIG_MFD_MAX8998 is not set
-# CONFIG_MFD_WM8400 is not set
-# CONFIG_MFD_WM831X_I2C is not set
-# CONFIG_MFD_WM831X_SPI is not set
-# CONFIG_MFD_WM8350_I2C is not set
-# CONFIG_MFD_WM8994 is not set
-# CONFIG_MFD_PCF50633 is not set
-# CONFIG_MFD_MC13XXX is not set
-# CONFIG_ABX500_CORE is not set
-# CONFIG_EZX_PCAP is not set
-# CONFIG_MFD_WL1273_CORE is not set
-# CONFIG_MFD_AAT2870_CORE is not set
-CONFIG_REGULATOR=y
-# CONFIG_REGULATOR_DEBUG is not set
-CONFIG_REGULATOR_DUMMY=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
-# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
-# CONFIG_REGULATOR_GPIO is not set
-# CONFIG_REGULATOR_BQ24022 is not set
-# CONFIG_REGULATOR_MAX1586 is not set
-# CONFIG_REGULATOR_MAX8649 is not set
-# CONFIG_REGULATOR_MAX8660 is not set
-# CONFIG_REGULATOR_MAX8952 is not set
-# CONFIG_REGULATOR_TWL4030 is not set
-# CONFIG_REGULATOR_LP3971 is not set
-# CONFIG_REGULATOR_LP3972 is not set
-# CONFIG_REGULATOR_TPS65023 is not set
-# CONFIG_REGULATOR_TPS6507X is not set
-CONFIG_REGULATOR_TPS65217=y
-# CONFIG_REGULATOR_ISL6271A is not set
-# CONFIG_REGULATOR_AD5398 is not set
-# CONFIG_REGULATOR_TPS6524X is not set
-CONFIG_REGULATOR_TPS65910=y
-CONFIG_MEDIA_SUPPORT=y
-
-#
-# Multimedia core support
-#
-# CONFIG_MEDIA_CONTROLLER is not set
-CONFIG_VIDEO_DEV=y
-CONFIG_VIDEO_V4L2_COMMON=y
-# CONFIG_DVB_CORE is not set
-CONFIG_VIDEO_MEDIA=y
-
-#
-# Multimedia drivers
-#
-# CONFIG_RC_CORE is not set
-# CONFIG_MEDIA_ATTACH is not set
-CONFIG_MEDIA_TUNER=y
-# CONFIG_MEDIA_TUNER_CUSTOMISE is not set
-CONFIG_MEDIA_TUNER_SIMPLE=y
-CONFIG_MEDIA_TUNER_TDA8290=y
-CONFIG_MEDIA_TUNER_TDA827X=y
-CONFIG_MEDIA_TUNER_TDA18271=y
-CONFIG_MEDIA_TUNER_TDA9887=y
-CONFIG_MEDIA_TUNER_TEA5761=y
-CONFIG_MEDIA_TUNER_TEA5767=y
-CONFIG_MEDIA_TUNER_MT20XX=y
-CONFIG_MEDIA_TUNER_XC2028=y
-CONFIG_MEDIA_TUNER_XC5000=y
-CONFIG_MEDIA_TUNER_XC4000=y
-CONFIG_MEDIA_TUNER_MC44S803=y
-CONFIG_VIDEO_V4L2=y
-CONFIG_VIDEO_CAPTURE_DRIVERS=y
-# CONFIG_VIDEO_ADV_DEBUG is not set
-# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
-# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
-
-#
-# Encoders, decoders, sensors and other helper chips
-#
-
-#
-# Audio decoders, processors and mixers
-#
-# CONFIG_VIDEO_TVAUDIO is not set
-# CONFIG_VIDEO_TDA7432 is not set
-# CONFIG_VIDEO_TDA9840 is not set
-# CONFIG_VIDEO_TEA6415C is not set
-# CONFIG_VIDEO_TEA6420 is not set
-# CONFIG_VIDEO_MSP3400 is not set
-# CONFIG_VIDEO_CS5345 is not set
-# CONFIG_VIDEO_CS53L32A is not set
-# CONFIG_VIDEO_TLV320AIC23B is not set
-# CONFIG_VIDEO_WM8775 is not set
-# CONFIG_VIDEO_WM8739 is not set
-# CONFIG_VIDEO_VP27SMPX is not set
-
-#
-# RDS decoders
-#
-# CONFIG_VIDEO_SAA6588 is not set
-
-#
-# Video decoders
-#
-# CONFIG_VIDEO_ADV7180 is not set
-# CONFIG_VIDEO_BT819 is not set
-# CONFIG_VIDEO_BT856 is not set
-# CONFIG_VIDEO_BT866 is not set
-# CONFIG_VIDEO_KS0127 is not set
-# CONFIG_VIDEO_SAA7110 is not set
-# CONFIG_VIDEO_SAA711X is not set
-# CONFIG_VIDEO_SAA7191 is not set
-# CONFIG_VIDEO_TVP514X is not set
-# CONFIG_VIDEO_TVP5150 is not set
-# CONFIG_VIDEO_TVP7002 is not set
-# CONFIG_VIDEO_VPX3220 is not set
-
-#
-# Video and audio decoders
-#
-# CONFIG_VIDEO_SAA717X is not set
-# CONFIG_VIDEO_CX25840 is not set
-
-#
-# MPEG video encoders
-#
-# CONFIG_VIDEO_CX2341X is not set
-
-#
-# Video encoders
-#
-# CONFIG_VIDEO_SAA7127 is not set
-# CONFIG_VIDEO_SAA7185 is not set
-# CONFIG_VIDEO_ADV7170 is not set
-# CONFIG_VIDEO_ADV7175 is not set
-# CONFIG_VIDEO_ADV7343 is not set
-# CONFIG_VIDEO_AK881X is not set
-
-#
-# Camera sensor devices
-#
-# CONFIG_VIDEO_OV7670 is not set
-# CONFIG_VIDEO_MT9V011 is not set
-# CONFIG_VIDEO_TCM825X is not set
-# CONFIG_VIDEO_SR030PC30 is not set
-
-#
-# Flash devices
-#
-
-#
-# Video improvement chips
-#
-# CONFIG_VIDEO_UPD64031A is not set
-# CONFIG_VIDEO_UPD64083 is not set
-
-#
-# Miscelaneous helper chips
-#
-# CONFIG_VIDEO_THS7303 is not set
-# CONFIG_VIDEO_M52790 is not set
-# CONFIG_VIDEO_VIVI is not set
-# CONFIG_VIDEO_VPFE_CAPTURE is not set
-# CONFIG_VIDEO_OMAP2_VOUT is not set
-# CONFIG_VIDEO_CPIA2 is not set
-# CONFIG_SOC_CAMERA is not set
-CONFIG_V4L_USB_DRIVERS=y
-CONFIG_USB_VIDEO_CLASS=y
-CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
-# CONFIG_USB_GSPCA is not set
-# CONFIG_VIDEO_PVRUSB2 is not set
-# CONFIG_VIDEO_HDPVR is not set
-# CONFIG_VIDEO_EM28XX is not set
-# CONFIG_VIDEO_USBVISION is not set
-# CONFIG_USB_ET61X251 is not set
-# CONFIG_USB_SN9C102 is not set
-# CONFIG_USB_PWC is not set
-# CONFIG_USB_ZR364XX is not set
-# CONFIG_USB_STKWEBCAM is not set
-# CONFIG_USB_S2255 is not set
-# CONFIG_V4L_MEM2MEM_DRIVERS is not set
-# CONFIG_RADIO_ADAPTERS is not set
-
-#
-# Graphics support
-#
-# CONFIG_DRM is not set
-# CONFIG_VGASTATE is not set
-# CONFIG_VIDEO_OUTPUT_CONTROL is not set
-CONFIG_FB=y
-# CONFIG_FIRMWARE_EDID is not set
-# CONFIG_FB_DDC is not set
-# CONFIG_FB_BOOT_VESA_SUPPORT is not set
-CONFIG_FB_CFB_FILLRECT=y
-CONFIG_FB_CFB_COPYAREA=y
-CONFIG_FB_CFB_IMAGEBLIT=y
-# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
-# CONFIG_FB_SYS_FILLRECT is not set
-# CONFIG_FB_SYS_COPYAREA is not set
-# CONFIG_FB_SYS_IMAGEBLIT is not set
-# CONFIG_FB_FOREIGN_ENDIAN is not set
-# CONFIG_FB_SYS_FOPS is not set
-# CONFIG_FB_WMT_GE_ROPS is not set
-# CONFIG_FB_SVGALIB is not set
-# CONFIG_FB_MACMODES is not set
-# CONFIG_FB_BACKLIGHT is not set
-# CONFIG_FB_MODE_HELPERS is not set
-# CONFIG_FB_TILEBLITTING is not set
-
-#
-# Frame buffer hardware drivers
-#
-# CONFIG_FB_S1D13XXX is not set
-# CONFIG_FB_TMIO is not set
-# CONFIG_FB_SMSCUFX is not set
-# CONFIG_FB_UDL is not set
-CONFIG_FB_DA8XX=y
-CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=5
-# CONFIG_FB_VIRTUAL is not set
-# CONFIG_FB_METRONOME is not set
-# CONFIG_FB_BROADSHEET is not set
-# CONFIG_FB_OMAP is not set
-# CONFIG_OMAP2_DSS is not set
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-CONFIG_LCD_CLASS_DEVICE=y
-# CONFIG_LCD_L4F00242T03 is not set
-# CONFIG_LCD_LMS283GF05 is not set
-# CONFIG_LCD_LTV350QV is not set
-# CONFIG_LCD_TDO24M is not set
-# CONFIG_LCD_VGG2432A4 is not set
-# CONFIG_LCD_PLATFORM is not set
-# CONFIG_LCD_S6E63M0 is not set
-# CONFIG_LCD_LD9040 is not set
-# CONFIG_LCD_AMS369FG06 is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
-CONFIG_BACKLIGHT_PWM=y
-# CONFIG_BACKLIGHT_ADP8860 is not set
-# CONFIG_BACKLIGHT_ADP8870 is not set
-CONFIG_BACKLIGHT_TLC59108=y
-
-#
-# Display device support
-#
-CONFIG_DISPLAY_SUPPORT=y
-
-#
-# Display hardware drivers
-#
-
-#
-# Console display driver support
-#
-CONFIG_DUMMY_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
-# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
-# CONFIG_FONTS is not set
-CONFIG_FONT_8x8=y
-CONFIG_FONT_8x16=y
-CONFIG_LOGO=y
-CONFIG_LOGO_LINUX_MONO=y
-CONFIG_LOGO_LINUX_VGA16=y
-CONFIG_LOGO_LINUX_CLUT224=y
-CONFIG_SOUND=y
-# CONFIG_SOUND_OSS_CORE is not set
-CONFIG_SND=y
-CONFIG_SND_TIMER=y
-CONFIG_SND_PCM=y
-CONFIG_SND_HWDEP=y
-CONFIG_SND_RAWMIDI=y
-CONFIG_SND_JACK=y
-# CONFIG_SND_SEQUENCER is not set
-# CONFIG_SND_MIXER_OSS is not set
-# CONFIG_SND_PCM_OSS is not set
-# CONFIG_SND_HRTIMER is not set
-# CONFIG_SND_DYNAMIC_MINORS is not set
-CONFIG_SND_SUPPORT_OLD_API=y
-CONFIG_SND_VERBOSE_PROCFS=y
-# CONFIG_SND_VERBOSE_PRINTK is not set
-# CONFIG_SND_DEBUG is not set
-# CONFIG_SND_RAWMIDI_SEQ is not set
-# CONFIG_SND_OPL3_LIB_SEQ is not set
-# CONFIG_SND_OPL4_LIB_SEQ is not set
-# CONFIG_SND_SBAWE_SEQ is not set
-# CONFIG_SND_EMU10K1_SEQ is not set
-CONFIG_SND_DRIVERS=y
-# CONFIG_SND_DUMMY is not set
-# CONFIG_SND_ALOOP is not set
-# CONFIG_SND_MTPAV is not set
-# CONFIG_SND_SERIAL_U16550 is not set
-# CONFIG_SND_MPU401 is not set
-CONFIG_SND_ARM=y
-CONFIG_SND_SPI=y
-CONFIG_SND_USB=y
-CONFIG_SND_USB_AUDIO=y
-# CONFIG_SND_USB_UA101 is not set
-# CONFIG_SND_USB_CAIAQ is not set
-# CONFIG_SND_USB_6FIRE is not set
-CONFIG_SND_SOC=y
-# CONFIG_SND_SOC_CACHE_LZO is not set
-CONFIG_SND_AM33XX_SOC=y
-CONFIG_SND_DAVINCI_SOC_MCASP=y
-CONFIG_SND_AM335X_SOC_EVM=y
-# CONFIG_SND_OMAP_SOC is not set
-CONFIG_SND_SOC_I2C_AND_SPI=y
-# CONFIG_SND_SOC_ALL_CODECS is not set
-CONFIG_SND_SOC_TLV320AIC3X=y
-# CONFIG_SOUND_PRIME is not set
-CONFIG_HID_SUPPORT=y
-CONFIG_HID=y
-# CONFIG_HIDRAW is not set
-
-#
-# USB Input Devices
-#
-CONFIG_USB_HID=y
-# CONFIG_HID_PID is not set
-# CONFIG_USB_HIDDEV is not set
-
-#
-# Special HID drivers
-#
-CONFIG_HID_A4TECH=y
-# CONFIG_HID_ACRUX is not set
-CONFIG_HID_APPLE=y
-CONFIG_HID_BELKIN=y
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-# CONFIG_HID_PRODIKEYS is not set
-CONFIG_HID_CYPRESS=y
-# CONFIG_HID_DRAGONRISE is not set
-# CONFIG_HID_EMS_FF is not set
-CONFIG_HID_EZKEY=y
-# CONFIG_HID_HOLTEK is not set
-# CONFIG_HID_KEYTOUCH is not set
-CONFIG_HID_KYE=y
-# CONFIG_HID_UCLOGIC is not set
-# CONFIG_HID_WALTOP is not set
-# CONFIG_HID_GYRATION is not set
-# CONFIG_HID_TWINHAN is not set
-CONFIG_HID_KENSINGTON=y
-# CONFIG_HID_LCPOWER is not set
-CONFIG_HID_LOGITECH=y
-CONFIG_HID_LOGITECH_DJ=m
-# CONFIG_LOGITECH_FF is not set
-# CONFIG_LOGIRUMBLEPAD2_FF is not set
-# CONFIG_LOGIG940_FF is not set
-# CONFIG_LOGIWHEELS_FF is not set
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-# CONFIG_HID_MULTITOUCH is not set
-# CONFIG_HID_NTRIG is not set
-# CONFIG_HID_ORTEK is not set
-# CONFIG_HID_PANTHERLORD is not set
-# CONFIG_HID_PETALYNX is not set
-# CONFIG_HID_PICOLCD is not set
-# CONFIG_HID_PRIMAX is not set
-# CONFIG_HID_QUANTA is not set
-# CONFIG_HID_ROCCAT is not set
-# CONFIG_HID_SAMSUNG is not set
-# CONFIG_HID_SONY is not set
-# CONFIG_HID_SPEEDLINK is not set
-# CONFIG_HID_SUNPLUS is not set
-# CONFIG_HID_GREENASIA is not set
-# CONFIG_HID_SMARTJOYPLUS is not set
-# CONFIG_HID_TOPSEED is not set
-# CONFIG_HID_THRUSTMASTER is not set
-# CONFIG_HID_ZEROPLUS is not set
-# CONFIG_HID_ZYDACRON is not set
-CONFIG_USB_SUPPORT=y
-CONFIG_USB_COMMON=y
-CONFIG_USB_ARCH_HAS_HCD=y
-CONFIG_USB_ARCH_HAS_OHCI=y
-CONFIG_USB_ARCH_HAS_EHCI=y
-# CONFIG_USB_ARCH_HAS_XHCI is not set
-CONFIG_USB=y
-# CONFIG_USB_DEBUG is not set
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-
-#
-# Miscellaneous USB options
-#
-CONFIG_USB_DEVICEFS=y
-CONFIG_USB_DEVICE_CLASS=y
-# CONFIG_USB_DYNAMIC_MINORS is not set
-CONFIG_USB_SUSPEND=y
-CONFIG_USB_OTG=y
-# CONFIG_USB_OTG_WHITELIST is not set
-# CONFIG_USB_OTG_BLACKLIST_HUB is not set
-# CONFIG_USB_DWC3 is not set
-# CONFIG_USB_MON is not set
-# CONFIG_USB_WUSB is not set
-# CONFIG_USB_WUSB_CBAF is not set
-
-#
-# USB Host Controller Drivers
-#
-# CONFIG_USB_C67X00_HCD is not set
-# CONFIG_USB_EHCI_HCD is not set
-# CONFIG_USB_OXU210HP_HCD is not set
-# CONFIG_USB_ISP116X_HCD is not set
-# CONFIG_USB_ISP1760_HCD is not set
-# CONFIG_USB_ISP1362_HCD is not set
-# CONFIG_USB_OHCI_HCD is not set
-# CONFIG_USB_SL811_HCD is not set
-# CONFIG_USB_R8A66597_HCD is not set
-# CONFIG_USB_HWA_HCD is not set
-CONFIG_USB_MUSB_HDRC=y
-
-#
-# Platform Glue Layer
-#
-# CONFIG_USB_MUSB_TUSB6010_GLUE is not set
-# CONFIG_USB_MUSB_OMAP2PLUS_GLUE is not set
-# CONFIG_USB_MUSB_AM35X_GLUE is not set
-CONFIG_USB_MUSB_TI81XX_GLUE=y
-# CONFIG_USB_MUSB_DAVINCI is not set
-# CONFIG_USB_MUSB_DA8XX is not set
-# CONFIG_USB_MUSB_TUSB6010 is not set
-# CONFIG_USB_MUSB_OMAP2PLUS is not set
-# CONFIG_USB_MUSB_AM35X is not set
-CONFIG_USB_MUSB_TI81XX=y
-# CONFIG_USB_MUSB_BLACKFIN is not set
-# CONFIG_USB_MUSB_UX500 is not set
-CONFIG_MUSB_PIO_ONLY=y
-# CONFIG_USB_INVENTRA_DMA is not set
-# CONFIG_USB_TI_CPPI_DMA is not set
-# CONFIG_USB_TI_CPPI41_DMA is not set
-# CONFIG_USB_TUSB_OMAP_DMA is not set
-# CONFIG_USB_UX500_DMA is not set
-# CONFIG_USB_RENESAS_USBHS is not set
-
-#
-# USB Device Class drivers
-#
-# CONFIG_USB_ACM is not set
-# CONFIG_USB_PRINTER is not set
-# CONFIG_USB_WDM is not set
-# CONFIG_USB_TMC is not set
-
-#
-# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
-#
-
-#
-# also be needed; see USB_STORAGE Help for more info
-#
-CONFIG_USB_STORAGE=y
-# CONFIG_USB_STORAGE_DEBUG is not set
-# CONFIG_USB_STORAGE_REALTEK is not set
-# CONFIG_USB_STORAGE_DATAFAB is not set
-# CONFIG_USB_STORAGE_FREECOM is not set
-# CONFIG_USB_STORAGE_ISD200 is not set
-# CONFIG_USB_STORAGE_USBAT is not set
-# CONFIG_USB_STORAGE_SDDR09 is not set
-# CONFIG_USB_STORAGE_SDDR55 is not set
-# CONFIG_USB_STORAGE_JUMPSHOT is not set
-# CONFIG_USB_STORAGE_ALAUDA is not set
-# CONFIG_USB_STORAGE_ONETOUCH is not set
-# CONFIG_USB_STORAGE_KARMA is not set
-# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
-# CONFIG_USB_STORAGE_ENE_UB6250 is not set
-# CONFIG_USB_UAS is not set
-# CONFIG_USB_LIBUSUAL is not set
-
-#
-# USB Imaging devices
-#
-# CONFIG_USB_MDC800 is not set
-# CONFIG_USB_MICROTEK is not set
-
-#
-# USB port drivers
-#
-# CONFIG_USB_SERIAL is not set
-
-#
-# USB Miscellaneous drivers
-#
-# CONFIG_USB_EMI62 is not set
-# CONFIG_USB_EMI26 is not set
-# CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_SEVSEG is not set
-# CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_LED is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
-# CONFIG_USB_APPLEDISPLAY is not set
-# CONFIG_USB_SISUSBVGA is not set
-# CONFIG_USB_LD is not set
-# CONFIG_USB_TRANCEVIBRATOR is not set
-# CONFIG_USB_IOWARRIOR is not set
-# CONFIG_USB_TEST is not set
-# CONFIG_USB_ISIGHTFW is not set
-# CONFIG_USB_YUREX is not set
-CONFIG_USB_GADGET=y
-# CONFIG_USB_GADGET_DEBUG_FILES is not set
-# CONFIG_USB_GADGET_DEBUG_FS is not set
-CONFIG_USB_GADGET_VBUS_DRAW=2
-CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
-# CONFIG_USB_FUSB300 is not set
-# CONFIG_USB_OMAP is not set
-# CONFIG_USB_R8A66597 is not set
-CONFIG_USB_GADGET_MUSB_HDRC=y
-# CONFIG_USB_M66592 is not set
-# CONFIG_USB_NET2272 is not set
-# CONFIG_USB_DUMMY_HCD is not set
-CONFIG_USB_GADGET_DUALSPEED=y
-# CONFIG_USB_ZERO is not set
-# CONFIG_USB_AUDIO is not set
-CONFIG_USB_ETH=m
-CONFIG_USB_ETH_RNDIS=y
-# CONFIG_USB_ETH_EEM is not set
-# CONFIG_USB_G_NCM is not set
-# CONFIG_USB_GADGETFS is not set
-# CONFIG_USB_FUNCTIONFS is not set
-CONFIG_USB_FILE_STORAGE=m
-# CONFIG_USB_FILE_STORAGE_TEST is not set
-CONFIG_USB_MASS_STORAGE=m
-# CONFIG_USB_G_SERIAL is not set
-# CONFIG_USB_MIDI_GADGET is not set
-# CONFIG_USB_G_PRINTER is not set
-# CONFIG_USB_CDC_COMPOSITE is not set
-# CONFIG_USB_G_ACM_MS is not set
-# CONFIG_USB_G_MULTI is not set
-# CONFIG_USB_G_HID is not set
-# CONFIG_USB_G_DBGP is not set
-# CONFIG_USB_G_WEBCAM is not set
-
-#
-# OTG and related infrastructure
-#
-CONFIG_USB_OTG_UTILS=y
-# CONFIG_USB_GPIO_VBUS is not set
-# CONFIG_USB_ULPI is not set
-# CONFIG_TWL6030_USB is not set
-CONFIG_NOP_USB_XCEIV=y
-CONFIG_MMC=y
-# CONFIG_MMC_DEBUG is not set
-CONFIG_MMC_UNSAFE_RESUME=y
-# CONFIG_MMC_CLKGATE is not set
-
-#
-# MMC/SD/SDIO Card Drivers
-#
-CONFIG_MMC_BLOCK=y
-CONFIG_MMC_BLOCK_MINORS=8
-CONFIG_MMC_BLOCK_BOUNCE=y
-# CONFIG_SDIO_UART is not set
-# CONFIG_MMC_TEST is not set
-
-#
-# MMC/SD/SDIO Host Controller Drivers
-#
-# CONFIG_MMC_SDHCI is not set
-# CONFIG_MMC_SDHCI_PXAV3 is not set
-# CONFIG_MMC_SDHCI_PXAV2 is not set
-# CONFIG_MMC_OMAP is not set
-CONFIG_MMC_OMAP_HS=y
-# CONFIG_MMC_SPI is not set
-# CONFIG_MMC_DW is not set
-# CONFIG_MMC_VUB300 is not set
-# CONFIG_MMC_USHC is not set
-# CONFIG_MEMSTICK is not set
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-
-#
-# LED drivers
-#
-# CONFIG_LEDS_LM3530 is not set
-# CONFIG_LEDS_PCA9532 is not set
-CONFIG_LEDS_GPIO=y
-# CONFIG_LEDS_LP3944 is not set
-# CONFIG_LEDS_LP5521 is not set
-# CONFIG_LEDS_LP5523 is not set
-# CONFIG_LEDS_PCA955X is not set
-# CONFIG_LEDS_DAC124S085 is not set
-# CONFIG_LEDS_PWM is not set
-# CONFIG_LEDS_REGULATOR is not set
-# CONFIG_LEDS_BD2802 is not set
-# CONFIG_LEDS_LT3593 is not set
-# CONFIG_LEDS_RENESAS_TPU is not set
-CONFIG_LEDS_TRIGGERS=y
-
-#
-# LED Triggers
-#
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
-# CONFIG_LEDS_TRIGGER_GPIO is not set
-# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
-
-#
-# iptables trigger is under Netfilter config (LED target)
-#
-# CONFIG_ACCESSIBILITY is not set
-CONFIG_RTC_LIB=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_HCTOSYS=y
-CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
-# CONFIG_RTC_DEBUG is not set
-
-#
-# RTC interfaces
-#
-CONFIG_RTC_INTF_SYSFS=y
-CONFIG_RTC_INTF_PROC=y
-CONFIG_RTC_INTF_DEV=y
-# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
-# CONFIG_RTC_DRV_TEST is not set
-
-#
-# I2C RTC drivers
-#
-# CONFIG_RTC_DRV_DS1307 is not set
-# CONFIG_RTC_DRV_DS1374 is not set
-# CONFIG_RTC_DRV_DS1672 is not set
-# CONFIG_RTC_DRV_DS3232 is not set
-# CONFIG_RTC_DRV_MAX6900 is not set
-# CONFIG_RTC_DRV_RS5C372 is not set
-# CONFIG_RTC_DRV_ISL1208 is not set
-# CONFIG_RTC_DRV_ISL12022 is not set
-# CONFIG_RTC_DRV_X1205 is not set
-# CONFIG_RTC_DRV_PCF8563 is not set
-# CONFIG_RTC_DRV_PCF8583 is not set
-# CONFIG_RTC_DRV_M41T80 is not set
-# CONFIG_RTC_DRV_BQ32K is not set
-# CONFIG_RTC_DRV_TWL4030 is not set
-# CONFIG_RTC_DRV_S35390A is not set
-# CONFIG_RTC_DRV_FM3130 is not set
-# CONFIG_RTC_DRV_RX8581 is not set
-# CONFIG_RTC_DRV_RX8025 is not set
-# CONFIG_RTC_DRV_EM3027 is not set
-# CONFIG_RTC_DRV_RV3029C2 is not set
-
-#
-# SPI RTC drivers
-#
-# CONFIG_RTC_DRV_M41T93 is not set
-# CONFIG_RTC_DRV_M41T94 is not set
-# CONFIG_RTC_DRV_DS1305 is not set
-# CONFIG_RTC_DRV_DS1390 is not set
-# CONFIG_RTC_DRV_MAX6902 is not set
-# CONFIG_RTC_DRV_R9701 is not set
-# CONFIG_RTC_DRV_RS5C348 is not set
-# CONFIG_RTC_DRV_DS3234 is not set
-# CONFIG_RTC_DRV_PCF2123 is not set
-
-#
-# Platform RTC drivers
-#
-# CONFIG_RTC_DRV_CMOS is not set
-# CONFIG_RTC_DRV_DS1286 is not set
-# CONFIG_RTC_DRV_DS1511 is not set
-# CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_DS1742 is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
-# CONFIG_RTC_DRV_M48T86 is not set
-# CONFIG_RTC_DRV_M48T35 is not set
-# CONFIG_RTC_DRV_M48T59 is not set
-# CONFIG_RTC_DRV_MSM6242 is not set
-# CONFIG_RTC_DRV_BQ4802 is not set
-# CONFIG_RTC_DRV_RP5C01 is not set
-# CONFIG_RTC_DRV_V3020 is not set
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_OMAP=y
-# CONFIG_DMADEVICES is not set
-# CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
-
-#
-# Virtio drivers
-#
-# CONFIG_VIRTIO_BALLOON is not set
-# CONFIG_VIRTIO_MMIO is not set
-# CONFIG_STAGING is not set
-CONFIG_CLKDEV_LOOKUP=y
-
-#
-# Hardware Spinlock drivers
-#
-CONFIG_CLKSRC_MMIO=y
-# CONFIG_IOMMU_SUPPORT is not set
-# CONFIG_VIRT_DRIVERS is not set
-# CONFIG_PM_DEVFREQ is not set
-
-#
-# File systems
-#
-CONFIG_EXT2_FS=y
-# CONFIG_EXT2_FS_XATTR is not set
-# CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=y
-CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
-# CONFIG_EXT3_FS_XATTR is not set
-# CONFIG_EXT4_FS is not set
-CONFIG_JBD=y
-# CONFIG_JBD_DEBUG is not set
-# CONFIG_REISERFS_FS is not set
-# CONFIG_JFS_FS is not set
-# CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
-# CONFIG_BTRFS_FS is not set
-# CONFIG_NILFS2_FS is not set
-CONFIG_FS_POSIX_ACL=y
-CONFIG_FILE_LOCKING=y
-CONFIG_FSNOTIFY=y
-CONFIG_DNOTIFY=y
-CONFIG_INOTIFY_USER=y
-# CONFIG_FANOTIFY is not set
-CONFIG_QUOTA=y
-# CONFIG_QUOTA_NETLINK_INTERFACE is not set
-CONFIG_PRINT_QUOTA_WARNING=y
-# CONFIG_QUOTA_DEBUG is not set
-CONFIG_QUOTA_TREE=y
-# CONFIG_QFMT_V1 is not set
-CONFIG_QFMT_V2=y
-CONFIG_QUOTACTL=y
-# CONFIG_AUTOFS4_FS is not set
-# CONFIG_FUSE_FS is not set
-
-#
-# Caches
-#
-# CONFIG_FSCACHE is not set
-
-#
-# CD-ROM/DVD Filesystems
-#
-# CONFIG_ISO9660_FS is not set
-# CONFIG_UDF_FS is not set
-
-#
-# DOS/FAT/NT Filesystems
-#
-CONFIG_FAT_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_FAT_DEFAULT_CODEPAGE=437
-CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
-# CONFIG_NTFS_FS is not set
-
-#
-# Pseudo filesystems
-#
-CONFIG_PROC_FS=y
-CONFIG_PROC_SYSCTL=y
-CONFIG_PROC_PAGE_MONITOR=y
-CONFIG_SYSFS=y
-CONFIG_TMPFS=y
-# CONFIG_TMPFS_POSIX_ACL is not set
-# CONFIG_TMPFS_XATTR is not set
-# CONFIG_HUGETLB_PAGE is not set
-# CONFIG_CONFIGFS_FS is not set
-CONFIG_MISC_FILESYSTEMS=y
-# CONFIG_ADFS_FS is not set
-# CONFIG_AFFS_FS is not set
-# CONFIG_ECRYPT_FS is not set
-# CONFIG_HFS_FS is not set
-# CONFIG_HFSPLUS_FS is not set
-# CONFIG_BEFS_FS is not set
-# CONFIG_BFS_FS is not set
-# CONFIG_EFS_FS is not set
-# CONFIG_JFFS2_FS is not set
-CONFIG_UBIFS_FS=y
-# CONFIG_UBIFS_FS_XATTR is not set
-# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
-CONFIG_UBIFS_FS_LZO=y
-CONFIG_UBIFS_FS_ZLIB=y
-# CONFIG_UBIFS_FS_DEBUG is not set
-# CONFIG_LOGFS is not set
-CONFIG_CRAMFS=y
-# CONFIG_SQUASHFS is not set
-# CONFIG_VXFS_FS is not set
-# CONFIG_MINIX_FS is not set
-# CONFIG_OMFS_FS is not set
-# CONFIG_HPFS_FS is not set
-# CONFIG_QNX4FS_FS is not set
-# CONFIG_ROMFS_FS is not set
-# CONFIG_PSTORE is not set
-# CONFIG_SYSV_FS is not set
-# CONFIG_UFS_FS is not set
-CONFIG_NETWORK_FILESYSTEMS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_NFS_V4=y
-# CONFIG_NFS_V4_1 is not set
-CONFIG_ROOT_NFS=y
-# CONFIG_NFS_USE_LEGACY_DNS is not set
-CONFIG_NFS_USE_KERNEL_DNS=y
-# CONFIG_NFS_USE_NEW_IDMAPPER is not set
-# CONFIG_NFSD is not set
-CONFIG_LOCKD=y
-CONFIG_LOCKD_V4=y
-CONFIG_NFS_ACL_SUPPORT=y
-CONFIG_NFS_COMMON=y
-CONFIG_SUNRPC=y
-CONFIG_SUNRPC_GSS=y
-# CONFIG_CEPH_FS is not set
-# CONFIG_CIFS is not set
-# CONFIG_NCP_FS is not set
-# CONFIG_CODA_FS is not set
-# CONFIG_AFS_FS is not set
-
-#
-# Partition Types
-#
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_ACORN_PARTITION is not set
-# CONFIG_OSF_PARTITION is not set
-# CONFIG_AMIGA_PARTITION is not set
-# CONFIG_ATARI_PARTITION is not set
-# CONFIG_MAC_PARTITION is not set
-CONFIG_MSDOS_PARTITION=y
-# CONFIG_BSD_DISKLABEL is not set
-# CONFIG_MINIX_SUBPARTITION is not set
-# CONFIG_SOLARIS_X86_PARTITION is not set
-# CONFIG_UNIXWARE_DISKLABEL is not set
-# CONFIG_LDM_PARTITION is not set
-# CONFIG_SGI_PARTITION is not set
-# CONFIG_ULTRIX_PARTITION is not set
-# CONFIG_SUN_PARTITION is not set
-# CONFIG_KARMA_PARTITION is not set
-# CONFIG_EFI_PARTITION is not set
-# CONFIG_SYSV68_PARTITION is not set
-CONFIG_NLS=y
-CONFIG_NLS_DEFAULT="iso8859-1"
-CONFIG_NLS_CODEPAGE_437=y
-# CONFIG_NLS_CODEPAGE_737 is not set
-# CONFIG_NLS_CODEPAGE_775 is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
-# CONFIG_NLS_CODEPAGE_852 is not set
-# CONFIG_NLS_CODEPAGE_855 is not set
-# CONFIG_NLS_CODEPAGE_857 is not set
-# CONFIG_NLS_CODEPAGE_860 is not set
-# CONFIG_NLS_CODEPAGE_861 is not set
-# CONFIG_NLS_CODEPAGE_862 is not set
-# CONFIG_NLS_CODEPAGE_863 is not set
-# CONFIG_NLS_CODEPAGE_864 is not set
-# CONFIG_NLS_CODEPAGE_865 is not set
-# CONFIG_NLS_CODEPAGE_866 is not set
-# CONFIG_NLS_CODEPAGE_869 is not set
-# CONFIG_NLS_CODEPAGE_936 is not set
-# CONFIG_NLS_CODEPAGE_950 is not set
-# CONFIG_NLS_CODEPAGE_932 is not set
-# CONFIG_NLS_CODEPAGE_949 is not set
-# CONFIG_NLS_CODEPAGE_874 is not set
-# CONFIG_NLS_ISO8859_8 is not set
-# CONFIG_NLS_CODEPAGE_1250 is not set
-# CONFIG_NLS_CODEPAGE_1251 is not set
-# CONFIG_NLS_ASCII is not set
-CONFIG_NLS_ISO8859_1=y
-# CONFIG_NLS_ISO8859_2 is not set
-# CONFIG_NLS_ISO8859_3 is not set
-# CONFIG_NLS_ISO8859_4 is not set
-# CONFIG_NLS_ISO8859_5 is not set
-# CONFIG_NLS_ISO8859_6 is not set
-# CONFIG_NLS_ISO8859_7 is not set
-# CONFIG_NLS_ISO8859_9 is not set
-# CONFIG_NLS_ISO8859_13 is not set
-# CONFIG_NLS_ISO8859_14 is not set
-# CONFIG_NLS_ISO8859_15 is not set
-# CONFIG_NLS_KOI8_R is not set
-# CONFIG_NLS_KOI8_U is not set
-# CONFIG_NLS_UTF8 is not set
-
-#
-# Kernel hacking
-#
-CONFIG_PRINTK_TIME=y
-CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
-CONFIG_ENABLE_WARN_DEPRECATED=y
-CONFIG_ENABLE_MUST_CHECK=y
-CONFIG_FRAME_WARN=1024
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_STRIP_ASM_SYMS is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-CONFIG_DEBUG_FS=y
-# CONFIG_HEADERS_CHECK is not set
-# CONFIG_DEBUG_SECTION_MISMATCH is not set
-# CONFIG_DEBUG_KERNEL is not set
-# CONFIG_HARDLOCKUP_DETECTOR is not set
-# CONFIG_SPARSE_RCU_POINTER is not set
-CONFIG_DEBUG_BUGVERBOSE=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_LKDTM is not set
-# CONFIG_SYSCTL_SYSCALL_CHECK is not set
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
-CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
-CONFIG_HAVE_C_RECORDMCOUNT=y
-CONFIG_RING_BUFFER=y
-CONFIG_RING_BUFFER_ALLOW_SWAP=y
-CONFIG_TRACING_SUPPORT=y
-# CONFIG_FTRACE is not set
-CONFIG_DYNAMIC_DEBUG=y
-# CONFIG_DMA_API_DEBUG is not set
-# CONFIG_ATOMIC64_SELFTEST is not set
-# CONFIG_SAMPLES is not set
-CONFIG_HAVE_ARCH_KGDB=y
-# CONFIG_TEST_KSTRTOX is not set
-# CONFIG_STRICT_DEVMEM is not set
-# CONFIG_ARM_UNWIND is not set
-# CONFIG_DEBUG_USER is not set
-CONFIG_DEBUG_JTAG_ENABLE=y
-
-#
-# Security options
-#
-CONFIG_KEYS=y
-# CONFIG_ENCRYPTED_KEYS is not set
-# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
-# CONFIG_SECURITY_DMESG_RESTRICT is not set
-CONFIG_SECURITY=y
-# CONFIG_SECURITYFS is not set
-# CONFIG_SECURITY_NETWORK is not set
-# CONFIG_SECURITY_PATH is not set
-# CONFIG_SECURITY_TOMOYO is not set
-# CONFIG_SECURITY_APPARMOR is not set
-# CONFIG_IMA is not set
-# CONFIG_EVM is not set
-CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_DEFAULT_SECURITY=""
-CONFIG_CRYPTO=y
-
-#
-# Crypto core or helper
-#
-CONFIG_CRYPTO_ALGAPI=y
-CONFIG_CRYPTO_ALGAPI2=y
-CONFIG_CRYPTO_AEAD=y
-CONFIG_CRYPTO_AEAD2=y
-CONFIG_CRYPTO_BLKCIPHER=y
-CONFIG_CRYPTO_BLKCIPHER2=y
-CONFIG_CRYPTO_HASH=y
-CONFIG_CRYPTO_HASH2=y
-CONFIG_CRYPTO_RNG=y
-CONFIG_CRYPTO_RNG2=y
-CONFIG_CRYPTO_PCOMP2=y
-CONFIG_CRYPTO_MANAGER=y
-CONFIG_CRYPTO_MANAGER2=y
-# CONFIG_CRYPTO_USER is not set
-# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
-# CONFIG_CRYPTO_GF128MUL is not set
-# CONFIG_CRYPTO_NULL is not set
-CONFIG_CRYPTO_WORKQUEUE=y
-# CONFIG_CRYPTO_CRYPTD is not set
-# CONFIG_CRYPTO_AUTHENC is not set
-CONFIG_CRYPTO_TEST=m
-
-#
-# Authenticated Encryption with Associated Data
-#
-# CONFIG_CRYPTO_CCM is not set
-# CONFIG_CRYPTO_GCM is not set
-CONFIG_CRYPTO_SEQIV=y
-
-#
-# Block modes
-#
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_CTR=y
-# CONFIG_CRYPTO_CTS is not set
-CONFIG_CRYPTO_ECB=y
-# CONFIG_CRYPTO_LRW is not set
-# CONFIG_CRYPTO_PCBC is not set
-# CONFIG_CRYPTO_XTS is not set
-
-#
-# Hash modes
-#
-CONFIG_CRYPTO_HMAC=y
-# CONFIG_CRYPTO_XCBC is not set
-# CONFIG_CRYPTO_VMAC is not set
-
-#
-# Digest
-#
-CONFIG_CRYPTO_CRC32C=y
-# CONFIG_CRYPTO_GHASH is not set
-# CONFIG_CRYPTO_MD4 is not set
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_MICHAEL_MIC=y
-# CONFIG_CRYPTO_RMD128 is not set
-# CONFIG_CRYPTO_RMD160 is not set
-# CONFIG_CRYPTO_RMD256 is not set
-# CONFIG_CRYPTO_RMD320 is not set
-CONFIG_CRYPTO_SHA1=y
-CONFIG_CRYPTO_SHA256=y
-# CONFIG_CRYPTO_SHA512 is not set
-# CONFIG_CRYPTO_TGR192 is not set
-# CONFIG_CRYPTO_WP512 is not set
-
-#
-# Ciphers
-#
-CONFIG_CRYPTO_AES=y
-# CONFIG_CRYPTO_ANUBIS is not set
-CONFIG_CRYPTO_ARC4=y
-# CONFIG_CRYPTO_BLOWFISH is not set
-# CONFIG_CRYPTO_CAMELLIA is not set
-# CONFIG_CRYPTO_CAST5 is not set
-# CONFIG_CRYPTO_CAST6 is not set
-CONFIG_CRYPTO_DES=y
-# CONFIG_CRYPTO_FCRYPT is not set
-# CONFIG_CRYPTO_KHAZAD is not set
-# CONFIG_CRYPTO_SALSA20 is not set
-# CONFIG_CRYPTO_SEED is not set
-# CONFIG_CRYPTO_SERPENT is not set
-# CONFIG_CRYPTO_TEA is not set
-# CONFIG_CRYPTO_TWOFISH is not set
-
-#
-# Compression
-#
-CONFIG_CRYPTO_DEFLATE=y
-# CONFIG_CRYPTO_ZLIB is not set
-CONFIG_CRYPTO_LZO=y
-
-#
-# Random Number Generation
-#
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_USER_API_HASH is not set
-# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
-CONFIG_CRYPTO_HW=y
-CONFIG_CRYPTO_DEV_OMAP4_AES=y
-CONFIG_CRYPTO_DEV_OMAP4_SHAM=y
-
-#
-# OCF Configuration
-#
-CONFIG_OCF_OCF=y
-# CONFIG_OCF_RANDOMHARVEST is not set
-CONFIG_OCF_CRYPTODEV=y
-CONFIG_OCF_CRYPTOSOFT=y
-# CONFIG_OCF_OCFNULL is not set
-# CONFIG_OCF_BENCH is not set
-# CONFIG_BINARY_PRINTF is not set
-
-#
-# Library routines
-#
-CONFIG_BITREVERSE=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC16=y
-CONFIG_CRC_T10DIF=y
-CONFIG_CRC_ITU_T=y
-CONFIG_CRC32=y
-CONFIG_CRC7=y
-CONFIG_LIBCRC32C=y
-# CONFIG_CRC8 is not set
-CONFIG_ZLIB_INFLATE=y
-CONFIG_ZLIB_DEFLATE=y
-CONFIG_LZO_COMPRESS=y
-CONFIG_LZO_DECOMPRESS=y
-CONFIG_XZ_DEC=y
-CONFIG_XZ_DEC_X86=y
-CONFIG_XZ_DEC_POWERPC=y
-CONFIG_XZ_DEC_IA64=y
-CONFIG_XZ_DEC_ARM=y
-CONFIG_XZ_DEC_ARMTHUMB=y
-CONFIG_XZ_DEC_SPARC=y
-CONFIG_XZ_DEC_BCJ=y
-# CONFIG_XZ_DEC_TEST is not set
-CONFIG_DECOMPRESS_GZIP=y
-CONFIG_DECOMPRESS_BZIP2=y
-CONFIG_DECOMPRESS_LZMA=y
-CONFIG_DECOMPRESS_XZ=y
-CONFIG_DECOMPRESS_LZO=y
-CONFIG_GENERIC_ALLOCATOR=y
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_IOPORT=y
-CONFIG_HAS_DMA=y
-CONFIG_NLATTR=y
-CONFIG_AVERAGE=y
-# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb b/recipes-kernel/linux/linux-am335x-psp-3.2.bb
similarity index 68%
rename from recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb
rename to recipes-kernel/linux/linux-am335x-psp-3.2.bb
index 74394a6..f55fc4c 100644
--- a/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2.bb
@@ -15,12 +15,12 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
-# This SRCREV corresponds to tag v3.2_AM335xPSP_04.06.00.08
-SRCREV = "d7e124e8074cccf9958290e773c88a4b2b36412b"
+# SRCREV corresponds to the commit id of tag v3.2_AM335xPSP_04.06.00.10-rc3
+SRCREV = "18ce4a630452348b8308b922491130e8ce1e9134"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-am33x.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
@@ -29,8 +29,8 @@ SRC_URI = "git://arago-project.org/git/projects/linux-am33x.git;protocol=git;bra
 
 S = "${WORKDIR}/git"
 
-# Allow a layer to easily add to the list of patches or completely override them.
-KERNEL_PATCHES ?= "${PATCHES}"
+# Allow a layer to easily add to the list of patches or completely override them
+KERNEL_PATCHES = "${PATCHES}"
 
 # Add a set of patches that enabled features, fixed bugs or disabled buggy features
 # that weren't part of the official PSP release
@@ -52,13 +52,25 @@ PATCHES += "file://0001-am33x-Add-memory-addresses-for-crypto-modules.patch \
                 file://0001-am335x-Add-crypto-driver-settings-to-defconfig.patch \
                 file://0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch \
                 file://0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch \
+                file://0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch \
+                file://0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch \
+                file://0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch \
+                file://0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch \
+                file://0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch \
+                file://0006-crypto-omap4-aes-User-finer-grained-PM-management.patch \
+                file://0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch \
+                file://0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch \
+                file://0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch \
+                file://0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch \
+                file://0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch \
                "
 
 # Add SmartReflex support early driver patches while working to get the driver
 # upstream.
 PATCHES += "file://0001-am33xx-Add-SmartReflex-support.patch \
-                file://0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch \
-               "
+            file://0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch \
+            file://0002-Smartreflex-limited-to-ES-1.0.patch \
+           "
 
 # Add a patch to the omap-serial driver to allow suspend/resume during
 # Bluetooth traffic
@@ -73,8 +85,11 @@ PATCHES += "file://0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
 # Add patch to enable pullup on WLAN enable
 PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
 
+# Update SPI flash layout. Increase space allocated for u-boot
+PATCHES += "file://0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch"
+
 # Copy the am33x-cm3 firmware if it is available
-do_compile_prepend() {
+do_configure_append() {
     if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
     then
         cp "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" "${S}/firmware"
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch
new file mode 100644
index 0000000..3fe831c
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-AM33xx-hwmod-Convert-SHA0-crypto-device-data-to-.patch
@@ -0,0 +1,168 @@
+From 9193aa814bde2b56aaae1949d42d8849cb60260e Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 09:20:16 -0700
+Subject: [PATCH 01/10] ARM: AM33xx: hwmod: Convert SHA0 crypto device data to
+ hwmod
+
+Convert the device data for the AM33xx SHA0 crypto modules
+from explicit platform_data to hwmod.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ arch/arm/mach-omap2/devices.c              | 68 +++---------------------------
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 32 ++++++++++++++
+ 2 files changed, 39 insertions(+), 61 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index c2e1d84..3679369 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -726,72 +726,18 @@ static void omap_init_sham(void)
+ }
+ 
+ #elif defined(CONFIG_CRYPTO_DEV_OMAP4_SHAM) || defined(CONFIG_CRYPTO_DEV_OMAP4_SHAM_MODULE)
+-
+-static struct resource omap4_sham_resources[] = {
+-	{
+-		.start	= AM33XX_SHA1MD5_P_BASE,
+-		.end	= AM33XX_SHA1MD5_P_BASE + 0x120,
+-		.flags	= IORESOURCE_MEM,
+-	},
+-	{
+-		.start	= AM33XX_IRQ_SHAEIP57t0_P,
+-		.flags	= IORESOURCE_IRQ,
+-	},
+-	{
+-		.start	= AM33XX_DMA_SHAEIP57T0_DIN,
+-		.flags	= IORESOURCE_DMA,
+-	}
+-};
+-
+-static int omap4_sham_resources_sz = ARRAY_SIZE(omap4_sham_resources);
+-
+-
+-static struct platform_device sham_device = {
+-	.name		= "omap4-sham",
+-	.id		= -1,
+-};
+-
+-#if 0
+-static void omap_init_sham(void)
+-{
+-	sham_device.resource = omap4_sham_resources;
+-	sham_device.num_resources = omap4_sham_resources_sz;
+-
+-	platform_device_register(&sham_device);
+-}
+-#endif
+-
+-int __init omap_init_sham(void)
++static void __init omap_init_sham(void)
+ {
+-	int id = -1;
+-	struct platform_device *pdev;
+ 	struct omap_hwmod *oh;
+-	char *oh_name = "sha0";
+-	char *name = "omap4-sham";
+-
+-	oh = omap_hwmod_lookup(oh_name);
+-	if (!oh) {
+-		pr_err("Could not look up %s\n", oh_name);
+-		return -ENODEV;
+-	}
+-
+-	pdev = omap_device_build(name, id, oh, NULL, 0, NULL, 0, 0);
+-	//pdev.resource = omap4_sham_resources;
+-	//pdev.num_resources = omap4_sham_resources_sz;
++	struct platform_device *pdev;
+ 
+-	if (IS_ERR(pdev)) {
+-		WARN(1, "Can't build omap_device for %s:%s.\n",
+-						name, oh->name);
+-		return PTR_ERR(pdev);
+-	}
++	oh = omap_hwmod_lookup("sha0");
++	if (!oh)
++		return;
+ 
+-	return 0;
++	pdev = omap_device_build("omap4-sham", -1, oh, NULL, 0, NULL, 0, 0);
++	WARN(IS_ERR(pdev), "Can't build omap_device for omap-sham\n");
+ }
+-
+-
+-
+-
+-
+ #else
+ static inline void omap_init_sham(void) { }
+ #endif
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index ee3ebd9..ad606c6 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -79,6 +79,7 @@ static struct omap_hwmod am33xx_spi1_hwmod;
+ static struct omap_hwmod am33xx_elm_hwmod;
+ static struct omap_hwmod am33xx_adc_tsc_hwmod;
+ static struct omap_hwmod am33xx_rtc_hwmod;
++static struct omap_hwmod am33xx_sha0_hwmod;
+ static struct omap_hwmod am33xx_mcasp0_hwmod;
+ static struct omap_hwmod am33xx_mcasp1_hwmod;
+ static struct omap_hwmod am33xx_ehrpwm0_hwmod;
+@@ -2167,8 +2168,16 @@ static struct omap_hwmod am33xx_rtc_hwmod = {
+ };
+ 
+ /* sha0 */
++static struct omap_hwmod_class_sysconfig am33xx_sha0_sysc = {
++	.rev_offs	= 0x100,
++	.sysc_offs	= 0x110,
++	.syss_offs	= 0x114,
++	.sysc_flags	= SYSS_HAS_RESET_STATUS,
++};
++
+ static struct omap_hwmod_class am33xx_sha0_hwmod_class = {
+ 	.name		= "sha0",
++	.sysc		= &am33xx_sha0_sysc,
+ };
+ 
+ static struct omap_hwmod_irq_info am33xx_sha0_irqs[] = {
+@@ -2181,6 +2190,27 @@ static struct omap_hwmod_dma_info am33xx_sha0_dma[] = {
+ 	{ .dma_req = -1 }
+ };
+ 
++struct omap_hwmod_addr_space am33xx_sha0_addr_space[] = {
++	{
++		.pa_start	= 0x53100000,
++		.pa_end		= 0x53100000 + SZ_1M - 1,
++		.flags		= ADDR_TYPE_RT,
++	},
++	{ }
++};
++
++struct omap_hwmod_ocp_if am33xx_l3_core__sha0 = {
++	.master		= &am33xx_l3_main_hwmod,
++	.slave		= &am33xx_sha0_hwmod,
++	.clk		= "sha0_fck",
++	.addr		= am33xx_sha0_addr_space,
++	.user		= OCP_USER_MPU,
++};
++
++static struct omap_hwmod_ocp_if *am33xx_sha0_slaves[] = {
++	&am33xx_l3_core__sha0,
++};
++
+ static struct omap_hwmod am33xx_sha0_hwmod = {
+ 	.name		= "sha0",
+ 	.class		= &am33xx_sha0_hwmod_class,
+@@ -2194,6 +2224,8 @@ static struct omap_hwmod am33xx_sha0_hwmod = {
+ 			.modulemode	= MODULEMODE_SWCTRL,
+ 		},
+ 	},
++	.slaves		= am33xx_sha0_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_sha0_slaves),
+ };
+ 
+ /* 'smartreflex' class */
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch
new file mode 100644
index 0000000..29b95bb
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch
@@ -0,0 +1,40 @@
+From 54690cd10741ec54acc2555c3b699de310571a49 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@ti.com>
+Date: Fri, 7 Dec 2012 14:01:51 -0700
+Subject: [PATCH] ARM: OMAP2+: AM335x: Update SPI flash layout
+
+Current U-Boot has grown, and our size of the environment was never
+correct, rework the offsets for minimal impact.
+
+Signed-off-by: Tom Rini <trini@ti.com>
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 50e1d9b..3357d88 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1201,17 +1201,17 @@ static struct mtd_partition am335x_spi_partitions[] = {
+ 	{
+ 		.name       = "U-Boot",
+ 		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x20000 */
+-		.size       = 2 * SZ_128K,
++		.size       = (3 * SZ_128K) - SZ_4K,
+ 	},
+ 	{
+ 		.name       = "U-Boot Env",
+-		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x60000 */
+-		.size       = 2 * SZ_4K,
++		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x7F000 */
++		.size       = SZ_4K,
+ 	},
+ 	{
+ 		.name       = "Kernel",
+-		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x62000 */
+-		.size       = 28 * SZ_128K,
++		.offset     = MTDPART_OFS_APPEND,	/* Offset = 0x80000 */
++		.size       = 866 * SZ_4K,		/* size = 0x362000 */
+ 	},
+ 	{
+ 		.name       = "File System",
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am3358-sk-modified-WLAN-enable-and-irq-to-match-boar.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
similarity index 83%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
index 46f02cb..bb48d69 100644
--- a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-crypto-driver-settings-to-defconfig.patch
@@ -1,31 +1,32 @@
-From 1edc97015f69fac420c32df514e1d1d546041d42 Mon Sep 17 00:00:00 2001
+From cf67829e0c0cccb06a9f33d40fe43a122e8a5178 Mon Sep 17 00:00:00 2001
 From: Greg Turner <gregturner@ti.com>
 Date: Fri, 8 Jun 2012 13:54:13 -0500
-Subject: [PATCH] [am335x]: Add crypto driver settings to defconfig
+Subject: [PATCH] Add crypto driver settings to defconfig
 
 * Add Crypto Driver and configuration to defconfig
 ---
- arch/arm/configs/am335x_evm_defconfig |   39 +++++++++++++++++++++++---------
- 1 files changed, 28 insertions(+), 11 deletions(-)
+ arch/arm/configs/am335x_evm_defconfig |   40 +++++++++++++++++++++++----------
+ 1 files changed, 28 insertions(+), 12 deletions(-)
  mode change 100644 => 100755 arch/arm/configs/am335x_evm_defconfig
 
 diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
 old mode 100644
 new mode 100755
-index de1eaad..0bf7efd
+index 9f45503..46528c4
 --- a/arch/arm/configs/am335x_evm_defconfig
 +++ b/arch/arm/configs/am335x_evm_defconfig
-@@ -1277,6 +1277,9 @@ CONFIG_SERIAL_OMAP_CONSOLE=y
+@@ -1278,7 +1278,9 @@ CONFIG_SERIAL_OMAP_CONSOLE=y
  # CONFIG_SERIAL_XILINX_PS_UART is not set
  # CONFIG_HVC_DCC is not set
  # CONFIG_IPMI_HANDLER is not set
+-# CONFIG_HW_RANDOM is not set
 +CONFIG_HW_RANDOM=y
 +# CONFIG_HW_RANDOM_TIMERIOMEM is not set
 +CONFIG_HW_RANDOM_OMAP4=y
- # CONFIG_HW_RANDOM is not set
  # CONFIG_R3964 is not set
  # CONFIG_RAW_DRIVER is not set
-@@ -2472,36 +2475,38 @@ CONFIG_CRYPTO=y
+ # CONFIG_TCG_TPM is not set
+@@ -2473,36 +2475,38 @@ CONFIG_CRYPTO=y
  #
  CONFIG_CRYPTO_ALGAPI=y
  CONFIG_CRYPTO_ALGAPI2=y
@@ -50,7 +51,7 @@ index de1eaad..0bf7efd
  # CONFIG_CRYPTO_AUTHENC is not set
 -# CONFIG_CRYPTO_TEST is not set
 +CONFIG_CRYPTO_TEST=m
-
+ 
  #
  # Authenticated Encryption with Associated Data
  #
@@ -58,7 +59,7 @@ index de1eaad..0bf7efd
  # CONFIG_CRYPTO_GCM is not set
 -# CONFIG_CRYPTO_SEQIV is not set
 +CONFIG_CRYPTO_SEQIV=y
-
+ 
  #
  # Block modes
  #
@@ -69,7 +70,7 @@ index de1eaad..0bf7efd
  # CONFIG_CRYPTO_CTS is not set
  CONFIG_CRYPTO_ECB=y
  # CONFIG_CRYPTO_LRW is not set
-@@ -2511,7 +2516,7 @@ CONFIG_CRYPTO_ECB=y
+@@ -2512,7 +2516,7 @@ CONFIG_CRYPTO_ECB=y
  #
  # Hash modes
  #
@@ -77,8 +78,8 @@ index de1eaad..0bf7efd
 +CONFIG_CRYPTO_HMAC=y
  # CONFIG_CRYPTO_XCBC is not set
  # CONFIG_CRYPTO_VMAC is not set
-
-@@ -2521,14 +2526,14 @@ CONFIG_CRYPTO_ECB=y
+ 
+@@ -2522,14 +2526,14 @@ CONFIG_CRYPTO_ECB=y
  CONFIG_CRYPTO_CRC32C=y
  # CONFIG_CRYPTO_GHASH is not set
  # CONFIG_CRYPTO_MD4 is not set
@@ -96,7 +97,7 @@ index de1eaad..0bf7efd
  # CONFIG_CRYPTO_SHA512 is not set
  # CONFIG_CRYPTO_TGR192 is not set
  # CONFIG_CRYPTO_WP512 is not set
-@@ -2543,7 +2548,7 @@ CONFIG_CRYPTO_ARC4=y
+@@ -2544,7 +2548,7 @@ CONFIG_CRYPTO_ARC4=y
  # CONFIG_CRYPTO_CAMELLIA is not set
  # CONFIG_CRYPTO_CAST5 is not set
  # CONFIG_CRYPTO_CAST6 is not set
@@ -105,7 +106,7 @@ index de1eaad..0bf7efd
  # CONFIG_CRYPTO_FCRYPT is not set
  # CONFIG_CRYPTO_KHAZAD is not set
  # CONFIG_CRYPTO_SALSA20 is not set
-@@ -2565,7 +2570,19 @@ CONFIG_CRYPTO_LZO=y
+@@ -2566,7 +2570,19 @@ CONFIG_CRYPTO_LZO=y
  # CONFIG_CRYPTO_ANSI_CPRNG is not set
  # CONFIG_CRYPTO_USER_API_HASH is not set
  # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
@@ -124,7 +125,8 @@ index de1eaad..0bf7efd
 +# CONFIG_OCF_OCFNULL is not set
 +# CONFIG_OCF_BENCH is not set
  # CONFIG_BINARY_PRINTF is not set
-
+ 
  #
---
+-- 
 1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-pm_runtime-API-to-crypto-driver.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am33x-Add-memory-addresses-for-crypto-modules.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am33x-Add-memory-addresses-for-crypto-modules.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am33x-Add-memory-addresses-for-crypto-modules.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am33x-Add-memory-addresses-for-crypto-modules.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am33xx-Add-SmartReflex-support.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am33xx-Add-SmartReflex-support.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-am33xx-Add-SmartReflex-support.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-am33xx-Add-SmartReflex-support.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-mach-omap2-pm33xx-Disable-VT-switch.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-mach-omap2-pm33xx-Disable-VT-switch.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-mach-omap2-pm33xx-Disable-VT-switch.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-mach-omap2-pm33xx-Disable-VT-switch.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-omap-serial-add-delay-before-suspending.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-omap-serial-add-delay-before-suspending.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0001-omap-serial-add-delay-before-suspending.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0001-omap-serial-add-delay-before-suspending.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch
new file mode 100644
index 0000000..de2d841
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-omap4-rng-Remove-check-for-GP-only-device-type-in-RN.patch
@@ -0,0 +1,29 @@
+From 13d5d52eda239b752b249b0f1b3b01b93a890b55 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 13 Feb 2013 15:37:15 -0600
+Subject: [PATCH] omap4-rng: Remove check for GP-only device type in RNG driver
+
+HS devices can support RNG due to recent changes in firewall settings on L4.
+The patch enables RNG support on HS device.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/char/hw_random/omap4-rng.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/char/hw_random/omap4-rng.c b/drivers/char/hw_random/omap4-rng.c
+index 523ec63..9c3b87a 100644
+--- a/drivers/char/hw_random/omap4-rng.c
++++ b/drivers/char/hw_random/omap4-rng.c
+@@ -285,7 +285,7 @@ static struct platform_driver omap4_rng_driver = {
+ 
+ static int __init omap4_rng_init(void)
+ {
+-	if (!cpu_is_am33xx()  || omap_type() != OMAP2_DEVICE_TYPE_GP)
++	if (!cpu_is_am33xx())
+ 		return -ENODEV;
+ 
+ 	return platform_driver_register(&omap4_rng_driver);
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-AM335x-OCF-Driver-for-Linux-3.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-AM335x-OCF-Driver-for-Linux-3.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-AM335x-OCF-Driver-for-Linux-3.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0002-AM335x-OCF-Driver-for-Linux-3.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0002-Smartreflex-limited-to-ES-1.0.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-Smartreflex-limited-to-ES-1.0.patch
new file mode 100644
index 0000000..dd07c40
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-Smartreflex-limited-to-ES-1.0.patch
@@ -0,0 +1,35 @@
+From 24051291ecae9c42697bd3217240205e17e95de3 Mon Sep 17 00:00:00 2001
+From: Greg Guyotte <gguyotte@ti.com>
+Date: Tue, 11 Dec 2012 21:53:24 -0600
+Subject: [PATCH 2/2] Smartreflex limited to ES 1.0
+
+Pending complete characterization of Smartreflex on ES 2.0 silicon,
+the smartreflex function is disabled.  SR continues to operate
+normally on ES 1.0 silicon.  If running on AM335x ES 2.0 silicon,
+the SR driver will cleanly abort, causing no side effects.
+
+Signed-off-by: Greg Guyotte <gguyotte@ti.com>
+---
+ arch/arm/mach-omap2/am33xx-smartreflex-class2.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/am33xx-smartreflex-class2.c b/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+index 3ed74b3..6a66e68 100644
+--- a/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
++++ b/arch/arm/mach-omap2/am33xx-smartreflex-class2.c
+@@ -763,6 +763,12 @@ static int __init am33xx_sr_probe(struct platform_device *pdev)
+ 	int ret;
+ 	int i,j;
+ 
++	if (omap_rev() != AM335X_REV_ES1_0) {
++		dev_err(&pdev->dev, "%s: Smartreflex requires ES 1.0\n",
++		       	__func__);
++		return -EINVAL;
++	}
++
+ 	sr_info = kzalloc(sizeof(struct am33xx_sr), GFP_KERNEL);
+ 	if (!sr_info) {
+ 		dev_err(&pdev->dev, "%s: unable to allocate sr_info\n",
+-- 
+1.7.0.4
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0002-am335x-Add-suspend-resume-routines-to-crypto-driver.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-am33x-Add-crypto-device-and-resource-structures.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-am33x-Add-crypto-device-and-resource-structures.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-am33x-Add-crypto-device-and-resource-structures.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0002-am33x-Add-crypto-device-and-resource-structures.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0002-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch
new file mode 100644
index 0000000..8890f3b
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0002-crypto-omap4-sham-Use-finer-grained-PM-management.patch
@@ -0,0 +1,98 @@
+From 0c910915e0b14538e4a539a26a1c632d29ed7131 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 09:40:05 -0700
+Subject: [PATCH 02/10] crypto: omap4-sham: Use finer-grained PM management
+
+Currently, the pm_runtime calls in omap4-sham enable
+things when the driver is probed and leave them enabled
+until the driver is removed.  To fix this, move the
+pm_runtime calls to only enable the sham module when
+its actually in use.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-sham.c | 23 ++++++++---------------
+ 1 file changed, 8 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 2fb71b9..6985c87 100644
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -138,7 +138,6 @@ struct omap4_sham_dev {
+ 	struct device		*dev;
+ 	void __iomem		*io_base;
+ 	int			irq;
+-	struct clk		*iclk;
+ 	spinlock_t		lock;
+ 	int			err;
+ 	int			dma;
+@@ -701,6 +700,8 @@ static void omap4_sham_finish_req(struct ahash_request *req, int err)
+ 	dd->dflags &= ~(BIT(FLAGS_BUSY) | BIT(FLAGS_FINAL) | BIT(FLAGS_CPU) |
+ 			BIT(FLAGS_DMA_READY) | BIT(FLAGS_OUTPUT_READY));
+ 
++	pm_runtime_put_sync(dd->dev);
++
+ 	if (req->base.complete)
+ 		req->base.complete(&req->base, err);
+ 
+@@ -742,6 +743,8 @@ static int omap4_sham_handle_queue(struct omap4_sham_dev *dd,
+ 	dev_dbg(dd->dev, "handling new req, op: %lu, nbytes: %d\n",
+ 						ctx->op, req->nbytes);
+ 
++	pm_runtime_get_sync(dd->dev);
++
+ 	if (!test_bit(FLAGS_INIT, &dd->dflags)) {
+ 		set_bit(FLAGS_INIT, &dd->dflags);
+ 		dd->err = 0;
+@@ -1306,11 +1309,6 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+ 	if (err)
+ 		goto dma_err;
+ 
+-	pm_runtime_enable(dev);
+-	udelay(1);
+-	pm_runtime_get_sync(dev);
+-	udelay(1);
+-
+ 	dd->io_base = ioremap(dd->phys_base, SZ_4K);
+ 	if (!dd->io_base) {
+ 		dev_err(dev, "can't ioremap\n");
+@@ -1318,7 +1316,11 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+ 		goto io_err;
+ 	}
+ 
++
++	pm_runtime_enable(dev);
++	pm_runtime_get_sync(dev);
+ 	reg = omap4_sham_read(dd, SHA_REG_REV);
++	pm_runtime_put_sync(&pdev->dev);
+ 
+ 	dev_info(dev, "AM33X SHA/MD5 hw accel rev: %u.%02u\n",
+ 		 (reg & SHA_REG_REV_X_MAJOR_MASK) >> 8, reg & SHA_REG_REV_Y_MINOR_MASK);
+@@ -1342,13 +1344,7 @@ err_algs:
+ 		crypto_unregister_ahash(&algs[j]);
+ 	iounmap(dd->io_base);
+ io_err:
+-	pm_runtime_put_sync(dev);
+-	udelay(1);
+ 	pm_runtime_disable(dev);
+-	udelay(1);
+-
+-//clk_err:
+-//	omap4_sham_dma_cleanup(dd);
+ 
+ dma_err:
+ 	if (dd->irq >= 0)
+@@ -1377,10 +1373,7 @@ static int __devexit omap4_sham_remove(struct platform_device *pdev)
+ 		crypto_unregister_ahash(&algs[i]);
+ 	tasklet_kill(&dd->done_task);
+ 	iounmap(dd->io_base);
+-	pm_runtime_put_sync(&pdev->dev);
+-	udelay(1);
+ 	pm_runtime_disable(&pdev->dev);
+-	udelay(1);
+ 
+ 	omap4_sham_dma_cleanup(dd);
+ 	if (dd->irq >= 0)
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0003-am33x-Add-crypto-device-and-resource-structure-for-T.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch
new file mode 100644
index 0000000..4b9a9bc
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0003-crypto-omap4-sham-Add-suspend-resume-PM-support.patch
@@ -0,0 +1,56 @@
+From b0a47b49a61db95fdb2340548b967bdfe085df2d Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 00:43:45 -0700
+Subject: [PATCH 03/10] crypto: omap4-sham: Add suspend/resume PM support
+
+Add suspend/resume PM support to the omap4-sham driver
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-sham.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 6985c87..963d0e1 100644
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -1386,24 +1386,19 @@ static int __devexit omap4_sham_remove(struct platform_device *pdev)
+ 
+ static int omap4_sham_suspend(struct device *dev)
+ {
+-	pr_debug("#### Crypto: Suspend call ####\n");
+-
++	pm_runtime_put_sync(dev);
+ 	return 0;
+ }
+ 
+ 
+ static int omap4_sham_resume(struct device *dev)
+ {
+-	pr_debug("#### Crypto: resume call ####\n");
+-
++	pm_runtime_get_sync(dev);
+ 	return 0;
+ }
+ 
+ static struct dev_pm_ops omap4_sham_dev_pm_ops = {
+-	.suspend	= omap4_sham_suspend,
+-	.resume		= omap4_sham_resume,
+-	.runtime_suspend = omap4_sham_suspend,
+-	.runtime_resume = omap4_sham_resume,
++	SET_SYSTEM_SLEEP_PM_OPS(omap4_sham_suspend, omap4_sham_resume)
+ };
+ 
+ static struct platform_driver omap4_sham_driver = {
+@@ -1412,7 +1407,7 @@ static struct platform_driver omap4_sham_driver = {
+ 	.driver	= {
+ 		.name	= "omap4-sham",
+ 		.owner	= THIS_MODULE,
+-		.pm		= &omap4_sham_dev_pm_ops
++		.pm	= &omap4_sham_dev_pm_ops
+ 	},
+ };
+ 
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0004-am33x-Add-crypto-drivers-to-Kconfig-and-Makefiles.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch
new file mode 100644
index 0000000..76c7027
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0004-crypto-omap4-sham-Don-t-use-hardcoded-base-address.patch
@@ -0,0 +1,45 @@
+From 08ea4b77652956c07b91b4de670ebc44f1395840 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 20:33:15 -0700
+Subject: [PATCH 04/10] crypto: omap4-sham: Don't use hardcoded base address
+
+The omap4-sham driver currently uses a hardcoded base
+address for its register set instead of the address
+passed in by the system.  Instead, use the address
+passed in by the system.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-sham.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-sham.c b/drivers/crypto/omap4-sham.c
+index 963d0e1..b2fc03a 100644
+--- a/drivers/crypto/omap4-sham.c
++++ b/drivers/crypto/omap4-sham.c
+@@ -1271,15 +1271,13 @@ static int __devinit omap4_sham_probe(struct platform_device *pdev)
+ 	dd->irq = -1;
+ 
+ 	/* Get the base address */
+-	//res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	//if (!res) {
+-	//	dev_err(dev, "no MEM resource info\n");
+-	//	err = -ENODEV;
+-	//	goto res_err;
+-	//}
+-
+-	//dd->phys_base = res->start;
+-	dd->phys_base = AM33XX_SHA1MD5_P_BASE;
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(dev, "no MEM resource info\n");
++		err = -ENODEV;
++		goto res_err;
++	}
++	dd->phys_base = res->start;
+ 
+ 	/* Get the DMA */
+ 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch
new file mode 100644
index 0000000..6aebef6
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0005-ARM-AM33xx-hwmod-Convert-AES0-crypto-device-data-to-.patch
@@ -0,0 +1,165 @@
+From ff9e06c41de00f281dd21ed66e8477d933ce69dd Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 20:46:49 -0700
+Subject: [PATCH 05/10] ARM: AM33xx: hwmod: Convert AES0 crypto device data to
+ hwmod
+
+Convert the device data for the AM33xx AES0 crypto modules
+from explicit platform_data to hwmod.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ arch/arm/mach-omap2/devices.c              | 65 ++++--------------------------
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 32 +++++++++++++++
+ 2 files changed, 39 insertions(+), 58 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index 3679369..e4caa06 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -809,69 +809,18 @@ static void omap_init_aes(void)
+ }
+ 
+ #elif defined(CONFIG_CRYPTO_DEV_OMAP4_AES) || defined(CONFIG_CRYPTO_DEV_OMAP4_AES_MODULE)
+-
+-static struct resource omap4_aes_resources[] = {
+-	{
+-		.start	= AM33XX_AES0_P_BASE,
+-		.end	= AM33XX_AES0_P_BASE + 0x4C,
+-		.flags	= IORESOURCE_MEM,
+-	},
+-	{
+-		.start	= AM33XX_DMA_AESEIP36T0_DOUT,
+-		.flags	= IORESOURCE_DMA,
+-	},
+-	{
+-		.start	= AM33XX_DMA_AESEIP36T0_DIN,
+-		.flags	= IORESOURCE_DMA,
+-	}
+-};
+-static int omap4_aes_resources_sz = ARRAY_SIZE(omap4_aes_resources);
+-
+-static struct platform_device aes_device = {
+-	.name		= "omap4-aes",
+-	.id		= -1,
+-};
+-
+-#if 0
+-static void omap_init_aes(void)
++static void __init omap_init_aes(void)
+ {
+-	aes_device.resource = omap4_aes_resources;
+-	aes_device.num_resources = omap4_aes_resources_sz;
+-	platform_device_register(&aes_device);
+-}
+-#endif
+-
+-int __init omap_init_aes(void)
+-{
+-	int id = -1;
+-	struct platform_device *pdev;
+ 	struct omap_hwmod *oh;
+-	char *oh_name = "aes0";
+-	char *name = "omap4-aes";
+-
+-	oh = omap_hwmod_lookup(oh_name);
+-	if (!oh) {
+-		pr_err("Could not look up %s\n", oh_name);
+-		return -ENODEV;
+-	}
+-
+-	pdev = omap_device_build(name, id, oh, NULL, 0, NULL, 0, 0);
+-	//pdev.resource = omap4_sham_resources;
+-	//pdev.num_resources = omap4_sham_resources_sz;
++	struct platform_device *pdev;
+ 
+-	if (IS_ERR(pdev)) {
+-		WARN(1, "Can't build omap_device for %s:%s.\n",
+-						name, oh->name);
+-		return PTR_ERR(pdev);
+-	}
++	oh = omap_hwmod_lookup("aes0");
++	if (!oh)
++		return;
+ 
+-	return 0;
++	pdev = omap_device_build("omap4-aes", -1, oh, NULL, 0, NULL, 0, 0);
++	WARN(IS_ERR(pdev), "Can't build omap_device for omap-aes\n");
+ }
+-
+-
+-
+-
+-
+ #else
+ static inline void omap_init_aes(void) { }
+ #endif
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index ad606c6..90e25d7 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -78,6 +78,7 @@ static struct omap_hwmod am33xx_spi0_hwmod;
+ static struct omap_hwmod am33xx_spi1_hwmod;
+ static struct omap_hwmod am33xx_elm_hwmod;
+ static struct omap_hwmod am33xx_adc_tsc_hwmod;
++static struct omap_hwmod am33xx_aes0_hwmod;
+ static struct omap_hwmod am33xx_rtc_hwmod;
+ static struct omap_hwmod am33xx_sha0_hwmod;
+ static struct omap_hwmod am33xx_mcasp0_hwmod;
+@@ -427,8 +428,16 @@ static struct omap_hwmod am33xx_adc_tsc_hwmod = {
+ };
+ 
+ /* 'aes' class */
++static struct omap_hwmod_class_sysconfig am33xx_aes_sysc = {
++	.rev_offs	= 0x80,
++	.sysc_offs	= 0x84,
++	.syss_offs	= 0x88,
++	.sysc_flags	= SYSS_HAS_RESET_STATUS,
++};
++
+ static struct omap_hwmod_class am33xx_aes_hwmod_class = {
+ 	.name		= "aes",
++	.sysc		= &am33xx_aes_sysc,
+ };
+ 
+ /* aes0 */
+@@ -443,6 +452,27 @@ static struct omap_hwmod_dma_info am33xx_aes0_dma[] = {
+ 	{ .dma_req = -1 }
+ };
+ 
++static struct omap_hwmod_addr_space am33xx_aes0_addrs[] = {
++	{
++		.pa_start	= 0x53500000,
++		.pa_end		= 0x53500000 + SZ_1M - 1,
++		.flags		= ADDR_TYPE_RT
++	},
++	{ }
++};
++
++static struct omap_hwmod_ocp_if am33xx_l3_main__aes0 = {
++	.master		= &am33xx_l3_main_hwmod,
++	.slave		= &am33xx_aes0_hwmod,
++	.clk		= "aes0_fck",
++	.addr		= am33xx_aes0_addrs,
++	.user		= OCP_USER_MPU | OCP_USER_SDMA,
++};
++
++static struct omap_hwmod_ocp_if *am33xx_aes0_slaves[] = {
++	&am33xx_l3_main__aes0,
++};
++
+ static struct omap_hwmod am33xx_aes0_hwmod = {
+ 	.name		= "aes0",
+ 	.class		= &am33xx_aes_hwmod_class,
+@@ -456,6 +486,8 @@ static struct omap_hwmod am33xx_aes0_hwmod = {
+ 			.modulemode	= MODULEMODE_SWCTRL,
+ 		},
+ 	},
++	.slaves		= am33xx_aes0_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_aes0_slaves),
+ };
+ 
+ /* cefuse */
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0005-am33x-Create-header-file-for-OMAP4-crypto-modules.patch
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0006-am33x-Create-driver-for-TRNG-crypto-module.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0006-am33x-Create-driver-for-TRNG-crypto-module.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0006-am33x-Create-driver-for-TRNG-crypto-module.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0006-am33x-Create-driver-for-TRNG-crypto-module.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch
new file mode 100644
index 0000000..94fb7b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0006-crypto-omap4-aes-User-finer-grained-PM-management.patch
@@ -0,0 +1,127 @@
+From 5f56e1d486aaef9bcfaa57129c493a95185043fd Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 21:00:13 -0700
+Subject: [PATCH 06/10] crypto: omap4-aes: User finer-grained PM management
+
+Currently, the pm_runtime calls in omap4-aes enable
+things when the driver is probed and leave them enabled
+until the driver is removed.  To fix this, move the
+pm_runtime calls to only enable the aes module when
+its actually in use.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-aes.c | 39 ++++++++++++++++-----------------------
+ 1 file changed, 16 insertions(+), 23 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index dec2de4..a957709 100644
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -80,7 +80,6 @@ struct omap4_aes_dev {
+ 	struct list_head		list;
+ 	unsigned long			phys_base;
+ 	void __iomem			*io_base;
+-	struct clk			*iclk;
+ 	struct omap4_aes_ctx		*ctx;
+ 	struct device			*dev;
+ 	unsigned long			flags;
+@@ -146,7 +145,7 @@ static void omap4_aes_write_n(struct omap4_aes_dev *dd, u32 offset,
+ 
+ static int omap4_aes_hw_init(struct omap4_aes_dev *dd)
+ {
+-	omap4_aes_write(dd, AES_REG_SYSCFG, 0);
++	pm_runtime_get_sync(dd->dev);
+ 
+ 	if (!(dd->flags & FLAGS_INIT)) {
+ 		dd->flags |= FLAGS_INIT;
+@@ -489,11 +488,17 @@ static void omap4_aes_finish_req(struct omap4_aes_dev *dd, int err)
+ 
+ 	pr_debug("err: %d\n", err);
+ 
++	pm_runtime_put_sync(dd->dev);
+ 	dd->flags &= ~FLAGS_BUSY;
+ 
+ 	req->base.complete(&req->base, err);
+ }
+ 
++static void omap4_aes_dma_stop(struct omap4_aes_dev *dd)
++{
++	omap4_aes_write_mask(dd, AES_REG_SYSCFG, 0, AES_REG_SYSCFG_DREQ_MASK);
++}
++
+ static int omap4_aes_crypt_dma_stop(struct omap4_aes_dev *dd)
+ {
+ 	int err = 0;
+@@ -501,7 +506,7 @@ static int omap4_aes_crypt_dma_stop(struct omap4_aes_dev *dd)
+ 
+ 	pr_debug("total: %d\n", dd->total);
+ 
+-	omap4_aes_write_mask(dd, AES_REG_SYSCFG, 0, AES_REG_SYSCFG_DREQ_MASK);
++	omap4_aes_dma_stop(dd);
+ 
+ 	edma_stop(dd->dma_lch_in);
+ 	edma_clean_channel(dd->dma_lch_in);
+@@ -819,21 +824,22 @@ static int omap4_aes_probe(struct platform_device *pdev)
+ 	else
+ 		dd->dma_in = res->start;
+ 
+-	pm_runtime_enable(dev);
+-	udelay(1);
+-	pm_runtime_get_sync(dev);
+-	udelay(1);
+-
+ 	dd->io_base = ioremap(dd->phys_base, SZ_4K);
+ 	if (!dd->io_base) {
+ 		dev_err(dev, "can't ioremap\n");
+ 		err = -ENOMEM;
+-		goto err_io;
++		goto err_data;
+ 	}
+ 
+-	omap4_aes_hw_init(dd);
++	pm_runtime_enable(dev);
++	pm_runtime_get_sync(dev);
++
++	omap4_aes_dma_stop(dd);
++
+ 	reg = omap4_aes_read(dd, AES_REG_REV);
+ 
++	pm_runtime_put_sync(dev);
++
+ 	dev_info(dev, "AM33X AES hw accel rev: %u.%02u\n",
+ 		 ((reg & AES_REG_REV_X_MAJOR_MASK) >> 8),
+ 		 (reg & AES_REG_REV_Y_MINOR_MASK));
+@@ -870,17 +876,8 @@ err_dma:
+ 	tasklet_kill(&dd->done_task);
+ 	tasklet_kill(&dd->queue_task);
+ 	iounmap(dd->io_base);
+-
+-err_io:
+-	pm_runtime_put_sync(dev);
+-	udelay(1);
+ 	pm_runtime_disable(dev);
+-	udelay(1);
+ 
+-
+-//err_res:
+-	//kfree(dd);
+-	//dd = NULL;
+ err_data:
+ 	dev_err(dev, "initialization failed.\n");
+ 	return err;
+@@ -905,11 +902,7 @@ static int omap4_aes_remove(struct platform_device *pdev)
+ 	tasklet_kill(&dd->queue_task);
+ 	omap4_aes_dma_cleanup(dd);
+ 	iounmap(dd->io_base);
+-	pm_runtime_put_sync(&pdev->dev);
+-	udelay(1);
+ 	pm_runtime_disable(&pdev->dev);
+-	udelay(1);
+-
+ 	kfree(dd);
+ 	dd = NULL;
+ 
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0007-am33x-Create-driver-for-AES-crypto-module.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0007-am33x-Create-driver-for-AES-crypto-module.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0007-am33x-Create-driver-for-AES-crypto-module.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0007-am33x-Create-driver-for-AES-crypto-module.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch
new file mode 100644
index 0000000..cce7691
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0007-crypto-omap4-aes-Add-suspend-resume-PM-support.patch
@@ -0,0 +1,56 @@
+From 90b8eaec8de51fab15872f8737a5148b99f80282 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 00:46:52 -0700
+Subject: [PATCH 07/10] crypto: omap4-aes: Add suspend/resume PM support
+
+Add suspend/resume PM support to the omap4-aes driver
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-aes.c | 13 ++++---------
+ 1 file changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index a957709..941b8a1 100644
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -911,24 +911,19 @@ static int omap4_aes_remove(struct platform_device *pdev)
+ 
+ static int omap4_aes_suspend(struct device *dev)
+ {
+-	pr_debug("#### Crypto: Suspend call ####\n");
+-
++	pm_runtime_put_sync(dev);
+ 	return 0;
+ }
+ 
+ 
+ static int omap4_aes_resume(struct device *dev)
+ {
+-	pr_debug("#### Crypto: resume call ####\n");
+-
++	pm_runtime_get_sync(dev);
+ 	return 0;
+ }
+ 
+ static struct dev_pm_ops omap4_aes_dev_pm_ops = {
+-	.suspend	= omap4_aes_suspend,
+-	.resume		= omap4_aes_resume,
+-	.runtime_suspend = omap4_aes_suspend,
+-	.runtime_resume = omap4_aes_resume,
++	SET_SYSTEM_SLEEP_PM_OPS(omap4_aes_suspend, omap4_aes_resume)
+ };
+ 
+ static struct platform_driver omap4_aes_driver = {
+@@ -937,7 +932,7 @@ static struct platform_driver omap4_aes_driver = {
+ 	.driver	= {
+ 		.name	= "omap4-aes",
+ 		.owner	= THIS_MODULE,
+-		.pm		= &omap4_aes_dev_pm_ops
++		.pm	= &omap4_aes_dev_pm_ops
+ 	},
+ };
+ 
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch
similarity index 100%
rename from recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch
rename to recipes-kernel/linux/linux-am335x-psp-3.2/0008-am33x-Create-driver-for-SHA-MD5-crypto-module.patch
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch
new file mode 100644
index 0000000..348ac52
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0008-crypto-omap4-aes-Don-t-use-hardcoded-base-address.patch
@@ -0,0 +1,45 @@
+From 8084600ca78354fad147593256b9e32ef5d15148 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Tue, 11 Dec 2012 21:09:58 -0700
+Subject: [PATCH 08/10] crypto: omap4-aes: Don't use hardcoded base address
+
+The omap4-aes driver currently uses a hardcoded base
+address for its register set instead of the address
+passed in by the system.  Instead, use the address
+passed in by the system.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/crypto/omap4-aes.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/crypto/omap4-aes.c b/drivers/crypto/omap4-aes.c
+index 941b8a1..984a15e 100644
+--- a/drivers/crypto/omap4-aes.c
++++ b/drivers/crypto/omap4-aes.c
+@@ -800,15 +800,13 @@ static int omap4_aes_probe(struct platform_device *pdev)
+ 	crypto_init_queue(&dd->queue, AM33X_AES_QUEUE_LENGTH);
+ 
+ 	/* Get the base address */
+-	//res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+-	//if (!res) {
+-	//	dev_err(dev, "invalid resource type\n");
+-	//	err = -ENODEV;
+-	//	goto err_res;
+-	//}
+-
+-	//dd->phys_base = res->start;
+-	dd->phys_base = AM33XX_AES0_P_BASE;
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(dev, "invalid resource type\n");
++		err = -ENODEV;
++		goto err_data;
++	}
++	dd->phys_base = res->start;
+ 
+ 	/* Get the DMA */
+ 	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch
new file mode 100644
index 0000000..31094b0
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0009-ARM-AM33xx-hwmod-Convert-RNG-device-data-to-hwmod.patch
@@ -0,0 +1,176 @@
+From 45cc04d9de2820cba138d5782e7c568edf0078a0 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 16:17:12 -0700
+Subject: [PATCH 09/10] ARM: AM33xx: hwmod: Convert RNG device data to hwmod
+
+Convert the device data for the AM33xx RNG module
+from explicit platform_data to hwmod.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ arch/arm/mach-omap2/devices.c              | 18 +++++++++
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 64 ++++++++++++++++++++++++++++++
+ arch/arm/plat-omap/devices.c               | 22 ----------
+ 3 files changed, 82 insertions(+), 22 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index e4caa06..8e2f4a0 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -825,6 +825,23 @@ static void __init omap_init_aes(void)
+ static inline void omap_init_aes(void) { }
+ #endif
+ 
++#if IS_ENABLED(CONFIG_HW_RANDOM_OMAP4)
++static void __init omap_init_rng(void)
++{
++	struct omap_hwmod *oh;
++	struct platform_device *pdev;
++
++	oh = omap_hwmod_lookup("rng");
++	if (!oh)
++		return;
++
++	pdev = omap_device_build("omap4_rng", -1, oh, NULL, 0, NULL, 0, 0);
++	WARN(IS_ERR(pdev), "Can't build omap_device for omap-rng\n");
++}
++#else
++static inline void omap_init_rng(void) {}
++#endif
++
+ /*-------------------------------------------------------------------------*/
+ 
+ #if defined(CONFIG_MMC_OMAP) || defined(CONFIG_MMC_OMAP_MODULE)
+@@ -1475,6 +1492,7 @@ static int __init omap2_init_devices(void)
+ 	omap_init_sti();
+ 	omap_init_sham();
+ 	omap_init_aes();
++	omap_init_rng();
+ 	omap_init_vout();
+ 	am33xx_register_edma();
+ 	am33xx_init_pcm();
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index 90e25d7..6c5ebc7 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -94,6 +94,7 @@ static struct omap_hwmod am33xx_lcdc_hwmod;
+ static struct omap_hwmod am33xx_mailbox_hwmod;
+ static struct omap_hwmod am33xx_cpgmac0_hwmod;
+ static struct omap_hwmod am33xx_mdio_hwmod;
++static struct omap_hwmod am33xx_rng_hwmod;
+ 
+ /*
+  * ERRATA: (Yet to conform from IP team)
+@@ -3541,6 +3542,67 @@ static struct omap_hwmod am33xx_pruss_hwmod = {
+ 	.rst_lines_cnt	= ARRAY_SIZE(am33xx_pruss_resets),
+ };
+ 
++/* rng */
++static struct omap_hwmod_sysc_fields omap3_rng_sysc_fields = {
++	.sidle_shift	= 3,
++	.autoidle_shift	= 0,
++};
++
++static struct omap_hwmod_class_sysconfig am33xx_rng_sysc = {
++	.rev_offs	= 0x1fe0,
++	.sysc_offs	= 0x1fe4,
++	.rst_offs	= 0x1ff0,
++	.sysc_flags	= SYSC_HAS_AUTOIDLE,
++	.sysc_fields	= &omap3_rng_sysc_fields,
++};
++
++static struct omap_hwmod_class am33xx_rng_hwmod_class = {
++	.name		= "rng",
++	.sysc		= &am33xx_rng_sysc,
++};
++
++static struct omap_hwmod_irq_info am33xx_rng_irqs[] = {
++	{ .irq = 111 },
++	{ .irq = -1 }
++};
++
++struct omap_hwmod_addr_space am33xx_rng_addr_space[] = {
++	{
++		.pa_start	= 0x48310000,
++		.pa_end		= 0x48310000 + SZ_8K - 1,
++		.flags		= ADDR_TYPE_RT,
++	},
++	{ }
++};
++
++struct omap_hwmod_ocp_if am33xx_l4per__rng = {
++	.master		= &am33xx_l4per_hwmod,
++	.slave		= &am33xx_rng_hwmod,
++	.clk		= "rng_fck",
++	.addr		= am33xx_rng_addr_space,
++	.user		= OCP_USER_MPU,
++};
++
++static struct omap_hwmod_ocp_if *am33xx_rng_slaves[] = {
++	&am33xx_l4per__rng,
++};
++
++static struct omap_hwmod am33xx_rng_hwmod = {
++	.name		= "rng",
++	.class		= &am33xx_rng_hwmod_class,
++	.clkdm_name	= "l4ls_clkdm",
++	.mpu_irqs	= am33xx_rng_irqs,
++	.main_clk	= "rng_fck",
++	.prcm		= {
++		.omap4	= {
++			.clkctrl_offs	= AM33XX_CM_PER_RNG_CLKCTRL_OFFSET,
++			.modulemode	= MODULEMODE_SWCTRL,
++		},
++	},
++	.slaves		= am33xx_rng_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_rng_slaves),
++};
++
+ static __initdata struct omap_hwmod *am33xx_hwmods[] = {
+ 	/* l3 class */
+ 	&am33xx_l3_instr_hwmod,
+@@ -3661,6 +3723,8 @@ static __initdata struct omap_hwmod *am33xx_hwmods[] = {
+ 	&am33xx_gfx_hwmod,
+ 	/* pruss */
+ 	&am33xx_pruss_hwmod,
++	/* rng */
++	&am33xx_rng_hwmod,
+ 	NULL,
+ };
+ 
+diff --git a/arch/arm/plat-omap/devices.c b/arch/arm/plat-omap/devices.c
+index 52720b4..52d7ad4 100644
+--- a/arch/arm/plat-omap/devices.c
++++ b/arch/arm/plat-omap/devices.c
+@@ -105,28 +105,6 @@ static void omap_init_rng(void)
+ {
+ 	(void) platform_device_register(&omap_rng_device);
+ }
+-#elif defined(CONFIG_HW_RANDOM_OMAP4) || defined(CONFIG_HW_RANDOM_OMAP4_MODULE)
+-
+-static struct resource rng_resources[] = {
+-	{
+-		.start		= AM33XX_RNG_BASE,
+-		.end		= AM33XX_RNG_BASE + 0x1FFC,
+-		.flags		= IORESOURCE_MEM,
+-	},
+-};
+-
+-static struct platform_device omap4_rng_device = {
+-	.name		= "omap4_rng",
+-	.id		= -1,
+-	.num_resources	= ARRAY_SIZE(rng_resources),
+-	.resource	= rng_resources,
+-};
+-
+-static void omap_init_rng(void)
+-{
+-	(void) platform_device_register(&omap4_rng_device);
+-}
+-
+ #else
+ static inline void omap_init_rng(void) {}
+ #endif
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch
new file mode 100644
index 0000000..28bc326
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0010-hwrng-omap4-rng-Convert-to-use-pm_runtime-API.patch
@@ -0,0 +1,91 @@
+From 1b4d57c404a14b263b39e251e0bc5dc76fc95932 Mon Sep 17 00:00:00 2001
+From: "Mark A. Greer" <mgreer@animalcreek.com>
+Date: Wed, 12 Dec 2012 20:13:49 -0700
+Subject: [PATCH 10/10] hwrng: omap4-rng: Convert to use pm_runtime API
+
+Convert the omap4-rng driver to use the pm_runtime
+API instead of the clk API.
+
+Signed-off-by: Mark A. Greer <mgreer@animalcreek.com>
+---
+ drivers/char/hw_random/omap4-rng.c | 24 +++++++++++-------------
+ 1 file changed, 11 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/char/hw_random/omap4-rng.c b/drivers/char/hw_random/omap4-rng.c
+index 523ec63..98c96c1 100644
+--- a/drivers/char/hw_random/omap4-rng.c
++++ b/drivers/char/hw_random/omap4-rng.c
+@@ -23,7 +23,7 @@
+ #include <linux/module.h>
+ #include <linux/init.h>
+ #include <linux/random.h>
+-#include <linux/clk.h>
++#include <linux/pm_runtime.h>
+ #include <linux/err.h>
+ #include <linux/platform_device.h>
+ #include <linux/hw_random.h>
+@@ -111,7 +111,6 @@
+ 
+ 
+ static void __iomem *rng_base;
+-static struct clk *rng_fck;
+ static struct platform_device *rng_dev;
+ 
+ #define trng_read(reg)						\
+@@ -172,13 +171,8 @@ static int __devinit omap4_rng_probe(struct platform_device *pdev)
+ 	if (rng_dev)
+ 		return -EBUSY;
+ 
+-	rng_fck = clk_get(&pdev->dev, "rng_fck");
+-	if (IS_ERR(rng_fck)) {
+-		dev_err(&pdev->dev, "Could not get rng_fck\n");
+-		ret = PTR_ERR(rng_fck);
+-		return ret;
+-	} else
+-		clk_enable(rng_fck);
++	pm_runtime_enable(&pdev->dev);
++	pm_runtime_get_sync(&pdev->dev);
+ 
+ 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ 	if (!res) {
+@@ -223,8 +217,8 @@ err_register:
+ err_ioremap:
+ 	release_mem_region(res->start, resource_size(res));
+ err_region:
+-	clk_disable(rng_fck);
+-	clk_put(rng_fck);
++	pm_runtime_put_sync(&pdev->dev);
++	pm_runtime_disable(&pdev->dev);
+ 	return ret;
+ }
+ 
+@@ -238,8 +232,8 @@ static int __exit omap4_rng_remove(struct platform_device *pdev)
+ 
+ 	iounmap(rng_base);
+ 
+-	clk_disable(rng_fck);
+-	clk_put(rng_fck);
++	pm_runtime_put_sync(&pdev->dev);
++	pm_runtime_disable(&pdev->dev);
+ 	release_mem_region(res->start, resource_size(res));
+ 	rng_base = NULL;
+ 
+@@ -252,11 +246,15 @@ static int omap4_rng_suspend(struct platform_device *pdev, pm_message_t message)
+ {
+ 	trng_write(trng_read(CONTROL) & ~RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
+ 
++	pm_runtime_put_sync(&pdev->dev);
++
+ 	return 0;
+ }
+ 
+ static int omap4_rng_resume(struct platform_device *pdev)
+ {
++	pm_runtime_get_sync(&pdev->dev);
++
+ 	trng_write(trng_read(CONTROL) | RNG_REG_CONTROL_ENABLE_TRNG, CONTROL);
+ 
+ 	return 0;
+-- 
+1.7.12
+
diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/defconfig b/recipes-kernel/linux/linux-am335x-psp-3.2/defconfig
new file mode 100644
index 0000000..f8cbc03
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/defconfig
@@ -0,0 +1 @@
+use-kernel-config=am335x_evm_defconfig
-- 
1.7.0.4


