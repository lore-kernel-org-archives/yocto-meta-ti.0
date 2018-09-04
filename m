Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B517E009E7; Tue,  4 Sep 2018 14:51:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 646B2E009CF
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2018 14:51:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84LpNTG051673;
	Tue, 4 Sep 2018 16:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536097883;
	bh=ZjHyos8QJ8YgMpWWIgaYOhoizjQeuz6zifPhyZFjlqI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=N/UlXQ/THejmwcs4S0sEst1gurccQpgxhpYJzesMjKFIosaAfedk9VqZxV69U8RMF
	qVzg8uQCKS2b56SGMddsy0DM1JhIcpV13xJ/HVUbOw7gZqL4RvVwSZPKFAismlSyIS
	ViO7COrYQ8d/pbxlF3QtXw0VXNrykl9Z7UgOQ8SI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84LpNRR019553;
	Tue, 4 Sep 2018 16:51:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 16:51:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 4 Sep 2018 16:51:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84LpN5h026786;
	Tue, 4 Sep 2018 16:51:23 -0500
Date: Tue, 4 Sep 2018 17:49:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Patkar, Sarvesh S." <sarvesh.patkar@thermofisher.com>
Message-ID: <20180904214948.GE13472@beryl>
References: <BN6PR07MB3585011B103A75E5F1964AF3E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
	<20180831024139.GN11110@beryl>
	<BN6PR07MB35851F8B59EB14B18FC5FBC6E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
	<20180831222931.GC2362@beryl> <20180831223037.GD2362@beryl>
	<BN6PR07MB3585873B8C28FD9EDCB136DAE4030@BN6PR07MB3585.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR07MB3585873B8C28FD9EDCB136DAE4030@BN6PR07MB3585.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black: cannot access USB MSC devices
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
X-List-Received-Date: Tue, 04 Sep 2018 21:51:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sarvesh,

I see your image doens't use systemd - I wonder if you have proper udev/mdev 
support configured...

Anyway, try these suggestions:

https://sourceforge.net/p/libusb/mailman/message/29231433/


