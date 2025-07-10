Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CA4C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 15:06:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11177.1752159973858168416
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jul 2025 08:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C734240C81;
	Thu, 10 Jul 2025 15:06:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2F5QBDPoGJSO; Thu, 10 Jul 2025 15:06:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C7B440A2F;
	Thu, 10 Jul 2025 15:06:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 73ED816B96B; Thu, 10 Jul 2025 11:06:05 -0400 (EDT)
Date: Thu, 10 Jul 2025 11:06:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Beleswar Padhi <b-padhi@ti.com>, denys@konsulko.com, a-limaye@ti.com,
	afd@ti.com, u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH] meta-ti-bsp:
 linux-ti-staging-rt_6.12.bb: Add AM57xx RT branch
Message-ID: <20250710150605.GV18383@denix.org>
References: <20250710093957.3740966-1-b-padhi@ti.com>
 <997eff48-8faf-4da4-ac90-29b49a5589e8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997eff48-8faf-4da4-ac90-29b49a5589e8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Jul 2025 15:06:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18771

On Thu, Jul 10, 2025 at 09:32:51AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 7/10/2025 4:39 AM, Beleswar Padhi wrote:
> >While all other devices use the same branch for RT and non-RT builds,
> >the AM57xx ARM32 devices have a separate branch for RT Kernel which is
> >"ti-rt-linux-6.12.y-arm32". Update the BRANCH and SRCREV for am57xx
> >device family for RT builds.
> >
> >Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> >---
> >  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
> >index 9e5c4ee4..e78f046d 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
> >@@ -6,4 +6,7 @@ KERNEL_LOCALVERSION:append = "-rt"
> >  # This will have priority over generic non-rt path
> >  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
> >+BRANCH:am57xx = "ti-rt-linux-6.12.y-arm32"
> >+SRCREV:am57xx = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
> 
> NAK.
> 
> This is applies to all 32bit platforms, not just am57xx.  So the
> mechanism needs to be done in a way to support that.
> 
> BRANCH_32BIT = "ti-rt-linux-6.12.y-arm32"
> SRCREV_32BIT = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
> 
> BRANCH:ti33x = "${BRANCH_32BIT}"
> BRANCH:ti43x = "${BRANCH_32BIT}"
> BRANCH:am57xx = "${BRANCH_32BIT}"
> 
> SRCREV:ti33x = "${SRCREV_32BIT}"
> SRCREV:ti43x = "${SRCREV_32BIT}"
> SRCREV:am57xx = "${SRCREV_32BIT}"

What about dra7xx? Why not simply use armv7a override?

Also, not sure about RT on omapl128, but that's armv5.


> Also, update the commit message to not be am57 specific.
> 
> And in the subject, we don't need the meta-ti-bsp or the .bb:
> 
> [master/scarthgap][PATCH] linux-ti-staging-rt_6.12: Add 32bit RT branch
> 
> Keep the subject shorter when possible
> 
> >  include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}

