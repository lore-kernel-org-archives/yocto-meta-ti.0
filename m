Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3568.1622833867556681484
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Jun 2021 12:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7DAD840BA7;
	Fri,  4 Jun 2021 19:11:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SG3fiUs7IqzB; Fri,  4 Jun 2021 19:11:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 545CC40A03;
	Fri,  4 Jun 2021 19:11:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9558A1745F7; Fri,  4 Jun 2021 15:11:03 -0400 (EDT)
Date: Fri, 4 Jun 2021 15:11:03 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: a-m1@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com
Subject: Re: [meta-ti][meta-ti PATCH] ti-sci-fw: Install sysfw.itb in the deploy directory
Message-ID: <20210604191103.GJ1528@denix.org>
References: <20210602180151.4393-1-a-m1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210602180151.4393-1-a-m1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 02, 2021 at 11:31:51PM +0530, Aparna M via lists.yoctoproject.org wrote:
> The sysfw.itb to be packaged by the installer is copied to the
> prebuilt-images directory from the deploy directory. This
> change installs the sysfw.itb in the deploy directory.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 87fdec68..fef87705 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -92,12 +92,11 @@ do_install_j7200-evm-k3r5() {
>  	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>  }
>  
> -do_deploy_j7200-evm-k3r5() {
> +do_deploy_append_j7200-evm-k3r5() {

NAK!
j7200 and am64 package sysfw very differently from other k3 platforms. You 
cannot just append j7200/am64 deployment logic on top of existing one for 
j721e and am65 - they use different sets of variables, etc...


>  	install -d ${DEPLOYDIR}
>  	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> -	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
>  
>  do_install_am64xx-evm-k3r5() {
> @@ -107,12 +106,11 @@ do_install_am64xx-evm-k3r5() {
>  	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>  }
>  
> -do_deploy_am64xx-evm-k3r5() {
> +do_deploy_append_am64xx-evm-k3r5() {
>  	install -d ${DEPLOYDIR}
>  	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> -	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
>  
>  addtask deploy before do_build after do_compile
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
