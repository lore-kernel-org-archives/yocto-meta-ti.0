Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A6AC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:39:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2801.1677094780079469545
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8130B40C2E;
	Wed, 22 Feb 2023 19:39:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHcW1b7Z5CyZ; Wed, 22 Feb 2023 19:39:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 642F240AC9;
	Wed, 22 Feb 2023 19:39:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2352163764; Wed, 22 Feb 2023 14:39:12 -0500 (EST)
Date: Wed, 22 Feb 2023 14:39:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 05/15] ti-rtos-firmware:
 Use new ti-secdev class to sign the images
Message-ID: <20230222193912.GW22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-6-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-6-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15911

On Wed, Feb 15, 2023 at 01:33:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Use ti-k3-secdev native package to provide secure-binary-image.sh script
> when it is not passed on as an environment variable. This fixes an issue
> with AM64xx which is always HS but should not require TI_SECURE_DEV_PKG
> when building for HS-FS or GP platforms.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 9a6da088..fddb5e2e 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -31,9 +31,7 @@ CLEANBROKEN = "1"
>  PR = "${INC_PR}.0"
>  
>  # Secure Build
> -DEPENDS += "openssl-native"
> -
> -TI_SECURE_DEV_PKG ?= ""
> +inherit ti-secdev
>  
>  RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
>  RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
> @@ -49,7 +47,6 @@ DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
>  # J721e HS support
>  do_install:prepend:j721e-hs-evm() {
> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> @@ -80,7 +77,6 @@ do_install:prepend:j721e-hs-evm() {
>  
>  # J7200 HS support
>  do_install:prepend:j7200-hs-evm() {
> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> @@ -101,7 +97,6 @@ do_install:prepend:j7200-hs-evm() {
>  
>  # J721s2 HS support
>  do_install:prepend:j721s2-hs-evm() {
> -        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> -- 
> 2.39.1

