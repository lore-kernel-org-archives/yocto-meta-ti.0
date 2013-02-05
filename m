Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A96CE0146A
	for <meta-ti@yoctoproject.org>; Mon,  4 Feb 2013 20:01:11 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHQ00AFMB4S1RT0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Feb 2013 22:00:44 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CD39E201B5; Mon,
	04 Feb 2013 23:00:28 -0500 (EST)
Date: Mon, 04 Feb 2013 23:00:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130205040028.GA27526@denix.org>
References: <alpine.DEB.2.02.1301311735390.5243@oneiric>
	<CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
	<alpine.DEB.2.02.1302011749020.4566@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1302011749020.4566@oneiric>
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
X-List-Received-Date: Tue, 05 Feb 2013 04:01:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 01, 2013 at 06:51:59PM -0500, Robert P. J. Day wrote:
> On Fri, 1 Feb 2013, Javier Martinez Canillas wrote:
> 
> > > hwclock: can't open '/dev/misc/rtc': No such file or directory
> > > Thu Jan 31 16:02:00 UTC 2013
> > > hwclock: can't open '/dev/misc/rtc': No such file or directory
> > >
> > >    (hangs)
> > >
> >
> > Hi Robert,
> >
> > I don't have your board but I've seen a similar issue before caused
> > by using a recent udev and not having enabled CONFIG_DEVTMPFS=y on
> > your kernel config.
> >
> > The problem is that since udev-182, udev no longer creates device
> > nodes under /dev and this has to be managed by the kernel devtmpfs
> > filesystem.
> >
> > This means that a kernel built without devtmpfs config will not
> > boot since there won't be any device files on /dev.
> 
>   that sounds vaguely familiar, i remember reading that once upon a
> time.  which brings me back to my plaintive lament -- is there a
> recipe i can use to build a bootable system for this board?
> 
>   the SD card that came with it has "arago" splashed all over it so
> i'm going to check out the meta-arago layer(s) to see what i get.  but
> i would *dearly* love to figure out what it takes to build a working
> system for this in the next day or two.

Robert,

Sorry for not replying earlier - I was quite busy last week finishing up my 
work before I went on travel this week...

As of the SD card that you received with the board - it was the old Arago 
(AMSDK) release, based on the Classic OpenEmbedded 2011.03-maintenance 
branch. And it used udev-141.

What you didn't mention in your emails, is which branch of meta-ti you are 
trying to use. Same for oe-core. So, if it's anything latest, like "master" 
branch, then you are probably trying to use udev-182. And as Javier above 
said, you would need to enable DEVTMPFS config option in the defconfig.

For our TI SDK products we usually stay with the stable branch and so it was 
"denzil" for a while and just last week I pushed all the required changes to 
finally switch to "danny". In either of those cases we are using udev-164. 
Hence, DEVTMPFS is not required to be enabled.

So, if you still want to use the latest master of oe-core and meta-ti, you'd 
be forced to use a more recent udev-182 and hence would need to make a simple 
change in the am180x defconfig to enable DEVTMPFS config option. I'll gladly 
accept a patch from you, if that proves to be the (only) culprit.

As of the Arago images - you are more than welcome to look into meta-arago and 
how things are being built there (e.g. tisdk-rootfs-image), but that maybe too 
specialized for your needs, plus make sure to realize that meta-arago "master" 
branch now depends on "danny" of oe-core/meta-ti/meta-oe and was depending on 
even older "denzil" just before the last week. So, you are maybe better off 
using just the core-image-base or core-image-minimal rootfs images from 
oe-core, depending on your needs, especially if what you need at first is to 
bring the board up...

Please let me know if this works for you or you have any other questions.

-- 
Denys

