Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75618E0032E
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 16:05:58 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAH05uSo014710;
	Fri, 16 Nov 2012 18:05:56 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAH05uvt011359;
	Fri, 16 Nov 2012 18:05:56 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 16 Nov 2012 18:05:56 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAH05t8C000637;
	Fri, 16 Nov 2012 18:05:56 -0600
Date: Fri, 16 Nov 2012 19:05:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <20121117000555.GK7631@edge>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Sat, 17 Nov 2012 00:05:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 16, 2012 at 04:56:53PM -0500, Cliff Brake wrote:
> I'm trying to boot a recent oe-core+meta-oe+meta-angstrom+meta-ti on a
> pandaboard.  With 3.4, I get the attached.  With 3.1, I get the below:

3.4 should work. With 3.1 there were some reports that it didn't boot, when 
built with recent toolchain from oe-core... What problems do you have with 
3.4? Does it boot?

Denys


> Environment size: 686/131068 bytes
> Panda # boot
> reading boot.scr
> 
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
> 
> 4175588 bytes read
> Booting from mmc0 ...
> ## Booting kernel from Legacy Image at 82000000 ...
>    Image Name:   Linux-3.1.0
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    4175524 Bytes = 4 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> 
> (nothing more)
> 
> What is the suggested path to get a pandaboard booting?
> 
> Thanks,
> Cliff
> 
> -- 
> =================
> http://bec-systems.com

