Return-Path: <hozer@grid.coop>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7B8AE00928; Wed, 27 Jan 2016 20:53:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from nl.grid.coop (nl.grid.coop [50.7.166.116])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42AC5E008EE
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 20:52:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (uid 1000)
	by nl.grid.coop with local; Wed, 27 Jan 2016 22:52:55 -0600
	id 00000000000613F9.0000000056A99EA7.000053E7
Date: Wed, 27 Jan 2016 22:52:55 -0600
From: Troy Benjegerdes <hozer@hozed.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160128045255.GF2584@nl.grid.coop>
References: <20160118200507.GE10881@nl.grid.coop> <20160119190808.GE4223@edge>
	<20160121015830.GA4311@nl.grid.coop> <20160121204813.GD11314@edge>
	<CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
	<20160121220740.GF11314@edge> <20160127215645.GD2584@nl.grid.coop>
	<20160127220316.GZ11314@edge> <20160127221203.GE2584@nl.grid.coop>
	<20160127225529.GC11314@edge>
Mime-Version: 1.0
In-Reply-To: <20160127225529.GC11314@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 28 Jan 2016 04:53:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jan 27, 2016 at 05:55:29PM -0500, Denys Dmytriyenko wrote:
> On Wed, Jan 27, 2016 at 04:12:03PM -0600, Troy Benjegerdes wrote:
> > > > So the first problem seems to be that the 'u-boot' target produces
> > > > a build from the 2014.07 version, which does not seem to have any
> > > > environment or other setup to load a device tree.
> > > > 
> > > > Is there some patch floating around somewhere that updates the
> > > > default u-boot environment to work better with new kernels, or do
> > > > I need try and merge something in from the beaglebone
> > > 
> > > Can you try u-boot-ti-staging instead?
> > 
> > This is from 'pokey' ( yocto-2.0-121-g2fb7ee2 ),
> > with meta-ti: ( v2012.05-yocto1.2-938-gd397744 )
> 
> Strange mix of branches - 2012 was almost 4 years ago... :)
> 
> I'd recommend using "fido" branch in all layers, as most tested at the moment. 
> Still no guarantees about am3517, as that platform hasn't been officially 
> tested for quite some time.

Ah, I was on master for meta-ti.

FYI, I needed the following hack to build on yocto-2.0:

~/src/poky/meta-ti/recipes-graphics/drm
 % git diff
diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
index 86a660e..6e08b98 100644
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -1,8 +1,9 @@
-require recipes-graphics/drm/libdrm.inc
+#require recipes-graphics/drm/libdrm.inc
 
 FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+LICENSE = 'GPL'


After a little more digging around, I find that having:
#define CONFIG_OF_LIBFDT
is required for u-boot to be able to recognize and load a device
tree, but it does not seem to be set in the am3517 build(s). 

If I build a u-boot from source with CONFIG_OF_LIBFDT, I get the
expected output, but now if boot a mainline 3.16 or 3.18 kernel
(which mostly work with no device tree), these kernels fail to
boot with a device tree.

