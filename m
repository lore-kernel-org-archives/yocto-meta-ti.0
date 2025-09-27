Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3A2CAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 17:26:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16994.1758993954235814362
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 27 Sep 2025 10:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46CDD40C76;
	Sat, 27 Sep 2025 17:25:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aa0_J0f7YUft; Sat, 27 Sep 2025 17:25:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADA3440A2F;
	Sat, 27 Sep 2025 17:25:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E4F3163E3C; Sat, 27 Sep 2025 13:25:40 -0400 (EDT)
Date: Sat, 27 Sep 2025 13:25:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Moteen Shah <m-shah@ti.com>, meta-ti@lists.yoctoproject.org,
	vigneshr@ti.com, u-kumar1@ti.com, a-limaye@ti.com, n-francis@ti.com,
	praneeth@ti.com, jm@ti.com, b-padhi@ti.com, bb@ti.com,
	denys@konsulko.com, rs@ti.com
Subject: Re: [meta-ti] [master][PATCH 4/4 v2] meta-ti-bsp: conf: machine:
 include: Build initrd for all K3 platforms
Message-ID: <20250927172539.GW3125@denix.org>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-5-m-shah@ti.com>
 <81a30ddf-5067-447b-adf2-ade8d683a8df@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a30ddf-5067-447b-adf2-ade8d683a8df@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 27 Sep 2025 17:26:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19068

On Tue, Sep 23, 2025 at 04:15:26PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 9/19/2025 4:38 AM, Moteen Shah wrote:
> >Trigger build for initramfs image and package it in the boot partition
> >of all K3 platforms whenever an image recipe is built with upstream
> >kernel(mainline or mainline-next).
> >
> >Signed-off-by: Moteen Shah <m-shah@ti.com>
> >---
> >  meta-ti-bsp/conf/machine/include/k3.inc | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> 
> If this flow is meant to apply to ALL TI platforms, then these
> changes should be in ti-soc.inc and not k3.inc.  You are missing
> am335, am43, and am57 with this change.
> 
> 
> >index 50411a8e..c0c49e0d 100644
> >--- a/meta-ti-bsp/conf/machine/include/k3.inc
> >+++ b/meta-ti-bsp/conf/machine/include/k3.inc
> >@@ -33,6 +33,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-image ti-kernel-fitimage"
> >  TFA_PLATFORM = "k3"
> >+BUILD_INITRD_IMAGE = ""
> >+
> 
> Don't split the default assignment of this variable from the
> overrides. Moved it down below.
> 
> >  # Use the expected value of the ubifs filesystem's volume name in the kernel
> >  # and u-boot.
> >  UBI_VOLNAME = "rootfs"
> >@@ -43,7 +45,11 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
> >  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
> >-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
> >+BUILD_INITRD_IMAGE:bsp-mainline = "ti-initrd-image:do_image_complete"
> >+BUILD_INITRD_IMAGE:bsp-next = "ti-initrd-image:do_image_complete"
> >+do_image_complete[depends] += "${BUILD_INITRD_IMAGE}"
> 
> After speaking with Denys, he is suggesting to use
> EXTRA_IMAGEDEPENDS instead of the do_image_complete to make it be
> built.

I am now remembering that there was a caveat with such a use case - each entry 
in EXTRA_IMAGEDEPENDS gets its do_populate_sysroot() task called, which images 
don't have. Moreover, EXTRA_IMAGEDEPENDS adds those dependencies to all images 
and hence another image in that list will cause a circular dependency...


> BUILD_CORE_INITRAMFS_IMAGE ?= ""
> BUILD_CORE_INITRAMFS_IMAGE:bsp-mainline = "ti-core-initramfs"
> BUILD_CORE_INITRAMFS_IMAGE:bsp-next = "ti-core-initramfs"
> EXTRA_IMAGEDEPENDS += "${BUILD_CORE_INITRAMFS_IMAGE}"
> 
> Give that a try and see if it makes the initramfs be built correctly.
> 
> >+
> >+IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin initrd.cpio.xz"
> 
> Fix filename here too.  s/initrd/ti-core-initramfs/
> 
> >  IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
> >  EFI_PROVIDER ?= "grub-efi"

