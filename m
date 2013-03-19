Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74BCFE006AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 11:28:07 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJX00CT87ABGSF3@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 19 Mar 2013 13:28:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5E8B520033; Tue,
	19 Mar 2013 14:27:47 -0400 (EDT)
Date: Tue, 19 Mar 2013 14:27:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Steven Grunza <grunzasr@comcast.net>
Message-id: <20130319182747.GH14761@denix.org>
References: <514873B9.3020500@comcast.net> <20130319172138.GQ32759@edge>
	<5148A9B4.5060702@comcast.net>
MIME-version: 1.0
In-reply-to: <5148A9B4.5060702@comcast.net>
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
X-List-Received-Date: Tue, 19 Mar 2013 18:28:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 19, 2013 at 02:08:52PM -0400, Steven Grunza wrote:
> On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
> >>Hello,
> >>   I have a LogicPD Zoom AM3517 experimenters board.  Is this the
> >>correct list to ask questions about getting Yocto-based software
> >>running on this board?
> >Yes, this is one of the correct lists for asking questions about AM3517 board
> >when used with the Yocto Project. :) As this is the mailing list for meta-ti,
> >which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
> >the Yocto Project, and AM3517 is currently one of the supported platforms in
> >meta-ti.
> >
> Wonderful.  Can someone point me to information so that I can build
> a system using the Yocto project and program an SD card with the
> necessary files to boot my board into Linux?
> 
>   With all of the S7 DIP switches in the off position (which the
> AM3517 Development Kits User Manual indicates is the default boot
> from NAND) I don't get any output from the serial UART so my guess
> is that I've hosed the NAND.
> 
>   For debugging support I have a TI Stellaris LM3S8962 board which
> has the ability to act as a JTAG debugger to external hardware.  For
> software I have OpenOCD 0.6.1

I would assume you already checked this Hardware Setup page:
http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup

Then you would need to check the Boot from SD/MMC page:
http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card

As of the software load, you can build a minimal rootfs image (e.g. 
core-image-minimal) with all the BSP components and setup an SD card as 
described above. You'll get the MLO, u-boot, uImage and rootfs as the
output of the build, that you need to load on to the card.

-- 
Denys

