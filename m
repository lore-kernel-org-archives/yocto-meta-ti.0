Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7076EE0122C
	for <meta-ti@yoctoproject.org>; Sun, 10 Jun 2012 01:08:08 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from linux-8cfk.localnet ([188.36.52.128]:46473)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S8DC7> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Sun, 10 Jun 2012 11:03:49 +0200
From: =?ISO-8859-1?Q?K=F6vesdi_Gy=F6rgy?= <kgy@teledigit.eu>
To: meta-ti@yoctoproject.org
Date: Sun, 10 Jun 2012 10:11:13 +0200
Message-ID: <1436825.pJSfqhDWtg@linux-8cfk>
Organization: NNG
User-Agent: KMail/4.7.2 (Linux/3.1.9-1.4-desktop; KDE/4.7.2; i686; ; )
MIME-Version: 1.0
Subject: crash with SGX drivers on 3.x kernels
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
X-List-Received-Date: Sun, 10 Jun 2012 08:08:09 -0000
X-Groupsio-MsgNum: 1242
Content-Type: multipart/mixed; boundary="nextPart1411246.vkUoUixFoR"
Content-Transfer-Encoding: 7Bit

--nextPart1411246.vkUoUixFoR
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I have a Beagleboard-C4, trying to run 3.x kernels with TI SGX drivers.
I tried a lot of 3.x versions (from 3.0.8 to 3.2.18) with similar results.
Currently i use Angstrom distro, but also tried Guacamayo with the same result.

All of the 3.x kernel versions lead to crash when trying to start any 3D
applications. I had two kind of crashes: usually it just freezes without any
error message (even on the serial port) and in some cases a kernel crash dump
is printed. Such a dump is attached. The crash can be reproduced in 100%.
The dump contains a backtrace with debug info: i hope it can help to solve this
problem. I executed some 'ps' commands until the crash, in the hope it gives some
more info.

I tried to set the video memory size from 12 to 36 Mb, no change.

The TI SGX driver is working fine with 2.6.32 and 2.6.39 kernels.

Thanks in advance
Gyorgy Kovesdi

--nextPart1411246.vkUoUixFoR
Content-Disposition: attachment; filename="glx+3.2.16.log"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-log; charset="UTF-8"; name="glx+3.2.16.log"

40

Texas Instruments X-Loader 1.5.0 (Jun  7 2012 - 12:33:05)
Beagle Rev C4
Reading boot sector
Loading u-boot.bin from mmc


U-Boot 2011.06-dirty (Jun 07 2012 - 12:20:17)

OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 mHz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  256 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Beagle Rev C4
timed out in wait_for_pin: I2C_STAT=0
I2C read: I/O error
Unrecognized expansion board: 0
Die ID #30b6000400000000040373050e00400e
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  1  0 
SD/MMC found on device 0
reading uEnv.txt

