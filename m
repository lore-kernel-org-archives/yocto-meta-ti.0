Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A74C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 16:17:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.12807.1745425068270157892
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 09:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7BD5740C37;
	Wed, 23 Apr 2025 16:17:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXGDk7yG9GmW; Wed, 23 Apr 2025 16:17:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 504E8406B5;
	Wed, 23 Apr 2025 16:17:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B047A166967; Wed, 23 Apr 2025 12:17:44 -0400 (EDT)
Date: Wed, 23 Apr 2025 12:17:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Anshul Dalal <anshuld@ti.com>
Cc: meta-ti@lists.yoctoproject.org, vigneshr@ti.com
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 3/3] bsp: u-boot: deploy
 tispl_falcon.bin to rootfs
Message-ID: <20250423161744.GE13634@denix.org>
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-3-anshuld@ti.com>
 <20250416001139.GS13634@denix.org>
 <D97Q6HRBD7JQ.1JP7679TFG6S5@ti.com>
 <20250416143338.GU13634@denix.org>
 <D98TI2BV15SM.2082RK3JAPB97@ti.com>
 <20250417183728.GY13634@denix.org>
 <D9C70TMTDU7I.PPZ1VFPEJF5Y@ti.com>
 <20250422195316.GZ13634@denix.org>
 <D9DV8GS74GWH.36519WE3YAUTX@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9DV8GS74GWH.36519WE3YAUTX@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Apr 2025 16:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18500

