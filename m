Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B156E0044D
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 14:45:33 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900IT88FGE981@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 21 Mar 2012 16:45:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2E8CF2018B; Wed,
	21 Mar 2012 17:45:15 -0400 (EDT)
Date: Wed, 21 Mar 2012 17:45:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20120321214515.GD6857@denix.org>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted>
MIME-version: 1.0
In-reply-to: <1332365246.9740.195.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Marco Monguzzi <marco.monguzzi@gmail.com>, meta-ti@yoctoproject.org
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
X-List-Received-Date: Wed, 21 Mar 2012 21:45:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 21, 2012 at 09:27:26PM +0000, Richard Purdie wrote:
> On Wed, 2012-03-21 at 21:48 +0100, Koen Kooi wrote:
> > Op 21 mrt. 2012, om 21:42 heeft Russell Senior het volgende
> > geschreven:
> > >>>>>> "Koen" == Koen Kooi <koen@dominion.thruhere.net> writes:
> > > 
> > >>> I am dumping this mail to ask for some clarifications. I am
> > looking
> > >>> closely to yocto as environment for building embedded linux distro
> > >>> for omap based boards.
> > > 
> > > Koen> Yocto or poky? If you're after yocto, just follow the
> > > Koen> instructions in the README, that will get you that using the
> > > Koen> yocto framework. If you're after poky, that's something
> > > Koen> completely different.
> > > 
> > > A yocto guy I was recently talking to implied that yocto more or
> > less
> > > equal'd poky.  
> > 
> > Yes, they tend to do that a lot, don't they?
> > 
> > > Frankly, I find these code words baffling.  Can you
> > > explain or point me at an explanation of the distinction between OE,
> > > yocto and poky?
> > 
> > Poky used to be a fork of OE that got picked up when the yocto project
> > was founded. After yocto was announced we all agreed they would drop
> > the 'poky'  name and bits and continue together as 'oe-core'. 
> > What is happening is that some yocto marketing folks are a bit too
> > attached to the poky name and want to muddy the waters. The more
> > confusion, the more business for yocto certified consultants.
> 
> I've really just about had enough of this since the descriptions you
> give out don't exactly help much and its a game of deflection.
> 
> Yocto is the overall project which is aiming to make embedded Linux
> easier and improve the tooling. Yocto and OpenEmbedded agreed to work on
> and share OpenEmbedded-Core. It was agreed that Poky would continue as a
> sub-project of Yocto which was there to test and demonstrate OE-Core on
> real hardware and give people something they could pick up and get
> started with in a simple "one stop" single checkout manner.
> 
> Poky is living true to that agreement.
> 
> What I really find *extremely* distasteful is that despite repeated
> requests, meta-ti still has hard dependencies on meta-oe and worse,
> meta-angstrom and is not following the spirit of the agreements made
> about working together on OE-Core. The idea was to better separate out
> hardware from distribution policy and give people clear guidance over
> layers. To put it simply, meta-ti has yet to do this. I cannot take
> meta-ti and have it work against oe-core alone, or against poky.

Richard,

That's not true. There are no hard dependencies on meta-angstrom any more. And 
meta-oe is only needed to supply gcc-4.5 for now, until all the issues are 
ironed out.

I've been making numerous builds past few weeks with different combination of 
layers and besides few bugs I need to fix for the distro-less configuration, 
was quite successful getting meta-ti work with oe-core WITHOUT meta-angstrom!

There are some systemd dependencies, but they are no longer hard ones. There 
was discussion about moving beagle payload stuff off of meta-ti. But it should 
no longer break things.

> The amount of confusion this is causing users is immense as we see from
> new users and experienced ones alike. Whilst I know people have nodded
> and agreed they're going to fix it, time goes on and we don't seem to
> make much progress.
> 
> The biggest confusion factor out there at the moment is meta-ti, not
> poky and I'd like to ask politely for people to get their act together.

See above, the work is being done. The first wave of people who complained 
about those dependencies are now building their images. There are still 
confused people, but we'll clear the message once all obstacles are resolved.

Richard, Koen, please take your word-fight and name-calling offline! It's not 
a proper place here. Thank you.

-- 
Denys

