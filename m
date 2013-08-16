Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A1D0E00406
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 08:13:00 -0700 (PDT)
Received: by mail-oa0-f44.google.com with SMTP id l20so2393137oag.3
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yw4PtmZ4yecpYfQvJcKwPP9RT52LtIRubia3a3TBJpQ=;
	b=vfwmcQzLvXeEa7rAtKQPxxVbEemgtm8Fn7vA1cv+h9b+9mhhaiIH6JSdAX2jUBGyih
	IV/h6OO90W3u9cfZgwlYeQlafPFT3HuvHGvHIqcogkYhE+NQsqDpPJIMet7Ox74Y7sWe
	eU4W9FvpGazSFh404PlOw0gzaCqFCyPmUJ3VMXMUh5t9VGMSlWzeACCrgkCx//DLNg0j
	1qu5dSebLFZqIRol2AHhlnKnGMoNP9QtVPkq8clrVjh4Y4qY0PW5nMhrsOILwkQMPz5I
	aFCbZKEVVS8whWzoutnMHy5tfWWSvaBuNqlRlSyC1JH6WH9qyuhkbSNiNBsPj3Akqrbc
	DmCw==
MIME-Version: 1.0
X-Received: by 10.60.131.104 with SMTP id ol8mr1767004oeb.6.1376665979568;
	Fri, 16 Aug 2013 08:12:59 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Fri, 16 Aug 2013 08:12:59 -0700 (PDT)
In-Reply-To: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
Date: Fri, 16 Aug 2013 11:12:59 -0400
Message-ID: <CAFZh4h_hTjd-5AC7abRF3rd9zeDBS4j_fRRZEW4eH+nGn8s9_w@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Cc: Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Fri, 16 Aug 2013 15:13:01 -0000
Content-Type: multipart/alternative; boundary=089e013cb85cafc99504e4120697

--089e013cb85cafc99504e4120697
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Another update (any my feeble cry for ideas is at the very bottom after the
kernel boot dump).  I applied the patches Khem mentioned.  The patch
applied but I studied the code and there are big differences between 2.6.37
for ti816x vs the 3.8 for beagle.  There looked to be more in the patch
than was able to be applied so I didn't have any confidence this would fix
anything after I noticed that and when I tried to boot the kernel the hung
boot confirmed my suspicion.  At this point I'm using the toolchains
outside of OE (meta-toolchain from denzil branch and Linaro 4.8) to make
life a bit simpler.  Here is what my memset.S looks like after applying the
two patches:

/*
 *  linux/arch/arm/lib/memset.S
 *
 *  Copyright (C) 1995-2000 Russell King
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  ASM optimised string functions
 */
#include <linux/linkage.h>
#include <asm/assembler.h>

.text
.align 5

ENTRY(memset)
ands r3, r0, #3 @ 1 unaligned?
mov ip, r0 @ preserve r0 as return value
bne 6f @ 1
/*
 * we know that the pointer in ip is aligned to a word boundary.
 */
1: orr r1, r1, r1, lsl #8
orr r1, r1, r1, lsl #16
mov r3, r1
cmp r2, #16
blt 4f

#if ! CALGN(1)+0

/*
 * We need 2 extra registers for this loop - use r8 and the LR
 */
stmfd sp!, {r8, lr}
mov r8, r1
mov lr, r1

2: subs r2, r2, #64
stmgeia ip!, {r1, r3, r8, lr} @ 64 bytes at a time.
stmgeia ip!, {r1, r3, r8, lr}
stmgeia ip!, {r1, r3, r8, lr}
stmgeia ip!, {r1, r3, r8, lr}
bgt 2b
ldmeqfd sp!, {r8, pc} @ Now <64 bytes to go.
/*
 * No need to correct the count; we're only testing bits from now on
 */
tst r2, #32
stmneia ip!, {r1, r3, r8, lr}
stmneia ip!, {r1, r3, r8, lr}
tst r2, #16
stmneia ip!, {r1, r3, r8, lr}
ldmfd sp!, {r8, lr}

#else

/*
 * This version aligns the destination pointer in order to write
 * whole cache lines at once.
 */

stmfd sp!, {r4-r8, lr}
mov r4, r1
mov r5, r1
mov r6, r1
mov r7, r1
mov r8, r1
mov lr, r1

cmp r2, #96
tstgt ip, #31
ble 3f

and r8, ip, #31
rsb r8, r8, #32
sub r2, r2, r8
movs r8, r8, lsl #(32 - 4)
stmcsia ip!, {r4, r5, r6, r7}
stmmiia ip!, {r4, r5}
tst r8, #(1 << 30)
mov r8, r1
strne r1, [ip], #4

3: subs r2, r2, #64
stmgeia ip!, {r1, r3-r8, lr}
stmgeia ip!, {r1, r3-r8, lr}
bgt 3b
ldmeqfd sp!, {r4-r8, pc}

tst r2, #32
stmneia ip!, {r1, r3-r8, lr}
tst r2, #16
stmneia ip!, {r4-r7}
ldmfd sp!, {r4-r8, lr}

#endif

4: tst r2, #8
stmneia ip!, {r1, r3}
tst r2, #4
strne r1, [ip], #4
/*
 * When we get here, we've got less than 4 bytes to zero.  We
 * may have an unaligned pointer as well.
 */
5: tst r2, #2
strneb r1, [ip], #1
strneb r1, [ip], #1
tst r2, #1
strneb r1, [ip], #1
mov pc, lr

6: subs r2, r2, #4 @ 1 do we have enough
blt 5b @ 1 bytes to align with?
cmp r3, #2 @ 1
strltb r1, [ip], #1 @ 1
strleb r1, [ip], #1 @ 1
strb r1, [ip], #1 @ 1
add r2, r2, r3 @ 1 (r2 =3D r2 - (4 - r3))
b 1b
ENDPROC(memset)



