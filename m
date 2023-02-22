Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63688C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:42:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2892.1677094923354437392
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1E7B40C2E;
	Wed, 22 Feb 2023 19:42:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWJZCmPBOaMx; Wed, 22 Feb 2023 19:42:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 934FA40AC9;
	Wed, 22 Feb 2023 19:42:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CE290163764; Wed, 22 Feb 2023 14:41:35 -0500 (EST)
Date: Wed, 22 Feb 2023 14:41:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 09/15] ti-rtos-firmware:
 Remove unneeded per-machine TARGET defines
Message-ID: <20230222194135.GA22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-10-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-10-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15915

On Wed, Feb 15, 2023 at 01:33:49PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Since these TARGET defines are only used on the machine for which
> an ALTERNATIVE is defined and always have the same name, these
> provide nothing. Drop them.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 213 ++++++------------
>  1 file changed, 66 insertions(+), 147 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index fddb5e2e..f2e0139a 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -400,153 +400,72 @@ ALTERNATIVE:${PN}:j784s4-evm = "\
>  
>  # Set up link names for the firmwares
>  
> -TARGET_MCU_R5FSS0_0:am65xx = "am65x-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:am65xx = "am65x-mcu-r5f0_1-fw"
> -
> -TARGET_MAIN_R5FSS0_0:am64xx = "am64-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:am64xx = "am64-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0:am64xx = "am64-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1:am64xx = "am64-main-r5f1_1-fw"
> -TARGET_MCU_M4FSS0_0:am64xx = "am64-mcu-m4f0_0-fw"
> -
> -TARGET_MAIN_R5FSS0_0:am62xx = "am62-main-r5f0_0-fw"
> -TARGET_MCU_M4FSS0_0:am62xx = "am62-mcu-m4f0_0-fw"
> -
> -TARGET_MCU_R5FSS0_0:j721e = "j7-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j721e = "j7-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j721e = "j7-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j721e = "j7-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0:j721e = "j7-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1:j721e = "j7-main-r5f1_1-fw"
> -TARGET_C66_0:j721e = "j7-c66_0-fw"
> -TARGET_C66_1:j721e = "j7-c66_1-fw"
> -TARGET_C7X_0:j721e = "j7-c71_0-fw"
> -
> -TARGET_MAIN_R5FSS0_0_SIGNED:j721e-hs-evm = "j7-main-r5f0_0-fw-sec"
> -TARGET_MAIN_R5FSS0_1_SIGNED:j721e-hs-evm = "j7-main-r5f0_1-fw-sec"
> -TARGET_MAIN_R5FSS1_0_SIGNED:j721e-hs-evm = "j7-main-r5f1_0-fw-sec"
> -TARGET_MAIN_R5FSS1_1_SIGNED:j721e-hs-evm = "j7-main-r5f1_1-fw-sec"
> -TARGET_C66_0_SIGNED:j721e-hs-evm = "j7-c66_0-fw-sec"
> -TARGET_C66_1_SIGNED:j721e-hs-evm = "j7-c66_1-fw-sec"
> -TARGET_C7X_0_SIGNED:j721e-hs-evm = "j7-c71_0-fw-sec"
> -
> -TARGET_MCU_R5FSS0_0:j7200-evm = "j7200-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j7200-evm = "j7200-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j7200-evm = "j7200-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j7200-evm = "j7200-main-r5f0_1-fw"
> -
> -TARGET_MCU_R5FSS0_0:j7200-hs-evm = "j7200-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j7200-hs-evm = "j7200-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j7200-hs-evm = "j7200-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j7200-hs-evm = "j7200-main-r5f0_1-fw"
> -
> -TARGET_MAIN_R5FSS0_0_SIGNED:j7200-hs-evm = "j7200-main-r5f0_0-fw-sec"
> -TARGET_MAIN_R5FSS0_1_SIGNED:j7200-hs-evm = "j7200-main-r5f0_1-fw-sec"
> -
> -TARGET_MCU_R5FSS0_0:j721s2-evm = "j721s2-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j721s2-evm = "j721s2-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j721s2-evm = "j721s2-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j721s2-evm = "j721s2-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0:j721s2-evm = "j721s2-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1:j721s2-evm = "j721s2-main-r5f1_1-fw"
> -TARGET_C7X_0:j721s2-evm = "j721s2-c71_0-fw"
> -TARGET_C7X_1:j721s2-evm = "j721s2-c71_1-fw"
> -
> -TARGET_MCU_R5FSS0_0:j721s2-hs-evm = "j721s2-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j721s2-hs-evm = "j721s2-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j721s2-hs-evm = "j721s2-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j721s2-hs-evm = "j721s2-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0:j721s2-hs-evm = "j721s2-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1:j721s2-hs-evm = "j721s2-main-r5f1_1-fw"
> -TARGET_C7X_0:j721s2-hs-evm = "j721s2-c71_0-fw"
> -TARGET_C7X_1:j721s2-hs-evm = "j721s2-c71_1-fw"
> -
> -TARGET_MAIN_R5FSS0_0_SIGNED:j721s2-hs-evm = "j721s2-main-r5f0_0-fw-sec"
> -TARGET_MAIN_R5FSS0_1_SIGNED:j721s2-hs-evm = "j721s2-main-r5f0_1-fw-sec"
> -TARGET_MAIN_R5FSS1_0_SIGNED:j721s2-hs-evm = "j721s2-main-r5f1_0-fw-sec"
> -TARGET_MAIN_R5FSS1_1_SIGNED:j721s2-hs-evm = "j721s2-main-r5f1_1-fw-sec"
> -TARGET_C7X_0_SIGNED:j721s2-hs-evm = "j721s2-c71_0-fw-sec"
> -TARGET_C7X_1_SIGNED:j721s2-hs-evm = "j721s2-c71_1-fw-sec"
> -
> -TARGET_MCU_R5FSS0_0:j784s4-evm = "j784s4-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j784s4-evm = "j784s4-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j784s4-evm = "j784s4-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j784s4-evm = "j784s4-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0:j784s4-evm = "j784s4-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1:j784s4-evm = "j784s4-main-r5f1_1-fw"
> -TARGET_MAIN_R5FSS2_0:j784s4-evm = "j784s4-main-r5f2_0-fw"
> -TARGET_MAIN_R5FSS2_1:j784s4-evm = "j784s4-main-r5f2_1-fw"
> -TARGET_C7X_0:j784s4-evm = "j784s4-c71_0-fw"
> -TARGET_C7X_1:j784s4-evm = "j784s4-c71_1-fw"
> -TARGET_C7X_2:j784s4-evm = "j784s4-c71_2-fw"
> -TARGET_C7X_3:j784s4-evm = "j784s4-c71_3-fw"
> -
> -ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> -
> -ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> -ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> -ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
> -
> -ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
> -
> -ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> -ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C66_0}"
> -ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C66_1}"
> -ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C7X_0}"
> -
> -ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_1_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> -
> -ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> -
> -ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> -
> -ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> -ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C7X_0}"
> -ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/${TARGET_C7X_1}"
> -
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> -ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
> -
> -ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0}"
> -ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1}"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1}"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/${TARGET_C7X_2}"
> -ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/${TARGET_C7X_3}"
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_0-fw"
> +ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_1-fw"
> +ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-mcu-m4f0_0-fw"
> +
> +ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw"
> +
> +ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/j7-c66_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw"
> +
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/j7-c66_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/j7-c66_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/j7-c71_0-fw-sec"
> +
> +ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
> +
> +ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw"
> +ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/j721s2-c71_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/j721s2-c71_1-fw-sec"
> +
> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f1_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/j784s4-main-r5f2_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/j784s4-c71_0-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/j784s4-c71_1-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/j784s4-c71_2-fw"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/j784s4-c71_3-fw"
>  
>  # Create the firmware alternatives
>  
> -- 
> 2.39.1

