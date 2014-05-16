Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77513E00B1E; Fri, 16 May 2014 00:15:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70BB2E00975
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 00:15:24 -0700 (PDT)
Received: by mail-lb0-f195.google.com with SMTP id l4so518305lbv.6
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=RWPXxfQvqQqtizS5O7t3QCSX35c52Ak6D2UzvjMxALs=;
	b=MJykoyMuPmyAdvw11GtnsyUhPCe8ZsMR3bbvOyVi7yWcPrzd/adcQxDa1gtvpX3wgy
	Dp9IigIMGT7iUCMjDXrFaejO9KUSANwXa2z/95LGM8A4x7aqHHnQGOz/Gjaz3EcXQFtE
	o2aKr3L7ZSlkRHDy4252Y0lhX8uIME+TpHff8n5SNioBB+jVJtRlzkti28VqMcwDbEbF
	/PsbTaE8dobiim90c/JCo9ShFSGrQ5UnsQWgWzsr3PzPEOrgVSCC8JJNupqlkuU0+eLf
	hVqlbLqj8aB13ij4qnc40N5E47g6YXsHYQhQwevuN1rCQHMQZAynzoFTAAd042TyxMLK
	aFQA==
MIME-Version: 1.0
X-Received: by 10.152.199.104 with SMTP id jj8mr179202lac.70.1400223811534;
	Fri, 16 May 2014 00:03:31 -0700 (PDT)
Sender: deepakvijay2255@gmail.com
Received: by 10.112.159.132 with HTTP; Fri, 16 May 2014 00:03:31 -0700 (PDT)
Date: Fri, 16 May 2014 12:33:31 +0530
X-Google-Sender-Auth: PJaNMs3cJTYZts96Lp4OM-5cqRM
Message-ID: <CAAxuRXhiK2cce86W7wWrahrOC=jaAqyVXaU_KCFwg2cQqJR0NQ@mail.gmail.com>
From: deepak vijay <deepakvijay2255@rediff.com>
To: meta-ti@yoctoproject.org
Subject: boot fail in omap3 evm
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
X-List-Received-Date: Fri, 16 May 2014 07:15:28 -0000
Content-Type: multipart/alternative; boundary=001a1134c1f8e482aa04f97f0252

--001a1134c1f8e482aa04f97f0252
Content-Type: text/plain; charset=UTF-8

Hi all,
I am new to yocto project .
I have downloaded the beaglebone-daisy-11.0.0 and add meta-ti layer whith a
commit id of 4e5bcb5712bf2f0587ceff908d75177e410de48f.
And when I build it for omap3evm and boot the images of the build I am
getting the following dump logs when I enable earlyprintk without changing
any other configurations.

U-Boot SPL 2011.12 (May 15 2014 - 15:54:30)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
timed out in wait_for_bb: I2C_STAT=1000
reading u-boot.img
reading u-boot.img


U-Boot 2011.12 (May 15 2014 - 15:54:30)

OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 EVM board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
NAND:  512 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Read back SMSC id 0x1150000
Die ID #706a00029ff80000016842c911024007
Net:   smc911x: Invalid chip endian 0x87754331
No ethernet found.
Hit any key to stop autoboot:  0
reading boot.scr

** Unable to read "boot.scr" from mmc 0:1 **
reading uImage

