Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D53EE00770
	for <meta-ti@yoctoproject.org>; Wed,  9 Jan 2013 03:06:25 -0800 (PST)
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:34055 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TstUG-0003hB-34; Wed, 09 Jan 2013 06:06:24 -0500
Date: Wed, 9 Jan 2013 06:06:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Nicolas Dechesne <ndec13@gmail.com>
In-Reply-To: <CAOT3miLOCbazfMvaW8E2mV3o+uJwJYoU5GZ2PCRQXQ43qSwe6Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1301090604340.4410@oneiric>
References: <CANmVirii6vJvYyAR-a6wOHjFwoSnpqk5vSipnkXQSU6rZPVmKA@mail.gmail.com>
	<CAOT3miLOCbazfMvaW8E2mV3o+uJwJYoU5GZ2PCRQXQ43qSwe6Q@mail.gmail.com>
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
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Creating simple linux for beaglebone
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
X-List-Received-Date: Wed, 09 Jan 2013 11:06:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 9 Jan 2013, Nicolas Dechesne wrote:

> On Wed, Jan 9, 2013 at 2:38 AM, Raul Rosetto Munoz <munoz0raul@gmail.com> wrote:
> > Hello all,
> >
> > I want to create a simples linux for beaglebone using yocto danny.
> >
> > I did all the necessary clones:
> > poky
> > meta-ti
> > meta-openembedded
> >
> > I changed all to danny branch!
> >
> > After these sets I did the poky source:
> > source poky/oe-init-build-env beaglebone-linux
> >
> > Changed the machine to beaglebone
> >
> > MACHINE ?= "beaglebone"
> >
> > Changed the bblayer to:
> >
> > BBLAYERS ?= " \
> >   /home/prjs/video0001/linux/poky/meta \
> >   /home/prjs/video0001/linux/poky/meta-yocto \
> >   /home/prjs/video0001/linux/poky/meta-yocto-bsp \
> >   /home/prjs/video0001/linux/meta-ti \
> >   /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
> >   "

  did you really need to check out all those layers?  as i read it,
the meta-ti layer has no dependencies on anything but basic OE --
that's all i used for creating images for my pandaboard.

  am i misreading something?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

