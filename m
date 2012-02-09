Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 982A8E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 09:14:37 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZ400IPGYJX1D70@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 09 Feb 2012 11:14:23 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 37995200B9; Thu,
	09 Feb 2012 12:14:20 -0500 (EST)
Date: Thu, 09 Feb 2012 12:14:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Message-id: <20120209171420.GC3917@denix.org>
References: <59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<4F331E78.3000302@ti.com>
	<CAFZh4h_dVaOnbYMZjnAc34upJqoPKK4AaPEOEHPTQL6ZEyU-6w@mail.gmail.com>
	<CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
	<20120209163651.GA3917@denix.org> <4F33FB87.8030102@balister.org>
MIME-version: 1.0
In-reply-to: <4F33FB87.8030102@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Thu, 09 Feb 2012 17:14:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 09, 2012 at 08:59:51AM -0800, Philip Balister wrote:
> On 02/09/2012 08:36 AM, Denys Dmytriyenko wrote:
> > On Thu, Feb 09, 2012 at 11:23:14AM -0500, Brian Hutchinson wrote:
> >>  On Wed, Feb 8, 2012 at 8:16 PM, William Mills <wmills@ti.com> wrote:
> >>> As Gary said there has not been too many end user questions on meta-ti yet.
> >>
> >>  All I care about is meta-ti as that is what all our products are based
> >>  on. I've been watching subject for a while now trying to discern all
> >>  the issues and make a wise choice.
> > 
> > Brian,
> > 
> >>  I'm wanting to switch from Arago to whatever TI supports next as I
> >>  supply the rest of our development team with tools and images that
> >>  they build applications on for our products and I can't jerk them
> >>  around changing distros.
> > 
> > As you are aware, Arago is not going away - there is work going on in 
> > meta-arago layer to update/port it to the new Yocto infrastructure.
> > 
> > Arago/meta-arago is still going to be the official platform distribution for 
> > TI SDK products. But, a separate meta-ti layer was created early in the 
> > process to detach and unify the BSP layer and allow people to use TI hardware 
> > with different distributions. And that's actually part of the problem, as 
> > distributions like religions conflict with each other in a single layer... :)
> > 
> 
> Denys, from my point of view, there are two issues we need to solve:

Philip,

These are very good points you raise!

> 1) Defining the meta-ti toolchain dependencies. Angstrom uses gcc-4.5
> for various reasons. Will the TI programs work against all gcc versions
> available from oe-core/meta-oe?

We've discussed it internally and with some of the other involved parties. 
Right now gcc-4.5 with Linaro patches from meta-oe is still the recommended 
toolchain. We need to validate gcc-4.6 from oe-core though. Few people (Bill 
Mills and Khem Raj among others) are currently at Linaro Connect trying to 
convince Linaro guys to get serios and provide an official meta-linaro layer 
for Yocto.

> 2) Image construction pieces in oe-core are not all there yet. This is
> what leads to angstrom specific bits creeping into the BSP layer. I've
> talked with Paul Eggleton and Koen about this at FOSDEM. We should sit
> down next week at ELC and see if we can come up with a set os tasks we
> can push into oe-core that let all layer/distro combinations produce
> working images.

Some work has already started in regards to tasks and images in meta-ti and 
meta-arago to clean them up and simplify the dependencies. I agree, there is a 
need for a better framework from OE-Core to define base tasks and avoid 
cluttering BSP layers with distro-specific dependencies. Let's talk next week 
at ELC.

-- 
Denys

