Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97952E00B67; Fri,  9 May 2014 03:31:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.195 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from mail-lb0-f195.google.com (unknown [209.85.217.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91952E00B60
	for <meta-ti@yoctoproject.org>; Fri,  9 May 2014 03:31:04 -0700 (PDT)
Received: by mail-lb0-f195.google.com with SMTP id l4so1508244lbv.6
	for <meta-ti@yoctoproject.org>; Fri, 09 May 2014 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=m7V0vQnvjUZh02HNIb12RcWttPd9PItYbGNpUrXVBdw=;
	b=KBltw+q4HLNSeyKcuBRxvzgLgRbI+VsnGr18lGjd1bjrro36mvp1wRgvBU2KuS/nRv
	dNYCXarmk6beOWSWYRzOxK1qs4OBr+NcyutYQFWFqMpLgn2ZyxuXa0PTIsQaRmsfU82p
	I+y4x5TjpR4cmJt2uYXryShYIpz6WaS5xHdztg0sfQJ+IF1E0W7HZk0JNtJ4scoY4w87
	OFV/7YI++5GUmOb7fuilFziwrohrsfPdf3gZ1GGN/Odr7JnQNngISjMJQoa0hIoJvLgK
	5GTfIAlo1J8iaTYRlLEr9LmVW7zOz0kkodQSkmViKiZMhYaitlYDSViUMYBxwd0vQjeE
	1U5g==
MIME-Version: 1.0
X-Received: by 10.152.205.106 with SMTP id lf10mr1388552lac.21.1399631462726; 
	Fri, 09 May 2014 03:31:02 -0700 (PDT)
Sender: deepakvijay2255@gmail.com
Received: by 10.112.47.70 with HTTP; Fri, 9 May 2014 03:31:02 -0700 (PDT)
In-Reply-To: <CAAxuRXg9LxvzRzcu4V9awG8D0zmV4u1VkFQLpxebj90bHz+OfA@mail.gmail.com>
References: <CAAxuRXg9LxvzRzcu4V9awG8D0zmV4u1VkFQLpxebj90bHz+OfA@mail.gmail.com>
Date: Fri, 9 May 2014 16:01:02 +0530
X-Google-Sender-Auth: 0U_zDoDV7wRt4GEPmGoAWfZ6iA8
Message-ID: <CAAxuRXipcVH8MXa=bG2cvHUpaPsHSGcH+yMrf=C4obSOz4606g@mail.gmail.com>
From: deepak vijay <deepakvijay2255@rediff.com>
To: meta-ti@yoctoproject.org
Subject: Re: Booting failed
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
X-List-Received-Date: Fri, 09 May 2014 10:31:09 -0000
Content-Type: multipart/alternative; boundary=001a1134990826fda804f8f51855

--001a1134990826fda804f8f51855
Content-Type: text/plain; charset=UTF-8

Hi,
When I configured Low level debugging and earlyprintk in bootargs I am
getting the following output logs of crashing.
U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12 (May 08 2014 - 15:01:46)

OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 EVM board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  512 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Read back SMSC id 0x92200000
Die ID #706a00029ff80000016842c911024007
Net:   smc911x-0
Hit any key to stop autoboot:  0
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

3214968 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.37
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3214904 Bytes = 3.1 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...


********Using machid 0x5ff from environment
Uncompressing Linux... done, booting the kernel.
[    0.000000] Linux version 2.6.37 (mistral@CPU000512U) (gcc version 4.8.2
(GCC) ) #2 Fri May 9 14:42:06
 IST 2014
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7),
cr=10c53c7d
[    0.000000] CPU: VIPT nonaliasing data cache, VIPT aliasing instruction
cache
[    0.000000] Machine: OMAP3 EVM
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Reserving 4194304 bytes SDRAM for VRAM
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] OMAP3630 ES1.2 (l2cache iva sgx neon isp 192mhz_clk )
[    0.000000] SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x10000
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
 Total pages: 64000