So to recap, the TI 2.6.37 kernel freezes after displaying (kernel being
tftp'd in):

Bytes transferred =3D 2349296 (23d8f0 hex)
## Booting kernel from Legacy Image at 83000000 ...
   Image Name:   Linux-2.6.37+
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2349232 Bytes =3D 2.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...


The toolchain built by bitbake meta-toolchain in denzil (doesn't have the
-c populate_sdk feature) boots farther but later dies.  The full dump of
that boot is:


Bytes transferred =3D 2343056 (23c090 hex)
## Booting kernel from Legacy Image at 83000000 ...
   Image Name:   Linux-2.6.37+
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2342992 Bytes =3D 2.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.37+ (hutch@Strider) (gcc version 4.6.4 20120303
(prerelease) (GCC) ) #1 Fri Aug 16 10:10:53 EDT 2013
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
Memory: 163428k/163428k available, 6556k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    vmalloc : 0xca800000 - 0xf8000000   ( 728 MB)
    lowmem  : 0xc0000000 - 0xca600000   ( 166 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .init : 0xc0008000 - 0xc0037000   ( 188 kB)
      .text : 0xc0037000 - 0xc046a000   (4300 kB)
      .data : 0xc046a000 - 0xc04a6100   ( 241 kB)
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
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
2
pgd =3D c0004000
[00000002] *pgd=3D00000000
Internal error: Oops: 5 [#1]
last sysfs file:
Modules linked in:
CPU: 0    Not tainted  (2.6.37+ #1)
PC is at strcmp+0xc/0x40
LR is at omap_mbox_get+0x3c/0x1d0
pc : [<c01dfb34>]    lr : [<c0061db8>]    psr: a0000013
sp : ca023f20  ip : ca023f30  fp : ca023f2c
r10: 00000000  r9 : 00000000  r8 : 00000000
r7 : 00000013  r6 : c040ce09  r5 : c04a05d8  r4 : c04815c8
r3 : 00000064  r2 : 00000076  r1 : c040ce09  r0 : 00000002
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387d  Table: 80004019  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xca0222e8)
Stack: (0xca023f20 to 0xca024000)
3f20: ca023f54 ca023f30 c0061db8 c01dfb34 c02ba2ec c01dfb34 00000000
c04a057c
3f40: c04a0578 00000000 ca023f74 ca023f58 c02bde3c c0061d88 00000000
00000000
3f60: c002b480 c00251fc ca023fa4 ca023f78 c0025238 c02bdcb8 ca022000
c002b480
3f80: c00251fc 00000000 00000013 00000000 00000000 00000000 ca023fdc
ca023fa8
3fa0: c00373b8 c0025208 ca023fc4 00000196 c048d6dc c006adfc c002b480
c002b510
3fc0: c006adfc 00000013 00000000 00000000 ca023ff4 ca023fe0 c0008d44
c0037304
3fe0: 00000000 c0008ca4 00000000 ca023ff8 c006adfc c0008cb0 eda485b5
b186e796
Backtrace:
[<c01dfb28>] (strcmp+0x0/0x40) from [<c0061db8>] (omap_mbox_get+0x3c/0x1d0)
[<c0061d7c>] (omap_mbox_get+0x0/0x1d0) from [<c02bde3c>]
(notify_shm_drv_setup+0x190/0x268)
 r6:00000000 r5:c04a0578 r4:c04a057c
[<c02bdcac>] (notify_shm_drv_setup+0x0/0x268) from [<c0025238>]
(notify_init+0x3c/0x2b0)
 r5:c00251fc r4:c002b480
[<c00251fc>] (notify_init+0x0/0x2b0) from [<c00373b8>]
(do_one_initcall+0xc0/0x194)
[<c00372f8>] (do_one_initcall+0x0/0x194) from [<c0008d44>]
(kernel_init+0xa0/0x14c)
 r9:00000000 r8:00000000 r7:00000013 r6:c006adfc r5:c002b510
r4:c002b480
[<c0008ca4>] (kernel_init+0x0/0x14c) from [<c006adfc>] (do_exit+0x0/0x5dc)
 r5:c0008ca4 r4:00000000
Code: e89da800 e1a0c00d e92dd800 e24cb004 (e4d03001)
---[ end trace d65e423459d53e0a ]---
Kernel panic - not syncing: Attempted to kill init!
Backtrace:
[<c0044d10>] (dump_backtrace+0x0/0x110) from [<c03567d8>]
(dump_stack+0x18/0x1c)
 r6:ca022000 r5:0000000b r4:c04a6898 r3:c048329c
[<c03567c0>] (dump_stack+0x0/0x1c) from [<c03569c0>] (panic+0x5c/0x178)
[<c0356964>] (panic+0x0/0x178) from [<c006ae64>] (do_exit+0x68/0x5dc)
 r3:c04848a4 r2:ca023cf8 r1:00000001 r0:c040f24d
 r7:ca020000
[<c006adfc>] (do_exit+0x0/0x5dc) from [<c0045180>] (die+0x2ac/0x2e8)
 r7:00000000
[<c0044ed4>] (die+0x0/0x2e8) from [<c0356838>]
(__do_kernel_fault.part.3+0x5c/0x7c)
[<c03567dc>] (__do_kernel_fault.part.3+0x0/0x7c) from [<c035cf04>]
(do_page_fault+0x1f8/0x214)
 r7:00000000 r3:ca023ed8
[<c035cd0c>] (do_page_fault+0x0/0x214) from [<c035cf44>]
(do_translation_fault+0x24/0xa8)
[<c035cf20>] (do_translation_fault+0x0/0xa8) from [<c00371f4>]
(do_DataAbort+0x3c/0xa0)
 r7:ca023ed8 r6:00000002 r5:c046e560 r4:00000005
[<c00371b8>] (do_DataAbort+0x0/0xa0) from [<c035afec>]
(__dabt_svc+0x4c/0x60)
Exception stack(0xca023ed8 to 0xca023f20)
3ec0:                                                       00000002
c040ce09
3ee0: 00000076 00000064 c04815c8 c04a05d8 c040ce09 00000013 00000000
00000000
3f00: 00000000 ca023f2c ca023f30 ca023f20 c0061db8 c01dfb34 a0000013
ffffffff
 r7:00000013 r6:c040ce09 r5:ca023f0c r4:ffffffff
[<c01dfb28>] (strcmp+0x0/0x40) from [<c0061db8>] (omap_mbox_get+0x3c/0x1d0)
[<c0061d7c>] (omap_mbox_get+0x0/0x1d0) from [<c02bde3c>]
(notify_shm_drv_setup+0x190/0x268)
 r6:00000000 r5:c04a0578 r4:c04a057c
[<c02bdcac>] (notify_shm_drv_setup+0x0/0x268) from [<c0025238>]
(notify_init+0x3c/0x2b0)
 r5:c00251fc r4:c002b480
[<c00251fc>] (notify_init+0x0/0x2b0) from [<c00373b8>]
(do_one_initcall+0xc0/0x194)
[<c00372f8>] (do_one_initcall+0x0/0x194) from [<c0008d44>]
(kernel_init+0xa0/0x14c)
 r9:00000000 r8:00000000 r7:00000013 r6:c006adfc r5:c002b510
r4:c002b480
[<c0008ca4>] (kernel_init+0x0/0x14c) from [<c006adfc>] (do_exit+0x0/0x5dc)
 r5:c0008ca4 r4:00000000


I've read other messages that mailbox (mbox in the trace walk above) could
be a problem but we need to use syslink so I haven't tired turning it off
since that isn't an option.

In thinking of my options, I initially thought I could maybe get by with
continuing to use our u-boot/kernel build with CSL and just use a Cortex A8
based machine with OE Core support (beagleboard or beaglebone) and generate
the rootfs that I need that way since the ABI's should be compatible.  But
with the kernels being so far apart, now I'm thinking that is probably a
bad idea because the new packages are probably using new system calls
(built against new kernel headers) the old kernel doesn't have.  The
core-image-minimal rootfs does come up when I try using a new OE Core
rootfs with my old kernel but I noticed a strange message from udev and
then noticed that it looked like one of my udev rules wasn't working to
mount one of our usb based NAND flashes and I think that is probably
because of the differences in the ABI's I mentioned.

So I really don't know where to go from here.  I can't be stuck with OE
Classic forever.  Our customers are demanding current packages so I need OE
Core.  I guess it is possible to make poky or arago use and old toolchain
to build new OE Core packages so the ABI's all match but I've never tried
to go down that path.  I would also have make the rootfs packages be built
against my old kernel headers and I'm not too sure about how to go about
that either.

Any words of wisdom?

Regards,

Brian

--089e013cb85cafc99504e4120697
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another update (any my feeble cry for ideas is at the very=
 bottom after the kernel boot dump). =C2=A0I applied the patches Khem menti=
oned. =C2=A0The patch applied but I studied the code and there are big diff=
erences between 2.6.37 for ti816x vs the 3.8 for beagle. =C2=A0There looked=
 to be more in the patch than was able to be applied so I didn&#39;t have a=
ny confidence this would fix anything after I noticed that and when I tried=
 to boot the kernel the hung boot confirmed my suspicion. =C2=A0At this poi=
nt I&#39;m using the toolchains outside of OE (meta-toolchain from denzil b=
ranch and Linaro 4.8) to make life a bit simpler. =C2=A0Here is what my mem=
set.S looks like after applying the two patches:<div>
<br></div><div>/*<br></div><div><div>=C2=A0* =C2=A0linux/arch/arm/lib/memse=
t.S</div><div>=C2=A0*</div><div>=C2=A0* =C2=A0Copyright (C) 1995-2000 Russe=
ll King</div><div>=C2=A0*</div><div>=C2=A0* This program is free software; =
you can redistribute it and/or modify</div>
<div>=C2=A0* it under the terms of the GNU General Public License version 2=
 as</div><div>=C2=A0* published by the Free Software Foundation.</div><div>=
=C2=A0*</div><div>=C2=A0* =C2=A0ASM optimised string functions</div><div>=
=C2=A0*/</div><div>#include &lt;linux/linkage.h&gt;</div>
<div>#include &lt;asm/assembler.h&gt;</div><div><br></div><div><span class=
=3D"" style=3D"white-space:pre">	</span>.text</div><div><span class=3D"" st=
yle=3D"white-space:pre">	</span>.align<span class=3D"" style=3D"white-space=
:pre">	</span>5</div>
<div><br></div><div>ENTRY(memset)</div><div><span class=3D"" style=3D"white=
-space:pre">	</span>ands<span class=3D"" style=3D"white-space:pre">	</span>=
r3, r0, #3<span class=3D"" style=3D"white-space:pre">		</span>@ 1 unaligned=
?</div><div>
<span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D"" styl=
e=3D"white-space:pre">	</span>ip, r0<span class=3D"" style=3D"white-space:p=
re">			</span>@ preserve r0 as return value</div><div><span class=3D"" styl=
e=3D"white-space:pre">	</span>bne<span class=3D"" style=3D"white-space:pre"=
>	</span>6f<span class=3D"" style=3D"white-space:pre">			</span>@ 1</div>
<div>/*</div><div>=C2=A0* we know that the pointer in ip is aligned to a wo=
rd boundary.</div><div>=C2=A0*/</div><div>1:<span class=3D"" style=3D"white=
-space:pre">	</span>orr<span class=3D"" style=3D"white-space:pre">	</span>r=
1, r1, r1, lsl #8</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>orr<span class=3D""=
 style=3D"white-space:pre">	</span>r1, r1, r1, lsl #16</div><div><span clas=
s=3D"" style=3D"white-space:pre">	</span>mov<span class=3D"" style=3D"white=
-space:pre">	</span>r3, r1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>cmp<span class=3D""=
 style=3D"white-space:pre">	</span>r2, #16</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>blt<span class=3D"" style=3D"white-space:pre">=
	</span>4f</div>
<div><br></div><div>#if ! CALGN(1)+0</div><div><br></div><div>/*</div><div>=
=C2=A0* We need 2 extra registers for this loop - use r8 and the LR</div><d=
iv>=C2=A0*/</div><div><span class=3D"" style=3D"white-space:pre">	</span>st=
mfd<span class=3D"" style=3D"white-space:pre">	</span>sp!, {r8, lr}</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D""=
 style=3D"white-space:pre">	</span>r8, r1</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>mov<span class=3D"" style=3D"white-space:pre">=
	</span>lr, r1</div>
<div><br></div><div>2:<span class=3D"" style=3D"white-space:pre">	</span>su=
bs<span class=3D"" style=3D"white-space:pre">	</span>r2, r2, #64</div><div>=
<span class=3D"" style=3D"white-space:pre">	</span>stmgeia<span class=3D"" =
style=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}<span class=3D"" sty=
le=3D"white-space:pre">	</span>@ 64 bytes at a time.</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmgeia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}</div><div><sp=
an class=3D"" style=3D"white-space:pre">	</span>stmgeia<span class=3D"" sty=
le=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmgeia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}</div><div><sp=
an class=3D"" style=3D"white-space:pre">	</span>bgt<span class=3D"" style=
=3D"white-space:pre">	</span>2b</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>ldmeqfd<span class=
=3D"" style=3D"white-space:pre">	</span>sp!, {r8, pc}<span class=3D"" style=
=3D"white-space:pre">		</span>@ Now &lt;64 bytes to go.</div><div>/*</div><=
div>=C2=A0* No need to correct the count; we&#39;re only testing bits from =
now on</div>
<div>=C2=A0*/</div><div><span class=3D"" style=3D"white-space:pre">	</span>=
tst<span class=3D"" style=3D"white-space:pre">	</span>r2, #32</div><div><sp=
an class=3D"" style=3D"white-space:pre">	</span>stmneia<span class=3D"" sty=
le=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmneia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}</div><div><sp=
an class=3D"" style=3D"white-space:pre">	</span>tst<span class=3D"" style=
=3D"white-space:pre">	</span>r2, #16</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmneia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3, r8, lr}</div><div><sp=
an class=3D"" style=3D"white-space:pre">	</span>ldmfd<span class=3D"" style=
=3D"white-space:pre">	</span>sp!, {r8, lr}</div>
<div><br></div><div>#else</div><div><br></div><div>/*</div><div>=C2=A0* Thi=
s version aligns the destination pointer in order to write</div><div>=C2=A0=
* whole cache lines at once.</div><div>=C2=A0*/</div><div><br></div><div><s=
pan class=3D"" style=3D"white-space:pre">	</span>stmfd<span class=3D"" styl=
e=3D"white-space:pre">	</span>sp!, {r4-r8, lr}</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D""=
 style=3D"white-space:pre">	</span>r4, r1</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>mov<span class=3D"" style=3D"white-space:pre">=
	</span>r5, r1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D""=
 style=3D"white-space:pre">	</span>r6, r1</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>mov<span class=3D"" style=3D"white-space:pre">=
	</span>r7, r1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D""=
 style=3D"white-space:pre">	</span>r8, r1</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>mov<span class=3D"" style=3D"white-space:pre">=
	</span>lr, r1</div>
