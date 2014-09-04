Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3498FE0076C; Thu,  4 Sep 2014 08:00:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 017DEE006EF
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 08:00:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84F0Nea030354;
	Thu, 4 Sep 2014 10:00:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84F0N4w004724;
	Thu, 4 Sep 2014 10:00:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:00:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84F0MIB016476;
	Thu, 4 Sep 2014 10:00:22 -0500
Date: Thu, 4 Sep 2014 11:00:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mikhail Zakharov <mikhail.zakharov@cognitivesystems.com>
Message-ID: <20140904150022.GD18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
MIME-Version: 1.0
In-Reply-To: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
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
X-List-Received-Date: Thu, 04 Sep 2014 15:00:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 02:50:03PM +0000, Mikhail Zakharov wrote:
> On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> 
> > One anomaly I've found is the CPU frequency range.  On debian we have:
> >
> >    debian@beaglebone:~$ cat 
> > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> >    300000 600000 800000 1000000
> >
> > while on OE we have:
> >
> >    root@beaglebone:~# cat 
> > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> >    300000 600000 720000 800000
> 
> Stock yocto-bsp is missing a few things that can be found in Robert
> Nelson's patchset for 3.14 linux kernel.
> 
> There are lots of other functionality that is missing from yocto-bsp 
> kernel for Beaglebone. I suggest you take at the following repos and
> scavenge for what you need :P

First of all, this is meta-ti mailing list for the corresponding BSP. That's 
what Peter was asking for, comparing to Robert's Debian and Yocto reference 
BSPs, not the other way around.

Second, Yocto reference BSP is that way for a reason - it's a reference BSP 
done with pure mainline kernel and u-boot components w/o any patching on top. 
That's its entire purpose. For anything else special, including performance 
tweaks, there are other BSPs available. If there is an issue with performance 
in meta-ti, we'll investigate it and try to match with Robert's BSP.

BTW, why would you base your own BSP on the Yocto reference one - isn't it too 
much work to patch it up to your liking?

-- 
Denys

