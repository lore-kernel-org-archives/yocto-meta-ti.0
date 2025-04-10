Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEA3C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 16:43:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3282.1744303423748330875
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 09:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEEB340C6B;
	Thu, 10 Apr 2025 16:43:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLe-DZozwn4y; Thu, 10 Apr 2025 16:43:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5918240A22;
	Thu, 10 Apr 2025 16:43:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 80C29165CEB; Thu, 10 Apr 2025 12:43:34 -0400 (EDT)
Date: Thu, 10 Apr 2025 12:43:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-padhi@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, a-limaye@ti.com, afd@ti.com,
	u-kumar1@ti.com, s-anna@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/scarthgap][PATCH v2] ti-hsm-demo-fw: Add a
 recipe to export prebuilt HSM demo firmware
Message-ID: <20250410164334.GH13634@denix.org>
References: <20250410103102.2984208-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410103102.2984208-1-b-padhi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Apr 2025 16:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18458

On Thu, Apr 10, 2025 at 04:01:02PM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
> Add a recipe to deploy the HSM demo firmware to the DEPLOYDIR, to be
> picked up by the tisdk-core-bundle for the prebuilt binaries directory.
> This firmware is then further picked by U-Boot and packaged inside
> tispl.bin FIT image for loading the HSM M4 core in applicable SoCs.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. Added COMPATIBLE_MACHINE as j721s2|j784s4 for this recipe.
> 2. Used ti-hsm-demo-fw throughout instead of ti-hsm-fw.
> 3. Updated commit description to call out how the firmware will be used.
> 4. Removed the do_install() task from the recipe as this firmware is not used in
> the rootfs.
> 
> Link to v1:
> https://lore.kernel.org/all/20250327092323.1726839-1-b-padhi@ti.com/
> 
> Sorry for the delay, took some time to test this patch. Had issues with my
> setup.
> 
>  .../ti-hsm-fw/ti-hsm-demo-fw_git.bb           | 24 +++++++++++++++++++
>  .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 ++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb
> new file mode 100644
> index 00000000..f6a7b43f
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "TI HSM demo Firmware"
> +
> +inherit deploy
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PV = "${TI_HSM_DEMO_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "j721s2|j784s4"
> +
> +HSM_FW_SOC:j721s2 = "j721s2"
> +HSM_FW_SOC:j784s4 = "j784s4"
> +
> +HSM_BINARY = "hsm-demo-firmware-${HSM_FW_SOC}*.bin"
> +
> +do_deploy() {
> +	install -d ${DEPLOYDIR}/ti-hsm
> +	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
> +}
> +
> +addtask deploy before do_build after do_compile
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index d69109f4..ba58747a 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
>  CNM_WAVE521_FW_VERSION = "1.0.7"
>  TI_DM_FW_VERSION = "11.00.09"
>  TI_SYSFW_VERSION = "11.00.07"
> +TI_HSM_DEMO_FW_VERSION = "11.00.09"
>  
>  TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 41d4abdd..3c56d8b2 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
>  DEPENDS:append:k3 = " ti-sci-fw"
>  DEPENDS:append:k3r5 = " ti-sci-fw"
>  
> +# HSM Demo Firmware is only applicable for J721S2 & J784S4 devices
> +DEPENDS:append:j721s2 = " ti-hsm-demo-fw"
> +DEPENDS:append:j784s4 = " ti-hsm-demo-fw"

While this is fine as it is, it kind of hardcodes HSM for these 2 platforms.

I was wondering if it would be better to make it a PACKAGECONFIG the same way 
we already do with atf, optee, dm, and such, so it can be easily toggled?


>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
>  PLAT_SFX = ""
> -- 
> 2.34.1

