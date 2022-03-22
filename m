Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC7DC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:01:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.169.1647979273206790578
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3034740C3E;
	Tue, 22 Mar 2022 20:01:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qx33FJdsFIt; Tue, 22 Mar 2022 20:01:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 083A540B13;
	Tue, 22 Mar 2022 20:01:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C143C174837; Tue, 22 Mar 2022 16:01:07 -0400 (EDT)
Date: Tue, 22 Mar 2022 16:01:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2 2/7] recipes-ti: ti-rtos-bin: Add
 AM62x binaries
Message-ID: <20220322200107.GO23554@denix.org>
References: <20220322181558.20684-1-reatmon@ti.com>
 <20220322181558.20684-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322181558.20684-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14537

On Tue, Mar 22, 2022 at 01:15:53PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> Add binaries for AM62x
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index c5852dbd..431c13da 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -19,6 +19,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
>  PLAT_SFX_j721s2-evm = "j721s2"
>  PLAT_SFX_am65xx = "am65xx"
>  PLAT_SFX_am64xx = "am64xx"
> +PLAT_SFX_am62xx-evm = "am62xx"

Wny not use more generic am62xx SOC_FAMILY here, instead of specific "evm", to 
be more generic and cover any future am62-derivatives?


>  FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -154,6 +155,13 @@ do_install_am64xx() {
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>  }
>  
> +do_install_am62xx-evm() {

Same comment.


> +    install -d ${LEGACY_IPC_FW_DIR}
> +    # No specific firmware to install till M4F comes online
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +}
> +
>  # Set up names for the firmwares
>  ALTERNATIVE_${PN}_am65xx = "\
>                      am65x-mcu-r5f0_0-fw \
> @@ -205,6 +213,10 @@ ALTERNATIVE_${PN}_j721s2-evm = "\
>                      j721s2-c71_1-fw \
>                      "
>  
> +ALTERNATIVE_${PN}_am62xx-evm = "\

And here


> +                    am62xx-main-r5f0_0-fw \
> +                    "
> +
>  # Set up link names for the firmwares
>  
>  TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> @@ -245,6 +257,8 @@ TARGET_MAIN_R5FSS1_1_j721s2-evm = "j721s2-main-r5f1_1-fw"
>  TARGET_C7X_0_j721s2-evm = "j721s2-c71_0-fw"
>  TARGET_C7X_1_j721s2-evm = "j721s2-c71_1-fw"
>  
> +TARGET_MAIN_R5FSS0_0_am62xx-evm = "am62xx-main-r5f0_0-fw"

One more


> +
>  ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>  
> @@ -278,6 +292,8 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET
>  ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
>  ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1}"
>  
> +ALTERNATIVE_LINK_NAME[am62xx-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +
>  # Create the firmware alternatives
>  
>  ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> @@ -313,6 +329,8 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc
>  ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
>  ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
>  
> +ALTERNATIVE_TARGET[am62xx-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +
>  ALTERNATIVE_PRIORITY = "10"
>  
>  # make sure that lib/firmware, and all its contents are part of the package
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

