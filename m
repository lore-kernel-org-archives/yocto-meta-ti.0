Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E4AAE013A5
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 14:03:16 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1500FN9H4N16X3@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 19 Mar 2012 16:02:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A528D2018B; Mon,
	19 Mar 2012 17:02:47 -0400 (EDT)
Date: Mon, 19 Mar 2012 17:02:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <trini@ti.com>
Message-id: <20120319210247.GD15554@denix.org>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>
MIME-version: 1.0
In-reply-to: <20120319205854.GE19810@bill-the-cat>
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
X-List-Received-Date: Mon, 19 Mar 2012 21:03:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
> On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
> > Hi,
> > 
> > Any volunteers for maintaining a releasebranch that matches the upcoming oe-core release in ~4 weeks?
> 
> If Denys or Chase don't step-up, I'll do it.  As qualification, I do
> such a thing for oe-classic currently :)  But if either of them would
> rather, I'll defer to them.

We'll probably need to set meta-oe-maintenance up anyway for meta-arago to 
work with, rather than chasing changes in the master...

BTW, Tom, when are we planning to kill 2011.03 in oe-classic? It's 1 year old 
now...

-- 
Denys

