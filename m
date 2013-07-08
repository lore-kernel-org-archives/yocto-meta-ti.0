Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FD30E013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 13:50:25 -0700 (PDT)
Received: from [174.115.5.73] (port=56385 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UwIO8-0004iB-7N; Mon, 08 Jul 2013 16:50:24 -0400
Date: Mon, 8 Jul 2013 16:50:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Tom Rini <trini@ti.com>
In-Reply-To: <51DB242D.9070900@ti.com>
Message-ID: <alpine.DEB.2.02.1307081648420.12420@oneiric>
References: <alpine.DEB.2.02.1307070755370.23001@oneiric>
	<20130708181457.GQ16630@bill-the-cat>
	<alpine.DEB.2.02.1307081427240.10955@oneiric>
	<20130708190716.GR16630@bill-the-cat>
	<alpine.DEB.2.02.1307081535070.12053@oneiric>
	<51DB242D.9070900@ti.com>
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
X-List-Received-Date: Mon, 08 Jul 2013 20:50:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 8 Jul 2013, Tom Rini wrote:

> On 07/08/2013 03:38 PM, Robert P. J. Day wrote:
... snip ...
> >   i had time to do the following quick test. i took my working uSD
> > card (with artifacts from the meta-beagleboard build), and simply
> > flat-out replaced both the MLO and u-boot.img files in the FAT
> > partition with the corresponding files from the meta-ti build, and got
> > the error above.
> >
> >   i then copied back the original MLO and u-boot.img files and the
> > boot worked just fine, so that validates that the card partitioning
> > itself seems fine.
> >
> >   i'll just email you the two files in question, and you can see if
> > you can boot to u-boot.
>
> The files both boot for me, on Beaglebone Black and White.

  then i'm baffled ... what recipe do you use to format the uSD card?
and did you try booting with nothing but those two files on the card?
no uImage, no uEnv.txt, etc?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

