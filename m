Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6976.1794520592407567702
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 13:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 885C9407E4;
	Thu, 12 Nov 2026 21:56:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIWyEIGO-3x3; Thu, 12 Nov 2026 21:56:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5DA58407E1;
	Thu, 12 Nov 2026 21:56:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 04AFA17EF0C; Thu, 12 Nov 2026 16:56:30 -0500 (EST)
Date: Thu, 12 Nov 2026 16:56:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH] ti-sci-fw: Allow empty SPDX deploy
 artifacts
Message-ID: <20261112215629.GB6542@denix.org>
References: <18E7631D8DE5E808.949888@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18E7631D8DE5E808.949888@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 12 Nov 2026 21:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20533

BTW, we also require this:
https://patchwork.yoctoproject.org/project/arm/patch/20261112215035.1552514-1-denis@denix.org/


On Thu, Nov 12, 2026 at 02:32:30PM -0500, Denys Dmytriyenko wrote:
> From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
> 
> OE-Core has added support for deploy tasks to create SPDX [0]. Some
> recipes don't deploy anything and need to set SPDX_DEPLOY_ALLOW_EMPTY
> so that it doesn't generate an error, similar to [1].
> 
> [0] https://git.openembedded.org/openembedded-core/commit/?id=1b77fe51ec77ae0bdea016fe4bbe76ac73b1f3d1
> [1] https://git.openembedded.org/openembedded-core/commit/?id=34991d0ce3cc5f38dd29e824af7579512d2b917e
> 
> Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> ---
>  meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 0d724862..6ee9992f 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -9,6 +9,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PV = "${TI_SYSFW_VERSION}"
>  PR = "${INC_PR}.0"
>  
> +SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
> +
>  do_install() {
>  	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw
>  	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
> -- 
> 2.25.1