0 bytes read
Loaded environment from uEnv.txt
Importing environment from mmc ...
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
4344952 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-3.2.16
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4344888 Bytes = 4.1 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.2.16 (kgy@linux-8cfk) (gcc version 4.6.4 20120303 (prerelease) (GCC) ) #1 Thu Jun 7 11:27:05 CEST 2012
[    0.000000] CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
[    0.000000] Machine: OMAP3 Beagle Board
[    0.000000] Beagle expansionboard: unknown
[    0.000000] Reserving 37748736 bytes SDRAM for VRAM
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] OMAP3430/3530 ES3.1 (l2cache iva sgx neon isp )
[    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/500 MHz
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 54272
[    0.000000] Kernel command line: console=ttyO2,115200n8 mpurate=720 buddy=unknown camera=lbcm3m1 vram=36M omapfb.mode=dvi:800x480MR-16@60 omapfb.vram=0:12M,1:12M,2:12M omapdss.def_disp=dvi root=/dev/mmcblk0p2 rw rootfstype=ext3 rootwait
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] allocated 1048576 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
[    0.000000] Memory: 214MB = 214MB total
[    0.000000] Memory: 207040k/207040k available, 55104k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xf8000000   ( 632 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc073487c   (7347 kB)
[    0.000000]       .init : 0xc0735000 - 0xc077b000   ( 280 kB)
[    0.000000]       .data : 0xc077c000 - 0xc07d6650   ( 362 kB)
[    0.000000]        .bss : 0xc07d6674 - 0xc0893710   ( 757 kB)
[    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:410 nr_irqs:410 410
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 4.0) with 96 interrupts
[    0.000000] Total of 96 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: GPTIMER12 at 32768 Hz
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps every 131071999ms
[    0.000000] Console: colour dummy device 80x30
[    0.000183] Calibrating delay loop... 515.72 BogoMIPS (lpj=2015232)
[    0.040588] pid_max: default: 32768 minimum: 301
[    0.040863] Security Framework initialized
[    0.040924] AppArmor: AppArmor initialized
[    0.041198] Mount-cache hash table entries: 512
[    0.041748] Initializing cgroup subsys cpuacct
[    0.041809] Initializing cgroup subsys memory
[    0.041870] Initializing cgroup subsys devices
[    0.041870] Initializing cgroup subsys freezer
[    0.041900] Initializing cgroup subsys blkio
[    0.041931] Initializing cgroup subsys perf_event
[    0.042053] CPU: Testing write buffer coherency: ok
[    0.043731] devtmpfs: initialized
[    0.048309] print_constraints: dummy: 
[    0.048645] NET: Registered protocol family 16
[    0.048980] GPMC revision 5.0
[    0.050872] OMAP GPIO hardware version 2.5
[    0.052673] omap_mux_init: Add partition: #1: core, flags: 0
[    0.054199] OMAP3 Beagle Rev: C4
[    0.058013] Reprogramming SDRC clock to 332000000 Hz
[    0.060485] Found NAND on CS0
[    0.060485] Registering NAND on CS0
[    0.060882] Unable to get DVI reset GPIO
[    0.061065] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.066070]  omap-mcbsp.2: alias fck already exists
[    0.066314]  omap-mcbsp.3: alias fck already exists
[    0.067810] Calibrating delay loop (skipped) already calibrated this CPU
[    0.067932] Switched to new clocking rate (Crystal/Core/MPU): 26.0/332/720 MHz
[    0.068115] OMAP DMA hardware revision 4.0
[    0.074737] bio: create slab <bio-0> at 0
[    0.075958] SCSI subsystem initialized
[    0.077148] usbcore: registered new interface driver usbfs
[    0.077301] usbcore: registered new interface driver hub
[    0.077484] usbcore: registered new device driver usb
[    0.089294] omap_i2c omap_i2c.1: bus 1 rev1.3.12 at 2600 kHz
[    0.091674] twl4030: PIH (irq 7) chaining IRQs 368..375
[    0.091796] twl4030: power (irq 373) chaining IRQs 376..383
[    0.092285] twl4030: gpio (irq 368) chaining IRQs 384..401
[    0.092620] _omap_mux_init_gpio: Could not set gpio192
[    0.095306] print_constraints: VUSB1V5: 1500 mV normal standby
[    0.095703] print_constraints: VUSB1V8: 1800 mV normal standby
[    0.096069] print_constraints: VUSB3V1: 3100 mV normal standby
[    0.113922] twl4030_usb twl4030_usb: Initialized TWL4030 USB module
[    0.114654] print_constraints: VMMC1: 1850 <--> 3150 mV at 3000 mV normal standby
[    0.115051] print_constraints: VDAC: 1800 mV normal standby
[    0.115417] print_constraints: VAUX2_4030: 1800 mV normal 
[    0.115814] print_constraints: VDVI: 1800 mV normal standby
[    0.116271] print_constraints: VSIM: 1800 <--> 3000 mV at 1800 mV normal standby
[    0.116577] omap_i2c omap_i2c.2: bus 2 rev1.3.12 at 400 kHz
[    0.129760] omap_i2c omap_i2c.3: bus 3 rev1.3.12 at 100 kHz
[    0.130859] NetLabel: Initializing
[    0.130859] NetLabel:  domain hash size = 128
[    0.130889] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.130920] NetLabel:  unlabeled traffic allowed by default
[    0.130981] Switching to clocksource 32k_counter
[    0.145812] AppArmor: AppArmor Filesystem Enabled
[    0.157867] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
[    0.169677] musb-hdrc musb-hdrc: USB OTG mode controller at fa0ab000 using DMA, IRQ 92
[    0.170013] NET: Registered protocol family 2
[    0.170410] IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.171142] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
[    0.171295] TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
[    0.171386] TCP: Hash tables configured (established 8192 bind 8192)
[    0.171417] TCP reno registered
[    0.171417] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.171447] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.171752] NET: Registered protocol family 1
[    0.172180] RPC: Registered named UNIX socket transport module.
[    0.172180] RPC: Registered udp transport module.
[    0.172210] RPC: Registered tcp transport module.
[    0.172210] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.172485] omap_dsp_init: 600000 bytes @ 8d600000
[    0.174194] audit: initializing netlink socket (disabled)
[    0.174224] type=2000 audit(0.164:1): initialized
[    0.348236] VFS: Disk quotas dquot_6.5.2
[    0.348541] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.351837] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.351898] fuse init (API version 7.17)
[    0.353698] Btrfs loaded
[    0.353729] msgmni has been set to 404
[    0.355346] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.355468] io scheduler noop registered
[    0.355468] io scheduler deadline registered
[    0.355529] io scheduler cfq registered (default)
[    0.356414] OMAP DSS rev 2.0
[    0.359222] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.360412] omap_uart.0: ttyO0 at MMIO 0x4806a000 (irq = 72) is a OMAP UART0
[    0.360656] omap_uart.1: ttyO1 at MMIO 0x4806c000 (irq = 73) is a OMAP UART1
[    0.360931] omap_uart.2: ttyO2 at MMIO 0x49020000 (irq = 74) is a OMAP UART2
[    1.083984] console [ttyO2] enabled
[    1.088287] [drm] Initialized drm 1.1.0 20060810
[    1.100463] brd: module loaded
[    1.107452] loop: module loaded
[    1.114044] twl4030_madc twl4030_madc: clk disabled, enabling
[    1.121887] omap2-nand driver initializing
[    1.126617] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron NAND 256MiB 1,8V 16-bit)
[    1.135742] Creating 5 MTD partitions on "omap2-nand.0":
[    1.141387] 0x000000000000-0x000000080000 : "X-Loader"
[    1.148376] 0x000000080000-0x000000260000 : "U-Boot"
[    1.155364] 0x000000260000-0x000000280000 : "U-Boot Env"
[    1.161987] 0x000000280000-0x000000680000 : "Kernel"
[    1.169494] 0x000000680000-0x000010000000 : "File System"
[    1.251251] OneNAND driver initializing
[    1.255889] usbcore: registered new interface driver cdc_ether
[    1.262145] usbcore: registered new interface driver rndis_host
[    1.268463] cdc_ncm: 04-Aug-2011
[    1.271881] usbcore: registered new interface driver cdc_ncm
[    1.278228] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.295593] ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
[    3.301879] ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 1
[    3.309844] ehci-omap ehci-omap.0: irq 77, io mem 0x48064800
[    3.327026] ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
[    3.333099] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    3.340332] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.347991] usb usb1: Product: OMAP-EHCI Host Controller
[    3.353637] usb usb1: Manufacturer: Linux 3.2.16 ehci_hcd
[    3.359405] usb usb1: SerialNumber: ehci-omap.0
[    3.364746] hub 1-0:1.0: USB hub found
[    3.368804] hub 1-0:1.0: 3 ports detected
[    3.397796] Initializing USB Mass Storage driver...
[    3.403015] usbcore: registered new interface driver usb-storage
[    3.409393] USB Mass Storage support registered.
[    3.414398] usbcore: registered new interface driver libusual
[    3.420654] udc: OMAP UDC driver, version: 4 October 2004 (iso) (dma)
[    3.427825] mousedev: PS/2 mouse device common for all mice
[    3.436218] input: twl4030_pwrbutton as /devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl4030_pwrbutton/input/input0
[    3.448028] i2c /dev entries driver
[    3.452331] Linux media interface: v0.10
[    3.456573] lirc_dev: IR Remote Control driver registered, major 249 
[    3.463409] Driver for 1-wire Dallas network protocol.
[    3.469665] OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
[    3.476867] twl4030_wdt twl4030_wdt: Failed to register misc device
[    3.483520] twl4030_wdt: probe of twl4030_wdt failed with error -16
[    3.491210] device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: dm-devel@redhat.com
[    3.500549] cpuidle: using governor ladder
[    3.504821] cpuidle: using governor menu
[    3.509094] sdhci: Secure Digital Host Controller Interface driver
[    3.515686] sdhci: Copyright(c) Pierre Ossman
[    3.696014] usb 1-2: new high-speed USB device number 2 using ehci-omap
[    3.745086] omap_hsmmc: probe of omap_hsmmc.1 failed with error -16
[    3.753143] oprofile: hardware counters not available
[    3.758575] oprofile: using timer interrupt.
[    3.764038] TCP cubic registered
[    3.768737] NET: Registered protocol family 10
[    3.775695] NET: Registered protocol family 17
[    3.780670] Registering the dns_resolver key type
[    3.785644] VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 1
[    3.793792] ThumbEE CPU extension supported.
[    3.798370] Registering SWP/SWPB emulation handler
[    3.809600] sr_init: No PMIC hook to init smartreflex
[    3.815216] smartreflex smartreflex.0: omap_sr_probe: SmartReflex driver initialized
[    3.823638] smartreflex smartreflex.1: omap_sr_probe: SmartReflex driver initialized
[    3.831939] SmartReflex Class3 initialized
[    3.841735] clock: disabling unused clocks to save power
[    3.848937] registered taskstats version 1
[    3.853576] fbcvt: 800x480@60: CVT Name - .384M9-R
[    3.901367] usb 1-2: New USB device found, idVendor=05e3, idProduct=0608
[    3.908508] usb 1-2: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    3.916107] usb 1-2: Product: USB2.0 Hub
[    3.921539] hub 1-2:1.0: USB hub found
[    3.926055] hub 1-2:1.0: 4 ports detected
[    4.033843] Console: switching to colour frame buffer device 100x30
[    4.050048] regulator_init_complete: VDAC: incomplete constraints, leaving on
[    4.057708] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    4.065277] Waiting for root device /dev/mmcblk0p2...
[    4.257995] usb 1-2.1: new full-speed USB device number 3 using ehci-omap
[    4.279632] mmc0: new high speed SDHC card at address b368
[    4.286224] mmcblk0: mmc0:b368 SD08G 7.41 GiB 
[    4.293395]  mmcblk0: p1 p2
[    4.395874] usb 1-2.1: New USB device found, idVendor=054c, idProduct=0066
[    4.403228] usb 1-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    4.411041] usb 1-2.1: Product: Gavrio USB Burner
[    4.416076] usb 1-2.1: Manufacturer: Teledigit BT.
[    4.421203] usb 1-2.1: SerialNumber: 00000002
[   12.834014] kjournald starting.  Commit interval 5 seconds
[   13.345642] EXT3-fs (mmcblk0p2): using internal journal
[   13.351226] EXT3-fs (mmcblk0p2): recovery complete
[   13.358673] EXT3-fs (mmcblk0p2): mounted filesystem with ordered data mode
[   13.365997] VFS: Mounted root (ext3 filesystem) on device 179:2.
[   13.374298] devtmpfs: mounted
[   13.378112] Freeing init memory: 280K
INIT: version 2.88 booting
Starting udev
[   13.956329] udev[64]: starting version 164
[   14.312225] input: gpio-keys as /devices/platform/gpio-keys/input/input1
[   14.515045] usb 1-2.2: new high-speed USB device number 4 using ehci-omap
[   14.644561] usb 1-2.2: New USB device found, idVendor=9710, idProduct=7830
[   14.651916] usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   14.659729] usb 1-2.2: Product: USB-MAC Controller   
[   14.665161] usb 1-2.2: Manufacturer: Moschip Semiconductor
[   14.671020] usb 1-2.2: SerialNumber: 3b2003b2
[   14.874420] usb 1-2.3: new high-speed USB device number 5 using ehci-omap
[   15.008605] usb 1-2.3: New USB device found, idVendor=05e3, idProduct=0608
[   15.015991] usb 1-2.3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[   15.023773] usb 1-2.3: Product: USB2.0 Hub
[   15.049804] hub 1-2.3:1.0: USB hub found
[   15.057434] hub 1-2.3:1.0: 4 ports detected
[   15.155517] usb 1-2.4: new high-speed USB device number 6 using ehci-omap
[   15.282104] usb 1-2.4: New USB device found, idVendor=19d2, idProduct=1179
[   15.289459] usb 1-2.4: New USB device strings: Mfr=2, Product=1, SerialNumber=3
[   15.297241] usb 1-2.4: Product: K3772-Z
[   15.301269] usb 1-2.4: Manufacturer: Vodafone
[   15.305938] usb 1-2.4: SerialNumber: 1296BFEFEA4FA1C362D155E0D6CB284DC6F70C79
[   15.342895] scsi0 : usb-storage 1-2.4:1.0
[   15.364410] twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc0
[   15.436859] usb 1-2.3.1: new high-speed USB device number 7 using ehci-omap
[   15.568420] OMAP3 Beagle/Devkit8000 SoC init
[   15.577453] usb 1-2.3.1: New USB device found, idVendor=1516, idProduct=8628
[   15.584991] usb 1-2.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   15.592987] usb 1-2.3.1: Product: USB Drive
[   15.597351] usb 1-2.3.1: Manufacturer: SKYMEDI
[   15.602111] usb 1-2.3.1: SerialNumber: 08
[   15.644226] scsi1 : usb-storage 1-2.3.1:1.0
[   15.733489] usb 1-2.3.2: new low-speed USB device number 8 using ehci-omap
[   15.780731] asoc: twl4030-hifi <-> omap-mcbsp-dai.1 mapping ok
[   15.877136] usb 1-2.3.2: New USB device found, idVendor=04f2, idProduct=0402
[   15.884674] usb 1-2.3.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   15.892669] usb 1-2.3.2: Product: USB Keyboard
[   15.897460] usb 1-2.3.2: Manufacturer: Chicony
[   15.998962] omap_i2c omap_i2c.2: controller timed out
[   16.004364] rtc-ds1307: probe of 2-0068 failed with error -5
[   16.012207] usb 1-2.3.3: new low-speed USB device number 9 using ehci-omap
[   16.152801] usb 1-2.3.3: New USB device found, idVendor=1c4f, idProduct=0003
[   16.160369] usb 1-2.3.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   16.168365] usb 1-2.3.3: Product: Usb Mouse
[   16.172882] usb 1-2.3.3: Manufacturer: SIGMACHIP
[   16.280700] usb 1-2.3.4: new high-speed USB device number 10 using ehci-omap
[   16.351562] scsi 0:0:0:0: CD-ROM            Vodafone USB SCSI CD-ROM  0001 PQ: 0 ANSI: 0
[   16.374969] sr0: scsi3-mmc drive: 0x/0x caddy
[   16.379516] cdrom: Uniform CD-ROM driver Revision: 3.20
[   16.398895] sr 0:0:0:0: Attached scsi generic sg0 type 5
[   16.431457] usb 1-2.3.4: New USB device found, idVendor=148f, idProduct=5370
[   16.439056] usb 1-2.3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   16.447082] usb 1-2.3.4: Product: 802.11 n WLAN
[   16.451965] usb 1-2.3.4: Manufacturer: TPlink
[   16.456512] usb 1-2.3.4: SerialNumber: 1.0
[   16.554962] usbcore: registered new interface driver usbserial
[   16.561126] USB Serial support registered for generic
[   16.566864] usbcore: registered new interface driver usbserial_generic
[   16.573852] usbserial: USB Serial Driver core
[   16.654327] scsi 1:0:0:0: Direct-Access     SKYMEDI  USB Drive        1.0  PQ: 0 ANSI: 2
[   16.676086] sd 1:0:0:0: [sda] 15769600 512-byte logical blocks: (8.07 GB/7.51 GiB)
[   16.686309] sd 1:0:0:0: Attached scsi generic sg1 type 0
[   16.700500] sd 1:0:0:0: [sda] Write Protect is off
[   16.710998] sd 1:0:0:0: [sda] No Caching mode page present
[   16.716735] sd 1:0:0:0: [sda] Assuming drive cache: write through
[   16.741027] sd 1:0:0:0: [sda] No Caching mode page present
[   16.746734] sd 1:0:0:0: [sda] Assuming drive cache: write through
[   16.856811]  sda: sda1
[   16.869354] sd 1:0:0:0: [sda] No Caching mode page present
[   16.875274] sd 1:0:0:0: [sda] Assuming drive cache: write through
[   16.881805] sd 1:0:0:0: [sda] Attached SCSI removable disk
[   17.495239] USB Serial support registered for Handspring Visor / Palm OS
[   17.502471] USB Serial support registered for Sony Clie 3.5
[   17.508666] USB Serial support registered for Sony Clie 5.0
[   18.104827] visor 1-2.1:1.0: Handspring Visor / Palm OS converter detected
[   18.214233] usbcore: registered new interface driver uas
[   18.254943] usb 1-2.2: applying rev.C fixup
[   18.287994] usb 1-2.1: Handspring Visor / Palm OS converter now attached to ttyUSB0
[   18.313110] usb 1-2.1: Handspring Visor / Palm OS converter now attached to ttyUSB1
[   18.321472] usbcore: registered new interface driver visor
[   18.327362] visor: USB HandSpring Visor / Palm OS driver
[   18.368041] input: Chicony USB Keyboard as /devices/platform/usbhs-omap.0/ehci-omap.0/usb1/1-2/1-2.3/1-2.3.2/1-2.3.2:1.0/input/input2
[   18.382446] usb 1-2.2: applying rev.C fixup
[   18.397674] generic-usb 0003:04F2:0402.0001: input,hidraw0: USB HID v1.11 Keyboard [Chicony USB Keyboard] on usb-ehci-omap.0-2.3.2/input0
[   18.447113] MOSCHIP usb-ethernet driver 1-2.2:1.0: eth0: register 'MOSCHIP usb-ethernet driver' at usb-ehci-omap.0-2.2, MOSCHIP 7830/7832/7730 usb-NET adapter, 00:13:3b:20:03:b2
[   18.464019] usbcore: registered new interface driver MOSCHIP usb-ethernet driver
[   18.623107] input: Chicony USB Keyboard as /devices/platform/usbhs-omap.0/ehci-omap.0/usb1/1-2/1-2.3/1-2.3.2/1-2.3.2:1.1/input/input3
[   18.641235] generic-usb 0003:04F2:0402.0002: input,hiddev0,hidraw1: USB HID v1.11 Device [Chicony USB Keyboard] on usb-ehci-omap.0-2.3.2/input1
[   18.659790] input: SIGMACHIP Usb Mouse as /devices/platform/usbhs-omap.0/ehci-omap.0/usb1/1-2/1-2.3/1-2.3.3/1-2.3.3:1.0/input/input4
[   18.726470] generic-usb 0003:1C4F:0003.0003: input,hidraw2: USB HID v1.10 Mouse [SIGMACHIP Usb Mouse] on usb-ehci-omap.0-2.3.3/input0
[   18.739257] usbcore: registered new interface driver usbhid
[   18.745208] usbhid: USB HID core driver
[   19.078216] cfg80211: Calling CRDA to update world regulatory domain
[   19.250030] sr0: CDROM (ioctl) error, command: Get event status notification 4a 01 00 00 10 00 00 00 08 00
[   19.260314] sr: Sense Key : Hardware Error [current] 
[   19.265808] sr: Add. Sense: No additional sense information
[   19.444946] usb 1-2.3.4: reset high-speed USB device number 10 using ehci-omap
[   19.679565] usbcore: registered new interface driver rt2800usb
[   19.836273] sr0: CDROM (ioctl) error, command: Xpwrite, Read disk info 51 00 00 00 00 00 00 00 02 00
[   19.846038] sr: Sense Key : Hardware Error [current] 
[   19.851501] sr: Add. Sense: No additional sense information
[   20.738555] MINIX-fs: blocksize too small for device
[   22.031127] MINIX-fs: blocksize too small for device
[   22.417663] Bluetooth: Core ver 2.16
[   22.421630] NET: Registered protocol family 31
[   22.426269] Bluetooth: HCI device and connection manager initialized
[   22.433197] Bluetooth: HCI socket layer initialized
[   22.438415] Bluetooth: L2CAP socket layer initialized
[   22.443725] Bluetooth: SCO socket layer initialized
[   22.455566] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[   22.517028] NET: Registered protocol family 23
[   22.529479] IrCOMM protocol (Dag Brattli)
[   22.590789] Bluetooth: RFCOMM TTY layer initialized
[   22.596069] Bluetooth: RFCOMM socket layer initialized
[   22.601593] Bluetooth: RFCOMM ver 1.11
Starting Bootlog daemon: bootlogd: cannot allocate pseudo tty: No such file or directory
bootlogd.
ALSA: Restoring mixer settings...
Configuring network interfaces... ALSA lib conf.c:3314:(snd_config_hooks_call) Cannot open shared library libasound_module_conf_pulse.so
ALSA lib control.c:951:(snd_ctl_open_noupdate) Invalid CTL hw:0
/usr/sbin/alsactl: set_controls:1485: snd_ctl_open error: No such file or directory
Found hardware: "omap3beagle" "" "" "" ""
Hardware is initialized using a generic method
done.
Starting portmap daemon...
INIT: Entering runlevel: 5
Starting system message bus: dbus.
Starting Connection Manager
Starting Dropbear SSH server: dropbear.
Starting advanced power manageme[   32.079284] ip_tables: (C) 2000-2006 Netfilter Core Team
nt daemon: No APM support in kernel
(failed.)
[   32.129852] nf_conntrack version 0.5.0 (3239 buckets, 12956 max)
Starting syslogd/klogd: done
 * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
   ...done.
