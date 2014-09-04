Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5273CE006EF; Thu,  4 Sep 2014 11:11:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD929E004A0
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 11:11:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84IAvc4023288;
	Thu, 4 Sep 2014 13:10:57 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84IAvsc025659;
	Thu, 4 Sep 2014 13:10:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 13:10:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84IAvIF008217;
	Thu, 4 Sep 2014 13:10:57 -0500
Date: Thu, 4 Sep 2014 14:10:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
Message-ID: <20140904181056.GO18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
	<CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 18:11:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 10:55:02AM -0500, Robert Nelson wrote:
> On Thu, Sep 4, 2014 at 10:48 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Thu, Sep 04, 2014 at 10:37:24AM -0500, Peter A. Bigot wrote:
> >> On 09/04/2014 10:00 AM, Denys Dmytriyenko wrote:
> >> >On Thu, Sep 04, 2014 at 02:50:03PM +0000, Mikhail Zakharov wrote:
> >> >>On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> >> >>
> >> >>>One anomaly I've found is the CPU frequency range.  On debian we have:
> >> >>>
> >> >>>    debian@beaglebone:~$ cat
> >> >>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> >> >>>    300000 600000 800000 1000000
> >> >>>
> >> >>>while on OE we have:
> >> >>>
> >> >>>    root@beaglebone:~# cat
> >> >>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> >> >>>    300000 600000 720000 800000
> >> >>Stock yocto-bsp is missing a few things that can be found in Robert
> >> >>Nelson's patchset for 3.14 linux kernel.
> >> >>
> >> >>There are lots of other functionality that is missing from yocto-bsp
> >> >>kernel for Beaglebone. I suggest you take at the following repos and
> >> >>scavenge for what you need :P
> >> >First of all, this is meta-ti mailing list for the corresponding BSP. That's
> >> >what Peter was asking for, comparing to Robert's Debian and Yocto reference
> >> >BSPs, not the other way around.
> >> >
> >> >Second, Yocto reference BSP is that way for a reason - it's a reference BSP
> >> >done with pure mainline kernel and u-boot components w/o any patching on top.
> >> >That's its entire purpose. For anything else special, including performance
> >> >tweaks, there are other BSPs available. If there is an issue with performance
> >> >in meta-ti, we'll investigate it and try to match with Robert's BSP.
> >>
> >> Yes, at this time meta-ti's BSP performs as well as I've seen any
> >> OE-based system, and gets several things right that meta-yocto-bsp
> >> does not (and one thing wrong that meta-yocto-bsp gets right, I
> >> think; still investigating, will follow-up when I'm sure).
> >>
> >> I've also verified that performance with a native gcc 4.9.1 build on
> >> BeagleBone with hard float is poor, so it's not due to the way OE
> >> builds gcc.  I have several competing hypotheses to test.
> >
> > Can you please point to the test case you were using to measure time? I'd like
> > to try it with few different toolchains here as well. BTW, we are currently
> > using Linaro gcc-4.7.3 - I'm wondering how it performs.
> >
> >
> >> But I'm still looking for a way to set the CPU frequency to the
> >> higher values supported on Beaglebone Black.  I had hoped meta-ti's
> >> would be able to do that, since it has bone vs boneblack device
> >> trees and u-boot detection.
> >>
> >> Any hints where to look for clock settings?
> >
> > Some of those values are considered overclocking and according to the manual
> > will reduce the lifespan of the part...
> 
> That's an odd statement, as the parts used on the beaglebone black are
> binned and sold for 1Ghz operation.

Robert, Peter,

So, after some internal discussion, here's an update:

1. In TI kernel we do dynamic opp setting based on eFuse check in the file 
arch/arm/mach-omap2/opp33xx_data.c

2. Since most of our EVMs and EVM-SKs use 2.1 Si, everything works properly 
with eFuse check and dynamic opp setting.

3. But eFuse was not available in 2.0 rev of silicon, only in 2.1 rev. There 
were many BBB boards made with 2.0 Si that were binned to run at 1GHz. And 
older 1.0 Si revs were not 1GHz capable. Currently checking with HW and 
marketing teams if all/most 2.0 chips are safe to run at 1GHz... As w/o eFuse 
there's no way to determine if the chip is 1GHz capable or not.

4. If your BBB board has 2.1 Si rev, then you should get 1GHz automatically. 
We'll try to figure something out for 2.0 Si boards, but setting opps 
statically in dts is considered incorrect and risky...

-- 
Denys

