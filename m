Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 897BAE013A5
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 14:29:28 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1500IOPICT12F0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 19 Mar 2012 16:29:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2D97E201C0; Mon,
	19 Mar 2012 17:29:16 -0400 (EDT)
Date: Mon, 19 Mar 2012 17:29:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120319212916.GE15554@denix.org>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>
	<20120319210247.GD15554@denix.org>
	<20120319210557.GF19810@bill-the-cat>
	<EC42051F-B39B-4B48-AC71-8BB88C00E297@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <EC42051F-B39B-4B48-AC71-8BB88C00E297@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: release branch for meta-ti?
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
X-List-Received-Date: Mon, 19 Mar 2012 21:29:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 19, 2012 at 10:13:48PM +0100, Koen Kooi wrote:
> 
> Op 19 mrt. 2012, om 22:05 heeft Tom Rini het volgende geschreven:
> 
> > On Mon, Mar 19, 2012 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
> >> On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
> >>> On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
> >>>> Hi,
> >>>> 
> >>>> Any volunteers for maintaining a releasebranch that matches the upcoming oe-core release in ~4 weeks?
> >>> 
> >>> If Denys or Chase don't step-up, I'll do it.  As qualification, I do
> >>> such a thing for oe-classic currently :)  But if either of them would
> >>> rather, I'll defer to them.
> >> 
> >> We'll probably need to set meta-oe-maintenance up anyway for meta-arago to 
> >> work with, rather than chasing changes in the master...
> > 
> > Yes, meta-oe will also need a maintenance release to match,
> 
> Working on that already :) That should hopefully avoid the usual arago forks 
> or everything and the kitchensink.

Something's wrong with the above statement... :)

Is it "meta-oe maintenance should hopefully avoid the usual arago forks...", 
which is kind of backwards and doesn't make much sense to me :)

Or is it "meta-oe maintenance should help avoid the usual arago forks...", 
which I hope is what you wanted to say... :)

BTW, it's not like we like forks or encourage people to fork, but that's how 
people are used to work. I'm having hard time convincing people otherwise - 
i.e. track mainline or a stable branch and submit your changes back as 
patches. Chase is the only one who took this advise to heart and it's been 
pleasure to work with him supporting AM-SDK since then! :)

-- 
Denys

