Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42AC9E00B03; Tue, 15 Dec 2015 07:56:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C2AAE00863
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 07:56:08 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFFu6UI010232;
	Tue, 15 Dec 2015 09:56:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFFu6xM003390;
	Tue, 15 Dec 2015 09:56:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 09:56:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFFu6F2011435;
	Tue, 15 Dec 2015 09:56:06 -0600
Date: Tue, 15 Dec 2015 10:55:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Vanderpool <jdvdt2@gmail.com>
Message-ID: <20151215155550.GC23133@edge>
References: <CAAjA2ML-KrQ8wB+dbwkkCpTAmpO3PvBJYhioPyk9m89zO7Mucg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAjA2ML-KrQ8wB+dbwkkCpTAmpO3PvBJYhioPyk9m89zO7Mucg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Kernel Boot Issue? hsmmc
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
X-List-Received-Date: Tue, 15 Dec 2015 15:56:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is not the right list for this question - try http://e2e.ti.com

--=20
Denys


On Mon, Dec 14, 2015 at 01:21:18PM -0500, Joshua Vanderpool wrote:
> I have a custom Board based on the am57xx like the x15.
> I have successful u-boot working and the kernel starts however it freezes
> and keeps stating something about the hsmmc.  I updated the dts to mimic
> the x15 but still have s similar issue.
>=20
> Is there any other clues to the issue at hand from this capture?
>=20
> Best Regards,
> Josh

