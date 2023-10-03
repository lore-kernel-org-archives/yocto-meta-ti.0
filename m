Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8AEE75458
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:02:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.107222.1696338108897236162
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 06:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F37E540CBA;
	Tue,  3 Oct 2023 13:01:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auuEdOUfCwCn; Tue,  3 Oct 2023 13:01:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6517840C67;
	Tue,  3 Oct 2023 13:01:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7E48C163CC9; Tue,  3 Oct 2023 09:01:44 -0400 (EDT)
Date: Tue, 3 Oct 2023 09:01:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Garrett Giordano <ggiordano@phytec.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH] machine:k3r5:Handle
 UBOOT_CONFIG for multiple R5 defconfigs
Message-ID: <20231003130144.GA26382@denix.org>
References: <20231002211616.4103160-1-ggiordano@phytec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002211616.4103160-1-ggiordano@phytec.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Oct 2023 13:02:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17045

The prefix in the Subject indicates the area being changed, so should 
rather be u-boot: instead of machine:k3r5:


On Mon, Oct 02, 2023 at 02:16:16PM -0700, Garrett Giordano wrote:
> From: Garrett Giordano <ggiordano@phytec.com>
> 
> Currently the do_compile step fails if we try to implement UBOOT_CONFIG
> in an attempt to build U-Boot with multiple R5 defconfigs.
> 
> This commit adds a condition to handle linking the UBOOT_BINARY if
> UBOOT_CONFIG is used in place of UBOOT_MACHINE.

Are you sure you don't need any corresponding changes in do_install 
and do_deploy to handle UBOOT_CONFIG for k3r5? Have you tested that 
all binaries and symlinks are being installed and deployed properly 
from ${B}/${config} location?

And I've already mentioned this before, but UBOOT_CONFIG won't work 
with recently introduced UBOOT_CONFIG_FRAGMENTS - see the list from 
last month for previous discussions on this, e.g.:
https://lists.yoctoproject.org/g/meta-ti/topic/101245468

At least UBOOT_CONFIG_FRAGMENTS will still work if UBOOT_CONFIG is 
not set, due to the else condition below.


> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 22 ++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 2c4ddcc2..327a31d8 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -103,8 +103,26 @@ UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
>  UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
>  
>  do_compile:append:k3r5 () {
> -	if ! [ -f ${B}/${UBOOT_BINARY} ]; then
> -		ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
> +	if [ -n "${UBOOT_CONFIG}" ];
> +	then
> +		for config in ${UBOOT_MACHINE}; do
> +			i=$(expr $i + 1);
> +			for type in ${UBOOT_CONFIG}; do
> +				j=$(expr $j + 1);
> +				if [ $j -eq $i ];
> +				then
> +					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY} ]; then
> +						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARY}
> +					fi
> +				fi
> +			done
> +			unset  j
> +		done
> +		unset  i
> +	else
> +		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
> +			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
> +		fi
>  	fi
>  }
>  
> -- 
> 2.25.1

