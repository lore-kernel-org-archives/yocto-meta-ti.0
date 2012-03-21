Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42398E0044D
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 14:27:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LLRZl0006368;
	Wed, 21 Mar 2012 21:27:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06055-05; Wed, 21 Mar 2012 21:27:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LLROJQ006362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Mar 2012 21:27:25 GMT
Message-ID: <1332365246.9740.195.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Mar 2012 21:27:26 +0000
In-Reply-To: <ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 21 Mar 2012 21:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 21:48 +0100, Koen Kooi wrote:
> Op 21 mrt. 2012, om 21:42 heeft Russell Senior het volgende
> geschreven:
> >>>>>> "Koen" == Koen Kooi <koen@dominion.thruhere.net> writes:
> > 
> >>> I am dumping this mail to ask for some clarifications. I am
> looking
> >>> closely to yocto as environment for building embedded linux distro
> >>> for omap based boards.
> > 
> > Koen> Yocto or poky? If you're after yocto, just follow the
> > Koen> instructions in the README, that will get you that using the
> > Koen> yocto framework. If you're after poky, that's something
> > Koen> completely different.
> > 
> > A yocto guy I was recently talking to implied that yocto more or
> less
> > equal'd poky.  
> 
> Yes, they tend to do that a lot, don't they?
> 
> > Frankly, I find these code words baffling.  Can you
> > explain or point me at an explanation of the distinction between OE,
> > yocto and poky?
> 
> Poky used to be a fork of OE that got picked up when the yocto project
> was founded. After yocto was announced we all agreed they would drop
> the 'poky'  name and bits and continue together as 'oe-core'. 
> What is happening is that some yocto marketing folks are a bit too
> attached to the poky name and want to muddy the waters. The more
> confusion, the more business for yocto certified consultants.

I've really just about had enough of this since the descriptions you
give out don't exactly help much and its a game of deflection.

Yocto is the overall project which is aiming to make embedded Linux
easier and improve the tooling. Yocto and OpenEmbedded agreed to work on
and share OpenEmbedded-Core. It was agreed that Poky would continue as a
sub-project of Yocto which was there to test and demonstrate OE-Core on
real hardware and give people something they could pick up and get
started with in a simple "one stop" single checkout manner.

Poky is living true to that agreement.

What I really find *extremely* distasteful is that despite repeated
requests, meta-ti still has hard dependencies on meta-oe and worse,
meta-angstrom and is not following the spirit of the agreements made
about working together on OE-Core. The idea was to better separate out
hardware from distribution policy and give people clear guidance over
layers. To put it simply, meta-ti has yet to do this. I cannot take
meta-ti and have it work against oe-core alone, or against poky.

The amount of confusion this is causing users is immense as we see from
new users and experienced ones alike. Whilst I know people have nodded
and agreed they're going to fix it, time goes on and we don't seem to
make much progress.

The biggest confusion factor out there at the moment is meta-ti, not
poky and I'd like to ask politely for people to get their act together.

Cheers,

Richard