>=20
> U-Boot SPL 2015.07 (Dec 10 2015 - 10:08:12)
> DRA752 ES1.1
>=20
>=20
> U-Boot 2015.07 (Dec 10 2015 - 10:08:12 -0500)
>=20
> CPU  : DRA752 ES1.1
> Board: Raymond GDM
> I2C:   ready
> DRAM:  2 GiB
> MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> Card did not respond to voltage select!
> ** Bad device mmc 0 **
> Using default environment
>=20
> Net:   Net Initialization Skipped
> No ethernet found.
> Hit any key to stop autoboot:  1 =08=08=08 0=20
> Boot fastboot requested, resetting dofastboot ...
> Saving Environment to FAT...
> Card did not respond to voltage select!
> ** Bad device mmc 0 **
> Booting into fastboot ...
> Unknown command 'fastboot' - try 'help'
> gpio: pin 58 (gpio 58) value is 0
> ## Error: "envboot" not defined
> Card did not respond to voltage select!
> Card did not respond to voltage select!
> switch to partitions #0, OK
> mmc1(part 0) is current device
> SD/MMC found on device 1
> reading uEnv.txt
> ** Unable to read file uEnv.txt **
> reading /boot/zImage
> 4355976 bytes read in 225 ms (18.5 MiB/s)
> reading /boot/am57xx-raymond-gdm.dtb
> 96053 bytes read in 12 ms (7.6 MiB/s)
> Booting from mmc1 ...
> Kernel image @ 0x82000000 [ 0x000000 - 0x427788 ]
> ## Flattened Device Tree blob at 88000000
>    Booting using the fdt blob at 0x88000000
>    Loading Device Tree to 8ffe5000, end 8ffff734 ... OK
>=20
> Starting kernel ...
>=20
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 4.1.13-gf0f52afb60 (jvanderpool@jvanderpool-=
workstation) (gcc version 4.9.3 20150413 (prerelease) (Linaro GCC 4.9-2015.=
05) ) #3 SMP PREEMPT Fri Dec 11 14:11:32 EST 2015
> [    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=3D3=
0c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction =
cache
> [    0.000000] Machine model: TI AM5728 Raymond-GDM
> [    0.000000] Reserved memory: unsupported node format, ignoring
> [    0.000000] cma: Reserved 24 MiB at 0x00000000fe400000
> [    0.000000] Forcing write-allocate cache policy for SMP
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] DRA752 ES1.1
> [    0.000000] PERCPU: Embedded 13 pages/cpu @ee55e000 s22848 r8192 d2220=
8 u53248
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 521810
> [    0.000000] Kernel command line: console=3DttyO2,115200n8 vram=3D16M r=
oot=3DPARTUUID=3Dd3fe00ea-1ebf-584e-96c2-ca5488e60863 ro rootfstype=3Dext4 =
rootwait
> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 by=
tes)
> [    0.000000] Memory: 2029968K/2094080K available (7827K kernel code, 74=
6K rwdata, 3220K rodata, 1124K init, 6629K bss, 39536K reserved, 24576K cma=
-reserved, 1291264K highmem)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
> [    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
> [    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
> [    0.000000]       .text : 0xc0008000 - 0xc0ad2024   (11049 kB)
> [    0.000000]       .init : 0xc0ad3000 - 0xc0bec000   (1124 kB)
> [    0.000000]       .data : 0xc0bec000 - 0xc0ca6960   ( 747 kB)
> [    0.000000]        .bss : 0xc0ca9000 - 0xc1322568   (6630 kB)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] 	RCU debugfs-based tracing is enabled.
> [    0.000000] 	Additional per-CPU info printed with stalls.
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] OMAP clockevent source: timer1 at 32768 Hz
> [    0.000000] clocksource 32k_counter: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 58327039986419 ns
> [    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps e=
very 65535999984741ns
> [    0.000030] OMAP clocksource: 32k_counter at 32768 Hz
> [    0.000579] Architected cp15 timer(s) running at 6.14MHz (virt).
> [    0.000579] clocksource arch_sys_counter: mask: 0xffffffffffffff max_c=
ycles: 0x16af5adb9, max_idle_ns: 440795202250 ns
> [    0.000615] sched_clock: 56 bits at 6MHz, resolution 162ns, wraps ever=
y 4398046511023ns
> [    0.000625] Switching to timer-based delay loop, resolution 162ns
> [    0.001303] Console: colour dummy device 80x30
> [    0.001332] WARNING: Your 'console=3DttyO2' has been replaced by 'ttyS=
2'
> [    0.001338] This ensures that you still see kernel messages. Please
> [    0.001344] update your kernel commandline.
> [    0.001350] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc=
=2E, Ingo Molnar
> [    0.001355] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.001361] ... MAX_LOCK_DEPTH:          48
> [    0.001366] ... MAX_LOCKDEP_KEYS:        8191
> [    0.001371] ... CLASSHASH_SIZE:          4096
> [    0.001377] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.001382] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.001387] ... CHAINHASH_SIZE:          32768
> [    0.001393]  memory used by lock dependency info: 5151 kB
> [    0.001399]  per task-struct memory footprint: 1152 bytes
> [    0.055654] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 12.29 BogoMIPS (lpj=3D61475)
> [    0.055672] pid_max: default: 32768 minimum: 301
> [    0.056120] Security Framework initialized
> [    0.056354] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.056372] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 =
bytes)
> [    0.059794] Initializing cgroup subsys blkio
> [    0.059823] Initializing cgroup subsys memory
> [    0.059947] Initializing cgroup subsys devices
> [    0.060001] Initializing cgroup subsys freezer
> [    0.060047] Initializing cgroup subsys perf_event
> [    0.060179] CPU: Testing write buffer coherency: ok
> [    0.061366] /cpus/cpu@0 missing clock-frequency property
> [    0.061419] /cpus/cpu@1 missing clock-frequency property
> [    0.061429] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
> [    0.061603] Setting up static identity map for 0x800082c0 - 0x80008318
> [    0.141768] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.141900] Brought up 2 CPUs
> [    0.141914] SMP: Total of 2 processors activated (24.59 BogoMIPS).
> [    0.141921] CPU: All CPU(s) started in SVC mode.
> [    0.143933] devtmpfs: initialized
> [    0.436594] VFP support v0.3: implementor 41 architecture 4 part 30 va=
riant f rev 0
> [    0.438364] omap_hwmod: l3_main_2 using broken dt data from ocp
> [    0.470366] omap_hwmod: tptc0 using broken dt data from edma-controller
> [    0.471518] omap_hwmod: tptc1 using broken dt data from edma-controller
> [    0.745838] clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 19112604462750000 ns
> [    0.748250] pinctrl core: initialized pinctrl subsystem
> [    0.754780] NET: Registered protocol family 16
> [    0.756684] DMA: preallocated 256 KiB pool for atomic coherent allocat=
ions
> [    0.792114] cpuidle: using governor ladder
> [    0.822090] cpuidle: using governor menu
> [    0.858471] OMAP GPIO hardware version 0.1
> [    0.895570] irq: no irq domain found for /ocp/l4@4a000000/scm@2000/pin=
mux@1400 !
> [    0.897742] irq: no irq domain found for /ocp/l4@4a000000/scm@2000/pin=
mux@1400 !
> [    0.899055] irq: no irq domain found for /ocp/l4@4a000000/scm@2000/pin=
mux@1400 !
> [    0.900308] irq: no irq domain found for /ocp/l4@4a000000/scm@2000/pin=
mux@1400 !
> [    0.991470] No ATAGs?
> [    0.991533] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watc=
hpoint registers.
> [    0.991542] hw-breakpoint: maximum watchpoint size is 8 bytes.
> [    0.998181] omap4_sram_init:Unable to allocate sram needed to handle e=
rrata I688
> [    0.998191] omap4_sram_init:Unable to get sram pool needed to handle e=
rrata I688
> [    1.000627] OMAP DMA hardware revision 0.0
> [    1.154359] edma-dma-engine edma-dma-engine.0: TI EDMA DMA engine driv=
er
> [    1.184716] omap-dma-engine 4a056000.dma-controller: OMAP DMA engine d=
river
> [    1.185690] reg-fixed-voltage fixedregulator@2: could not find pctldev=
 for node /ocp/l4@4a000000/scm@2000/pinmux@1400/wlan_pins_default, deferrin=
