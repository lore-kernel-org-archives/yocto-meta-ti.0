Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC88C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 19:17:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3185.1685474276828126069
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 12:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1524740C2B;
	Tue, 30 May 2023 19:17:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJDIFWOlNx_2; Tue, 30 May 2023 19:17:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED06B40C06;
	Tue, 30 May 2023 19:17:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D456316392C; Tue, 30 May 2023 15:17:08 -0400 (EDT)
Date: Tue, 30 May 2023 15:17:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 1/2] u-boot-ti: do_compile
 depends on the value of UBOOT_LOCALVERSION
Message-ID: <20230530191708.GI9226@denix.org>
References: <17635F3EC543510A.6918@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17635F3EC543510A.6918@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 19:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16635

Scratch these - Richard suggested a different fix.


On Sun, May 28, 2023 at 05:36:41PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Explicitly mark do_compile as depending on the value of UBOOT_LOCALVERSION
> variable. Similar patch was submitted to OE-Core for upstream version of
> u-boot recipe:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230528171515.832179-1-denis@denix.org/
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 135f443b..4e645e4f 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -1,6 +1,7 @@
>  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>  # U-boot version string.  such as the commit id
>  UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
> +do_compile[vardepvalue] = "${UBOOT_LOCALVERSION}"
>  
>  UBOOT_SUFFIX ?= "img"
>  SPL_BINARY ?= "MLO"
> -- 
> 2.25.1

