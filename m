Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60632C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 18:45:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4166.1743101128411957199
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 11:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41A2840C83;
	Thu, 27 Mar 2025 18:45:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwOWbOOuPiif; Thu, 27 Mar 2025 18:45:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC5CD40A46;
	Thu, 27 Mar 2025 18:45:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1BECC16458D; Thu, 27 Mar 2025 14:45:20 -0400 (EDT)
Date: Thu, 27 Mar 2025 14:45:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-padhi@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, a-limaye@ti.com, afd@ti.com,
	u-kumar1@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to
 export prebuilt HSM firmware
Message-ID: <20250327184520.GW23729@denix.org>
References: <20250327092323.1726839-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327092323.1726839-1-b-padhi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 18:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18428

On Thu, Mar 27, 2025 at 02:53:23PM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
> Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
> up by the tisdk-core-bundle for the prebuilt binaries directory.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb    | 28 +++++++++++++++++++
>  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
> new file mode 100644
> index 00000000..8b225421
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "TI HSM Firmware"
> +
> +inherit deploy
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PV = "${TI_HSM_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +SYSFW_SOC ?= "*"
> +SYSFW_SOC:j721s2 = "j721s2"
> +SYSFW_SOC:j784s4 = "j784s4"

This variable is normally set by k3r5 machine configs and used for a different 
purpose.

Re-using it here for another purpose may be confusing, should a new variable 
be used instead?

Also, if the firmware is only applicable to j721s2 and j784s4, should there be 
a corresponding COMPATIBLE_MACHINE?


> +HSM_BINARY = "hsm-demo-firmware-${SYSFW_SOC}*.bin"

What would happen if this gets pulled by other non compatible platforms and 
SYSFW_SOC is set to * above?


> +do_install() {
> +	install -d ${D}${nonarch_base_libdir}/firmware/ti-hsm
> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${D}${nonarch_base_libdir}/firmware/ti-hsm
> +}
> +
> +do_deploy() {
> +	install -d ${DEPLOYDIR}/ti-hsm
> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
> +}
> +
> +addtask deploy before do_build after do_compile
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 0d912625..4e9c385c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
>  CNM_WAVE521_FW_VERSION = "1.0.7"
>  TI_DM_FW_VERSION = "11.00.09"
>  TI_SYSFW_VERSION = "11.00.07"
> +TI_HSM_FW_VERSION = "11.00.09"
>  
>  TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 41d4abdd..8a800193 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
>  DEPENDS:append:k3 = " ti-sci-fw"
>  DEPENDS:append:k3r5 = " ti-sci-fw"
>  
> +# HSM Firmware is only applicable for J721S2 & J784S4 devices
> +DEPENDS:append:j721s2 = " ti-hsm-fw"
> +DEPENDS:append:j784s4 = " ti-hsm-fw"

Why are these DEPENDS in U-boot? Is the firmware being packaged there?


>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
>  PLAT_SFX = ""
> -- 
> 2.34.1