On Tue, Sep 04, 2018 at 09:20:52PM +0000, Patkar, Sarvesh S. wrote:
> Hi Denys,
> 
> Thanks for the help.
> 
> The lsusb -v told me that lsusb could not find usbfs. The log messages also 
> did not have usb related messages. So, I regenerated the images after using 
> 'bitbake virtual/kernel -c menuconfig' to add USB MSC support. I checked the 
> log and lsusb -v. I still see the same error.
> 
> I have added the log and the lsusb -v below. Do you have any more 
> suggestions on what I can do?
> 
> Thanks, 
> Sarvesh
> 
> 
> root@beaglebone:~# cat /var/log/boot
> Tue Sep  4 19:25:32 2018: hwclock: can't open '/dev/misc/rtc': No such file or directory
> Tue Sep  4 19:25:32 2018: Tue Sep  4 19:25:32 UTC 2018
> Tue Sep  4 19:25:32 2018: hwclock: can't open '/dev/misc/rtc': No such file or directory
> Tue Sep  4 19:25:32 2018: ALSA: Restoring mixer settings...
> Tue Sep  4 19:25:32 2018: /usr/sbin/alsactl: load_state:1735: No soundcards found...
> Tue Sep  4 19:25:32 2018: INIT: Entering runlevel: 5
> Tue Sep  4 19:25:32 2018: Configuring network interfaces... udhcpc: started, v1.27.2
> Tue Sep  4 19:25:33 2018: udhcpc: sending discover
> Tue Sep  4 19:25:36 2018: udhcpc: sending discover
> Tue Sep  4 19:25:39 2018: udhcpc: sending discover
> Tue Sep  4 19:25:42 2018: udhcpc: no lease, forking to background
> Tue Sep  4 19:25:42 2018: done.
> Tue Sep  4 19:25:42 2018: Starting system message bus: dbus.
> Tue Sep  4 19:25:42 2018: Starting OpenBSD Secure Shell server: sshd
> Tue Sep  4 19:25:43 2018: done.
> Tue Sep  4 19:25:43 2018: Starting rpcbind daemon...done.
> Tue Sep  4 19:25:43 2018: Starting advanced power management daemon: No APM support in kernel
> Tue Sep  4 19:25:43 2018: (failed.)
> Tue Sep  4 19:25:43 2018: Starting bluetooth: bluetoothd.
> Tue Sep  4 19:25:43 2018: hwclock: can't open '/dev/misc/rtc': No such file or directory
> Tue Sep  4 19:25:43 2018: Starting syslogd/klogd: done
> Tue Sep  4 19:25:43 2018:  * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
> Tue Sep  4 19:25:43 2018: ^[[A^[[74G[ ok ]
> Tue Sep  4 19:25:43 2018: Starting Telephony daemon
> Tue Sep  4 19:25:43 2018: Starting Linux NFC daemon
> root@beaglebone:~# cat /var/log/dmesg
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.14.54-g0b59bc3be7 (oe-user@oe-host) (gcc version 7.3.0 (GCC)) #1 PREEMPT Tue Sep 4 17:52:19 UTC 2018
> [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> [    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] efi: Getting EFI parameters from FDT:
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Reserved 48 MiB at 0x9d000000
> [    0.000000] On node 0 totalpages: 131072
> [    0.000000] free_area_init_node: node 0, pgdat c0e5757c, node_mem_map dcb61000
> [    0.000000]   Normal zone: 1152 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 131072 pages, LIFO batch:31
> [    0.000000] CPU: All CPU(s) started in SVC mode.
> [    0.000000] AM335X ES2.1 (sgx neon)
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129920
> [    0.000000] Kernel command line: console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait rw
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.000000] Memory: 455848K/524288K available (9216K kernel code, 359K rwdata, 2804K rodata, 1024K init, 283K bss, 19288K reserved, 49152K cma-reserved, 0K highmem)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000]  Tasks RCU enabled.
> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> [    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts
> [    0.000000] OMAP clockevent source: timer2 at 24000000 Hz
> [    0.000016] sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
> [    0.000034] clocksource: timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
> [    0.000044] OMAP clocksource: timer1 at 24000000 Hz
> [    0.000199] timer_probe: no matching timers found
> [    0.000389] Console: colour dummy device 80x30
> [    0.000433] Calibrating delay loop... 996.14 BogoMIPS (lpj=4980736)
> [    0.089222] pid_max: default: 32768 minimum: 301
> [    0.089392] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.089406] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.090106] CPU: Testing write buffer coherency: ok
> [    0.090741] Setting up static identity map for 0x80100000 - 0x80100060
> [    0.090870] Hierarchical SRCU implementation.
> [    0.091140] EFI services will not be available.
> [    0.092304] devtmpfs: initialized
> [    0.098958] random: get_random_u32 called from bucket_table_alloc+0x8c/0x1ac with crng_init=0
> [    0.099489] VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 3
> [    0.099777] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.099798] futex hash table entries: 256 (order: -1, 3072 bytes)
> [    0.103118] pinctrl core: initialized pinctrl subsystem
> [    0.103780] DMI not present or invalid.
> [    0.104153] NET: Registered protocol family 16
> [    0.106170] DMA: preallocated 256 KiB pool for atomic coherent allocations
> [    0.118658] omap_hwmod: debugss: _wait_target_disable failed
> [    0.170824] cpuidle: using governor ladder
> [    0.170858] cpuidle: using governor menu
> [    0.174491] gpio gpiochip0: (gpio): added GPIO chardev (254:0)
> [    0.174572] gpiochip_setup_dev: registered GPIOs 0 to 31 on device: gpiochip0 (gpio)
> [    0.174629] OMAP GPIO hardware version 0.1
> [    0.175345] gpio gpiochip1: (gpio): added GPIO chardev (254:1)
> [    0.175420] gpiochip_setup_dev: registered GPIOs 32 to 63 on device: gpiochip1 (gpio)
> [    0.176072] gpio gpiochip2: (gpio): added GPIO chardev (254:2)
> [    0.176139] gpiochip_setup_dev: registered GPIOs 64 to 95 on device: gpiochip2 (gpio)
> [    0.176751] gpio gpiochip3: (gpio): added GPIO chardev (254:3)
> [    0.176836] gpiochip_setup_dev: registered GPIOs 96 to 127 on device: gpiochip3 (gpio)
> [    0.183397] No ATAGs?
> [    0.183415] hw-breakpoint: debug architecture 0x4 unsupported.
> [    0.195968] edma 49000000.edma: TI EDMA DMA engine driver
> [    0.196463] of_get_named_gpiod_flags: can't parse 'gpio' property of node '/fixedregulator0[0]'
> [    0.198684] SCSI subsystem initialized
> [    0.198924] usbcore: registered new interface driver usbfs
> [    0.198971] usbcore: registered new interface driver hub
> [    0.199133] usbcore: registered new device driver usb
> [    0.199571] omap_i2c 44e0b000.i2c: could not find pctldev for node /ocp/l4_wkup@44c00000/scm@210000/pinmux@800/pinmux_i2c0_pins, deferring probe
> [    0.199625] omap_i2c 4819c000.i2c: could not find pctldev for node /ocp/l4_wkup@44c00000/scm@210000/pinmux@800/pinmux_i2c2_pins, deferring probe
> [    0.199748] media: Linux media interface: v0.10
> [    0.199786] Linux video capture interface: v2.00
> [    0.199881] pps_core: LinuxPPS API ver. 1 registered
> [    0.199888] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.199908] PTP clock support registered
> [    0.199946] EDAC MC: Ver: 3.0.0
> [    0.200344] dmi: Firmware registration failed.
> [    0.200736] omap-mailbox 480c8000.mailbox: omap mailbox rev 0x400
> [    0.201226] Advanced Linux Sound Architecture Driver Initialized.
> [    0.202239] clocksource: Switched to clocksource timer1
> [    0.209001] NET: Registered protocol family 2
> [    0.209876] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.209923] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.209961] TCP: Hash tables configured (established 4096 bind 4096)
> [    0.210052] UDP hash table entries: 256 (order: 0, 4096 bytes)
> [    0.210069] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> [    0.210214] NET: Registered protocol family 1
> [    0.210593] RPC: Registered named UNIX socket transport module.
> [    0.210606] RPC: Registered udp transport module.
> [    0.210612] RPC: Registered tcp transport module.
> [    0.210618] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.210631] PCI: CLS 0 bytes, default 64
> [    0.211249] hw perfevents: no interrupt-affinity property for /pmu, guessing.
> [    0.211369] hw perfevents: enabled with armv7_cortex_a8 PMU driver, 5 counters available
> [    0.212865] workingset: timestamp_bits=14 max_order=17 bucket_order=3
> [    0.216556] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.217253] NFS: Registering the id_resolver key type
> [    0.217296] Key type id_resolver registered
> [    0.217303] Key type id_legacy registered
> [    0.217342] ntfs: driver 2.1.32 [Flags: R/O].
> [    0.219237] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> [    0.219257] io scheduler noop registered
> [    0.219264] io scheduler deadline registered
> [    0.219458] io scheduler cfq registered (default)
> [    0.219468] io scheduler mq-deadline registered
> [    0.219475] io scheduler kyber registered
> [    0.220701] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 size 568
> [    0.222942] of_get_named_gpiod_flags: parsed 'enable-gpios' property of node '/clk_mcasp0[0]' - status (0)
> [    0.264595] Serial: 8250/16550 driver, 10 ports, IRQ sharing disabled
> [    0.267306] console [ttyS0] disabled
> [    0.267396] 44e09000.serial: ttyS0 at MMIO 0x44e09000 (irq = 30, base_baud = 3000000) is a 8250
> [    0.898167] console [ttyS0] enabled
> [    0.903378] omap_rng 48310000.rng: Random Number Generator ver. 20
> [    0.920180] brd: module loaded
> [    0.929057] loop: module loaded
> [    0.932721] rdac: device handler registered
> [    0.937110] hp_sw: device handler registered
> [    0.941401] emc: device handler registered
> [    0.945719] alua: device handler registered
> [    0.949925] st: Version 20160209, fixed bufsize 32768, s/g segs 256
> [    0.956324] osst :I: Tape driver with OnStream support version 0.99.4
> [    0.969736] SCSI Media Changer driver v0.25
> [    0.975563] mdio_bus fixed-0: GPIO lookup for consumer reset
> [    0.975574] mdio_bus fixed-0: using lookup tables for GPIO lookup
> [    0.975582] mdio_bus fixed-0: lookup for GPIO reset failed
> [    0.975602] libphy: Fixed MDIO Bus: probed
> [    0.980575] cnic: QLogic cnicDriver v2.5.22 (July 20, 2015)
> [    1.000831] mdio_bus 4a101000.mdio: GPIO lookup for consumer reset
> [    1.000843] mdio_bus 4a101000.mdio: using lookup tables for GPIO lookup
> [    1.000851] mdio_bus 4a101000.mdio: lookup for GPIO reset failed
> [    1.052314] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6, bus freq 1000000
> [    1.060015] davinci_mdio 4a101000.mdio: detected phy mask fffffffe
> [    1.067353] libphy: 4a101000.mdio: probed
> [    1.071393] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00, driver SMSC LAN8710/LAN8720
> [    1.081487] cpsw 4a100000.ethernet: Detected MACID = c8:fd:19:c5:e4:b1
> [    1.088276] cpsw 4a100000.ethernet: initialized cpsw ale version 1.4
> [    1.094747] cpsw 4a100000.ethernet: ALE Table size 1024
> [    1.100035] cpsw 4a100000.ethernet: cpts: overflow check period 500 (jiffies)
> [    1.108533] usbcore: registered new interface driver cdc_acm
> [    1.114335] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
> [    1.122459] usbcore: registered new interface driver usblp
> [    1.127995] usbcore: registered new interface driver cdc_wdm
> [    1.133723] usbcore: registered new interface driver usbtmc
> [    1.139343] usbcore: registered new interface driver uas
> [    1.144731] usbcore: registered new interface driver usb-storage
> [    1.150789] usbcore: registered new interface driver ums-alauda
> [    1.156773] usbcore: registered new interface driver ums-cypress
> [    1.162843] usbcore: registered new interface driver ums-datafab
> [    1.168896] usbcore: registered new interface driver ums_eneub6250
> [    1.175273] usbcore: registered new interface driver ums-freecom
> [    1.181334] usbcore: registered new interface driver ums-isd200
> [    1.187330] usbcore: registered new interface driver ums-jumpshot
> [    1.193485] usbcore: registered new interface driver ums-karma
> [    1.199364] usbcore: registered new interface driver ums-onetouch
> [    1.205539] usbcore: registered new interface driver ums-realtek
> [    1.211598] usbcore: registered new interface driver ums-sddr09
> [    1.217582] usbcore: registered new interface driver ums-sddr55
> [    1.223564] usbcore: registered new interface driver ums-usbat
> [    1.229500] usbcore: registered new interface driver usbserial
> [    1.235656] usbcore: registered new interface driver chaoskey
> [    1.241460] usbcore: registered new interface driver lvs
> [    1.247064] i2c /dev entries driver
> [    1.250878] IR NEC protocol handler initialized
> [    1.255470] IR RC5(x/sz) protocol handler initialized
> [    1.260540] IR RC6 protocol handler initialized
> [    1.265097] IR JVC protocol handler initialized
> [    1.269643] IR Sony protocol handler initialized
> [    1.274287] IR SANYO protocol handler initialized
> [    1.279007] IR Sharp protocol handler initialized
> [    1.283737] IR MCE Keyboard/mouse protocol handler initialized
> [    1.289591] IR XMP protocol handler initialized
> [    1.295540] cpuidle: enable-method property 'ti,am3352' found operations
> [    1.302660] sdhci: Secure Digital Host Controller Interface driver
> [    1.308868] sdhci: Copyright(c) Pierre Ossman
> [    1.313689] omap_hsmmc 48060000.mmc: GPIO lookup for consumer cd
> [    1.313698] omap_hsmmc 48060000.mmc: using device tree for GPIO lookup
> [    1.313728] of_get_named_gpiod_flags: parsed 'cd-gpios' property of node '/ocp/mmc@48060000[0]' - status (0)
> [    1.313801] omap_hsmmc 48060000.mmc: Got CD GPIO
> [    1.318447] omap_hsmmc 48060000.mmc: GPIO lookup for consumer wp
> [    1.318452] omap_hsmmc 48060000.mmc: using device tree for GPIO lookup
> [    1.318462] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of node '/ocp/mmc@48060000[0]'
> [    1.318470] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of node '/ocp/mmc@48060000[0]'
> [    1.318476] omap_hsmmc 48060000.mmc: using lookup tables for GPIO lookup
> [    1.318484] omap_hsmmc 48060000.mmc: lookup for GPIO wp failed
> [    1.373035] omap_hsmmc 481d8000.mmc: GPIO lookup for consumer cd
> [    1.373047] omap_hsmmc 481d8000.mmc: using device tree for GPIO lookup
> [    1.373060] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of node '/ocp/mmc@481d8000[0]'
> [    1.373068] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of node '/ocp/mmc@481d8000[0]'
> [    1.373075] omap_hsmmc 481d8000.mmc: using lookup tables for GPIO lookup
> [    1.373082] omap_hsmmc 481d8000.mmc: lookup for GPIO cd failed
> [    1.373090] omap_hsmmc 481d8000.mmc: GPIO lookup for consumer wp
> [    1.373095] omap_hsmmc 481d8000.mmc: using device tree for GPIO lookup
> [    1.373103] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of node '/ocp/mmc@481d8000[0]'
> [    1.373110] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of node '/ocp/mmc@481d8000[0]'
> [    1.373115] omap_hsmmc 481d8000.mmc: using lookup tables for GPIO lookup
> [    1.373121] omap_hsmmc 481d8000.mmc: lookup for GPIO wp failed
> [    1.419813] mmc0: host does not support reading read-only switch, assuming write-enable
> [    1.429912] mmc0: new high speed SDHC card at address 59b4
> [    1.435675] sdhci-pltfm: SDHCI platform and OF driver helper
> [    1.436305] of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/led2[0]' - status (0)
> [    1.436317] no flags found for gpios
> [    1.436453] of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/led3[0]' - status (0)
> [    1.436459] no flags found for gpios
> [    1.436560] of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/led4[0]' - status (0)
> [    1.436565] no flags found for gpios
> [    1.436646] of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/led5[0]' - status (0)
> [    1.436651] no flags found for gpios
> [    1.437015] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.446318] NET: Registered protocol family 10
> [    1.447432] Segment Routing with IPv6
> [    1.447498] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    1.448080] NET: Registered protocol family 17
> [    1.448342] Key type dns_resolver registered
> [    1.448479] omap_voltage_late_init: Voltage driver support not added
> [    1.489072] mmcblk0: mmc0:59b4 AF UD 7.49 GiB
> [    1.495341]  mmcblk0: p1 p2
> [    1.535634] random: fast init done
> [    1.545382] tps65217 0-0024: TPS65217 ID 0xe version 1.2
> [    1.555037] mmc1: new high speed MMC card at address 0001
> [    1.560970] mmcblk1: mmc1:0001 M62704 3.56 GiB
> [    1.565753] mmcblk1boot0: mmc1:0001 M62704 partition 1 2.00 MiB
> [    1.571829] mmcblk1boot1: mmc1:0001 M62704 partition 2 2.00 MiB
> [    1.577919] mmcblk1rpmb: mmc1:0001 M62704 partition 3 512 KiB
> [    1.585135]  mmcblk1: p1
> [    1.694587] tda998x 0-0070: found TDA19988
> [    1.699877] tilcdc 4830e000.lcdc: bound 0-0070 (ops tda998x_ops)
> [    1.705975] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.712630] [drm] No driver support for vblank timestamp query.
> [    1.718986] [drm] Cannot find any crtc or sizes
> [    1.724095] [drm] Initialized tilcdc 1.0.0 20121205 for 4830e000.lcdc on minor 0
> [    1.731638] omap_i2c 44e0b000.i2c: bus 0 rev0.11 at 400 kHz
> [    1.739084] omap_i2c 4819c000.i2c: bus 2 rev0.11 at 100 kHz
> [    1.746835] hctosys: unable to open rtc device (rtc0)
> [    1.752530] ALSA device list:
> [    1.755518]   No soundcards found.
> [    2.802950] [drm] Cannot find any crtc or sizes
> [    5.107947] EXT4-fs (mmcblk0p2): recovery complete
> [    5.120571] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
> [    5.128888] VFS: Mounted root (ext4 filesystem) on device 179:2.
> [    5.137012] devtmpfs: mounted
> [    5.141834] Freeing unused kernel memory: 1024K
> [    5.849852] udevd[86]: starting version 3.2.5
> [    5.873152] random: udevd: uninitialized urandom read (16 bytes read)
> [    5.879956] random: udevd: uninitialized urandom read (16 bytes read)
> [    5.886944] random: udevd: uninitialized urandom read (16 bytes read)
> [    5.965177] udevd[87]: starting eudev-3.2.5
> [    7.366913] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
> root@beaglebone:~# export LIBUSB_DEBUG=9
> root@beaglebone:~# lsusb -v
> libusb: debug [libusb_init] created default context
> libusb: debug [libusb_init] libusb v1.0.21.11156
> libusb: error [op_init] could not find usbfs
> unable to initialize libusb: -99
> root@beaglebone:~#
> 
> 
> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com] 
> Sent: Friday, August 31, 2018 3:31 PM
> To: Patkar, Sarvesh S. <sarvesh.patkar@thermofisher.com>
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] BeagleBone Black: cannot access USB MSC devices
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Sorry, hit send too early.
> 
> Also try this:
> 
> # export LIBUSB_DEBUG=9
> # lsusb -v
> 
> And see what the error message is.
> 
> 
> On Fri, Aug 31, 2018 at 06:29:31PM -0400, Denys Dmytriyenko wrote:
> > Do you have a complete boot log?
> >
> >
> > On Fri, Aug 31, 2018 at 05:55:53PM +0000, Patkar, Sarvesh S. wrote:
> > > Hi Denys,
> > >
> > > Thank you for the quick reply.
> > >
> > > I tried the core-image-base. I see the following on the console.
> > >
> > > root@beaglebone:~# lsusb
> > > unable to initialize libusb: -99
> > >
> > > fdisk doesn't list the USB device as well.
> > >
> > > Is there anything else that I can try?
> > >
> > > Thanks,
> > > Sarvesh
> > >
> > > -----Original Message-----
> > > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > > Sent: Thursday, August 30, 2018 7:42 PM
> > > To: Patkar, Sarvesh S. <sarvesh.patkar@thermofisher.com>
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] BeagleBone Black: cannot access USB MSC 
> > > devices
> > >
> > >
> > > Please don't use core-image-minimal (e.g. core-image-base is much better), if you want to get anything useful out of it, besides just booting, including such tools as fdisk, lsusb, etc. Thanks.
> > >
> > >
> > > On Fri, Aug 31, 2018 at 02:16:09AM +0000, Patkar, Sarvesh S. wrote:
> > > > Hi,
> > > >
> > > > I am a beginner in Yocto and still learning to configure the 
> > > > images generated.
> > > >
> > > > I am trying to use USB devices with the BeagleBone Black (Rev C) .
> > > > Specifically, I want to access a Mass Storage Class Device (a USB 
> > > > Flash
> > > > Drive) from the BeagleBone Black. I used the meta, meta-poky and 
> > > > meta-ti layers to build a core-image-minimal image for beaglebone 
> > > > machine. On booting up with the image, I do not see any obvious 
> > > > errors. However, it cannot detect the presence of a USB Device 
> > > > connected to it. I checked this using fdisk -l. lsusb command is not found.
> > > >
> > > > I went through an old email chain
> > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctopr
> > > > ojec 
> > > > t.org_pipermail_linux-2Dyocto_2014-2DJune_002787.html&d=DwIBAg&c=q
> > > > 6k2D 
> > > > sTcEGCcCb_WtVSz6hhIl8hvYssy7sH8ZwfbbKU&r=kLMtB9EeaG0D8_vJ7xCDnkGx5
> > > > TX9d 
> > > > c8pLS0HaMWl2-A&m=ZnXiBdSvO_0jYV33nEuRQrF7tLzUs8TgUM7hBC6IchQ&s=nMX
> > > > UhOH LBBgCs7EOynlKAfyBNTlmCSJFY8uJm1C3cAY&e=
> > > > to find if there was a solution. One of the things mentioned was 
> > > > to use menuconfig to configure the kernel for built-in USB 
> > > > support. But, I am not sure if the .config file is being picked up by bitbake.
> > > >
> > > > How do I enable USB support for MSC devices on BeagleBone Black?
> > > >
> > > > poky branch= sumo-19.0.0
> > > > meta-ti branch= ti2018.02
> > > >
> > > > Thanks for the help!
> > > > Sarvesh
> > > >
> > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoprojec
> > t.org_listinfo_meta-2Dti&d=DwIBAg&c=q6k2DsTcEGCcCb_WtVSz6hhIl8hvYssy7s
> > H8ZwfbbKU&r=kLMtB9EeaG0D8_vJ7xCDnkGx5TX9dc8pLS0HaMWl2-A&m=zlR3RTtZRsDM
> > Qj6IaI0QfriGiJxLedMXLq1WoUazNvY&s=mhwcg0M7OSw-PaHKnJmqI29WCUJXPoDo-Koz
> > IIO_fh0&e=

