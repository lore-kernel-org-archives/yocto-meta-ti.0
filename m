Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D39B8E006E9
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2013 00:40:17 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:55563)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2B83F> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Wed, 7 Aug 2013 09:39:41 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti@yoctoproject.org
Date: Wed, 07 Aug 2013 10:39:10 +0200
Message-ID: <26463694.HpIDxgv4eq@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
Subject: Beagleboard-C4 and OpenGL with 3.x kernels
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
X-List-Received-Date: Wed, 07 Aug 2013 07:40:20 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

I have a Beagleboard-C4 running Angstrom Linux and i have problem runni=
ng=20
OpenGL with 3.x kernels. All others things seem good. The last version =
where=20
the OpenGL drivers work properly is 2.6.39.

The current kernel version is 3.2.28 in Angstrom, but i tried some olde=
r=20
(3.0.x, 3.1.x) versions with the same result. Currently i cannot build =
newer=20
version. If i try to start any OpenGL based application it results in a=
 kernel=20
crash.

Some kernel info:
Package: meta-ti/recipes-kernel/linux/linux-mainline_3.2.bb
Source: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-
stable.git;branch=3Dlinux-3.2.y
Revision: 1f873aca1c7aa7a574b276c040d304d16f1dbfa4

My full kernel log is at the end of this mail, the OGLES2Coverflow demo=
 was=20
started from graphical menu.

Please somebody, help me to build a working 3.x kernel for my Beagleboa=
rd.

Regards
Gy=F6rgy K=F6vesdi

___________________________________________________________

My full kernel log:

SPL 2011.12-dirty (Aug 05 2013 - 14:53:29)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12-dirty (Aug 05 2013 - 14:53:29)

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
timed out in wait_for_pin: I2C_STAT=3D0
I2C read: I/O error
Unrecognized expansion board: 0
timed out in wait_for_pin: I2C_STAT=3D0
I2C read: I/O error
Unrecognized expansion board: 0
Die ID #30b6000400000000040373050e00400e
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  1 =08=08=08 0=20
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
4357224 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Angstrom/3.2.28/beagleboard
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4357160 Bytes =3D 4.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.2.28 (kgy@kgy-pc) (gcc version 4.7.3 201=
30205=20
(prerelease) (Linaro GCC 4.7-2013.02-01) ) #1 Tue Aug 6 21:56:49 CEST 2=
013
[    0.000000] CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=3D=
10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasin=
g=20
instruction cache
[    0.000000] Machine: OMAP3 Beagle Board
[    0.000000] Reserving 37748736 bytes SDRAM for VRAM
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] OMAP3430/3530 ES3.1 (l2cache iva sgx neon isp )
[    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/500 MHz
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total=20
pages: 54272
[    0.000000] Kernel command line: console=3DttyO2,115200n8 vram=3D36M=
=20
omapdss.def_disp=3Ddvi omapfb.mode=3Ddvi:800x480MR-16@60=20
omapfb.vram=3D0:12M,1:12M,2:12M mpurate=3D720 consoleblank=3D0 root=3D/=
dev/mmcblk0p2=20
rw rootfstype=3Dext3 rootwait
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072=
 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 b=
ytes)
[    0.000000] allocated 1048576 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=3Dmemory' option if you don't=
 want=20
memory cgroups
[    0.000000] Memory: 214MB =3D 214MB total
[    0.000000] Memory: 207056k/207056k available, 55088k reserved, 0K h=
ighmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xf8000000   ( 632 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0730aac   (7331 kB)
[    0.000000]       .init : 0xc0731000 - 0xc0777000   ( 280 kB)
[    0.000000]       .data : 0xc0778000 - 0xc07d28d0   ( 363 kB)
[    0.000000]        .bss : 0xc07d28f4 - 0xc088f9d0   ( 757 kB)
[    0.000000] SLUB: Genslabs=3D11, HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1,=20
Nodes=3D1
[    0.000000] NR_IRQS:410 nr_irqs:410 410
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 4.0) with 96=20=

interrupts
[    0.000000] Total of 96 interrupts on 1 active controller
[    0.000000] OMAP clockevent source: GPTIMER12 at 32768 Hz
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps=
 every=20
131071999ms
[    0.000000] Console: colour dummy device 80x30
[    0.000183] Calibrating delay loop... 512.57 BogoMIPS (lpj=3D2002944=
)
[    0.048278] pid_max: default: 32768 minimum: 301
[    0.048583] Security Framework initialized
[    0.048645] AppArmor: AppArmor initialized
[    0.048950] Mount-cache hash table entries: 512
[    0.049530] Initializing cgroup subsys cpuacct
[    0.049591] Initializing cgroup subsys memory
[    0.049621] Initializing cgroup subsys devices
[    0.049652] Initializing cgroup subsys freezer
[    0.049652] Initializing cgroup subsys blkio
[    0.049682] Initializing cgroup subsys perf_event
[    0.049804] CPU: Testing write buffer coherency: ok
[    0.051544] devtmpfs: initialized
[    0.056121] print_constraints: dummy:=20
[    0.056518] NET: Registered protocol family 16
[    0.056762] GPMC revision 5.0
[    0.058685] OMAP GPIO hardware version 2.5
[    0.060485] omap_mux_init: Add partition: #1: core, flags: 0
[    0.062042] OMAP3 Beagle Rev: C4
[    0.065826] Reprogramming SDRC clock to 332000000 Hz
[    0.068420] Found NAND on CS0
[    0.068450] Registering NAND on CS0
[    0.068878] Unable to get DVI reset GPIO
[    0.069030] hw-breakpoint: debug architecture 0x4 unsupported.
[    0.074066]  omap-mcbsp.2: alias fck already exists
[    0.074310]  omap-mcbsp.3: alias fck already exists
[    0.075805] Calibrating delay loop (skipped) already calibrated this=
 CPU