<div><br></div><div><span class=3D"" style=3D"white-space:pre">	</span>cmp<=
span class=3D"" style=3D"white-space:pre">	</span>r2, #96</div><div><span c=
lass=3D"" style=3D"white-space:pre">	</span>tstgt<span class=3D"" style=3D"=
white-space:pre">	</span>ip, #31</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>ble<span class=3D""=
 style=3D"white-space:pre">	</span>3f</div><div><br></div><div><span class=
=3D"" style=3D"white-space:pre">	</span>and<span class=3D"" style=3D"white-=
space:pre">	</span>r8, ip, #31</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>rsb<span class=3D""=
 style=3D"white-space:pre">	</span>r8, r8, #32</div><div><span class=3D"" s=
tyle=3D"white-space:pre">	</span>sub<span class=3D"" style=3D"white-space:p=
re">	</span>r2, r2, r8</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>movs<span class=3D"=
" style=3D"white-space:pre">	</span>r8, r8, lsl #(32 - 4)</div><div><span c=
lass=3D"" style=3D"white-space:pre">	</span>stmcsia<span class=3D"" style=
=3D"white-space:pre">	</span>ip!, {r4, r5, r6, r7}</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmmiia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r4, r5}</div><div><span class=
=3D"" style=3D"white-space:pre">	</span>tst<span class=3D"" style=3D"white-=
space:pre">	</span>r8, #(1 &lt;&lt; 30)</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D""=
 style=3D"white-space:pre">	</span>r8, r1</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>strne<span class=3D"" style=3D"white-space:pre=
">	</span>r1, [ip], #4</div>
<div><br></div><div>3:<span class=3D"" style=3D"white-space:pre">	</span>su=
bs<span class=3D"" style=3D"white-space:pre">	</span>r2, r2, #64</div><div>=
<span class=3D"" style=3D"white-space:pre">	</span>stmgeia<span class=3D"" =
style=3D"white-space:pre">	</span>ip!, {r1, r3-r8, lr}</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmgeia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3-r8, lr}</div><div><spa=
n class=3D"" style=3D"white-space:pre">	</span>bgt<span class=3D"" style=3D=
"white-space:pre">	</span>3b</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>ldmeqfd<span class=
=3D"" style=3D"white-space:pre">	</span>sp!, {r4-r8, pc}</div><div><br></di=
v><div><span class=3D"" style=3D"white-space:pre">	</span>tst<span class=3D=
"" style=3D"white-space:pre">	</span>r2, #32</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmneia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3-r8, lr}</div><div><spa=
n class=3D"" style=3D"white-space:pre">	</span>tst<span class=3D"" style=3D=
"white-space:pre">	</span>r2, #16</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>stmneia<span class=
=3D"" style=3D"white-space:pre">	</span>ip!, {r4-r7}</div><div><span class=
=3D"" style=3D"white-space:pre">	</span>ldmfd<span class=3D"" style=3D"whit=
e-space:pre">	</span>sp!, {r4-r8, lr}</div>
<div><br></div><div>#endif</div><div><br></div><div>4:<span class=3D"" styl=
e=3D"white-space:pre">	</span>tst<span class=3D"" style=3D"white-space:pre"=
>	</span>r2, #8</div><div><span class=3D"" style=3D"white-space:pre">	</spa=
n>stmneia<span class=3D"" style=3D"white-space:pre">	</span>ip!, {r1, r3}</=
div>
<div><span class=3D"" style=3D"white-space:pre">	</span>tst<span class=3D""=
 style=3D"white-space:pre">	</span>r2, #4</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>strne<span class=3D"" style=3D"white-space:pre=
