Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96792C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 15:17:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.118802.1738682255388824006
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 07:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6760540C88;
	Tue,  4 Feb 2025 15:17:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_SfKALWWPoO; Tue,  4 Feb 2025 15:17:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 10AED407DA;
	Tue,  4 Feb 2025 15:17:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 68F511641FB; Tue,  4 Feb 2025 10:17:26 -0500 (EST)
Date: Tue, 4 Feb 2025 10:17:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: Andrew Davis <afd@ti.com>, a-limaye@ti.com,
	meta-ti@lists.yoctoproject.org, reatmon@ti.com, u-kumar1@ti.com,
	r-ravikumar@ti.com, s-sinha@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am69: Update
 filenames for initial bootloader tiboot3
Message-ID: <20250204151726.GE21608@denix.org>
References: <20250203132307.2862016-1-a-limaye@ti.com>
 <e94e89f3-7c02-4320-8429-367ad68b6bd6@ti.com>
 <20250204045016.2xtjwyagzgqovyuu@uda0497581>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204045016.2xtjwyagzgqovyuu@uda0497581>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 15:17:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18259

On Tue, Feb 04, 2025 at 10:20:16AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> Hi Andrew,
> 
> On 15:44-20250203, Andrew Davis wrote:
> > On 2/3/25 7:18 AM, Aniket Limaye via lists.yoctoproject.org wrote:
> > > Update the filenames for tiboot3.bin variants built by the u-boot recipe
> > > and also the files expected by the wic image.
> > > 
> > > So far am69-sk and j784s4-evm have shared the same binman include file
> > > and hence the same filenames for u-boot images. However, with the
> > > configs and the devicetree being different, the same built binary does
> > > not support both boards. Hence the filenames of images built for am69-sk
> > > should reflect support for the same. The corresponding
> > 
> > This is not correct. The SK and EVM use different defconfigs, there is
> > no issue with two different builds producing output with the same filename.
> > All builds produce a u-boot.img for example, no issue here.
> > 
> 
> I would argue that u-boot.img doesn't contain the name based on
> defconfigs, tiboot3 however contains the name of the binary generated so
> it's just confusing and nothing else. tiboot3.bin would anyways be a
> symlink to the correct one but the other binary names should be based on
> defconfig IMO. Have replied upstream to your comment as well.

From OE perspective:

u-boot.img is just a short symlink. There's also u-boot-${MACHINE}.img 
symlink and they both point to u-boot-${MACHINE}-${PV}.img full name.

That is the case when a single defconfig is used specified by UBOOT_MACHINE.

When multiple defconfigs get built, listed by UBOOT_CONFIG, then each of the 
UBOOT_CONFIG names also get appended to the corresponding full name. This is 
very OE-specific - AFAIK U-boot doesn't support building multiple defconfigs 
for the same platform...

There are multiple tiboot3.bin being produced, hence extra processing was 
added to name them accordingly. All these early boot artifacts go into the 
FAT boot partition, which doesn't support symlinks. If you do want short and 
long names to be on the SD card, you have to have multiple copies of the same 
file. And tiboot3.bin is quite small, so having both short and long names 
simplifies selecting the correct variant with little overhead...

-- 
Denys


> Regards
> Manorit
> 
> > I've root caused the real issue, looks like a simple mistake in naming
> > was made in the patch taken in our  U-Boot evil vendor tree. The same
> > patch was posted upstream also, which I've commented[0] on. So the
> > correct name will go in upstream, and a fix backported to our tree.
> > 
> > That means this patch will not be needed.
> > 
> > Andrew
> > 
> > [0] https://lore.kernel.org/u-boot/e815500f-e4a0-4deb-ae33-f98ca7021503@ti.com/
> > 
> > > 
> > > This change is currently only applicable to ti-u-boot-2025.01, and hence
> > > it is restricted to the override bsp-ti-6_12.
> > > 
> > > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > > ---
> > > This patch needs to be merged in sync with the corresponding patch for
> > > ti-u-boot-2025.01.
> > > 
> > > The u-boot patch has also been posted to upstream u-boot and when merged
> > > there, the next/upstream BSP packages will also need this change.
> > > https://lore.kernel.org/u-boot/20250106-b4-upstream-j742s2-v2-2-42d6129ce333@ti.com/
> > > ---
> > >   meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 2 ++
> > >   meta-ti-bsp/conf/machine/include/am69.inc  | 7 ++++---
> > >   2 files changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> > > index 9d2b4cd6..376d8153 100644
> > > --- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> > > +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> > > @@ -5,7 +5,9 @@
> > >   require conf/machine/include/k3r5.inc
> > >   SYSFW_SOC = "j784s4"
> > > +SYSFW_SOC:bsp-ti-6_12 = "am69"
> > >   SYSFW_CONFIG = "evm"
> > > +SYSFW_CONFIG:bsp-ti-6_12 = "sk"
> > >   SYSFW_SUFFIX = "hs-fs"
> > >   UBOOT_MACHINE = "am69_sk_r5_defconfig"
> > > diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
> > > index da8a5a8b..e82d58e2 100644
> > > --- a/meta-ti-bsp/conf/machine/include/am69.inc
> > > +++ b/meta-ti-bsp/conf/machine/include/am69.inc
> > > @@ -9,10 +9,11 @@ require conf/machine/include/mesa-pvr.inc
> > >   PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
> > >   # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
> > > -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
> > > +# Add tiboot3.bin for all SOC types, to the wic image.
> > > +BSP_BOOTLOADER_FILES = "tiboot3-j784s4-hs-fs-evm.bin tiboot3-j784s4-hs-evm.bin"
> > > +BSP_BOOTLOADER_FILES:bsp-ti-6_12 = "tiboot3-am69-hs-fs-sk.bin tiboot3-am69-hs-sk.bin"
> > > -# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
> > > -IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
> > > +IMAGE_BOOT_FILES += "${BSP_BOOTLOADER_FILES}"
> > >   TFA_BOARD = "j784s4"
> > > 
> > > 
> > > 
> > > 
> > > 