g probe
> [    1.185813] reg-fixed-voltage fixedregulator@3: could not find pctldev=
 for node /ocp/l4@4a000000/scm@2000/pinmux@1400/wlan_rfsw_pins_default, def=
erring probe
> [    1.197793] omap-iommu 40d01000.mmu: 40d01000.mmu registered
> [    1.198666] omap-iommu 40d02000.mmu: 40d02000.mmu registered
> [    1.199540] omap-iommu 58882000.mmu: 58882000.mmu registered
> [    1.200477] omap-iommu 55082000.mmu: 55082000.mmu registered
> [    1.201728] omap-iommu 41501000.mmu: 41501000.mmu registered
> [    1.202803] omap-iommu 41502000.mmu: 41502000.mmu registered
> [    1.204782] vgaarb: loaded
> [    1.208137] SCSI subsystem initialized
> [    1.210636] usbcore: registered new interface driver usbfs
> [    1.211227] usbcore: registered new interface driver hub
> [    1.211652] usbcore: registered new device driver usb
> [    1.213303] omap_i2c 48070000.i2c: could not find pctldev for node /oc=
p/l4@4a000000/scm@2000/pinmux@1400/i2c1_pins_default, deferring probe
> [    1.213487] omap_i2c 48060000.i2c: could not find pctldev for node /oc=
p/l4@4a000000/scm@2000/pinmux@1400/i2c3_pins_default, deferring probe
> [    1.213638] omap_i2c 4807a000.i2c: could not find pctldev for node /oc=
p/l4@4a000000/scm@2000/pinmux@1400/i2c4_pins_default, deferring probe
> [    1.214014] media: Linux media interface: v0.10
> [    1.214401] Linux video capture interface: v2.00
> [    1.214661] pps_core: LinuxPPS API ver. 1 registered
> [    1.214668] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    1.214812] PTP clock support registered
> [    1.217303] omap-mailbox: probe of 48840000.mailbox failed with error =
-22
> [    1.217731] omap-mailbox: probe of 48842000.mailbox failed with error =
-22
> [    1.219586] Advanced Linux Sound Architecture Driver Initialized.
> [    1.225010] Bluetooth: Core ver 2.20
> [    1.225187] NET: Registered protocol family 31
> [    1.225194] Bluetooth: HCI device and connection manager initialized
> [    1.225259] Bluetooth: HCI socket layer initialized
> [    1.225301] Bluetooth: L2CAP socket layer initialized
> [    1.225471] Bluetooth: SCO socket layer initialized
> [    1.253934] DMA-API: preallocated 4096 debug entries
> [    1.253944] DMA-API: debugging enabled by kernel config
> [    1.254236] Switched to clocksource arch_sys_counter
> [    1.497119] NET: Registered protocol family 2
> [    1.499379] TCP established hash table entries: 8192 (order: 3, 32768 =
bytes)
> [    1.499539] TCP bind hash table entries: 8192 (order: 6, 294912 bytes)
> [    1.500997] TCP: Hash tables configured (established 8192 bind 8192)
> [    1.501226] UDP hash table entries: 512 (order: 3, 40960 bytes)
> [    1.501438] UDP-Lite hash table entries: 512 (order: 3, 40960 bytes)
> [    1.502739] NET: Registered protocol family 1
> [    1.504512] RPC: Registered named UNIX socket transport module.
> [    1.504522] RPC: Registered udp transport module.
> [    1.504529] RPC: Registered tcp transport module.
> [    1.504536] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    1.507843] CPU PMU: Failed to parse /pmu/interrupt-affinity[0]
> [    1.507946] hw perfevents: enabled with armv7_cortex_a15 PMU driver, 7=
 counters available
