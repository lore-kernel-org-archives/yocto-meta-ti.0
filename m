Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 666F0E0059A
	for <meta-ti@yoctoproject.org>; Sun,  8 Apr 2012 19:18:56 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2600202X33FUJ0@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 08 Apr 2012 21:18:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BDA53201CF; Sun,
	08 Apr 2012 22:18:39 -0400 (EDT)
Date: Sun, 08 Apr 2012 22:18:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20120409021839.GF10246@denix.org>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>
	<20120319210247.GD15554@denix.org>
	<20120319210557.GF19810@bill-the-cat>
	<788A3D57-ACFD-4CA0-820F-0DD91DCB8196@dominion.thruhere.net>
	<4F7630F0.8010408@ti.com> <4F771465.7030708@balister.org>
	<1333208327.18082.237.camel@ted>
MIME-version: 1.0
In-reply-to: <1333208327.18082.237.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org
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
X-List-Received-Date: Mon, 09 Apr 2012 02:18:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 31, 2012 at 04:38:47PM +0100, Richard Purdie wrote:
> On Sat, 2012-03-31 at 10:27 -0400, Philip Balister wrote:
> > On 03/30/2012 06:17 PM, William Mills wrote:
> > > On 03/30/2012 06:09 PM, Koen Kooi wrote:
> > > I have no objection to the branch to ensure the current working
> > > functionality remains working with yocto maintenance releases.
> > > 
> > > However, I don't think we should actively maintain new features on both
> > > branches.
> > > 
> > > So what is the goal of the branch?
> > 
> > People that ship OE based stuff to customers hate basing stuff that goes
> > to customers based on layers that are under active development. We are
> > much happier with layers that are getting fixes for existing problems only.
> 
> I'd echo this. Whilst its nice for developers to just keep iterating on
> continual development, it doesn't actually work for users and having
> some kind of release/stable branch helps a lot.
> 
> This is why the Yocto Project is having releases and those releases are
> being maintained with point releases containing fixes. We don't add new
> features in the release branches.
> 
> I'd strongly encourage this model to various layers. I appreciate its
> not the way OE has worked in the past and it takes a bit of work to
> change developer mindset on this though.

All,

We had few opportunities to further discuss this matter at the Yocto BSP 
Summit and the Yocto Day at the Linux Collab during last week...

The outcome was that we'd like to recommend for all the layers (including 
meta-ti :) ) to apply the same tag at the same time of the Yocto release and, 
if needed, create the corresponding maintenance branch. The current release 
schedule of the Yocto Project is (roughly) every 6 month around April and 
October. We still need to decide on the exact naming convention for those tags 
and branches, which I hope will be discussed and finalized at the yocto 
mailing list in time for the release in the coming weeks.

-- 
Denys

