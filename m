Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B19EC369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 01:53:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3237.1745373220481914049
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 18:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 77B4B40C37;
	Wed, 23 Apr 2025 01:53:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NdXqkDH-Apf; Wed, 23 Apr 2025 01:53:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EAEC40A30;
	Wed, 23 Apr 2025 01:53:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B3DC01668EA; Tue, 22 Apr 2025 21:53:32 -0400 (EDT)
Date: Tue, 22 Apr 2025 21:53:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-padhi@ti.com
Cc: a-limaye@ti.com, meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>,
	"Kumar, Udit" <u-kumar1@ti.com>, "CHAVDA, ANKIT" <a-chavda@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH] omap-a15.inc: don't
 include ipu1 firmware in the boot partition
Message-ID: <20250423015332.GD13634@denix.org>
References: <20250315020224.3100249-1-denis@denix.org>
 <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
 <20250318161810.GJ23729@denix.org>
 <00bc7e5d-070d-4883-855a-6359219296db@ti.com>
 <18355F7853CF1E08.27206@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18355F7853CF1E08.27206@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Apr 2025 01:53:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18495

On Fri, Apr 11, 2025 at 05:03:12PM -0400, Denys Dmytriyenko wrote:
> Circling back to this...
> 
> On Thu, Mar 20, 2025 at 02:29:14PM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
> > 
> > On 18/03/25 21:48, Denys Dmytriyenko wrote:
> > >On Sat, Mar 15, 2025 at 10:29:18AM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
> > >>On 3/15/2025 7:32 AM, Denys Dmytriyenko wrote:
> > >>>From: Denys Dmytriyenko <denys@konsulko.com>
> > >>>
> > >>>This reverts commit c58af0b172660ef1248a3454af06251d872770b1.
> > >>>
> > >>>This adds an undesired dependency on meta-ti-extras - more details:
> > >>>https://lists.yoctoproject.org/g/meta-ti/topic/110003435
> > >>>
> > >>>Cc: Aniket Limaye <a-limaye@ti.com>
> > >>>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com
> > >>>---
> > >>The fw binary is actually a requirement for AM57x boards to boot
> > >>now. U-Boot expects
> > >>the firmware to be present in the boot partition, and fails if not found.
> > >>(Beleswar can correct me if I'm mistaken).
> > >Huh, interesting - do you know the version where this started?
> > 
> > The firmware is required for Early boot of remote processors (IPU in
> > this case) by U-Boot. Without the firmware, there won't be a system
> > boot failure, only rproc boot will fail.
> > 
> > 
> > >If it is indeed a hard requirement to boot the platform now, another option
> > >is to get a prebuilt binary into ti-linux-firmware and pull it from there,
> > >instead of building it from sources using legacy tools...
> > 
> > This is great too. However, meta-ti should still have the deploy
> > rule to pick the pre-built firmware and put it into the boot
> > partition.
> > 
> > Thanks,
> > Beleswar
> 
> Thanks, Beleswar.
> 
> Ryan, All,
> 
> How should this be fixed?

Ping.

Since nobody's working on adding a prebuilt binary to ti-linux-firmware, 
then this should be reverted as is for now, IMHO.


> > >>If we don't want to break this board, we need to maybe migrate the
> > >>ti-ipc-rtos recipe from
> > >>meta-ti-extras to meta-ti-bsp, since it is anyway a requirement for
> > >>AM57X u-boot recipe.
> > >>Denys, I also see that you mentioned that the ti-ipc-rtos recipe
> > >>currently resides in extras
> > >>due to the legacy recipes built from sources using old tools like
> > >>XDC, SYS/BIOS and CGT...
> > >>which cannot be easily moved to meta-ti-bsp.
> > >>
> > >>A temporary fix might be to somehow add these inside of
> > >>meta-ti-extras/conf/layer.conf?
> > >>
> > >>However, I Ack the revert in case it is needed for now:
> > >>
> > >>Acked-by: Aniket Limaye <a-limaye@ti.com>
> > >>
> > >>
> > >>>  meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +--
> > >>>  1 file changed, 1 insertion(+), 2 deletions(-)
> > >>>
> > >>>diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> > >>>index a258decd..be086936 100644
> > >>>--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> > >>>+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> > >>>@@ -48,6 +48,5 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
> > >>>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
> > >>>  WKS_FILE ?= "sdimage-2part.wks"
> > >>>-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
> > >>>+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
> > >>>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
> > >>>-do_image_wic[depends] += "ti-ipc-rtos:do_deploy"