[    0.075927] Switched to new clocking rate (Crystal/Core/MPU): 26.0/3=
32/720=20
MHz
[    0.076110] OMAP DMA hardware revision 4.0
[    0.082977] bio: create slab <bio-0> at 0
[    0.084197] SCSI subsystem initialized
[    0.085388] usbcore: registered new interface driver usbfs
[    0.085510] usbcore: registered new interface driver hub
[    0.085723] usbcore: registered new device driver usb
[    0.086486] omap_i2c omap_i2c.1: bus 1 rev1.3.12 at 2600 kHz
[    0.088958] twl4030: PIH (irq 7) chaining IRQs 368..375
[    0.089050] twl4030: power (irq 373) chaining IRQs 376..383
[    0.089538] twl4030: gpio (irq 368) chaining IRQs 384..401
[    0.089874] _omap_mux_init_gpio: Could not set gpio192
[    0.092651] print_constraints: VUSB1V5: 1500 mV normal standby
[    0.093048] print_constraints: VUSB1V8: 1800 mV normal standby
[    0.093414] print_constraints: VUSB3V1: 3100 mV normal standby
[    0.095123] twl4030_usb twl4030_usb: Initialized TWL4030 USB module
[    0.095825] print_constraints: VMMC1: 1850 <--> 3150 mV at 3150 mV n=
ormal=20
standby
[    0.096221] print_constraints: VDAC: 1800 mV normal standby
[    0.096588] print_constraints: VAUX2_4030: 1800 mV normal=20
[    0.097045] print_constraints: VDVI: 1800 mV normal standby
[    0.097503] print_constraints: VSIM: 1800 <--> 3000 mV at 1800 mV no=
rmal=20
standby
[    0.097808] omap_i2c omap_i2c.2: bus 2 rev1.3.12 at 400 kHz
[    0.112762] omap_i2c omap_i2c.3: bus 3 rev1.3.12 at 100 kHz
[    0.113861] NetLabel: Initializing
[    0.113861] NetLabel:  domain hash size =3D 128
[    0.113891] NetLabel:  protocols =3D UNLABELED CIPSOv4
[    0.113922] NetLabel:  unlabeled traffic allowed by default
[    0.113983] Switching to clocksource 32k_counter
[    0.128356] AppArmor: AppArmor Filesystem Enabled
[    0.140319] musb-hdrc: version 6.0, ?dma?, otg (peripheral+host)
[    0.152282] musb-hdrc musb-hdrc: USB OTG mode controller at fa0ab000=
 using=20
DMA, IRQ 92
[    0.152587] NET: Registered protocol family 2
[    0.152923] IP route cache hash table entries: 2048 (order: 1, 8192 =
bytes)
[    0.153808] TCP established hash table entries: 8192 (order: 4, 6553=
6=20
bytes)
[    0.153961] TCP bind hash table entries: 8192 (order: 3, 32768 bytes=
)
[    0.154052] TCP: Hash tables configured (established 8192 bind 8192)=

[    0.154052] TCP reno registered
[    0.154083] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.154113] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.154418] NET: Registered protocol family 1
[    0.154846] RPC: Registered named UNIX socket transport module.
[    0.154876] RPC: Registered udp transport module.
[    0.154876] RPC: Registered tcp transport module.
[    0.154876] RPC: Registered tcp NFSv4.1 backchannel transport module=
.
[    0.155151] omap_dsp_init: 600000 bytes @ 8d600000
[    0.156829] audit: initializing netlink socket (disabled)
[    0.156860] type=3D2000 audit(0.148:1): initialized
[    0.330078] VFS: Disk quotas dquot_6.5.2
[    0.330383] Dquot-cache hash table entries: 1024 (order 0, 4096 byte=
s)
[    0.333770] nfs4filelayout_init: NFSv4 File Layout Driver Registerin=
g...
[    0.333831] fuse init (API version 7.17)
[    0.335632] Btrfs loaded
[    0.335693] msgmni has been set to 404
[    0.337249] Block layer SCSI generic (bsg) driver version 0.4 loaded=
 (major=20
253)
[    0.337371] io scheduler noop registered
[    0.337402] io scheduler deadline registered
[    0.337432] io scheduler cfq registered (default)
[    0.338348] OMAP DSS rev 2.0
[    0.341156] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.342315] omap_uart.0: ttyO0 at MMIO 0x4806a000 (irq =3D 72) is a =
OMAP=20
UART0
[    0.342590] omap_uart.1: ttyO1 at MMIO 0x4806c000 (irq =3D 73) is a =
OMAP=20
UART1
[    0.342864] omap_uart.2: ttyO2 at MMIO 0x49020000 (irq =3D 74) is a =
OMAP=20
UART2
[    1.064910] console [ttyO2] enabled
[    1.069183] [drm] Initialized drm 1.1.0 20060810
[    1.081268] brd: module loaded
[    1.088409] loop: module loaded
[    1.094940] twl4030_madc twl4030_madc: clk disabled, enabling
[    1.102783] omap2-nand driver initializing
[    1.107482] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micro=
n NAND=20
256MiB 1,8V 16-bit)
[    1.116638] Creating 5 MTD partitions on "omap2-nand.0":
[    1.122314] 0x000000000000-0x000000080000 : "X-Loader"
[    1.129150] 0x000000080000-0x000000260000 : "U-Boot"
[    1.136138] 0x000000260000-0x000000280000 : "U-Boot Env"
[    1.142913] 0x000000280000-0x000000680000 : "Kernel"
[    1.150360] 0x000000680000-0x000010000000 : "File System"
[    1.231689] OneNAND driver initializing
[    1.236358] usbcore: registered new interface driver cdc_ether
[    1.242614] usbcore: registered new interface driver rndis_host
[    1.248931] cdc_ncm: 04-Aug-2011
[    1.252349] usbcore: registered new interface driver cdc_ncm
[    1.258697] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
[    3.278533] ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
[    3.284820] ehci-omap ehci-omap.0: new USB bus registered, assigned =
bus=20
number 1
[    3.292816] ehci-omap ehci-omap.0: irq 77, io mem 0x48064800
[    3.309967] ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
[    3.316070] usb usb1: New USB device found, idVendor=3D1d6b, idProdu=
ct=3D0002
[    3.323303] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,=20=

