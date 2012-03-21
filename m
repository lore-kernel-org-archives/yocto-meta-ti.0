Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EF94E0059A
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 15:10:48 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LMAgor006844;
	Wed, 21 Mar 2012 22:10:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06491-05; Wed, 21 Mar 2012 22:10:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LMAZlW006838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Mar 2012 22:10:37 GMT
Message-ID: <1332367838.9740.208.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 21 Mar 2012 22:10:38 +0000
In-Reply-To: <20120321214515.GD6857@denix.org>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted> <20120321214515.GD6857@denix.org>
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
X-List-Received-Date: Wed, 21 Mar 2012 22:10:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 17:45 -0400, Denys Dmytriyenko wrote:
> That's not true. There are no hard dependencies on meta-angstrom any more. And 
> meta-oe is only needed to supply gcc-4.5 for now, until all the issues are 
> ironed out.
> 
> I've been making numerous builds past few weeks with different combination of 
> layers and besides few bugs I need to fix for the distro-less configuration, 
> was quite successful getting meta-ti work with oe-core WITHOUT meta-angstrom!
> 
> There are some systemd dependencies, but they are no longer hard ones. There 
> was discussion about moving beagle payload stuff off of meta-ti. But it should 
> no longer break things.

I've been going by the information I see and the contents of the meta-ti
README. Reading the above it looks like much progress is being made,
things are changing and I really do appreciate that happening!

> > The amount of confusion this is causing users is immense as we see from
> > new users and experienced ones alike. Whilst I know people have nodded
> > and agreed they're going to fix it, time goes on and we don't seem to
> > make much progress.
> > 
> > The biggest confusion factor out there at the moment is meta-ti, not
> > poky and I'd like to ask politely for people to get their act together.
> 
> See above, the work is being done. The first wave of people who complained 
> about those dependencies are now building their images. There are still 
> confused people, but we'll clear the message once all obstacles are resolved.

Great, thanks!

> Richard, Koen, please take your word-fight and name-calling offline! It's not 
> a proper place here. Thank you.

Well said and I agree with you! :)

The trouble is Koen keeps doing this and nobody in general replies. The
lack of a reply can be seen as to condone what was said and its
certainly leading to people getting more confused. I think a response
was appropriate.

I also do not mean to undermine the progress being made on meta-ti. I
hadn't heard much for a while but it looks like things are moving
forward and that is great to see.

Cheers,

Richard