> [    1.521019] futex hash table entries: 512 (order: 3, 32768 bytes)
> [    1.521384] audit: initializing netlink subsys (disabled)
> [    1.521592] audit: type=3D2000 audit(1.509:1): initialized
> [    1.639671] VFS: Disk quotas dquot_6.6.0
> [    1.641900] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 b=
ytes)
> [    1.673297] NFS: Registering the id_resolver key type
> [    1.673479] Key type id_resolver registered
> [    1.673487] Key type id_legacy registered
> [    1.673880] jffs2: version 2.2. (NAND) (SUMMARY)  ?? 2001-2006 Red Hat=
, Inc.
> [    1.696475] alg: No test for stdrng (krng)
> [    1.696560] NET: Registered protocol family 38
> [    1.696860] bounce: pool size: 64 pages
> [    1.696913] io scheduler noop registered
> [    1.696951] io scheduler deadline registered
> [    1.697096] io scheduler cfq registered (default)
> [    1.712058] omap_hwmod: ocp2scp3: _wait_target_disable failed
> [    1.726249] pinctrl-single 4a003400.pinmux: 281 pins at pa fc003400 si=
ze 1124
> [    1.788412] dra7-pcie 51000000.pcie: PCI host bridge to bus 0000:00
> [    1.788439] pci_bus 0000:00: root bus resource [io  0x1000-0xffff]
> [    1.788461] pci_bus 0000:00: root bus resource [mem 0x20013000-0x2ffff=
fff]
> [    1.788484] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.788698] pci 0000:00:00.0: IOMMU is currently not supported for PCI
> [    1.790652] PCI: bus0: Fast back to back transfers disabled
> [    1.791734] PCI: bus1: Fast back to back transfers enabled
> [    1.791923] pci 0000:00:00.0: BAR 0: assigned [mem 0x20100000-0x201fff=
ff]
> [    1.791939] pci 0000:00:00.0: BAR 1: assigned [mem 0x20020000-0x2002ff=
ff]
> [    1.792002] pci 0000:00:00.0: PCI bridge to [bus 01]
> [    1.795119] backlight supply power not found, using dummy regulator
> [    1.795458] /backlight: could not get #pwm-cells for /ocp/epwmss@48440=
000/ecap@48440100
> [    1.795477] pwm-backlight backlight: unable to request PWM, trying leg=
acy API
> [    1.800110] omapdss_dss 58000000.dss: master bind failed: -517
> [    1.806346] panel-dpi display: failed to find video source
> [    1.821847] Serial: 8250/16550 driver, 10 ports, IRQ sharing enabled
> [    1.848210] 4806a000.serial: ttyS0 at MMIO 0x4806a000 (irq =3D 299, ba=
se_baud =3D 3000000) is a 8250
> [    1.853565] console [ttyS2] disabled
> [    1.854035] 48020000.serial: ttyS2 at MMIO 0x48020000 (irq =3D 300, ba=
se_baud =3D 3000000) is a 8250
> [    2.965394] console [ttyS2] enabled
> [    2.973374] 48066000.serial: ttyS4 at MMIO 0x48066000 (irq =3D 301, ba=
se_baud =3D 3000000) is a 8250
> [    2.986626] 48068000.serial: ttyS5 at MMIO 0x48068000 (irq =3D 302, ba=
se_baud =3D 3000000) is a 8250
> [    3.000384] 48422000.serial: ttyS7 at MMIO 0x48422000 (irq =3D 303, ba=
se_baud =3D 3000000) is a 8250
> [    3.013605] 4ae2b000.serial: ttyS9 at MMIO 0x4ae2b000 (irq =3D 304, ba=
se_baud =3D 3000000) is a 8250
> [    3.026632] [drm] Initialized drm 1.1.0 20060810
> [    3.103462] brd: module loaded
> [    3.151021] loop: module loaded
> [    3.159525] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    3.172198] at25 spi1.0: 512 Byte at25 eeprom, pagesize 1
> [    3.188330] tun: Universal TUN/TAP device driver, 1.6
> [    3.193405] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
> [    3.201240] CAN device driver interface
> [    3.210772] c_can_platform 4ae3c000.can: c_can_platform device registe=
red (regs=3Dfce3c000, irq=3D341)
> [    3.225505] c_can_platform 48480000.can: c_can_platform device registe=
red (regs=3Dfa480000, irq=3D342)
> [    3.238981] PPP generic driver version 2.4.2
> [    3.244434] PPP BSD Compression module registered
> [    3.249187] PPP Deflate Compression module registered
> [    3.254695] PPP MPPE Compression module registered
> [    3.259547] NET: Registered protocol family 24
> [    3.264690] usbcore: registered new interface driver smsc95xx
> [    3.270803] usbcore: registered new interface driver qmi_wwan
> [    3.277704] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    3.284389] ehci-pci: EHCI PCI platform driver
> [    3.289200] ehci-omap: OMAP-EHCI Host Controller driver
> [    3.295529] usbcore: registered new interface driver cdc_wdm
> [    3.302065] usbcore: registered new interface driver usbserial
> [    3.308334] usbcore: registered new interface driver qcserial
> [    3.314618] usbserial: USB Serial support registered for Qualcomm USB =
modem
> [    3.323973] mousedev: PS/2 mouse device common for all mice
> [    3.329788] -->tsc2013_init
> [    3.332590] tsc2013_init-->i2c_add_driver
> [    3.337138] i2c /dev entries driver
> [    3.352518] Bluetooth: HCI UART driver ver 2.3
> [    3.357047] Bluetooth: HCI UART protocol H4 registered
> [    3.362208] Bluetooth: HCI UART protocol BCSP registered
> [    3.368215] Bluetooth: HCI UART protocol LL registered
> [    3.373374] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [    3.382555] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [    3.387973] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [    3.394498] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [    3.400879] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [    3.407481] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [    3.413863] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [    3.420286] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [    3.456350] omap_hsmmc 480b4000.mmc: no pinctrl state for sdr25 mode
> [    3.462734] omap_hsmmc 480b4000.mmc: no pinctrl state for sdr12 mode
> [    3.469165] omap_hsmmc 480b4000.mmc: no pinctrl state for ddr_1_8v mode
> [    3.475857] omap_hsmmc 480b4000.mmc: no pinctrl state for hs mode
> [    3.481977] omap_hsmmc 480b4000.mmc: no pinctrl state for hs200_1_8v m=
ode
> [    3.489643] reg-fixed-voltage fixedregulator-vdd_3v3: Failed to resolv=
e vin-supply for vdd_3v3
> [    3.526145] omap_hsmmc 480d1000.mmc: no pinctrl state for sdr25 mode
> [    3.532526] omap_hsmmc 480d1000.mmc: no pinctrl state for sdr12 mode
> [    3.538958] omap_hsmmc 480d1000.mmc: no pinctrl state for hs mode
> [    3.575535] ledtrig-cpu: registered to indicate activity on CPUs
> [    3.582291] omap-aes 4b500000.aes: OMAP AES hw accel rev: 3.3
> [    3.667156] omap-aes 4b700000.aes: OMAP AES hw accel rev: 3.3
> [    3.674107] omap-des 480a5000.des: OMAP DES hw accel rev: 2.2
> [    3.681648] alg: skcipher: setkey failed on test 5 for ecb-des-omap: f=
lags=3D100
> [    3.696058] alg: skcipher-ddst: setkey failed on test 5 for ecb-des-om=
ap: flags=3D100
> [    3.704989] alg: skcipher-ddst: setkey failed on test 5 for ecb-des-om=
ap: flags=3D100
> [    3.728606] omap-sham 4b101000.sham: hw accel on OMAP rev 4.3
> [    3.793636] oprofile: using timer interrupt.
> [    3.799578] Initializing XFRM netlink socket
> [    3.803978] NET: Registered protocol family 17
> [    3.808625] NET: Registered protocol family 15
> [    3.813109] can: controller area network core (rev 20120528 abi 9)
> [    3.820289] NET: Registered protocol family 29
> [    3.824861] can: raw protocol (rev 20120528)
> [    3.829208] can: broadcast manager protocol (rev 20120528 t)
> [    3.835006] can: netlink gateway (rev 20130117) max_hops=3D1
> [    3.842195] Bluetooth: RFCOMM TTY layer initialized
> [    3.847368] Bluetooth: RFCOMM socket layer initialized
> [    3.852572] Bluetooth: RFCOMM ver 1.11
> [    3.856447] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    3.861782] Bluetooth: BNEP filters: protocol multicast
> [    3.867254] Bluetooth: BNEP socket layer initialized
> [    3.872261] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> [    3.878289] Bluetooth: HIDP socket layer initialized
> [    3.884126] Key type dns_resolver registered
> [    3.888790] omap_voltage_late_init: Voltage driver support not added
> [    3.896341] Adding alias for supply vdd,cpu0 -> vdd,4a003b20.voltdm
> [    3.902651] Adding alias for supply vbb,cpu0 -> vbb,4a003b20.voltdm
> [    3.909095] omap_voltdm 4a003b20.voltdm: Unable to get vdd regulator:-=
517
> [    3.915996] cpu cpu0: of_pm_voltdm_notifier_register: Failed to get cp=
u0 regulator/voltdm: -517
> [    3.924942] cpu cpu0: cpu0 clock notifier not ready, retry
> [    3.931380] Power Management for TI OMAP4+ devices.
> [    3.936791] ThumbEE CPU extension supported.
> [    3.941133] Registering SWP/SWPB emulation handler
> [    3.949669] kmemleak: Kernel memory leak detector initialized
> [    3.949687] kmemleak: Automatic memory scanning thread started
> [    3.965040] dmm 4e000000.dmm: workaround for errata i878 in use
> [    3.973595] dmm 4e000000.dmm: initialized all PAT entries
> [    4.006585] bq32k 0-0068: rtc core: registered bq32k as rtc0
> [    4.014138] palmas 0-0058: Irq flag is 0x00000007
> [    4.026026] palmas 0-0058: Muxing GPIO 2f, PWM 0, LED 0
> [    4.096789] omap_i2c 48070000.i2c: bus 0 rev0.12 at 400 kHz
> [    4.107535] omap_i2c 48060000.i2c: bus 2 rev0.12 at 400 kHz
> [    4.135922] tmp102 3-0048: initialized
> [    4.140842] -->tsc2013_probe
> [    4.143802] tsc2013 3-004b: GPIO not specified in DT (of_get_gpio retu=
rned -2)
> [    4.151101] tsc2013_probe-->tsc2013_hw_init
> [    4.155314] -->tsc2013_hw_init
> [    4.158689] tsc2013_probe-->tsc2013_sw_init
> [    4.163051] tsc2013_i2c_write_register : CFG[62] =3D 0xa58c
> [    4.168648] tsc2013_i2c_write_register : CFG[6a] =3D 0x0
> [    4.173966] tsc2013_i2c_write_register : CFG[72] =3D 0xb81c
> [    4.181082] input: tsc2013_ts as /devices/virtual/input/input0
> [    4.187117] omap_i2c 4807a000.i2c: bus 3 rev0.12 at 400 kHz
> [    4.194521] OMAP DSS rev 6.1
> [    4.197862] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_=
component_ops)
> [    4.207370] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [    4.212834] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [    4.219364] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [    4.225798] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [    4.232180] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [    4.238678] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [    4.245075] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [    4.252177] vdd_3v3: supplied by regen1
> [    4.287832] omap_hsmmc 480b4000.mmc: no pinctrl state for sdr25 mode
> [    4.294269] omap_hsmmc 480b4000.mmc: no pinctrl state for sdr12 mode
> [    4.300651] omap_hsmmc 480b4000.mmc: no pinctrl state for ddr_1_8v mode
> [    4.307344] omap_hsmmc 480b4000.mmc: no pinctrl state for hs mode
> [    4.313463] omap_hsmmc 480b4000.mmc: no pinctrl state for hs200_1_8v m=
ode
> [    4.356184] omap_hsmmc 480d1000.mmc: no pinctrl state for sdr25 mode
> [    4.362565] omap_hsmmc 480d1000.mmc: no pinctrl state for sdr12 mode
> [    4.368995] omap_hsmmc 480d1000.mmc: no pinctrl state for hs mode
> [    4.398393] mmc0: MAN_BKOPS_EN bit is not set
> [    4.403306] mmc0: new MMC card at address 0001
> [    4.410365] mmcblk0: mmc0:0001 MMC04G 3.60 GiB=20
> [    4.415599] mmcblk0boot0: mmc0:0001 MMC04G partition 1 16.0 MiB
> [    4.422204] mmcblk0boot1: mmc0:0001 MMC04G partition 2 16.0 MiB
> [    4.455001]  mmcblk0: p1 p2 p3
> [    4.494916] Adding alias for supply vdd,cpu0 -> vdd,4a003b20.voltdm
> [    4.501224] Adding alias for supply vbb,cpu0 -> vbb,4a003b20.voltdm
> [    4.512317] omap_hsmmc 480d1000.mmc: card claims to support voltages b=
elow defined range
> [    4.522454] Adding alias for supply vdd,cpu0 -> vdd,4a003b20.voltdm
> [    4.528832] Adding alias for supply vbb,cpu0 -> vbb,4a003b20.voltdm
> [    4.548042] mmc1: queuing unknown CIS tuple 0x91 (3 bytes)
> [    4.559911] mmc1: new SDIO card at address 0001
> [    4.569429] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    4.576103] [drm] No driver support for vblank timestamp query.
> [    4.589105] [drm] Enabling DMM ywrap scrolling
> [    4.635666] Console: switching to colour frame buffer device 60x34
> [    4.642779] omapdrm omapdrm.0: fb0: omapdrm frame buffer device
> [    4.648756] omapdrm omapdrm.0: registered panic notifier
> [    4.675019] omapwb-m2m: Device registered as video10
> [    4.680010] [drm] Initialized omapdrm 1.0.0 20110917 on minor 0
> [    4.686792] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [    4.691996] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [    4.698506] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [    4.704999] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [    4.711376] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [    4.717780] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [    4.724157] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [    4.756516] bq32k 0-0068: setting system clock to 2015-12-14 15:01:35 =
UTC (1450105295)
> [    4.816383] ldousb: disabling
> [    4.819662] wlan-en-regulator: disabling
> [    4.823602] pbias_mmc_omap5: disabling
> [    4.827733] ALSA device list:
> [    4.830708]   No soundcards found.
> [    4.843116] EXT4-fs (mmcblk0p2): INFO: recovery required on readonly f=
ilesystem
> [    4.850694] EXT4-fs (mmcblk0p2): write access will be enabled during r=
ecovery
> [    5.056067] EXT4-fs (mmcblk0p2): recovery complete
> [    5.066106] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data =
mode. Opts: (null)
> [    5.074659] VFS: Mounted root (ext4 filesystem) readonly on device 179=
:2.
> [    5.084335] devtmpfs: mounted
> [    5.088116] Freeing unused kernel memory: 1124K (c0ad3000 - c0bec000)
> [   96.882892] udevd[150]: starting version 182
> [   97.710406] omap-rproc 58820000.ipu: device does not have specific CMA=
 pool
