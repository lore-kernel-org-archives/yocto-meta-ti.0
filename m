Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B77BBE013A3
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 10:34:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MHYCGn017552;
	Thu, 22 Mar 2012 17:34:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16492-09; Thu, 22 Mar 2012 17:34:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MHY40P017545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Mar 2012 17:34:04 GMT
Message-ID: <1332437646.9740.276.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: William Mills <wmills@ti.com>
Date: Thu, 22 Mar 2012 17:34:06 +0000
In-Reply-To: <4F6B57CB.5080000@ti.com>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted> <20120321214515.GD6857@denix.org>
	<1332367838.9740.208.camel@ted>
	<F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
	<20120322150716.GA13495@denix.org> <4F6B57CB.5080000@ti.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 22 Mar 2012 17:34:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 12:48 -0400, William Mills wrote:
> >> Op 21 mrt. 2012, om 23:10 heeft Richard Purdie het volgende geschreven:
> >>> The trouble is Koen keeps doing this and nobody in general replies. The
> >>> lack of a reply can be seen as to condone what was said and its
> >>> certainly leading to people getting more confused. I think a response
> >>> was appropriate.
> 
> For the record I will try to speak for the official TI position on this.

Thanks!

> 6) Although we plan to support base oe-core and poky configurations, 
> they will *not* be recommended configurations for several reasons:
> 6.1) oe-core and poky ignore ~ 12 month of toolchain improvements made 
> by Linaro.
> 6.2) At this time, all of the internal and customer validation of TI 
> BSPs has been done with a gcc 4.5 based toolchain that includes the 
> linaro patches.
>
> As stated in #6, TI will continue to recommend meta-oe in the layer 
> stack to get the toolchain that TI tests with.  We hope, as work with 
> linaro continues to switch that to an official meta-linaro layer.

I think there could be better integration with Linaro and I know work is
being done in this area so I'm hoping this situation will improve.

I know Bill understands this but just to be clear for the record, the
only scalable way OE-Core can work is to embrace upstream latest
releases as much as is practicable which is why 4.6 is currently used.
If people need something different *and* step up with resources to
maintain/test it, we can talk about other versions but for anything like
an extra toolchain, we need people to help support it.

Just to illistrate this, making a release of OE-Core/Poky currently
involves testing on 5 'architectures' on virtual and real hardware with
about 8 different images to test along with features like sstate,
sdk/toolchain, no-gplv3, multilib and tiny. This gives a staggering test
matrix.

> TI will continue to test with and recommend a toolchain that is closely 
> aligned with Linaro.  We see no reason customers should have to misalign 
> themselves with the ARM ecosystem just to align with poky.

s/poky/upstream/

and with 4.7 (out today), we should have a lot of the Linaro fixes,
right so this problem should start solving itself when we update to
4.7? :)

The layer model should make this less of an issue if we can have a
strong layer containing that toolchain. I know progress is being made in
splitting this from meta-oe so that should simplify the problem.

> ---------------------------------
> [speaking for myself now]
> 
> I fully support base poky testing but I think we are getting dangerously 
> close to a defacto statement that the only real yocto based distro is 
> one that _only_ uses poky + a BSP layer.  I am not aligned with that 
> view.

FWIW I'm not aligned with that view either!

>   I think oe-core and poky are a fine base but many customers will 
> need to expand on what is there with more layers.

I think its fine to say poky is the way Yocto tests and validates
OE-Core and is something it can release as a tested know to work base
people can build off. As such, pointing people to poky as a way of
testing and getting started is reasonable.

I also think its fine to say that poky + a BSP layer should work without
anything else.

Its perfectly reasonable for people to add in other layers on top of
that.

> Richard,
> 
> You seem to take offense at Koen's claim that Angstrom is Yocto.  As I 
> stated above I don't think Angstrom _is_ yocto but how do we refer to 
> distributions that are based off of oe-core or even poky that include 
> other layers.

I'm not sure I took offence, I was just trying to clearly position
things. Poky isn't Yocto either in the strict sense, its a component of
it. 

>   Are they "Yocto based" or "Yocto aligned"?  How about 
> "Yocto adjacent" :) ?

That is a good question and I don't have the answer. I think I like
"Yocto aligned" as it implies its sharing the objectives of Yocto,
particularly around layers, OE-COre and BSPs which I believe Angstrom
is.

I'd suggest on this detail, it gets raised with the Yocto AB and
Advocacy people and we should document what "Yocto alignment" means
somewhere.

Cheers,

Richard



