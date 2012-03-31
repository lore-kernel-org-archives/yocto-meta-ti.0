Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F5C1E01304
	for <meta-ti@yoctoproject.org>; Sat, 31 Mar 2012 08:39:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VFcsFA024629;
	Sat, 31 Mar 2012 16:38:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24555-01; Sat, 31 Mar 2012 16:38:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VFckk2024623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 31 Mar 2012 16:38:48 +0100
Message-ID: <1333208327.18082.237.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>
Date: Sat, 31 Mar 2012 16:38:47 +0100
In-Reply-To: <4F771465.7030708@balister.org>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>	<20120319210247.GD15554@denix.org>
	<20120319210557.GF19810@bill-the-cat>
	<788A3D57-ACFD-4CA0-820F-0DD91DCB8196@dominion.thruhere.net>
	<4F7630F0.8010408@ti.com> <4F771465.7030708@balister.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sat, 31 Mar 2012 15:39:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 10:27 -0400, Philip Balister wrote:
> On 03/30/2012 06:17 PM, William Mills wrote:
> > On 03/30/2012 06:09 PM, Koen Kooi wrote:
> >>
> >> Op 19 mrt. 2012, om 14:05 heeft Tom Rini het volgende geschreven:
> >>
> >>> On Mon, Mar 19, 2012 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
> >>>> On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
> >>>>> On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Any volunteers for maintaining a releasebranch that matches the
> >>>>>> upcoming oe-core release in ~4 weeks?
> >>>>>
> >>>>> If Denys or Chase don't step-up, I'll do it.  As qualification, I do
> >>>>> such a thing for oe-classic currently :)  But if either of them would
> >>>>> rather, I'll defer to them.
> >>>>
> >>>> We'll probably need to set meta-oe-maintenance up anyway for
> >>>> meta-arago to
> >>>> work with, rather than chasing changes in the master...
> >>>
> >>> Yes, meta-oe will also need a maintenance release to match
> >>
> >> meta-oe branch is really close to having a maintainer, what's the
> >> (final) word on the meta-ti branch?
> > 
> > I have no objection to the branch to ensure the current working
> > functionality remains working with yocto maintenance releases.
> > 
> > However, I don't think we should actively maintain new features on both
> > branches.
> > 
> > So what is the goal of the branch?
> 
> People that ship OE based stuff to customers hate basing stuff that goes
> to customers based on layers that are under active development. We are
> much happier with layers that are getting fixes for existing problems only.

I'd echo this. Whilst its nice for developers to just keep iterating on
continual development, it doesn't actually work for users and having
some kind of release/stable branch helps a lot.

This is why the Yocto Project is having releases and those releases are
being maintained with point releases containing fixes. We don't add new
features in the release branches.

I'd strongly encourage this model to various layers. I appreciate its
not the way OE has worked in the past and it takes a bit of work to
change developer mindset on this though.

Cheers,

Richard




