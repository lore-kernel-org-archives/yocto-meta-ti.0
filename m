Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8303E0142B
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 05:33:04 -0700 (PDT)
Received: by lagz14 with SMTP id z14so2838306lag.35
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 05:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=I2kpqtSzblmsTFGTL9JWHTN9blIeraFvLux2XIU2lB0=;
	b=IAUftzXQ89urDmbKgUO7XrdZ/644lD00GAuPyGDu9q/kxTuGn58i3x8nBIgeAxgtbg
	i+Am4JpExDxiVxdGT70fEzgJLmdtwfsa2lju61+CPe4eLKP744LKoDsznWqES++2pXs1
	CjzdFIwuVkfE5tVBj3nIs9lJlEnU2kPekGN0qQqvZRX7ixEu9Q9jCTRFvQzmiqx6V4Ha
	q4vj1QuUuNkn1BC38Je7Cbb/EMogCybOijMpPeONQ34fP/rpe6BSL+QTsxBmnmz2y8s9
	xQR+k1qbls6mR8YJIBzbgDDJpg7ElVfjV0tCwfmJOf7H0QKcogSWOew4P35Mm6wtrIo8
	lQrA==
MIME-Version: 1.0
Received: by 10.152.148.234 with SMTP id tv10mr10864993lab.41.1337344383167;
	Fri, 18 May 2012 05:33:03 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 05:33:03 -0700 (PDT)
Date: Fri, 18 May 2012 14:33:03 +0200
Message-ID: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org, meta-ti@yoctoproject.org
X-Gm-Message-State: ALoCoQkh3oU9MwmyBAnb0pazKz5Y9FBd4HMJmEXb1EbOv0pg4Z/JWavMV4iYdnPCOw74Ec1vJaVQ
Subject: ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 12:33:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello *.*,

sorry for the cross-post (openembedded-devel, meta-ti), I think this
affects both projects one way or the other.

Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This
means with oe-core + meta-oe you now can choose between gcc-4.6 and
gcc-4.7. However, both compilers break the kernel we're using
(ti81xx-psp-linux-2.6.37).

