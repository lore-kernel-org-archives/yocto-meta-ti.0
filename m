Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6095E01430
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 05:01:04 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EC10Ht011177;
	Fri, 14 Sep 2012 13:01:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10777-05; Fri, 14 Sep 2012 13:00:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EC0nKR011171
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 13:00:52 +0100
Message-ID: <1347624052.13596.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 14 Sep 2012 13:00:52 +0100
In-Reply-To: <505318E3.9060009@mlbassoc.com>
References: <20120914080805.GD26968@edge> <5053065A.4090009@r-finger.com>
	<1347622164.9456.18.camel@ted> <505318E3.9060009@mlbassoc.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: meta-ti@yoctoproject.org
Subject: Re: Make meta-ti comply with Yocto Project BSP requirements
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
X-List-Received-Date: Fri, 14 Sep 2012 12:01:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 05:45 -0600, Gary Thomas wrote:
> On 2012-09-14 05:29, Richard Purdie wrote:
> > On Fri, 2012-09-14 at 11:26 +0100, Tomas Frydrych wrote:
> >> On 14/09/12 09:08, Denys Dmytriyenko wrote:
> >>> 3. Inheriting (i.e. inherit systemd) classes from another layer, such as
> >>> meta-systemd. This behavior breaks parsing and requires BBMASK-ing those
> >>> problematic recipes. Although, it requires an "application" layer and not a
> >>> "distribution" one, it's quite bad nonetheless, as it breaks parsing. High
> >>> priority.
> >>
> >> I am not sure about this one; it is reasonable / necessary for a bsp
> >> layer to provide an -initd / -systemd packages (e.g., the pvr drivers
> >> need this, the gstreamer-ti package needs this), and as long as there is
> >> no systemd.bbclass in oe-core, I suspect the only answer is to split the
> >> bsp layer into -bsp, -bsp-initd and --bsp-systemd. I am not sure whether
> >> such endless proliferation of layers is a particularly good solution?
> >
> > I don't think PVR modules having a dependency on some particular init
> > system is a good thing.
> >
> > What we need is a good core init system architecture and then these
> > pieces can plug into that in whatever way is appropriate.
> >
> > I appreciate we're not there yet however I think the overall goal of
> > separating hardware support from "policy" is a good one. There are a few
> > pain points we need to work through but if it was easy, we'd already
> > have done it :)
> >
> > systemd support in OE-Core is being deferred to 1.4 as I want it done
> > well and would be too rushed given where we're at in the schedule now.
> 
> When that does happen, I hope that it will still be possible to have
> a distribution which uses initd.  Will that be the case, or do we all
> have to follow down the systemd yellow brick road (which I personally
> am not in favour of)?

I want to systemd being optional with people electing to use or not use
it...

Cheers,

Richard



