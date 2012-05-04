Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6681E00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 17:12:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3H00DTD1X33ZG4@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 19:12:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B934320099; Thu,
	03 May 2012 20:12:39 -0400 (EDT)
Date: Thu, 03 May 2012 20:12:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120504001239.GI9822@denix.org>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<20120503171556.GJ2681@denix.org>
	<9F436296-853B-4A02-97B4-77B491AD6D2B@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <9F436296-853B-4A02-97B4-77B491AD6D2B@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 1/5] linux-mainline 3.2: kernel recipe based on mainline 3.2.16 with additional patches for e.g. beagleboard on top
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
X-List-Received-Date: Fri, 04 May 2012 00:12:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 03, 2012 at 07:20:47PM +0200, Koen Kooi wrote:
> 
> Op 3 mei 2012, om 19:15 heeft Denys Dmytriyenko het volgende geschreven:
> 
> > It's a heavy patch, but my question is - how is it different from linux-3.0 we 
> > already have, besides the version upgrade to 3.2? Why is it called 
> > linux-mainline, the old linux recipe is also mainline with beagle patches.
> > 
> > Basically, I'm trying to understand 2 things here:
> > - what's the difference between this beagle patch set and the one applied on 
> > top of e.g. 3.0.28? Is it a different dev model, goals, owner or anything else
> 
> Pretty much the same, with less PM. The goal is to keep moving closer to 
> mainline and to a recent mainline version. With this update we'll be using 
> the same kernel Robert Nelson uses for his ubuntu builds.

Ok, the whole series is now in.

> > - why the name change with -mainline suffix?
> 
> To namespace it like we planned for our u-boot recipes, a number of layers 
> have linux_3.2.bb recipes that would clash :( I'm not really fond of it, but 
> that's the price we pay for all these layers.

Wouldn't linux-mainline_3.2.bb clash as well with another layer? I thought the 
agreement was to have TI-specific namespacing, such as SoC family in the 
name...

-- 
Denys

