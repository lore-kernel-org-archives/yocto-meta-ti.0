Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44337E0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 14:27:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBS0015VU9UCCL1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Oct 2012 16:27:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 40362202A9; Fri,
	12 Oct 2012 17:27:30 -0400 (EDT)
Date: Fri, 12 Oct 2012 17:27:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-id: <20121012212730.GE32601@denix.org>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
	<20121012205355.GD32601@denix.org>
	<CAOT3miKQiE18HUPtFZBGctYdB4Kb2A_WOjStdy+RegPmOtM3Jw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOT3miKQiE18HUPtFZBGctYdB4Kb2A_WOjStdy+RegPmOtM3Jw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Fri, 12 Oct 2012 21:27:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 12, 2012 at 11:11:50PM +0200, Nicolas Dechesne wrote:
> On Fri, Oct 12, 2012 at 10:53 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > https://github.com/rvfh/meta-ti/commit/6342c03a0dba7d906db09630e57e2372998428df
> >
> > The recipe itself is quite trivial (I even had my own version in the works)
> > and I only have couple minor fixes around SRCREV and its comment... But have
> > you compared the defconfigs between those two patches? I know the first
> > version of your patch used completely different unofficial defconfig... And
> > you didn't specify which one you have in v2. I'd prefer to use the defconfig
> > that was validated by the GLP team. Thanks.
> 
> i would still prefer that we create a somehow minimalist defconfig, i
> don't think using the 'monster' ubuntu defconfig (it has hundreds of
> drivers enabled....) makes too much sense for meta-ti. we used that
> because it was simpler for now, but I would hold on that patch until
> we have a simpler config. in fact we have already a config in the tree
> called omap4plus_defconfig, we will base on that one instead.

Ok, I'm fine with that - we can work out a minimal config.


> also we should wait until we have GST and GFX up and running before
> merging the kernel, to avoid a couple of iterations.

I would prefer to have the new kernel ASAP for many reasons. There were 
several reports about 3.1 not booting for some people. So, resolving that 
before Yocto Project 1.3 is released, is quite important. Plus, this gets us 
aligned better with your current Ubuntu-based release. And we are now starting 
to see patches against the old 3.1 kernel - by moving everyone to newer 3.4 we 
avoid waisting people's time fixing and enhancing the old 3.1...

So, I'd vote to get the new kernel first and worry about GST and GFX later. Do 
you feel there will be extensive changes to the kernel recipe associated with 
those? A little bit of churn on the defconfig would be acceptable...

-- 
Denys

