Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274A6C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:37:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16306.1744915052193525497
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 11:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 300DA40C2C;
	Thu, 17 Apr 2025 18:37:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVu7wN6ZHwlP; Thu, 17 Apr 2025 18:37:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F396340B13;
	Thu, 17 Apr 2025 18:37:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A9CA8166512; Thu, 17 Apr 2025 14:37:28 -0400 (EDT)
Date: Thu, 17 Apr 2025 14:37:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Anshul Dalal <anshuld@ti.com>
Cc: meta-ti@lists.yoctoproject.org, vigneshr@ti.com
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 3/3] bsp: u-boot: deploy
 tispl_falcon.bin to rootfs
Message-ID: <20250417183728.GY13634@denix.org>
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-3-anshuld@ti.com>
 <20250416001139.GS13634@denix.org>
 <D97Q6HRBD7JQ.1JP7679TFG6S5@ti.com>
 <20250416143338.GU13634@denix.org>
 <D98TI2BV15SM.2082RK3JAPB97@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D98TI2BV15SM.2082RK3JAPB97@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 18:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18486

On Thu, Apr 17, 2025 at 03:18:03PM +0530, Anshul Dalal wrote:
> On Wed Apr 16, 2025 at 8:03 PM IST, Denys Dmytriyenko wrote:
> > On Wed, Apr 16, 2025 at 08:29:13AM +0530, Anshul Dalal wrote:
> >> On Wed Apr 16, 2025 at 5:41 AM IST, Denys Dmytriyenko wrote:
> >> > On Tue, Apr 15, 2025 at 03:06:44PM +0530, Anshul Dalal via lists.yoctoproject.org wrote:
> >> >> Falcon boot requires tispl_falcon.bin to be on the same filesystem
> >> >> partition as the fitImage.
> >> >> 
> >> >> This patch creates a new u-boot package called
> >> >> 'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
> >> >> ti-falcon is enabled which allows us to deploy the required files to
> >> >> rootfs.
> >> >> 
> >> >> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> >> >> ---
> >> >>  meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
> >> >>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 +++++++++++
> >> >>  2 files changed, 12 insertions(+)
> >> >> 
> >> >> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> >> >> index b571c04d..9f93c683 100644
> >> >> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> >> >> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
> >> >> @@ -1,3 +1,4 @@
> >> >> +IMAGE_INSTALL:append = " u-boot-ti-staging-falcon"
> >> >
> >> > Why += cannot be used here?
> >> >
> >> >
> >> >>  KERNEL_CLASSES:remove = "kernel-fitimage"
> >> >>  KERNEL_CLASSES += "kernel-fitimage-legacyhs"
> >> >>  UBOOT_DTB_LOADADDRESS = "0x82000000"
> >> >> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >> >> index 41d4abdd..76803ae3 100644
> >> >> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> >> >> @@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
> >> >>  
> >> >>  FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
> >> >>  
> >> >> +FILES:${PN}-falcon = "boot/tispl_falcon.bin"
> >> >> +
> >> >>  SUMMARY = "u-boot bootloader for TI devices"
> >> >>  
> >> >>  LICENSE = "GPL-2.0-or-later"
> >> >> @@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
> >> >>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> >> >>  }
> >> >>  
> >> >> +do_install:append:ti-falcon() {
> >> >> +	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
> >> >> +}
> >> >> +
> >> >> +PACKAGES:prepend:am62xx-evm = "${PN}-falcon "
> >> >> +PACKAGES:prepend:am62axx-evm = "${PN}-falcon "
> >> >> +PACKAGES:prepend:am62pxx-evm = "${PN}-falcon "
> >> >> +PACKAGES:prepend:am62xx-lp-evm = "${PN}-falcon "
> >> >
> >> > Shouldn't these be specific to ti-falcon only?
> >> >
> >> >
> >> 
> >> These are the only supported platforms at the moment, depending on
> >> machine specific overrides allows us to throw an error at the recipe
> >> parsing stage instead of having to wait till the do_install task fails
> >> to copy the non-existent tispl_falcon.bin in case of unsupported
> >> platforms.
> >
> > What happens when you build for am62xx-evm and ti-falcon is not enabled?
> >
> 
> The ${PN}-falcon package is added to the list of packages but the
> do_package task is never run for u-boot since it's not in
> IMAGES_INSTALL.

All our platforms have u-boot in EXTRA_IMAGEDEPENDS, which means u-boot gets 
built and packaged all the time. Moreover, it's common to "bitbake u-boot"


> So, the net effect is no change to the u-boot's working directory during
> the build process. It's only with ti-falcon that the respective
> packages-split directory is created with u-boot-ti-staging-falcon
> sub-directory.
> 
> >
> >> As support for more platforms is added, the list can be expanded until
> >> all platforms are supported when we can just have a ti-falcon override.

