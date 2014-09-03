Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFDA9E00563; Tue,  2 Sep 2014 18:53:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8B58E00524
	for <meta-ti@yoctoproject.org>; Tue,  2 Sep 2014 18:53:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s831rRnK022999;
	Tue, 2 Sep 2014 20:53:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s831rR90003626;
	Tue, 2 Sep 2014 20:53:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 20:53:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s831rRw6025874;
	Tue, 2 Sep 2014 20:53:27 -0500
Date: Tue, 2 Sep 2014 21:53:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
Message-ID: <20140903015326.GP18620@edge>
References: <54064ACC.9020702@phoenixsoftware.it>
MIME-Version: 1.0
In-Reply-To: <54064ACC.9020702@phoenixsoftware.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335X EVMSK kernel problem
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
X-List-Received-Date: Wed, 03 Sep 2014 01:53:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Pierluigi,

Try the latest known good commit from meta-ti for linux-ti-staging, as 
meta-arago AUTOREV's the commit and there were some known regressions in the 
past few days, that are being looked at now.

-- 
Denys


On Wed, Sep 03, 2014 at 12:55:08AM +0200, Pierluigi Passaro wrote:
> Hi all,
> I've compiled a build with updated meta-arago (master) and meta-ti (daisy).
> My board is a AM335x Starter Kit rev 1.2B with AM3359 CPU.
> The kernel compiled is linux-ti-staging 3.14.17 with no personal changes.
> 
> The boot process shows 2 problems:
> - Division by zero in kernel while probing davinci mdio
> - the process stops "Waiting for root device /dev/mmcblk0p2..."
> 
> Attached you can find the full boot log.
> 
> Are these known problems or may be related to something known?
> If yes, is there any available workaround?
> 
> I also tried latest TI_LinuxSDK_07.00.00.00 (march 2014) available
> on TI website.
> Although is based on kernel 3.12, the boot process looks ok and
> Matrix start correctly.
> 
> Thanks
> Regards
> Pierluigi

