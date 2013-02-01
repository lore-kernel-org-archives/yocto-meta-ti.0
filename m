Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58C8FE00515
	for <meta-ti@yoctoproject.org>; Fri,  1 Feb 2013 15:52:04 -0800 (PST)
Received: from [67.224.95.174] (port=54489 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U1QOn-0004IF-K5; Fri, 01 Feb 2013 18:52:01 -0500
Date: Fri, 1 Feb 2013 18:51:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Javier Martinez Canillas <javier@dowhile0.org>
In-Reply-To: <CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1302011749020.4566@oneiric>
References: <alpine.DEB.2.02.1301311735390.5243@oneiric>
	<CABxcv=k1fECXBLowDJ1_5zjEJCnw5t9BOTH_-6e-_MLBS3xf1Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Feb 2013 23:52:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 1 Feb 2013, Javier Martinez Canillas wrote:

> > hwclock: can't open '/dev/misc/rtc': No such file or directory
> > Thu Jan 31 16:02:00 UTC 2013
> > hwclock: can't open '/dev/misc/rtc': No such file or directory
> >
> >    (hangs)
> >
>
> Hi Robert,
>
> I don't have your board but I've seen a similar issue before caused
> by using a recent udev and not having enabled CONFIG_DEVTMPFS=y on
> your kernel config.
>
> The problem is that since udev-182, udev no longer creates device
> nodes under /dev and this has to be managed by the kernel devtmpfs
> filesystem.
>
> This means that a kernel built without devtmpfs config will not
> boot since there won't be any device files on /dev.

  that sounds vaguely familiar, i remember reading that once upon a
time.  which brings me back to my plaintive lament -- is there a
recipe i can use to build a bootable system for this board?

  the SD card that came with it has "arago" splashed all over it so
i'm going to check out the meta-arago layer(s) to see what i get.  but
i would *dearly* love to figure out what it takes to build a working
system for this in the next day or two.

  don't make me beg.  all right, i'm begging ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

