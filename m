Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FED4E00736
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 20:55:59 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHQ001S1DOSDBC1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Feb 2013 22:55:40 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0EAD820031; Mon,
	04 Feb 2013 23:55:39 -0500 (EST)
Date: Mon, 04 Feb 2013 23:55:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20130205045539.GB27526@denix.org>
References: <alpine.DEB.2.02.1301311735390.5243@oneiric>
	<CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
	<alpine.DEB.2.02.1302011749020.4566@oneiric>
	<8F29D6B095ED194EA1980491A5E029710C385D25@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C385D25@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: i *really* want a bootable OE image for my pdlogic am1808 experimenter kit
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
X-List-Received-Date: Tue, 05 Feb 2013 04:55:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Well, not to derail Franklin's enthusiasm, but below suggestion would point 
Robert into the direction of an unfinished work-in-progress "feature" tree, 
that hasn't been reviewed or merged into the main meta-ti or meta-arago. Plus, 
it doesn't really solve Robert's specific problem and from a quick look at 
it, doesn't have the necessary defconfig change, but works because of older 
udev version...


> I am currently working on porting am180x to the latest Sitara Linux SDK 
> (http://processors.wiki.ti.com/index.php/Sitara_Linux_Software_Developer%E2%80%99s_Guide). 

BTW, Sitara SDK = AMSDK in this context. And Franklin is working on updating 
am180x support from Classic OE to OE-Core. Meaning, there's no newer kernel 
version planned for am180x at this point, unfortunately.


> Our Sitara SDK is based on the Arago distribution 
> (http://arago-project.org/git/?p=meta-arago.git;a=summary)
> Meta-Arago has the following restrictions:
> 1. We use a prebuilt toolchain for our oe-core builds 
> (http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/index_FDS.html). 

Actually, the same Arago toolchain was used for older Classic OE builds of 
Arago-based TI SDK products and is quite old by now - it's gcc-4.5, 
binutils-2.20 and eglibc-2.12. That is the one I built all the way back in 
September 2011.


> You probably can use the tool chain built with oe-core but you have to make 
> a tweak to use the "internal" built tool chain instead of the expected 
> "external" tool chain.

Unfortunately, it's not that easy - I never finished the toolchain framework 
in meta-arago to the same level I had it in old Arago and Classic OE. You can 
switch between 2 prebuilt toolchains for now - Arago gcc-4.5 for AMSDK and 
Linaro gcc-4.6 for MCSDK. The easy way of setting TOOLCHAIN_TYPE=internal to 
build your own toolchain still doesn't work, so that would require more 
extensive changes in the configuration. Finishing that is still on my 
extra-long ToDo list...


> 2. Meta-Arago master is based on the latest meta-oe, meta-ti, oe-core 

The proper term here would be "depends", not "based"...


> maintenance branch. This means you will need to use meta-oe, meta-ti and 
> oe-core danny/denzil branches for things to work without a problem. We just 
> started work on transitioning to danny from denzil.

Should be mostly working now - last week I pushed the groundwork for this 
transition to danny and was able to build tisdk-rootfs-image for couple of our 
platforms.


> 3. My work for am18 hasn't been pushed to meta-arago or meta-ti yet. 
> But you can see my hacks in the Sitara SDK integration branches.

As I mentioned above, these are interim work-in-progress branches and are in 
the early stages of porting/development, so please be aware of hacks (thanks 
Franklin for being honest here :) and possible periodic rebases or reverts of 
commits when we go through the review process in the way to the main meta-ti 
and meta-arago trees. But you are free and welcome to look at the interim 
progress, of course. Let us know if you have any questions. Thanks.

-- 
Denys


> http://arago-project.org/git/projects/?p=meta-arago-amsdk.git;a=summary 
> Branch: amsdk-05.07.00.00-integration
> http://arago-project.org/git/projects/?p=meta-ti-amsdk.git;a=summary Branch: 
> amsdk-05.07.00.00-integration
> 
> If you build tisdk-rootfs-image (full SDK root filesystem) or 
> arago-base-image (minimal root filesystem) you should get what you need to 
> get the board booted up.
> 
> If you have issues we do have a script that configures everything you need 
> to get up and running and building with our Arago distribution in no time.
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Robert P. J. Day
> > Sent: Friday, February 01, 2013 5:52 PM
> > To: Javier Martinez Canillas
> > Cc: meta-ti mailing list
> > Subject: Re: [meta-ti] i *really* want a bootable OE image for my pdlogic
> > am1808 experimenter kit
> > 
> > On Fri, 1 Feb 2013, Javier Martinez Canillas wrote:
> > 
> > > > hwclock: can't open '/dev/misc/rtc': No such file or directory Thu
> > > > Jan 31 16:02:00 UTC 2013
> > > > hwclock: can't open '/dev/misc/rtc': No such file or directory
> > > >
> > > >    (hangs)
> > > >
> > >
> > > Hi Robert,
> > >
> > > I don't have your board but I've seen a similar issue before caused by
> > > using a recent udev and not having enabled CONFIG_DEVTMPFS=y on your
> > > kernel config.
> > >
> > > The problem is that since udev-182, udev no longer creates device
> > > nodes under /dev and this has to be managed by the kernel devtmpfs
> > > filesystem.
> > >
> > > This means that a kernel built without devtmpfs config will not boot
> > > since there won't be any device files on /dev.
> > 
> >   that sounds vaguely familiar, i remember reading that once upon a time.
> > which brings me back to my plaintive lament -- is there a recipe i can use to
> > build a bootable system for this board?
> > 
> >   the SD card that came with it has "arago" splashed all over it so i'm going to
> > check out the meta-arago layer(s) to see what i get.  but i would *dearly* love
> > to figure out what it takes to build a working system for this in the next day or
> > two.
> > 
> >   don't make me beg.  all right, i'm begging ...
> > 
> > rday
> > 
> > --
> > 
> > ================================================================
> > ========
> > Robert P. J. Day                                 Ottawa, Ontario, CANADA
> >                         http://crashcourse.ca
> > 
> > Twitter:                                       http://twitter.com/rpjday
> > LinkedIn:                               http://ca.linkedin.com/in/rpjday
> > ================================================================
> > ========
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