">	</span>r1, [ip], #4</div>
<div>/*</div><div>=C2=A0* When we get here, we&#39;ve got less than 4 bytes=
 to zero. =C2=A0We</div><div>=C2=A0* may have an unaligned pointer as well.=
</div><div>=C2=A0*/</div><div>5:<span class=3D"" style=3D"white-space:pre">=
	</span>tst<span class=3D"" style=3D"white-space:pre">	</span>r2, #2</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>strneb<span class=
=3D"" style=3D"white-space:pre">	</span>r1, [ip], #1</div><div><span class=
=3D"" style=3D"white-space:pre">	</span>strneb<span class=3D"" style=3D"whi=
te-space:pre">	</span>r1, [ip], #1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>tst<span class=3D""=
 style=3D"white-space:pre">	</span>r2, #1</div><div><span class=3D"" style=
=3D"white-space:pre">	</span>strneb<span class=3D"" style=3D"white-space:pr=
e">	</span>r1, [ip], #1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>mov<span class=3D""=
 style=3D"white-space:pre">	</span>pc, lr</div><div><br></div><div>6:<span =
class=3D"" style=3D"white-space:pre">	</span>subs<span class=3D"" style=3D"=
white-space:pre">	</span>r2, r2, #4<span class=3D"" style=3D"white-space:pr=
e">		</span>@ 1 do we have enough</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>blt<span class=3D""=
 style=3D"white-space:pre">	</span>5b<span class=3D"" style=3D"white-space:=
pre">			</span>@ 1 bytes to align with?</div><div><span class=3D"" style=3D=
"white-space:pre">	</span>cmp<span class=3D"" style=3D"white-space:pre">	</=
span>r3, #2<span class=3D"" style=3D"white-space:pre">			</span>@ 1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>strltb<span class=
=3D"" style=3D"white-space:pre">	</span>r1, [ip], #1<span class=3D"" style=
=3D"white-space:pre">		</span>@ 1</div><div><span class=3D"" style=3D"white=
-space:pre">	</span>strleb<span class=3D"" style=3D"white-space:pre">	</spa=
n>r1, [ip], #1<span class=3D"" style=3D"white-space:pre">		</span>@ 1</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>strb<span class=3D"=
" style=3D"white-space:pre">	</span>r1, [ip], #1<span class=3D"" style=3D"w=
hite-space:pre">		</span>@ 1</div><div><span class=3D"" style=3D"white-spac=
e:pre">	</span>add<span class=3D"" style=3D"white-space:pre">	</span>r2, r2=
, r3<span class=3D"" style=3D"white-space:pre">		</span>@ 1 (r2 =3D r2 - (4=
 - r3))</div>
<div><span class=3D"" style=3D"white-space:pre">	</span>b<span class=3D"" s=
tyle=3D"white-space:pre">	</span>1b</div><div>ENDPROC(memset)</div><div><br=
></div><div><br></div><div class=3D"gmail_extra"><br>So to recap, the TI 2.=
6.37 kernel freezes after displaying (kernel being tftp&#39;d in):</div>
<div class=3D"gmail_extra"><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Bytes transferred =3D 2349296 (23d8f0 hex)</div><div class=
=3D"gmail_extra">## Booting kernel from Legacy Image at 83000000 ...</div><=
div class=3D"gmail_extra">
=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37+</div><div class=3D"gmail_extr=
a">=C2=A0 =C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</d=
iv><div class=3D"gmail_extra">=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A02349232 =
Bytes =3D 2.2 MiB</div><div class=3D"gmail_extra">=C2=A0 =C2=A0Load Address=
: 80008000</div>
<div class=3D"gmail_extra">=C2=A0 =C2=A0Entry Point: =C2=A080008000</div><d=
iv class=3D"gmail_extra">=C2=A0 =C2=A0Verifying Checksum ... OK</div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0Loading Kernel Image ... OK</div><div cla=
ss=3D"gmail_extra">OK</div><div class=3D"gmail_extra">
<br></div><div class=3D"gmail_extra">Starting kernel ...</div><div class=3D=
"gmail_quote"><br></div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote">The toolchain built by bitbake meta-toolchain in denzil (doesn=
&#39;t have the -c populate_sdk feature) boots farther but later dies. =C2=
=A0The full dump of that boot is:</div>
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><br></div><=
div class=3D"gmail_quote"><div class=3D"gmail_quote">Bytes transferred =3D =
2343056 (23c090 hex)</div><div class=3D"gmail_quote">## Booting kernel from=
 Legacy Image at 83000000 ...</div>
<div class=3D"gmail_quote">=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37+</d=
iv><div class=3D"gmail_quote">=C2=A0 =C2=A0Image Type: =C2=A0 ARM Linux Ker=
nel Image (uncompressed)</div><div class=3D"gmail_quote">=C2=A0 =C2=A0Data =
Size: =C2=A0 =C2=A02342992 Bytes =3D 2.2 MiB</div><div class=3D"gmail_quote=
">
=C2=A0 =C2=A0Load Address: 80008000</div><div class=3D"gmail_quote">=C2=A0 =
=C2=A0Entry Point: =C2=A080008000</div><div class=3D"gmail_quote">=C2=A0 =
=C2=A0Verifying Checksum ... OK</div><div class=3D"gmail_quote">=C2=A0 =C2=
=A0Loading Kernel Image ... OK</div><div class=3D"gmail_quote">
OK</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Sta=
rting kernel ...</div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">Uncompressing Linux... done, booting the kernel.</div><div class=
=3D"gmail_quote">
Linux version 2.6.37+ (hutch@Strider) (gcc version 4.6.4 20120303 (prerelea=
se) (GCC) ) #1 Fri Aug 16 10:10:53 EDT 2013</div><div class=3D"gmail_quote"=
>CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), cr=3D10c53c7d</div><di=
v class=3D"gmail_quote">
CPU: VIPT nonaliasing data cache, VIPT aliasing instruction cache</div><div=
 class=3D"gmail_quote">Machine: ti8168evm</div><div class=3D"gmail_quote">r=