Starting PVR
Starting session DBus ... pid=811
Starting Pulse Audio server
Starting Rygel
Starting MEX
Stopping Bootlog daemon: bootlogd.

Guacamayo 0.3 beagleboard ttyO2

beagleboard login: root
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2452 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  813 root      3092 S    sudo -b -E -u rygel -g rygel /usr/bin/pulseaudio -D --exit-idle-time=-1
  815 rygel     7916 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  816 rygel     9532 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    32332 S    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  827 rygel    32168 S    /usr/libexec/gstreamer-0.10/gst-plugin-scanner -l
  828 rygel     7916 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  829 rygel    92504 R    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  833 rygel    32168 S    /usr/libexec/gstreamer-0.10/gst-plugin-scanner -l
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  904 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2452 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel     9664 R    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    32460 S    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  827 rygel    41896 R    /usr/libexec/gstreamer-0.10/gst-plugin-scanner -l
  829 rygel    92500 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  833 rygel    41896 R    /usr/libexec/gstreamer-0.10/gst-plugin-scanner -l
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  911 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    63116 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92500 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  919 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  920 rygel    18744 R    /usr/libexec/tracker-store
  921 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    63248 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    70332 R    /usr/libexec/tracker-store
  928 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    63248 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    70640 R    /usr/libexec/tracker-store
  929 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    63248 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    70972 R    /usr/libexec/tracker-store
  930 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    63248 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    71228 R    /usr/libexec/tracker-store
  931 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    73700 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    71356 R    /usr/libexec/tracker-store
  933 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    79368 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    71612 R    /usr/libexec/tracker-store
  934 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    79368 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    71740 R    /usr/libexec/tracker-store
  935 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /sbin/syslogd -n -O /var/log/messages
  743 root      2140 S    /sbin/klogd -n
  749 avahi     2936 S    avahi-daemon: running [beagleboard.local]
  750 avahi     2936 S    avahi-daemon: chroot helper
  776 root         0 SW<  [pvr_timer]
  802 root         0 SW<  [pvr_workqueue]
  811 rygel     2584 S    /usr/bin/dbus-daemon --fork --print-pid 4 --print-address 6 --session
  816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    74088 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    71868 R    /usr/libexec/tracker-store
  936 root      2316 R    ps w
