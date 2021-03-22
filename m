Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1629.1616430096158082559
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 09:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 044F840C16;
	Mon, 22 Mar 2021 16:21:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3AZiN1nCj3n; Mon, 22 Mar 2021 16:21:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C908C409E0;
	Mon, 22 Mar 2021 16:21:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8E5CD174557; Mon, 22 Mar 2021 12:21:31 -0400 (EDT)
Date: Mon, 22 Mar 2021 12:21:31 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: l-weaver@ti.com
Cc: meta-ti@lists.yoctoproject.org, nikhil.nd@ti.com, praneeth@ti.com
Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-sci-fw: Update J7200 deploy to install ti-sci-fw
Message-ID: <20210322162131.GH18041@denix.org>
References: <20210322160706.3304-1-l-weaver@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210322160706.3304-1-l-weaver@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2021 at 09:37:06PM +0530, l-weaver via lists.yoctoproject.org wrote:
> From: Lucas Weaver <l-weaver@ti.com>
> 
> The J7200 ti-sci-fw needs to be installed in the deploy
> directory so that it can be packaged in Processor SDK bundle
> 
> This is required because the ti-sci-fw is needed in the
> installer prebuilt-images in order to build the combined boot
> image for J7200
> 
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

This is already done for all platforms:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb#n87

do_deploy () {
	...

	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
}


>  }
>  
>  do_install_am64xx-evm-k3r5() {
> -- 
> 2.17.1
> 
