Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7452BE01366
	for <meta-ti@yoctoproject.org>; Tue, 14 May 2013 10:11:56 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMS00LODT2P1MC0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 14 May 2013 12:11:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0B76C2003E; Tue,
	14 May 2013 13:11:13 -0400 (EDT)
Date: Tue, 14 May 2013 13:11:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
Message-id: <20130514171112.GA31835@denix.org>
References: <mailman.0.1368467467.29286.meta-ti@yoctoproject.org>
	<7B8A37CE7777314D9B931CDD3BA8C83B1B9F6A72@de08ex3002.global.ds.honeywell.com>
	<20130513192021.GL17907@edge>
	<7B8A37CE7777314D9B931CDD3BA8C83B1B9F6B39@de08ex3002.global.ds.honeywell.com>
MIME-version: 1.0
In-reply-to: <7B8A37CE7777314D9B931CDD3BA8C83B1B9F6B39@de08ex3002.global.ds.honeywell.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: TI SysLink for am180-evm target
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
X-List-Received-Date: Tue, 14 May 2013 17:11:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Christopher,

Can you please identify the TI SDK you received with the board - it's name and
the version.

DA850, OMAP-L138 and AM180x are slightly different boards, even though very 
similar. As a matter of fact, from ARM GPP perspective they are pretty much 
the same, but the difference is in the peripherals, including the availability 
of DSP. Hence, you can build the am180x-evm (non-DSP) from meta-ti and run it 
on any of the above boards. BTW, why do you need SysLink just for ARM?

-- 
Denys


On Mon, May 13, 2013 at 08:02:25PM +0000, Pow, Christopher (SWCOE) wrote:
> Denys,
> 
> Thanks for the reply.  I have a TI OMAP L138 devkit [with a touch screen].  
> The TI SDK that came with it indicates it is a Davinci 
> DA850/OMAP-L138/AM18xx EVM.  When I took a look at the machines available in 
> meta-ti, I saw am180x-evm so I picked that one.  It didn't seem right to 
> pick omap3 or omap5.  The Yocto am180x-evm image I built does run on the 
> devkit.
> 
> The TI SDK comes with DSP/Link.  I have been asked to change that to 
> SysLink.  I noticed that the latest available SysLink package indicates 
> support for OMAPL1XX targets.
> 
> Are OMAP-L138 devices supported in meta-ti?  My interpretation from a recent 
> conversation [on IRC] was that they were, with the am180x-evm target.  I am 
> only interested [at the moment] in building and installing the ARM-side of 
> the SysLink package.  Someone else is doing the DSP work.
> 
> Sorry for the confusion.  I thought I had all my pieces lined up but it 
> seems that there's still much for me to learn!  Thanks again for your help 
> in this!
> 
> Christopher S. Pow
> Senior Engineer, Systems
> Honeywell SWCOE - RTOS
> o: 612-951-5852
> c: 612-910-1271
> 
> 
> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com] 
> Sent: Monday, May 13, 2013 2:20 PM
> To: Pow, Christopher (SWCOE)
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] TI SysLink for am180-evm target
> 
> On Mon, May 13, 2013 at 05:57:03PM +0000, Pow, Christopher (SWCOE) wrote:
> > I am trying to integrate the TI Syslink package into a Yocto BSP.  So 
> > far I have not been successful.  I have found and downloaded the 
> > cgt_c6000 binary installer, but can't figure out how to modify the 
> > BitBake recipe to point to it.  [bitbake ti-syslink errors on the 
> > fetch phase even though the SRC URI has been modified to point to the 
> > downloaded installer binary.]  Also I am unable to find a download 
> > link for the TMS470 compiler, which seems to be another dependency for 
> > SysLink.  Has anyone successfully integrated the TI SysLink recipe?  
> > Would it be easier to download and build SysLink separately and just install it on top of the targetfs?
> > 
> > I am trying to meet a very demanding schedule so I'd appreciate any 
> > help anyone can provide.
> 
> Well, strictly speaking none of AMx devices have DSPs in them. That would require DMx devices, which are not currently supported in meta-ti.
> 
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

