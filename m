Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0633EE93713
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:24:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.26424.1696537448705041958
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 13:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B620B40D8F;
	Thu,  5 Oct 2023 20:24:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ER3_708_pLKq; Thu,  5 Oct 2023 20:24:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94A2640D82;
	Thu,  5 Oct 2023 20:24:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A9D32163CD8; Thu,  5 Oct 2023 16:24:04 -0400 (EDT)
Date: Thu, 5 Oct 2023 16:24:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-limaye@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/2] ti-dm-dw: Preserve
 structure of the deployed ti-dm-fw binaries
Message-ID: <20231005202404.GA2408@denix.org>
References: <20231004063430.703304-1-a-limaye@ti.com>
 <20231004063430.703304-3-a-limaye@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004063430.703304-3-a-limaye@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 20:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17064

Small typo in the Subject - ti-dm-dw


On Wed, Oct 04, 2023 at 12:04:30PM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
> Preserve the directory structure of the deployed dm firmware so that one
> can directly specify the deploy directory for binman based u-boot build.
> 
> Additionally, this makes it easier to preserve the same structure inside
> the prebuilt-images directory of the tisdk-core-bundle for the same reason.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index f635565d..49638ee9 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -67,11 +67,11 @@ do_install() {
>  
>  do_deploy() {
>      # DM Firmware is needed for rebuilding U-Boot
> -    install -d ${DEPLOYDIR}
> +    install -d ${DEPLOYDIR}/${DM_FW_DIR}
>      for FW_NAME in ${DM_FW_LIST}
>      do
> -        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/
> -        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/
> +        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}        ${DEPLOYDIR}/${DM_FW_DIR}
> +        install -m 0644 ${S}/${DM_FW_DIR}/${FW_NAME}.signed ${DEPLOYDIR}/${DM_FW_DIR}
>      done
>  }
>  
> -- 
> 2.34.1

