Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72194E00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 13:28:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3G00BBMRK3BP32@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 15:28:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B448120099; Thu,
	03 May 2012 16:28:51 -0400 (EDT)
Date: Thu, 03 May 2012 16:28:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120503202851.GA9822@denix.org>
References: <20120503004302.E49A252A70@arago-project.org>
	<1DB7C838-80AE-47B8-9251-87253476B6F5@dominion.thruhere.net>
	<20120503060932.GD2681@denix.org>
	<812B90C3-8D0A-4805-9424-1C167BEF536E@dominion.thruhere.net>
	<20120503162113.GF2681@denix.org>
	<914CC77F-F9A0-4FCB-B112-46649335EAA3@dominion.thruhere.net>
	<20120503173431.GK2681@denix.org>
MIME-version: 1.0
In-reply-to: <20120503173431.GK2681@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Denys Dmytriyenko : beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
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
X-List-Received-Date: Thu, 03 May 2012 20:28:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 03, 2012 at 01:34:31PM -0400, Denys Dmytriyenko wrote:
> On Thu, May 03, 2012 at 07:12:05PM +0200, Koen Kooi wrote:
> > 
> > 
> > Op 3 mei 2012 om 18:21 heeft Denys Dmytriyenko <denis@denix.org> het volgende geschreven:
> > 
> > > On Thu, May 03, 2012 at 08:25:11AM +0200, Koen Kooi wrote:
> > >> 
> > >> Op 3 mei 2012, om 08:09 heeft Denys Dmytriyenko het volgende geschreven:
> > >> 
> > >>> On Thu, May 03, 2012 at 08:02:00AM +0200, Koen Kooi wrote:
> > >>>> 
> > >>>> Op 3 mei 2012, om 02:43 heeft Arago Project git het volgende geschreven:
> > >>>> 
> > >>>>> Module: meta-ti
> > >>>>> Branch: master
> > >>>>> Commit: 3c693c26087aa148b944166083b5336f05d1c15b
> > >>>>> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3c693c26087aa148b944166083b5336f05d1c15b
> > >>>>> 
> > >>>>> Author: Denys Dmytriyenko <denys@ti.com>
> > >>>>> Date:   Wed May  2 20:40:58 2012 -0400
> > >>>>> 
> > >>>>> beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
> > >>>> 
> > >>>> Wait, what? Can we actually send these changes for review first? T2 is 
> > >>>> needed to meet the boot time goal, so please revert this one!
> > >>> 
> > >>> Have another solution to get it building under recent binutils?
> > >> 
> > >> Patch binutils or patch the kernel.
> > > 
> > > Like I said, do you have a solution? Do you have said patches?
> > > 
> > > Since gcc-4.5 and binutils-2.20 are scheduled to be removed from 
> > > meta-oe/toolchain-layer in a few days, I had to fix it some way. That's the 
> > > best I could do under this circumstances. I can't have beaglebone broken with 
> > > any  oher toolchain, to only gain few milliseconds of boot time.
> > 
> > It's in the range of half a second when I last tested it. 
> 
> If you care to provide binutils-2.20 with it forever, the change can be 
> reverted.
> 
> Again, your decision to drop gcc-4.5 and binutils-2.20 from meta-oe drove me 
> to push this fix.

Well, I might have found another way to fix it w/o changing the defconfig. 
Testing it now on a clean build - will let you know the result...

-- 
Denys