SerialNumber=3D1
[    3.330963] usb usb1: Product: OMAP-EHCI Host Controller
[    3.336639] usb usb1: Manufacturer: Linux 3.2.28 ehci_hcd
[    3.342437] usb usb1: SerialNumber: ehci-omap.0
[    3.347778] hub 1-0:1.0: USB hub found
[    3.351837] hub 1-0:1.0: 3 ports detected
[    3.380615] Initializing USB Mass Storage driver...
[    3.385833] usbcore: registered new interface driver usb-storage
[    3.392272] USB Mass Storage support registered.
[    3.397277] usbcore: registered new interface driver libusual
[    3.403533] udc: OMAP UDC driver, version: 4 October 2004 (iso) (dma=
)
[    3.410766] mousedev: PS/2 mouse device common for all mice
[    3.419219] input: twl4030_pwrbutton as=20
/devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl4030_pwrbutton/input/=
input0
[    3.431030] i2c /dev entries driver
[    3.435363] Linux media interface: v0.10
[    3.439575] lirc_dev: IR Remote Control driver registered, major 249=
=20
[    3.446472] Driver for 1-wire Dallas network protocol.
[    3.452728] OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
[    3.459930] twl4030_wdt twl4030_wdt: Failed to register misc device
[    3.466613] twl4030_wdt: probe of twl4030_wdt failed with error -16
[    3.474304] device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initiali=
sed:=20
dm-devel@redhat.com
[    3.483673] cpuidle: using governor ladder
[    3.487945] cpuidle: using governor menu
[    3.492187] sdhci: Secure Digital Host Controller Interface driver
[    3.498779] sdhci: Copyright(c) Pierre Ossman
[    3.678588] usb 1-2: new high-speed USB device number 2 using ehci-o=
map
[    3.727874] omap_hsmmc: probe of omap_hsmmc.1 failed with error -16
[    3.736175] usbcore: registered new interface driver usbhid
[    3.742126] usbhid: USB HID core driver
[    3.746124] oprofile: hardware counters not available
[    3.751556] oprofile: using timer interrupt.
[    3.757202] TCP cubic registered
[    3.761688] NET: Registered protocol family 10
[    3.768798] NET: Registered protocol family 17
[    3.773803] Registering the dns_resolver key type
[    3.778869] VFP support v0.3: implementor 41 architecture 3 part 30 =
variant=20
c rev 1
[    3.786987] ThumbEE CPU extension supported.
[    3.791473] Registering SWP/SWPB emulation handler
[    3.801147] sr_init: No PMIC hook to init smartreflex
[    3.806793] smartreflex smartreflex.0: omap_sr_probe: SmartReflex dr=
iver=20
initialized
[    3.815124] smartreflex smartreflex.1: omap_sr_probe: SmartReflex dr=
iver=20
initialized
[    3.823425] SmartReflex Class3 initialized
[    3.832824] clock: disabling unused clocks to save power
[    3.839965] registered taskstats version 1
[    3.844604] fbcvt: 800x480@60: CVT Name - .384M9-R
[    3.891418] usb 1-2: New USB device found, idVendor=3D1a40, idProduc=
t=3D0101
[    3.898590] usb 1-2: New USB device strings: Mfr=3D0, Product=3D1,=20=

SerialNumber=3D0
[    3.906158] usb 1-2: Product: USB 2.0 Hub
[    3.911621] hub 1-2:1.0: USB hub found
[    3.916076] hub 1-2:1.0: 4 ports detected
[    4.024902] Console: switching to colour frame buffer device 100x30
[    4.040679] regulator_init_complete: VDAC: incomplete constraints, l=
eaving=20
on
[    4.048400] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    4.055847] Waiting for root device /dev/mmcblk0p2...
[    4.167999] mmc0: new high speed SDHC card at address 1234
[    4.174560] mmcblk0: mmc0:1234 SA08G 7.28 GiB=20
[    4.182159]  mmcblk0: p1 p2
[    4.224822] usb 1-2.1: new high-speed USB device number 3 using ehci=
-omap
[    4.351837] usb 1-2.1: New USB device found, idVendor=3D19d2, idProd=
uct=3D1179
[    4.359191] usb 1-2.1: New USB device strings: Mfr=3D2, Product=3D1,=
=20
SerialNumber=3D3
[    4.366973] usb 1-2.1: Product: K3772-Z
[    4.371002] usb 1-2.1: Manufacturer: Vodafone
[    4.375640] usb 1-2.1: SerialNumber:=20
1296BFEFEA4FA1C362D155E0D6CB284DC6F70C79
[    4.385772] scsi0 : usb-storage 1-2.1:1.0
[    4.474853] usb 1-2.2: new high-speed USB device number 4 using ehci=
-omap
[    4.601165] usb 1-2.2: New USB device found, idVendor=3D1a40, idProd=
uct=3D0101
[    4.608551] usb 1-2.2: New USB device strings: Mfr=3D0, Product=3D1,=
=20
SerialNumber=3D0
[    4.616333] usb 1-2.2: Product: USB 2.0 Hub
[    4.623046] hub 1-2.2:1.0: USB hub found
[    4.627502] hub 1-2.2:1.0: 4 ports detected
[    4.716430] usb 1-2.4: new full-speed USB device number 5 using ehci=
-omap
[    4.856170] usb 1-2.4: New USB device found, idVendor=3D054c, idProd=
uct=3D0066
[    4.863555] usb 1-2.4: New USB device strings: Mfr=3D1, Product=3D2,=
=20
SerialNumber=3D3
[    4.871368] usb 1-2.4: Product: Gavrio USB Burner - AN_0.0.1
[    4.877410] usb 1-2.4: Manufacturer: Teledigit BT.
[    4.882537] usb 1-2.4: SerialNumber: 00000002
[    5.390533] scsi 0:0:0:0: CD-ROM            Vodafone USB SCSI CD-ROM=
  0001=20
