Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE71CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 23:51:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11140.1792108278953363847
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 16:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF33340C85;
	Thu, 15 Oct 2026 23:51:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-qNJuEsliMq; Thu, 15 Oct 2026 23:51:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98B3A40021;
	Thu, 15 Oct 2026 23:51:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 46B8417EEF4; Thu, 15 Oct 2026 19:51:14 -0400 (EDT)
Date: Thu, 15 Oct 2026 19:51:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] k3r5: Fix mc:k3r5:libgcc build error
Message-ID: <20261015235114.GW4190@denix.org>
References: <20261005130234.1532926-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005130234.1532926-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 23:51:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20465

On Mon, Oct 05, 2026 at 08:02:34AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in oe-core [1] is causing a build error in the
> mc:k3r5:libgcc do_configure step.  We need to track down why this change
> causes this error, but in the meantime we need to get builds working
> again.  Add the removed line from [1] to the multiconfig/k3r5.conf file.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=020d5f018616bc48eae3a23d5498dec3c78a1386

We need to revert this, as the proper fix has been in upstream for a while:

https://git.openembedded.org/openembedded-core/commit/?id=2f5c2b696bcd8e02eac6b06bb0cdace0fa86eb44


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index 936bce2f..fd871dca 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -8,3 +8,5 @@ TI_TMPDIR_APPEND ?= "-k3r5"
>  TMPDIR:append = "${TI_TMPDIR_APPEND}"
>  
>  SDKPKGSUFFIX = "k3r5-nativesdk"
> +
> +EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
> -- 
> 2.43.0

