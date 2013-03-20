Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88BF3E006D6
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 11:29:08 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2KIRNo9032041;
	Wed, 20 Mar 2013 13:27:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2KIRN5q013795;
	Wed, 20 Mar 2013 13:27:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Mar 2013 13:27:22 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2KIRMGX005753;
	Wed, 20 Mar 2013 13:27:23 -0500
Date: Wed, 20 Mar 2013 14:27:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Steven Grunza <grunzasr@comcast.net>
Message-ID: <20130320182722.GX32759@edge>
References: <514873B9.3020500@comcast.net> <20130319172138.GQ32759@edge>
	<5148A9B4.5060702@comcast.net> <20130319182747.GH14761@denix.org>
	<5149C666.7040306@comcast.net> <20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net>
MIME-Version: 1.0
In-Reply-To: <5149FD74.3030906@comcast.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Wed, 20 Mar 2013 18:29:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 20, 2013 at 02:18:28PM -0400, Steven Grunza wrote:
> On 3/20/2013 1:54 PM, Denys Dmytriyenko wrote:
> >On Wed, Mar 20, 2013 at 01:48:21PM -0400, Steven Grunza wrote:
> >>On 3/20/2013 11:17 AM, Denys Dmytriyenko wrote:
> >>>On Wed, Mar 20, 2013 at 10:23:34AM -0400, Steven Grunza wrote:
> >>>>On 3/19/2013 2:27 PM, Denys Dmytriyenko wrote:
> >>>>>On Tue, Mar 19, 2013 at 02:08:52PM -0400, Steven Grunza wrote:
> >>>>>>On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
> >>>>>>>On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
> >>>>>>>>Hello,
> >>>>>>>>   I have a LogicPD Zoom AM3517 experimenters board.  Is this the
> >>>>>>>>correct list to ask questions about getting Yocto-based software
> >>>>>>>>running on this board?
> >>>>>>>Yes, this is one of the correct lists for asking questions about AM3517 board
> >>>>>>>when used with the Yocto Project. :) As this is the mailing list for meta-ti,
> >>>>>>>which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
> >>>>>>>the Yocto Project, and AM3517 is currently one of the supported platforms in
> >>>>>>>meta-ti.
> >>>>>>>
> >>>>>>Wonderful.  Can someone point me to information so that I can build
> >>>>>>a system using the Yocto project and program an SD card with the
> >>>>>>necessary files to boot my board into Linux?
> >>>>>>
> >>>>>>   With all of the S7 DIP switches in the off position (which the
> >>>>>>AM3517 Development Kits User Manual indicates is the default boot
> >>>>>>from NAND) I don't get any output from the serial UART so my guess
> >>>>>>is that I've hosed the NAND.
> >>>>>>
> >>>>>>   For debugging support I have a TI Stellaris LM3S8962 board which
> >>>>>>has the ability to act as a JTAG debugger to external hardware.  For
> >>>>>>software I have OpenOCD 0.6.1
> >>>>>I would assume you already checked this Hardware Setup page:
> >>>>>http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup
> >>>>>
> >>>>>Then you would need to check the Boot from SD/MMC page:
> >>>>>http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card
> >>>>>
> >>>>>As of the software load, you can build a minimal rootfs image (e.g.
> >>>>>core-image-minimal) with all the BSP components and setup an SD card as
> >>>>>described above. You'll get the MLO, u-boot, uImage and rootfs as the
> >>>>>output of the build, that you need to load on to the card.
> >>>>To what should I have MACHINE set?  Using beagleboard didn't work.
> >>>There is "am3517-evm" machine in meta-ti:
> >>>http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine
> >>>
> >>What is the proper way to include the above file in my build
> >>environment or is there a URL describing it that I've missed?
> >You need to add meta-ti layer to your configuration. It can be as easy as
> >git-cloning it into your sources location, along with other "meta" layers and
> >adding it to your bblayers.conf file. You'd need to also add BBMASK to your
> >local.conf, as described in meta-ti README file. After that you can build for
> >MACHINE=am3517-evm
> >
> 
> I did something wrong or missed a step.  I got:
> 
> grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$ bitbake
> core-image-sato-sdk
> Pseudo is not present but is required, building this first before
> the main build
> Parsing recipes: 100% |#####################################################################################################|
> Time: 00:02:17
> Parsing of 899 .bb files complete (0 cached, 899 parsed). 1205
> targets, 67 skipped, 7 masked, 0 errors.
> ERROR: No recipes available for:
> /home/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.2.bbappend
> ERROR: Command execution failed: Exited with 1
> 
> I put the meta-ti (via a git clone) into /home/yocto/poky-danny-8.0

If you are using poky-danny as a base, you need to use "danny" branch of 
meta-ti to match the versions.

-- 
Denys

