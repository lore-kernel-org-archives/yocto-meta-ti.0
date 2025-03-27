Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF79C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 18:50:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4099.1743101400480850083
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 11:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NIe50opD;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RInxV51946362
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 13:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743101399;
	bh=HKQElEdcgCnisICQZe7YcvHaY6S84qHBnLMqU95txE0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NIe50opDl60/UFmWbc4z5Fb0dH1luFMxKPdl68qEFcaGIppkTSJmNb9TQN5EksvX2
	 loGalM6UvC4IYpstn74urMVApTY+SzlwsQZlQFRgDYrCErSyi83jyv7v78R2WD28Bc
	 aCngI2z4z9yC0o+F2Y0viv9q1GaaZJrFYpgzUEcU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RInxgq022247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 13:49:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 13:49:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 13:49:58 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RInwJO058087;
	Thu, 27 Mar 2025 13:49:58 -0500
Message-ID: <1d0eeedc-8574-487b-aada-871668ad3679@ti.com>
Date: Thu, 27 Mar 2025 13:49:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to export
 prebuilt HSM firmware
To: Beleswar Padhi <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250327092323.1726839-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250327092323.1726839-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 18:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18429

On 3/27/25 4:23 AM, Beleswar Padhi wrote:
> Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
> up by the tisdk-core-bundle for the prebuilt binaries directory.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb    | 28 +++++++++++++++++++
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +++
>   3 files changed, 33 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
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

Was this supposed to be ""?

Also, thinking on this, since these binaries have different names
when deployed, do we really need this package to be different
per machine? Why not have this recipe generate two packages,

ti-hsm-fw-j721s2
ti-hsm-fw-j784s4

each containing the firmware for that SoC. Then in u-boot-ti.inc
have:

DEPENDS:append:j721s2 = " ti-hsm-fw-j721s2"
DEPENDS:append:j784s4 = " ti-hsm-fw-j784s4"

Then you can drop the PACKAGE_ARCH line above. I'm thinking about
doing this for the other firmware. I'd like to keep removing
machine dependent packages to push us closer to common rootfs
images that work across machines.

Andrew

> +SYSFW_SOC:j721s2 = "j721s2"
> +SYSFW_SOC:j784s4 = "j784s4"
> +
> +HSM_BINARY = "hsm-demo-firmware-${SYSFW_SOC}*.bin"
> +
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
>   CNM_WAVE521_FW_VERSION = "1.0.7"
>   TI_DM_FW_VERSION = "11.00.09"
>   TI_SYSFW_VERSION = "11.00.07"
> +TI_HSM_FW_VERSION = "11.00.09"
>   
>   TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 41d4abdd..8a800193 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
>   DEPENDS:append:k3 = " ti-sci-fw"
>   DEPENDS:append:k3r5 = " ti-sci-fw"
>   
> +# HSM Firmware is only applicable for J721S2 & J784S4 devices
> +DEPENDS:append:j721s2 = " ti-hsm-fw"
> +DEPENDS:append:j784s4 = " ti-hsm-fw"
> +
>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>   
>   PLAT_SFX = ""

