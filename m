Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1456C43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 22:43:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.55325.1656801819830463997
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 02 Jul 2022 15:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 24B4340CF3;
	Sat,  2 Jul 2022 22:43:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmTWt_Za3zyz; Sat,  2 Jul 2022 22:43:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0328140CF2;
	Sat,  2 Jul 2022 22:43:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E636D17499F; Sat,  2 Jul 2022 18:43:35 -0400 (EDT)
Date: Sat, 2 Jul 2022 18:43:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][RFC 0/6] HS SDK on GP EVM support
Message-ID: <20220702224335.GC18692@denix.org>
References: <20220701220228.5449-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701220228.5449-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 02 Jul 2022 22:43:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14867

On Fri, Jul 01, 2022 at 05:02:22PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Hello all,
> 
> Still some changes pending in the k3-image-gen and u-boot projects
> but wanted to get some comments on this early. Plan is to remove
> the GP SDK. Have the HS SDK work on GP SoCs with minimal effort
> and have HS become the default single SDK type (starting only
> with AM64x and working out from there so don't panic (yet)).

So, quick question - does this set have any chance to get merged this year 
into dunfell before kirkstone becomes the current base?

Reason being is that I've been mulling over a much better and granular 
grouping of platforms in master/kirkstone into different categories, such 
as legacy (ARMv7) HS vs. K3 HS, legacy vs. multi-cert boot, GPU vs headless, 
etc.

This would be the best use of those new groupings...


> Thanks,
> Andrew
> 
> Andrew Davis (6):
>   conf: machine: Make multi-certificate image the default
>   ti-sci-fw: Use new SOC_TYPE and SYSFW_DIR to simplify recipe
>   ti-sci-fw: Deploy all SYSFW firmware types
>   ti-sci-fw: Use SYSFW_TIBOOT3 to point to the SYSFW image
>   machine: am64xx-k3r5: The output of u-boot is not used
>   ti-sci-fw: Deploy GP version of tiboot3.bin with HS SDK
> 
>  conf/machine/am64xx-evm-k3r5.conf      |   7 +
>  conf/machine/am64xx-hs-evm-k3r5.conf   |   7 +
>  conf/machine/am64xx-hs-evm.conf        |   2 +
>  conf/machine/include/am62xx.inc        |   3 -
>  conf/machine/include/am64xx.inc        |   3 -
>  conf/machine/include/am65xx.inc        |   5 +-
>  conf/machine/include/j7.inc            |   2 -
>  conf/machine/include/k3.inc            |   5 +-
>  conf/machine/j7-evm.conf               |   3 +
>  conf/machine/j7-hs-evm.conf            |   1 -
>  conf/machine/j7200-evm.conf            |   3 -
>  conf/machine/j721s2-evm.conf           |   3 -
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 334 +++++++++----------------
>  recipes-bsp/u-boot/u-boot-ti.inc       |  10 -
>  14 files changed, 149 insertions(+), 239 deletions(-)
>  rewrite recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb (72%)
> 
> -- 
> 2.36.1

