Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5E1FE0073A; Fri,  9 May 2014 11:59:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B60CE00478
	for <meta-ti@yoctoproject.org>; Fri,  9 May 2014 11:59:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s49IwvSh015742;
	Fri, 9 May 2014 13:58:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s49Iwujx020197;
	Fri, 9 May 2014 13:58:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 May 2014 13:58:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s49IwuCB006324;
	Fri, 9 May 2014 13:58:56 -0500
Date: Fri, 9 May 2014 14:58:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: deepak vijay <deepakvijay2255@rediff.com>
Message-ID: <20140509185855.GN18053@edge>
References: <CAAxuRXg9LxvzRzcu4V9awG8D0zmV4u1VkFQLpxebj90bHz+OfA@mail.gmail.com>
	<CAAxuRXipcVH8MXa=bG2cvHUpaPsHSGcH+yMrf=C4obSOz4606g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAxuRXipcVH8MXa=bG2cvHUpaPsHSGcH+yMrf=C4obSOz4606g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 09 May 2014 18:59:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, you don't provide details, such as your configuration, build setup or 
versions of your tools/layers, etc. You just say it rather vaguely:

> > I have build omap3evm images by including mata-ti layer.

From the bootlog it appears you used gcc-4.8 with such an old kernel 2.6.37. 
I'm wondering if it's one of the incompatibilities between old kernels and new 
toolchains, something like this one:

http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=07809e70f4f277d894323b7d2ed39400e0cca8e3

The recommendation would be to use a correspondingly old toolchain, such as 
gcc-4.5, if you really need to use such an old kernel 2.6.37.

Otherwise, OMAP3 should be well supported in recent mainline kernels, so if 
you do not depend on specifically 2.6.37 kernel, you should consider using 
that, in which case newer toolchains should also work.

-- 
Denys


