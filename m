Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 576B2E0051D
	for <meta-ti@yoctoproject.org>; Wed, 15 May 2013 11:54:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4FIrxN6016588;
	Wed, 15 May 2013 13:53:59 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4FIrxZb013501;
	Wed, 15 May 2013 13:53:59 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 15 May 2013 13:53:58 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4FIrwKJ000699;
	Wed, 15 May 2013 13:53:58 -0500
Date: Wed, 15 May 2013 14:53:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: =?iso-8859-1?Q?M=E5ns?= Andersson <Mans.Andersson@nibe.se>
Message-ID: <20130515185357.GE20048@edge>
References: <9271A7A786434844A19F14A6050530257A5409FE@NIVM101.nibe.se>
	<20130506225603.GG10607@edge>
	<9271A7A786434844A19F14A6050530257A542AEF@NIVM101.nibe.se>
MIME-Version: 1.0
In-Reply-To: <9271A7A786434844A19F14A6050530257A542AEF@NIVM101.nibe.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Building and booting AM335x Starter Kit
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
X-List-Received-Date: Wed, 15 May 2013 18:54:03 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 13, 2013 at 02:38:10PM +0000, Måns Andersson wrote:
> It seems that backporting the kernel to v3.2 (linux-am335x-psp_3.2) works.
> Are there any plans for when the linux-ti-staging branch will support this 
> machine?

Måns,

As our test team just confirmed, it appears to be a recent regression in the 
linux-ti-staging-3.8 kernel - it works on EVM and fails on SK. We will be 
looking into this issue, thanks for reporting.

