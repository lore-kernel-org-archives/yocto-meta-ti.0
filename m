Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17770E013CB
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 12:14:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MJE6XQ018582;
	Thu, 22 Mar 2012 19:14:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17761-06; Thu, 22 Mar 2012 19:14:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2MJDw1d018575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Mar 2012 19:13:59 GMT
Message-ID: <1332443641.9740.313.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: William Mills <wmills@ti.com>
Date: Thu, 22 Mar 2012 19:14:01 +0000
In-Reply-To: <4F6B6F3F.3080204@ti.com>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>
	<86ehsln0t7.fsf@coulee.tdb.com>
	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted> <20120321214515.GD6857@denix.org>
	<1332367838.9740.208.camel@ted>
	<F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
	<20120322150716.GA13495@denix.org> <4F6B57CB.5080000@ti.com>
	<1332437646.9740.276.camel@ted> <4F6B6F3F.3080204@ti.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 19:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 14:28 -0400, William Mills wrote:
> On 03/22/2012 01:34 PM, Richard Purdie wrote:
> > I know Bill understands this but just to be clear for the record, the
> > only scalable way OE-Core can work is to embrace upstream latest
> > releases as much as is practicable which is why 4.6 is currently used.
> > If people need something different *and* step up with resources to
> > maintain/test it, we can talk about other versions but for anything like
> > an extra toolchain, we need people to help support it.
> >
> > Just to illistrate this, making a release of OE-Core/Poky currently
> > involves testing on 5 'architectures' on virtual and real hardware with
> > about 8 different images to test along with features like sstate,
> > sdk/toolchain, no-gplv3, multilib and tiny. This gives a staggering test
> > matrix.
> 
> Well, the test matrix would not get *any* bigger if a Linaro aligned 
> tool chain were used for *all* ARM architecture builds.  Yes, there is 
> work to maintain a separate toolchain recipe but we covered that above. 
>   Sure we could not support a different toolchain per BSP or Si vendor 
> but I think if all ARM providers were aligned on one toolchain it would 
> make sense to support it.  In fact there is an organization to get 
> alignment of different ARM vendors: Linaro.  We even have participation 
> of ARM vendors that are not officially part of Linaro.

I can see where you're coming from but I'd really prefer to have one
toolchain version and patchset for OE-Core. 

I'm sure if ARM changes, we'd then get requests for other patchsets for
other platforms. It also penalises ARM vendors (or whoever) who did the
right thing and got their code into the recent gcc.

> >> TI will continue to test with and recommend a toolchain that is closely
> >> aligned with Linaro.  We see no reason customers should have to misalign
> >> themselves with the ARM ecosystem just to align with poky.
> >
> > s/poky/upstream/
> 
> The point is to align with the most number of test hours and test cases 
> run.  I still maintain that on ARM hardware the Linaro toolchain has 
> more test hours than a plain vanilla upstream toolchain.

How about using the CodeSorcery monster toolchain patches for example? I
suspect they get more test hours too.

My point is I doubt we can find a solution that everyone will be happy
with and an upstream baseline with appropriate patches seems to be the
best middle ground we can find.

> > and with 4.7 (out today), we should have a lot of the Linaro fixes,
> > right so this problem should start solving itself when we update to
> > 4.7? :)
> 
> Yes at this instant in time and the divergence also starts today 
> (actually a while back due to code freeze etc.)  That is why poky and 
> any plain upstream toolchain will be an average of 6 to 12 months behind 
> the current Linaro "best".

s/poky/oe-core/

I'd hope that over time, ARM can get its support for new features into
gcc in a sensible time frame so that the current gcc works well with
production silicon and isn't 6-12 months behind. I'd like to think the
current situation will therefore correct itself and not be a permanent
state.

> >>    I think oe-core and poky are a fine base but many customers will
> >> need to expand on what is there with more layers.
> >
> > I think its fine to say poky is the way Yocto tests and validates
> > OE-Core and is something it can release as a tested know to work base
> > people can build off. As such, pointing people to poky as a way of
> > testing and getting started is reasonable.
> >
> > I also think its fine to say that poky + a BSP layer should work without
> > anything else.
> 
> We all agree and we are are getting close.
> 
> There is still a difference between a baseline and a recommendation.
> 
> Maintaining this status may be challenging.  I am going to have 0 buy-in 
> from the developers to add workarounds into the kernel for bugs in GCC 
> that are already fixed in the Linaro toolchain.

In those cases I'd be happy to see gcc patches applied to the OE-Core
toolchain to address the issues. We already have a pretty good track
record of dealing with this as far as I know.

Cheers,

Richard