> [   97.757451]  remoteproc0: releasing 58820000.ipu
> [   97.763149] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [   97.769959] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [   97.784648] omap-rproc 55020000.ipu: device does not have specific CMA=
 pool
> [   97.791649]  remoteproc0: releasing 55020000.ipu
> [   97.814304] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [   97.820696] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [   97.903014] omap-rproc 40800000.dsp: device does not have specific CMA=
 pool
> [   97.914259] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [   97.920648] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [   97.962632]  remoteproc0: releasing 40800000.dsp
> [   98.009400] omap-rproc 41000000.dsp: device does not have specific CMA=
 pool
> [   98.030444] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [   98.061817]  remoteproc0: releasing 41000000.dsp
> [   98.132692] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [   98.141378] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [   98.160694] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [   98.171518] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [   98.186897] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [   98.193284] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [   98.217447] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [   98.372373] omap_rng 48090000.rng: OMAP Random Number Generator ver. 20
> [   98.400753] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [   98.409733] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [   98.440704] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [   98.453306] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [   98.474793] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [   98.545089] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [   98.638128] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [   98.643385] vpe 489d0000.vpe: loading firmware vpdma-1b8.bin
> [   98.675264] vpe 489d0000.vpe: Device registered as /dev/video0
> [   98.831576] wl1271_sdio: probe of mmc1:0001:2 failed with error -12
> [   98.863080] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [   98.925726] omap_wdt: OMAP Watchdog Timer Rev 0x01: initial timeout 60=
 sec