eserved size =3D 0 at 0x0</div><div class=3D"gmail_quote">Memory policy: EC=
C disabled, Data cache writeback</div>
<div class=3D"gmail_quote">OMAP chip is TI8168 2.0</div><div class=3D"gmail=
_quote">Built 1 zonelists in Zone order, mobility grouping on. =C2=A0Total =
pages: 42164</div><div class=3D"gmail_quote">Kernel command line: mem=3D166=
M console=3DttyO2,115200n8 noinitrd ip=3D192.168.1.1:192.168.1.5:192.168.1.=
0:255.255.255.0:255.255.255.1:eth0:off eth=3D84:7e:40:d6:a7:5e root=3D/dev/=
nfs nfsroot=3D192.168.1.5:/home/hutch/ione_wcs_yocto_test/trunk/arm/rootfs<=
/div>
<div class=3D"gmail_quote">PID hash table entries: 1024 (order: 0, 4096 byt=
es)</div><div class=3D"gmail_quote">Dentry cache hash table entries: 32768 =
(order: 5, 131072 bytes)</div><div class=3D"gmail_quote">Inode-cache hash t=
able entries: 16384 (order: 4, 65536 bytes)</div>
<div class=3D"gmail_quote">Memory: 166MB =3D 166MB total</div><div class=3D=
"gmail_quote">Memory: 163428k/163428k available, 6556k reserved, 0K highmem=
</div><div class=3D"gmail_quote">Virtual kernel memory layout:</div><div cl=
ass=3D"gmail_quote">
=C2=A0 =C2=A0 vector =C2=A0: 0xffff0000 - 0xffff1000 =C2=A0 ( =C2=A0 4 kB)<=
/div><div class=3D"gmail_quote">=C2=A0 =C2=A0 fixmap =C2=A0: 0xfff00000 - 0=
xfffe0000 =C2=A0 ( 896 kB)</div><div class=3D"gmail_quote">=C2=A0 =C2=A0 DM=
A =C2=A0 =C2=A0 : 0xffc00000 - 0xffe00000 =C2=A0 ( =C2=A0 2 MB)</div><div c=
lass=3D"gmail_quote">
=C2=A0 =C2=A0 vmalloc : 0xca800000 - 0xf8000000 =C2=A0 ( 728 MB)</div><div =
class=3D"gmail_quote">=C2=A0 =C2=A0 lowmem =C2=A0: 0xc0000000 - 0xca600000 =
=C2=A0 ( 166 MB)</div><div class=3D"gmail_quote">=C2=A0 =C2=A0 modules : 0x=
bf000000 - 0xc0000000 =C2=A0 ( =C2=A016 MB)</div><div class=3D"gmail_quote"=
>
=C2=A0 =C2=A0 =C2=A0 .init : 0xc0008000 - 0xc0037000 =C2=A0 ( 188 kB)</div>=
<div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 .text : 0xc0037000 - 0xc046=
a000 =C2=A0 (4300 kB)</div><div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 =
.data : 0xc046a000 - 0xc04a6100 =C2=A0 ( 241 kB)</div><div class=3D"gmail_q=
uote">
SLUB: Genslabs=3D11, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1</div><div class=3D"gmail_quote">NR_IRQS:407</div><div class=3D"gma=
il_quote">IRQ: Found an INTC at 0xfa200000 (revision 5.0) with 128 interrup=
ts</div><div class=3D"gmail_quote">
Total of 128 interrupts on 1 active controller</div><div class=3D"gmail_quo=
te">GPMC revision 6.0</div><div class=3D"gmail_quote">Trying to install int=
errupt handler for IRQ400</div><div class=3D"gmail_quote">Trying to install=
 interrupt handler for IRQ401</div>
<div class=3D"gmail_quote">Trying to install interrupt handler for IRQ402</=
div><div class=3D"gmail_quote">Trying to install interrupt handler for IRQ4=
03</div><div class=3D"gmail_quote">Trying to install interrupt handler for =
IRQ404</div>
<div class=3D"gmail_quote">Trying to install interrupt handler for IRQ405</=
div><div class=3D"gmail_quote">Trying to install interrupt handler for IRQ4=
06</div><div class=3D"gmail_quote">Trying to install type control for IRQ40=
7</div>
<div class=3D"gmail_quote">Trying to set irq flags for IRQ407</div><div cla=
ss=3D"gmail_quote">OMAP clockevent source: GPTIMER1 at 27000000 Hz</div><di=
v class=3D"gmail_quote">Console: colour dummy device 80x30</div><div class=
=3D"gmail_quote">
Calibrating delay loop... 986.31 BogoMIPS (lpj=3D4931584)</div><div class=
=3D"gmail_quote">pid_max: default: 32768 minimum: 301</div><div class=3D"gm=
ail_quote">Security Framework initialized</div><div class=3D"gmail_quote">M=
ount-cache hash table entries: 512</div>
<div class=3D"gmail_quote">CPU: Testing write buffer coherency: ok</div><di=
v class=3D"gmail_quote">devtmpfs: initialized</div><div class=3D"gmail_quot=
e">omap_voltage_early_init: voltage driver support not added</div><div clas=
s=3D"gmail_quote">
regulator: core version 0.5</div><div class=3D"gmail_quote">regulator: dumm=
y:=C2=A0</div><div class=3D"gmail_quote">NET: Registered protocol family 16=
</div><div class=3D"gmail_quote">omap_voltage_domain_lookup: Voltage driver=
 init not yet happened.Faulting!</div>
<div class=3D"gmail_quote">omap_voltage_add_dev: VDD specified does not exi=
st!</div><div class=3D"gmail_quote">OMAP GPIO hardware version 0.1</div><di=
v class=3D"gmail_quote">OMAP GPIO hardware version 0.1</div><div class=3D"g=
mail_quote">
configure pinmux for RS485. etc</div><div class=3D"gmail_quote">omap_mux_in=
it: Add partition: #1: core, flags: 0</div><div class=3D"gmail_quote">_omap=
_mux_get_by_name: Could not find signal i2c2_scl.i2c2_scl</div><div class=
=3D"gmail_quote">
_omap_mux_get_by_name: Could not find signal i2c2_sda.i2c2_sda</div><div cl=
ass=3D"gmail_quote">registered NOR flash on CS1 (second NOR)</div><div clas=
s=3D"gmail_quote">registered ti816x_sram_procfs_bootcount device</div><div =
class=3D"gmail_quote">
dsa: =C2=A0initialize distributed switch architecture (dsa) marvell (mv) et=
hernet switch</div><div class=3D"gmail_quote">dsa: =C2=A0dsa_on_flag=3D1</d=
iv><div class=3D"gmail_quote">pm_dbg_init: only OMAP3 supported</div><div c=
lass=3D"gmail_quote">
bio: create slab &lt;bio-0&gt; at 0</div><div class=3D"gmail_quote">vgaarb:=
 loaded</div><div class=3D"gmail_quote">SCSI subsystem initialized</div><di=
v class=3D"gmail_quote">usbcore: registered new interface driver usbfs</div=
><div class=3D"gmail_quote">
usbcore: registered new interface driver hub</div><div class=3D"gmail_quote=
">usbcore: registered new device driver usb</div><div class=3D"gmail_quote"=
>USBSS revision 4ea20809</div><div class=3D"gmail_quote">registerd cppi-dma=
 Intr @ IRQ 17</div>
<div class=3D"gmail_quote">Cppi41 Init Done</div><div class=3D"gmail_quote"=
>omap_i2c omap_i2c.1: bus 1 rev4.0 at 100 kHz</div><div class=3D"gmail_quot=
e">omap_i2c omap_i2c.2: bus 2 rev4.0 at 100 kHz</div><div class=3D"gmail_qu=
ote">
i2c i2c-2: Invalid 7-bit I2C address 0x00</div><div class=3D"gmail_quote">i=
2c i2c-2: Can&#39;t create device at 0x00</div><div class=3D"gmail_quote">S=
witching to clocksource gp timer</div><div class=3D"gmail_quote">musb-hdrc:=
 version 6.0, host, debug=3D0</div>
<div class=3D"gmail_quote">musb-hdrc musb-hdrc.0: dma type: dma-cppi41</div=
><div class=3D"gmail_quote">MUSB controller-0 revision 4ea20800</div><div c=
lass=3D"gmail_quote">musb-hdrc musb-hdrc.0: MUSB HDRC host driver</div><div=
 class=3D"gmail_quote">
musb-hdrc musb-hdrc.0: new USB bus registered, assigned bus number 1</div><=
div class=3D"gmail_quote">usb usb1: New USB device found, idVendor=3D1d6b, =
idProduct=3D0002</div><div class=3D"gmail_quote">usb usb1: New USB device s=
trings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div>
<div class=3D"gmail_quote">usb usb1: Product: MUSB HDRC host driver</div><d=
iv class=3D"gmail_quote">usb usb1: Manufacturer: Linux 2.6.37+ musb-hcd</di=
v><div class=3D"gmail_quote">usb usb1: SerialNumber: musb-hdrc.0</div><div =
class=3D"gmail_quote">
hub 1-0:1.0: USB hub found</div><div class=3D"gmail_quote">hub 1-0:1.0: 1 p=
ort detected</div><div class=3D"gmail_quote">musb-hdrc musb-hdrc.0: USB Hos=
t mode controller at ca822000 using DMA, IRQ 18</div><div class=3D"gmail_qu=
ote">
musb-hdrc musb-hdrc.1: dma type: dma-cppi41</div><div class=3D"gmail_quote"=
>MUSB controller-1 revision 4ea20800</div><div class=3D"gmail_quote">musb-h=
drc musb-hdrc.1: MUSB HDRC host driver</div><div class=3D"gmail_quote">musb=
-hdrc musb-hdrc.1: new USB bus registered, assigned bus number 2</div>
<div class=3D"gmail_quote">usb usb2: New USB device found, idVendor=3D1d6b,=
 idProduct=3D0002</div><div class=3D"gmail_quote">usb usb2: New USB device =