Firstly, it is necessary to add the compiler flag
"-mno-unaligned-access" to the kernel build, or else the kernel would
not boot at all[1]. After adding this flag (e.g. by setting '
KERNEL_CC_append +=3D "-mno-unaligned-access " ' in the kernel recipe)
the kernel boots but fails with a NULL pointer access before it
reaches user space (see boot log at [2]).

With the departure of gcc-4.5 there's currently no way to build a
working kernel for a TI dm81xx system.

Steps to reproduce the issue:

0. First you'll need a ti8148-evm board to test the kernel on

1. check out our layer configuration:
    git clone git://github.com/DFE/HidaV.git; cd HidaV

2. get the other layers, init build env:
    . ./hidav-init .

3. disable gcc-4.5 for the build:
    sed -i -e 's/^ANGSTROM_GCC_VERSION/# ANGSTROM_GCC_VERSION/'
meta-hidav/conf/machine/hidav.conf

4. build the kernel:
    bitbake virtual/linux

5. Boot the kernel on your  ti8148-evm evaluation board; see it crash


Just to stress my point once more: we currently have no way to build a
sane kernel for TI 8148 based systems with latest oe-core, meta-oe,
and Angstrom.

Regards,
Thilo



Appendix
--------------

[1] <http://git.freesmartphone.org/?p=3Dlinux-2.6.git;a=3Dcommit;h=3D78ffc8=
1db8911acdabd026ad3fdefa20b4e34e52>
[2] Faulty Kernel Boot Log:

---------- SNIPP ----------
Uncompressing Linux... done, booting the kernel.
[    0.000000] Linux version 2.6.37
(maniac@bfg9000.internal.dresearch-fe.de) (gcc version 4.6.4 20120303
(prerelease) (GCC) ) #2 Fri May 18 13:10:18 CEST 2012
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c=
53c7f
[    0.000000] CPU: VIPT nonaliasing data cache, VIPT aliasing instruction =
cache
[    0.000000] Machine: ti8148evm
[    0.000000] vram size =3D 52428800 at 0x0
[    0.000000] reserved size =3D 52428800 at 0x0
[    0.000000] FB: Reserving 52428800 bytes SDRAM for VRAM
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] OMAP chip is TI8148 2.0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 247296
[    0.000000] Kernel command line: console=3DttyO0,115200n8 rootwait
root=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 mem=3D1024M earlyprink vram=3D50=
M
ip=3Doff noinitrd user_debug=3D255 systemd.log_target=3Dkmsg
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s)
[    0.000000] Memory: 974MB =3D 974MB total
[    0.000000] Memory: 982772k/982772k available, 65804k reserved,
210944K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
[    0.000000]     vmalloc : 0xf0800000 - 0xf8000000   ( 120 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .init : 0xc0008000 - 0xc0052000   ( 296 kB)
[    0.000000]       .text : 0xc0052000 - 0xc04d2000   (4608 kB)
[    0.000000]       .data : 0xc04d2000 - 0xc05154e0   ( 270 kB)
[    0.000000] SLUB: Genslabs=3D11, HWalign=3D64, Order=3D0-3, MinObjects=
=3D0,
CPUs=3D1, Nodes=3D1
[    0.000000] NR_IRQS:407
[    0.000000] IRQ: Found an INTC at 0xfa200000 (revision 5.0) with
128 interrupts
[    0.000000] Total of 128 interrupts on 1 active controller
[    0.000000] GPMC revision 6.0
[    0.000000] Trying to install interrupt handler for IRQ400
[    0.000000] Trying to install interrupt handler for IRQ401
[    0.000000] Trying to install interrupt handler for IRQ402
[    0.000000] Trying to install interrupt handler for IRQ403
[    0.000000] Trying to install interrupt handler for IRQ404
[    0.000000] Trying to install interrupt handler for IRQ405
[    0.000000] Trying to install interrupt handler for IRQ406
[    0.000000] Trying to install type control for IRQ407
[    0.000000] Trying to set irq flags for IRQ407
[    0.000000] OMAP clockevent source: GPTIMER1 at 20000000 Hz
[    0.000000] Console: colour dummy device 80x30
[    0.000000] Calibrating delay loop... 598.01 BogoMIPS (lpj=3D2990080)
[    0.220000] pid_max: default: 32768 minimum: 301
[    0.230000] Security Framework initialized
[    0.230000] Mount-cache hash table entries: 512
[    0.230000] CPU: Testing write buffer coherency: ok
[    0.230000] ftrace: allocating 14049 entries in 42 pages
[    0.240000] devtmpfs: initialized
[    0.250000] omap_voltage_early_init: voltage driver support not added
[    0.250000] regulator: core version 0.5
[    0.250000] regulator: dummy:
[    0.250000] NET: Registered protocol family 16
[    0.250000] OMAP GPIO hardware version 0.1
[    0.250000] OMAP GPIO hardware version 0.1
[    0.250000] OMAP GPIO hardware version 0.1
[    0.250000] OMAP GPIO hardware version 0.1
[    0.260000] omap_mux_init: Add partition: #1: core, flags: 4
[    0.270000] registered ti814x_vpss device
[    0.270000] registered TI814x on-chip HDMI device
[    0.280000] registered ti81xx_vidout device
[    0.290000] Debugfs: Only enabling/disabling deep sleep and wakeup
timer is supported now
[    0.290000] ti81xx_pcie: Invoking PCI BIOS...
[    0.290000] ti81xx_pcie: Setting up Host Controller...
[    0.290000] ti81xx_pcie: Register base mapped @0xf0820000
[    0.400000] ti81xx_pcie: Starting PCI scan...
[    0.400000] PCI: bus0: Fast back to back transfers enabled
[    0.410000] bio: create slab <bio-0> at 0
[    0.410000] vgaarb: loaded
[    0.410000] SCSI subsystem initialized
[    0.420000] usbcore: registered new interface driver usbfs
[    0.420000] usbcore: registered new interface driver hub
[    0.420000] usbcore: registered new device driver usb
[    0.420000] registerd cppi-dma Intr @ IRQ 17
[    0.420000] Cppi41 Init Done
[    0.420000] omap_i2c omap_i2c.1: bus 1 rev4.0 at 100 kHz
[    0.420000] pcf857x 1-0021: gpios 128..143 on a pcf8575
[    0.420000] omap_i2c omap_i2c.3: bus 3 rev4.0 at 100 kHz
[    0.430000] Switching to clocksource gp timer
[    0.490000] musb-hdrc: version 6.0, host, debug=3D0
[    0.500000] musb-hdrc musb-hdrc.0: dma type: dma-cppi41
[    0.500000] musb-hdrc musb-hdrc.0: MUSB HDRC host driver
[    0.500000] musb-hdrc musb-hdrc.0: new USB bus registered, assigned
bus number 1
[    0.500000] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    0.500000] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.500000] usb usb1: Product: MUSB HDRC host driver
[    0.500000] usb usb1: Manufacturer: Linux 2.6.37 musb-hcd
[    0.500000] usb usb1: SerialNumber: musb-hdrc.0
[    0.500000] hub 1-0:1.0: USB hub found
[    0.500000] hub 1-0:1.0: 1 port detected
[    0.500000] musb-hdrc musb-hdrc.0: USB Host mode controller at
f081e000 using DMA, IRQ 18
[    0.500000] musb-hdrc musb-hdrc.1: dma type: dma-cppi41
[    0.500000] musb-hdrc musb-hdrc.1: MUSB HDRC host driver
[    0.500000] musb-hdrc musb-hdrc.1: new USB bus registered, assigned
bus number 2
[    0.500000] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    0.500000] usb usb2: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    0.500000] usb usb2: Product: MUSB HDRC host driver
[    0.500000] usb usb2: Manufacturer: Linux 2.6.37 musb-hcd
[    0.500000] usb usb2: SerialNumber: musb-hdrc.1
[    0.500000] hub 2-0:1.0: USB hub found
[    0.500000] hub 2-0:1.0: 1 port detected
[    0.510000] musb-hdrc musb-hdrc.1: USB Host mode controller at
f0826800 using DMA, IRQ 19
[    0.510000] NET: Registered protocol family 2
[    0.510000] IP route cache hash table entries: 32768 (order: 5, 131072 b=
ytes)
[    0.510000] TCP established hash table entries: 131072 (order: 8,
1048576 bytes)
[    0.510000] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
[    0.510000] TCP: Hash tables configured (established 131072 bind 65536)
[    0.510000] TCP reno registered
[    0.510000] UDP hash table entries: 512 (order: 1, 8192 bytes)
[    0.510000] UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
[    0.510000] NET: Registered protocol family 1
[    0.510000] PMU: registered new PMU device of type 0
[    0.510000] omap-iommu omap-iommu.0: ducati registered
[    0.510000] omap-iommu omap-iommu.1: sys registered
[    0.610000] highmem bounce pool size: 64 pages
[    0.630000] VFS: Disk quotas dquot_6.5.2
[    0.630000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.640000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.640000] aufs 2.2-standalone.tree-37-20120326
[    0.640000] msgmni has been set to 1507
[    0.640000] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 253)
[    0.640000] io scheduler noop registered
[    0.640000] io scheduler deadline registered
[    0.640000] io scheduler cfq registered (default)
[    0.640000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.650000] omap_uart.0: ttyO0 at MMIO 0x48020000 (irq =3D 72) is a OMAP=
 UART0