PQ: 0 ANSI: 0
[    5.406036] sr0: scsi3-mmc drive: 0x/0x caddy
[    5.410614] cdrom: Uniform CD-ROM driver Revision: 3.20
[    5.418670] sr 0:0:0:0: Attached scsi generic sg0 type 5
[   14.974121] usb 1-2.2.1: new high-speed USB device number 6 using eh=
ci-omap
[   15.117095] usb 1-2.2.1: New USB device found, idVendor=3D0cf3,=20
idProduct=3D9271
[   15.124572] usb 1-2.2.1: New USB device strings: Mfr=3D16, Product=3D=
32,=20
SerialNumber=3D48
[   15.132812] usb 1-2.2.1: Product: USB2.0 WLAN
[   15.137359] usb 1-2.2.1: Manufacturer: ATHEROS
[   15.142120] usb 1-2.2.1: SerialNumber: 12345
[   15.233886] usb 1-2.2.2: new low-speed USB device number 7 using ehc=
i-omap
[   15.363342] usb 1-2.2.2: New USB device found, idVendor=3D1c4f,=20
idProduct=3D0003
[   15.370819] usb 1-2.2.2: New USB device strings: Mfr=3D1, Product=3D=
2,=20
SerialNumber=3D0
[   15.378814] usb 1-2.2.2: Product: Usb Mouse
[   15.383331] usb 1-2.2.2: Manufacturer: SIGMACHIP
[   15.394012] input: SIGMACHIP Usb Mouse as /devices/platform/usbhs-
omap.0/ehci-omap.0/usb1/1-2/1-2.2/1-2.2.2/1-2.2.2:1.0/input/input1
[   15.407318] generic-usb 0003:1C4F:0003.0001: input,hidraw0: USB HID =
v1.10=20
Mouse [SIGMACHIP Usb Mouse] on usb-ehci-omap.0-2.2.2/input0
[   15.507293] usb 1-2.2.3: new low-speed USB device number 8 using ehc=
i-omap
[   15.673278] usb 1-2.2.3: New USB device found, idVendor=3D04f2,=20
idProduct=3D0402
[   15.680786] usb 1-2.2.3: New USB device strings: Mfr=3D1, Product=3D=
2,=20
SerialNumber=3D0
[   15.688781] usb 1-2.2.3: Product: USB Keyboard
[   15.693572] usb 1-2.2.3: Manufacturer: Chicony
[   15.710754] input: Chicony USB Keyboard as /devices/platform/usbhs-
omap.0/ehci-omap.0/usb1/1-2/1-2.2/1-2.2.3/1-2.2.3:1.0/input/input2
[   15.724243] generic-usb 0003:04F2:0402.0002: input,hidraw1: USB HID =
v1.11=20
Keyboard [Chicony USB Keyboard] on usb-ehci-omap.0-2.2.3/input0
[   15.761688] input: Chicony USB Keyboard as /devices/platform/usbhs-
omap.0/ehci-omap.0/usb1/1-2/1-2.2/1-2.2.3/1-2.2.3:1.1/input/input3
[   15.775207] generic-usb 0003:04F2:0402.0003: input,hiddev0,hidraw2: =
USB HID=20
v1.11 Device [Chicony USB Keyboard] on usb-ehci-omap.0-2.2.3/input1
[   15.872741] usb 1-2.2.4: new high-speed USB device number 9 using eh=
ci-omap
[   16.258697] usb 1-2.2.4: New USB device found, idVendor=3D0951,=20
idProduct=3D162b
[   16.266204] usb 1-2.2.4: New USB device strings: Mfr=3D1, Product=3D=
2,=20
SerialNumber=3D3
[   16.274200] usb 1-2.2.4: Product: DT HyperX 3.0
[   16.279052] usb 1-2.2.4: Manufacturer: Kingston
[   16.283782] usb 1-2.2.4: SerialNumber: 20CF3005F037BD51820405B5
[   16.291442] scsi1 : usb-storage 1-2.2.4:1.0
[   17.299285] scsi 1:0:0:0: Direct-Access     Kingston DT HyperX 3.0  =
  PMAP=20
PQ: 0 ANSI: 6
[   17.311126] sd 1:0:0:0: Attached scsi generic sg1 type 0
[   17.318084] sd 1:0:0:0: [sda] 123469824 512-byte logical blocks: (63=
.2=20
GB/58.8 GiB)
[   17.327270] sd 1:0:0:0: [sda] Write Protect is off
[   17.333374] sd 1:0:0:0: [sda] Write cache: disabled, read cache: ena=
bled,=20
doesn't support DPO or FUA
[   17.561431]  sda: sda1
[   17.568481] sd 1:0:0:0: [sda] Attached SCSI removable disk
[   74.553039] kjournald starting.  Commit interval 5 seconds
[   75.441467] EXT3-fs (mmcblk0p2): using internal journal
[   75.447082] EXT3-fs (mmcblk0p2): recovery complete
[   75.456085] EXT3-fs (mmcblk0p2): mounted filesystem with ordered dat=
a mode
[   75.463409] VFS: Mounted root (ext3 filesystem) on device 179:2.
[   75.474090] devtmpfs: mounted
[   75.477905] Freeing init memory: 280K
[   75.750579] systemd[1]: systemd 183 running in system mode. (+PAM -L=
IBWRAP=20
-AUDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP; angstrom)

Welcome to The =C3=85ngstr=C3=B6m Distribution!

[   75.817749] systemd[1]: Inserted module 'autofs4'
[   75.825866] systemd[1]: Set hostname to <beagleboard>.
[   76.228881] systemd[1]: Found ordering cycle on basic.target/start
[   76.235534] systemd[1]: Walked on cycle path to sysinit.target/start=

[   76.242553] systemd[1]: Walked on cycle path to portmap.service/star=
t
[   76.249420] systemd[1]: Walked on cycle path to network.target/start=

[   76.256164] systemd[1]: Walked on cycle path to NetworkManager-wait-=

online.service/start
[   76.264739] systemd[1]: Walked on cycle path to basic.target/start
[   76.271301] systemd[1]: Breaking ordering cycle by deleting job=20
portmap.service/start
         Expecting device dev-ttyO2.device...
[  OK  ] Reached target Remote File Systems.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Listening on Delayed Shutdown Socket.
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Listening on udev Control Socket.
[  OK  ] Set up automount Arbitrary Executable File Formats F...utomoun=
t=20
Point.
[  OK  ] Reached target Swap.
[  OK  ] Listening on Journal Socket.
         Starting alignment.service...
         Starting udev Coldplug all Devices...
         Mounting FUSE Control File System...
         Starting Apply Kernel Variables...
         Mounting Debug File System...
         Mounting POSIX Message Queue File System...
         Starting udev Kernel Device Manager...
         Starting Remount Root and Kernel File Systems...
         Starting Journal Service...
[  OK  ] Started Journal Service.
[  OK  ] Reached target Syslog.
[  OK  ] Mounted Debug File System.
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Mounted FUSE Control File System.
[  OK  ] Started alignment.service.
[  OK  ] Started Apply Kernel Variables.
[   76.790466] udevd[61]: starting version 183
[  OK  ] Started udev Kernel Device Manager.
[   76.881103] systemd-journald[63]: Fixed max_use=3D727.3M max_size=3D=
90.9M=20
min_size=3D64.0K keep_free=3D363.6M
[   76.938568] systemd-journald[63]: Vacuuming...
[   76.969421] systemd-journald[63]: Flushing /proc/kmsg...
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Started Remount Root and Kernel File Systems.
         Starting Load Random Seed...
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /tmp...
[  OK  ] Started Load Random Seed.
[  OK  ] Mounted /tmp.
[  OK  ] Reached target Local File Systems.
         Starting Recreate Volatile Files and Directories...
