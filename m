Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE7D9E00406
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:15:21 -0700 (PDT)
Received: from [174.115.226.96] (port=50563 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1V86Cf-0004y1-4J; Sat, 10 Aug 2013 06:15:21 -0400
Date: Sat, 10 Aug 2013 06:15:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Brian Hutchinson <b.hutchman@gmail.com>
In-Reply-To: <CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1308100611110.2277@oneiric>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
	<CAFZh4h9V7-06jGW2Sz4ksKRFEBabDchiY2aMdMeriF6NGPxJ8g@mail.gmail.com>
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
Subject: Re: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Sat, 10 Aug 2013 10:15:24 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-799233926-1376129720=:2277"

--8323329-799233926-1376129720=:2277
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Fri, 9 Aug 2013, Brian Hutchinson wrote:

... snip ...

> As a stop gap measure, I did just rename the bbappend to 9.1.6 and
> that solved my mesa problem but then I had toolchain build
> problems.  When I did a fresh checkout, I did not get the mesa error
> for the mesa 9.1.5.

  for now, since i'm building a non-graphical "core-image-minimal"
image, i just masked out the entire "meta-ti/recipes-graphics"
directory, but i'm sure that's not the cleanest way to solve this. :-)

  so what is the underlying layer with which meta-ti should stay in
sync? it seems both poky and oe-core have moved on to mesa_9.1.6,
while meta-ti is still at 9.1.5_bbappend, at least on "master". so
i'm assuming synchronization requires using tags, or a particular
branch, or something like that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-799233926-1376129720=:2277--
