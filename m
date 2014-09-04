Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1AC3E00769; Thu,  4 Sep 2014 08:48:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D4C2E006EF
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 08:48:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84FmK0w003789;
	Thu, 4 Sep 2014 10:48:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FmKS2010353;
	Thu, 4 Sep 2014 10:48:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:48:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FmJZv020431;
	Thu, 4 Sep 2014 10:48:19 -0500
Date: Thu, 4 Sep 2014 11:48:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20140904154819.GH18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <54088734.1090204@pabigot.com>
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
X-List-Received-Date: Thu, 04 Sep 2014 15:48:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 10:37:24AM -0500, Peter A. Bigot wrote:
> On 09/04/2014 10:00 AM, Denys Dmytriyenko wrote:
> >On Thu, Sep 04, 2014 at 02:50:03PM +0000, Mikhail Zakharov wrote:
> >>On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> >>
> >>>One anomaly I've found is the CPU frequency range.  On debian we have:
> >>>
> >>>    debian@beaglebone:~$ cat
> >>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> >>>    300000 600000 800000 1000000
> >>>
> >>>while on OE we have:
> >>>
> >>>    root@beaglebone:~# cat
> >>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> >>>    300000 600000 720000 800000
> >>Stock yocto-bsp is missing a few things that can be found in Robert
> >>Nelson's patchset for 3.14 linux kernel.
> >>
> >>There are lots of other functionality that is missing from yocto-bsp
> >>kernel for Beaglebone. I suggest you take at the following repos and
> >>scavenge for what you need :P
> >First of all, this is meta-ti mailing list for the corresponding BSP. That's
> >what Peter was asking for, comparing to Robert's Debian and Yocto reference
> >BSPs, not the other way around.
> >
> >Second, Yocto reference BSP is that way for a reason - it's a reference BSP
> >done with pure mainline kernel and u-boot components w/o any patching on top.
> >That's its entire purpose. For anything else special, including performance
> >tweaks, there are other BSPs available. If there is an issue with performance
> >in meta-ti, we'll investigate it and try to match with Robert's BSP.
> 
> Yes, at this time meta-ti's BSP performs as well as I've seen any
> OE-based system, and gets several things right that meta-yocto-bsp
> does not (and one thing wrong that meta-yocto-bsp gets right, I
> think; still investigating, will follow-up when I'm sure).
> 
> I've also verified that performance with a native gcc 4.9.1 build on
> BeagleBone with hard float is poor, so it's not due to the way OE
> builds gcc.  I have several competing hypotheses to test.

Can you please point to the test case you were using to measure time? I'd like 
to try it with few different toolchains here as well. BTW, we are currently 
using Linaro gcc-4.7.3 - I'm wondering how it performs.


> But I'm still looking for a way to set the CPU frequency to the
> higher values supported on Beaglebone Black.  I had hoped meta-ti's
> would be able to do that, since it has bone vs boneblack device
> trees and u-boot detection.
> 
> Any hints where to look for clock settings?

Some of those values are considered overclocking and according to the manual 
will reduce the lifespan of the part...

-- 
Denys