[  OK  ] Started Recreate Volatile Files and Directories.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
         Starting Console System Startup Logging...
[  OK  ] Listening on D-Bus System Message Bus Socket.
         Starting Restore Sound Card State...
[  OK  ] Listening on sshd.socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
         Starting Avahi mDNS/DNS-SD Stack...
         Starting Periodic Command Scheduler...
[  OK  ] Started Periodic Command Scheduler.
         Starting xinetd.service...
         Starting LSB: Kernel NFS server support...
         Starting Kernel Logging Service...
[  OK  ] Started Kernel Logging Service.
         Starting Network Time Service (one-shot ntpdate mode)...
         Starting Network Manager...
         Starting SSH Key Generation...
         Starting Login Service...
         Starting Permit User Sessions...
         Starting D-Bus System Message Bus...
[  OK  ] Started D-Bus System Message Bus.
         Starting System Logging Service...
[   94.348327] usbcore: registered new interface driver usbserial
[   94.354675] USB Serial support registered for generic
[   94.360229] usbcore: registered new interface driver usbserial_gener=
ic
[   94.367462] usbserial: USB Serial Driver core
[   94.396270] twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc0
[  OK  ] Started System Logging Service.
[  OK  ] Started Console System Startup Logging.
[  OK  ] Started Restore Sound Card State.
[  OK  ] Started Permit User Sessions.
         Starting Gnome Display Manager...
[  OK  ] Started Gnome Display Manager.
         Starting Getty on tty1...
nfsserver[277]: creating NFS state directory: done
[  OK  ] Started Getty on tty1.
[  OK  ] Found device /dev/ttyO2.
         Starting Serial Getty on ttyO2...
[  OK  ] Started Serial Getty on ttyO2.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started Network Time Service (one-shot ntpdate mode).
[   96.345703] USB Serial support registered for Handspring Visor / Pal=
m OS
[   96.352996] USB Serial support registered for Sony Clie 3.5
[   96.358978] USB Serial support registered for Sony Clie 5.0
[   96.489959] visor 1-2.4:1.0: Handspring Visor / Palm OS converter de=
tected
xinetd[275]: Starting internet superserver: xinetd.
[  OK  ] Started xinetd.service.
[   96.669158] usb 1-2.4: Handspring Visor / Palm OS converter now atta=
ched to=20
ttyUSB0
[   96.694396] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).=

[   96.714111] usb 1-2.4: Handspring Visor / Palm OS converter now atta=
ched to=20
ttyUSB1
[   96.722473] usbcore: registered new interface driver visor
[   96.728363] visor: USB HandSpring Visor / Palm OS driver
[  OK  ] Started SSH Key Generation.
[   96.833099] svc: failed to register nfsdv2 RPC service (errno 111).
[   96.863647] svc: failed to register nfsaclv2 RPC service (errno 111)=
.
[   96.889129] nfsd: last server has exited, flushing export cache
nfsserver[277]: starting 8 nfsd kernel threads: rpc.nfsd: writing fd to=
 kernel=20
failed: errno 111 (Connection refused)
nfsserver[277]: rpc.nfsd: unable to set any sockets for nfsd
nfsserver[277]: done
[   97.051269] cfg80211: Calling CRDA to update world regulatory domain=

nfsserver[277]: starting mountd: Cannot register service: RPC: Unable t=
o=20
receive; errno =3D Connection refused
nfsserver[277]: done
[  OK  ] Started Avahi mDNS/DNS-SD Stack.
[  OK  ] Started Login Service.

.---O---.                                          =20
|       |                  .-.           o o       =20
|   |   |-----.-----.-----.| |   .----..-----.-----.
|       |     | __  |  ---'| '--.|  .-'|     |     |
|   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
'---'---'--'--'--.  |-----''----''--'  '-----'-'-'-'
                -'  |
                '---'

The Angstrom Distribution beagleboard ttyO2

Angstrom v2012.12 - Kernel 3.2.28

beagleboard login: [FAILED] Failed to start LSB: Kernel NFS server supp=
ort.
         See 'systemctl status nfsserver.service' for details.
         Starting pvr-init.service...
nfsserver[277]: starting statd: done
[   99.529754] EXT4-fs (sda1): recovery complete
[   99.534332] EXT4-fs (sda1): mounted filesystem with ordered data mod=
e. Opts:=20
(null)
[  103.017669] usb 1-2.2.1: ath9k_htc: Firmware - htc_9271.fw not found=

[  103.024505] ath9k_htc: probe of 1-2.2.1:1.0 failed with error -22
[  103.031219] usbcore: registered new interface driver ath9k_htc
[  103.062194] sr0: CDROM (ioctl) error, command: Xpwrite, Read disk in=
fo 51=20
00 00 00 00 00 00 00 02 00
[  103.071960] sr: Sense Key : Hardware Error [current]=20
[  103.077453] sr: Add. Sense: No additional sense information
pvr-init[363]: Starting PVR
[  OK  ] Started Network Manager.
         Starting Network Manager Wait Online...
[FAILED] Failed to start Network Manager Wait Online.
         See 'systemctl status NetworkManager-wait-online.service' for=20=

