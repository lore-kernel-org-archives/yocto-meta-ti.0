Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BF6CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:50:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14875.1761321040391929487
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B8E940CB2;
	Fri, 24 Oct 2025 15:50:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzldJmc6k8Bi; Fri, 24 Oct 2025 15:50:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5327F407DA;
	Fri, 24 Oct 2025 15:50:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A0BA716D9F5; Fri, 24 Oct 2025 11:50:36 -0400 (EDT)
Date: Fri, 24 Oct 2025 11:50:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH] packagegroup-ti-core-initramfs:
 ensure TI_INITRAMFS_KERNEL_MODULES is set
Message-ID: <20251024155036.GB3125@denix.org>
References: <20251023181013.25365-1-denis@denix.org>
 <97250325-0126-47b4-ab79-0fb42e627a58@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97250325-0126-47b4-ab79-0fb42e627a58@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19170

On Fri, Oct 24, 2025 at 10:34:27AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 10/23/2025 1:10 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >TI_INITRAMFS_KERNEL_MODULES gets set only for TI platfroms and ends up
> >being undefined otherwise, which breaks parsing in yocto-check-layer
> >and/or in multi-BSP setups. Ensure the variable is defined in the
> >packagegroup, if not already set by the machine configuration.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb      | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >index e9cf5e6b..6845f0c9 100644
> >--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> >@@ -2,6 +2,8 @@ SUMMARY = "Minimal initramfs for boot requirements"
> >  require recipes-core/packagegroups/packagegroup-core-boot.bb
> >+TI_INITRAMFS_KERNEL_MODULES ?= ""
> >+
> >  RDEPENDS:${PN} += "\
> >      ${TI_INITRAMFS_KERNEL_MODULES} \
> >      initramfs-framework-base \
> 
> I'm going to send an alternative patch.  We have the default
> assignment in ti-soc.inc, and my patch will remove that as well as
> it not needed there.  I'm going to blend your commit message and
> mine into a v2. Sending shortly.

Yeah, I thought about the same, but decided to leave it there, as it 
doesn't hurt.

