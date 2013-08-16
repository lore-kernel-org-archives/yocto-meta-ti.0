Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E055E002F9
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 13:58:40 -0700 (PDT)
Received: by mail-oa0-f52.google.com with SMTP id n12so407995oag.39
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Rr4qRjZ73NSkQRCPdlvP6eiNdsB87XzDSk9LUOu//IA=;
	b=eI4dGq3srYevh6wiK1F8mFYrvlM3Y4GVF11Y7zPvHoNAOif2YcLhF3kXsNyaJcOqo8
	PZbhIPtmF0UAdbqnxYSjnCdEqyN4v8kSDo4rkTy9DppxPiOqfDX5eQOHh5Dwu7LYoTWp
	GQPjCNH4LY+2DmYRlnMyvoudYy/+sTvgr1zTe4pgeiEK2nChS1zh3ZdbYe4yeJdbE2zm
	vONAishQPbGal5qujpsruHxAWxP/8/1AjDos9Eap0Vmk+4SDwRJW4ncHznRMh+GAnu0v
	4YrzunQfklS+m5PSQF5vb2TXO6DqhrHApLi4UckW5n+uhpdWwyw7V+ZL6OZ/52H/Ambv
	Nl2A==
MIME-Version: 1.0
X-Received: by 10.182.106.114 with SMTP id gt18mr243867obb.77.1376686719895;
	Fri, 16 Aug 2013 13:58:39 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 13:58:39 -0700 (PDT)
In-Reply-To: <CAMKF1sou67WNchV35N3bhSPmjW+zGxMYf+ybBojw=kbWENOBPw@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h_hTjd-5AC7abRF3rd9zeDBS4j_fRRZEW4eH+nGn8s9_w@mail.gmail.com>
	<CAMKF1sou67WNchV35N3bhSPmjW+zGxMYf+ybBojw=kbWENOBPw@mail.gmail.com>
Date: Fri, 16 Aug 2013 16:58:39 -0400
Message-ID: <CAFZh4h8sm+V_QrvsdxiTmZC-k0+oeMc6haAB9kTmDNnLtqyQcg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Christopher Larson <clarson@kergoth.com>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Fri, 16 Aug 2013 20:58:44 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1fe36e80db104e416da9f

--e89a8fb1fe36e80db104e416da9f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 11:37 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinson <b.hutchman@gmail.com>w=
rote:
>
>>  At this point I'm using the toolchains outside of OE (meta-toolchain
>> from denzil branch and Linaro 4.8) to make life a bit simpler.
>
>
>
> =E2=80=8Bcan you use the the toolchain from OE-Core and see if it happens=
 with