-- 
Denys


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com] 
> Sent: den 7 maj 2013 00:56
> To: Måns Andersson
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] Building and booting AM335x Starter Kit
> 
> On Mon, May 06, 2013 at 09:16:13AM +0000, Måns Andersson wrote:
> > Hi, I'm currently trying out the meta-ti layer on an AM335x EVM 
> > Starter Kit (not the regular am335x-evm). As far as I can see the 
> > meta-ti layer's machine configuration for am335x-evm should work also on the am335x-evmsk.
> > But I'm having trouble booting the device after doing a build.
> > 
> > The x-loader and u-boot stages works alright and the kernel is loaded. 
> > But during kernel boot the system hangs with the following statement
> > [    1.963153] Waiting for root device /dev/mmcblk0p2...
> > I have been reading up on dtb files and how they are managed by the 
> > ti-staging-kernel, and as long as I can see the correct one
> > (am335x-evmsk.dtb) are included in the kernel and have all the device 
> > configurations needed.
> > 
> > Are there any known problems with this machine configuration, or have 
> > I missed some important stage? Any help or point in the right 
> > direction is highely appreciated. :-)
> 
> Hi,
> 
> How fresh is your copy of meta-ti? Can you please confirm the latest commit?
> 
> --
> Denys
> 
> 
> > Thanks,
> > // Måns
> > 
> > Full kernel output:
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] Linux version 3.8.8 (mans@calculon) (gcc version 4.7.2 (GCC) ) #1 SMP Thu May 2 16:53:58 CEST 2013
> > [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c53c7d
> > [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> > [    0.000000] Machine: Generic AM33XX (Flattened Device Tree), model: TI AM335x EVM-SK
> > [    0.000000] Memory policy: ECC disabled, Data cache writeback
> > [    0.000000] AM335X ES1.0 (neon )
> > [    0.000000] PERCPU: Embedded 9 pages/cpu @c1195000 s13440 r8192 d15232 u36864
> > [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 64768
> > [    0.000000] Kernel command line: console=ttyO0,115200n8 root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait
> > [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> > [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
> > [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
> > [    0.000000] __ex_table already sorted, skipping sort
> > [    0.000000] Memory: 255MB = 255MB total
> > [    0.000000] Memory: 244384k/244384k available, 17760k reserved, 0K highmem
> > [    0.000000] Virtual kernel memory layout:
> > [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> > [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
> > [    0.000000]     vmalloc : 0xd0800000 - 0xff000000   ( 744 MB)
> > [    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
> > [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> > [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> > [    0.000000]       .text : 0xc0008000 - 0xc079e87c   (7771 kB)
> > [    0.000000]       .init : 0xc079f000 - 0xc07f8480   ( 358 kB)
> > [    0.000000]       .data : 0xc07fa000 - 0xc08a8158   ( 697 kB)
> > [    0.000000]        .bss : 0xc08a8158 - 0xc0e06274   (5497 kB)
> > [    0.000000] Hierarchical RCU implementation.
> > [    0.000000] 	RCU restricting CPUs from NR_CPUS=2 to nr_cpu_ids=1.
> > [    0.000000] NR_IRQS:16 nr_irqs:16 16
> > [    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts
> > [    0.000000] Total of 128 interrupts on 1 active controller
> > [    0.000000] OMAP clockevent source: GPTIMER2 at 24000000 Hz
> > [    0.000000] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 178956ms
> > [    0.000000] OMAP clocksource: GPTIMER1 at 24000000 Hz
> > [    0.000000] Console: colour dummy device 80x30
> > [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> > [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> > [    0.000000] ... MAX_LOCK_DEPTH:          48
> > [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> > [    0.000000] ... CLASSHASH_SIZE:          4096
> > [    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
> > [    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
> > [    0.000000] ... CHAINHASH_SIZE:          16384
> > [    0.000000]  memory used by lock dependency info: 3695 kB
> > [    0.000000]  per task-struct memory footprint: 1152 bytes
> > [    0.000892] Calibrating delay loop... 478.91 BogoMIPS (lpj=1867776)
> > [    0.085706] pid_max: default: 32768 minimum: 301
> > [    0.086166] Security Framework initialized
> > [    0.086325] Mount-cache hash table entries: 512
> > [    0.098358] CPU: Testing write buffer coherency: ok
> > [    0.099727] CPU0: thread -1, cpu 0, socket -1, mpidr 0
> > [    0.099805] Setting up static identity map for 0x80558830 - 0x805588a0
> > [    0.102306] Brought up 1 CPUs
> > [    0.102333] SMP: Total of 1 processors activated (478.91 BogoMIPS).
> > [    0.105274] devtmpfs: initialized
> > [    0.122620] omap_hwmod: debugss: _wait_target_disable failed
> > [    0.181379] pinctrl core: initialized pinctrl subsystem
> > [    0.186947] regulator-dummy: no parameters
> > [    0.189120] NET: Registered protocol family 16
> > [    0.189885] DMA: preallocated 256 KiB pool for atomic coherent allocations
> > [    0.191081] omap-gpmc omap-gpmc: GPMC revision 6.0
> > [    0.209537] platform 49000000.edma: alias fck already exists
> > [    0.209577] platform 49000000.edma: alias fck already exists
> > [    0.209599] platform 49000000.edma: alias fck already exists
> > [    0.214764] OMAP GPIO hardware version 0.1
> > [    0.239110] DSS not supported on this SoC
> > [    0.239176] No ATAGs?
> > [    0.239192] hw-breakpoint: debug architecture 0x4 unsupported.
> > [    0.315069] bio: create slab <bio-0> at 0
> > [    0.356901] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driver
> > [    0.358967] vbat: 5000 mV 
> > [    0.360587] lis3_reg: no parameters
> > [    0.370504] SCSI subsystem initialized
> > [    0.374083] usbcore: registered new interface driver usbfs
> > [    0.374588] usbcore: registered new interface driver hub
> > [    0.375796] usbcore: registered new device driver usb
> > [    0.379055] omap_i2c 44e0b000.i2c: could not find pctldev for node /pinmux@44e10800/pinmux_i2c0_pins, deferring probe
> > [    0.379134] platform 44e0b000.i2c: Driver omap_i2c requests probe deferral
> > [    0.386843] Switching to clocksource gp_timer
> > [    0.514987] NET: Registered protocol family 2
> > [    0.516871] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
> > [    0.517088] TCP bind hash table entries: 2048 (order: 4, 73728 bytes)
> > [    0.518053] TCP: Hash tables configured (established 2048 bind 2048)
> > [    0.518279] TCP: reno registered
> > [    0.518314] UDP hash table entries: 256 (order: 2, 20480 bytes)
> > [    0.518579] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
> > [    0.519444] NET: Registered protocol family 1
> > [    0.521182] RPC: Registered named UNIX socket transport module.
> > [    0.521209] RPC: Registered udp transport module.
> > [    0.521222] RPC: Registered tcp transport module.
> > [    0.521235] RPC: Registered tcp NFSv4.1 backchannel transport module.
> > [    0.523804] NetWinder Floating Point Emulator V0.97 (double precision)
> > [    0.706238] VFS: Disk quotas dquot_6.5.2
> > [    0.706507] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> > [    0.709492] NFS: Registering the id_resolver key type
> > [    0.709947] Key type id_resolver registered
> > [    0.709970] Key type id_legacy registered
> > [    0.710112] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
> > [    0.710677] msgmni has been set to 477
> > [    0.714052] io scheduler noop registered
> > [    0.714078] io scheduler deadline registered
> > [    0.714158] io scheduler cfq registered (default)
> > [    0.718267] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 size 568
> > [    0.722650] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> > [    0.730659] 44e09000.serial: ttyO0 at MMIO 0x44e09000 (irq = 88) is a OMAP UART0
> > [    1.337753] console [ttyO0] enabled
> > [    1.345233] [drm] Initialized drm 1.1.0 20060810
> > [    1.381945] brd: module loaded
> > [    1.404677] loop: module loaded
> > [    1.415196] mtdoops: mtd device (mtddev=name/number) must be supplied
> > [    1.423531] OneNAND driver initializing
> > [    1.433822] usbcore: registered new interface driver asix
> > [    1.440303] usbcore: registered new interface driver cdc_ether
> > [    1.447126] usbcore: registered new interface driver smsc95xx
> > [    1.454006] usbcore: registered new interface driver net1080
> > [    1.460552] usbcore: registered new interface driver cdc_subset
> > [    1.467325] usbcore: registered new interface driver zaurus
> > [    1.473870] usbcore: registered new interface driver cdc_ncm
> > [    1.481582] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> > [    1.488549] ehci-omap: OMAP-EHCI Host Controller driver
> > [    1.495407] usbcore: registered new interface driver cdc_wdm
> > [    1.501497] Initializing USB Mass Storage driver...
> > [    1.507211] usbcore: registered new interface driver usb-storage
> > [    1.513607] USB Mass Storage support registered.
> > [    1.518985] usbcore: registered new interface driver usbtest
> > [    1.527313] mousedev: PS/2 mouse device common for all mice
> > [    1.539037] omap_rtc 44e3e000.rtc: rtc core: registered 44e3e000.rtc as rtc0
> > [    1.548516] i2c /dev entries driver
> > [    1.552865] Driver for 1-wire Dallas network protocol.
> > [    1.563044] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60 sec
> > [    1.576768] usbcore: registered new interface driver usbhid
> > [    1.582806] usbhid: USB HID core driver
> > [    1.590744] oprofile: no performance counters
> > [    1.597491] oprofile: using timer interrupt.
> > [    1.602913] TCP: cubic registered
> > [    1.606475] Initializing XFRM netlink socket
> > [    1.611083] NET: Registered protocol family 17
> > [    1.615894] NET: Registered protocol family 15
> > [    1.620933] Key type dns_resolver registered
> > [    1.625607] VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
> > [    1.633784] mux: Failed to setup hwmod io irq -22
> > [    1.640005] cpufreq_cpu0: failed to get cpu0 regulator
> > [    1.647916] Power Management for AM33XX family
> > [    1.653293] Trying to load am335x-pm-firmware.bin
> > [    1.658068] ThumbEE CPU extension supported.
> > [    1.672682] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
> > [    1.681015] tps65910 0-002d: No interrupt support, no core IRQ
> > [    1.695217] vrtc: 1800 mV 
> > [    1.698479] vrtc: supplied by vbat
> > [    1.705640] vio: at 1500 mV 
> > [    1.708999] vio: supplied by vbat
> > [    1.715840] vdd_mpu: 912 <--> 1312 mV at 1262 mV 
> > [    1.720918] vdd_mpu: supplied by vbat
> > [    1.727900] vdd_core: 912 <--> 1150 mV at 1137 mV 
> > [    1.733182] vdd_core: supplied by vbat
> > [    1.739881] vdd3: 5000 mV 
> > [    1.745230] vdig1: at 1800 mV 
> > [    1.748697] vdig1: supplied by vbat
> > [    1.755399] vdig2: at 1800 mV 
> > [    1.758758] vdig2: supplied by vbat
> > [    1.765275] vpll: at 1800 mV 
> > [    1.768517] vpll: supplied by vbat
> > [    1.774885] vdac: at 1800 mV 
> > [    1.778267] vdac: supplied by vbat
> > [    1.784590] vaux1: at 1800 mV 
> > [    1.788048] vaux1: supplied by vbat
> > [    1.794551] vaux2: at 3300 mV 
> > [    1.797903] vaux2: supplied by vbat
> > [    1.804415] vaux33: at 3300 mV 
> > [    1.807843] vaux33: supplied by vbat
> > [    1.814396] vmmc: 1800 <--> 3300 mV at 3300 mV 
> > [    1.819420] vmmc: supplied by vbat
> > [    1.887318] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6
> > [    1.893729] davinci_mdio 4a101000.mdio: detected phy mask fffffffc
> > [    1.904187] libphy: 4a101000.mdio: probed
> > [    1.908420] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00, driver unknown
> > [    1.916908] davinci_mdio 4a101000.mdio: phy[1]: device 4a101000.mdio:01, driver unknown
> > [    1.925803] Random MACID = de:dc:71:aa:37:fa
> > [    1.937424] input: gpio_buttons.7 as /devices/gpio_buttons.7/input/input0
> > [    1.947620] omap_rtc 44e3e000.rtc: setting system clock to 2000-01-01 00:00:01 UTC (946684801)
> > [    1.963153] Waiting for root device /dev/mmcblk0p2...
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