On Fri, May 09, 2014 at 04:01:02PM +0530, deepak vijay wrote:
> Hi,
> When I configured Low level debugging and earlyprintk in bootargs I am
> getting the following output logs of crashing.
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
> 3214968 bytes read
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 82000000 ...
>    Image Name:   Linux-2.6.37
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    3214904 Bytes = 3.1 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 
> 
> ********Using machid 0x5ff from environment
> Uncompressing Linux... done, booting the kernel.
> [    0.000000] Linux version 2.6.37 (mistral@CPU000512U) (gcc version 4.8.2
> (GCC) ) #2 Fri May 9 14:42:06
>  IST 2014
> [    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7),
> cr=10c53c7d
> [    0.000000] CPU: VIPT nonaliasing data cache, VIPT aliasing instruction
> cache
> [    0.000000] Machine: OMAP3 EVM
> [    0.000000] bootconsole [earlycon0] enabled
> [    0.000000] Reserving 4194304 bytes SDRAM for VRAM
> [    0.000000] Memory policy: ECC disabled, Data cache writeback
> [    0.000000] OMAP3630 ES1.2 (l2cache iva sgx neon isp 192mhz_clk )
> [    0.000000] SRAM: Mapped pa 0x40200000 to va 0xfe400000 size: 0x10000
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
>  Total pages: 64000
> [    0.000000] Kernel command line: console=ttyO0,115200n8 earlyprintk
> root=/dev/mmcblk0p2 rw rootfstype=
> ext3 rootwait
> [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
> bytes)
> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
> [    0.000000] Memory: 252MB = 252MB total
> [    0.000000] Memory: 242156k/242156k available, 19988k reserved, 0K
> highmem
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
> [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
> [    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
> [    0.000000]     vmalloc : 0xd0800000 - 0xf8000000   ( 632 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
> [    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
> [    0.000000]       .init : 0xc0008000 - 0xc003c000   ( 208 kB)
> [    0.000000]       .text : 0xc003c000 - 0xc05eda00   (5831 kB)
> [    0.000000]       .data : 0xc05ee000 - 0xc07afb60   (1799 kB)
> [    0.000000] Unable to handle kernel paging request at virtual address
> 8002f130
> [    0.000000] pgd = c0004000
> [    0.000000] [8002f130] *pgd=00000000
> [    0.000000] Internal error: Oops: 805 [#1]
> [    0.000000] last sysfs file:
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0    Not tainted  (2.6.37 #2)
> [    0.000000] PC is at perf_pmu_register+0x12c/0x178
> [    0.000000] LR is at lockdep_init_map+0xb0/0x448
> [    0.000000] pc : [<c00ca3e4>]    lr : [<c009bcd0>]    psr: a00001d3
> [    0.000000] sp : c05eff90  ip : 00000000  fp : c05effd4
> [    0.000000] r10: 0000001f  r9 : 413fc082  r8 : 000003f8
> [    0.000000] r7 : c0605750  r6 : c05eff68  r5 : c0f4b010  r4 : c05eff68
> [    0.000000] r3 : 8002f12c  r2 : c07789dc  r1 : c0548676  r0 : 00000001
> [    0.000000] Flags: NzCv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
>  Segment kernel
> [    0.000000] Control: 10c5387d  Table: 80004019  DAC: 00000017
> [    0.000000] Process swapper (pid: 0, stack limit = 0xc05ee2f0)
> [    0.000000] Stack: (0xc05eff90 to 0xc05f0000)
> [    0.000000] ff80:                                     c0778ba0 c07b0c40
> c07b0c40 c0018588
> [    0.000000] ffa0: c05ee000 c0015784 3b9aca00 00000000 00000000 00000001
> c0030bb0 c07afb80
> [    0.000000] ffc0: c0030bb0 c0f49100 c05f2d0c 8002f12c 00000000 c0008a0c
> c000866c 000005ff
> [    0.000000] ffe0: 80000100 c0030bb0 10c53c7d c07afd34 c0030bac 80008034
> 00000000 00000000
> [    0.000000] [<c00ca3e4>] (perf_pmu_register+0x12c/0x178) from
> [<c0018588>] (perf_event_init+0x3c/0xa4)
> [    0.000000] [<c0018588>] (perf_event_init+0x3c/0xa4) from [<c0015784>]
> (sched_init+0x200/0x24c)
> [    0.000000] [<c0015784>] (sched_init+0x200/0x24c) from [<c0008a0c>]
> (start_kernel+0x124/0x2d0)
> [    0.000000] [<c0008a0c>] (start_kernel+0x124/0x2d0) from [<80008034>]
> (0x80008034)
> [    0.000000] Code: e59f204c e5843000 e5842004 e2422064 (e5834004)
> [    0.000000] irq 56, desc: c0769a24, depth: 1, count: 0, unhandled: 0
> [    0.000000] ->handle_irq():  c00adad0, handle_bad_irq+0x0/0x224
> [    0.000000] ->irq_data.chip():   (null), 0x0
> [    0.000000] ->action():   (null)
> [    0.000000]   IRQ_DISABLED set
> [    0.000000]    IRQ_NOPROBE set
> [    0.000000]  IRQ_NOREQUEST set
> [    0.000000] Unable to handle kernel NULL pointer dereference at virtual
> address 00000000
> [    0.000000] pgd = c0004000
> [    0.000000] [00000000] *pgd=00000000
> [    0.000000] Internal error: Oops: 5 [#2]
> [    0.000000] last sysfs file:
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0    Tainted: G      D      (2.6.37 #2)
> [    0.000000] PC is at handle_bad_irq+0x1a0/0x224
> [    0.000000] LR is at handle_bad_irq+0x184/0x224
> [    0.000000] pc : [<c00adc70>]    lr : [<c00adc54>]    psr: 400001d3
> [    0.000000] sp : c05efd28  ip : ffffffff  fp : c00ca3e4
> [    0.000000] r10: 00000017  r9 : 00000000  r8 : c05ee000
> [    0.000000] r7 : c00ca3e6  r6 : 00000000  r5 : c078114c  r4 : c0769a24
> [    0.000000] r3 : 00000000  r2 : 00000000  r1 : c05efc40  r0 : 00000025
> [    0.000000] Flags: nZcv  IRQs off  FIQs off  Mode SVC_32  ISA ARM
>  Segment kernel
> [    0.000000] Control: 10c5387d  Table: 80004019  DAC: 00000017
> [    0.000000] Process swapper (pid: 0, stack limit = 0xc05ee2f0)
> [    0.000000] Stack: (0xc05efd28 to 0xc05f0000)
> [    0.000000] fd20:                   00000000 00000000 00000038 c003c070
> ffffffff fa200000
> [    0.000000] fd40: 00000001 c043c6b8 c043bee4 c05efd70 00000000 00000001
> c05f2f30 c05efdda
> [    0.000000] fd60: 00000001 c00ca3e6 c05ee000 00000000 00000017 c00ca3e4
> ffffffff c05efd90
> [    0.000000] fd80: c043bee4 c043bee8 60000153 ffffffff c05eff48 c0049800
> c05ee2f0 0000000b
> [    0.000000] fda0: 00000000 00000008 655f14a8 32663935 20633430 34383565
> 30303033 38356520
> 
> 
> 
> 
> 
> So from this I believe that it is because of kernel paging problem.
> Please help me to resolve this.
> 
> 
> Regards,
> Deepak
> 
> 
> On Thu, May 8, 2014 at 3:45 PM, deepak vijay <deepakvijay2255@rediff.com>wrote:
> 
> > Hi,
> > I have build omap3evm images by including mata-ti layer.
> > When I am trying to boot the omap3evm board it is stuck at "Uncompressing
> > Linux... done, booting the kernel" this comment.
> > Can any one help me to over come this issue.
> > The boot logs are given below.
> > U-Boot SPL 2011.12 (May 08 2014 - 15:01:46)
> > Texas Instruments Revision detection unimplemented
> > OMAP SD/MMC: 0
> > reading u-boot.img
> > reading u-boot.img
> >
> >
> > U-Boot 2011.12 (May 08 2014 - 15:01:46)
> >
> > OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
> > OMAP3 EVM board + LPDDR/NAND
> > I2C:   ready
> > DRAM:  256 MiB
> > NAND:  512 MiB
> > MMC:   OMAP SD/MMC: 0
> > *** Warning - bad CRC, using default environment
> >
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Read back SMSC id 0x92200000
> > Die ID #706a00029ff80000016842c911024007
> > Net:   smc911x-0
> > Hit any key to stop autoboot:  0
> > reading boot.scr
> >
> > ** Unable to read "boot.scr" from mmc 0:1 **
> > reading uImage
> >
> > 3139340 bytes read
> > Booting from mmc ...
> > ## Booting kernel from Legacy Image at 82000000 ...
> >    Image Name:   Linux-2.6.37
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    3139276 Bytes = 3 MiB
> >    Load Address: 80008000
> >    Entry Point:  80008000
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ... OK
> > OK
> >
> > Starting kernel ...
> >
> > Uncompressing Linux... done, booting the kernel.
> >
> >
> > Regards,
> > Deepak Vijay
> >

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