> [   98.959680] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [   98.980071] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [   99.063419] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [   99.123476] (stk) :sysfs entries created
> [   99.158019] ahci 4a140000.sata: forcing PORTS_IMPL to 0x1
> [   99.193198] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [   99.234071] ahci 4a140000.sata: AHCI 0001.0300 32 slots 1 ports 3 Gbps=
 0x1 impl platform mode
> [   99.261873] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [   99.271798] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [   99.282445] ahci 4a140000.sata: flags: 64bit ncq sntf pm led clo only =
pmp pio slum part ccc apst=20
> [   99.343195] scsi host0: ahci
> [   99.350470] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [   99.374102] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [   99.382096] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [   99.394807] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [   99.399398] ata1: SATA max UDMA/133 mmio [mem 0x4a140000-0x4a1410ff] p=
ort 0x100 irq 338
> [   99.411119] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [   99.420030] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [   99.426463] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [   99.489453] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [   99.497511] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [   99.510878] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [   99.521889] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [   99.531925] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [   99.541803] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [   99.552430] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [   99.744246] ata1: SATA link down (SStatus 0 SControl 300)
> [  100.627365] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  100.632606] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  100.641115] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  100.648379] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  100.654838] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  100.661218] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  100.669209] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [  100.768194] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> [  100.773909] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned=
 bus number 1
