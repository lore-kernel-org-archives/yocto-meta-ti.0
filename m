Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126CBCF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 20:08:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20337.1727554083254496582
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 28 Sep 2024 13:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5014440C61;
	Sat, 28 Sep 2024 20:08:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osa2ZoBwb8iE; Sat, 28 Sep 2024 20:08:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EAF140BA7;
	Sat, 28 Sep 2024 20:08:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5EE2E1640AB; Sat, 28 Sep 2024 16:08:00 -0400 (EDT)
Date: Sat, 28 Sep 2024 16:08:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Adrian DC <radian.dc@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] meta-ti-bsp: ti-dm-fw: declare files
 installed in 'DEPLOYDIR'
Message-ID: <20240928200800.GC14676@denix.org>
References: <20240928190942.2291734-1-radian.dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928190942.2291734-1-radian.dc@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 28 Sep 2024 20:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17977

NAK

This does not make any sense. The subject says DEPLOYDIR, then you add 
INSTALL_DM_FW_DIR (that is ${nonarch_base_libdir}/firmware/${DM_FW_DIR}) 
to FILES, which has nothing to do with do_deploy, only do_install.

Moreover, ti-dm-fw.bb includes ti-linux-fw.inc, which already sets FILES 
to include everything in ${nonarch_base_libdir}/firmware


On Sat, Sep 28, 2024 at 09:09:42PM +0200, Adrian DC wrote:
> Errors: ... is trying to install files into a shared area
>         when those files already exist.
> Tests: Build clean, rebuild, rebuild clean with sstate
> ---
> 
> Signed-off-by: Adrian DC <radian.dc@gmail.com>
> ---
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index 1ad236ce..39e0eb8c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -77,6 +77,8 @@ do_deploy() {
>      done
>  }
>  
> +FILES:${PN} += "${INSTALL_DM_FW_DIR}"
> +
>  # Set up names for the firmwares
>  ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
>  ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
> -- 
> 2.43.0

