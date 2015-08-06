Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1DFEEE009FD; Thu,  6 Aug 2015 06:55:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E2C8E00867
	for <meta-ti@yoctoproject.org>; Thu,  6 Aug 2015 06:55:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t76Dt4SO031619;
	Thu, 6 Aug 2015 08:55:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76Dt4KY025881;
	Thu, 6 Aug 2015 08:55:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 08:55:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76Dt3Sr014877;
	Thu, 6 Aug 2015 08:55:03 -0500
Date: Thu, 6 Aug 2015 09:54:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150806135447.GY1040@edge>
References: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
	<CAMKF1soasoTP6wYhC8WDEuBn05ROkCKd_AcaoYGWgM+dEWE_Uw@mail.gmail.com>
	<CADySD0HWA-06wXF34Nh2==K_HCuAMViaFaD1HLGiacMocghqig@mail.gmail.com>
	<CAMKF1sr1n=k9ZHAT5N-7_DXPn2XguyOGqq8wJKO0qEmEQW9-=A@mail.gmail.com>
	<CADySD0FTkzQc5j98buY587OFr2qC7_8LTNgdUM=bhuyP6KqP=A@mail.gmail.com>
	<CADySD0H8Qxoz2We-zdYRmS+Whu4bAKXw3D4bGB7TvA7FPbsTtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0H8Qxoz2We-zdYRmS+Whu4bAKXw3D4bGB7TvA7FPbsTtw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 13:55:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 06, 2015 at 04:20:40PM +1200, Ankur Tyagi wrote:
> I just checked that inside "ti33x.inc",
> DEFAULTTUNE ?= "cortexa8thf-neon"
> 
> But it is overwritten by inclusion of arch-armv7a.inc
> DEFAULTTUNE ?= "armv7a"
> TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
> 
> But TUNER_FEATURES also include "callconvention-hard".
> 
> I am bit confused here.

It's not overwritten:
http://www.yoctoproject.org/docs/1.6/bitbake-user-manual/bitbake-user-manual.html#setting-a-default-value


> "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> fruit salad"
> 
> On Thu, Aug 6, 2015 at 3:49 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> 
> > thanks for help.
> >
> > Will try with above suggestion
> >
> > "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> > fruit salad"
> >
> > On Thu, Aug 6, 2015 at 3:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Wed, Aug 5, 2015 at 8:41 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> wrote:
> >> > Thanks for your response.
> >> >
> >> > So it is worth trying with TUNE_FEATURE "hfp" and measure the
> >> performance.
> >> > Do I have to set TARGET_FPU as "hfp-neon" as default value is "vfp-neon"
> >> >
> >>
> >> all you might need is to select a proper DEFAULTTUNE in machine config
> >> something like
> >>
> >> DEFAULTTUNE ?= "cortexa8thf-neon"
> >>
> >> > Does it make sense to push this change upstream as well ?
> >> >
> >> > "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> >> fruit
> >> > salad"
> >> >
> >> > On Thu, Aug 6, 2015 at 3:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> On Wed, Aug 5, 2015 at 7:47 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> >> wrote:
> >> >> > Hi,
> >> >> >
> >> >> > I am using TI AM335x-EVM kit and while building image using
> >> >> > "arago-daisy-config.txt", I saw this warning :
> >> >> >
> >> >> > omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
> >> >> > omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now
> >> >> >
> >> >> > and TUNE_FEATUREis "vfp"
> >> >> >
> >> >> > Does that mean GPU is not getting used anymore ?
> >> >>
> >> >> not really, what its telling is that you dont have
> >> >> callconvention-hard in TUNE_FEATURES
> >> >> which means that compiler wont use hardfloat ABI when making function
> >> >> calls.
> >> >> but neon/vfp will still be used e.g. when doing vectorization etc. if
> >> >> using hardfp ABI will radically improve performance totally depends
> >> >> upon kind of workload that you are measuring. It may vary.
> >> >>
> >> >> > I am using QT5 with eglfs platform and need GPU support for
> >> performance.
> >> >> >
> >> >> > Please clarify the situation.
> >> >> >
> >> >> > Thanks
> >> >> > Ankur
> >> >> >
> >> >> > --
> >> >> > _______________________________________________
> >> >> > meta-ti mailing list
> >> >> > meta-ti@yoctoproject.org
> >> >> > https://lists.yoctoproject.org/listinfo/meta-ti
> >> >> >
> >> >
> >> >
> >>
> >
> >

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