[    0.000000] Kernel command line: console=ttyO0,115200n8 earlyprintk
root=/dev/mmcblk0p2 rw rootfstype=
ext3 rootwait
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 252MB = 252MB total
[    0.000000] Memory: 242156k/242156k available, 19988k reserved, 0K
highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
[    0.000000]     vmalloc : 0xd0800000 - 0xf8000000   ( 632 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .init : 0xc0008000 - 0xc003c000   ( 208 kB)
[    0.000000]       .text : 0xc003c000 - 0xc05eda00   (5831 kB)
[    0.000000]       .data : 0xc05ee000 - 0xc07afb60   (1799 kB)
[    0.000000] Unable to handle kernel paging request at virtual address
8002f130
[    0.000000] pgd = c0004000
[    0.000000] [8002f130] *pgd=00000000
[    0.000000] Internal error: Oops: 805 [#1]
[    0.000000] last sysfs file:
[    0.000000] Modules linked in:
[    0.000000] CPU: 0    Not tainted  (2.6.37 #2)
[    0.000000] PC is at perf_pmu_register+0x12c/0x178
[    0.000000] LR is at lockdep_init_map+0xb0/0x448
[    0.000000] pc : [<c00ca3e4>]    lr : [<c009bcd0>]    psr: a00001d3
[    0.000000] sp : c05eff90  ip : 00000000  fp : c05effd4
[    0.000000] r10: 0000001f  r9 : 413fc082  r8 : 000003f8
[    0.000000] r7 : c0605750  r6 : c05eff68  r5 : c0f4b010  r4 : c05eff68
[    0.000000] r3 : 8002f12c  r2 : c07789dc  r1 : c0548676  r0 : 00000001
[    0.000000] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
 Segment kernel
[    0.000000] Control: 10c5387d  Table: 80004019  DAC: 00000017
[    0.000000] Process swapper (pid: 0, stack limit = 0xc05ee2f0)
[    0.000000] Stack: (0xc05eff90 to 0xc05f0000)
[    0.000000] ff80:                                     c0778ba0 c07b0c40
c07b0c40 c0018588
[    0.000000] ffa0: c05ee000 c0015784 3b9aca00 00000000 00000000 00000001
c0030bb0 c07afb80
[    0.000000] ffc0: c0030bb0 c0f49100 c05f2d0c 8002f12c 00000000 c0008a0c
c000866c 000005ff
[    0.000000] ffe0: 80000100 c0030bb0 10c53c7d c07afd34 c0030bac 80008034
00000000 00000000
[    0.000000] [<c00ca3e4>] (perf_pmu_register+0x12c/0x178) from
[<c0018588>] (perf_event_init+0x3c/0xa4)
[    0.000000] [<c0018588>] (perf_event_init+0x3c/0xa4) from [<c0015784>]
(sched_init+0x200/0x24c)
[    0.000000] [<c0015784>] (sched_init+0x200/0x24c) from [<c0008a0c>]
(start_kernel+0x124/0x2d0)
[    0.000000] [<c0008a0c>] (start_kernel+0x124/0x2d0) from [<80008034>]
(0x80008034)
[    0.000000] Code: e59f204c e5843000 e5842004 e2422064 (e5834004)
[    0.000000] irq 56, desc: c0769a24, depth: 1, count: 0, unhandled: 0
[    0.000000] ->handle_irq():  c00adad0, handle_bad_irq+0x0/0x224
[    0.000000] ->irq_data.chip():   (null), 0x0
[    0.000000] ->action():   (null)
[    0.000000]   IRQ_DISABLED set
[    0.000000]    IRQ_NOPROBE set
[    0.000000]  IRQ_NOREQUEST set
[    0.000000] Unable to handle kernel NULL pointer dereference at virtual
address 00000000
[    0.000000] pgd = c0004000
[    0.000000] [00000000] *pgd=00000000
[    0.000000] Internal error: Oops: 5 [#2]
[    0.000000] last sysfs file:
[    0.000000] Modules linked in:
[    0.000000] CPU: 0    Tainted: G      D      (2.6.37 #2)
[    0.000000] PC is at handle_bad_irq+0x1a0/0x224
[    0.000000] LR is at handle_bad_irq+0x184/0x224
[    0.000000] pc : [<c00adc70>]    lr : [<c00adc54>]    psr: 400001d3
[    0.000000] sp : c05efd28  ip : ffffffff  fp : c00ca3e4
[    0.000000] r10: 00000017  r9 : 00000000  r8 : c05ee000
[    0.000000] r7 : c00ca3e6  r6 : 00000000  r5 : c078114c  r4 : c0769a24
[    0.000000] r3 : 00000000  r2 : 00000000  r1 : c05efc40  r0 : 00000025
[    0.000000] Flags: nZcv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
 Segment kernel
[    0.000000] Control: 10c5387d  Table: 80004019  DAC: 00000017
[    0.000000] Process swapper (pid: 0, stack limit = 0xc05ee2f0)
[    0.000000] Stack: (0xc05efd28 to 0xc05f0000)
[    0.000000] fd20:                   00000000 00000000 00000038 c003c070
ffffffff fa200000
[    0.000000] fd40: 00000001 c043c6b8 c043bee4 c05efd70 00000000 00000001
c05f2f30 c05efdda
[    0.000000] fd60: 00000001 c00ca3e6 c05ee000 00000000 00000017 c00ca3e4
ffffffff c05efd90
[    0.000000] fd80: c043bee4 c043bee8 60000153 ffffffff c05eff48 c0049800
c05ee2f0 0000000b
[    0.000000] fda0: 00000000 00000008 655f14a8 32663935 20633430 34383565
30303033 38356520





So from this I believe that it is because of kernel paging problem.
Please help me to resolve this.


Regards,
Deepak


On Thu, May 8, 2014 at 3:45 PM, deepak vijay <deepakvijay2255@rediff.com>wrote:

> Hi,
> I have build omap3evm images by including mata-ti layer.
> When I am trying to boot the omap3evm board it is stuck at "Uncompressing
> Linux... done, booting the kernel" this comment.
> Can any one help me to over come this issue.
> The boot logs are given below.
> U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)
> Texas Instruments Revision detection unimplemented
> OMAP SD/MMC: 0
> reading u-boot.img
> reading u-boot.img
>
>
> U-Boot 2011.12 (May 08 2014 - 15:01:46)
>
> OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
> OMAP3 EVM board + LPDDR/NAND
> I2C:   ready
> DRAM:  256 MiB
> NAND:  512 MiB
> MMC:   OMAP SD/MMC: 0
> *** Warning - bad CRC, using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Read back SMSC id 0x92200000
> Die ID #706a00029ff80000016842c911024007
> Net:   smc911x-0
> Hit any key to stop autoboot:  0
> reading boot.scr
>
> ** Unable to read "boot.scr" from mmc 0:1 **
> reading uImage
>
> 3139340 bytes read
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 82000000 ...
>    Image Name:   Linux-2.6.37
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    3139276 Bytes = 3 MiB
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
>
> Regards,
> Deepak Vijay
>

--001a1134990826fda804f8f51855
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>When I configured Low level debugging and earlypri=
ntk in bootargs I am getting the following output logs of crashing.</div><d=
iv><div>U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)</div><div>Texas Instrum=
ents Revision detection unimplemented</div>
<div>OMAP SD/MMC: 0</div><div>reading u-boot.img</div><div>reading u-boot.i=
mg</div><div><br></div><div><br></div><div>U-Boot 2011.12 (May 08 2014 - 15=
:01:46)</div><div><br></div><div>OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MH=
z, Max CPU Clock 1 Ghz</div>
<div>OMAP3 EVM board + LPDDR/NAND</div><div>I2C: =C2=A0 ready</div><div>DRA=
M: =C2=A0256 MiB</div><div>NAND: =C2=A0512 MiB</div><div>MMC: =C2=A0 OMAP S=
D/MMC: 0</div><div>In: =C2=A0 =C2=A0serial</div><div>Out: =C2=A0 serial</di=
v><div>Err: =C2=A0 serial</div><div>
Read back SMSC id 0x92200000</div><div>Die ID #706a00029ff80000016842c91102=
4007</div><div>Net: =C2=A0 smc911x-0</div><div>Hit any key to stop autoboot=
: =C2=A00=C2=A0</div><div>reading boot.scr</div><div><br></div><div>** Unab=
le to read &quot;boot.scr&quot; from mmc 0:1 **</div>
<div>reading uImage</div><div><br></div><div>3214968 bytes read</div><div>B=
ooting from mmc ...</div><div>## Booting kernel from Legacy Image at 820000=
00 ...</div><div>=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37</div><div>=C2=
=A0 =C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</div>
<div>=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A03214904 Bytes =3D 3.1 MiB</div><d=
iv>=C2=A0 =C2=A0Load Address: 80008000</div><div>=C2=A0 =C2=A0Entry Point: =
=C2=A080008000</div><div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><div>=
=C2=A0 =C2=A0Loading Kernel Image ... OK</div><div>OK</div><div>
<br></div><div>Starting kernel ...</div><div><br></div><div><br></div><div>=
********Using machid 0x5ff from environment</div><div>Uncompressing Linux..=
. done, booting the kernel.</div><div>[ =C2=A0 =C2=A00.000000] Linux versio=
n 2.6.37 (mistral@CPU000512U) (gcc version 4.8.2 (GCC) ) #2 Fri May 9 14:42=
:06</div>
<div>=C2=A0IST 2014</div><div>[ =C2=A0 =C2=A00.000000] CPU: ARMv7 Processor=
 [413fc082] revision 2 (ARMv7), cr=3D10c53c7d</div><div>[ =C2=A0 =C2=A00.00=
0000] CPU: VIPT nonaliasing data cache, VIPT aliasing instruction cache</di=
v><div>[ =C2=A0 =C2=A00.000000] Machine: OMAP3 EVM</div>
<div>[ =C2=A0 =C2=A00.000000] bootconsole [earlycon0] enabled</div><div>[ =
=C2=A0 =C2=A00.000000] Reserving 4194304 bytes SDRAM for VRAM</div><div>[ =
=C2=A0 =C2=A00.000000] Memory policy: ECC disabled, Data cache writeback</d=
iv><div>[ =C2=A0 =C2=A00.000000] OMAP3630 ES1.2 (l2cache iva sgx neon isp 1=
92mhz_clk )</div>
<div>[ =C2=A0 =C2=A00.000000] SRAM: Mapped pa 0x40200000 to va 0xfe400000 s=
ize: 0x10000</div><div>[ =C2=A0 =C2=A00.000000] Built 1 zonelists in Zone o=
rder, mobility grouping on. =C2=A0Total pages: 64000</div><div>[ =C2=A0 =C2=
=A00.000000] Kernel command line: console=3DttyO0,115200n8 earlyprintk root=
=3D/dev/mmcblk0p2 rw rootfstype=3D</div>
<div>ext3 rootwait</div><div>[ =C2=A0 =C2=A00.000000] PID hash table entrie=
s: 1024 (order: 0, 4096 bytes)</div><div>[ =C2=A0 =C2=A00.000000] Dentry ca=
che hash table entries: 32768 (order: 5, 131072 bytes)</div><div>[ =C2=A0 =
=C2=A00.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 byte=
s)</div>
<div>[ =C2=A0 =C2=A00.000000] Memory: 252MB =3D 252MB total</div><div>[ =C2=
=A0 =C2=A00.000000] Memory: 242156k/242156k available, 19988k reserved, 0K =
highmem</div><div>[ =C2=A0 =C2=A00.000000] Virtual kernel memory layout:</d=
iv><div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 vector =C2=A0: 0xffff0000 - =
0xffff1000 =C2=A0 ( =C2=A0 4 kB)</div>
<div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 fixmap =C2=A0: 0xfff00000 - 0xf=
ffe0000 =C2=A0 ( 896 kB)</div><div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 D=
MA =C2=A0 =C2=A0 : 0xffc00000 - 0xffe00000 =C2=A0 ( =C2=A0 2 MB)</div><div>=
[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 vmalloc : 0xd0800000 - 0xf8000000 =
=C2=A0 ( 632 MB)</div>
<div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 lowmem =C2=A0: 0xc0000000 - 0xd=
0000000 =C2=A0 ( 256 MB)</div><div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 m=
odules : 0xbf000000 - 0xc0000000 =C2=A0 ( =C2=A016 MB)</div><div>[ =C2=A0 =
=C2=A00.000000] =C2=A0 =C2=A0 =C2=A0 .init : 0xc0008000 - 0xc003c000 =C2=A0=
 ( 208 kB)</div>
<div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 =C2=A0 .text : 0xc003c000 - 0xc=
05eda00 =C2=A0 (5831 kB)</div><div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 =
=C2=A0 .data : 0xc05ee000 - 0xc07afb60 =C2=A0 (1799 kB)</div><div>[ =C2=A0 =
=C2=A00.000000] Unable to handle kernel paging request at virtual address 8=
002f130</div>
<div>[ =C2=A0 =C2=A00.000000] pgd =3D c0004000</div><div>[ =C2=A0 =C2=A00.0=
00000] [8002f130] *pgd=3D00000000</div><div>[ =C2=A0 =C2=A00.000000] Intern=
al error: Oops: 805 [#1]</div><div>[ =C2=A0 =C2=A00.000000] last sysfs file=
:=C2=A0</div><div>[ =C2=A0 =C2=A00.000000] Modules linked in:</div>
<div>[ =C2=A0 =C2=A00.000000] CPU: 0 =C2=A0 =C2=A0Not tainted =C2=A0(2.6.37=
 #2)</div><div>[ =C2=A0 =C2=A00.000000] PC is at perf_pmu_register+0x12c/0x=
178</div><div>[ =C2=A0 =C2=A00.000000] LR is at lockdep_init_map+0xb0/0x448=
</div><div>[ =C2=A0 =C2=A00.000000] pc : [&lt;c00ca3e4&gt;] =C2=A0 =C2=A0lr=
 : [&lt;c009bcd0&gt;] =C2=A0 =C2=A0psr: a00001d3</div>
<div>[ =C2=A0 =C2=A00.000000] sp : c05eff90 =C2=A0ip : 00000000 =C2=A0fp : =
c05effd4</div><div>[ =C2=A0 =C2=A00.000000] r10: 0000001f =C2=A0r9 : 413fc0=
82 =C2=A0r8 : 000003f8</div><div>[ =C2=A0 =C2=A00.000000] r7 : c0605750 =C2=
=A0r6 : c05eff68 =C2=A0r5 : c0f4b010 =C2=A0r4 : c05eff68</div>
<div>[ =C2=A0 =C2=A00.000000] r3 : 8002f12c =C2=A0r2 : c07789dc =C2=A0r1 : =
c0548676 =C2=A0r0 : 00000001</div><div>[ =C2=A0 =C2=A00.000000] Flags: NzCv=
 =C2=A0IRQs off =C2=A0FIQs off =C2=A0Mode SVC_32 =C2=A0ISA ARM =C2=A0Segmen=
t kernel</div><div>[ =C2=A0 =C2=A00.000000] Control: 10c5387d =C2=A0Table: =
80004019 =C2=A0DAC: 00000017</div>
<div>[ =C2=A0 =C2=A00.000000] Process swapper (pid: 0, stack limit =3D 0xc0=
5ee2f0)</div><div>[ =C2=A0 =C2=A00.000000] Stack: (0xc05eff90 to 0xc05f0000=
)</div><div>[ =C2=A0 =C2=A00.000000] ff80: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 c0778ba0 c07b0c40 c07b0c40 c0018588</div>
<div>[ =C2=A0 =C2=A00.000000] ffa0: c05ee000 c0015784 3b9aca00 00000000 000=
00000 00000001 c0030bb0 c07afb80</div><div>[ =C2=A0 =C2=A00.000000] ffc0: c=
0030bb0 c0f49100 c05f2d0c 8002f12c 00000000 c0008a0c c000866c 000005ff</div=
><div>[ =C2=A0 =C2=A00.000000] ffe0: 80000100 c0030bb0 10c53c7d c07afd34 c0=
030bac 80008034 00000000 00000000</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c00ca3e4&gt;] (perf_pmu_register+0x12c/0=
x178) from [&lt;c0018588&gt;] (perf_event_init+0x3c/0xa4)</div><div>[ =C2=
=A0 =C2=A00.000000] [&lt;c0018588&gt;] (perf_event_init+0x3c/0xa4) from [&l=
t;c0015784&gt;] (sched_init+0x200/0x24c)</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c0015784&gt;] (sched_init+0x200/0x24c) f=
rom [&lt;c0008a0c&gt;] (start_kernel+0x124/0x2d0)</div><div>[ =C2=A0 =C2=A0=
0.000000] [&lt;c0008a0c&gt;] (start_kernel+0x124/0x2d0) from [&lt;80008034&=
gt;] (0x80008034)</div>
<div>[ =C2=A0 =C2=A00.000000] Code: e59f204c e5843000 e5842004 e2422064 (e5=
834004)=C2=A0</div><div>[ =C2=A0 =C2=A00.000000] irq 56, desc: c0769a24, de=
pth: 1, count: 0, unhandled: 0</div><div>[ =C2=A0 =C2=A00.000000] -&gt;hand=
le_irq(): =C2=A0c00adad0, handle_bad_irq+0x0/0x224</div>
<div>[ =C2=A0 =C2=A00.000000] -&gt;irq_data.chip(): =C2=A0 (null), 0x0</div=
><div>[ =C2=A0 =C2=A00.000000] -&gt;action(): =C2=A0 (null)</div><div>[ =C2=
=A0 =C2=A00.000000] =C2=A0 IRQ_DISABLED set</div><div>[ =C2=A0 =C2=A00.0000=
00] =C2=A0 =C2=A0IRQ_NOPROBE set</div><div>[ =C2=A0 =C2=A00.000000] =C2=A0I=
RQ_NOREQUEST set</div>
<div>[ =C2=A0 =C2=A00.000000] Unable to handle kernel NULL pointer derefere=
nce at virtual address 00000000</div><div>[ =C2=A0 =C2=A00.000000] pgd =3D =
c0004000</div><div>[ =C2=A0 =C2=A00.000000] [00000000] *pgd=3D00000000</div=
><div>[ =C2=A0 =C2=A00.000000] Internal error: Oops: 5 [#2]</div>
<div>[ =C2=A0 =C2=A00.000000] last sysfs file:=C2=A0</div><div>[ =C2=A0 =C2=
=A00.000000] Modules linked in:</div><div>[ =C2=A0 =C2=A00.000000] CPU: 0 =
=C2=A0 =C2=A0Tainted: G =C2=A0 =C2=A0 =C2=A0D =C2=A0 =C2=A0 =C2=A0(2.6.37 #=
2)</div><div>[ =C2=A0 =C2=A00.000000] PC is at handle_bad_irq+0x1a0/0x224</=
div><div>
[ =C2=A0 =C2=A00.000000] LR is at handle_bad_irq+0x184/0x224</div><div>[ =
=C2=A0 =C2=A00.000000] pc : [&lt;c00adc70&gt;] =C2=A0 =C2=A0lr : [&lt;c00ad=
c54&gt;] =C2=A0 =C2=A0psr: 400001d3</div><div>[ =C2=A0 =C2=A00.000000] sp :=
 c05efd28 =C2=A0ip : ffffffff =C2=A0fp : c00ca3e4</div><div>
[ =C2=A0 =C2=A00.000000] r10: 00000017 =C2=A0r9 : 00000000 =C2=A0r8 : c05ee=
000</div><div>[ =C2=A0 =C2=A00.000000] r7 : c00ca3e6 =C2=A0r6 : 00000000 =
=C2=A0r5 : c078114c =C2=A0r4 : c0769a24</div><div>[ =C2=A0 =C2=A00.000000] =
r3 : 00000000 =C2=A0r2 : 00000000 =C2=A0r1 : c05efc40 =C2=A0r0 : 00000025</=
div>
<div>[ =C2=A0 =C2=A00.000000] Flags: nZcv =C2=A0IRQs off =C2=A0FIQs off =C2=
=A0Mode SVC_32 =C2=A0ISA ARM =C2=A0Segment kernel</div><div>[ =C2=A0 =C2=A0=
0.000000] Control: 10c5387d =C2=A0Table: 80004019 =C2=A0DAC: 00000017</div>=
<div>[ =C2=A0 =C2=A00.000000] Process swapper (pid: 0, stack limit =3D 0xc0=
5ee2f0)</div>
<div>[ =C2=A0 =C2=A00.000000] Stack: (0xc05efd28 to 0xc05f0000)</div><div>[=
 =C2=A0 =C2=A00.000000] fd20: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 00000000 00000000 00000038 c003c070 ffffffff fa200000</di=
v><div>[ =C2=A0 =C2=A00.000000] fd40: 00000001 c043c6b8 c043bee4 c05efd70 0=
0000000 00000001 c05f2f30 c05efdda</div>
<div>[ =C2=A0 =C2=A00.000000] fd60: 00000001 c00ca3e6 c05ee000 00000000 000=
00017 c00ca3e4 ffffffff c05efd90</div><div>[ =C2=A0 =C2=A00.000000] fd80: c=
043bee4 c043bee8 60000153 ffffffff c05eff48 c0049800 c05ee2f0 0000000b</div=
><div>[ =C2=A0 =C2=A00.000000] fda0: 00000000 00000008 655f14a8 32663935 20=
633430 34383565 30303033 38356520</div>
</div><div><br></div><div><br></div><div><br></div><div><br></div><div><br>=
</div><div>So from this I believe that it is because of kernel paging probl=
em.</div><div>Please help me to resolve this.</div><div><br></div><div>
<br></div><div>Regards,</div><div>Deepak=C2=A0</div></div><div class=3D"gma=
il_extra"><br><br><div class=3D"gmail_quote">On Thu, May 8, 2014 at 3:45 PM=
, deepak vijay <span dir=3D"ltr">&lt;<a href=3D"mailto:deepakvijay2255@redi=
ff.com" target=3D"_blank">deepakvijay2255@rediff.com</a>&gt;</span> wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div>I have build omap3e=
vm images by including mata-ti layer.</div><div>When I am trying to boot th=
e omap3evm board it is stuck at &quot;Uncompressing Linux... done, booting =
the kernel&quot; this comment.</div>

<div>Can any one help me to over come this issue.</div><div>The boot logs a=
re given below.</div><div><div>U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)<=
/div><div>Texas Instruments Revision detection unimplemented</div><div>

OMAP SD/MMC: 0</div><div>reading u-boot.img</div><div>reading u-boot.img</d=
iv><div><br></div><div><br></div><div>U-Boot 2011.12 (May 08 2014 - 15:01:4=
6)</div><div><br></div><div>OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Ma=
x CPU Clock 1 Ghz</div>

<div>OMAP3 EVM board + LPDDR/NAND</div><div>I2C: =C2=A0 ready</div><div>DRA=
M: =C2=A0256 MiB</div><div>NAND: =C2=A0512 MiB</div><div>MMC: =C2=A0 OMAP S=
D/MMC: 0</div><div>*** Warning - bad CRC, using default environment</div><d=
iv><br></div><div>

In: =C2=A0 =C2=A0serial</div><div>Out: =C2=A0 serial</div><div>Err: =C2=A0 =
serial</div><div>Read back SMSC id 0x92200000</div><div>Die ID #706a00029ff=
80000016842c911024007</div><div>Net: =C2=A0 smc911x-0</div><div>Hit any key=
 to stop autoboot: =C2=A00=C2=A0</div>

<div>reading boot.scr</div><div><br></div><div>** Unable to read &quot;boot=
.scr&quot; from mmc 0:1 **</div><div>reading uImage</div><div><br></div><di=
v>3139340 bytes read</div><div>Booting from mmc ...</div><div>## Booting ke=
rnel from Legacy Image at 82000000 ...</div>

<div>=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37</div><div>=C2=A0 =C2=A0Im=
age Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</div><div>=C2=A0 =C2=
=A0Data Size: =C2=A0 =C2=A03139276 Bytes =3D 3 MiB</div><div>=C2=A0 =C2=A0L=
oad Address: 80008000</div><div>=C2=A0 =C2=A0Entry Point: =C2=A080008000</d=
iv>

<div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><div>=C2=A0 =C2=A0Loading =
Kernel Image ... OK</div><div>OK</div><div><br></div><div>Starting kernel .=
..</div><div><br></div><div>Uncompressing Linux... done, booting the kernel=
.</div></div><div>

<br></div><div><br></div><div>Regards,</div><div>Deepak Vijay</div></div>
</blockquote></div><br></div>

--001a1134990826fda804f8f51855--