[    1.360000] console [ttyO0] enabled
[    1.370000] omap_uart.1: ttyO1 at MMIO 0x48022000 (irq =3D 73) is a OMAP=
 UART1
[    1.380000] omap_uart.2: ttyO2 at MMIO 0x48024000 (irq =3D 74) is a OMAP=
 UART2
[    1.380000] omap_uart.3: ttyO3 at MMIO 0x481a6000 (irq =3D 44) is a OMAP=
 UART3
[    1.390000] omap_uart.4: ttyO4 at MMIO 0x481a8000 (irq =3D 45) is a OMAP=
 UART4
[    1.400000] omap_uart.5: ttyO5 at MMIO 0x481aa000 (irq =3D 46) is a OMAP=
 UART5
[    1.430000] brd: module loaded
[    1.450000] loop: module loaded
[    1.450000] ahci ahci.0: forcing PORTS_IMPL to 0x1
[    1.460000] ahci ahci.0: AHCI 0001.0300 32 slots 1 ports 3 Gbps 0x1
impl platform mode
[    1.460000] ahci ahci.0: flags: ncq sntf pm led clo only pmp pio
slum part ccc apst
[    1.480000] scsi0 : ahci_platform
[    1.480000] ata1: SATA max UDMA/133 mmio [mem
0x4a140000-0x4a150fff] port 0x100 irq 16
[    1.490000] omap2-nand driver initializing
[    1.490000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xcc (Micron )
[    1.500000] Creating 7 MTD partitions on "omap2-nand.0":
[    1.510000] 0x000000000000-0x000000100000 : "bootloader"
[    1.520000] 0x000000100000-0x000000200000 : "bootconfig"
[    1.530000] 0x000000200000-0x000000c00000 : "kernel1"
[    1.540000] blockrom0:   1024 KiB; EBs      8 user,      0 spare,
   0 mgmt,      0 bad,      8 toal
[    1.550000] blockrom1:   1024 KiB; EBs      8 user,      0 spare,
   0 mgmt,      0 bad,      8 toal
[    1.570000] 0x000000c00000-0x000001600000 : "kernel2"
[    1.580000] 0x000001600000-0x000007a00000 : "rootfs1"
[    1.630000] blockrom3:  10240 KiB; EBs     80 user,      0 spare,
   0 mgmt,      0 bad,     80 toal
[    1.650000] blockrom2:  10240 KiB; EBs     80 user,      0 spare,
   0 mgmt,      0 bad,     80 toal
[    1.700000] 0x000007a00000-0x00000de00000 : "rootfs2"
[    1.750000] blockrom4: 102272 KiB; EBs    799 user,      0 spare,
   0 mgmt,      1 bad,    800 toal
[    1.800000] blockrom5: 101760 KiB; EBs    795 user,      0 spare,
   0 mgmt,      5 bad,    800 toal
[    1.810000] 0x00000de00000-0x000020000000 : "application_fs"
[    1.940000] ata1: SATA link down (SStatus 0 SControl 300)
[    2.070000] blockrom6: 295296 KiB; EBs   2307 user,      0 spare,
   0 mgmt,     13 bad,   2320 toal
[    2.120000] davinci_mdio davinci_mdio.0: davinci mdio revision 1.6
[    2.120000] davinci_mdio davinci_mdio.0: detected phy mask fffffffc
[    2.130000] davinci_mdio.0: probed
[    2.130000] davinci_mdio davinci_mdio.0: phy[0]: device 0:00, driver unk=
nown
[    2.140000] davinci_mdio davinci_mdio.0: phy[1]: device 0:01, driver unk=
nown
[    2.150000] usbcore: registered new interface driver cdc_ether
[    2.160000] usbcore: registered new interface driver dm9601
[    2.160000] usbcore: registered new interface driver cdc_acm
[    2.170000] cdc_acm: v0.26:USB Abstract Control Model driver for
USB modems and ISDN adapters
[    2.180000] Initializing USB Mass Storage driver...
[    2.180000] usbcore: registered new interface driver usb-storage
[    2.190000] USB Mass Storage support registered.
[    2.190000] mice: PS/2 mouse device common for all mice
[    2.420000] qt602240_ts 1-004a: Family ID: 128 Variant ID: 1
Version: 22 Build: 171
[    2.430000] qt602240_ts 1-004a: Matrix X Size: 18 Matrix Y Size: 12
Object Num: 17
[    2.440000] input: AT42QT602240/ATMXT224 Touchscreen as
/devices/platform/omap/omap_i2c.1/i2c-1/1-004a/input/input0
[    2.450000] omap_rtc omap_rtc: rtc core: registered omap_rtc as rtc0
[    2.460000] i2c /dev entries driver
[    2.460000] OMAP Watchdog Timer Rev 0x00: initial timeout 60 sec
[    2.470000] usbcore: registered new interface driver usbhid
[    2.480000] usbhid: USB HID core driver
[    2.480000] Unable to handle kernel NULL pointer dereference at
virtual address 00000002
[    2.490000] pgd =3D c0004000
[    2.490000] [00000002] *pgd=3D00000000
[    2.500000] Internal error: Oops: 5 [#1]
[    2.500000] last sysfs file:
[    2.500000] Modules linked in:
[    2.500000] CPU: 0    Not tainted  (2.6.37 #2)
[    2.500000] PC is at strcmp+0xc/0x40
[    2.500000] LR is at omap_mbox_get+0x44/0x1d8
[    2.500000] pc : [<c0212b6c>]    lr : [<c00784ec>]    psr: a0000013
[    2.500000] sp : ef85bef8  ip : ef85bf08  fp : ef85bf04
[    2.500000] r10: c03246f4  r9 : 00000000  r8 : 00000040
[    2.500000] r7 : ef85bf44  r6 : c046bc75  r5 : c050ba68  r4 : c04e8d14
[    2.500000] r3 : 00000064  r2 : 00000076  r1 : c046bc75  r0 : 00000002
[    2.500000] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[    2.500000] Control: 10c5387d  Table: 80004019  DAC: 00000017
[    2.500000] Process swapper (pid: 1, stack limit =3D 0xef85a2e8)
[    2.500000] Stack: (0xef85bef8 to 0xef85c000)
[    2.500000] bee0:
    ef85bf2c ef85bf08
[    2.500000] bf00: c00784ec c0212b6c c0320944 c0212b6c 00000000
c050ba0c c050ba08 00000000
[    2.500000] bf20: ef85bf74 ef85bf30 c0324854 c00784b4 00000000
00000000 00000020 ffffffff
[    2.500000] bf40: 00000001 00000000 00000000 c002ec58 c00285c8
00000000 00000013 00000000
[    2.500000] bf60: 00000000 00000000 ef85bfa4 ef85bf78 c0028604
c0324650 ef85a000 c002ec58
[    2.500000] bf80: c00285c8 00000000 00000013 00000000 00000000
00000000 ef85bfdc ef85bfa8
[    2.500000] bfa0: c0052450 c00285d4 ef85bfc4 00000196 c04f5904
c00c07d0 c002ec58 c002ecdc
[    2.500000] bfc0: c00841cc 00000013 00000000 00000000 ef85bff4
ef85bfe0 c0008d20 c0052394
[    2.500000] bfe0: 00000000 c0008c80 00000000 ef85bff8 c00841cc
c0008c8c 69782969 7979f961
[    2.500000] Backtrace:
[    2.500000] [<c0212b60>] (strcmp+0x0/0x40) from [<c00784ec>]
(omap_mbox_get+0x44/0x1d8)
[    2.500000] [<c00784a8>] (omap_mbox_get+0x0/0x1d8) from
[<c0324854>] (notify_shm_drv_setup+0x210/0x2f0)
[    2.500000]  r6:00000000 r5:c050ba08 r4:c050ba0c
[    2.500000] [<c0324644>] (notify_shm_drv_setup+0x0/0x2f0) from
[<c0028604>] (notify_init+0x3c/0x2b0)
[    2.500000] [<c00285c8>] (notify_init+0x0/0x2b0) from [<c0052450>]
(do_one_initcall+0xc8/0x1a0)
[    2.500000] [<c0052388>] (do_one_initcall+0x0/0x1a0) from
[<c0008d20>] (kernel_init+0xa0/0x14c)
[    2.500000]  r9:00000000 r8:00000000 r7:00000013 r6:c00841cc r5:c002ecdc
[    2.500000] r4:c002ec58
[    2.500000] [<c0008c80>] (kernel_init+0x0/0x14c) from [<c00841cc>]
(do_exit+0x0/0x658)
[    2.500000]  r5:c0008c80 r4:00000000
[    2.500000] Code: e89da800 e1a0c00d e92dd800 e24cb004 (e4d03001)
[    2.730000] ---[ end trace ffdc45ac5a6696b9 ]---
[    2.740000] Kernel panic - not syncing: Attempted to kill init!
[    2.750000] Backtrace:
[    2.750000] [<c005ad34>] (dump_backtrace+0x0/0x118) from
[<c03a5014>] (dump_stack+0x20/0x24)
[    2.760000]  r6:ef85a000 r5:c04ec558 r4:c0515ce0 r3:07730fa7
[    2.760000] [<c03a4ff4>] (dump_stack+0x0/0x24) from [<c03a522c>]
(panic+0x64/0x184)
[    2.770000] [<c03a51c8>] (panic+0x0/0x184) from [<c008423c>]
(do_exit+0x70/0x658)
[    2.780000]  r3:c04ec558 r2:ef85bd18 r1:0000002e r0:c046e2e2
[    2.780000]  r7:ef85c000
[    2.790000] [<c00841cc>] (do_exit+0x0/0x658) from [<c005b25c>]
(die+0x1a4/0x1d0)
[    2.790000]  r7:00000001
[    2.800000] [<c005b0b8>] (die+0x0/0x1d0) from [<c03a507c>]
(__do_kernel_fault.part.1+0x64/0x84)
[    2.810000]  r8:00000005 r7:ef85beb0 r6:00000000 r5:00000005 r4:00000002
[    2.810000] [<c03a5018>] (__do_kernel_fault.part.1+0x0/0x84) from
[<c03ac66c>] (do_page_fault+0x204/0x220)
[    2.820000]  r7:00000000 r3:ef85beb0
[    2.830000] [<c03ac468>] (do_page_fault+0x0/0x220) from
[<c03ac6b4>] (do_translation_fault+0x2c/0xb0)
[    2.840000] [<c03ac688>] (do_translation_fault+0x0/0xb0) from
[<c0052278>] (do_DataAbort+0x44/0xa8)
[    2.850000]  r7:ef85beb0 r6:00000002 r5:c04d6510 r4:00000005
[    2.850000] [<c0052234>] (do_DataAbort+0x0/0xa8) from [<c03aa56c>]
(__dabt_svc+0x4c/0x60)
[    2.860000] Exception stack(0xef85beb0 to 0xef85bef8)
[    2.870000] bea0:                                     00000002
c046bc75 00000076 00000064
[    2.870000] bec0: c04e8d14 c050ba68 c046bc75 ef85bf44 00000040
00000000 c03246f4 ef85bf04
[    2.880000] bee0: ef85bf08 ef85bef8 c00784ec c0212b6c a0000013 ffffffff
[    2.890000]  r7:ef85bf44 r6:c046bc75 r5:ef85bee4 r4:ffffffff
[    2.900000] [<c0212b60>] (strcmp+0x0/0x40) from [<c00784ec>]
(omap_mbox_get+0x44/0x1d8)
[    2.900000] [<c00784a8>] (omap_mbox_get+0x0/0x1d8) from
[<c0324854>] (notify_shm_drv_setup+0x210/0x2f0)
[    2.910000]  r6:00000000 r5:c050ba08 r4:c050ba0c
[    2.920000] [<c0324644>] (notify_shm_drv_setup+0x0/0x2f0) from
[<c0028604>] (notify_init+0x3c/0x2b0)
[    2.930000] [<c00285c8>] (notify_init+0x0/0x2b0) from [<c0052450>]
(do_one_initcall+0xc8/0x1a0)
[    2.940000] [<c0052388>] (do_one_initcall+0x0/0x1a0) from
[<c0008d20>] (kernel_init+0xa0/0x14c)
[    2.950000]  r9:00000000 r8:00000000 r7:00000013 r6:c00841cc r5:c002ecdc
[    2.950000] r4:c002ec58
[    2.960000] [<c0008c80>] (kernel_init+0x0/0x14c) from [<c00841cc>]
(do_exit+0x0/0x658)
[    2.970000]  r5:c0008c80 r4:00000000

---------- SNIPP ----------


--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

