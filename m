Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F48C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 23:02:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.89414.1674774156640394103
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 15:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCB2040BEC;
	Thu, 26 Jan 2023 23:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWi8QQpfr5oz; Thu, 26 Jan 2023 23:02:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8107140027;
	Thu, 26 Jan 2023 23:02:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1F471163714; Thu, 26 Jan 2023 18:02:09 -0500 (EST)
Date: Thu, 26 Jan 2023 18:02:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Sapp, Randolph" <rs@ti.com>
Cc: afd@ti.com, denys@ti.com, reatmon@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone PATCH 1/4] meta-ti-bsp:
 mesa: Add current patches
Message-ID: <20230126230209.GF22689@denix.org>
References: <20230126030834.3889448-1-rs@ti.com>
 <20230126030834.3889448-2-rs@ti.com>
 <f3ec2279-5ce9-af82-82ac-8d7170e3dbe9@ti.com>
 <20230126204804.GD22689@denix.org>
 <WU64PR.Z83RZ7R0JR5O1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <WU64PR.Z83RZ7R0JR5O1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 23:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15689

On Thu, Jan 26, 2023 at 04:37:44PM -0600, Sapp, Randolph wrote:
> On Thu, Jan 26 2023 at 03:48:04 PM -0500, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >On Thu, Jan 26, 2023 at 11:06:17AM -0600, Andrew Davis via
> >lists.yoctoproject.org wrote:
> >> On 1/25/23 9:08 PM, Randolph Sapp wrote:
> >> >Copy over current patches from oe-core for mesa since we're
> >>going to be
> >> >overriding the SRC_URI string and we still need those.
> >> >
> >>
> >> We control the repo we will be pointing at, I'd say just add these
> >> patches over there directly so this commit would be not needed.
> >
> >No, these are upstream mesa patches, not the one needed for pvr.
> >
> >Hence, you don't need to carry them locally, since you don't copy
> >the entire
> >upstream mesa recipe.
> 
> Ah, but we do need to carry them since we clobber the mesa SRC_URI
> to load our new source. Now, yes, these should probably be carried
> in our mesa branch instead of in meta-ti. I'll adjust that.

No, not really.

In mesa*.bbappend you include the pvr-meda.inc, which has this SRC_URI:

+SRC_URI = "git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH} \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
+           "

So, specifically:

1. No, you don't need to carry patches locally when they are already alongside 
the original .bb recipe, when you are doing a .bbappend

2. You don't need to merge them to your own tree, as long as you specify them 
in the SRC_URI list, when using a .bbappend

-- 
Denys

