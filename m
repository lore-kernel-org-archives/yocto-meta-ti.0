Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58347CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:15:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.18004.1694492095613202746
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A163040952;
	Tue, 12 Sep 2023 04:14:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXC3wP5zyYKQ; Tue, 12 Sep 2023 04:14:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 16EFA408CD;
	Tue, 12 Sep 2023 04:14:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 31887163CAB; Tue, 12 Sep 2023 00:14:45 -0400 (EDT)
Date: Tue, 12 Sep 2023 00:14:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] recipes-bsp: u-boot:
 Add u-boot-mergeconfig.inc to handle fragment u-boot config
Message-ID: <20230912041445.GE3359@denix.org>
References: <20230908203004.2764200-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908203004.2764200-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:15:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16949

Sorry for replying late.

I have some comments and few concerns about these patches - please give me a 
day to get back with more details. Thanks.

-- 
Denys


On Sat, Sep 09, 2023 at 02:00:04AM +0530, Chirag Shilwant wrote:
> - Add a new file u-boot-mergeconfig.inc which will ensure we handle fragment u-boot configs
> using a new variable UBOOT_CONFIG_FRAGMENT which stores the name of fragment u-boot config 
> to be used.
> 
> - Include u-boot-mergeconfig.inc in u-boot-ti.inc
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
>  2 files changed, 8 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> new file mode 100644
> index 00000000..69db6260
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> @@ -0,0 +1,7 @@
> +do_compile:prepend () {
> +   if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
> +   then
> +       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENT}
> +       oe_runmake -C ${S} O=${B} olddefconfig
> +   fi
> +}
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index f3285c23..5292517b 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
>  
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +require u-boot-mergeconfig.inc
>  
>  FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
>  
> -- 
> 2.34.1