strings: Mfr=3D3, Product=3D2, SerialNumber=3D1</div><div class=3D"gmail_qu=
ote">usb usb2: Product: MUSB HDRC host driver</div>
<div class=3D"gmail_quote">usb usb2: Manufacturer: Linux 2.6.37+ musb-hcd</=
div><div class=3D"gmail_quote">usb usb2: SerialNumber: musb-hdrc.1</div><di=
v class=3D"gmail_quote">hub 2-0:1.0: USB hub found</div><div class=3D"gmail=
_quote">
hub 2-0:1.0: 1 port detected</div><div class=3D"gmail_quote">musb-hdrc musb=
-hdrc.1: USB Host mode controller at ca826800 using DMA, IRQ 19</div><div c=
lass=3D"gmail_quote">NET: Registered protocol family 2</div><div class=3D"g=
mail_quote">
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)</div><div cl=
ass=3D"gmail_quote">TCP established hash table entries: 8192 (order: 4, 655=
36 bytes)</div><div class=3D"gmail_quote">TCP bind hash table entries: 8192=
 (order: 3, 32768 bytes)</div>
<div class=3D"gmail_quote">TCP: Hash tables configured (established 8192 bi=
nd 8192)</div><div class=3D"gmail_quote">TCP reno registered</div><div clas=
s=3D"gmail_quote">UDP hash table entries: 256 (order: 0, 4096 bytes)</div><=
div class=3D"gmail_quote">
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)</div><div class=3D"=
gmail_quote">NET: Registered protocol family 1</div><div class=3D"gmail_quo=
te">RPC: Registered udp transport module.</div><div class=3D"gmail_quote">R=
PC: Registered tcp transport module.</div>
<div class=3D"gmail_quote">RPC: Registered tcp NFSv4.1 backchannel transpor=
t module.</div><div class=3D"gmail_quote">NetWinder Floating Point Emulator=
 V0.97 (double precision)</div><div class=3D"gmail_quote">omap-iommu omap-i=
ommu.0: ducati registered</div>
<div class=3D"gmail_quote">omap-iommu omap-iommu.1: sys registered</div><di=
v class=3D"gmail_quote">squashfs: version 4.0 (2009/01/31) Phillip Lougher<=
/div><div class=3D"gmail_quote">JFFS2 version 2.2. (NAND) =EF=BF=BD=C2=A9 2=
001-2006 Red Hat, Inc.</div>
<div class=3D"gmail_quote">msgmni has been set to 319</div><div class=3D"gm=
ail_quote">io scheduler noop registered</div><div class=3D"gmail_quote">io =
scheduler deadline registered</div><div class=3D"gmail_quote">io scheduler =
cfq registered (default)</div>
<div class=3D"gmail_quote">Serial: 8250/16550 driver, 4 ports, IRQ sharing =
enabled</div><div class=3D"gmail_quote">omap_uart.0: ttyO0 at MMIO 0x480200=
00 (irq =3D 72) is a OMAP UART0</div><div class=3D"gmail_quote">omap_uart.1=
: ttyO1 at MMIO 0x48022000 (irq =3D 73) is a OMAP UART1</div>
<div class=3D"gmail_quote">omap_uart.2: ttyO2 at MMIO 0x48024000 (irq =3D 7=
4) is a OMAP UART2</div><div class=3D"gmail_quote">console [ttyO2] enabled<=
/div><div class=3D"gmail_quote">brd: module loaded</div><div class=3D"gmail=
_quote">
loop: module loaded</div><div class=3D"gmail_quote">physmap platform flash =
device: 08000000 at 08000000</div><div class=3D"gmail_quote">physmap-flash.=
0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip=
 ID 0x002801</div>