details.
[  OK  ] Reached target Network.
[  OK  ] Started pvr-init.service.
[  OK  ] Reached target Multi-User.
[  OK  ] Reached target Graphical Interface.
[  211.935333] EXT4-fs (sda1): re-mounted. Opts:=20
user_xattr,barrier=3D1,data=3Dordered,commit=3D0
[  301.527191] Unhandled fault: external abort on non-linefetch (0x1008=
) at=20
0xd0ce0ca8
[  301.535186] Internal error: : 1008 [#1]
[  301.539184] Modules linked in: bufferclass_ti(O) omaplfb(O) pvrsrvkm=
(O)=20
snd_soc_twl4030 ath9k_htc ath9k_common ath9k_hw ath snd_soc_core mac802=
11=20
snd_pcm cfg80211 snd_page_alloc snd_timer nfsd snd soundcore regmap_spi=
 rfkill=20
visor usbserial rtc_twl autofs4
[  301.562927] CPU: 0    Tainted: G           O  (3.2.28 #1)
[  301.568664] PC is at PollForValueKM+0x48/0xb8 [pvrsrvkm]
[  301.574279] LR is at PollForValueKM+0x38/0xb8 [pvrsrvkm]
[  301.579803] pc : [<bf218a9c>]    lr : [<bf218a8c>]    psr: 800f0013
[  301.579833] sp : c8d9dd38  ip : c0784b00  fp : 000f4240
[  301.591766] r10: 00000000  r9 : 000000ff  r8 : d0ce0ca8
[  301.597229] r7 : 00000000  r6 : 00000000  r5 : 00000001  r4 : 001720=
08
[  301.604034] r3 : 00000001  r2 : ffe8dff8  r1 : 000003e8  r0 : 000000=
00
[  301.610839] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Seg=
ment=20
user
[  301.618286] Control: 10c5387d  Table: 88c18019  DAC: 00000015
[  301.624267] Process OGLES2Coverflow (pid: 711, stack limit =3D 0xc8d=
9c2f0)
[  301.631256] Stack: (0xc8d9dd38 to 0xc8d9e000)
[  301.635803] dd20:                                                   =
   =20
d0ce0ca8 00172009
[  301.644317] dd40: 000000ff c8ce1000 00000000 d0ca3120 00000000 00000=
000=20
00000001 bf22f024
[  301.652862] dd60: c7cb2860 bf2247dc 00000064 00000000 c8ce1000 bf224=
978=20
00000000 c8ce1000
[  301.661407] dd80: 00000000 d0ca3120 00000000 bf221c74 c8ce1000 00000=
000=20
bf22f064 c8ce1000
[  301.669921] dda0: 00000000 00000000 00000000 bf224bec c0785f7c 00000=
003=20
c0022c40 c00220a4
[  301.678436] ddc0: c0022090 c0026224 bf22f02c bf228f48 bf22efb8 c7c27=
700=20
00000000 c7c27700
[  301.686981] dde0: 00000000 bf214770 c8d9de18 bf2146fc 00000000 bf21b=
764=20
c7c27700 c8d9de18
[  301.695495] de00: 00000000 00000000 00000000 ffffffff bf2149c4 bf214=
6fc=20
00000000 00000000
[  301.704040] de20: 00000000 00000000 ffffffff c9dee000 c7f20880 c8d9d=
e78=20
00000001 c8d9c000
[  301.712585] de40: c8ce1000 bf222bdc c9dee000 00000001 c8d9de78 c9ce4=
008=20
c9dee000 c7f20880
[  301.721099] de60: 00000001 c9ce4008 c9ce4038 bf221208 00000000 00000=
000=20
00000000 00000000
[  301.729614] de80: 00000000 0f0ab000 00000000 00000000 00000000 00000=
000=20
c9ce4000 c9ce5000
[  301.738159] dea0: c9e81780 bf227f14 0000005c c9dee000 c9ce5000 c9e81=
780=20
c8d9deec 0000005c
[  301.746704] dec0: c9ce4000 c9ce5000 bea6dc6c bf22759c 000002c7 bea6d=
c6c=20
bea6dc6c c01c675c
[  301.755218] dee0: 00000004 bf220fe8 c9e81780 0000005c 0000001c bea6d=
c9c=20
00000054 bea6dcf0
[  301.763763] df00: 00000008 00000001 40234000 00000000 caa83240 c00eb=
8f0=20
c6dde800 c00ec304
[  301.772277] df20: c8c1ebcc 00000000 caa83240 800000f9 00000000 c026e=
a28=20
40048000 00000001
[  301.780822] df40: 40049000 00000001 40048000 c8c1ebb0 c8c1ebd0 c8c1e=
bcc=20
caa83240 020e40fb
[  301.789337] df60: caa83240 00000000 caa83240 bea6dc6c c01c675c 00000=
004=20
c8d9c000 00000000
[  301.797882] df80: 00000000 c00ec3a4 00000004 00000000 4018b6a8 bea6e=
1bc=20
bea6dcf0 00000036
[  301.806396] dfa0: c000d6e4 c000d560 4018b6a8 bea6e1bc 00000004 c01c6=
75c=20
bea6dc6c 00000001
[  301.814941] dfc0: 4018b6a8 bea6e1bc bea6dcf0 00000036 bea6e1b8 00000=
000=20
bea6ddb4 00000000
[  301.823455] dfe0: 4012e5d8 bea6dc64 40106ab0 404eacbc 400f0010 00000=
004=20
00ffffff 00ffffff
[  301.832183] [<bf218a9c>] (PollForValueKM+0x48/0xb8 [pvrsrvkm]) from=20=

[<bf2247dc>] (SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm])
[  301.844207] [<bf2247dc>] (SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm=
]) from=20
[<bf224978>] (SGXReset+0x194/0x1b0 [pvrsrvkm])
[  301.855895] [<bf224978>] (SGXReset+0x194/0x1b0 [pvrsrvkm]) from=20
[<bf221c74>] (SGXInitialise+0x48/0x110 [pvrsrvkm])
[  301.866821] [<bf221c74>] (SGXInitialise+0x48/0x110 [pvrsrvkm]) from=20=

[<bf224bec>] (SGXPostPowerState+0x4c/0xa0 [pvrsrvkm])
[  301.878387] [<bf224bec>] (SGXPostPowerState+0x4c/0xa0 [pvrsrvkm]) fr=
om=20
[<bf214770>] (PVRSRVDevicePostPowerStateKM_AnyVaCb+0x74/0x88 [pvrsrvkm]=
)
[  301.891906] [<bf214770>] (PVRSRVDevicePostPowerStateKM_AnyVaCb+0x74/=
0x88=20
[pvrsrvkm]) from [<bf21b764>]=20
(List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrsrvkm])
[  301.907592] [<bf21b764>]=20
(List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrsrvkm]) from=20=

