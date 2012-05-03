Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 624F8E0044D
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 10:53:02 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3G00HWMKBSG5K0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 12:52:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0B892204A1; Thu,
	03 May 2012 13:52:40 -0400 (EDT)
Date: Thu, 03 May 2012 13:52:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120503175239.GL2681@denix.org>
References: <1336026806-13314-1-git-send-email-denis@denix.org>
	<73633949-8558-4D16-958F-3BCDB1165EA8@dominion.thruhere.net>
	<20120503170208.GH2681@denix.org>
	<3FDA31A2-C5FC-4A53-9B2C-EF6BC3C85BB5@dominion.thruhere.net>
	<20120503170535.GI2681@denix.org>
	<B7677EF7-F9A8-4456-BE86-FB756A765292@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <B7677EF7-F9A8-4456-BE86-FB756A765292@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap3-sgx-modules, libgles-omap3: add version 4.06.00.01
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
X-List-Received-Date: Thu, 03 May 2012 17:53:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 03, 2012 at 07:17:32PM +0200, Koen Kooi wrote:
> 
> Op 3 mei 2012, om 19:05 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > On Thu, May 03, 2012 at 07:05:13PM +0200, Koen Kooi wrote:
> >> 
> >> 
> >> Op 3 mei 2012 om 19:02 heeft Denys Dmytriyenko <denis@denix.org> het volgende geschreven:
> >> 
> >>> On Thu, May 03, 2012 at 09:26:51AM +0200, Koen Kooi wrote:
> >>>> 
> >>>> Op 3 mei 2012, om 08:33 heeft Denys Dmytriyenko het volgende geschreven:
> >>>> 
> >>>>> From: Denys Dmytriyenko <denys@ti.com>
> >>>>> 
> >>>>> * Ported from Arago
> >>>>> * Added version 4.06.00.01 of the Graphics SDK which supports Power Management
> >>>>> features for the AM335x
> >>>>> * Use a variable PLATFORM for the directory structure since newer SDKs use
> >>>>> LinuxARMV7 and older SDKs use LinuxOMAP3
> >>>>> * Modifiy rc.pvr to check return of the insmod of pvrsrvkm. If this driver
> >>>>> fails to load the devmem2 read access can put the system in a state where
> >>>>> it will not come out of suspend.
> >>>> 
> >>>> I keep bringing this up every few months: what's the plan to add the 
> >>>> necessary hooks to the kernel module to export the core revision in sysfs 
> >>>> instead of using devmem2? The kernel module knows about the right memory 
> >>>> addressed and turns on the clocks it needs. And better: we can get rid of 
> >>>> bogus ES revisions like 'ES8' since that's exactly the same core as 'ES6' 
> >>>> from a userspace point of view.
> >>> 
> >>> Thanks, I will forward your questions and suggestions to the Graphics team. 
> >>> Meanwhile, do you have any comments about the patch?
> >> 
> >> X11 support needs to get redone completely for this one, dri and all :(
> > 
> > I haven't looked at X11 support - what's wrong with it?
> 
> You need to rebuild the omap3-sgx-modules with DRI support, install the 
> extra modules, etc. Then you need to install the xorg module and hope the 
> ABIs match, install a xorg.conf snippet, etc, etc.
> 
> The best way forward is to have the gfx team rebuild the X stuff against the 
> X we have in OE, not the one IMGtec delivers.

That's a worthy goal, but may be difficult to achieve in a short time. You've 
been on the inside, you know all the limitations...

What's the best alternative for now?

-- 
Denys

