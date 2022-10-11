Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09586C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 01:44:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2536.1665452648673417057
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 18:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB0D840CFF;
	Tue, 11 Oct 2022 01:44:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbyEOwTk4FzP; Tue, 11 Oct 2022 01:44:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE1A440CCF;
	Tue, 11 Oct 2022 01:44:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3FE7A174A1C; Mon, 10 Oct 2022 21:44:03 -0400 (EDT)
Date: Mon, 10 Oct 2022 21:44:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell][PATCH] ti-img-rogue-*: Bump the graphics
 recipes
Message-ID: <20221011014403.GG30861@denix.org>
References: <20221006234108.1696865-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006234108.1696865-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 01:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15136

On Thu, Oct 06, 2022 at 06:41:08PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> Bump the graphics recipes source revision and remove the old BVNC
> switch. The BVNC is now baked into the platform Makefile that is
> selected with PVR_BUILD_DIR / TARGET_PRODUCT.

Any useful changelog between the 2 SRCREVs, besides removal of BVNC?


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../ti-img-rogue-driver_1.15.6133109.bb                | 10 ++--------
>  .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb        |  2 +-
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 1127c5d1..4f6dc4d4 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -26,7 +26,7 @@ SRC_URI = " \
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "ea2ac3fda4ac442b639bc3a0b73e9c4feac2081a"
> +SRCREV = "a353b9524399d927af8e824f92902065947b2fbe"
>  
>  TARGET_PRODUCT_j7-evm = "j721e_linux"
>  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> @@ -34,16 +34,10 @@ TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
>  TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
>  TARGET_PRODUCT_j784s4-evm = "j784s4_linux"
>  TARGET_PRODUCT_am62xx = "am62_linux"
> -TARGET_BVNC_j7-evm = "22.104.208.318"
> -TARGET_BVNC_j7-hs-evm = "22.104.208.318"
> -TARGET_BVNC_j721s2-evm = "36.53.104.796"
> -TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
> -TARGET_BVNC_j784s4-evm = "36.53.104.796"
> -TARGET_BVNC_am62xx = "33.15.11.3"
>  PVR_BUILD = "release"
>  PVR_WS = "wayland"
>  
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>  
>  do_install() {
>      make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index b6bb4324..de979be0 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -15,7 +15,7 @@ PR = "r2"
>  BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
>  
>  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "4207c0ea429ec751b1ff5f831a84ceeb76ad578d"
> +SRCREV = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
>  
>  TARGET_PRODUCT_j7-evm = "j721e_linux"
>  TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> -- 
> 2.25.1

