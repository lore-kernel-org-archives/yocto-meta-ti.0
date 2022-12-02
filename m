Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2C3C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:11:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.79556.1669997463781753205
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 08:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DFD0A40BC4;
	Fri,  2 Dec 2022 16:11:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7tJLlAeotbP; Fri,  2 Dec 2022 16:11:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5EB940BA9;
	Fri,  2 Dec 2022 16:10:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A3B521636A5; Fri,  2 Dec 2022 11:10:51 -0500 (EST)
Date: Fri, 2 Dec 2022 11:10:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] u-boot: Add lzop dependency
Message-ID: <20221202161051.GU22689@denix.org>
References: <20221202145817.28581-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202145817.28581-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 16:11:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15388

On Fri, Dec 02, 2022 at 08:58:17AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> It turns out we do need lzop for building dra7 and am57 in u-boot,
> so add the dependency back in and add a layer dependency on
> meta-oe(openembedded-layer).

Oh, no, please don't do that! This is a heavy dependency and meta-ti BSP has 
stayed away from it since the beginning of times.

It would be better to figure out why lzop is used for those platforms and 
change that, as LZOP is pretty much deprecated these days...


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/layer.conf                  | 1 +
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 39e7f9eb..8bafa854 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -15,6 +15,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>  
>  LAYERDEPENDS_meta-ti-bsp = " \
>      core \
> +    openembedded-layer \
>      meta-arm \
>  "
>  
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index d87dcbe1..5127e137 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  PV:append = "+git${SRCPV}"
>  
>  # u-boot needs devtree compiler to parse dts files
> -DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
> +DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
> -- 
> 2.17.1

