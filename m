Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1459.1616782738311763601
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 11:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C423040C82;
	Fri, 26 Mar 2021 18:18:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lh_ZL8reMORm; Fri, 26 Mar 2021 18:18:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99AB040952;
	Fri, 26 Mar 2021 18:18:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 60568174565; Fri, 26 Mar 2021 14:18:54 -0400 (EDT)
Date: Fri, 26 Mar 2021 14:18:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Lucas Weaver <l-weaver@ti.com>, meta-ti@lists.yoctoproject.org,
	denys@konsulko.com
Subject: Re: [meta-ti] [dunfell/master PATCH] u-boot-ti: J721e: update HS build to include DM signing
Message-ID: <20210326181854.GW18041@denix.org>
References: <20210326165351.29988-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210326165351.29988-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

I know we discussed doing signing in u-boot do_compile, but it appears 
not optimal and to avoid any corner cases it's better to do signing in 
ti-rtos-firmware do_install. That way signing is done once and can be 
used by other packages that need it. See the modified patch I sent.

-- 
Denys


On Fri, Mar 26, 2021 at 11:53:51AM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> DM firmware is added now as part of the uboot build process.
> This patch fixes HS signing and build including the new DM firmware.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index e5f92f4b..5cae1c15 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -57,6 +57,14 @@ S = "${WORKDIR}/git"
>  TI_SECURE_DEV_PKG ?= ""
>  export TI_SECURE_DEV_PKG
>  
> +do_compile_prepend_j7-hs-evm() {
> +        ( cd ${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/; \
> +                mv ipc_echo_testb_mcu1_0_release_strip.xer5f ipc_echo_testb_mcu1_0_release_strip.xer5f.unsigned; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_testb_mcu1_0_release_strip.xer5f.unsigned ipc_echo_testb_mcu1_0_release_strip.xer5f; \
> +        )
> +}
> +
> +
>  SYSROOT_DIRS += "/boot"
>  
>  # SPL (Second Program Loader) to be loaded over UART
> -- 
> 2.17.1
> 
