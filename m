Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A6DC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 16:11:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60600.1718640672055662547
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 09:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A6CF40C8E;
	Mon, 17 Jun 2024 16:11:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9CCtJ_RxtIu; Mon, 17 Jun 2024 16:11:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0FC0640AB7;
	Mon, 17 Jun 2024 16:11:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AA211163FB1; Mon, 17 Jun 2024 12:11:07 -0400 (EDT)
Date: Mon, 17 Jun 2024 12:11:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] conf: machine: Update
 am62xxsip-evm for multi-BSP support
Message-ID: <20240617161107.GD5475@denix.org>
References: <20240617135532.151410-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617135532.151410-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 16:11:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17759

On Mon, Jun 17, 2024 at 07:25:32PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> Update am62xxsip-evm machine configuration to support
> TI kernel 6.1 & ti-u-boot-2023.04
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
> v2: In commit message, s/ti-u-boot-2024.04/ti-u-boot-2023.04

Were am62p DM firmware changes supposed to be included here?


>  meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 ++++
>  meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb     | 1 +
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc     | 6 ++++++
>  4 files changed, 13 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> index c35edc6e..55bc530b 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> @@ -9,3 +9,7 @@ SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "hs-fs"
>  
>  UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
> +
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
> +
> +UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> index 38fe04c9..8104329e 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
>  "
>  
>  UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
> +
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index 1ad236ce..3453725e 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -37,6 +37,7 @@ DM_FW_DIR = "ti-dm/${PLAT_SFX}"
>  INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional("DISPLAY_CLUSTER_ENABLE", "1", "dss_display_share.wkup-r5f0_0.release.strip.out", "ipc_echo_testb_mcu1_0_release_strip.xer5f", d)}"
>  
>  DM_FW_LIST = ""
>  DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index bad8371f..0a52eded 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -37,6 +37,7 @@ DEPENDS:append:k3 = " ti-sci-fw"
>  DEPENDS:append:k3r5 = " ti-sci-fw"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional("DISPLAY_CLUSTER_ENABLE", "1", "dss_display_share.wkup-r5f0_0.release.strip.out", "ipc_echo_testb_mcu1_0_release_strip.xer5f", d)}"
>  
>  PLAT_SFX = ""
>  PLAT_SFX:j721e = "j721e"
> @@ -68,8 +69,13 @@ COMPATIBLE_MACHINE = "(ti-soc)"
>  
>  BINMAN_INDIRS="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
>  
> +TI_DM="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE}"
> +
>  EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
>  
> +# Use TI_DM argument only for am62pxx which has two DM firmwares in ti-linux-firmware
> +EXTRA_OEMAKE:append:am62pxx = " TI_DM=${TI_DM}"
> +
>  PROVIDES += "u-boot"
>  PKG:${PN} = "u-boot"
>  PKG:${PN}-dev = "u-boot-dev"
> -- 
> 2.34.1

