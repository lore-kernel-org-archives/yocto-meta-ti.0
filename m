Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA6B6E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:34:35 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYH00IOK55MI1B2@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Jan 2012 14:34:35 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 791B2202E0; Fri,
	27 Jan 2012 15:34:34 -0500 (EST)
Date: Fri, 27 Jan 2012 15:34:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120127203433.GG8707@denix.org>
References: <4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org> <4F230803.1070503@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1010BF9D92A@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:34:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 27, 2012 at 08:29:42PM +0000, Maupin, Chase wrote:
> > > I don't think that was Bill's message. It was simplicity. BSP
> > only layer, no
> > > supplemental apps, if not absolutely required.
> > >
> > > Your example with lmbench is not correct - BSP layer should be
> > simple enough
> > > to be used with OE-Core alone to produce a console rootfs image
> > with nothing
> > > but busybox.
> > >
> > > How about splitting meta-ti into:
> > > * BSP only
> > > * SGX graphics
> > > * DSP tools
> > > * WiFi etc.
> > >
> > > And then splitting meta-arago into:
> > > * Arago distro for TI SDKs
> > > * Supplemental apps
> > >
> > 
> > Need to get my "YES!" in here before everyone barfs all over the
> > proposal :)
> 
> I'm good with this.  I was also planning in meta-arago to at least put all 
> bbappends in a recipes-appends directory so it was easy to track the things 
> we are "tweaking" vs. the recipes.  Arago today is too much of a mix between 
> amends and recipes in my opinion.  I would even say that Tom's proposal 
> (from IRC) of splitting the arago distro and supplemental apps into two 
> layers would be a good idea so that other distros can pull our supplemental 
> apps if they want pretty easily.  And that way we don?t keep adding more 
> repos to manage.

Actually that was my proposal (and Bill's offline), but never mind :)

As of today's state of Arago - if you don't count recipes/ti, which was 
"untouchable" for some special reasons, everything else is quite clean with 
using amends everywhere possible! And our of all the people you should know 
this better.

-- 
Denys

