Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782FFC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 03:18:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36578.1658200725034577444
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 20:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 36AA040CBC;
	Tue, 19 Jul 2022 03:18:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uf1jmnBdU8dD; Tue, 19 Jul 2022 03:18:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1277840C93;
	Tue, 19 Jul 2022 03:18:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3C8D31749AF; Mon, 18 Jul 2022 23:18:41 -0400 (EDT)
Date: Mon, 18 Jul 2022 23:18:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [PATCH dunfell 0/3] fix ARAGO_BRAND=mainline builds
Message-ID: <20220719031841.GY18692@denix.org>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704030607.2292135-1-dfustini@baylibre.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Jul 2022 03:18:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14879

I was thinking that instead of keying off of ARAGO_BRAND=mainline, which 
is very specific to Arago distro, long term we should instead key off of 
PREFERRED_PROVIDER_virtual/kernel=linux-ti-mainline, that is specific to 
meta-ti... Thoughts?


On Sun, Jul 03, 2022 at 08:06:06PM -0700, Drew Fustini wrote:
> Builds for ARAGO_BRAND=mainline are failing for the following machines:
> 
>   - dra7xx-evm
>   - am57xx-evm
>   - am437x-evm
> 
> This is beause the above machine configurations include files in their 
> KERNEL_DEVICETREE variable that do not exist upstream. Therefore the
> image creation task fails when it tries to copy device tree files that
> do not exist.
> 
> This series of patches use '@oe.utils.conditional' to avoid adding those
> device tree files to KERNEL_DEVICETREE when ARAGO_BRAND=mainline. Thus
> the image create task is then able to complete successfully regardless
> of which kernel recipe is being used.
> 
> Drew Fustini (3):
>   conf: am57xx-evm: avoid missing dtb files when ARAGO_BRAND=mainline
>   conf: dra7xx-evm: avoid missing dtb files when ARAGO_BRAND=mainline
>   conf: am43: avoid missing dtb files when ARAGO_BRAND=mainline
> 
>  conf/machine/am57xx-evm.conf   | 6 +++---
>  conf/machine/dra7xx-evm.conf   | 2 +-
>  conf/machine/include/ti43x.inc | 6 ++++--
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> -- 
> 2.32.0

