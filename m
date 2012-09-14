Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAF9FE01430
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 04:29:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EBTVN8010832;
	Fri, 14 Sep 2012 12:29:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09739-09; Fri, 14 Sep 2012 12:29:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EBTM51010826
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 12:29:23 +0100
Message-ID: <1347622164.9456.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Fri, 14 Sep 2012 12:29:24 +0100
In-Reply-To: <5053065A.4090009@r-finger.com>
References: <20120914080805.GD26968@edge> <5053065A.4090009@r-finger.com>
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
X-List-Received-Date: Fri, 14 Sep 2012 11:29:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 11:26 +0100, Tomas Frydrych wrote:
> On 14/09/12 09:08, Denys Dmytriyenko wrote:
> > 3. Inheriting (i.e. inherit systemd) classes from another layer, such as 
> > meta-systemd. This behavior breaks parsing and requires BBMASK-ing those 
> > problematic recipes. Although, it requires an "application" layer and not a 
> > "distribution" one, it's quite bad nonetheless, as it breaks parsing. High 
> > priority.
> 
> I am not sure about this one; it is reasonable / necessary for a bsp
> layer to provide an -initd / -systemd packages (e.g., the pvr drivers
> need this, the gstreamer-ti package needs this), and as long as there is
> no systemd.bbclass in oe-core, I suspect the only answer is to split the
> bsp layer into -bsp, -bsp-initd and --bsp-systemd. I am not sure whether
> such endless proliferation of layers is a particularly good solution?

I don't think PVR modules having a dependency on some particular init
system is a good thing.

What we need is a good core init system architecture and then these
pieces can plug into that in whatever way is appropriate.

I appreciate we're not there yet however I think the overall goal of
separating hardware support from "policy" is a good one. There are a few
pain points we need to work through but if it was easy, we'd already
have done it :)

systemd support in OE-Core is being deferred to 1.4 as I want it done
well and would be too rushed given where we're at in the schedule now.

Cheers,

Richard