> [  100.782810] xhci-hcd xhci-hcd.0.auto: hcc params 0x0220f04c hci versio=
n 0x100 quirks 0x00210010
> [  100.791786] xhci-hcd xhci-hcd.0.auto: irq 424, io mem 0x48890000
> [  100.798762] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
> [  100.805592] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [  100.812840] usb usb1: Product: xHCI Host Controller
> [  100.817874] usb usb1: Manufacturer: Linux 4.1.13-gf0f52afb60 xhci-hcd
> [  100.824347] usb usb1: SerialNumber: xhci-hcd.0.auto
> [  100.832347] hub 1-0:1.0: USB hub found
> [  100.836342] hub 1-0:1.0: 1 port detected
> [  100.842531] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  100.848231] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  100.854718] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  100.854841] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
> [  100.854899] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned=
 bus number 2
> [  100.855212] usb usb2: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
> [  100.855829] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003
> [  100.855832] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [  100.855836] usb usb2: Product: xHCI Host Controller
> [  100.855839] usb usb2: Manufacturer: Linux 4.1.13-gf0f52afb60 xhci-hcd
> [  100.855842] usb usb2: SerialNumber: xhci-hcd.0.auto
> [  100.866046] hub 2-0:1.0: USB hub found
> [  100.866159] hub 2-0:1.0: 1 port detected
> [  100.921271] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  100.928263] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  100.935207] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  100.943377] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [  100.977379] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  100.982765] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  100.990218] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  100.998631] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  101.005101] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  101.011485] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  101.017925] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [  101.046723] cryptodev: driver 1.6 loaded.
> [  101.093742] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=3Dordered
> [  101.154318] usb 1-1: new high-speed USB device number 2 using xhci-hcd
> [  101.184343] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
> [  101.205476] usb 2-1: New USB device found, idVendor=3D0451, idProduct=
=3D8140
> [  101.212210] usb 2-1: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D0
> [  101.256299] hub 2-1:1.0: USB hub found
> [  101.271184] hub 2-1:1.0: 4 ports detected
> [  101.290355] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  101.295711] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  101.302182] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  101.309922] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  101.318162] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  101.321923] random: dd urandom read with 73 bits of entropy available
> [  101.331720] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  101.338829] usb 1-1: New USB device found, idVendor=3D0451, idProduct=
=3D8142
> [  101.345847] usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D1
> [  101.348282] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [  101.359217] usb 1-1: SerialNumber: EE03006139CE
> [  101.400466] hub 1-1:1.0: USB hub found
> [  101.404631] hub 1-1:1.0: 4 ports detected
> [  101.438859] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  101.444127] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  101.459257] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  101.465698] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  101.472083] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  101.481299] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  101.488418] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [  101.714281] usb 1-1.4: new high-speed USB device number 3 using xhci-h=
cd
> [  101.837598] usb 1-1.4: config 1 has an invalid interface number: 8 but=
 max is 5
