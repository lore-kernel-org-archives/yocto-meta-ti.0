Return-Path: <tom.rini@gmail.com>
Received: from mail-ye0-f170.google.com (mail-ye0-f170.google.com
	[209.85.213.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46632E013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 12:07:11 -0700 (PDT)
Received: by mail-ye0-f170.google.com with SMTP id q3so1738404yen.15
	for <meta-ti@yoctoproject.org>; Mon, 08 Jul 2013 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=cogaIyNBz4sBtTQU7txfWU8PtvSQQOb8bBWIVQZErdI=;
	b=KK5w77SOG8hos9wEMjZAsiyxaGtaryUtuyAutU3lq8Beo3ptSjMyPXADEMhYR1O3TI
	SA52SNgd7LVEKH9s0oR158vaJx0IpDruHVVU4NKtWA2ZhpPDBqnozKXLIt9FAPE4zyGc
	/pVqLAYjyB5lVHquysptS6GUklONt5cIi2ICrAu0vDGLv9u5+e1vS56XCqPj3ajHh0h5
	by6nnEAyKM0G7qqWf+KH6K2g+O3oFZFSmxBwZx5CauTo91O/OYVY5+a5Q3SwKSHJ8dGr
	I/SbhrvQ9/6v3MIA+wWVV/atEWxQoPCsEV6rp2ozgvKVVyf2VGk/ccNJUGZPiQ0W1KN3
	RWag==
X-Received: by 10.236.132.35 with SMTP id n23mr12952434yhi.49.1373310431010;
	Mon, 08 Jul 2013 12:07:11 -0700 (PDT)
Received: from bill-the-cat (cpe-065-184-250-089.ec.res.rr.com.
	[65.184.250.89])
	by mx.google.com with ESMTPSA id i4sm1642150yhg.16.2013.07.08.12.07.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 12:07:10 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Mon, 8 Jul 2013 15:07:16 -0400
From: Tom Rini <trini@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130708190716.GR16630@bill-the-cat>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1307081427240.10955@oneiric>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 08 Jul 2013 19:07:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2013 at 02:30:47PM -0400, Robert P. J. Day wrote:
> On Mon, 8 Jul 2013, Tom Rini wrote:
> 
> > On Sun, Jul 07, 2013 at 08:00:05AM -0400, Robert P. J. Day wrote:
> >
> > > U-Boot SPL 2013.01.01 (Jul 06 2013 - 18:41:10)
> > > OMAP SD/MMC: 0
> > > ** Partition 1 not valid on device 0 **
> > > spl: fat register err - -1
> > > ### ERROR ### Please RESET the board ###
> > >
> > >   this is exactly the same SD card i was using with meta-beagleboard
> > > generated image files. everything else about the build seemed fine.
> > > can someone verify a known good recipe for this? is there
> > > something different about the creation of the SD card? i'm currently
> > > doing another build from scratch to see if i messed anything up.
> >
> > Can you see if backporting
> > http://git.denx.de/?p=u-boot.git;a=commitdiff;h=9d956e0fefa39ba49250f61e3c7aa3dadafdb7fd
> > fixes the problem?  It should apply cleanly.  Thanks!
> 
>   i'll give that a shot this evening and let you know. just to recap,
> i used OE and the meta-beagleboard layer to build for my BBB and
> copied to the first (bootable FAT) partition nothing but the MLO and
> u-boot.img images, and that let me boot to u-boot, which is all i was
> after.

Strange.  meta-beagleboard is on v2013.04 which doesn't have that
change.

>  i then did an OE build using meta-ti, copied *those* generated MLO
> and u-boot.img files to the same SD card, and promptly got the error
> above. so that would suggest that the meta-beagleboard layer has
> something equivalent to that patch, while meta-ti doesn't.
> 
>   anyway, will report back with results ASAP.

If it fails, can you dd off the card, compress it and share a copy with
me off-list (I can provide a dropbox drop spot if needed), thanks!

-- 
Tom