> U-Boot SPL 2011.12-dirty (Nov 16 2012 - 15:17:13)
> Texas Instruments OMAP4430 ES2.0
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
> 
> 
> U-Boot 2011.12-dirty (Nov 16 2012 - 15:17:13)
> 
> CPU  : OMAP4430 ES2.0
> Board: OMAP4 Panda
> I2C:   ready
> DRAM:  1 GiB
> MMC:   OMAP SD/MMC: 0
> Using default environment
> 
> In:    serial
> Out:   serial
> Err:   serial
> Hit any key to stop autoboot:  0
> reading boot.scr
> 
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
> 
> 4340608 bytes read
> Booting from mmc0 ...
> ## Booting kernel from Legacy Image at 82000000 ...
>    Image Name:   Linux-3.4.11
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    4340544 Bytes = 4.1 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> [    0.000000] Booting Linux on physical CPU 0
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.4.11 (cbrake@mars) (gcc version 4.7.2 (GCC) ) #1 SMP PREEMPT Fri Nov 16 15:24:49 EST 2012
> [    0.000000] CPU: ARMv7 Processor [411fc092] revision 2 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [    0.000000] Machine: OMAP4 Panda board
> [    0.000000] cma: CMA: reserved 8 MiB at 98800000
> [    0.000000] cma: CMA: reserved 112 MiB at 99000000
> [    0.000000] cma: CMA: reserved 32 MiB at ad800000
> [    0.000000] cma: CMA: reserved 16 MiB at ac000000
> [    0.000000] Memory policy: ECC disabled, Data cache writealloc
> [    0.000000] omap2_set_globals_tap
> [    0.000000] OMAP4: Map 0xad600000 to 0xfe600000 for dram barrier
> [    0.000000] omap2_set_globals_tap
> [    0.000000] OMAP4430 ES2.0
> [    0.000000] PERCPU: Embedded 8 pages/cpu @c12ec000 s11712 r8192 d12864 u32768
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 259584
> [    0.000000] Kernel command line: console=ttyO2,115200n8 vram=16M root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwait
> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] allocated 2097152 bytes of page_cgroup
> [    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
> [    0.000000] Memory: 726MB 296MB = 1022MB total
> [    0.000000] Memory: 851860k/851860k available, 196716k reserved, 270336K highmem
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
> [    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
> [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> [    0.000000]       .text : 0xc0008000 - 0xc0857db0   (8512 kB)
> [    0.000000]       .init : 0xc0858000 - 0xc08b9dc0   ( 392 kB)
> [    0.000000]       .data : 0xc08ba000 - 0xc093a7a8   ( 514 kB)
> [    0.000000]        .bss : 0xc093a7cc - 0xc0ae2a04   (1697 kB)
> [    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] NR_IRQS:538
> [    0.000000] omap_sr_disable: omap_sr struct for sr_wakeup not found
> [    0.000000] OMAP clockevent source: GPTIMER1 at 32768 Hz
> [    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps every 131071999ms
> [    0.000000] Console: colour dummy device 80x30
> [    0.000274] Calibrating delay loop... 1590.23 BogoMIPS (lpj=6213632)
> [    0.070312] pid_max: default: 32768 minimum: 301
> [    0.070617] Security Framework initialized
> [    0.070678] AppArmor: AppArmor initialized
> [    0.071044] Mount-cache hash table entries: 512
> [    0.072875] Initializing cgroup subsys cpuacct
> [    0.072937] Initializing cgroup subsys memory
> [    0.072998] Initializing cgroup subsys devices
> [    0.073028] Initializing cgroup subsys freezer
> [    0.073028] Initializing cgroup subsys net_cls
> [    0.073059] Initializing cgroup subsys blkio
> [    0.073120] Initializing cgroup subsys perf_event
> [    0.073333] CPU: Testing write buffer coherency: ok
> [    0.073455] ftrace: allocating 22900 entries in 68 pages
> [    0.143890] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.144226] hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, 7 counters available
> [    0.144409] Setting up static identity map for 0x8059d348 - 0x8059d3a0
> [    0.144439] L310 cache controller enabled
> [    0.144470] l2x0: 16 ways, CACHE_ID 0x410000c4, AUX_CTRL 0x5e470000, Cache size: 1048576 B
> [    0.144470] omap_sar_ram_init
> [    0.144744] generating sar_ram layout...
> [    0.144958] sar ram layout created
> [    0.223022] CPU1: Booted secondary processor
> [    0.292663] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.292694] CPU1: Unknown IPI message 0x1
> [    0.292724] Brought up 2 CPUs
> [    0.292755] SMP: Total of 2 processors activated (3188.82 BogoMIPS).
> [    0.293762] devtmpfs: initialized
> [    0.299346] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299377] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299407] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299438] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299468] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299499] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299530] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.299560] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299591] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299621] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.299652] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299682] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.299743] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299804] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299835] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299865] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299896] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299957] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.299987] omap_sr_disable: omap_sr struct for sr_core not found
> [    0.300842] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.300872] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.300994] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.301025] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.301055] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.303741] omap_hwmod: mcpdm: _wait_target_ready error: -16
> [    0.303771] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.303771] omap_hwmod: mcpdm: cannot be enabled (3)
> [    0.304077] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.304107] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.304138] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.304168] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.305389] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.305938] dummy:
> [    0.322235] NET: Registered protocol family 16
> [    0.335205] DMA: preallocated 256 KiB pool for atomic coherent allocations
> [    0.335632] GPMC revision 6.0
> [    0.337554] gpiochip_add: registered GPIOs 0 to 31 on device: gpio
> [    0.337615] OMAP GPIO hardware version 0.1
> [    0.337829] gpiochip_add: registered GPIOs 32 to 63 on device: gpio
> [    0.338104] gpiochip_add: registered GPIOs 64 to 95 on device: gpio
> [    0.338378] gpiochip_add: registered GPIOs 96 to 127 on device: gpio
> [    0.338623] gpiochip_add: registered GPIOs 128 to 159 on device: gpio
> [    0.338928] gpiochip_add: registered GPIOs 160 to 191 on device: gpio
> [    0.339996] omap_mux_init: Add partition: #1: core, flags: 2
> [    0.341094] omap_mux_init: Add partition: #2: wkup, flags: 2
> [    0.342864] omap_mux_get_by_name: Could not find signal uart1_cts.uart1_cts
> [    0.342895] omap_hwmod_mux_init: Could not allocate device mux entry
> [    0.346466] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watchpoint registers.
> [    0.346496] hw-breakpoint: maximum watchpoint size is 4 bytes.
> [    0.349212] Updated GPU clock source to be dpll_per_m7x2_ck
> [    0.350952]  omap-mcbsp.1: alias pad_fck already exists
> [    0.351135]  omap-mcbsp.2: alias pad_fck already exists
> [    0.351318]  omap-mcbsp.3: alias pad_fck already exists
> [    0.351501]  omap-mcbsp.4: alias pad_fck already exists
> [    0.352539] OMAP DMA hardware revision 0.0
> [    0.353149] emif emif.1: Device configured with addr = f0e00000 and IRQ142
> [    0.353393] emif emif.2: Device configured with addr = f1000000 and IRQ143
> [    0.359283] bio: create slab <bio-0> at 0
> [    0.360076] vwl1271: 1800 mV
> [    0.360290] vhub: 3300 mV
> [    0.360473] hsusb0: 3300 mV
> [    0.360504] hsusb0: supplied by vhub
> [    0.362274] SCSI subsystem initialized
> [    0.362670] omap2_mcspi omap2_mcspi.1: master is unqueued, this is deprecated
> [    0.363037] omap2_mcspi omap2_mcspi.2: master is unqueued, this is deprecated
> [    0.363311] omap2_mcspi omap2_mcspi.3: master is unqueued, this is deprecated
> [    0.363616] omap2_mcspi omap2_mcspi.4: master is unqueued, this is deprecated
> [    0.363922] usbcore: registered new interface driver usbfs
> [    0.364013] usbcore: registered new interface driver hub
> [    0.364135] usbcore: registered new device driver usb
> [    0.364624] omap_i2c omap_i2c.1: bus 1 rev2.4.0 at 400 kHz
> [    0.365112] Skipping twl internal clock init and using bootloader value (unknown osc rate)
> [    0.365692] twl 1-0048: PIH (irq 39) chaining IRQs 416..436
> [    0.366180] VUSB: 3300 mV normal standby
> [    0.369293] twl6030_usb twl6030_usb: Initialized TWL6030 USB module
> [    0.369812] V1V8: 1800 mV normal standby
> [    0.370117] V2V1: 2100 mV normal standby
> [    0.370544] VMMC: 1200 <--> 3000 mV at 3000 mV normal standby
> [    0.371215] VPP: 1800 <--> 2500 mV at 1900 mV normal standby
> [    0.371917] VCXIO: 1800 mV normal standby
> [    0.371948] VCXIO: supplied by V2V1
> [    0.372863] VDAC: 1800 mV normal standby
> [    0.372863] VDAC: supplied by V2V1
> [    0.373657] VAUX2_6030: 1200 <--> 2800 mV at 1800 mV normal standby
> [    0.374267] VAUX3_6030: 1000 <--> 3000 mV at 1200 mV normal standby
> [    0.374969] CLK32KG:
> [    0.375274] VANA: 2100 mV normal standby
> [    0.375640] omap_i2c omap_i2c.2: bus 2 rev2.4.0 at 400 kHz
> [    0.375915] omap_i2c omap_i2c.3: bus 3 rev2.4.0 at 100 kHz
> [    0.376281] omap_i2c omap_i2c.4: bus 4 rev2.4.0 at 400 kHz
> [    0.376556] Linux media interface: v0.10
> [    0.376586] Linux video capture interface: v2.00
> [    0.377044] omap-iommu omap-iommu.0: dsp registered
> [    0.377136] omap-iommu omap-iommu.1: ipu registered
> [    0.377288] Advanced Linux Sound Architecture Driver Version 1.0.25.
> [    0.377868] NetLabel: Initializing
> [    0.377899] NetLabel:  domain hash size = 128
> [    0.377899] NetLabel:  protocols = UNLABELED CIPSOv4
> [    0.377960] NetLabel:  unlabeled traffic allowed by default
> [    0.378479] Switching to clocksource 32k_counter
> [    0.398284] FS-Cache: Loaded
> [    0.398498] AppArmor: AppArmor Filesystem Enabled
> [    0.411468] NET: Registered protocol family 2
> [    0.411804] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.412536] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
> [    0.414489] TCP bind hash table entries: 65536 (order: 7, 786432 bytes)
> [    0.415588] TCP: Hash tables configured (established 131072 bind 65536)
> [    0.415588] TCP: reno registered
> [    0.415618] UDP hash table entries: 512 (order: 2, 16384 bytes)
> [    0.415649] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
> [    0.416015] NET: Registered protocol family 1
> [    0.416229] usbhs_omap usbhs_omap: ehci_logic_fck failed:-2
> [    0.480865]  omap-rproc.1: alias fck already exists
> [    0.481689] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.481781] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.481872] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.481964] omap_sr_disable: omap_sr struct for sr_iva not found
> [    0.483001] audit: initializing netlink socket (disabled)
> [    0.483062] type=2000 audit(0.437:1): initialized
> [    0.577575] highmem bounce pool size: 64 pages
> [    0.584381] VFS: Disk quotas dquot_6.5.2
> [    0.584716] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> [    0.587860] fuse init (API version 7.18)
> [    0.588195] msgmni has been set to 1471
> [    0.590118] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
> [    0.590301] io scheduler noop registered
> [    0.590301] io scheduler deadline registered
> [    0.590362] io scheduler cfq registered (default)
> [    0.591308] OMAP DSS rev 4.0
> [    0.619873] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.621276] omap_uart.0: ttyO0 at MMIO 0x4806a000 (irq = 104) is a OMAP UART0
> [    0.621704] omap_uart.1: ttyO1 at MMIO 0x4806c000 (irq = 105) is a OMAP UART1
> [    0.622100] omap_uart.2: ttyO2 at MMIO 0x48020000 (irq = 106) is a OMAP UART2
> [    1.806335] console [ttyO2] enabled
> [    1.810485] omap_uart.3: ttyO3 at MMIO 0x4806e000 (irq = 102) is a OMAP UART3
> [    1.818817] [drm] Initialized drm 1.1.0 20060810
> [    1.832061] brd: module loaded
> [    1.839172] loop: module loaded
> [    1.842712] (stk) :sysfs entries created
> [    1.846923] (stk) : debugfs entries created
> [    1.856536] Fixed MDIO Bus: probed
> [    1.860382] tun: Universal TUN/TAP device driver, 1.6
> [    1.865844] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
> [    1.872894] PPP generic driver version 2.4.2
> [    1.877777] usbcore: registered new interface driver smsc95xx
> [    1.884246] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    2.031890] ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
> [    2.038238] ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 1
> [    2.047912] ehci-omap ehci-omap.0: irq 109, io mem 0x4a064c00
> [    2.066101] ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
> [    2.072479] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> [    2.079772] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    2.087524] usb usb1: Product: OMAP-EHCI Host Controller
> [    2.093231] usb usb1: Manufacturer: Linux 3.4.11 ehci_hcd
> [    2.099060] usb usb1: SerialNumber: ehci-omap.0
> [    2.104583] hub 1-0:1.0: USB hub found
> [    2.108642] hub 1-0:1.0: 3 ports detected
> [    2.144256] Initializing USB Mass Storage driver...
> [    2.149597] usbcore: registered new interface driver usb-storage
> [    2.156066] USB Mass Storage support registered.
> [    2.161102] usbcore: registered new interface driver libusual
> [    2.167266] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
> [    2.374969] musb-hdrc musb-hdrc: USB OTG mode controller at fc0ab000 using DMA, IRQ 124
> [    2.384185] mousedev: PS/2 mouse device common for all mice
> [    2.392181] twl_rtc twl_rtc: Enabling TWL-RTC
> [    2.400207] twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc0
> [    2.407043] i2c /dev entries driver
> [    2.412475] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout 60 sec
> [    2.420440] device-mapper: uevent: version 1.0.3
> [    2.425781] device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: dm-devel@redhat.com
> [    2.437103] omap_hsmmc.0 supply vmmc_aux not found, using dummy regulator
> [    2.441101] usb 1-1: new high-speed USB device number 2 using ehci-omap
> [    2.560089] omap_hsmmc.4 supply vmmc_aux not found, using dummy regulator
> [    2.605590] usb 1-1: New USB device found, idVendor=0424, idProduct=9514
> [    2.612670] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    2.620910] hub 1-1:1.0: USB hub found
> [    2.625061] hub 1-1:1.0: 5 ports detected
> [    2.677001] thermal_governor_dev_register:Adding omap_ondie_governor governor
> [    2.684570] thermal_get_slope:Getting slope is not supported for domain cpu
> [    2.691986] thermal_get_offset:Getting offset is not supported for domain cpu
> [    2.699859] thermal_governor_dev_register:Adding omap_ongpu_governor governor
> [    2.707550] thermal_get_slope:Getting slope is not supported for domain gpu
> [    2.715026] thermal_get_offset:Getting offset is not supported for domain gpu
> [    2.722839] stm_fw: vendor driver stm_ti1.0 registered
> [    2.737792] omap_pcm_dummy() init
> [    2.741729] OMAP4/5 SoC init
> [    2.744812] omap_pcm_dummy() init
> [    2.748352] omap_mcpdm_dummy() init
> [    2.752960] aess aess: ABE Firmware version 9560
> [    2.760162] omap_sr_disable: omap_sr struct for sr_iva not found
> [    2.774414] mmc0: host does not support reading read-only switch. assuming write-enable.
> [    2.785217] mmc0: new high speed SD card at address b368
> [    2.791931] mmcblk0: mmc0:b368 E1213 976 MiB
> [    2.798431]  mmcblk0: p1 p2
> [    2.799438] omap_sr_disable: omap_sr struct for sr_iva not found
> [    2.811248] asoc: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
> [    2.819244] asoc: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
> [    2.828399] asoc: snd-soc-dummy-dai <-> Voice mapping ok
> [    2.836395] asoc: snd-soc-dummy-dai <-> Tones mapping ok
> [    2.843658] asoc: snd-soc-dummy-dai <-> Vibra mapping ok
> [    2.849822] asoc: snd-soc-dummy-dai <-> MODEM mapping ok
> [    2.855926] asoc: snd-soc-dummy-dai <-> MultiMedia1 LP mapping ok
> [    2.862640] asoc: snd-soc-dummy-dai <-> omap-mcbsp.2 mapping ok
> [    2.871795] asoc: twl6040-legacy <-> mcpdm-legacy mapping ok
> [    2.878601] asoc: twl6040-dl1 <-> mcpdm-dl1 mapping ok
> [    2.884338] asoc: twl6040-ul <-> mcpdm-ul1 mapping ok
> [    2.890014] asoc: twl6040-dl2 <-> mcpdm-dl2 mapping ok
> [    2.895782] asoc: twl6040-vib <-> mcpdm-vib mapping ok
> [    2.901489] asoc: snd-soc-dummy-dai <-> omap-mcbsp.1 mapping ok
> [    2.908050] asoc: snd-soc-dummy-dai <-> omap-mcbsp.1 mapping ok
> [    2.914672] asoc: snd-soc-dummy-dai <-> omap-mcbsp.2 mapping ok
> [    2.921295] usb 1-1.1: new high-speed USB device number 3 using ehci-omap
> [    2.928680] asoc: snd-soc-dummy-dai <-> omap-mcbsp.2 mapping ok
> [    2.936370] input: Panda Headset Jack as /devices/platform/omap-abe-twl6040/sound/card0/input0
> [    2.950714] asoc: omap-hdmi-hifi <-> omap-hdmi-audio-dai mapping ok
> [    2.958496] u32 classifier
> [    2.961364]     Actions configured
> [    2.965362] TCP: cubic registered
> [    2.969390] NET: Registered protocol family 10
> [    2.975006] NET: Registered protocol family 17
> [    2.979888] lib80211: common routines for IEEE802.11 drivers
> [    2.986083] Registering the dns_resolver key type
> [    2.991271] VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 1
> [    2.999420] ThumbEE CPU extension supported.
> [    3.003997] Registering SWP/SWPB emulation handler
> 

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