> 
> 
> Welcome to minicom 2.7
> 
> OPTIONS: I18n
> Compiled on Jan  1 2014, 17:13:19.
> Port /dev/ttyUSB1, 20:55:27
> 
> Press CTRL-A Z for help on special keys
> 
> 
> U-Boot SPL 2014.07 (Aug 30 2014 - 16:02:24)
> reading args
> spl_load_image_fat_os: error reading image args, err - -1
> reading u-boot.img
> reading u-boot.img
> 
> 
> U-Boot 2014.07 (Aug 30 2014 - 16:02:24)
> 
> I2C:   ready
> DRAM:  256 MiB
> NAND:  0 MiB
> MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> reading uboot.env
> 
> ** Unable to read "uboot.env" from mmc0:1 **
> Using default environment
> 
> Net:   <ethaddr> not set. Validating first E-fuse MAC
> cpsw, usb_ether
> Hit any key to stop autoboot:  0
> switch to partitions #0, OK
> mmc0 is current device
> SD/MMC found on device 0
> reading uEnv.txt
> 20 bytes read in 4 ms (4.9 KiB/s)
> Loaded environment from uEnv.txt
> Importing environment from mmc ...
> 4511200 bytes read in 335 ms (12.8 MiB/s)
> 34918 bytes read in 65 ms (524.4 KiB/s)
> Kernel image @ 0x82000000 [ 0x000000 - 0x44d5e0 ]
> ## Flattened Device Tree blob at 88000000
>    Booting using the fdt blob at 0x88000000
>    Loading Device Tree to 8e714000, end 8e71f865 ... OK
> 
> Starting kernel ...
> 
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 3.14.17-g36fd7b6 (gigi@rigel) (gcc version 4.7.3 20130226 (prerelease) (crosstool-NG linaro-1.13.1-4.7-2013.03-20130313 - Linaro GCC 2013.03) ) #1 Sat Aug 30 16:10:58 CEST 2014
> [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [    0.000000] Machine model: TI AM335x EVM-SK
> [    0.000000] cma: CMA: reserved 24 MiB at 8c800000
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] CPU: All CPU(s) started in SVC mode.
> [    0.000000] AM335X ES1.0 (sgx neon )
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 64512
> [    0.000000] Kernel command line: console=ttyO0,115200n8 root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait
> [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
> [    0.000000] Memory: 218264K/260096K available (5825K kernel code, 718K rwdata, 2332K rodata, 384K init, 5505K bss, 41832K reserved, 0K highmem)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
> [    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
> [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> [    0.000000]       .text : 0xc0008000 - 0xc07ff93c   (8159 kB)
> [    0.000000]       .init : 0xc0800000 - 0xc08603c4   ( 385 kB)
> [    0.000000]       .data : 0xc0862000 - 0xc0915b10   ( 719 kB)
> [    0.000000]        .bss : 0xc0915b10 - 0xc0e76218   (5506 kB)
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts
> [    0.000000] Total of 128 interrupts on 1 active controller
> [    0.000000] ti_dt_clocks_register: failed to lookup clock node dpll_core_ck
> [    0.000000] ti_dt_clocks_register: failed to lookup clock node dpll_mpu_ck
> [    0.000000] ti_dt_clocks_register: failed to lookup clock node dpll_ddr_ck
> [    0.000000] ti_dt_clocks_register: failed to lookup clock node dpll_disp_ck
> [    0.000000] ti_dt_clocks_register: failed to lookup clock node dpll_per_ck
> [    0.000000] OMAP clockevent source: timer2 at 24000000 Hz
> [    0.000014] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956969942ns
> [    0.000064] OMAP clocksource: timer1 at 24000000 Hz
> [    0.000912] Console: colour dummy device 80x30
> [    0.000974] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> [    0.000984] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000992] ... MAX_LOCK_DEPTH:          48
> [    0.001000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.001008] ... CLASSHASH_SIZE:          4096
> [    0.001016] ... MAX_LOCKDEP_ENTRIES:     16384
> [    0.001024] ... MAX_LOCKDEP_CHAINS:      32768
> [    0.001032] ... CHAINHASH_SIZE:          16384
> [    0.001040]  memory used by lock dependency info: 3695 kB
> [    0.001048]  per task-struct memory footprint: 1152 bytes
> [    0.001098] Calibrating delay loop... 718.02 BogoMIPS (lpj=3590144)
> [    0.108975] pid_max: default: 32768 minimum: 301
> [    0.109228] Security Framework initialized
> [    0.109336] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.109351] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.133795] CPU: Testing write buffer coherency: ok
> [    0.135210] Setting up static identity map for 0x80585008 - 0x80585078
> [    0.140257] devtmpfs: initialized
> [    0.145000] VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
> [    0.185434] omap_hwmod: tptc0 using broken dt data from edma
> [    0.185844] omap_hwmod: tptc1 using broken dt data from edma
> [    0.186236] omap_hwmod: tptc2 using broken dt data from edma
> [    0.194796] omap_hwmod: debugss: _wait_target_disable failed
> [    0.255925] pinctrl core: initialized pinctrl subsystem
> [    0.261149] regulator-dummy: no parameters
> [    0.265605] NET: Registered protocol family 16
> [    0.271835] DMA: preallocated 256 KiB pool for atomic coherent allocations
> [    0.278637] cpuidle: using governor ladder
> [    0.278667] cpuidle: using governor menu
> [    0.293898] platform 49000000.edma: alias fck already exists
> [    0.293940] platform 49000000.edma: alias fck already exists
> [    0.293961] platform 49000000.edma: alias fck already exists
> [    0.298872] OMAP GPIO hardware version 0.1
> [    0.337881] No ATAGs?
> [    0.337912] hw-breakpoint: debug architecture 0x4 unsupported.
> [    0.410768] bio: create slab <bio-0> at 0
> [    0.456281] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver
> [    0.458626] vbat: 5000 mV
> [    0.460009] lis3_reg: no parameters
> [    0.460542] reg-fixed-voltage fixedregulator.6: could not find pctldev for node /pinmux@44e10800/pinmux_wl12xx_gpio, deferring probe
> [    0.460585] platform fixedregulator.6: Driver reg-fixed-voltage requests probe deferral
> [    0.461920] vtt: 1500 mV
> [    0.469555] i2c-core: driver [palmas] using legacy suspend method
> [    0.469578] i2c-core: driver [palmas] using legacy resume method
> [    0.471382] SCSI subsystem initialized
> [    0.475744] usbcore: registered new interface driver usbfs
> [    0.476247] usbcore: registered new interface driver hub
> [    0.477012] usbcore: registered new device driver usb
> [    0.479717] omap_i2c 44e0b000.i2c: could not find pctldev for node /pinmux@44e10800/pinmux_i2c0_pins, deferring probe
> [    0.479767] platform 44e0b000.i2c: Driver omap_i2c requests probe deferral
> [    0.480813] pps_core: LinuxPPS API ver. 1 registered
> [    0.480828] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.481207] PTP clock support registered
> [    0.485960] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400
> [    0.493550] Switched to clocksource timer1
> [    0.671361] NET: Registered protocol family 2
> [    0.673357] TCP established hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.673658] TCP bind hash table entries: 2048 (order: 4, 73728 bytes)
> [    0.674611] TCP: Hash tables configured (established 2048 bind 2048)
> [    0.674843] TCP: reno registered
> [    0.674877] UDP hash table entries: 256 (order: 2, 20480 bytes)
> [    0.675136] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
> [    0.676369] NET: Registered protocol family 1
> [    0.677937] RPC: Registered named UNIX socket transport module.
> [    0.677958] RPC: Registered udp transport module.
> [    0.677969] RPC: Registered tcp transport module.
> [    0.677980] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.680990] hw perfevents: enabled with ARMv7 Cortex-A8 PMU driver, 5 counters available
> [    0.689152] futex hash table entries: 256 (order: 1, 11264 bytes)
> [    0.886524] VFS: Disk quotas dquot_6.5.2
> [    0.886622] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> [    0.888716] NFS: Registering the id_resolver key type
> [    0.889250] Key type id_resolver registered
> [    0.889271] Key type id_legacy registered
> [    0.889403] jffs2: version 2.2. (NAND) (SUMMARY)  ????? 2001-2006 Red Hat, Inc.
> [    0.889862] msgmni has been set to 474
> [    0.895733] io scheduler noop registered
> [    0.895759] io scheduler deadline registered
> [    0.895813] io scheduler cfq registered (default)
> [    0.900229] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 size 568
> [    0.904638] ecap 48304100.ecap: failed to get clock rate
> [    0.904826] ecap: probe of 48304100.ecap failed with error -22
> [    0.912319] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.921434] omap_uart 44e09000.serial: no wakeirq for uart0
> [    0.922092] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq = 88, base_baud = 3000000) is a OMAP UART0
> [    1.664216] console [ttyO0] enabled
> [    1.673213] omap_rng 48310000.rng: OMAP Random Number Generator ver. 20
> [    1.712803] brd: module loaded
> [    1.734772] loop: module loaded
> [    1.738898] (hci_tty): inside hci_tty_init
> [    1.744709] (hci_tty): allocated 249, 0
> [    1.759494] mtdoops: mtd device (mtddev=name/number) must be supplied
> [    1.778210] usbcore: registered new interface driver asix
> [    1.784462] usbcore: registered new interface driver ax88179_178a
> [    1.791292] usbcore: registered new interface driver cdc_ether
> [    1.797954] usbcore: registered new interface driver smsc95xx
> [    1.804456] usbcore: registered new interface driver net1080
> [    1.810808] usbcore: registered new interface driver cdc_subset
> [    1.817483] usbcore: registered new interface driver zaurus
> [    1.823934] usbcore: registered new interface driver cdc_ncm
> [    1.831606] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    1.838512] ehci-omap: OMAP-EHCI Host Controller driver
> [    1.845387] usbcore: registered new interface driver cdc_wdm
> [    1.851834] usbcore: registered new interface driver usb-storage
> [    1.861890] mousedev: PS/2 mouse device common for all mice
> [    1.873474] input: ti-tsc as /devices/ocp.3/44e0d000.tscadc/TI-am335x-tsc/input/input0
> [    1.887337] i2c-core: driver [rtc-ds1307] using legacy suspend method
> [    1.894156] i2c-core: driver [rtc-ds1307] using legacy resume method
> [    1.903397] omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc as rtc0
> [    1.913203] i2c /dev entries driver
> [    1.917394] Driver for 1-wire Dallas network protocol.
> [    1.929551] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60 sec
> [    1.942571] omap_hsmmc 48060000.mmc: unable to get vmmc regulator -517
> [    1.950111] platform 48060000.mmc: Driver omap_hsmmc requests probe deferral
> [    1.958244] omap_hsmmc 481d8000.mmc: unable to get vmmc regulator -517
> [    1.965292] platform 481d8000.mmc: Driver omap_hsmmc requests probe deferral
> [    1.980099] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.987187] omap-aes 53500000.aes: OMAP AES hw accel rev: 3.2
> [    1.997029] omap-sham 53100000.sham: hw accel on OMAP rev 4.3
> [    2.007767] usbcore: registered new interface driver usbhid
> [    2.013669] usbhid: USB HID core driver
> [    2.019531]  remoteproc0: wkup_m3 is available
> [    2.024275]  remoteproc0: Note: remoteproc is still under development and considered experimental.
> [    2.033666]  remoteproc0: THE BINARY FORMAT IS NOT YET FINALIZED, and backward compatibility isn't yet guaranteed.
> [    2.046124]  remoteproc0: Direct firmware load failed with error -2
> [    2.052683]  remoteproc0: Falling back to user helper
> [    2.063501] oprofile: using arm/armv7
> [    2.067664] nf_conntrack version 0.5.0 (3794 buckets, 15176 max)
> [    2.075725] ip_tables: (C) 2000-2006 Netfilter Core Team
> [    2.081749] TCP: cubic registered
> [    2.085308] Initializing XFRM netlink socket
> [    2.089945] NET: Registered protocol family 17
> [    2.094706] NET: Registered protocol family 15
> [    2.099723] Key type dns_resolver registered
> [    2.106297] cpufreq_cpu0: failed to get cpu0 clock: -2
> [    2.111718] cpufreq-cpu0: probe of cpufreq-cpu0.0 failed with error -2
> [    2.120314] ThumbEE CPU extension supported.
> [    2.124939] Registering SWP/SWPB emulation handler
> [    2.129948] SmartReflex Class3 initialized
> [    2.138955] lis3_reg: disabling
> [    2.142263] vbat: disabling
> [    2.145286] regulator-dummy: disabling
> [    2.152243] vwl1271: 1800 mV
> [    2.164335] tps65910 0-002d: No interrupt support, no core IRQ
> [    2.211487] vrtc: 1800 mV
> [    2.220258] vrtc: supplied by vbat
> [    2.259923] vio: at 1500 mV
> [    2.263179] vio: supplied by vbat
> [    2.307690] vdd_mpu: 912 <--> 1375 mV at 1137 mV
> [    2.312848] vdd_mpu: supplied by vbat
> [    2.357664] vdd_core: 912 <--> 1150 mV at 1137 mV
> [    2.362901] vdd_core: supplied by vbat
> [    2.400499] vdd3: 5000 mV
> [    2.438315] vdig1: at 1800 mV
> [    2.441734] vdig1: supplied by vbat
> [    2.480480] vdig2: at 1800 mV
> [    2.483936] vdig2: supplied by vbat
> [    2.522592] vpll: at 1800 mV
> [    2.525952] vpll: supplied by vbat
> [    2.564585] vdac: at 1800 mV
> [    2.567904] vdac: supplied by vbat
> [    2.606479] vaux1: at 1800 mV
> [    2.609887] vaux1: supplied by vbat
> [    2.648671] vaux2: at 3300 mV
> [    2.652080] vaux2: supplied by vbat
> [    2.690772] vaux33: at 3300 mV
> [    2.694343] vaux33: supplied by vbat
> [    2.733127] vmmc: 1800 <--> 3300 mV at 3300 mV
> [    2.738123] vmmc: supplied by vbat
> [    2.747024] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
> [    3.041966] Division by zero in kernel.
> [    3.046104] CPU: 0 PID: 1 Comm: swapper Not tainted 3.14.17-g36fd7b6 #1
> [    3.053055] [<c0013178>] (unwind_backtrace) from [<c0011448>] (show_stack+0x10/0x14)
> [    3.061194] [<c0011448>] (show_stack) from [<c02bd334>] (Ldiv0+0x8/0x10)
> [    3.068248] [<c02bd334>] (Ldiv0) from [<c03e74dc>] (__davinci_mdio_reset+0x54/0x78)
> [    3.076290] [<c03e74dc>] (__davinci_mdio_reset) from [<c03e7c70>] (davinci_mdio_reset+0x10/0x8c)
> [    3.085507] [<c03e7c70>] (davinci_mdio_reset) from [<c03dabf0>] (mdiobus_register+0xa4/0x174)
> [    3.094665] [<c03dabf0>] (mdiobus_register) from [<c03e77f8>] (davinci_mdio_probe+0x19c/0x368)
> [    3.103723] [<c03e77f8>] (davinci_mdio_probe) from [<c034b924>] (platform_drv_probe+0x18/0x48)
> [    3.112730] [<c034b924>] (platform_drv_probe) from [<c034a5c8>] (driver_probe_device+0x10c/0x238)
> [    3.122040] [<c034a5c8>] (driver_probe_device) from [<c0348cb0>] (bus_for_each_drv+0x44/0x8c)
> [    3.130985] [<c0348cb0>] (bus_for_each_drv) from [<c034a484>] (device_attach+0x74/0x8c)
> [    3.139385] [<c034a484>] (device_attach) from [<c0349b54>] (bus_probe_device+0x88/0xb0)
> [    3.147781] [<c0349b54>] (bus_probe_device) from [<c0348134>] (device_add+0x3ec/0x4f4)
> [    3.156092] [<c0348134>] (device_add) from [<c048d574>] (of_platform_device_create_pdata+0x6c/0x94)
> [    3.165576] [<c048d574>] (of_platform_device_create_pdata) from [<c048d67c>] (of_platform_bus_create+0xe0/0x164)
> [    3.176244] [<c048d67c>] (of_platform_bus_create) from [<c048d75c>] (of_platform_populate+0x5c/0x9c)
> [    3.185820] [<c048d75c>] (of_platform_populate) from [<c03eb0fc>] (cpsw_probe+0x260/0xed0)
> [    3.194493] [<c03eb0fc>] (cpsw_probe) from [<c034b924>] (platform_drv_probe+0x18/0x48)
> [    3.202769] [<c034b924>] (platform_drv_probe) from [<c034a5c8>] (driver_probe_device+0x10c/0x238)
> [    3.212071] [<c034a5c8>] (driver_probe_device) from [<c034a788>] (__driver_attach+0x94/0x98)
> [    3.220921] [<c034a788>] (__driver_attach) from [<c0348d4c>] (bus_for_each_dev+0x54/0x88)
> [    3.229502] [<c0348d4c>] (bus_for_each_dev) from [<c0349d4c>] (bus_add_driver+0xd8/0x1d8)
> [    3.238101] [<c0349d4c>] (bus_add_driver) from [<c034adb8>] (driver_register+0x78/0xf4)
> [    3.246506] [<c034adb8>] (driver_register) from [<c0008890>] (do_one_initcall+0xe4/0x144)
> [    3.255101] [<c0008890>] (do_one_initcall) from [<c0800b64>] (kernel_init_freeable+0xe8/0x1b4)
> [    3.264149] [<c0800b64>] (kernel_init_freeable) from [<c0575524>] (kernel_init+0x8/0xec)
> [    3.272613] [<c0575524>] (kernel_init) from [<c000e508>] (ret_from_fork+0x14/0x2c)
> [    3.333300] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
> [    3.339705] davinci_mdio 4a101000.mdio: detected phy mask fffffffc
> [    3.751891] libphy: 4a101000.mdio: probed
> [    3.756190] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00, driver Atheros 8031 ethernet
> [    3.765863] davinci_mdio 4a101000.mdio: phy[1]: device 4a101000.mdio:01, driver Atheros 8031 ethernet
> [    3.831994] cpsw 4a100000.ethernet: Detected MACID = 00:18:31:e0:1e:80
> [    3.842771] cpsw 4a100000.ethernet: cpsw: Detected MACID = 00:18:31:e0:1e:81
> [    3.855818] input: gpio_buttons.9 as /devices/gpio_buttons.9/input/input1
> [    3.865445] omap_rtc 44e3e000.rtc: setting system clock to 2000-01-01 00:00:01 UTC (946684801)
> [    3.874592] sr_init: No PMIC hook to init smartreflex
> [    3.907331] sr_init: platform driver register failed for SR
> [    3.935326] Waiting for root device /dev/mmcblk0p2...
> [   62.246424]  remoteproc0: failed to load am335x-pm-firmware.elf
> [   62.253023]  remoteproc0: powering up wkup_m3
> [   62.258077]  remoteproc0: Direct firmware load failed with error -2
> [   62.264687]  remoteproc0: Falling back to user helper
> [  122.405065]  remoteproc0: request_firmware failed: -2
> [  122.410374] wkup_m3 44d00000.wkup_m3: rproc_boot failed
> 
> 
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