<div class=3D"gmail_quote">Amd/Fujitsu Extended Query Table at 0x0040</div>=
<div class=3D"gmail_quote">=C2=A0 Amd/Fujitsu Extended Query version 1.5.</=
div><div class=3D"gmail_quote">Enabling Spansion 65nm mode, writesize =3D 5=
12 bytes</div>
<div class=3D"gmail_quote">number of CFI chips: 1</div><div class=3D"gmail_=
quote">RedBoot partition parsing not available</div><div class=3D"gmail_quo=
te">Using physmap partition information</div><div class=3D"gmail_quote">Cre=
ating 8 MTD partitions on &quot;physmap-flash.0&quot;:</div>
<div class=3D"gmail_quote">0x000000000000-0x000000040000 : &quot;u-boot&quo=
t;</div><div class=3D"gmail_quote">0x000000040000-0x000000060000 : &quot;u-=
boot_env1&quot;</div><div class=3D"gmail_quote">0x000000060000-0x0000000800=
00 : &quot;u-boot_env2&quot;</div>
<div class=3D"gmail_quote">0x000000080000-0x0000000a0000 : &quot;pad1&quot;=
</div><div class=3D"gmail_quote">0x0000000a0000-0x0000004a0000 : &quot;kern=
el_1&quot;</div><div class=3D"gmail_quote">0x0000004a0000-0x0000036a0000 : =
&quot;rootfs_1&quot;</div>
<div class=3D"gmail_quote">0x0000036a0000-0x0000068a0000 : &quot;appfs_1&qu=
ot;</div><div class=3D"gmail_quote">0x0000068a0000-0x000007b60000 : &quot;o=
verlay_1&quot;</div><div class=3D"gmail_quote">physmap platform flash devic=
e: 08000000 at 10000000</div>
<div class=3D"gmail_quote">physmap-flash.1: Found 1 x16 devices at 0x0 in 1=
6-bit bank. Manufacturer ID 0x000001 Chip ID 0x002801</div><div class=3D"gm=
ail_quote">Amd/Fujitsu Extended Query Table at 0x0040</div><div class=3D"gm=
ail_quote">
=C2=A0 Amd/Fujitsu Extended Query version 1.5.</div><div class=3D"gmail_quo=
te">Enabling Spansion 65nm mode, writesize =3D 512 bytes</div><div class=3D=
"gmail_quote">number of CFI chips: 1</div><div class=3D"gmail_quote">RedBoo=
t partition parsing not available</div>
<div class=3D"gmail_quote">Using physmap partition information</div><div cl=
ass=3D"gmail_quote">Creating 8 MTD partitions on &quot;physmap-flash.1&quot=
;:</div><div class=3D"gmail_quote">0x000000000000-0x000000040000 : &quot;u-=
boot&quot;</div>
<div class=3D"gmail_quote">0x000000040000-0x000000060000 : &quot;u-boot_env=
1&quot;</div><div class=3D"gmail_quote">0x000000060000-0x000000080000 : &qu=
ot;u-boot_env2&quot;</div><div class=3D"gmail_quote">0x000000080000-0x00000=
00a0000 : &quot;pad2&quot;</div>
<div class=3D"gmail_quote">0x0000000a0000-0x0000004a0000 : &quot;kernel_2&q=
uot;</div><div class=3D"gmail_quote">0x0000004a0000-0x0000036a0000 : &quot;=
rootfs_2&quot;</div><div class=3D"gmail_quote">0x0000036a0000-0x0000068a000=
0 : &quot;appfs_2&quot;</div>
<div class=3D"gmail_quote">0x0000068a0000-0x000007b60000 : &quot;overlay_2&=
quot;</div><div class=3D"gmail_quote">davinci_mdio davinci_mdio.0: davinci =
mdio revision 1.6</div><div class=3D"gmail_quote">davinci_mdio davinci_mdio=
.0: detected phy mask fffffffc</div>
<div class=3D"gmail_quote">davinci_mdio.0: probed</div><div class=3D"gmail_=
quote">davinci_mdio davinci_mdio.0: phy[0]: device 0:00, driver unknown</di=
v><div class=3D"gmail_quote">davinci_mdio davinci_mdio.0: phy[1]: device 0:=
01, driver unknown</div>
<div class=3D"gmail_quote">PPP generic driver version 2.4.2</div><div class=
=3D"gmail_quote">usbcore: registered new interface driver asix</div><div cl=
ass=3D"gmail_quote">usbcore: registered new interface driver cdc_ether</div=
><div class=3D"gmail_quote">
usbcore: registered new interface driver dm9601</div><div class=3D"gmail_qu=
ote">ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Controller (EHCI) Driver</di=
v><div class=3D"gmail_quote">ohci_hcd: USB 1.1 &#39;Open&#39; Host Controll=
er (OHCI) Driver</div>
<div class=3D"gmail_quote">uhci_hcd: USB Universal Host Controller Interfac=
e driver</div><div class=3D"gmail_quote">usbcore: registered new interface =
driver uas</div><div class=3D"gmail_quote">Initializing USB Mass Storage dr=
iver...</div>
<div class=3D"gmail_quote">usbcore: registered new interface driver usb-sto=
rage</div><div class=3D"gmail_quote">USB Mass Storage support registered.</=
div><div class=3D"gmail_quote">usbcore: registered new interface driver ums=
-alauda</div>
<div class=3D"gmail_quote">usbcore: registered new interface driver ums-cyp=
ress</div><div class=3D"gmail_quote">usbcore: registered new interface driv=
er ums-datafab</div><div class=3D"gmail_quote">usbcore: registered new inte=
rface driver ums-freecom</div>
<div class=3D"gmail_quote">usbcore: registered new interface driver ums-isd=
200</div><div class=3D"gmail_quote">usbcore: registered new interface drive=
r ums-jumpshot</div><div class=3D"gmail_quote">usbcore: registered new inte=
rface driver ums-karma</div>
<div class=3D"gmail_quote">usbcore: registered new interface driver ums-one=
touch</div><div class=3D"gmail_quote">usbcore: registered new interface dri=
ver ums-sddr09</div><div class=3D"gmail_quote">usbcore: registered new inte=
rface driver ums-sddr55</div>
<div class=3D"gmail_quote">usbcore: registered new interface driver ums-usb=
at</div><div class=3D"gmail_quote">mice: PS/2 mouse device common for all m=
ice</div><div class=3D"gmail_quote">usb 1-1: new high speed USB device usin=
g musb-hdrc and address 2</div>
<div class=3D"gmail_quote">rtc-ds1307 1-0068: rtc core: registered ds1337 a=
s rtc0</div><div class=3D"gmail_quote">i2c /dev entries driver</div><div cl=
ass=3D"gmail_quote">OMAP Watchdog Timer Rev 0x00: initial timeout 60 sec</d=
iv>
<div class=3D"gmail_quote">sdhci: Secure Digital Host Controller Interface =
driver</div><div class=3D"gmail_quote">sdhci: Copyright(c) Pierre Ossman</d=
iv><div class=3D"gmail_quote">Unable to handle kernel NULL pointer derefere=
nce at virtual address 00000002</div>
<div class=3D"gmail_quote">pgd =3D c0004000</div><div class=3D"gmail_quote"=
>[00000002] *pgd=3D00000000</div><div class=3D"gmail_quote">Internal error:=
 Oops: 5 [#1]</div><div class=3D"gmail_quote">last sysfs file:=C2=A0</div><=
div class=3D"gmail_quote">
Modules linked in:</div><div class=3D"gmail_quote">CPU: 0 =C2=A0 =C2=A0Not =
tainted =C2=A0(2.6.37+ #1)</div><div class=3D"gmail_quote">PC is at strcmp+=
0xc/0x40</div><div class=3D"gmail_quote">LR is at omap_mbox_get+0x3c/0x1d0<=
/div><div class=3D"gmail_quote">
pc : [&lt;c01dfb34&gt;] =C2=A0 =C2=A0lr : [&lt;c0061db8&gt;] =C2=A0 =C2=A0p=
sr: a0000013</div><div class=3D"gmail_quote">sp : ca023f20 =C2=A0ip : ca023=
f30 =C2=A0fp : ca023f2c</div><div class=3D"gmail_quote">r10: 00000000 =C2=
=A0r9 : 00000000 =C2=A0r8 : 00000000</div>
<div class=3D"gmail_quote">r7 : 00000013 =C2=A0r6 : c040ce09 =C2=A0r5 : c04=
a05d8 =C2=A0r4 : c04815c8</div><div class=3D"gmail_quote">r3 : 00000064 =C2=
=A0r2 : 00000076 =C2=A0r1 : c040ce09 =C2=A0r0 : 00000002</div><div class=3D=
"gmail_quote">Flags: NzCv =C2=A0IRQs on =C2=A0FIQs on =C2=A0Mode SVC_32 =C2=
=A0ISA ARM =C2=A0Segment kernel</div>
<div class=3D"gmail_quote">Control: 10c5387d =C2=A0Table: 80004019 =C2=A0DA=
C: 00000017</div><div class=3D"gmail_quote">Process swapper (pid: 1, stack =
limit =3D 0xca0222e8)</div><div class=3D"gmail_quote">Stack: (0xca023f20 to=
 0xca024000)</div>
<div class=3D"gmail_quote">3f20: ca023f54 ca023f30 c0061db8 c01dfb34 c02ba2=
ec c01dfb34 00000000 c04a057c</div><div class=3D"gmail_quote">3f40: c04a057=
8 00000000 ca023f74 ca023f58 c02bde3c c0061d88 00000000 00000000</div><div =
class=3D"gmail_quote">
3f60: c002b480 c00251fc ca023fa4 ca023f78 c0025238 c02bdcb8 ca022000 c002b4=
80</div><div class=3D"gmail_quote">3f80: c00251fc 00000000 00000013 0000000=
0 00000000 00000000 ca023fdc ca023fa8</div><div class=3D"gmail_quote">3fa0:=
 c00373b8 c0025208 ca023fc4 00000196 c048d6dc c006adfc c002b480 c002b510</d=
iv>
<div class=3D"gmail_quote">3fc0: c006adfc 00000013 00000000 00000000 ca023f=
f4 ca023fe0 c0008d44 c0037304</div><div class=3D"gmail_quote">3fe0: 0000000=
0 c0008ca4 00000000 ca023ff8 c006adfc c0008cb0 eda485b5 b186e796</div><div =
class=3D"gmail_quote">
Backtrace:=C2=A0</div><div class=3D"gmail_quote">[&lt;c01dfb28&gt;] (strcmp=
+0x0/0x40) from [&lt;c0061db8&gt;] (omap_mbox_get+0x3c/0x1d0)</div><div cla=
ss=3D"gmail_quote">[&lt;c0061d7c&gt;] (omap_mbox_get+0x0/0x1d0) from [&lt;c=
02bde3c&gt;] (notify_shm_drv_setup+0x190/0x268)</div>
<div class=3D"gmail_quote">=C2=A0r6:00000000 r5:c04a0578 r4:c04a057c</div><=
div class=3D"gmail_quote">[&lt;c02bdcac&gt;] (notify_shm_drv_setup+0x0/0x26=
8) from [&lt;c0025238&gt;] (notify_init+0x3c/0x2b0)</div><div class=3D"gmai=
l_quote">
=C2=A0r5:c00251fc r4:c002b480</div><div class=3D"gmail_quote">[&lt;c00251fc=
&gt;] (notify_init+0x0/0x2b0) from [&lt;c00373b8&gt;] (do_one_initcall+0xc0=
/0x194)</div><div class=3D"gmail_quote">[&lt;c00372f8&gt;] (do_one_initcall=
+0x0/0x194) from [&lt;c0008d44&gt;] (kernel_init+0xa0/0x14c)</div>
<div class=3D"gmail_quote">=C2=A0r9:00000000 r8:00000000 r7:00000013 r6:c00=
6adfc r5:c002b510</div><div class=3D"gmail_quote">r4:c002b480</div><div cla=
ss=3D"gmail_quote">[&lt;c0008ca4&gt;] (kernel_init+0x0/0x14c) from [&lt;c00=
6adfc&gt;] (do_exit+0x0/0x5dc)</div>
<div class=3D"gmail_quote">=C2=A0r5:c0008ca4 r4:00000000</div><div class=3D=
"gmail_quote">Code: e89da800 e1a0c00d e92dd800 e24cb004 (e4d03001)=C2=A0</d=
iv><div class=3D"gmail_quote">---[ end trace d65e423459d53e0a ]---</div><di=
v class=3D"gmail_quote">
Kernel panic - not syncing: Attempted to kill init!</div><div class=3D"gmai=
l_quote">Backtrace:=C2=A0</div><div class=3D"gmail_quote">[&lt;c0044d10&gt;=
] (dump_backtrace+0x0/0x110) from [&lt;c03567d8&gt;] (dump_stack+0x18/0x1c)=
</div>
<div class=3D"gmail_quote">=C2=A0r6:ca022000 r5:0000000b r4:c04a6898 r3:c04=
8329c</div><div class=3D"gmail_quote">[&lt;c03567c0&gt;] (dump_stack+0x0/0x=
1c) from [&lt;c03569c0&gt;] (panic+0x5c/0x178)</div><div class=3D"gmail_quo=
te">[&lt;c0356964&gt;] (panic+0x0/0x178) from [&lt;c006ae64&gt;] (do_exit+0=
x68/0x5dc)</div>
<div class=3D"gmail_quote">=C2=A0r3:c04848a4 r2:ca023cf8 r1:00000001 r0:c04=
0f24d</div><div class=3D"gmail_quote">=C2=A0r7:ca020000</div><div class=3D"=
gmail_quote">[&lt;c006adfc&gt;] (do_exit+0x0/0x5dc) from [&lt;c0045180&gt;]=
 (die+0x2ac/0x2e8)</div>
