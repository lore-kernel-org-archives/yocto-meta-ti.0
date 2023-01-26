Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC6BC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 20:46:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.85814.1674766009907953584
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 12:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC6E840BEC;
	Thu, 26 Jan 2023 20:46:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLfFHLPB2KXh; Thu, 26 Jan 2023 20:46:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74B5B40301;
	Thu, 26 Jan 2023 20:46:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2E644163711; Thu, 26 Jan 2023 15:46:22 -0500 (EST)
Date: Thu, 26 Jan 2023 15:46:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Randolph Sapp <rs@ti.com>, denys@ti.com, reatmon@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-ti] [kirkstone PATCH 0/4] Graphics, graphics, and more
 graphics
Message-ID: <20230126204622.GC22689@denix.org>
References: <20230126030834.3889448-1-rs@ti.com>
 <20c385bc-b3ad-8e2f-064c-d7d932b8b88f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c385bc-b3ad-8e2f-064c-d7d932b8b88f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 20:46:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15683

On Thu, Jan 26, 2023 at 12:13:37PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 1/25/23 9:08 PM, Randolph Sapp wrote:
> >Alright, this is the 6th revision of this patch. This uses a revised
> 
> I've personally had series go to v15+ and v30+ is not unheard of upstream :)
> 
> The subject tag look wrong, recommend something like:
> 
> >git format-patch origin/kirkstone -o output -C --cover-letter --subject-prefix="meta-ti][master/kirkstone][PATCH v6"

1. You can drop "meta-ti" part in the subject as the mailing list will add it
2. I thought we wanted to go for kirkstone first to avoid duplicating upstream 
mesa, hence "kirkstone" is more correct, instead of "master/kirkstone"


> Andrew
> 
> >dependency chain (hopefully it's a little more logical) and some, well,
> >interesting switching logic using the PACKAGECONFIG and
> >virtual/gpudriver PREFERRED_PROVIDER override variable. I'm not sure how
> >I feel about it, but it solves the issue of silently configuring things
> >as needed without other layers manually enabling features.
> >
> >We basically dynamically adjust mesa's PACKAGECONFIG based on what our
> >selected gpudriver (and display controller, thanks sgx) is. We also add
> >a runtime recommendation on the gpudriver after this configuration.
> >
> >The gpudriver providers didn't change too much, they just have a runtime
> >recommendation for the associated um components. As it stands, the um
> >components can live alongside the software rendering components thanks
> >to the mesa-megadriver being able to automatically switch as necessary
> >at runtime, so we will not clobber mesa's usual packages.
> >
> >Then we drop all mentions of the gpu machine feature for good measure.
> >
> >"Why didn't you just add preferred providers for libgles2, etc, etc."
> >Well, software rendering. If we do that we'll have to edit the
> >PACKAGECONFIG to drop gles components from mesa, disabling software
> >rendering. We could add a dynamic switch to do that, but honestly
> >keeping in line with KISS, this solution has fewer lines and less logic
> >while keeping swrast as a nice fallback for whenever anything really
> >goes south... not that I'm expecting that or anything.
> >
> >Randolph Sapp (4):
> >   meta-ti-bsp: mesa: Add current patches
> >   meta-ti-bsp: graphics: Resolve dependency chain
> >   meta-ti-bsp: machine: Remove all gpu features
> >   meta-ti-bsp: machine: Attempt to update DC alias
> >
> >  meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |   2 -
> >  meta-ti-bsp/conf/machine/include/am62xx.inc   |   6 +-
> >  meta-ti-bsp/conf/machine/include/am65xx.inc   |   6 +-
> >  meta-ti-bsp/conf/machine/include/j721e.inc    |   6 -
> >  meta-ti-bsp/conf/machine/include/j721s2.inc   |   6 -
> >  meta-ti-bsp/conf/machine/include/j784s4.inc   |   6 -
> >  meta-ti-bsp/conf/machine/include/omap-a15.inc |   9 +-
> >  meta-ti-bsp/conf/machine/include/ti33x.inc    |   9 +-
> >  meta-ti-bsp/conf/machine/include/ti43x.inc    |   9 +-
> >  meta-ti-bsp/conf/machine/j784s4-evm.conf      |   2 +
> >  ...-OpenEmbedded-nodistro-internal-aarc.patch |  29 ----
> >  ...bb => ti-img-rogue-driver_1.18.6276027.bb} |  20 +--
> >  .../ti-sgx-ddk-km_1.17.4948957.bb             |   8 +-
> >  .../ti-img-rogue-umlibs_1.15.6133109.bb       |  71 --------
> >  .../ti-img-rogue-umlibs_1.18.6276027.bb       |  39 +++++
> >  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  31 +---
> >  ...nd-deprecate-drm_handle_format-and-d.patch | 158 ++++++++++++++++++
> >  ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ++++
> >  ...sdetects-64bit-atomics-on-mips-clang.patch |  25 +++
> >  ...k-for-all-linux-host_os-combinations.patch |  43 +++++
> >  ...ormat-Check-for-NEON-before-using-it.patch |  47 ++++++
> >  ...02-meson.build-make-TLS-ELF-optional.patch |  61 +++++++
> >  .../mesa/mesa-gl_22.0.%.bbappend              |   1 +
> >  .../mesa/mesa_22.0.%.bbappend                 |   2 +
> >  .../recipes-graphics/mesa/pvr-mesa.inc        |  39 +++++
> >  25 files changed, 484 insertions(+), 185 deletions(-)
> >  delete mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
> >  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15.6133109.bb => ti-img-rogue-driver_1.18.6276027.bb} (72%)
> >  delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >  create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

