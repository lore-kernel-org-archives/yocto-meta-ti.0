Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8086C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 21:53:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1531.1647986006010173776
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 14:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC45640C3E;
	Tue, 22 Mar 2022 21:53:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIdBYqU-tML0; Tue, 22 Mar 2022 21:53:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9904840951;
	Tue, 22 Mar 2022 21:53:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E570A174837; Tue, 22 Mar 2022 17:53:19 -0400 (EDT)
Date: Tue, 22 Mar 2022 17:53:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2 5/7] ti-rtos: Add support for
 AM62x M4F
Message-ID: <20220322215319.GQ23554@denix.org>
References: <20220322181558.20684-1-reatmon@ti.com>
 <20220322181558.20684-6-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322181558.20684-6-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 21:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14542

On Tue, Mar 22, 2022 at 01:15:56PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> Add M4F FW support for AM62x SoC.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 23 +++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 4cd08a36..43119f03 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -19,7 +19,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
>  PLAT_SFX_j721s2-evm = "j721s2"
>  PLAT_SFX_am65xx = "am65xx"
>  PLAT_SFX_am64xx = "am64xx"
> -PLAT_SFX_am62xx-evm = "am62x"
> +PLAT_SFX_am62xx = "am62xx"

Ah, I see it's being fixed later here (in patch #5)...

I know this patch series has been developed internally over time and comes 
with a history. I wonder if this needs cleaning up during upstreaming stage.

As we just discussed this outside of the list, let's figure out the process.


>  FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -78,6 +78,13 @@ do_install_prepend_am64xx() {
>          )
>  }
>  
> +# Update the am62xx ipc binaries to be consistent with other platforms
> +do_install_prepend_am62xx() {
> +        ( cd ${RTOS_IPC_FW_DIR}; \
> +                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
> +        )
> +}
> +
>  #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
>  do_install() {
>  
> @@ -155,11 +162,9 @@ do_install_am64xx() {
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>  }
>  
> -do_install_am62xx-evm() {
> +do_install_am62xx() {

Same fix here.


>      install -d ${LEGACY_IPC_FW_DIR}
> -    # No specific firmware to install till M4F comes online
> -    # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>  }
>  
>  # Set up names for the firmwares
> @@ -175,6 +180,9 @@ ALTERNATIVE_${PN}_am64xx = "\
>                      am64-main-r5f1_1-fw \
>                      am64-mcu-m4f0_0-fw \
>                      "
> +ALTERNATIVE_${PN}_am62xx = "\
> +                    am62-mcu-m4f0_0-fw \
> +                    "
>  
>  ALTERNATIVE_${PN}_j7 = "\
>                      j7-mcu-r5f0_0-fw \
> @@ -227,6 +235,7 @@ TARGET_MAIN_R5FSS0_1_am64xx = "am64-main-r5f0_1-fw"
>  TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
>  TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
>  TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
> +TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
>  
>  TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
>  TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
> @@ -268,6 +277,8 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_M
>  ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
>  ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
>  
> +ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
> +
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> @@ -305,6 +316,8 @@ ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
>  ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
>  
> +ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
> +
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