On Wed, Apr 23, 2025 at 01:42:53PM +0530, Anshul Dalal wrote:
> On Wed Apr 23, 2025 at 1:23 AM IST, Denys Dmytriyenko wrote:
> > On Mon, Apr 21, 2025 at 02:31:47PM +0530, Anshul Dalal wrote:
> >> On Fri Apr 18, 2025 at 12:07 AM IST, Denys Dmytriyenko wrote:
> >> > On Thu, Apr 17, 2025 at 03:18:03PM +0530, Anshul Dalal wrote:
> >> >> On Wed Apr 16, 2025 at 8:03 PM IST, Denys Dmytriyenko wrote:
> >> >> > On Wed, Apr 16, 2025 at 08:29:13AM +0530, Anshul Dalal wrote:
> >> >> >> On Wed Apr 16, 2025 at 5:41 AM IST, Denys Dmytriyenko wrote:
> >> >> >> > On Tue, Apr 15, 2025 at 03:06:44PM +0530, Anshul Dalal via lists.yoctoproject.org wrote:
> >> >> >> >> Falcon boot requires tispl_falcon.bin to be on the same filesystem
> >> >> >> >> partition as the fitImage.
> >> >> >> >> 
> >> >> >> >> This patch creates a new u-boot package called
> >> >> >> >> 'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
> >> >> >> >> ti-falcon is enabled which allows us to deploy the required files to
> >> >> >> >> rootfs.
> >> >> >> >> 
> >> >> >> >> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> >> >> >> >> ---
> >> >> >> >>  meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
> >> >> >> >>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 +++++++++++
> >> >> >> >>  2 files changed, 12 insertions(+)
> >> >> >> >> 
> >> >> >> >> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> >> >> >> >> index b571c04d..9f93c683 100644
> >> >> >> >> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> >> >> >> >> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> >> >> >> >> @@ -1,3 +1,4 @@
> >> >> >> >> +IMAGE_INSTALL:append = " u-boot-ti-staging-falcon"
> >> >> >> >
> >> >> >> > Why += cannot be used here?
> >> >> >> >
> >> >> >> >
> >> >> >> >>  KERNEL_CLASSES:remove = "kernel-fitimage"
> >> >> >> >>  KERNEL_CLASSES += "kernel-fitimage-legacyhs"
> >> >> >> >>  UBOOT_DTB_LOADADDRESS = "0x82000000"
> >> >> >> >> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >> >> >> >> index 41d4abdd..76803ae3 100644
> >> >> >> >> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >> >> >> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >> >> >> >> @@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
> >> >> >> >>  
> >> >> >> >>  FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
> >> >> >> >>  
> >> >> >> >> +FILES:${PN}-falcon = "boot/tispl_falcon.bin"
> >> >> >> >> +
> >> >> >> >>  SUMMARY = "u-boot bootloader for TI devices"
> >> >> >> >>  
> >> >> >> >>  LICENSE = "GPL-2.0-or-later"
> >> >> >> >> @@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
> >> >> >> >>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> >> >> >> >>  }
> >> >> >> >>  
> >> >> >> >> +do_install:append:ti-falcon() {
> >> >> >> >> +	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
> >> >> >> >> +}
> >> >> >> >> +
> >> >> >> >> +PACKAGES:prepend:am62xx-evm = "${PN}-falcon "
> >> >> >> >> +PACKAGES:prepend:am62axx-evm = "${PN}-falcon "
> >> >> >> >> +PACKAGES:prepend:am62pxx-evm = "${PN}-falcon "
> >> >> >> >> +PACKAGES:prepend:am62xx-lp-evm = "${PN}-falcon "
> >> >> >> >
> >> >> >> > Shouldn't these be specific to ti-falcon only?
> >> >> >> >
> >> >> >> >
> >> >> >> 
> >> >> >> These are the only supported platforms at the moment, depending on
> >> >> >> machine specific overrides allows us to throw an error at the recipe
> >> >> >> parsing stage instead of having to wait till the do_install task fails
> >> >> >> to copy the non-existent tispl_falcon.bin in case of unsupported
> >> >> >> platforms.
> >> >> >
> >> >> > What happens when you build for am62xx-evm and ti-falcon is not enabled?
> >> >> >
> >> >> 
> >> >> The ${PN}-falcon package is added to the list of packages but the
> >> >> do_package task is never run for u-boot since it's not in
> >> >> IMAGES_INSTALL.
> >> >
> >> > All our platforms have u-boot in EXTRA_IMAGEDEPENDS, which means u-boot gets 
> >> > built and packaged all the time. Moreover, it's common to "bitbake u-boot"
> >> >
> >> 
> >> Recipes in EXTRA_IMAGEDEPENDS don't provide any packages to rootfs[1],
> >> hence why u-boot has no `package` directory when ti-falcon is not set or
> >> even before this patch set.
> >> 
> >> Therefore having the falcon u-boot package in PACKAGES does not change
> >> the build time behaviour until it's added to IMAGES_INSTALL (which is
> >> only done when ti-falcon is set).
> >> 
> >> In my testing, there is no difference between the work directory for
> >> u-boot with ti-falcon unset vs the work directory before this patch
> >> set[2].
> >> 
> [snip]
> >
> > You should not rely on this behavior expecting that U-boot will be built, but 
> > not packaged!
> >
> > In scarthgap, this may be true:
> >
> > $ MACHINE=am62xx-evm bitbake tisdk-base-image -g
> > $ grep '\-> "u-boot-ti-staging.do_package' task-depends.dot
> > $
> >
> > But in walnascar/master, SPDX 3.x functionality for SW Bill of Materials is 
> > enabled by default and operates on packages, hence do_package() task will be 
> > called for U-boot:
> >
> 
> Well in that case, we can use nested overrides using ti-falcon as well
> as the machine specific config. Like below:
> 
> PACKAGES:prepend:ti-append:am62xx-evm = "${PN}-falcon "
> PACKAGES:prepend:ti-append:am62axx-evm = "${PN}-falcon "
> PACKAGES:prepend:ti-append:am62pxx-evm = "${PN}-falcon "
> PACKAGES:prepend:ti-append:am62xx-lp-evm = "${PN}-falcon "

First of all, there's a typo there in the overrides ^^^

Second, consider making it more obvious and deterministic by splitting 
overrides:

FALCON_PKG = ""
FALCON_PKG:ti-falcon = "${PN}-falcon"

PACKAGES:prepend:am62xx-evm = "${FALCON_PKG} "
...