<div class=3D"gmail_quote">=C2=A0r7:00000000</div><div class=3D"gmail_quote=
">[&lt;c0044ed4&gt;] (die+0x0/0x2e8) from [&lt;c0356838&gt;] (__do_kernel_f=
ault.part.3+0x5c/0x7c)</div><div class=3D"gmail_quote">[&lt;c03567dc&gt;] (=
__do_kernel_fault.part.3+0x0/0x7c) from [&lt;c035cf04&gt;] (do_page_fault+0=
x1f8/0x214)</div>
<div class=3D"gmail_quote">=C2=A0r7:00000000 r3:ca023ed8</div><div class=3D=
"gmail_quote">[&lt;c035cd0c&gt;] (do_page_fault+0x0/0x214) from [&lt;c035cf=
44&gt;] (do_translation_fault+0x24/0xa8)</div><div class=3D"gmail_quote">[&=
lt;c035cf20&gt;] (do_translation_fault+0x0/0xa8) from [&lt;c00371f4&gt;] (d=
o_DataAbort+0x3c/0xa0)</div>
<div class=3D"gmail_quote">=C2=A0r7:ca023ed8 r6:00000002 r5:c046e560 r4:000=
00005</div><div class=3D"gmail_quote">[&lt;c00371b8&gt;] (do_DataAbort+0x0/=
0xa0) from [&lt;c035afec&gt;] (__dabt_svc+0x4c/0x60)</div><div class=3D"gma=
il_quote">
Exception stack(0xca023ed8 to 0xca023f20)</div><div class=3D"gmail_quote">3=
ec0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 00000002 c040ce09</div><div c=
lass=3D"gmail_quote">3ee0: 00000076 00000064 c04815c8 c04a05d8 c040ce09 000=
00013 00000000 00000000</div>
<div class=3D"gmail_quote">3f00: 00000000 ca023f2c ca023f30 ca023f20 c0061d=
b8 c01dfb34 a0000013 ffffffff</div><div class=3D"gmail_quote">=C2=A0r7:0000=
0013 r6:c040ce09 r5:ca023f0c r4:ffffffff</div><div class=3D"gmail_quote">[&=
lt;c01dfb28&gt;] (strcmp+0x0/0x40) from [&lt;c0061db8&gt;] (omap_mbox_get+0=
x3c/0x1d0)</div>
<div class=3D"gmail_quote">[&lt;c0061d7c&gt;] (omap_mbox_get+0x0/0x1d0) fro=
m [&lt;c02bde3c&gt;] (notify_shm_drv_setup+0x190/0x268)</div><div class=3D"=
gmail_quote">=C2=A0r6:00000000 r5:c04a0578 r4:c04a057c</div><div class=3D"g=
mail_quote">
[&lt;c02bdcac&gt;] (notify_shm_drv_setup+0x0/0x268) from [&lt;c0025238&gt;]=
 (notify_init+0x3c/0x2b0)</div><div class=3D"gmail_quote">=C2=A0r5:c00251fc=
 r4:c002b480</div><div class=3D"gmail_quote">[&lt;c00251fc&gt;] (notify_ini=
t+0x0/0x2b0) from [&lt;c00373b8&gt;] (do_one_initcall+0xc0/0x194)</div>
<div class=3D"gmail_quote">[&lt;c00372f8&gt;] (do_one_initcall+0x0/0x194) f=
rom [&lt;c0008d44&gt;] (kernel_init+0xa0/0x14c)</div><div class=3D"gmail_qu=
ote">=C2=A0r9:00000000 r8:00000000 r7:00000013 r6:c006adfc r5:c002b510</div=
><div class=3D"gmail_quote">
r4:c002b480</div><div class=3D"gmail_quote">[&lt;c0008ca4&gt;] (kernel_init=
+0x0/0x14c) from [&lt;c006adfc&gt;] (do_exit+0x0/0x5dc)</div><div class=3D"=
gmail_quote">=C2=A0r5:c0008ca4 r4:00000000</div></div><div class=3D"gmail_q=
uote"><br>
</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I&#39=
;ve read other messages that mailbox (mbox in the trace walk above) could b=
e a problem but we need to use syslink so I haven&#39;t tired turning it of=
f since that isn&#39;t an option.</div>
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">In thinking=
 of my options, I initially thought I could maybe get by with continuing to=
 use our u-boot/kernel build with CSL and just use a Cortex A8 based machin=
e with OE Core support (beagleboard or beaglebone) and generate the rootfs =
that I need that way since the ABI&#39;s should be compatible. =C2=A0But wi=
th the kernels being so far apart, now I&#39;m thinking that is probably a =
bad idea because the new packages are probably using new system calls (buil=
t against new kernel headers) the old kernel doesn&#39;t have. =C2=A0The co=
re-image-minimal rootfs does come up when I try using a new OE Core rootfs =
with my old kernel but I noticed a strange message from udev and then notic=
ed that it looked like one of my udev rules wasn&#39;t working to mount one=
 of our usb based NAND flashes and I think that is probably because of the =
differences in the ABI&#39;s I mentioned.</div>
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">So I really=
 don&#39;t know where to go from here. =C2=A0I can&#39;t be stuck with OE C=
lassic forever. =C2=A0Our customers are demanding current packages so I nee=
d OE Core. =C2=A0I guess it is possible to make poky or arago use and old t=
oolchain to build new OE Core packages so the ABI&#39;s all match but I&#39=
;ve never tried to go down that path. =C2=A0I would also have make the root=
fs packages be built against my old kernel headers and I&#39;m not too sure=
 about how to go about that either.</div>
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Any words o=
f wisdom?</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Regards,</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">Brian</div>
<div class=3D"gmail_quote"><br></div></div></div></div>

--089e013cb85cafc99504e4120697--
