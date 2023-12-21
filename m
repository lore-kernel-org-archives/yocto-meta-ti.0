Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBF9C46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 23:29:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7818.1703201337592685439
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 15:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E595140CB2;
	Thu, 21 Dec 2023 23:28:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSxu1aLXsl97; Thu, 21 Dec 2023 23:28:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BC84F40C24;
	Thu, 21 Dec 2023 23:28:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C4561163DD1; Thu, 21 Dec 2023 18:28:47 -0500 (EST)
Date: Thu, 21 Dec 2023 18:28:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-extras: Update jailhouse
 recipe to delete irrevelant files
Message-ID: <20231221232847.GL11745@denix.org>
References: <20231221092215.2598739-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221092215.2598739-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 23:29:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17367

"irrevelant" typo?


On Thu, Dec 21, 2023 at 02:52:15PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Remove config files from /usr/share/jailhouse as they are not required.
> Package only the cell files for respective devices and not all k3 files.
> Update FILES:PN to use wildcard.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../recipes-ti/jailhouse/jailhouse_git.bb     | 34 +++++--------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> index 387b0806..70d6a0b6 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> @@ -46,6 +46,8 @@ INMATES_DIR ?= "${JH_DATADIR}/inmates"
>  
>  JH_CELL_FILES ?= "*.cell"
>  JH_CELL_FILES:k3 ?= "k3-*.cell"
> +JH_CELL_FILES:am62xx ?= "k3-am625-*.cell"
> +JH_CELL_FILES:am62pxx ?= "k3-am62p5-*.cell"
>  
>  JH_INMATE_DTB ?= ""
>  JH_INMATE_DTB:am62xx ?= "inmate-k3-am625-sk.dtb"
> @@ -147,6 +149,8 @@ do_install() {
>  		chmod +x ${D}${JH_DATADIR}/linux-demo.sh
>  	fi
>  
> +	rm ${D}${JH_DATADIR}/root-cell-config.c.tmpl
> +	rm ${D}${JH_DATADIR}/jailhouse-config-collect.tmpl
>  }
>  
>  PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
> @@ -181,30 +185,10 @@ python __anonymous () {
>  
>  
>  FILES:${PN} = " \
> -    /boot \
> +    /boot/* \
>      /usr/libexec \
> -    /usr/sbin/ivshmem-demo \
> -    /usr/sbin/jailhouse \
> -    /usr/libexec/jailhouse \
> -    /usr/libexec/jailhouse/jailhouse-config-check \
> -    /usr/libexec/jailhouse/jailhouse-config-collect \
> -    /usr/libexec/jailhouse/jailhouse-hardware-check \
> -    /usr/libexec/jailhouse/jailhouse-cell-stats \
> -    /usr/libexec/jailhouse/linux-loader.bin \
> -    /usr/libexec/jailhouse/jailhouse-cell-linux \
> -    /usr/libexec/jailhouse/jailhouse-config-create \
> -    /usr/share/jailhouse \
> -    /usr/share/jailhouse/linux-demo.sh \
> -    /usr/share/jailhouse/inmate-k3-am625-sk.dtb \
> -    /usr/share/jailhouse/inmates \
> -    /usr/share/jailhouse/cells \
> -    /usr/share/jailhouse/inmates/gic-demo.bin \
> -    /usr/share/jailhouse/inmates/ivshmem-demo.bin \
> -    /usr/share/jailhouse/inmates/uart-demo.bin \
> -    /usr/share/jailhouse/cells/k3-am625-sk.cell \
> -    /usr/share/jailhouse/cells/k3-am625-sk-inmate-demo.cell \
> -    /usr/share/jailhouse/cells/k3-am625-sk-linux-demo.cell \
> -    /lib/firmware \
> -    /lib/firmware/jailhouse.bin \
> -    /boot/tisdk-tiny-image-am62xx-evm.cpio \
> +    /usr/sbin/* \
> +    /usr/libexec/* \
> +    /usr/share/* \
> +    /lib/firmware/* \
>  "
> -- 
> 2.34.1
> 

