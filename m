Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93520CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:46:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49313.1781192800240325632
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 08:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C93C40C8C;
	Thu, 11 Jun 2026 15:46:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElsrfAg_eAfn; Thu, 11 Jun 2026 15:46:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B9AA40BEC;
	Thu, 11 Jun 2026 15:46:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D9758176D83; Thu, 11 Jun 2026 11:46:31 -0400 (EDT)
Date: Thu, 11 Jun 2026 11:46:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-tripathi1@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, praneeth@ti.com,
	vishalm@ti.com, k-malarvizhi@ti.com, francesco@dolcini.it
Subject: Re: [meta-ti][master][PATCH] optee-ftpm: Update commit to include
 TA panic fix
Message-ID: <20260611154631.GQ23325@denix.org>
References: <20260611152123.2494690-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611152123.2494690-1-s-tripathi1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 15:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20029

On Thu, Jun 11, 2026 at 08:51:23PM +0530, Shiva Tripathi via lists.yoctoproject.org wrote:
> Bump to commit e3b1e426 which includes graceful degradation of fTPM TA
> when RPMB storage is unavailable, preventing TA panic and memory dumps.

Is it also needed for wrynose?


> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>  meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> index b961c70f..ea40ba27 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> @@ -1,3 +1,3 @@
>  PV = "4.10.0+git"
>  OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
> -SRCREV_optee-ta = "a09269b15de635e1816fe832e26adfbfb44c5455"
> +SRCREV_optee-ta = "e3b1e426a605e0537a3c3c9c24228eb22e354b80"
> -- 
> 2.34.1

