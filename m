Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94E8AE013DE
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 12:43:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6QJhlxa015504;
	Fri, 26 Jul 2013 14:43:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6QJhlcA014594;
	Fri, 26 Jul 2013 14:43:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Jul 2013 14:43:47 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6QJhltj025289;
	Fri, 26 Jul 2013 14:43:47 -0500
Date: Fri, 26 Jul 2013 15:43:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "a.renault@kaptalia.com" <a.renault@kaptalia.com>
Message-ID: <20130726194346.GA3558@edge>
References: <4967548.gSMLmRAeV9@linux-krvt>
MIME-Version: 1.0
In-Reply-To: <4967548.gSMLmRAeV9@linux-krvt>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Build core-image-minimal on tdm3730
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
X-List-Received-Date: Fri, 26 Jul 2013 19:43:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 26, 2013 at 03:17:25PM +0200, a.renault@kaptalia.com wrote:
> Hi there, 
> I already post this message this morning on #linux-omap but I have got no 
> answer, so if you please I will test here.
> 
> I am trying to build core-image-minimal (OpenEmbedded/yocto) for my TechNexion 
> TDM-3730 (http://www.technexion.com/index.php/products/arm-cpu-modules/ti-
> dm3730/tdm-3730) CPU : TI Sitara DM3730@1Ghz, DSP Core TMS320C64x@800Mhz and 
> POWERVG SGX 530
> 
> I read the CPU was omap3 compatible so I downloaded the meta-ti on 
> http://layers.openembedded.org/layerindex/layer/meta-ti/ and tried to put 
> "omap3evm" on the field MACHINE of local.conf.
> 
> The folder build/tmp-eglibc/deploy/images is now containing core-image-
> minimal.rootfs.tar.gz, uImage, u-boot.bin and MLO  but when I tried to install 
> them on my board, I have got the next issue : 
> 
> Error: unrecognized/unsupported machine ID (r1 = 0x00000c78). Available 
> machine support:ID (hex)	NAME 000005ff	OMAP3 EVM Please check your kernel 
> config and/or bootloader.
> 
> I understand what happen but I don't know how to fix it. 
> 
> I also tried to build with MACHINE=am37x-evm, got the same issues.
> am37x seams to be close to dm37x didn't it?
> 
> Did not tried TI Sitara AM3517 EVM.
> 
> Do you have any idea of what I should try to do. Did you know someone who 
> succeed to build yocto on that card? 
> I saw angstrom narcissus (http://narcissus.angstrom-distribution.org/) 
> proposing to build a rootfs for dm3730-am3715-evm but all the selected package 
> selected failed.

I'm not familiar with it, but looks like this TechNexion TDM-3730 module has 
it's own unique machine ID and requires changes to the kernel to be able to 
identify your board. I'm guessing you are trying to use an old 2.6.x kernel 
that required a board file for each new platform, if it's not exactly the same 
(hence a different ID). Check with the company that produces this board if 
they have a kernel or patch available to make it work. Otherwise you better 
off asking on e2e.ti.com for how to add new machine ID for your board...

-- 
Denys

