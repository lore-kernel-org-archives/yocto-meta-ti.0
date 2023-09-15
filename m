Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C47EEB59A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 14:43:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22187.1694788990987883676
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 07:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E58A40C13;
	Fri, 15 Sep 2023 14:43:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvRii7sei__0; Fri, 15 Sep 2023 14:43:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6DE2040A0B;
	Fri, 15 Sep 2023 14:43:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2A5EF163CAB; Fri, 15 Sep 2023 10:43:00 -0400 (EDT)
Date: Fri, 15 Sep 2023 10:43:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH v4 1/2] recipes-bsp: u-boot:
 Add u-boot-mergeconfig.inc to handle fragment u-boot config
Message-ID: <20230915144300.GA7013@denix.org>
References: <20230915111523.2274146-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915111523.2274146-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Sep 2023 14:43:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16986

On Fri, Sep 15, 2023 at 04:45:22PM +0530, Chirag Shilwant wrote:
> - U-boot recipe in OE-Core supports out-of-tree config fragments that are passed via 
> SRC_URI and automatically merges all *.cfg files as fragments. This makes specifying
> config fragments in the machine configuration a bit difficult. Hence, add a logic which
> will ensure we handle u-boot config fragments using a new variable UBOOT_CONFIG_FRAGMENTS.
> 
> - The u-boot-mergeconfig.inc will allow us to build u-boot with list of config fragments
> specified in UBOOT_CONFIG_FRAGMENTS along with the base defconfig mentioned in UBOOT_MACHINE.
> 
> - Include u-boot-mergeconfig.inc in u-boot-ti.inc

Thanks! Looks good to me.


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v4: 
>   - Added an extra check for UBOOT_MACHINE being set
>   - Commit Message Formatting
> v3:
>   - s/UBOOT_CONFIG_FRAGMENT/UBOOT_CONFIG_FRAGMENTS
>   - Use do_configure:append instead of do_compile:append
> v2:
>   - Split a single patch into 2 seperate patches
>   - Add detail commit message
> 
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++++
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 +
>  2 files changed, 8 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> new file mode 100644
> index 00000000..c7ce5047
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
> @@ -0,0 +1,7 @@
> +do_configure:append () {
> +   if [ -n "${UBOOT_CONFIG_FRAGMENTS}" ] && [ -n "${UBOOT_MACHINE}" ]
> +   then
> +       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENTS}
> +       oe_runmake -C ${S} O=${B} olddefconfig
> +   fi
> +}
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index f3285c23..5292517b 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -7,6 +7,7 @@ SPL_BINARY ?= "MLO"
>  
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +require u-boot-mergeconfig.inc
>  
>  FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
>  
> -- 
> 2.34.1

