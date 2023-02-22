Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66463C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:44:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2973.1677095093303692021
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B740740C2E;
	Wed, 22 Feb 2023 19:44:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2v79XPwL9jY; Wed, 22 Feb 2023 19:44:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8747040AC9;
	Wed, 22 Feb 2023 19:44:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C3D30163764; Wed, 22 Feb 2023 14:44:25 -0500 (EST)
Date: Wed, 22 Feb 2023 14:44:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 14/15] ti-rtos-firmware:
 Fix use of base_libdir with nonarch_base_libdir
Message-ID: <20230222194425.GF22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-15-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-15-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:44:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15920

On Wed, Feb 15, 2023 at 01:33:54PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Firmware belongs in the nonarch lib directory. Use the right variable.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 112 +++++++++---------
>  1 file changed, 56 insertions(+), 56 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 1b8e1cd2..5de7c7b3 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -297,21 +297,21 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/j7-c66_0-f
>  ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw"
>  ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw"
>  
> -ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/j7-c66_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/j7-c66_1-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/j7-c71_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c66_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw-sec"
>  
>  ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
>  ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw"
>  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
>  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw"
>  
> -ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
>  
>  ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
>  ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw"
> @@ -322,25 +322,25 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/
>  ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw"
>  ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw"
>  
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
> -ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/j721s2-c71_0-fw-sec"
> -ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/j721s2-c71_1-fw-sec"
> -
> -ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_0-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_1-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_0-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_1-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_0-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_1-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/j784s4-c71_0-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/j784s4-c71_1-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/j784s4-c71_2-fw"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/j784s4-c71_3-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw-sec"
> +
> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_2-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw"
>  
>  # Create the firmware alternatives
>  
> @@ -366,21 +366,21 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66
>  ALTERNATIVE_TARGET[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}"
>  ALTERNATIVE_TARGET[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
>  
> -ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/${ETH_FW}.signed"
> -ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> -ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
> -ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
> -ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C66_1_FW}.signed"
> -ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C66_2_FW}.signed"
> -ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}.signed"
> +ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
>  
>  ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
>  ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
>  ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}"
>  ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
>  
> -ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/${ETH_FW}.signed"
> -ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}.signed"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
>  
>  ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
>  ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> @@ -391,25 +391,25 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk
>  ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
>  ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
>  
> -ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}.signed"
> -ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> -ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
> -ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
> -ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
> -ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_2_FW}.signed"
> -
> -ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> -ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> -ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
> -ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> -ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
> -ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
> -ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_4_0_FW}"
> -ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_4_1_FW}"
> -ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
> -ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
> -ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_3_FW}"
> -ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_4_FW}"
> +ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}.signed"
> +
> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_4_0_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_4_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_3_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_4_FW}"
>  
>  ALTERNATIVE_PRIORITY = "10"
>  
> -- 
> 2.39.1