> [  101.847760] usb 1-1.4: config 1 has an invalid interface number: 10 bu=
t max is 5
> [  101.855215] usb 1-1.4: config 1 has an invalid interface number: 11 bu=
t max is 5
> [  101.862642] usb 1-1.4: config 1 has no interface number 1
> [  101.869021] usb 1-1.4: config 1 has no interface number 4
> [  101.876706] usb 1-1.4: config 1 has no interface number 5
> [  101.883857] usb 1-1.4: New USB device found, idVendor=3D1199, idProduc=
t=3D68c0
> [  101.890920] usb 1-1.4: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [  101.898268] usb 1-1.4: Product: MC7354
> [  101.902030] usb 1-1.4: Manufacturer: Sierra Wireless, Incorporated
> [  101.979627] qmi_wwan 1-1.4:1.8: cdc-wdm0: USB WDM device
> [  101.993482] qmi_wwan 1-1.4:1.8 wwan0: register 'qmi_wwan' at usb-xhci-=
hcd.0.auto-1.4, WWAN/QMI device, 22:dd:dc:e7:4e:5c
> [  102.010093] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  102.016811] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  102.023277] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  102.035938] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  102.042347] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  102.049196] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  102.051833] qmi_wwan 1-1.4:1.10: cdc-wdm1: USB WDM device
> [  102.055160] qmi_wwan 1-1.4:1.10 wwan1: register 'qmi_wwan' at usb-xhci=
-hcd.0.auto-1.4, WWAN/QMI device, 22:dd:dc:e7:4e:5c
> [  102.073371] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode
> [  102.106774] omap_hsmmc 4809c000.mmc: Got CD GPIO
> [  102.111875] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr104 mode
> [  102.118388] omap_hsmmc 4809c000.mmc: no pinctrl state for ddr50 mode
> [  102.125458] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr50 mode
> [  102.134688] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr25 mode
> [  102.143040] omap_hsmmc 4809c000.mmc: no pinctrl state for sdr12 mode
> [  102.149464] omap_hsmmc 4809c000.mmc: no pinctrl state for hs mode

> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


