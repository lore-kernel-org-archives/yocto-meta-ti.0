Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E8410AB829
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 21:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59240.1774558950893012014
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 14:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A8B740B13;
	Thu, 26 Mar 2026 21:02:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryXFUBKU-kuK; Thu, 26 Mar 2026 21:02:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B02A840A3D;
	Thu, 26 Mar 2026 21:02:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E126E17AD40; Thu, 26 Mar 2026 17:02:21 -0400 (EDT)
Date: Thu, 26 Mar 2026 17:02:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Moteen Shah <m-shah@ti.com>, meta-ti@lists.yoctoproject.org,
	praneeth@ti.com, vigneshr@ti.com, anshuld@ti.com,
	gehariprasath@ti.com, denys@konsulko.com
Subject: Re: [meta-ti] [PATCH] packagegroup-ti-core-initramfs: Remove
 runtime managers from initramfs image
Message-ID: <20260326210221.GA11121@denix.org>
References: <20260325062856.2664785-1-m-shah@ti.com>
 <6f06cab4-cafb-49b7-83d1-acb73d2aced8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f06cab4-cafb-49b7-83d1-acb73d2aced8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 21:02:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19829

On Wed, Mar 25, 2026 at 08:33:01AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 3/25/2026 1:28 AM, Moteen Shah wrote:
> >Remove runtime managers since ti-core-initramfs does not requires
> >login and other services as it is being used as a read only
> >image during the boot. Modules can be probed using the udev from
> >initrams-module-udev, hence remove the init manager along with
> >others.
> 
> I don't think this is going to pass muster.  We just added those in
> to make the initramfs function correctly with the rest of the system
> post boot.
> 
> What is the more in depth reason you want to remove them?  Are they
> causing you a problem?
> 
> I'll let Denys chime in more since he did the work to figure out
> what all we needed to add in to make it "correct".

It's not really whether it's correct or not. Using busybox instead of systemd 
is also correct, but...

Back when we were initially discussing adding initramfs last year, the topic 
of busybox vs. systemd as init manager came up - once PID 1 process starts by 
the kernel from initramfs, it doesn't change when pivot_root into the full 
rootfs. If PID 1 is busybox, later started systemd won't be PID 1 and that 
changes some of its behavior and causes complications, as I recall. It was 
requested to simplify things and use systemd as init manager in initramfs, 
even if the size would be larger than using only busybox.

That's how ti-core-initramfs was originally implemented. Then systemd got 
upgraded upstream in OE-Core and it had some packaging and dependency issues, 
which blew up initramfs size significantly. Ryan changed the way initramfs 
recipe is done, but that inadvertently removed systemd and other default 
VIRTUAL_RUNTIME components. Eventually systemd packaging got fixed in OE-Core 
and we were able to re-add systemd. Here's the corresponding discussion on the 
list - there were no comments or concerns:

https://lists.yoctoproject.org/g/meta-ti/topic/117180106#msg19431


> >Signed-off-by: Moteen Shah <m-shah@ti.com>
> >---
> >This patch will help in reducing the size of the initramfs to about 7 MB's compressed and 25 MB's uncompressed
> >Boot logs: https://gist.github.com/Jamm02/ebdb124064e253208ee479f46edf127f
> >  .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb    | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >index a9eff847..f496f21a 100644
> >--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >@@ -11,10 +11,6 @@ TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
> >  RDEPENDS:${PN} += "\
> >      ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
> >      ${VIRTUAL-RUNTIME_base-utils} \
> >-    ${VIRTUAL-RUNTIME_login_manager} \
> >-    ${VIRTUAL-RUNTIME_init_manager} \
> >-    ${VIRTUAL-RUNTIME_dev_manager} \
> >-    ${VIRTUAL-RUNTIME_update-alternatives} \
> >      netbase \
> >      base-files \
> >      base-passwd \

