Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F3F1E01645
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:35:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QFZQBt030014
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 10:35:26 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QFZQSM025128
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 10:35:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 10:35:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QFZPkR022750;
	Thu, 26 Sep 2013 10:35:25 -0500
Date: Thu, 26 Sep 2013 11:35:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20130926153525.GR14528@edge>
References: <1380138591-17071-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101597510CF@DLEE11.ent.ti.com>
	<52444CFB.2000807@ti.com>
MIME-Version: 1.0
In-Reply-To: <52444CFB.2000807@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Rini,
	Tom" <trini@ti.com>
Subject: Re: [PATCHv2 4/4] ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Thu, 26 Sep 2013 15:35:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 26, 2013 at 08:34:27PM +0530, Siddharth Heroor wrote:
> On 9/26/2013 5:29 PM, Maupin, Chase wrote:
> > Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> Just a question - is it possible to override the KERNEL_IMAGETYPE in a
> branding.inc file? In general, we want to move to zImage for GLSDK but
> some customers who might want to stay on uImage as they ramp.

It won't be very easy to do from a branding file. That's why I had to rev 
the other patch to keep GLSDK 3.8 and AMSDK 3.2 kernel recipes on uImage, but 
switch other platforms to zImage which already have recent enough u-boot...

When you have a new kernel/u-boot that prefers zImage (like the new 
linux-ti-staging_git.bb we have for 3.12 integration), you can set the image 
type to zImage in the kernel recipe, or rather not specify it at all, since 
it will be picked up from machine config.

In other words, after the setting in the machine config, you have one more 
option to override it in a specific kernel recipe. That way if your branding 
selects latest kernel/u-boot combo, you get zImage by default from the machine 
config. But if branding selects 3.2 kernel with early u-boot, it gets 
overwritten back to uImage...

-- 
Denys


> Otherwise, no comments.
> 
> Acked-by: Siddharth Heroor <heroor@ti.com>
> 
> > 
> > 
> >> -----Original Message-----
> >> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >> Sent: Wednesday, September 25, 2013 2:50 PM
> >> To: meta-ti@yoctoproject.org
> >> Cc: Rini, Tom
> >> Subject: [meta-ti] [PATCHv2 4/4] ti43x, omap-a15: switch
> >> KERNEL_IMAGETYPE to zImage by default
> >>
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> * To be used with latest u-boot, that prefers zImage over uImage
> >> * ti33x will follow as soon as u-boot changes its default for that
> >> platform
> >>
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> Cc: Tom Rini <trini@ti.com>
> >> ---
> >> v2 - don't change the default for ti33x yet, wait for u-boot
> >>
> >> conf/machine/include/omap-a15.inc | 2 +-
> >> conf/machine/include/ti43x.inc    | 2 +-
> >> 2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/conf/machine/include/omap-a15.inc
> >> b/conf/machine/include/omap-a15.inc
> >> index 623f2df..aba122a 100644
> >> --- a/conf/machine/include/omap-a15.inc
> >> +++ b/conf/machine/include/omap-a15.inc
> >> @@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-
> >> staging"
> >> PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> >> PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> >>
> >> -KERNEL_IMAGETYPE = "uImage"
> >> +KERNEL_IMAGETYPE = "zImage"
> >>
> >> UBOOT_ARCH = "arm"
> >> UBOOT_ENTRYPOINT = "0x80008000"
> >> diff --git a/conf/machine/include/ti43x.inc
> >> b/conf/machine/include/ti43x.inc
> >> index 62da105..adb66e3 100644
> >> --- a/conf/machine/include/ti43x.inc
> >> +++ b/conf/machine/include/ti43x.inc
> >> @@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-
> >> staging"
> >> PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> >> PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> >>
> >> -KERNEL_IMAGETYPE = "uImage"
> >> +KERNEL_IMAGETYPE = "zImage"
> >>
> >> UBOOT_ARCH = "arm"
> >> UBOOT_MACHINE = "am43xx_evm_config"
> >> --
> >> 1.8.3.2
> >>
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> > 
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

