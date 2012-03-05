Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 819E9E0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 03:00:49 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S4Vep-0004qy-Nw; Mon, 05 Mar 2012 06:00:47 -0500
Date: Mon, 5 Mar 2012 06:00:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denis@denix.org>
In-Reply-To: <20120305051208.GD14417@denix.org>
Message-ID: <alpine.DEB.2.02.1203050555580.27228@oneiric>
References: <4F514EC8.8000606@ti.com> <4F515551.50708@mlbassoc.com>
	<20120304061843.GN24667@denix.org>
	<alpine.DEB.2.02.1203040716190.496@oneiric>
	<4F5361B6.8040908@mlbassoc.com>
	<alpine.DEB.2.02.1203041310220.20388@oneiric>
	<20120304192728.GO24667@denix.org>
	<4F53C63D.1000305@mlbassoc.com> <20120304200405.GP24667@denix.org>
	<alpine.DEB.2.02.1203041618190.20150@oneiric>
	<20120305051208.GD14417@denix.org>
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
Cc: meta-ti@yoctoproject.org
Subject: Re: [yocto] proper recipe for building for beagle xM? meta-ti?
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
X-List-Received-Date: Mon, 05 Mar 2012 11:00:49 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 5 Mar 2012, Denys Dmytriyenko wrote:

> On Sun, Mar 04, 2012 at 04:18:54PM -0500, Robert P. J. Day wrote:
> > On Sun, 4 Mar 2012, Denys Dmytriyenko wrote:
> >
> > > One of the issues:
> > >
> > > https://lists.yoctoproject.org/pipermail/meta-ti/2012-February/000491.html
> > >
> > > I haven't tried if either 3.0 or a pending 3.1 update for Panda
> > > (from omapzoom/ti-ubuntu), resolve this gcc-4.6 build issue. But
> > > either way I believe there was something else with one of our
> > > components not building with gcc-4.6 - SGX or multimedia, don't
> > > remember exactly.
> >
> >   taking koen's advice to heart, should this discussion be happening
> > on the meta-ti list?
>
> Sure, let's switch to meta-ti...
>
> Here's another report of gcc-4.6 failing on u-boot, due to wrong optimization
> used, which should be easy to fix, though:
>
> https://lists.yoctoproject.org/pipermail/meta-ti/2012-February/000614.html

  oh, *that* issue.  yes, that's what i've been working around in
another context.  i didn't realize that's what we were talking about
when you mentioned toolchain issues.  if that's the same problem, that
goes back to september of 2011:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50266

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