root@beagleboard:~# ps w
  PID USER       VSZ STAT COMMAND
    1 root      1628 S    init [5]
    2 root         0 SW   [kthreadd]
    3 root         0 SW   [ksoftirqd/0]
    4 root         0 SW   [kworker/0:0]
    5 root         0 SW   [kworker/u:0]
    6 root         0 SW<  [cpuset]
    7 root         0 SW<  [khelper]
    8 root         0 SW   [kdevtmpfs]
    9 root         0 SW<  [netns]
   10 root         0 SW   [irq/72-serial i]
   11 root         0 SW   [irq/73-serial i]
   12 root         0 SW   [irq/74-serial i]
   13 root         0 SW   [sync_supers]
   14 root         0 SW   [bdi-default]
   15 root         0 SW<  [kintegrityd]
   16 root         0 SW<  [kblockd]
   17 root         0 SW<  [omap2_mcspi]
   18 root         0 SW   [khubd]
   19 root         0 SW   [irq/7-TWL4030-P]
   20 root         0 SW   [irq/378-twl4030]
   21 root         0 SW   [kworker/0:1]
   22 root         0 SW<  [rpciod]
   23 root         0 SW   [khungtaskd]
   24 root         0 SW   [kswapd0]
   25 root         0 SW   [fsnotify_mark]
   26 root         0 SW<  [nfsiod]
   27 root         0 SW<  [crypto]
   33 root         0 SW<  [kthrotld]
   34 root         0 SW   [mtdblock0]
   35 root         0 SW   [mtdblock1]
   36 root         0 SW   [mtdblock2]
   37 root         0 SW   [mtdblock3]
   38 root         0 SW   [mtdblock4]
   39 root         0 SW   [irq/376-twl4030]
   40 root         0 SW   [kworker/u:1]
   41 root         0 SW   [kworker/0:2]
   42 root         0 SW<  [devfreq_wq]
   43 root         0 SW   [mmcqd/0]
   44 root         0 SW   [flush-179:0]
   45 root         0 SW   [kjournald]
   64 root      2084 S <  /sbin/udevd -d
  119 root         0 SW   [irq/167-user]
  210 root         0 SW   [scsi_eh_0]
  212 root         0 SW   [usb-storage]
  214 root         0 SW   [irq/379-rtc0]
  231 root         0 SW   [scsi_eh_1]
  232 root         0 SW   [usb-storage]
  301 root      1964 S <  /sbin/udevd -d
  321 root      1964 S <  /sbin/udevd -d
  535 root         0 SW<  [cfg80211]
  556 root         0 SW   [kworker/u:2]
  607 root         0 SW   [kworker/0:3]
  634 root         0 SW<  [krfcommd]
  706 daemon    1676 S    /sbin/portmap
  720 messageb  2580 S    /usr/bin/dbus-daemon --system
  723 root      5192 S    /usr/sbin/connmand
  728 root      2264 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_host_key -p 22
  737 root      4456 S    /usr/sbin/wpa_supplicant -u
  741 root      2140 S    /[   50.255401] Unhandled fault: external abort on non-linefetch (0x1008) at 0xd0e80ca8
