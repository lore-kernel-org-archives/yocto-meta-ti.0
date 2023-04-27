Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1A8C77B7C
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:51:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5412.1682632285742861216
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 983D540C76;
	Thu, 27 Apr 2023 21:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3V6Hfm2n5Le; Thu, 27 Apr 2023 21:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F268400CF;
	Thu, 27 Apr 2023 21:51:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 60BEF16387B; Thu, 27 Apr 2023 17:50:39 -0400 (EDT)
Date: Thu, 27 Apr 2023 17:50:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: afd@ti.com, detheridge@ti.com, reatmon@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][kirkstone][PATCHv2 0/4] Enable vulkan proper
Message-ID: <20230427215039.GQ9226@denix.org>
References: <20230427210746.1915362-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427210746.1915362-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:51:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16450

On Thu, Apr 27, 2023 at 04:07:42PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Properly enable Vulkan with all WSI extensions enabled. Attempt some
> light packaging changes to the graphics umlibs recipe so we can decrease
> the number of check we have to skip, and the checks become a little more
> targeted.
> 
> This version uses a cairo append that conditionally tweaks PACKAGECONFIG
> flags based on the GPU driver that is selected. We're using this driver
> flag instead of a machine feature because the open source driver will
> add a whole new set of preferred configs that will be optimized later.

LGTM. Is it kirkstone-specific? Any plans for master?


> Randolph Sapp (4):
>   ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
>   pvr-mesa: add new vulkan configuration options and wsi
>   cairo: resolve opengl version
>   ti-img-rogue-umlibs: package firmware separately
> 
>  .../recipes-graphics/cairo/cairo_%.bbappend   |  1 +
>  .../recipes-graphics/cairo/pvr-cairo.inc      |  5 +++
>  .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
>  .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
>  4 files changed, 37 insertions(+), 8 deletions(-)
>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

