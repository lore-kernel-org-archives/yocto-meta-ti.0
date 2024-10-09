Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD97CEDDA3
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 14:47:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.18627.1728485238967243142
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 07:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2684640C56;
	Wed,  9 Oct 2024 14:47:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCFuRXSYgpme; Wed,  9 Oct 2024 14:47:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EEAD740023;
	Wed,  9 Oct 2024 14:47:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 422BF1640B1; Wed,  9 Oct 2024 10:47:14 -0400 (EDT)
Date: Wed, 9 Oct 2024 10:47:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] ti-bsp: Add RT and
 systest support
Message-ID: <20241009144714.GM14676@denix.org>
References: <17FCCCED966E3629.19251@lists.yoctoproject.org>
 <05f64b4e-cd65-49a1-a221-bb0dbee09b06@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05f64b4e-cd65-49a1-a221-bb0dbee09b06@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Oct 2024 14:47:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18002

On Wed, Oct 09, 2024 at 08:51:30AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> I thought of this in the middle of the night and realized it was a
> simpler fix.  Rather than create the extra variable and have to set
> it in all of the BSPs, just add two new PREFERRED_VERSION settings
> with -rt and -system.  The effect is the same, and has the benefit
> of still erroring out if you try to build an RT version of mainline,
> next, or bb_org.

Yeah, this is much cleaner! Looks good.


> On 10/9/2024 8:47 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >We were missing controlling the versions for linux-ti-staging-rt and
> >linux-ti-staging-systest using the BSP framework.  Since the
> >PREFERRED_VERSION is not tied to the virtual/kernel we need two
> >additional settings for those alternate kernel package names.
> >
> >For BSPs that do not have the -rt and -systest recipes then the two
> >new variable settings should effectively be ignored and cause no issues.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> >v3: Typo in commit message.
> >v2: Remove the extra variables and just set PREFERRED_VERSION.
> >
> >  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >index 4cb2aab4..0c8f657d 100644
> >--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >@@ -122,6 +122,8 @@ BSP_MESA_PVR_VERSION ?= ""
> >  # ==========
> >  PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
> >  PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
> >+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-rt ?= "${BSP_KERNEL_VERSION}"
> >+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-systest ?= "${BSP_KERNEL_VERSION}"
> >  PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
> >  PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
> >  PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"