[   50.263427] Internal error: : 1008 [#1]
[   50.267395] Modules linked in: bufferclass_ti(O) omaplfb(O) pvrsrvkm(O) iptable_nat nf_nat nf_conntrack_ipv4 nf_conntrack nf_defrag_ipv4 ip_tables x_tables rfcomm ircomm_tty ircomm irda hidp bluetooth arc4 rt2800usb rt2800lib crc_ccitt rt2x00usb rt2x00lib mac80211 cfg80211 rfkill usbhid uas mcs7830 minix visor usbserial twl4030_madc_hwmon snd_soc_omap3beagle snd_soc_twl4030 snd_soc_omap rtc_twl rtc_ds1307 snd_soc_omap_mcbsp snd_soc_core regmap_spi snd_pcm snd_timer snd soundcore snd_page_alloc gpio_keys
[   50.314086] CPU: 0    Tainted: G           O  (3.2.16 #1)
[   50.319854] PC is at PollForValueKM+0x4c/0xbc [pvrsrvkm]
[   50.325439] LR is at PollForValueKM+0x34/0xbc [pvrsrvkm]
[   50.330993] pc : [<bf3e6998>]    lr : [<bf3e6980>]    psr: 80000013
[   50.330993] sp : cb9a3d48  ip : 000000a0  fp : 00000000
[   50.342956] r10: 00000064  r9 : 000f4240  r8 : 00000001
[   50.348388] r7 : f11d3dfc  r6 : 000000ff  r5 : d0e80ca8  r4 : 00000000
[   50.355194] r3 : 00000001  r2 : 000003e7  r1 : 000003e8  r0 : 00000000
[   50.361999] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   50.369445] Control: 10c5387d  Table: 8b910019  DAC: 00000015
[   50.375427] Process media-explorer (pid: 822, stack limit = 0xcb9a22f0)
[   50.382324] Stack: (0xcb9a3d48 to 0xcb9a4000)
[   50.386871] 3d40:                   00000001 00000000 000000ff cd2f0000 00000000 d0e37120
[   50.395416] 3d60: 00000000 ffffffff 00000000 00000001 00000000 bf3f21dc 00000064 00000000
[   50.403930] 3d80: cd2f0000 bf3f2360 00000000 cd2f0000 d0e37120 bf3ef694 cd2f0000 00000000
[   50.412475] 3da0: bf3fc8e4 cd2f0000 00000000 00000000 bf3fc8a4 bf3f25c8 c0789f7c 00000003
[   50.420989] 3dc0: c002289c c0021f80 c0021f6c c0025e18 bf3fc8ac bf3f68d8 bf3fc838 cc0f4500
[   50.429534] 3de0: 00000000 cc0f4500 00000000 bf3e270c cb9a3e20 bf3e26a0 00000000 bf3e925c
[   50.438049] 3e00: cc0f4500 cb9a3e20 00000000 00000000 00000000 00000000 bf3e2958 bf3e26a0
[   50.446563] 3e20: 00000000 00000000 00000000 00000000 ffffffff cd3873c0 00000001 cd2f0000
[   50.455108] 3e40: cb9a3e80 cb9a2000 cba46008 bf3f05f8 cd3873c0 00000001 cb9a3e80 cba46008
[   50.463653] 3e60: c9b3b680 cd3873c0 00000001 cba46038 cba46008 bf3eed64 00000000 00000000
[   50.472167] 3e80: 00000000 00000000 00000000 0f0ab000 00000000 00000000 00000000 00000000
[   50.480712] 3ea0: cba46000 cba47000 cb9b4bc0 bf3f58c8 0000005c cd3873c0 cba47000 cb9b4bc0
[   50.489227] 3ec0: cb9a3ef0 0000005c cba46000 cba47000 00000000 bf3f4f6c 00000336 be8e9e1c
[   50.497772] 3ee0: 00000003 00000003 00000000 bf3eea64 0000005c 0000001c be8e9e4c 00000054
[   50.506317] 3f00: be8e9ea0 00000008 00000001 cb9b4bc0 020e40fb be8e9e1c cc3fd180 c00eb218
[   50.514831] 3f20: c94eec7c 00000000 cc3170c0 800000cf 00000000 c027e438 400c8000 00000000
[   50.523376] 3f40: 400c9000 00000001 400c8000 c94eec60 c94eec80 c94eec7c cc3170c0 020e40fb
[   50.531890] 3f60: cc3170c0 cc3170c0 be8e9e1c c01c675c 00000003 00000000 cb9a2000 00000000
[   50.540435] 3f80: 00000000 c00eb2d4 00000003 00000001 4037e6a8 be8ea36c be8e9ea0 00000036
[   50.548950] 3fa0: c000d384 c000d200 4037e6a8 be8ea36c 00000003 c01c675c be8e9e1c 00000001
[   50.557495] 3fc0: 4037e6a8 be8ea36c be8e9ea0 00000036 be8ea368 00000000 be8e9f64 00000000
[   50.566009] 3fe0: be8ea754 be8e9e18 4005eab0 4e6d658c 40000010 00000003 5f736600 67616c66
[   50.574737] [<bf3e6998>] (PollForValueKM+0x4c/0xbc [pvrsrvkm]) from [<bf3f21dc>] (SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm])
[   50.586791] [<bf3f21dc>] (SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm]) from [<bf3f2360>] (SGXReset+0x17c/0x198 [pvrsrvkm])
[   50.598449] [<bf3f2360>] (SGXReset+0x17c/0x198 [pvrsrvkm]) from [<bf3ef694>] (SGXInitialise+0x48/0x110 [pvrsrvkm])
[   50.609405] [<bf3ef694>] (SGXInitialise+0x48/0x110 [pvrsrvkm]) from [<bf3f25c8>] (SGXPostPowerState+0x4c/0xa0 [pvrsrvkm])
[   50.620941] [<bf3f25c8>] (SGXPostPowerState+0x4c/0xa0 [pvrsrvkm]) from [<bf3e270c>] (PVRSRVDevicePostPowerStateKM_AnyVaCb+0x6c/0x84 [pvrsrvkm])
[   50.634490] [<bf3e270c>] (PVRSRVDevicePostPowerStateKM_AnyVaCb+0x6c/0x84 [pvrsrvkm]) from [<bf3e925c>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrsrvkm])
[   50.650177] [<bf3e925c>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrsrvkm]) from [<bf3e2958>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm])
[   50.665069] [<bf3e2958>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm]) from [<bf3f05f8>] (SGXScheduleCCBCommandKM+0x2c/0xa4 [pvrsrvkm])
[   50.678375] [<bf3f05f8>] (SGXScheduleCCBCommandKM+0x2c/0xa4 [pvrsrvkm]) from [<bf3eed64>] (SGXSubmitTransferKM+0x218/0x2a4 [pvrsrvkm])
[   50.691131] [<bf3eed64>] (SGXSubmitTransferKM+0x218/0x2a4 [pvrsrvkm]) from [<bf3f58c8>] (SGXSubmitTransferBW+0x154/0x160 [pvrsrvkm])
[   50.703735] [<bf3f58c8>] (SGXSubmitTransferBW+0x154/0x160 [pvrsrvkm]) from [<bf3f4f6c>] (BridgedDispatchKM+0xd8/0x130 [pvrsrvkm])
[   50.716033] [<bf3f4f6c>] (BridgedDispatchKM+0xd8/0x130 [pvrsrvkm]) from [<bf3eea64>] (PVRSRV_BridgeDispatchKM+0xc0/0xec [pvrsrvkm])
[   50.728454] [<bf3eea64>] (PVRSRV_BridgeDispatchKM+0xc0/0xec [pvrsrvkm]) from [<c00eb218>] (do_vfs_ioctl+0x47c/0x4ec)
[   50.739440] [<c00eb218>] (do_vfs_ioctl+0x47c/0x4ec) from [<c00eb2d4>] (sys_ioctl+0x4c/0x6c)
[   50.748168] [<c00eb2d4>] (sys_ioctl+0x4c/0x6c) from [<c000d200>] (ret_fast_syscall+0x0/0x30)
[   50.756988] Code: e58d0004 ea000012 e3a03000 e58d3000 (e5953000) 
sbin/syslogd -n [   50.763580] ------------[ cut here ]------------
[   50.769775] kernel BUG at arch/arm/mach-omap2/omap_l3_smx.c:186!
[   50.776031] Internal error: Oops - undefined instruction: 0 [#2]
[   50.782287] Modules linked in: bufferclass_ti(O) omaplfb(O) pvrsrvkm(O) iptable_nat nf_nat nf_conntrack_ipv4 nf_conntrack nf_defrag_ipv4 ip_tables x_tables rfcomm ircomm_tty ircomm irda hidp bluetooth arc4 rt2800usb rt2800lib crc_ccitt rt2x00usb rt2x00lib mac80211 cfg80211 rfkill usbhid uas mcs7830 minix visor usbserial twl4030_madc_hwmon snd_soc_omap3beagle snd_soc_twl4030 snd_soc_omap rtc_twl rtc_ds1307 snd_soc_omap_mcbsp snd_soc_core regmap_spi snd_pcm snd_timer snd soundcore snd_page_alloc gpio_keys
[   50.828948] CPU: 0    Tainted: G      D    O  (3.2.16 #1)
[   50.834564] PC is at omap3_l3_app_irq+0x40/0x11c
[   50.839416] LR is at handle_irq_event_percpu+0x7c/0x230
[   50.844848] pc : [<c0023588>]    lr : [<c0080f50>]    psr: 20000193
[   50.844848] sp : cb9a3ad0  ip : 00000000  fp : 00000000
[   50.856811] r10: 00000064  r9 : 00000000  r8 : 00001008
[   50.862274] r7 : 00800000  r6 : 00000004  r5 : 00000000  r4 : cd073a00
[   50.869079] r3 : 00800000  r2 : 00000000  r1 : cd073980  r0 : 00800000
[   50.875854] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   50.883392] Control: 10c5387d  Table: 8b910019  DAC: 00000015
[   50.889404] Process media-explorer (pid: 822, stack limit = 0xcb9a22f0)
[   50.896270] Stack: (0xcb9a3ad0 to 0xcb9a4000)
[   50.900817] 3ac0:                                     2cec6fb2 cd3180c0 00000000 00000000
[   50.909362] 3ae0: 0000004a cd073a00 0000000a fa200000 cd004600 c0080f50 00000003 c005fa04
[   50.917877] 3b00: d1612a77 0000000b d166c114 cd004600 cb9a3bf8 fa200000 cb9a3b8c 00001008
[   50.926422] 3b20: 000f4240 00000064 00000000 c008112c cd004600 c00831f0 0000000a c0080a20
[   50.934967] 3b40: 0000000a c000da94 c003f0a8 c003ebd0 20000113 c0511e34 00000000 7fffff80
[   50.943481] 3b60: c07f9180 00000000 00000002 00000000 cb9a2000 c07f9204 00001008 000f4240
[   50.951995] 3b80: 00000064 00000000 00000000 cb9a3ba0 c003f0a8 c003ebd0 20000113 ffffffff
[   50.960540] 3ba0: 00000000 00000008 c065c52f cd007080 0000000a fa200000 cb9a3c2c 0000005f
[   50.969055] 3bc0: 00000000 fa200000 cb9a3c2c 00001008 000f4240 00000064 00000000 c003f0a8
[   50.977600] 3be0: 00000000 c000da98 c0010434 c00391ec 60000113 c0511e34 00000000 c07d8838
[   50.986145] 3c00: 00001080 00000080 cb9a3d00 cb9a2000 cc1a7200 00000001 00001008 000f4240
[   50.994659] 3c20: 00000064 00000000 00000000 cb9a3c40 c0010434 c00391ec 60000113 ffffffff
[   51.003173] 3c40: cb9a22f0 0000000b 00001008 c0783574 d0e80ca8 cb9a3d00 00000001 c0008578
[   51.011718] 3c60: 00000000 cd280600 00000007 00000000 00000000 d0e80ca8 cb9a3cf8 cb9a3d24
[   51.020263] 3c80: 00200200 c04b5c48 00000005 cd2a1480 cb9a3d24 c04d03dc 00000002 cb959880
[   51.028808] 3ca0: cd265c00 c0a3b120 c0781d54 c087b5bc cd280600 cb9a3d24 cd2a5780 cd2a57c4
[   51.037322] 3cc0: cb9a3cf8 c07ce440 00000005 cd381200 c07a04f0 b30e97b5 0000000b 0000ee6c
[   51.045867] 3ce0: cb9a3d1c c002c834 00000001 bf3e6998 80000013 ffffffff cb9a3d34 c0511dd8
[   51.054382] 3d00: 00000000 000003e8 000003e7 00000001 00000000 d0e80ca8 000000ff f11d3dfc
[   51.062927] 3d20: 00000001 000f4240 00000064 00000000 000000a0 cb9a3d48 bf3e6980 bf3e6998
[   51.071441] 3d40: 80000013 ffffffff 00000001 00000000 000000ff cd2f0000 00000000 d0e37120
[   51.079986] 3d60: 00000000 ffffffff 00000000 00000001 00000000 bf3f21dc 00000064 00000000
[   51.088500] 3d80: cd2f0000 bf3f2360 00000000 cd2f0000 d0e37120 bf3ef694 cd2f0000 00000000
[   51.097045] 3da0: bf3fc8e4 cd2f0000 00000000 00000000 bf3fc8a4 bf3f25c8 c0789f7c 00000003
[   51.105560] 3dc0: c002289c c0021f80 c0021f6c c0025e18 bf3fc8ac bf3f68d8 bf3fc838 cc0f4500
[   51.114105] 3de0: 00000000 cc0f4500 00000000 bf3e270c cb9a3e20 bf3e26a0 00000000 bf3e925c
[   51.122619] 3e00: cc0f4500 cb9a3e20 00000000 00000000 00000000 00000000 bf3e2958 bf3e26a0
[   51.131164] 3e20: 00000000 00000000 00000000 00000000 ffffffff cd3873c0 00000001 cd2f0000
[   51.139678] 3e40: cb9a3e80 cb9a2000 cba46008 bf3f05f8 cd3873c0 00000001 cb9a3e80 cba46008
[   51.148223] 3e60: c9b3b680 cd3873c0 00000001 cba46038 cba46008 bf3eed64 00000000 00000000
[   51.156738] 3e80: 00000000 00000000 00000000 0f0ab000 00000000 00000000 00000000 00000000
[   51.165283] 3ea0: cba46000 cba47000 cb9b4bc0 bf3f58c8 0000005c cd3873c0 cba47000 cb9b4bc0
[   51.173828] 3ec0: cb9a3ef0 0000005c cba46000 cba47000 00000000 bf3f4f6c 00000336 be8e9e1c
[   51.182342] 3ee0: 00000003 00000003 00000000 bf3eea64 0000005c 0000001c be8e9e4c 00000054
[   51.190887] 3f00: be8e9ea0 00000008 00000001 cb9b4bc0 020e40fb be8e9e1c cc3fd180 c00eb218
[   51.199401] 3f20: c94eec7c 00000000 cc3170c0 800000cf 00000000 c027e438 400c8000 00000000
[   51.207946] 3f40: 400c9000 00000001 400c8000 c94eec60 c94eec80 c94eec7c cc3170c0 020e40fb
[   51.216461] 3f60: cc3170c0 cc3170c0 be8e9e1c c01c675c 00000003 00000000 cb9a2000 00000000
[   51.225006] 3f80: 00000000 c00eb2d4 00000003 00000001 4037e6a8 be8ea36c be8e9ea0 00000036
[   51.233520] 3fa0: c000d384 c000d200 4037e6a8 be8ea36c 00000003 c01c675c be8e9e1c 00000001
[   51.242065] 3fc0: 4037e6a8 be8ea36c be8e9ea0 00000036 be8ea368 00000000 be8e9f64 00000000
[   51.250610] 3fe0: be8ea754 be8e9e18 4005eab0 4e6d658c 40000010 00000003 5f736600 67616c66
[   51.259124] [<c0023588>] (omap3_l3_app_irq+0x40/0x11c) from [<c0080f50>] (handle_irq_event_percpu+0x7c/0x230)
[   51.269500] [<c0080f50>] (handle_irq_event_percpu+0x7c/0x230) from [<c008112c>] (handle_irq_event+0x28/0x38)
[   51.279754] [<c008112c>] (handle_irq_event+0x28/0x38) from [<c00831f0>] (handle_level_irq+0xac/0xbc)
[   51.289276] [<c00831f0>] (handle_level_irq+0xac/0xbc) from [<c0080a20>] (generic_handle_irq+0x20/0x30)
[   51.298980] [<c0080a20>] (generic_handle_irq+0x20/0x30) from [<c000da94>] (handle_IRQ+0x60/0x84)
[   51.308166] [<c000da94>] (handle_IRQ+0x60/0x84) from [<c0511e34>] (__irq_svc+0x34/0x80)
[   51.316528] [<c0511e34>] (__irq_svc+0x34/0x80) from [<c003ebd0>] (__do_softirq+0x48/0x1ec)
[   51.325134] [<c003ebd0>] (__do_softirq+0x48/0x1ec) from [<c003f0a8>] (irq_exit+0x40/0x90)
[   51.333679] [<c003f0a8>] (irq_exit+0x40/0x90) from [<c000da98>] (handle_IRQ+0x64/0x84)
[   51.341949] [<c000da98>] (handle_IRQ+0x64/0x84) from [<c0511e34>] (__irq_svc+0x34/0x80)
[   51.350280] [<c0511e34>] (__irq_svc+0x34/0x80) from [<c00391ec>] (oops_exit+0x0/0x2c)
[   51.358489] [<c00391ec>] (oops_exit+0x0/0x2c) from [<0000000b>] (0xb)
[   51.365203] Code: e0022006 e0033007 e1920003 0a000002 (e7f001f2) 
-O /var/log/mess[   51.372131] ---[ end trace 2618f89c1c19f5e6 ]---
ages
  743 root[   51.378479] Kernel panic - not syncing: Fatal exception in interrupt
      2140 S    [   51.386657] [<c0011d44>] (unwind_backtrace+0x0/0xe0) from [<c0509d40>] (panic+0x50/0x184)
/sbin/klogd -n
[   51.396697] [<c0509d40>] (panic+0x50/0x184) from [<c0010470>] (die+0x1a8/0x1e4)
  749 avahi     [   51.405853] [<c0010470>] (die+0x1a8/0x1e4) from [<c00084d4>] (do_undefinstr+0x150/0x170)
2936 S    avahi-[   51.415954] [<c00084d4>] (do_undefinstr+0x150/0x170) from [<c0511ec8>] (__und_svc+0x48/0x60)
daemon: running [   51.426269] Exception stack(0xcb9a3a48 to 0xcb9a3a90)
[beagleboard.loc[   51.433074] 3a40:                   00800000 cd073980 00000000 00800000 cd073a00 00000000
al]
  750 avahi[   51.443115] 3a60: 00000004 00800000 00001008 00000000 00000064 00000000 00000000 cb9a3ad0
     2936 S    a[   51.453155] 3a80: c0080f50 c0023588 20000193 ffffffff
vahi-daemon: chr[   51.459991] [<c0511ec8>] (__und_svc+0x48/0x60) from [<c0023588>] (omap3_l3_app_irq+0x40/0x11c)
oot helper
  77[   51.470489] [<c0023588>] (omap3_l3_app_irq+0x40/0x11c) from [<c0080f50>] (handle_irq_event_percpu+0x7c/0x230)
6 root         0[   51.482360] [<c0080f50>] (handle_irq_event_percpu+0x7c/0x230) from [<c008112c>] (handle_irq_event+0x28/0x38)
 SW<  [pvr_timer[   51.494110] [<c008112c>] (handle_irq_event+0x28/0x38) from [<c00831f0>] (handle_level_irq+0xac/0xbc)
]
  802 root   [   51.505157] [<c00831f0>] (handle_level_irq+0xac/0xbc) from [<c0080a20>] (generic_handle_irq+0x20/0x30)
      0 SW<  [pv[   51.516387] [<c0080a20>] (generic_handle_irq+0x20/0x30) from [<c000da94>] (handle_IRQ+0x60/0x84)
r_workqueue]
  [   51.527069] [<c000da94>] (handle_IRQ+0x60/0x84) from [<c0511e34>] (__irq_svc+0x34/0x80)
811 rygel     25[   51.536956] [<c0511e34>] (__irq_svc+0x34/0x80) from [<c003ebd0>] (__do_softirq+0x48/0x1ec)
84 S    /usr/bin[   51.547088] [<c003ebd0>] (__do_softirq+0x48/0x1ec) from [<c003f0a8>] (irq_exit+0x40/0x90)
/dbus-daemon --f[   51.557128] [<c003f0a8>] (irq_exit+0x40/0x90) from [<c000da98>] (handle_IRQ+0x64/0x84)
ork --print-pid [   51.566925] [<c000da98>] (handle_IRQ+0x64/0x84) from [<c0511e34>] (__irq_svc+0x34/0x80)
4 --print-addres[   51.576812] [<c0511e34>] (__irq_svc+0x34/0x80) from [<c00391ec>] (oops_exit+0x0/0x2c)
s 6 --session
 [   51.586517] [<c00391ec>] (oops_exit+0x0/0x2c) from [<0000000b>] (0xb)
 816 rygel    36168 S    /usr/bin/rygel
  818 rygel     2888 S    /usr/bin/guacamayo-watchdog --debug=all -- media-explorer -f
  822 rygel    81172 R    media-explorer -f
  825 root      2864 S    -sh
  826 root      1884 S    /sbin/getty 38400 tty1
  829 rygel    92244 S    /usr/bin/pulseaudio -D --exit-idle-time=-1
  831 root         0 SW<  [omaplfb]
  836 root     17204 S    /usr/sbin/console-kit-daemon --no-daemon
  901 root     22736 S    /usr/libexec/polkitd --no-debug
  906 rygel     4820 S    /usr/libexec/gvfsd
  920 rygel    72264 R    /usr/libexec/tracker-store
  937 root      2316 R    ps w

--nextPart1411246.vkUoUixFoR--