> that too ?=E2=80=8B
>
>
OK, that kept me busy for a while.  I built core-image-minimal -c
populate_sdk with OE Core + meta-ti and installed that on my application
development machine (bitbake build server is debian 7.1 64bit, app
development machine (behind firewall, slow network connection etc. is
Ubuntu 12.04 LTS 32 bit for running Code Composer etc.)

So after installing oecore-i686-armv7a-vfp-neon-toolchain-oe-core.0.sh (I
know, I went the long way around doing this ... don't ask :) ) I built my
2.6.37 kernel that I patched memset earlier.  Different result this time.
 Looks a bit different.  Boots but dies in the same place but with a
slightly different message (I still see a bunch of mbox stuff in there
hmmm):

## Booting kernel from Legacy Image at 83000000 ...
   Image Name:   Linux-2.6.37+
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2348304 Bytes =3D 2.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.37+ (hutch@Strider) (gcc version 4.8.1 (GCC) ) #1 Fri Aug
16 16:33:18 EDT 2013
CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c53c7d
CPU: VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine: ti8168evm
reserved size =3D 0 at 0x0
Memory policy: ECC disabled, Data cache writeback
OMAP chip is TI8168 2.0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 42164
Kernel command line: mem=3D166M console=3DttyO2,115200n8 noinitrd
ip=3D192.168.1.1:192.168.1.5:192.168.1.0:255.255.255.0:255.255.255.1:eth0:o=
ff
eth=3D84:7e:40:d6:a7:5e root=3D/dev/nfs nfsroot=3D192.168.1.5:
/home/hutch/ione_wcs_yocto_test/trunk/arm/rootfs
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 166MB =3D 166MB total
Memory: 163444k/163444k available, 6540k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xca800000 - 0xf8000000   ( 728 MB)
    lowmem  : 0xc0000000 - 0xca600000   ( 166 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc0037000   ( 188 kB)
      .text : 0xc0037000 - 0xc0466000   (4284 kB)
      .data : 0xc0466000 - 0xc04a20c0   ( 241 kB)
SLUB: Genslabs=3D11, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
NR_IRQS:407
IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrupts
Total of 128 interrupts on 1 active controller
GPMC revision 6.0
Trying to install interrupt handler for IRQ400
Trying to install interrupt handler for IRQ401
Trying to install interrupt handler for IRQ402
Trying to install interrupt handler for IRQ403
Trying to install interrupt handler for IRQ404
Trying to install interrupt handler for IRQ405
Trying to install interrupt handler for IRQ406
Trying to install type control for IRQ407
Trying to set irq flags for IRQ407
OMAP clockevent source: GPTIMER1 at 27000000 Hz
Console: colour dummy device 80x30
Calibrating delay loop... 986.31 BogoMIPS (lpj=3D4931584)
pid_max: default: 32768 minimum: 301
Security Framework initialized
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
devtmpfs: initialized
omap_voltage_early_init: voltage driver support not added
regulator: core version 0.5
regulator: dummy:
NET: Registered protocol family 16
omap_voltage_domain_lookup: Voltage driver init not yet happened.Faulting!
omap_voltage_add_dev: VDD specified does not exist!
OMAP GPIO hardware version 0.1
OMAP GPIO hardware version 0.1
configure pinmux for RS485. etc
omap_mux_init: Add partition: #1: core, flags: 0
_omap_mux_get_by_name: Could not find signal i2c2_scl.i2c2_scl
_omap_mux_get_by_name: Could not find signal i2c2_sda.i2c2_sda
registered NOR flash on CS1 (second NOR)
registered ti816x_sram_procfs_bootcount device
dsa:  initialize distributed switch architecture (dsa) marvell (mv)
ethernet switch
dsa:  dsa_on_flag=3D1
pm_dbg_init: only OMAP3 supported
bio: create slab <bio-0> at 0
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
USBSS revision 4ea20809
registerd cppi-dma Intr @ IRQ 17
Cppi41 Init Done
omap_i2c omap_i2c.1: bus 1 rev4.0 at 100 kHz
omap_i2c omap_i2c.2: bus 2 rev4.0 at 100 kHz
i2c i2c-2: Invalid 7-bit I2C address 0x00
i2c i2c-2: Can't create device at 0x00
Switching to clocksource gp timer
musb-hdrc: version 6.0, host, debug=3D0
musb-hdrc musb-hdrc.0: dma type: dma-cppi41
MUSB controller-0 revision 4ea20800
musb-hdrc musb-hdrc.0: MUSB HDRC host driver
musb-hdrc musb-hdrc.0: new USB bus registered, assigned bus number 1
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: MUSB HDRC host driver
usb usb1: Manufacturer: Linux 2.6.37+ musb-hcd
usb usb1: SerialNumber: musb-hdrc.0
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
musb-hdrc musb-hdrc.0: USB Host mode controller at ca822000 using DMA, IRQ
18
musb-hdrc musb-hdrc.1: dma type: dma-cppi41
MUSB controller-1 revision 4ea20800
musb-hdrc musb-hdrc.1: MUSB HDRC host driver
musb-hdrc musb-hdrc.1: new USB bus registered, assigned bus number 2
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: MUSB HDRC host driver
usb usb2: Manufacturer: Linux 2.6.37+ musb-hcd
usb usb2: SerialNumber: musb-hdrc.1
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
musb-hdrc musb-hdrc.1: USB Host mode controller at ca826800 using DMA, IRQ
19
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
NetWinder Floating Point Emulator V0.97 (double precision)
omap-iommu omap-iommu.0: ducati registered
omap-iommu omap-iommu.1: sys registered
squashfs: version 4.0 (2009/01/31) Phillip Lougher
JFFS2 version 2.2. (NAND) =EF=BF=BD=C2=A9 2001-2006 Red Hat, Inc.
msgmni has been set to 319
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
omap_uart.0: ttyO0 at MMIO 0x48020000 (irq =3D 72) is a OMAP UART0
omap_uart.1: ttyO1 at MMIO 0x48022000 (irq =3D 73) is a OMAP UART1
omap_uart.2: ttyO2 at MMIO 0x48024000 (irq =3D 74) is a OMAP UART2
console [ttyO2] enabled
brd: module loaded
loop: module loaded
physmap platform flash device: 08000000 at 08000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID
0x000001 Chip ID 0x002801
Amd/Fujitsu Extended Query Table at 0x0040
  Amd/Fujitsu Extended Query version 1.5.
Enabling Spansion 65nm mode, writesize =3D 512 bytes
number of CFI chips: 1
RedBoot partition parsing not available
Using physmap partition information
Creating 8 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000040000 : "u-boot"
0x000000040000-0x000000060000 : "u-boot_env1"
0x000000060000-0x000000080000 : "u-boot_env2"
0x000000080000-0x0000000a0000 : "pad1"
0x0000000a0000-0x0000004a0000 : "kernel_1"
0x0000004a0000-0x0000036a0000 : "rootfs_1"
0x0000036a0000-0x0000068a0000 : "appfs_1"
0x0000068a0000-0x000007b60000 : "overlay_1"
physmap platform flash device: 08000000 at 10000000
physmap-flash.1: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID
0x000001 Chip ID 0x002801
Amd/Fujitsu Extended Query Table at 0x0040
  Amd/Fujitsu Extended Query version 1.5.
Enabling Spansion 65nm mode, writesize =3D 512 bytes
number of CFI chips: 1
RedBoot partition parsing not available
Using physmap partition information
Creating 8 MTD partitions on "physmap-flash.1":
0x000000000000-0x000000040000 : "u-boot"
0x000000040000-0x000000060000 : "u-boot_env1"
0x000000060000-0x000000080000 : "u-boot_env2"
0x000000080000-0x0000000a0000 : "pad2"
0x0000000a0000-0x0000004a0000 : "kernel_2"
0x0000004a0000-0x0000036a0000 : "rootfs_2"
0x0000036a0000-0x0000068a0000 : "appfs_2"
0x0000068a0000-0x000007b60000 : "overlay_2"
davinci_mdio davinci_mdio.0: davinci mdio revision 1.6
davinci_mdio davinci_mdio.0: detected phy mask fffffffc
davinci_mdio.0: probed
davinci_mdio davinci_mdio.0: phy[0]: device 0:00, driver unknown
davinci_mdio davinci_mdio.0: phy[1]: device 0:01, driver unknown
PPP generic driver version 2.4.2
usbcore: registered new interface driver asix
usbcore: registered new interface driver cdc_ether
usbcore: registered new interface driver dm9601
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
uhci_hcd: USB Universal Host Controller Interface driver
usbcore: registered new interface driver uas
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver ums-alauda
usbcore: registered new interface driver ums-cypress
usbcore: registered new interface driver ums-datafab
usbcore: registered new interface driver ums-freecom
usbcore: registered new interface driver ums-isd200
usbcore: registered new interface driver ums-jumpshot
usbcore: registered new interface driver ums-karma
usbcore: registered new interface driver ums-onetouch
usbcore: registered new interface driver ums-sddr09
usbcore: registered new interface driver ums-sddr55
usbcore: registered new interface driver ums-usbat
mice: PS/2 mouse device common for all mice
usb 1-1: new high speed USB device using musb-hdrc and address 2
rtc-ds1307 1-0068: rtc core: registered ds1337 as rtc0
i2c /dev entries driver
OMAP Watchdog Timer Rev 0x00: initial timeout 60 sec
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
Unable to handle kernel NULL pointer dereference at virtual address 0000004=
c
pgd =3D c0004000
[0000004c] *pgd=3D00000000
Internal error: Oops: 5 [#1]
last sysfs file:
Modules linked in:
CPU: 0    Not tainted  (2.6.37+ #1)
PC is at strcmp+0x10/0x48
LR is at omap_mbox_get+0x40/0x1cc
pc : [<c01dcd94>]    lr : [<c0061a50>]    psr: a0000013
sp : ca023f10  ip : ca023f20  fp : ca023f1c
r10: ca022018  r9 : 00000000  r8 : c04a20c0
r7 : c049c5c8  r6 : c04a2798  r5 : c0408919  r4 : c047d898
r3 : 00000000  r2 : 00000064  r1 : c0408919  r0 : 0000004c
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 80004019  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xca0222e8)
Stack: (0xca023f10 to 0xca024000)
3f00:                                     ca023f44 ca023f20 c0061a50
c01dcd90
3f20: c02b67c0 c01dcd90 c049c4a0 c049c56c c049c4a0 c0024ec8 ca023f6c
ca023f48
3f40: c02b9fe4 c0061a1c 00000001 00000000 c002b040 c002b040 c04d1f08
c006a954
3f60: ca023f94 ca023f70 c0024f04 c02b9e70 c002b040 c002b0d0 c006a954
c0024ec8
3f80: c04a20c0 00000000 ca023fd4 ca023f98 c00373b8 c0024ed4 00000036
00000000
3fa0: ca023fbc 00000196 c04896cc c002b040 c002b0d0 c006a954 00000013
00000000
3fc0: 00000000 00000000 ca023ff4 ca023fd8 c0008d68 c003730c 00000000
00000000
3fe0: 00000000 c0008cc0 00000000 ca023ff8 c006a954 c0008ccc eda485b5
b186e796
Backtrace:
[<c01dcd84>] (strcmp+0x0/0x48) from [<c0061a50>] (omap_mbox_get+0x40/0x1cc)
[<c0061a10>] (omap_mbox_get+0x0/0x1cc) from [<c02b9fe4>]
(notify_shm_drv_setup+0x180/0x254)
 r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0
[<c02b9e64>] (notify_shm_drv_setup+0x0/0x254) from [<c0024f04>]
(notify_init+0x3c/0x2a8)
 r6:c006a954 r5:c04d1f08 r4:c002b040
[<c0024ec8>] (notify_init+0x0/0x2a8) from [<c00373b8>]
(do_one_initcall+0xb8/0x180)
 r9:00000000 r8:c04a20c0 r7:c0024ec8 r6:c006a954 r5:c002b0d0
r4:c002b040
[<c0037300>] (do_one_initcall+0x0/0x180) from [<c0008d68>]
(kernel_init+0xa8/0x150)
[<c0008cc0>] (kernel_init+0x0/0x150) from [<c006a954>] (do_exit+0x0/0x5dc)
 r5:c0008cc0 r4:00000000
Code: e1a0c00d e92dd800 e24cb004 e3a03000 (e7d02003)
---[ end trace 599d30e660dbf8fa ]---
Kernel panic - not syncing: Attempted to kill init!
Backtrace:
[<c0044aec>] (dump_backtrace+0x0/0x104) from [<c0351cf0>]
(dump_stack+0x18/0x1c)
 r6:c01dcd96 r5:0000000b r4:c04a2858 r3:ffffffff
[<c0351cd8>] (dump_stack+0x0/0x1c) from [<c0351ee0>] (panic+0x60/0x178)
[<c0351e80>] (panic+0x0/0x178) from [<c006a9c0>] (do_exit+0x6c/0x5dc)
 r3:c0480894 r2:ca020130 r1:00000001 r0:c040ad52
 r7:ca022000
[<c006a954>] (do_exit+0x0/0x5dc) from [<c0044f58>] (die+0x280/0x2bc)
 r7:ca022000
[<c0044cd8>] (die+0x0/0x2bc) from [<c0351d50>]
(__do_kernel_fault.part.4+0x5c/0x7c)
[<c0351cf4>] (__do_kernel_fault.part.4+0x0/0x7c) from [<c035862c>]
(do_page_fault+0x200/0x21c)
 r7:ca020000 r3:ca023ec8
[<c035842c>] (do_page_fault+0x0/0x21c) from [<c035866c>]
(do_translation_fault+0x24/0xa4)
[<c0358648>] (do_translation_fault+0x0/0xa4) from [<c00371f8>]
(do_DataAbort+0x3c/0xa0)
 r7:ca023ec8 r6:0000004c r5:c046a550 r4:00000005
[<c00371bc>] (do_DataAbort+0x0/0xa0) from [<c035672c>]
(__dabt_svc+0x4c/0x60)
Exception stack(0xca023ec8 to 0xca023f10)
3ec0:                   0000004c c0408919 00000064 00000000 c047d898
c0408919
3ee0: c04a2798 c049c5c8 c04a20c0 00000000 ca022018 ca023f1c ca023f20
ca023f10
3f00: c0061a50 c01dcd94 a0000013 ffffffff
 r7:c049c5c8 r6:c04a2798 r5:ca023efc r4:ffffffff
[<c01dcd84>] (strcmp+0x0/0x48) from [<c0061a50>] (omap_mbox_get+0x40/0x1cc)
[<c0061a10>] (omap_mbox_get+0x0/0x1cc) from [<c02b9fe4>]
(notify_shm_drv_setup+0x180/0x254)
 r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0
[<c02b9e64>] (notify_shm_drv_setup+0x0/0x254) from [<c0024f04>]
(notify_init+0x3c/0x2a8)
 r6:c006a954 r5:c04d1f08 r4:c002b040
[<c0024ec8>] (notify_init+0x0/0x2a8) from [<c00373b8>]
(do_one_initcall+0xb8/0x180)
 r9:00000000 r8:c04a20c0 r7:c0024ec8 r6:c006a954 r5:c002b0d0
r4:c002b040
[<c0037300>] (do_one_initcall+0x0/0x180) from [<c0008d68>]
(kernel_init+0xa8/0x150)
[<c0008cc0>] (kernel_init+0x0/0x150) from [<c006a954>] (do_exit+0x0/0x5dc)
 r5:c0008cc0 r4:00000000

To build the above, I simple sourced the
/usr/local/oecore-i686/environment-setup-armv7a-vfp-neon-oe-linux-gnueabi
script and then unset LDFLAGS.

For kicks, I did a clean build of the kernel again and built with make
EXTRA_CFLAGS=3D-mno-unaligned-access uImage and that resulted in a hung
kernel:

## Booting kernel from Legacy Image at 83000000 ...
   Image Name:   Linux-2.6.37+
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2348876 Bytes =3D 2.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...


Regards,

Brian

--e89a8fb1fe36e80db104e416da9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Aug 16, 2013 at 11:37 AM, Khem Raj <span dir=3D"lt=
r">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"im"><div class=3D"gmail_ext=
ra"><br>
<div class=3D"gmail_quote">On Fri, Aug 16, 2013 at 8:12 AM, Brian Hutchinso=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"_=
blank">b.hutchman@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">=C2=A0At this point I&#39;m using the toolchains outside o=
f OE (meta-toolchain from denzil branch and Linaro 4.8) to make life a bit =
simpler.</blockquote>


</div><br><br></div></div><div class=3D"gmail_extra"><div>=E2=80=8Bcan you =
use the the toolchain from OE-Core and see if it happens with that too ?=E2=
=80=8B</div>

<br></div></div></blockquote><div><br></div><div>OK, that kept me busy for =
a while. =C2=A0I built core-image-minimal -c populate_sdk with OE Core + me=
ta-ti and installed that on my application development machine (bitbake bui=
ld server is debian 7.1 64bit, app development machine (behind firewall, sl=
ow network connection etc. is Ubuntu 12.04 LTS 32 bit for running Code Comp=
oser etc.)</div>
<div><br></div><div>So after installing=C2=A0<a href=3D"http://oecore-i686-=
armv7a-vfp-neon-toolchain-oe-core.0.sh">oecore-i686-armv7a-vfp-neon-toolcha=
in-oe-core.0.sh</a> (I know, I went the long way around doing this ... don&=
#39;t ask :) ) I built my 2.6.37 kernel that I patched memset earlier. =C2=
=A0Different result this time. =C2=A0Looks a bit different. =C2=A0Boots but=
 dies in the same place but with a slightly different message (I still see =
a bunch of mbox stuff in there hmmm):</div>
<div><br></div><div><div>## Booting kernel from Legacy Image at 83000000 ..=
.</div><div>=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37+</div><div>=C2=A0 =
=C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</div><div>=
=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A02348304 Bytes =3D 2.2 MiB</div>
<div>=C2=A0 =C2=A0Load Address: 80008000</div><div>=C2=A0 =C2=A0Entry Point=
: =C2=A080008000</div><div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><div=
>=C2=A0 =C2=A0Loading Kernel Image ... OK</div><div>OK</div><div><br></div>=
<div>Starting kernel ...</div><div><br></div>
<div>Uncompressing Linux... done, booting the kernel.</div><div>Linux versi=
on 2.6.37+ (hutch@Strider) (gcc version 4.8.1 (GCC) ) #1 Fri Aug 16 16:33:1=
8 EDT 2013</div><div>CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=
=3D10c53c7d</div>
<div>CPU: VIPT nonaliasing data cache, VIPT aliasing instruction cache</div=
><div>Machine: ti8168evm</div><div>reserved size =3D 0 at 0x0</div><div>Mem=
ory policy: ECC disabled, Data cache writeback</div><div>OMAP chip is TI816=
8 2.0</div>
<div>Built 1 zonelists in Zone order, mobility grouping on. =C2=A0Total pag=
es: 42164</div><div>Kernel command line: mem=3D166M console=3DttyO2,115200n=
8 noinitrd ip=3D192.168.1.1:192.168.1.5:192.168.1.0:255.255.255.0:255.255.2=
55.1:eth0:off eth=3D84:7e:40:d6:a7:5e root=3D/dev/nfs nfsroot=3D192.168.1.5=
:/home/hutch/ione_wcs_yocto_test/trunk/arm/rootfs</div>
<div>PID hash table entries: 1024 (order: 0, 4096 bytes)</div><div>Dentry c=
ache hash table entries: 32768 (order: 5, 131072 bytes)</div><div>Inode-cac=
he hash table entries: 16384 (order: 4, 65536 bytes)</div><div>Memory: 166M=
B =3D 166MB total</div>
<div>Memory: 163444k/163444k available, 6540k reserved, 0K highmem</div><di=
v>Virtual kernel memory layout:</div><div>=C2=A0 =C2=A0 vector =C2=A0: 0xff=
ff0000 - 0xffff1000 =C2=A0 ( =C2=A0 4 kB)</div><div>=C2=A0 =C2=A0 fixmap =
=C2=A0: 0xfff00000 - 0xfffe0000 =C2=A0 ( 896 kB)</div>
<div>=C2=A0 =C2=A0 DMA =C2=A0 =C2=A0 : 0xffc00000 - 0xffe00000 =C2=A0 ( =C2=
=A0 2 MB)</div><div>=C2=A0 =C2=A0 vmalloc : 0xca800000 - 0xf8000000 =C2=A0 =
( 728 MB)</div><div>=C2=A0 =C2=A0 lowmem =C2=A0: 0xc0000000 - 0xca600000 =
=C2=A0 ( 166 MB)</div><div>=C2=A0 =C2=A0 modules : 0xbf000000 - 0xc0000000 =
=C2=A0 ( =C2=A016 MB)</div>
<div>=C2=A0 =C2=A0 =C2=A0 .init : 0xc0008000 - 0xc0037000 =C2=A0 ( 188 kB)<=
/div><div>=C2=A0 =C2=A0 =C2=A0 .text : 0xc0037000 - 0xc0466000 =C2=A0 (4284=
 kB)</div><div>=C2=A0 =C2=A0 =C2=A0 .data : 0xc0466000 - 0xc04a20c0 =C2=A0 =
( 241 kB)</div><div>SLUB: Genslabs=3D11, HWalign=3D64, Order=3D0-3, MinObje=
cts=3D0, CPUs=3D1, Nodes=3D1</div>
<div>NR_IRQS:407</div><div>IRQ: Found an INTC at 0xfa200000 (revision 5.0) =
with 128 interrupts</div><div>Total of 128 interrupts on 1 active controlle=
r</div><div>GPMC revision 6.0</div><div>Trying to install interrupt handler=
 for IRQ400</div>
<div>Trying to install interrupt handler for IRQ401</div><div>Trying to ins=
tall interrupt handler for IRQ402</div><div>Trying to install interrupt han=
dler for IRQ403</div><div>Trying to install interrupt handler for IRQ404</d=
iv>
<div>Trying to install interrupt handler for IRQ405</div><div>Trying to ins=
tall interrupt handler for IRQ406</div><div>Trying to install type control =
for IRQ407</div><div>Trying to set irq flags for IRQ407</div><div>OMAP cloc=
kevent source: GPTIMER1 at 27000000 Hz</div>
<div>Console: colour dummy device 80x30</div><div>Calibrating delay loop...=
 986.31 BogoMIPS (lpj=3D4931584)</div><div>pid_max: default: 32768 minimum:=
 301</div><div>Security Framework initialized</div><div>Mount-cache hash ta=
ble entries: 512</div>
<div>CPU: Testing write buffer coherency: ok</div><div>devtmpfs: initialize=
d</div><div>omap_voltage_early_init: voltage driver support not added</div>=
<div>regulator: core version 0.5</div><div>regulator: dummy:=C2=A0</div><di=
v>
NET: Registered protocol family 16</div><div>omap_voltage_domain_lookup: Vo=
ltage driver init not yet happened.Faulting!</div><div>omap_voltage_add_dev=
: VDD specified does not exist!</div><div>OMAP GPIO hardware version 0.1</d=
iv>
<div>OMAP GPIO hardware version 0.1</div><div>configure pinmux for RS485. e=
tc</div><div>omap_mux_init: Add partition: #1: core, flags: 0</div><div>_om=
ap_mux_get_by_name: Could not find signal i2c2_scl.i2c2_scl</div><div>_omap=
_mux_get_by_name: Could not find signal i2c2_sda.i2c2_sda</div>
<div>registered NOR flash on CS1 (second NOR)</div><div>registered ti816x_s=
ram_procfs_bootcount device</div><div>dsa: =C2=A0initialize distributed swi=
tch architecture (dsa) marvell (mv) ethernet switch</div><div>dsa: =C2=A0ds=
a_on_flag=3D1</div>
<div>pm_dbg_init: only OMAP3 supported</div><div>bio: create slab &lt;bio-0=
&gt; at 0</div><div>vgaarb: loaded</div><div>SCSI subsystem initialized</di=
v><div>usbcore: registered new interface driver usbfs</div><div>usbcore: re=
gistered new interface driver hub</div>
<div>usbcore: registered new device driver usb</div><div>USBSS revision 4ea=
20809</div><div>registerd cppi-dma Intr @ IRQ 17</div><div>Cppi41 Init Done=
</div><div>omap_i2c omap_i2c.1: bus 1 rev4.0 at 100 kHz</div><div>omap_i2c =
omap_i2c.2: bus 2 rev4.0 at 100 kHz</div>
<div>i2c i2c-2: Invalid 7-bit I2C address 0x00</div><div>i2c i2c-2: Can&#39=
;t create device at 0x00</div><div>Switching to clocksource gp timer</div><=
div>musb-hdrc: version 6.0, host, debug=3D0</div><div>musb-hdrc musb-hdrc.0=
: dma type: dma-cppi41</div>
<div>MUSB controller-0 revision 4ea20800</div><div>musb-hdrc musb-hdrc.0: M=
USB HDRC host driver</div><div>musb-hdrc musb-hdrc.0: new USB bus registere=
d, assigned bus number 1</div><div>usb usb1: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002</div>
<div>usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=
=3D1</div><div>usb usb1: Product: MUSB HDRC host driver</div><div>usb usb1:=
 Manufacturer: Linux 2.6.37+ musb-hcd</div><div>usb usb1: SerialNumber: mus=
b-hdrc.0</div>
<div>hub 1-0:1.0: USB hub found</div><div>hub 1-0:1.0: 1 port detected</div=
><div>musb-hdrc musb-hdrc.0: USB Host mode controller at ca822000 using DMA=
, IRQ 18</div><div>musb-hdrc musb-hdrc.1: dma type: dma-cppi41</div><div>
MUSB controller-1 revision 4ea20800</div><div>musb-hdrc musb-hdrc.1: MUSB H=
DRC host driver</div><div>musb-hdrc musb-hdrc.1: new USB bus registered, as=
signed bus number 2</div><div>usb usb2: New USB device found, idVendor=3D1d=
6b, idProduct=3D0002</div>
<div>usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=
=3D1</div><div>usb usb2: Product: MUSB HDRC host driver</div><div>usb usb2:=
 Manufacturer: Linux 2.6.37+ musb-hcd</div><div>usb usb2: SerialNumber: mus=
b-hdrc.1</div>
<div>hub 2-0:1.0: USB hub found</div><div>hub 2-0:1.0: 1 port detected</div=
><div>musb-hdrc musb-hdrc.1: USB Host mode controller at ca826800 using DMA=
, IRQ 19</div><div>NET: Registered protocol family 2</div><div>IP route cac=
he hash table entries: 2048 (order: 1, 8192 bytes)</div>
<div>TCP established hash table entries: 8192 (order: 4, 65536 bytes)</div>=
<div>TCP bind hash table entries: 8192 (order: 3, 32768 bytes)</div><div>TC=
P: Hash tables configured (established 8192 bind 8192)</div><div>TCP reno r=
egistered</div>
<div>UDP hash table entries: 256 (order: 0, 4096 bytes)</div><div>UDP-Lite =
hash table entries: 256 (order: 0, 4096 bytes)</div><div>NET: Registered pr=
otocol family 1</div><div>RPC: Registered udp transport module.</div><div>
RPC: Registered tcp transport module.</div><div>RPC: Registered tcp NFSv4.1=
 backchannel transport module.</div><div>NetWinder Floating Point Emulator =
V0.97 (double precision)</div><div>omap-iommu omap-iommu.0: ducati register=
ed</div>
<div>omap-iommu omap-iommu.1: sys registered</div><div>squashfs: version 4.=
0 (2009/01/31) Phillip Lougher</div><div>JFFS2 version 2.2. (NAND) =EF=BF=
=BD=C2=A9 2001-2006 Red Hat, Inc.</div><div>msgmni has been set to 319</div=
><div>io scheduler noop registered</div>
<div>io scheduler deadline registered</div><div>io scheduler cfq registered=
 (default)</div><div>Serial: 8250/16550 driver, 4 ports, IRQ sharing enable=
d</div><div>omap_uart.0: ttyO0 at MMIO 0x48020000 (irq =3D 72) is a OMAP UA=
RT0</div>
<div>omap_uart.1: ttyO1 at MMIO 0x48022000 (irq =3D 73) is a OMAP UART1</di=
v><div>omap_uart.2: ttyO2 at MMIO 0x48024000 (irq =3D 74) is a OMAP UART2</=
div><div>console [ttyO2] enabled</div><div>brd: module loaded</div><div>loo=
p: module loaded</div>
<div>physmap platform flash device: 08000000 at 08000000</div><div>physmap-=
flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x00000=
1 Chip ID 0x002801</div><div>Amd/Fujitsu Extended Query Table at 0x0040</di=
v>
<div>=C2=A0 Amd/Fujitsu Extended Query version 1.5.</div><div>Enabling Span=
sion 65nm mode, writesize =3D 512 bytes</div><div>number of CFI chips: 1</d=
iv><div>RedBoot partition parsing not available</div><div>Using physmap par=
tition information</div>
<div>Creating 8 MTD partitions on &quot;physmap-flash.0&quot;:</div><div>0x=
000000000000-0x000000040000 : &quot;u-boot&quot;</div><div>0x000000040000-0=
x000000060000 : &quot;u-boot_env1&quot;</div><div>0x000000060000-0x00000008=
0000 : &quot;u-boot_env2&quot;</div>
<div>0x000000080000-0x0000000a0000 : &quot;pad1&quot;</div><div>0x0000000a0=
000-0x0000004a0000 : &quot;kernel_1&quot;</div><div>0x0000004a0000-0x000003=
6a0000 : &quot;rootfs_1&quot;</div><div>0x0000036a0000-0x0000068a0000 : &qu=
ot;appfs_1&quot;</div>
<div>0x0000068a0000-0x000007b60000 : &quot;overlay_1&quot;</div><div>physma=
p platform flash device: 08000000 at 10000000</div><div>physmap-flash.1: Fo=
und 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0=
x002801</div>
<div>Amd/Fujitsu Extended Query Table at 0x0040</div><div>=C2=A0 Amd/Fujits=
u Extended Query version 1.5.</div><div>Enabling Spansion 65nm mode, writes=
ize =3D 512 bytes</div><div>number of CFI chips: 1</div><div>RedBoot partit=
ion parsing not available</div>
<div>Using physmap partition information</div><div>Creating 8 MTD partition=
s on &quot;physmap-flash.1&quot;:</div><div>0x000000000000-0x000000040000 :=
 &quot;u-boot&quot;</div><div>0x000000040000-0x000000060000 : &quot;u-boot_=
env1&quot;</div>
<div>0x000000060000-0x000000080000 : &quot;u-boot_env2&quot;</div><div>0x00=
0000080000-0x0000000a0000 : &quot;pad2&quot;</div><div>0x0000000a0000-0x000=
0004a0000 : &quot;kernel_2&quot;</div><div>0x0000004a0000-0x0000036a0000 : =
&quot;rootfs_2&quot;</div>
<div>0x0000036a0000-0x0000068a0000 : &quot;appfs_2&quot;</div><div>0x000006=
8a0000-0x000007b60000 : &quot;overlay_2&quot;</div><div>davinci_mdio davinc=
i_mdio.0: davinci mdio revision 1.6</div><div>davinci_mdio davinci_mdio.0: =
detected phy mask fffffffc</div>
<div>davinci_mdio.0: probed</div><div>davinci_mdio davinci_mdio.0: phy[0]: =
device 0:00, driver unknown</div><div>davinci_mdio davinci_mdio.0: phy[1]: =
device 0:01, driver unknown</div><div>PPP generic driver version 2.4.2</div=
>
<div>usbcore: registered new interface driver asix</div><div>usbcore: regis=
tered new interface driver cdc_ether</div><div>usbcore: registered new inte=
rface driver dm9601</div><div>ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Con=
troller (EHCI) Driver</div>
<div>ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller (OHCI) Driver</div><d=
iv>uhci_hcd: USB Universal Host Controller Interface driver</div><div>usbco=
re: registered new interface driver uas</div><div>Initializing USB Mass Sto=
rage driver...</div>
<div>usbcore: registered new interface driver usb-storage</div><div>USB Mas=
s Storage support registered.</div><div>usbcore: registered new interface d=
river ums-alauda</div><div>usbcore: registered new interface driver ums-cyp=
ress</div>
<div>usbcore: registered new interface driver ums-datafab</div><div>usbcore=
: registered new interface driver ums-freecom</div><div>usbcore: registered=
 new interface driver ums-isd200</div><div>usbcore: registered new interfac=
e driver ums-jumpshot</div>
<div>usbcore: registered new interface driver ums-karma</div><div>usbcore: =
registered new interface driver ums-onetouch</div><div>usbcore: registered =
new interface driver ums-sddr09</div><div>usbcore: registered new interface=
 driver ums-sddr55</div>
<div>usbcore: registered new interface driver ums-usbat</div><div>mice: PS/=
2 mouse device common for all mice</div><div>usb 1-1: new high speed USB de=
vice using musb-hdrc and address 2</div><div>rtc-ds1307 1-0068: rtc core: r=
egistered ds1337 as rtc0</div>
<div>i2c /dev entries driver</div><div>OMAP Watchdog Timer Rev 0x00: initia=
l timeout 60 sec</div><div>sdhci: Secure Digital Host Controller Interface =
driver</div><div>sdhci: Copyright(c) Pierre Ossman</div><div>Unable to hand=
le kernel NULL pointer dereference at virtual address 0000004c</div>
<div>pgd =3D c0004000</div><div>[0000004c] *pgd=3D00000000</div><div>Intern=
al error: Oops: 5 [#1]</div><div>last sysfs file:=C2=A0</div><div>Modules l=
inked in:</div><div>CPU: 0 =C2=A0 =C2=A0Not tainted =C2=A0(2.6.37+ #1)</div=
><div>PC is at strcmp+0x10/0x48</div>
<div>LR is at omap_mbox_get+0x40/0x1cc</div><div>pc : [&lt;c01dcd94&gt;] =
=C2=A0 =C2=A0lr : [&lt;c0061a50&gt;] =C2=A0 =C2=A0psr: a0000013</div><div>s=
p : ca023f10 =C2=A0ip : ca023f20 =C2=A0fp : ca023f1c</div><div>r10: ca02201=
8 =C2=A0r9 : 00000000 =C2=A0r8 : c04a20c0</div>
<div>r7 : c049c5c8 =C2=A0r6 : c04a2798 =C2=A0r5 : c0408919 =C2=A0r4 : c047d=
898</div><div>r3 : 00000000 =C2=A0r2 : 00000064 =C2=A0r1 : c0408919 =C2=A0r=
0 : 0000004c</div><div>Flags: NzCv =C2=A0IRQs on =C2=A0FIQs on =C2=A0Mode S=
VC_32 =C2=A0ISA ARM =C2=A0Segment kernel</div><div>
Control: 10c5387d =C2=A0Table: 80004019 =C2=A0DAC: 00000017</div><div>Proce=
ss swapper (pid: 1, stack limit =3D 0xca0222e8)</div><div>Stack: (0xca023f1=
0 to 0xca024000)</div><div>3f00: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ca023f44 ca023f20 c0061a50 c01dcd90</div>
<div>3f20: c02b67c0 c01dcd90 c049c4a0 c049c56c c049c4a0 c0024ec8 ca023f6c c=
a023f48</div><div>3f40: c02b9fe4 c0061a1c 00000001 00000000 c002b040 c002b0=
40 c04d1f08 c006a954</div><div>3f60: ca023f94 ca023f70 c0024f04 c02b9e70 c0=
02b040 c002b0d0 c006a954 c0024ec8</div>
<div>3f80: c04a20c0 00000000 ca023fd4 ca023f98 c00373b8 c0024ed4 00000036 0=
0000000</div><div>3fa0: ca023fbc 00000196 c04896cc c002b040 c002b0d0 c006a9=
54 00000013 00000000</div><div>3fc0: 00000000 00000000 ca023ff4 ca023fd8 c0=
008d68 c003730c 00000000 00000000</div>
<div>3fe0: 00000000 c0008cc0 00000000 ca023ff8 c006a954 c0008ccc eda485b5 b=
186e796</div><div>Backtrace:=C2=A0</div><div>[&lt;c01dcd84&gt;] (strcmp+0x0=
/0x48) from [&lt;c0061a50&gt;] (omap_mbox_get+0x40/0x1cc)</div><div>[&lt;c0=
061a10&gt;] (omap_mbox_get+0x0/0x1cc) from [&lt;c02b9fe4&gt;] (notify_shm_d=
rv_setup+0x180/0x254)</div>
<div>=C2=A0r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0</div><div>[&lt;c=
02b9e64&gt;] (notify_shm_drv_setup+0x0/0x254) from [&lt;c0024f04&gt;] (noti=
fy_init+0x3c/0x2a8)</div><div>=C2=A0r6:c006a954 r5:c04d1f08 r4:c002b040</di=
v><div>
[&lt;c0024ec8&gt;] (notify_init+0x0/0x2a8) from [&lt;c00373b8&gt;] (do_one_=
initcall+0xb8/0x180)</div><div>=C2=A0r9:00000000 r8:c04a20c0 r7:c0024ec8 r6=
:c006a954 r5:c002b0d0</div><div>r4:c002b040</div><div>[&lt;c0037300&gt;] (d=
o_one_initcall+0x0/0x180) from [&lt;c0008d68&gt;] (kernel_init+0xa8/0x150)<=
/div>
<div>[&lt;c0008cc0&gt;] (kernel_init+0x0/0x150) from [&lt;c006a954&gt;] (do=
_exit+0x0/0x5dc)</div><div>=C2=A0r5:c0008cc0 r4:00000000</div><div>Code: e1=
a0c00d e92dd800 e24cb004 e3a03000 (e7d02003)=C2=A0</div><div>---[ end trace=
 599d30e660dbf8fa ]---</div>
<div>Kernel panic - not syncing: Attempted to kill init!</div><div>Backtrac=
e:=C2=A0</div><div>[&lt;c0044aec&gt;] (dump_backtrace+0x0/0x104) from [&lt;=
c0351cf0&gt;] (dump_stack+0x18/0x1c)</div><div>=C2=A0r6:c01dcd96 r5:0000000=
b r4:c04a2858 r3:ffffffff</div>
<div>[&lt;c0351cd8&gt;] (dump_stack+0x0/0x1c) from [&lt;c0351ee0&gt;] (pani=
c+0x60/0x178)</div><div>[&lt;c0351e80&gt;] (panic+0x0/0x178) from [&lt;c006=
a9c0&gt;] (do_exit+0x6c/0x5dc)</div><div>=C2=A0r3:c0480894 r2:ca020130 r1:0=
0000001 r0:c040ad52</div>
<div>=C2=A0r7:ca022000</div><div>[&lt;c006a954&gt;] (do_exit+0x0/0x5dc) fro=
m [&lt;c0044f58&gt;] (die+0x280/0x2bc)</div><div>=C2=A0r7:ca022000</div><di=
v>[&lt;c0044cd8&gt;] (die+0x0/0x2bc) from [&lt;c0351d50&gt;] (__do_kernel_f=
ault.part.4+0x5c/0x7c)</div>
<div>[&lt;c0351cf4&gt;] (__do_kernel_fault.part.4+0x0/0x7c) from [&lt;c0358=
62c&gt;] (do_page_fault+0x200/0x21c)</div><div>=C2=A0r7:ca020000 r3:ca023ec=
8</div><div>[&lt;c035842c&gt;] (do_page_fault+0x0/0x21c) from [&lt;c035866c=
&gt;] (do_translation_fault+0x24/0xa4)</div>
<div>[&lt;c0358648&gt;] (do_translation_fault+0x0/0xa4) from [&lt;c00371f8&=
gt;] (do_DataAbort+0x3c/0xa0)</div><div>=C2=A0r7:ca023ec8 r6:0000004c r5:c0=
46a550 r4:00000005</div><div>[&lt;c00371bc&gt;] (do_DataAbort+0x0/0xa0) fro=
m [&lt;c035672c&gt;] (__dabt_svc+0x4c/0x60)</div>
<div>Exception stack(0xca023ec8 to 0xca023f10)</div><div>3ec0: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000004c c0408919 0000=
0064 00000000 c047d898 c0408919</div><div>3ee0: c04a2798 c049c5c8 c04a20c0 =
00000000 ca022018 ca023f1c ca023f20 ca023f10</div>
<div>3f00: c0061a50 c01dcd94 a0000013 ffffffff</div><div>=C2=A0r7:c049c5c8 =
r6:c04a2798 r5:ca023efc r4:ffffffff</div><div>[&lt;c01dcd84&gt;] (strcmp+0x=
0/0x48) from [&lt;c0061a50&gt;] (omap_mbox_get+0x40/0x1cc)</div><div>[&lt;c=
0061a10&gt;] (omap_mbox_get+0x0/0x1cc) from [&lt;c02b9fe4&gt;] (notify_shm_=
drv_setup+0x180/0x254)</div>
<div>=C2=A0r7:c0024ec8 r6:c049c4a0 r5:c049c56c r4:c049c4a0</div><div>[&lt;c=
02b9e64&gt;] (notify_shm_drv_setup+0x0/0x254) from [&lt;c0024f04&gt;] (noti=
fy_init+0x3c/0x2a8)</div><div>=C2=A0r6:c006a954 r5:c04d1f08 r4:c002b040</di=
v><div>
[&lt;c0024ec8&gt;] (notify_init+0x0/0x2a8) from [&lt;c00373b8&gt;] (do_one_=
initcall+0xb8/0x180)</div><div>=C2=A0r9:00000000 r8:c04a20c0 r7:c0024ec8 r6=
:c006a954 r5:c002b0d0</div><div>r4:c002b040</div><div>[&lt;c0037300&gt;] (d=
o_one_initcall+0x0/0x180) from [&lt;c0008d68&gt;] (kernel_init+0xa8/0x150)<=
/div>
<div>[&lt;c0008cc0&gt;] (kernel_init+0x0/0x150) from [&lt;c006a954&gt;] (do=
_exit+0x0/0x5dc)</div><div>=C2=A0r5:c0008cc0 r4:00000000</div></div><div><b=
r></div></div>To build the above, I simple sourced the /usr/local/oecore-i6=
86/environment-setup-armv7a-vfp-neon-oe-linux-gnueabi script and then unset=
 LDFLAGS.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For kicks, =
I did a clean build of the kernel again and built with=C2=A0make EXTRA_CFLA=
GS=3D-mno-unaligned-access uImage and that resulted in a hung kernel:</div>=
<div class=3D"gmail_extra">
<br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">## Booting =
kernel from Legacy Image at 83000000 ...</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37+</div><div class=3D"gmail_extr=
a">=C2=A0 =C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</d=
iv>
<div class=3D"gmail_extra">=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A02348876 Byt=
es =3D 2.2 MiB</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Load Address: 8=
0008000</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Entry Point: =C2=A0800=
08000</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Verifying Checksum ... O=
K</div>
<div class=3D"gmail_extra">=C2=A0 =C2=A0Loading Kernel Image ... OK</div><d=
iv class=3D"gmail_extra">OK</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Starting kernel ...</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">
<br></div><div class=3D"gmail_extra">Regards,</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Brian</div></div></div>

--e89a8fb1fe36e80db104e416da9f--