[<bf2149c4>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm])
[  301.922515] [<bf2149c4>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvr=
srvkm])=20
from [<bf222bdc>] (SGXScheduleCCBCommandKM+0x2c/0xa4 [pvrsrvkm])
[  301.935821] [<bf222bdc>] (SGXScheduleCCBCommandKM+0x2c/0xa4 [pvrsrvk=
m])=20
from [<bf221208>] (SGXSubmitTransferKM+0x118/0x2b4 [pvrsrvkm])
[  301.948577] [<bf221208>] (SGXSubmitTransferKM+0x118/0x2b4 [pvrsrvkm]=
) from=20
[<bf227f14>] (SGXSubmitTransferBW+0x164/0x170 [pvrsrvkm])
[  301.961151] [<bf227f14>] (SGXSubmitTransferBW+0x164/0x170 [pvrsrvkm]=
) from=20
[<bf22759c>] (BridgedDispatchKM+0xe0/0x138 [pvrsrvkm])
[  301.973480] [<bf22759c>] (BridgedDispatchKM+0xe0/0x138 [pvrsrvkm]) f=
rom=20
[<bf220fe8>] (PVRSRV_BridgeDispatchKM+0xac/0xec [pvrsrvkm])
[  301.985900] [<bf220fe8>] (PVRSRV_BridgeDispatchKM+0xac/0xec [pvrsrvk=
m])=20
from [<c00eb8f0>] (vfs_ioctl+0x20/0x3c)
[  301.996429] [<c00eb8f0>] (vfs_ioctl+0x20/0x3c) from [<c00ec304>]=20
(do_vfs_ioctl+0x488/0x4e0)
[  302.005126] [<c00ec304>] (do_vfs_ioctl+0x488/0x4e0) from [<c00ec3a4>=
]=20
(sys_ioctl+0x48/0x70)
[  302.013854] [<c00ec3a4>] (sys_ioctl+0x48/0x70) from [<c000d560>]=20
(ret_fast_syscall+0x0/0x30)
[  302.022674] Code: e59d3004 e1a07000 ea000011 e1a05003 (e5983000)=20
[  302.029052] ------------[ cut here ]------------
[  302.033874] kernel BUG at arch/arm/mach-omap2/omap_l3_smx.c:186!
[  302.040130] Internal error: Oops - undefined instruction: 0 [#2]
[  302.046386] Modules linked in: bufferclass_ti(O) omaplfb(O) pvrsrvkm=
(O)=20
snd_soc_twl4030 ath9k_htc ath9k_common ath9k_hw ath snd_soc_core mac802=
11=20
snd_pcm cfg80211 snd_page_alloc snd_timer nfsd snd soundcore regmap_spi=
 rfkill=20
visor usbserial rtc_twl autofs4
[  302.070098] CPU: 0    Tainted: G      D    O  (3.2.28 #1)
[  302.075744] PC is at omap3_l3_app_irq+0x44/0x130
[  302.080566] LR is at handle_irq_event_percpu+0x3c/0x21c
[  302.086029] pc : [<c0023968>]    lr : [<c0081970>]    psr: 200f0193
[  302.086029] sp : c8d9db68  ip : ccc00000  fp : c084e2e4
[  302.097991] r10: cd004600  r9 : 000000ff  r8 : c06721e1
[  302.103424] r7 : 00000000  r6 : 00000000  r5 : 00800000  r4 : 000000=
00
[  302.110229] r3 : 00800000  r2 : 00000004  r1 : cd073980  r0 : 008000=
00
[  302.117034] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Se=
gment=20
user
[  302.124542] Control: 10c5387d  Table: 88c18019  DAC: 00000015
[  302.130554] Process OGLES2Coverflow (pid: 711, stack limit =3D 0xc8d=
9c2f0)
[  302.137542] Stack: (0xc8d9db68 to 0xc8d9e000)
[  302.142089] db60:                   00000008 ffffffff 00000000 00000=
002 ff102100=20
cd073a00
[  302.150604] db80: 0000000a 00000000 00000000 c0081970 cd004600 cd073=
a00=20
0000b7e3 cd004600
[  302.159149] dba0: 00000000 fa200000 c8d9dc1c c06721e1 000000ff 00000=
000=20
000f4240 c0081b78
[  302.167663] dbc0: cd004600 c0083cc8 0000000a c0081474 0000000a c000d=
df4=20
c00107c0 c0039364
[  302.176208] dbe0: 600f0113 c050b4b4 00000000 c07d4ac0 00001080 00000=
080=20
c8d9dcf0 c8d9c000
[  302.184722] dc00: c9e42800 00000001 c06721e1 000000ff 00000000 000f4=
240=20
00000000 c8d9dc30
[  302.193267] dc20: c00107c0 c0039364 600f0113 ffffffff c8d9c2f0 00000=
00b=20
00001008 c077f554
[  302.201782] dc40: d0ce0ca8 c8d9dcf0 d0ce0ca8 c0008570 00000000 00000=
000=20
00000007 00000000
[  302.210327] dc60: 00000000 d0ce0ca8 000212d0 00000000 c9e81880 00322=
000=20
00000050 00000000
[  302.218872] dc80: 00000010 00322000 00000000 c07d0598 00020000 00000=
000=20
c8d02900 c2247ed4
[  302.227386] dca0: 0001ffff c0a92048 cd002180 00000040 000000d0 fffff=
fff c228a000=20
c08d5120
[  302.235931] dcc0: cd002180 c00d2754 c0a92048 00000000 cd002180 600f0=
013=20
cd001060 bf218a9c
[  302.244445] dce0: 800f0013 ffffffff c8d9dd24 c050b458 00000000 00000=
3e8 ffe8dff8=20
00000001
[  302.252960] dd00: 00172008 00000001 00000000 00000000 d0ce0ca8 00000=
0ff=20
00000000 000f4240
[  302.261505] dd20: c0784b00 c8d9dd38 bf218a8c bf218a9c 800f0013 fffff=
fff=20
d0ce0ca8 00172009
[  302.270019] dd40: 000000ff c8ce1000 00000000 d0ca3120 00000000 00000=
000=20
00000001 bf22f024
[  302.278533] dd60: c7cb2860 bf2247dc 00000064 00000000 c8ce1000 bf224=
978=20
00000000 c8ce1000
[  302.287078] dd80: 00000000 d0ca3120 00000000 bf221c74 c8ce1000 00000=
000=20
bf22f064 c8ce1000
[  302.295623] dda0: 00000000 00000000 00000000 bf224bec c0785f7c 00000=
003=20
c0022c40 c00220a4
[  302.304138] ddc0: c0022090 c0026224 bf22f02c bf228f48 bf22efb8 c7c27=
700=20
00000000 c7c27700
[  302.312683] dde0: 00000000 bf214770 c8d9de18 bf2146fc 00000000 bf21b=
764=20
c7c27700 c8d9de18
[  302.321197] de00: 00000000 00000000 00000000 ffffffff bf2149c4 bf214=
6fc=20
00000000 00000000
[  302.329742] de20: 00000000 00000000 ffffffff c9dee000 c7f20880 c8d9d=
e78=20
00000001 c8d9c000
[  302.338256] de40: c8ce1000 bf222bdc c9dee000 00000001 c8d9de78 c9ce4=
008=20
c9dee000 c7f20880
[  302.346801] de60: 00000001 c9ce4008 c9ce4038 bf221208 00000000 00000=
000=20
00000000 00000000
[  302.355316] de80: 00000000 0f0ab000 00000000 00000000 00000000 00000=
000=20
c9ce4000 c9ce5000
[  302.363861] dea0: c9e81780 bf227f14 0000005c c9dee000 c9ce5000 c9e81=
780=20
c8d9deec 0000005c
[  302.372375] dec0: c9ce4000 c9ce5000 bea6dc6c bf22759c 000002c7 bea6d=
c6c=20
bea6dc6c c01c675c
[  302.380920] dee0: 00000004 bf220fe8 c9e81780 0000005c 0000001c bea6d=
c9c=20
00000054 bea6dcf0
[  302.389465] df00: 00000008 00000001 40234000 00000000 caa83240 c00eb=
8f0=20
c6dde800 c00ec304
[  302.397979] df20: c8c1ebcc 00000000 caa83240 800000f9 00000000 c026e=
a28=20
40048000 00000001
[  302.406524] df40: 40049000 00000001 40048000 c8c1ebb0 c8c1ebd0 c8c1e=
bcc=20
caa83240 020e40fb
[  302.415039] df60: caa83240 00000000 caa83240 bea6dc6c c01c675c 00000=
004=20
c8d9c000 00000000
[  302.423583] df80: 00000000 c00ec3a4 00000004 00000000 4018b6a8 bea6e=
1bc=20
bea6dcf0 00000036
[  302.432098] dfa0: c000d6e4 c000d560 4018b6a8 bea6e1bc 00000004 c01c6=
75c=20
bea6dc6c 00000001
[  302.440643] dfc0: 4018b6a8 bea6e1bc bea6dcf0 00000036 bea6e1b8 00000=
000=20
bea6ddb4 00000000
[  302.449157] dfe0: 4012e5d8 bea6dc64 40106ab0 404eacbc 400f0010 00000=
004=20
00ffffff 00ffffff
[  302.457702] [<c0023968>] (omap3_l3_app_irq+0x44/0x130) from [<c00819=
70>]=20
(handle_irq_event_percpu+0x3c/0x21c)
[  302.468048] [<c0081970>] (handle_irq_event_percpu+0x3c/0x21c) from=20=

[<c0081b78>] (handle_irq_event+0x28/0x38)
[  302.478302] [<c0081b78>] (handle_irq_event+0x28/0x38) from [<c0083cc=
8>]=20
(handle_level_irq+0xb4/0xc4)
[  302.487854] [<c0083cc8>] (handle_level_irq+0xb4/0xc4) from [<c008147=
4>]=20
(generic_handle_irq+0x20/0x30)
[  302.497558] [<c0081474>] (generic_handle_irq+0x20/0x30) from [<c000d=
df4>]=20
(handle_IRQ+0x60/0x84)
[  302.506744] [<c000ddf4>] (handle_IRQ+0x60/0x84) from [<c050b4b4>]=20=

(__irq_svc+0x34/0x78)
[  302.515106] [<c050b4b4>] (__irq_svc+0x34/0x78) from [<c0039364>]=20
(oops_exit+0x0/0x2c)
[  302.523284] [<c0039364>] (oops_exit+0x0/0x2c) from [<0000000b>] (0xb=
)
[  302.529998] Code: e0044002 e0055003 e1940005 0a000003 (e7f001f2)=20
[  302.536926] ---[ end trace 243a09abb4200bb9 ]---
[  302.541748] Kernel panic - not syncing: Fatal exception in interrupt=

[  302.548522] [<c00120dc>] (unwind_backtrace+0x0/0xe0) from [<c050342c=
>]=20
(panic+0x50/0x188)
[  302.557159] [<c050342c>] (panic+0x50/0x188) from [<c00107fc>]=20
(die+0x1a8/0x1e4)
[  302.564941] [<c00107fc>] (die+0x1a8/0x1e4) from [<c00084cc>]=20
(do_undefinstr+0x148/0x168)
[  302.573516] [<c00084cc>] (do_undefinstr+0x148/0x168) from [<c050b56c=
>]=20
(__und_svc_finish+0x0/0x14)
[  302.583007] Exception stack(0xc8d9dae0 to 0xc8d9db28)
[  302.588287] dae0: 00800000 cd073980 00000004 00800000 00000000 00800=
000=20
00000000 00000000
[  302.596954] db00: c06721e1 000000ff cd004600 c084e2e4 ccc00000 c8d9d=
b68=20
c0081970 c0023968
[  302.605621] db20: 200f0193 ffffffff
[  302.609375] [<c050b56c>] (__und_svc_finish+0x0/0x14) from [<c0023968=
>]=20
(omap3_l3_app_irq+0x44/0x130)
[  302.619079] [<c0023968>] (omap3_l3_app_irq+0x44/0x130) from [<c00819=
70>]=20
(handle_irq_event_percpu+0x3c/0x21c)
[  302.629547] [<c0081970>] (handle_irq_event_percpu+0x3c/0x21c) from=20=

[<c0081b78>] (handle_irq_event+0x28/0x38)
[  302.639923] [<c0081b78>] (handle_irq_event+0x28/0x38) from [<c0083cc=
8>]=20
(handle_level_irq+0xb4/0xc4)
[  302.649627] [<c0083cc8>] (handle_level_irq+0xb4/0xc4) from [<c008147=
4>]=20
(generic_handle_irq+0x20/0x30)
[  302.659454] [<c0081474>] (generic_handle_irq+0x20/0x30) from [<c000d=
df4>]=20
(handle_IRQ+0x60/0x84)
[  302.668762] [<c000ddf4>] (handle_IRQ+0x60/0x84) from [<c050b4b4>]=20=

(__irq_svc+0x34/0x78)
[  302.677246] [<c050b4b4>] (__irq_svc+0x34/0x78) from [<c0039364>]=20
(oops_exit+0x0/0x2c)
[  302.685577] [<c0039364>] (oops_exit+0x0/0x2c) from [<0000000b>] (0xb=
)


