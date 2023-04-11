Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EE9C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 22:00:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28850.1681250437825360684
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 15:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3326740C90;
	Tue, 11 Apr 2023 22:00:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5SnMgk76txs; Tue, 11 Apr 2023 22:00:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 09F9740C13;
	Tue, 11 Apr 2023 22:00:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 484E4163800; Tue, 11 Apr 2023 17:59:56 -0400 (EDT)
Date: Tue, 11 Apr 2023 17:59:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v3 4/6] linux-ti-next: Add
 defconfig for OMAP-L138
Message-ID: <20230411215956.GD9226@denix.org>
References: <20230411215243.18230-1-afd@ti.com>
 <20230411215243.18230-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411215243.18230-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 22:00:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16370

On Tue, Apr 11, 2023 at 04:52:41PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Not sure if anyone is testing on this device with -next, but for
> completeness add its defconfig.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> index b540e508..62831c9c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
> @@ -20,6 +20,7 @@ PV = "6.1.0-rc1+git${SRCPV}"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git;protocol=https;branch=master"
>  
>  DEFCONFIG_NAME = "multi_v7_defconfig"
> +DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
>  DEFCONFIG_NAME:k3 = "defconfig"
>  KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>  
> -- 
> 2.39.2

