Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7ABF6E008F1; Thu, 28 Jan 2016 08:14:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30C9CE00803
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:14:17 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SGE7gp003260;
	Thu, 28 Jan 2016 10:14:07 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SGE7Uh020316;
	Thu, 28 Jan 2016 10:14:07 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 10:14:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SGE6An021520;
	Thu, 28 Jan 2016 10:14:06 -0600
Date: Thu, 28 Jan 2016 11:13:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Troy Benjegerdes <hozer@hozed.org>
Message-ID: <20160128161351.GD11314@edge>
References: <20160119190808.GE4223@edge> <20160121015830.GA4311@nl.grid.coop>
	<20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
	<20160121220740.GF11314@edge> <20160127215645.GD2584@nl.grid.coop>
	<20160127220316.GZ11314@edge> <20160127221203.GE2584@nl.grid.coop>
	<20160127225529.GC11314@edge> <20160128045255.GF2584@nl.grid.coop>
MIME-Version: 1.0
In-Reply-To: <20160128045255.GF2584@nl.grid.coop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: regression tests for am3517-evm machine?
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
X-List-Received-Date: Thu, 28 Jan 2016 16:14:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 27, 2016 at 10:52:55PM -0600, Troy Benjegerdes wrote:
> On Wed, Jan 27, 2016 at 05:55:29PM -0500, Denys Dmytriyenko wrote:
> > On Wed, Jan 27, 2016 at 04:12:03PM -0600, Troy Benjegerdes wrote:
> > > > > So the first problem seems to be that the 'u-boot' target produces
> > > > > a build from the 2014.07 version, which does not seem to have any
> > > > > environment or other setup to load a device tree.
> > > > > 
> > > > > Is there some patch floating around somewhere that updates the
> > > > > default u-boot environment to work better with new kernels, or do
> > > > > I need try and merge something in from the beaglebone
> > > > 
> > > > Can you try u-boot-ti-staging instead?
> > > 
> > > This is from 'pokey' ( yocto-2.0-121-g2fb7ee2 ),
> > > with meta-ti: ( v2012.05-yocto1.2-938-gd397744 )
> > 
> > Strange mix of branches - 2012 was almost 4 years ago... :)
> > 
> > I'd recommend using "fido" branch in all layers, as most tested at the moment. 
> > Still no guarantees about am3517, as that platform hasn't been officially 
> > tested for quite some time.
> 
> Ah, I was on master for meta-ti.
> 
> FYI, I needed the following hack to build on yocto-2.0:

It was fixed in master long ago:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/recipes-graphics/drm/libdrm.inc?id=2d2633227f541395276316a4b45bafa41be94003


> ~/src/poky/meta-ti/recipes-graphics/drm
>  % git diff
> diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
> index 86a660e..6e08b98 100644
> --- a/recipes-graphics/drm/libdrm_2.4.41.bb
> +++ b/recipes-graphics/drm/libdrm_2.4.41.bb
> @@ -1,8 +1,9 @@
> -require recipes-graphics/drm/libdrm.inc
> +#require recipes-graphics/drm/libdrm.inc
>  
>  FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
> +LICENSE = 'GPL'
> 
> 
> After a little more digging around, I find that having:
> #define CONFIG_OF_LIBFDT
> is required for u-boot to be able to recognize and load a device
> tree, but it does not seem to be set in the am3517 build(s). 
> 
> If I build a u-boot from source with CONFIG_OF_LIBFDT, I get the
> expected output, but now if boot a mainline 3.16 or 3.18 kernel
> (which mostly work with no device tree), these kernels fail to
> boot with a device tree.

