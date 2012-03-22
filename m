Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2256E00596
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 08:07:43 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1A00MNWKOAHDH0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 22 Mar 2012 10:07:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4F80B201C8; Thu,
	22 Mar 2012 11:07:16 -0400 (EDT)
Date: Thu, 22 Mar 2012 11:07:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120322150716.GA13495@denix.org>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted> <20120321214515.GD6857@denix.org>
	<1332367838.9740.208.camel@ted>
	<F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Thu, 22 Mar 2012 15:07:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 22, 2012 at 07:31:00AM +0100, Koen Kooi wrote:
> 
> Op 21 mrt. 2012, om 23:10 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2012-03-21 at 17:45 -0400, Denys Dmytriyenko wrote:
> >> That's not true. There are no hard dependencies on meta-angstrom any more. And 
> >> meta-oe is only needed to supply gcc-4.5 for now, until all the issues are 
> >> ironed out.
> >> 
> >> I've been making numerous builds past few weeks with different combination of 
> >> layers and besides few bugs I need to fix for the distro-less configuration, 
> >> was quite successful getting meta-ti work with oe-core WITHOUT meta-angstrom!
> >> 
> >> There are some systemd dependencies, but they are no longer hard ones. There 
> >> was discussion about moving beagle payload stuff off of meta-ti. But it should 
> >> no longer break things.
> > 
> > I've been going by the information I see and the contents of the meta-ti
> > README. Reading the above it looks like much progress is being made,
> > things are changing and I really do appreciate that happening!
> > 
> >>> The amount of confusion this is causing users is immense as we see from
> >>> new users and experienced ones alike. Whilst I know people have nodded
> >>> and agreed they're going to fix it, time goes on and we don't seem to
> >>> make much progress.
> >>> 
> >>> The biggest confusion factor out there at the moment is meta-ti, not
> >>> poky and I'd like to ask politely for people to get their act together.
> >> 
> >> See above, the work is being done. The first wave of people who complained 
> >> about those dependencies are now building their images. There are still 
> >> confused people, but we'll clear the message once all obstacles are resolved.
> > 
> > Great, thanks!
> > 
> >> Richard, Koen, please take your word-fight and name-calling offline! It's not 
> >> a proper place here. Thank you.
> > 
> > Well said and I agree with you! :)
> > 
> > The trouble is Koen keeps doing this and nobody in general replies. The
> > lack of a reply can be seen as to condone what was said and its
> > certainly leading to people getting more confused. I think a response
> > was appropriate.
> > 
> > I also do not mean to undermine the progress being made on meta-ti. I
> > hadn't heard much for a while but it looks like things are moving
> > forward and that is great to see.
> 
> And for the record, I have been the *only* one so far sending patches to 
> break that dependency and I don't even work for TI anymore!

While your patches are always appreciated, it's still quite selfish of you to 
say that, cause a) you don't do the "Political Correctness" dance; b) you were 
the one to put those dependencies in the first place and c) if I start ripping 
out them inconsiderably, you'll be the first to scream bloody murder! :) :)

Besides, the few patches I sent out to OE-Core were related to these efforts 
and to enable meta-ti to work with other distros reliably - pushing your 
SOC_FAMILY upstream, enabling DISTRO-less OVERRIDES and even fixing 
virtual/libc in rt-tests was needed for our own upcoming meta-arago distro 
with external toolchain. I do have few more fixes pending in my local queue, 
that I'll be pushing to meta-ti and sending out to other layers...

-- 
Denys

