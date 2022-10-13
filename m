Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09283C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 19:24:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.403.1665689086569678882
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 12:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7BA2F40DD4;
	Thu, 13 Oct 2022 19:24:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSRKXTJuzSRR; Thu, 13 Oct 2022 19:24:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5187540DBD;
	Thu, 13 Oct 2022 19:24:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 94102174A39; Thu, 13 Oct 2022 15:24:40 -0400 (EDT)
Date: Thu, 13 Oct 2022 15:24:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2] u-boot: Change depends from lzop
 to lzo
Message-ID: <20221013192440.GJ22689@denix.org>
References: <20221013182602.9318-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013182602.9318-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 19:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15164

On Thu, Oct 13, 2022 at 01:26:02PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> lzop has disappeared from upstream master, but lzo is there.

lzop is actually a compression tool, while lzo is just a library.
so, I don't believe this change is correct/complete.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Fixed typo lzpo -> lzop
> 
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index d29c80cf..88018541 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  PV:append = "+git${SRCPV}"
>  
>  # u-boot needs devtree compiler to parse dts files
> -DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
> +DEPENDS += "dtc-native bc-native lzo-native flex-native bison-native python3-setuptools-native"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
> -- 
> 2.17.1

