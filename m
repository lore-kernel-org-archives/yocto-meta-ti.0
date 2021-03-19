Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1289.1616178626858176589
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 11:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D762B40BA9;
	Fri, 19 Mar 2021 18:30:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lipj_hsFOb0Q; Fri, 19 Mar 2021 18:30:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A9E7B40BA7;
	Fri, 19 Mar 2021 18:30:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E565174553; Fri, 19 Mar 2021 14:30:22 -0400 (EDT)
Date: Fri, 19 Mar 2021 14:30:22 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: l-weaver@ti.com
Cc: meta-ti@lists.yoctoproject.org, nikhil.nd@ti.com, praneeth@ti.com
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-sci-fw: Update J7200 deploy to install ti-sci-fw
Message-ID: <20210319183022.GX18041@denix.org>
References: <20210319163252.5249-1-l-weaver@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210319163252.5249-1-l-weaver@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 19, 2021 at 10:02:52PM +0530, l-weaver via lists.yoctoproject.org wrote:
> From: Lucas Weaver <l-weaver@ti.com>
> 
> Update J7200 deploy to install ti-sci-fw

This is just restating the code itself and repeating the shortlog above.
A good commit message should explain "why" or "what it addresses", instead of 
"what it does", which can be easily read from the code itself...


> Signed-off-by: Lucas Weaver <l-weaver@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index e7580a57..25fac359 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -99,6 +99,7 @@ do_deploy_j7200-evm-k3r5() {
>  	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> +	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
>  
>  do_install_am64xx-evm-k3r5() {
> -- 
> 2.17.1
> 
