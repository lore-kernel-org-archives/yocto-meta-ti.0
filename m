Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14519E01445
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 15:10:57 -0700 (PDT)
Received: from [174.115.5.73] (port=57300 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UwJe4-0007bL-8l; Mon, 08 Jul 2013 18:10:56 -0400
Date: Mon, 8 Jul 2013 18:10:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Tom Rini <trini@ti.com>
In-Reply-To: <51DB3180.5030706@ti.com>
Message-ID: <alpine.DEB.2.02.1307081807240.31452@oneiric>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
	<20130708190716.GR16630@bill-the-cat>
	<alpine.DEB.2.02.1307081535070.12053@oneiric>
	<51DB242D.9070900@ti.com>
	<alpine.DEB.2.02.1307081648420.12420@oneiric> <51DB3180.5030706@ti.com>
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
X-List-Received-Date: Mon, 08 Jul 2013 22:11:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 8 Jul 2013, Tom Rini wrote:

> I'm just using a by-hand partitioned card.  Can you please dd off a
> copy of your card (so we can reproduce later) and then just zero,
> and then create an MBR partition table, with the first partition
> table type c and with the bootable flag set, mkfs.vfat it and copy
> the files in?

  ok, but i'll make one more test first. i'd forgotten that the
meta-ti layer provides a sdcard_image.bbclass, so i'll let that class
build the SD card image for me by ... let's see, just adding this
line:

INHERIT += "sdcard_image"

and that class provides:

IMAGE_FSTYPES_append = " tar.bz2 sdimg"

so i need to add only that "INHERIT" line to my local.conf, correct?

  also, what is the relationship between the meta-ti and
meta-beaglebaord layers? as i read it, meta-ti is now the "official"
layer so i should use that exclusively, yes?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

