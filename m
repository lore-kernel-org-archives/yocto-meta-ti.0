Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2056EE00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 09:54:14 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZ50009A0DHHI83@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 09 Feb 2012 11:53:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6AE77200B9; Thu,
	09 Feb 2012 12:53:40 -0500 (EST)
Date: Thu, 09 Feb 2012 12:53:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-id: <20120209175340.GE3917@denix.org>
References: <59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<4F331E78.3000302@ti.com>
	<CAFZh4h_dVaOnbYMZjnAc34upJqoPKK4AaPEOEHPTQL6ZEyU-6w@mail.gmail.com>
	<CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
	<20120209163651.GA3917@denix.org>
	<CAFZh4h_-E=o5eeaoz09-XGg7d+O=9+B0KXcqvqtsVB8_GustuQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h_-E=o5eeaoz09-XGg7d+O=9+B0KXcqvqtsVB8_GustuQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Feb 2012 17:54:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 09, 2012 at 11:54:37AM -0500, Brian Hutchinson wrote:
> On Thu, Feb 9, 2012 at 11:36 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > Arago/meta-arago is still going to be the official platform distribution for
> > TI SDK products. But, a separate meta-ti layer was created early in the
> > process to detach and unify the BSP layer and allow people to use TI hardware
> > with different distributions. And that's actually part of the problem, as
> > distributions like religions conflict with each other in a single layer... :)
> 
> Hey Denys, good to hear from you again!

Brian, nice to talk to you again!

> Sorry for totally hi-jacking this thread .... so what should be the
> roadmap for someone like me who works on TI products and has to
> generate images now?  Do I use Yocto with meta-ti and in the future
> when the dust settles use Yocto with meta-arago?

First, meta-arago is not meant to replace meta-ti, it's meant to complement 
it. Yocto Project makes heavy use of layers and there are different types of 
layers - base, BSP, apps and distro. There used to be a visual diagram of how 
layers stack on top of one another, but I can't find it now. There is a nice 
comprehesive list of known layers, grouped by their type:
http://www.openembedded.org/wiki/LayerIndex

With that in mind, meta-ti is meant to be a pure BSP layer, while meta-arago 
is shaping up to contain 2 sub-layers - distro one and extra sw apps one.

You'd be able to use meta-ti in different combinations of layers with 
different distro layers - none, angstrom, arago and poky/yocto. When meta-ti 
is used together with meta-arago distro, it should provide the same features 
and same functionality as old Arago.

All this is within realms of the Yocto Project. Sometimes it's confusing when 
one refers to Yocto as a wider framework and the build sytem, vs. Yocto/Poky 
as a distribution layer and/or reference release... Please refer to Richard's 
earlier email in this thread for further clarification.

> I've heard bits and pieces of things changing but I guess I never knew
> enough of the TI roadmap to know for sure what I should be doing so
> that I steer our team/company in the right direction for all these
> changes.  I'm currently using Arago to generate our images (separate
> CSL toolchain (old), and the generated packages are old too).

The old Arago, which is based on the Classic OpenEmbedded, is used by several 
TI SDK products. Mostly due to the continuing support and maintenance of the 
existing products, the new development had constrained resources and slow 
progress.

-- 
Denys

