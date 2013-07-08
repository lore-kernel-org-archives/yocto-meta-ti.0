Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0877E013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 12:38:27 -0700 (PDT)
Received: from [174.115.5.73] (port=55511 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UwHGT-0001tG-Ac; Mon, 08 Jul 2013 15:38:25 -0400
Date: Mon, 8 Jul 2013 15:38:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Tom Rini <trini@ti.com>
In-Reply-To: <20130708190716.GR16630@bill-the-cat>
Message-ID: <alpine.DEB.2.02.1307081535070.12053@oneiric>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
	<20130708190716.GR16630@bill-the-cat>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: proper recipe to build for BBB using the meta-ti layer?
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
X-List-Received-Date: Mon, 08 Jul 2013 19:38:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 8 Jul 2013, Tom Rini wrote:

> On Mon, Jul 08, 2013 at 02:30:47PM -0400, Robert P. J. Day wrote:
> > On Mon, 8 Jul 2013, Tom Rini wrote:
> >
> > > On Sun, Jul 07, 2013 at 08:00:05AM -0400, Robert P. J. Day wrote:
> > >
> > > > U-Boot SPL 2013.01.01 (Jul 06 2013 - 18:41:10)
> > > > OMAP SD/MMC: 0
> > > > ** Partition 1 not valid on device 0 **
> > > > spl: fat register err - -1
> > > > ### ERROR ### Please RESET the board ###
> > > >
> > > >   this is exactly the same SD card i was using with meta-beagleboard
> > > > generated image files. everything else about the build seemed fine.
> > > > can someone verify a known good recipe for this? is there
> > > > something different about the creation of the SD card? i'm currently
> > > > doing another build from scratch to see if i messed anything up.
> > >
> > > Can you see if backporting
> > > http://git.denx.de/?p=u-boot.git;a=commitdiff;h=9d956e0fefa39ba49250f61e3c7aa3dadafdb7fd
> > > fixes the problem?  It should apply cleanly.  Thanks!
> >
> >   i'll give that a shot this evening and let you know. just to recap,
> > i used OE and the meta-beagleboard layer to build for my BBB and
> > copied to the first (bootable FAT) partition nothing but the MLO and
> > u-boot.img images, and that let me boot to u-boot, which is all i was
> > after.
>
> Strange.  meta-beagleboard is on v2013.04 which doesn't have that
> change.
>
> >  i then did an OE build using meta-ti, copied *those* generated MLO
> > and u-boot.img files to the same SD card, and promptly got the error
> > above. so that would suggest that the meta-beagleboard layer has
> > something equivalent to that patch, while meta-ti doesn't.
> >
> >   anyway, will report back with results ASAP.
>
> If it fails, can you dd off the card, compress it and share a copy with
> me off-list (I can provide a dropbox drop spot if needed), thanks!

  i had time to do the following quick test. i took my working uSD
card (with artifacts from the meta-beagleboard build), and simply
flat-out replaced both the MLO and u-boot.img files in the FAT
partition with the corresponding files from the meta-ti build, and got
the error above.

  i then copied back the original MLO and u-boot.img files and the
boot worked just fine, so that validates that the card partitioning
itself seems fine.

  i'll just email you the two files in question, and you can see if
you can boot to u-boot.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