3145636 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.37
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3145572 Bytes = 3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Linux version 2.6.37 (mistral@CPU000512U) (gcc version 4.8.2
(GCC) ) #3 Fri May 16 12:13:1
6 IST 2014
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
[    0.000000] Kernel command line: console=ttyO0,115200n8
root=/dev/mmcblk0p2 rw earlyprintk rootfstype=
ext3 rootwait
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 252MB = 252MB total
[    0.000000] Memory: 242288k/242288k available, 19856k reserved, 0K
highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
[    0.000000]     vmalloc : 0xd0800000 - 0xf8000000   ( 632 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .init : 0xc0008000 - 0xc003b000   ( 204 kB)
[    0.000000]       .text : 0xc003b000 - 0xc05cceac   (5704 kB)
[    0.000000]       .data : 0xc05ce000 - 0xc078efa0   (1796 kB)
[    0.000000] Unable to handle kernel paging request at virtual address
8002e800
[    0.000000] pgd = c0004000
[    0.000000] [8002e800] *pgd=00000000
[    0.000000] Internal error: Oops: 805 [#1]
[    0.000000] last sysfs file:
[    0.000000] Modules linked in:
[    0.000000] CPU: 0    Not tainted  (2.6.37 #3)
[    0.000000] PC is at perf_pmu_register+0x12c/0x178
[    0.000000] LR is at lockdep_init_map+0xb0/0x448
[    0.000000] pc : [<c00c93e4>]    lr : [<c009acd0>]    psr: a00001d3
[    0.000000] sp : c05cff90  ip : 00000000  fp : c05cffd4
[    0.000000] r10: 0000001f  r9 : 413fc082  r8 : 000003f8
[    0.000000] r7 : c05e5750  r6 : c05cff68  r5 : c0f2a010  r4 : c05cff68
[    0.000000] r3 : 8002e7fc  r2 : c07589dc  r1 : c0529d46  r0 : 00000001
[    0.000000] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
 Segment kernel
[    0.000000] Control: 10c5387d  Table: 80004019  DAC: 00000017
[    0.000000] Process swapper (pid: 0, stack limit = 0xc05ce2f0)
[    0.000000] Stack: (0xc05cff90 to 0xc05d0000)
[    0.000000] ff80:                                     c0758ba0 c0790080
c0790080 c0018588
[    0.000000] ffa0: c05ce000 c0015784 3b9aca00 00000000 00000000 00000001
c0030268 c078efc0
[    0.000000] ffc0: c0030268 c0f28100 c05d2d0c 8002e7fc 00000000 c0008a0c
c000866c 000005ff
[    0.000000] ffe0: 80000100 c0030268 10c53c7d c078f174 c0030264 80008034
00000000 00000000
[    0.000000] [<c00c93e4>] (perf_pmu_register+0x12c/0x178) from
[<c0018588>] (perf_event_init+0x3c/0xa4)
[    0.000000] [<c0018588>] (perf_event_init+0x3c/0xa4) from [<c0015784>]
(sched_init+0x200/0x24c)
[    0.000000] [<c0015784>] (sched_init+0x200/0x24c) from [<c0008a0c>]
(start_kernel+0x124/0x2d0)
[    0.000000] [<c0008a0c>] (start_kernel+0x124/0x2d0) from [<80008034>]
(0x80008034)
[    0.000000] Code: e59f204c e5843000 e5842004 e2422064 (e5834004)
[    0.000000] ---[ end trace 1b75b31a2719ed1c ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] [<c004a3a8>] (unwind_backtrace+0x0/0xe0) from [<c0419e08>]
(panic+0x54/0x178)
[    0.000000] [<c0419e08>] (panic+0x54/0x178) from [<c00747b0>]
(do_exit+0x6c/0x658)
[    0.000000] [<c00747b0>] (do_exit+0x6c/0x658) from [<c0048854>]
(die+0x2a8/0x2e8)
[    0.000000] [<c0048854>] (die+0x2a8/0x2e8) from [<c0419c74>]
(__do_kernel_fault.part.4+0x54/0x74)
[    0.000000] [<c0419c74>] (__do_kernel_fault.part.4+0x54/0x74) from
[<c0423348>] (do_page_fault.part.5+
0x284/0x2a0)
[    0.000000] [<c0423348>] (do_page_fault.part.5+0x284/0x2a0) from
[<c04233b0>] (do_page_fault+0x4c/0x58
)
[    0.000000] [<c04233b0>] (do_page_fault+0x4c/0x58) from [<c003b1f0>]
(do_DataAbort+0x34/0x98)
[    0.000000] [<c003b1f0>] (do_DataAbort+0x34/0x98) from [<c04214ec>]
(__dabt_svc+0x4c/0x60)
[    0.000000] Exception stack(0xc05cff48 to 0xc05cff90)
[    0.000000] ff40:                   00000001 c0529d46 c07589dc 8002e7fc
c05cff68 c0f2a010
[    0.000000] ff60: c05cff68 c05e5750 000003f8 413fc082 0000001f c05cffd4
00000000 c05cff90
[    0.000000] ff80: c009acd0 c00c93e4 a00001d3 ffffffff
[    0.000000] [<c04214ec>] (__dabt_svc+0x4c/0x60) from [<c00c93e4>]
(perf_pmu_register+0x12c/0x178)
[    0.000000] [<c00c93e4>] (perf_pmu_register+0x12c/0x178) from
[<c0018588>] (perf_event_init+0x3c/0xa4)
[    0.000000] [<c0018588>] (perf_event_init+0x3c/0xa4) from [<c0015784>]
(sched_init+0x200/0x24c)
[    0.000000] [<c0015784>] (sched_init+0x200/0x24c) from [<c0008a0c>]
(start_kernel+0x124/0x2d0)
[    0.000000] [<c0008a0c>] (start_kernel+0x124/0x2d0) from [<80008034>]
(0x80008034)


And one of the member suggested me that use lower version of gcc like gcc
4.3. But I didn't find any way to use it. Because only gcc 4.8.2 recipe is
there in the layer.

Please help me to overcome this issues.
Any replay is appreciated.

Regards,
Deepak Vijay

--001a1134c1f8e482aa04f97f0252
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div>I am new to yocto project .</div><div>I have d=
ownloaded the=C2=A0beaglebone-daisy-11.0.0 and add meta-ti layer whith a co=
mmit id of=C2=A04e5bcb5712bf2f0587ceff908d75177e410de48f.</div><div>And whe=
n I build it for omap3evm and boot the images of the build I am getting the=
 following dump logs when I enable earlyprintk without changing any other c=
onfigurations.</div>
<div><br></div><div><div>U-Boot SPL 2011.12 (May 15 2014 - 15:54:30)</div><=
div>Texas Instruments Revision detection unimplemented</div><div>OMAP SD/MM=
C: 0</div><div>timed out in wait_for_bb: I2C_STAT=3D1000</div><div>reading =
u-boot.img</div>
<div>reading u-boot.img</div><div><br></div><div><br></div><div>U-Boot 2011=
.12 (May 15 2014 - 15:54:30)</div><div><br></div><div>OMAP36XX/37XX-GP ES1.=
2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz</div><div>OMAP3 EVM board + LPD=
DR/NAND</div>
<div>I2C: =C2=A0 ready</div><div>DRAM: =C2=A0256 MiB</div><div>NAND: =C2=A0=
512 MiB</div><div>MMC: =C2=A0 OMAP SD/MMC: 0</div><div>In: =C2=A0 =C2=A0ser=
ial</div><div>Out: =C2=A0 serial</div><div>Err: =C2=A0 serial</div><div>Rea=
d back SMSC id 0x1150000</div><div>Die ID #706a00029ff80000016842c911024007=
</div>
<div>Net: =C2=A0 smc911x: Invalid chip endian 0x87754331</div><div>No ether=
net found.</div><div>Hit any key to stop autoboot: =C2=A00=C2=A0</div><div>=
reading boot.scr</div><div><br></div><div>** Unable to read &quot;boot.scr&=
quot; from mmc 0:1 **</div>
<div>reading uImage</div><div><br></div><div>3145636 bytes read</div><div>B=
ooting from mmc ...</div><div>## Booting kernel from Legacy Image at 820000=
00 ...</div><div>=C2=A0 =C2=A0Image Name: =C2=A0 Linux-2.6.37</div><div>=C2=
=A0 =C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</div>
<div>=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A03145572 Bytes =3D 3 MiB</div><div=
>=C2=A0 =C2=A0Load Address: 80008000</div><div>=C2=A0 =C2=A0Entry Point: =
=C2=A080008000</div><div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><div>=
=C2=A0 =C2=A0Loading Kernel Image ... OK</div><div>OK</div><div><br>
</div><div>Starting kernel ...</div><div><br></div><div>Uncompressing Linux=
... done, booting the kernel.</div><div>[ =C2=A0 =C2=A00.000000] Linux vers=
ion 2.6.37 (mistral@CPU000512U) (gcc version 4.8.2 (GCC) ) #3 Fri May 16 12=
:13:1</div>
<div>6 IST 2014</div><div>[ =C2=A0 =C2=A00.000000] CPU: ARMv7 Processor [41=
3fc082] revision 2 (ARMv7), cr=3D10c53c7d</div><div>[ =C2=A0 =C2=A00.000000=
] CPU: VIPT nonaliasing data cache, VIPT aliasing instruction cache</div><d=
iv>[ =C2=A0 =C2=A00.000000] Machine: OMAP3 EVM</div>
<div>[ =C2=A0 =C2=A00.000000] bootconsole [earlycon0] enabled</div><div>[ =
=C2=A0 =C2=A00.000000] Reserving 4194304 bytes SDRAM for VRAM</div><div>[ =
=C2=A0 =C2=A00.000000] Memory policy: ECC disabled, Data cache writeback</d=
iv><div>[ =C2=A0 =C2=A00.000000] OMAP3630 ES1.2 (l2cache iva sgx neon isp 1=
92mhz_clk )</div>
<div>[ =C2=A0 =C2=A00.000000] SRAM: Mapped pa 0x40200000 to va 0xfe400000 s=
ize: 0x10000</div><div>[ =C2=A0 =C2=A00.000000] Built 1 zonelists in Zone o=
rder, mobility grouping on. =C2=A0Total pages: 64000</div><div>[ =C2=A0 =C2=
=A00.000000] Kernel command line: console=3DttyO0,115200n8 root=3D/dev/mmcb=
lk0p2 rw earlyprintk rootfstype=3D</div>
<div>ext3 rootwait</div><div>[ =C2=A0 =C2=A00.000000] PID hash table entrie=
s: 1024 (order: 0, 4096 bytes)</div><div>[ =C2=A0 =C2=A00.000000] Dentry ca=
che hash table entries: 32768 (order: 5, 131072 bytes)</div><div>[ =C2=A0 =
=C2=A00.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 byte=
s)</div>
<div>[ =C2=A0 =C2=A00.000000] Memory: 252MB =3D 252MB total</div><div>[ =C2=
=A0 =C2=A00.000000] Memory: 242288k/242288k available, 19856k reserved, 0K =
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
=C2=A00.000000] =C2=A0 =C2=A0 =C2=A0 .init : 0xc0008000 - 0xc003b000 =C2=A0=
 ( 204 kB)</div>
<div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 =C2=A0 .text : 0xc003b000 - 0xc=
05cceac =C2=A0 (5704 kB)</div><div>[ =C2=A0 =C2=A00.000000] =C2=A0 =C2=A0 =
=C2=A0 .data : 0xc05ce000 - 0xc078efa0 =C2=A0 (1796 kB)</div><div>[ =C2=A0 =
=C2=A00.000000] Unable to handle kernel paging request at virtual address 8=
002e800</div>
<div>[ =C2=A0 =C2=A00.000000] pgd =3D c0004000</div><div>[ =C2=A0 =C2=A00.0=
00000] [8002e800] *pgd=3D00000000</div><div>[ =C2=A0 =C2=A00.000000] Intern=
al error: Oops: 805 [#1]</div><div>[ =C2=A0 =C2=A00.000000] last sysfs file=
:=C2=A0</div><div>[ =C2=A0 =C2=A00.000000] Modules linked in:</div>
<div>[ =C2=A0 =C2=A00.000000] CPU: 0 =C2=A0 =C2=A0Not tainted =C2=A0(2.6.37=
 #3)</div><div>[ =C2=A0 =C2=A00.000000] PC is at perf_pmu_register+0x12c/0x=
178</div><div>[ =C2=A0 =C2=A00.000000] LR is at lockdep_init_map+0xb0/0x448=
</div><div>[ =C2=A0 =C2=A00.000000] pc : [&lt;c00c93e4&gt;] =C2=A0 =C2=A0lr=
 : [&lt;c009acd0&gt;] =C2=A0 =C2=A0psr: a00001d3</div>
<div>[ =C2=A0 =C2=A00.000000] sp : c05cff90 =C2=A0ip : 00000000 =C2=A0fp : =
c05cffd4</div><div>[ =C2=A0 =C2=A00.000000] r10: 0000001f =C2=A0r9 : 413fc0=
82 =C2=A0r8 : 000003f8</div><div>[ =C2=A0 =C2=A00.000000] r7 : c05e5750 =C2=
=A0r6 : c05cff68 =C2=A0r5 : c0f2a010 =C2=A0r4 : c05cff68</div>
<div>[ =C2=A0 =C2=A00.000000] r3 : 8002e7fc =C2=A0r2 : c07589dc =C2=A0r1 : =
c0529d46 =C2=A0r0 : 00000001</div><div>[ =C2=A0 =C2=A00.000000] Flags: NzCv=
 =C2=A0IRQs off =C2=A0FIQs off =C2=A0Mode SVC_32 =C2=A0ISA ARM =C2=A0Segmen=
t kernel</div><div>[ =C2=A0 =C2=A00.000000] Control: 10c5387d =C2=A0Table: =
80004019 =C2=A0DAC: 00000017</div>
<div>[ =C2=A0 =C2=A00.000000] Process swapper (pid: 0, stack limit =3D 0xc0=
5ce2f0)</div><div>[ =C2=A0 =C2=A00.000000] Stack: (0xc05cff90 to 0xc05d0000=
)</div><div>[ =C2=A0 =C2=A00.000000] ff80: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 c0758ba0 c0790080 c0790080 c0018588</div>
<div>[ =C2=A0 =C2=A00.000000] ffa0: c05ce000 c0015784 3b9aca00 00000000 000=
00000 00000001 c0030268 c078efc0</div><div>[ =C2=A0 =C2=A00.000000] ffc0: c=
0030268 c0f28100 c05d2d0c 8002e7fc 00000000 c0008a0c c000866c 000005ff</div=
><div>[ =C2=A0 =C2=A00.000000] ffe0: 80000100 c0030268 10c53c7d c078f174 c0=
030264 80008034 00000000 00000000</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c00c93e4&gt;] (perf_pmu_register+0x12c/0=
x178) from [&lt;c0018588&gt;] (perf_event_init+0x3c/0xa4)</div><div>[ =C2=
=A0 =C2=A00.000000] [&lt;c0018588&gt;] (perf_event_init+0x3c/0xa4) from [&l=
t;c0015784&gt;] (sched_init+0x200/0x24c)</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c0015784&gt;] (sched_init+0x200/0x24c) f=
rom [&lt;c0008a0c&gt;] (start_kernel+0x124/0x2d0)</div><div>[ =C2=A0 =C2=A0=
0.000000] [&lt;c0008a0c&gt;] (start_kernel+0x124/0x2d0) from [&lt;80008034&=
gt;] (0x80008034)</div>
<div>[ =C2=A0 =C2=A00.000000] Code: e59f204c e5843000 e5842004 e2422064 (e5=
834004)=C2=A0</div><div>[ =C2=A0 =C2=A00.000000] ---[ end trace 1b75b31a271=
9ed1c ]---</div><div>[ =C2=A0 =C2=A00.000000] Kernel panic - not syncing: A=
ttempted to kill the idle task!</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c004a3a8&gt;] (unwind_backtrace+0x0/0xe0=
) from [&lt;c0419e08&gt;] (panic+0x54/0x178)</div><div>[ =C2=A0 =C2=A00.000=
000] [&lt;c0419e08&gt;] (panic+0x54/0x178) from [&lt;c00747b0&gt;] (do_exit=
+0x6c/0x658)</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c00747b0&gt;] (do_exit+0x6c/0x658) from =
[&lt;c0048854&gt;] (die+0x2a8/0x2e8)</div><div>[ =C2=A0 =C2=A00.000000] [&l=
t;c0048854&gt;] (die+0x2a8/0x2e8) from [&lt;c0419c74&gt;] (__do_kernel_faul=
t.part.4+0x54/0x74)</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c0419c74&gt;] (__do_kernel_fault.part.4+=
0x54/0x74) from [&lt;c0423348&gt;] (do_page_fault.part.5+</div><div>0x284/0=
x2a0)</div><div>[ =C2=A0 =C2=A00.000000] [&lt;c0423348&gt;] (do_page_fault.=
part.5+0x284/0x2a0) from [&lt;c04233b0&gt;] (do_page_fault+0x4c/0x58</div>
<div>)</div><div>[ =C2=A0 =C2=A00.000000] [&lt;c04233b0&gt;] (do_page_fault=
+0x4c/0x58) from [&lt;c003b1f0&gt;] (do_DataAbort+0x34/0x98)</div><div>[ =
=C2=A0 =C2=A00.000000] [&lt;c003b1f0&gt;] (do_DataAbort+0x34/0x98) from [&l=
t;c04214ec&gt;] (__dabt_svc+0x4c/0x60)</div>
<div>[ =C2=A0 =C2=A00.000000] Exception stack(0xc05cff48 to 0xc05cff90)</di=
v><div>[ =C2=A0 =C2=A00.000000] ff40: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 00000001 c0529d46 c07589dc 8002e7fc c05cff68 c0=
f2a010</div><div>[ =C2=A0 =C2=A00.000000] ff60: c05cff68 c05e5750 000003f8 =
413fc082 0000001f c05cffd4 00000000 c05cff90</div>
<div>[ =C2=A0 =C2=A00.000000] ff80: c009acd0 c00c93e4 a00001d3 ffffffff</di=
v><div>[ =C2=A0 =C2=A00.000000] [&lt;c04214ec&gt;] (__dabt_svc+0x4c/0x60) f=
rom [&lt;c00c93e4&gt;] (perf_pmu_register+0x12c/0x178)</div><div>[ =C2=A0 =
=C2=A00.000000] [&lt;c00c93e4&gt;] (perf_pmu_register+0x12c/0x178) from [&l=
t;c0018588&gt;] (perf_event_init+0x3c/0xa4)</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c0018588&gt;] (perf_event_init+0x3c/0xa4=
) from [&lt;c0015784&gt;] (sched_init+0x200/0x24c)</div><div>[ =C2=A0 =C2=
=A00.000000] [&lt;c0015784&gt;] (sched_init+0x200/0x24c) from [&lt;c0008a0c=
&gt;] (start_kernel+0x124/0x2d0)</div>
<div>[ =C2=A0 =C2=A00.000000] [&lt;c0008a0c&gt;] (start_kernel+0x124/0x2d0)=
 from [&lt;80008034&gt;] (0x80008034)</div></div><div><br></div><div><br></=
div><div>And one of the member suggested me that use lower version of gcc l=
ike gcc 4.3. But I didn&#39;t find any way to use it. Because only gcc 4.8.=
2 recipe is there in the layer.=C2=A0</div>
<div><br></div><div>Please help me to overcome this issues.</div><div>Any r=
eplay is appreciated.=C2=A0</div><div><br></div><div>Regards,</div><div>Dee=
pak Vijay</div></div>

--001a1134c1f8e482aa04f97f0252--
