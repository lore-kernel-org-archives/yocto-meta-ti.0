Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DB9C02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 17:59:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3749.1738087172249283023
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 09:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 589F840CBA;
	Tue, 28 Jan 2025 17:59:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hr2XPKfmQnAq; Tue, 28 Jan 2025 17:59:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B52E40ACD;
	Tue, 28 Jan 2025 17:59:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 366B01641AB; Tue, 28 Jan 2025 12:59:24 -0500 (EST)
Date: Tue, 28 Jan 2025 12:59:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: matthias.schiffer@ew.tq-group.com
Cc: a-limaye@ti.com, meta-ti@lists.yoctoproject.org, reatmon@ti.com,
	b-padhi@ti.com, u-kumar1@ti.com, oss@ew.tq-group.com
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/2] conf: machine:
 omap-a15.inc: include ipu1 firmware in the boot partition
Message-ID: <20250128175924.GC21836@denix.org>
References: <20241209101330.1893700-1-a-limaye@ti.com>
 <20241209101330.1893700-3-a-limaye@ti.com>
 <db355fb8383904073d0b975cdb6df6353d675e4c.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db355fb8383904073d0b975cdb6df6353d675e4c.camel@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jan 2025 17:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18237

On Tue, Jan 28, 2025 at 02:11:18PM +0100, Matthias Schiffer via lists.yoctoproject.org wrote:
> On Mon, 2024-12-09 at 15:40 +0530, Aniket Limaye via lists.yoctoproject.org
> wrote:
> > 
> > Early Boot of remote processors is supported at the SPL stage of the
> > bootloader. Currently, SPL looks for the remoteproc firmwares in the
> > boot partition.
> > 
> > Therefore, add the rproc firmware to the boot partition of wic images.
> > 
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> 
> This patch introduces a dependency of meta-ti-bsp on meta-ti-extras, breaking
> builds of omap-a15 platforms without meta-ti-extras.

Ah, indeed. And the reason ti-ipc-rtos lives in meta-ti-extras is because 
those are some legacy recipes built from sources using old tools like XDC, 
SYS/BIOS and CGT... Those cannot be easily moved to meta-ti-bsp.

I'd say this change needs to be reverted and the inclusion of IPU FW pushed 
down to corresponding distro or product layers that use meta-ti-extras.


> Best regards,
> Matthias
> 
> 
> > ---
> >  meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> > index be086936..a258decd 100644
> > --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> > +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> > @@ -48,5 +48,6 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
> >  
> >  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
> >  WKS_FILE ?= "sdimage-2part.wks"
> > -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
> > +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
> >  do_image_wic[depends] += "virtual/bootloader:do_deploy"
> > +do_image_wic[depends] += "ti-ipc-rtos:do_deploy"

