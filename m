Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C8DCD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 18:43:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.529.1712256172821448839
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 11:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H6Weg8rv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 434Igo68098765;
	Thu, 4 Apr 2024 13:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712256170;
	bh=n45ObR2B0FyzjkvIyugyDbfKNeYLv+XawtgKSbDbN/A=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=H6Weg8rvo4kDX7MEOjlO5gRQfssSXuWN59ks2ge6c/LQ9KoL7/pwIIIS1L0xw+tFE
	 sFtq0gswthGMeUhYuO13sGwTBcehgTIA6tNxZJY9K9G3OfZaTlFGEe7MVxIvtP76p3
	 xv9ETnugb1HBPyaPxfOaqFGEqX7SC216urfjJnDk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 434IgohU084909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Apr 2024 13:42:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Apr 2024 13:42:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Apr 2024 13:42:50 -0500
Received: from [10.247.18.240] (lt5cg925bjv2.dhcp.ti.com [10.247.18.240])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 434IgnUD067837;
	Thu, 4 Apr 2024 13:42:50 -0500
Message-ID: <3e20c882-6491-472f-8c8a-ced27e4be65e@ti.com>
Date: Thu, 4 Apr 2024 13:42:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: machine:
 beagleplay/beaglebone-ai64: Set KERNEL_DEVICETREE_PREFIX
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240404133732.32477-1-reatmon@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20240404133732.32477-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Apr 2024 18:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17559



On 4/4/2024 8:37 AM, Ryan Eatmon wrote:
> Set the KERNEL_DEVICETREE_PREFIX so that, when using the various TI
> kernel recipes, the "correct" DTB files are pulled in depending on what
> is available in that kernel source.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 4 ++++
>   meta-ti-bsp/conf/machine/beagleplay.conf      | 5 +++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> index 8ec52bba..a9be4d13 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -13,6 +13,10 @@ UBOOT_MACHINE = "j721e_evm_a72_config"
>   # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>   UBOOT_CONFIG_FRAGMENTS = "j721e_beagleboneai64_a72.config"
>   
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-j721e \
> +"
> +
>   KERNEL_DEVICETREE = " \
>   ti/k3-j721e-beagleboneai64.dtb \
>   ti/k3-j721e-common-proc-board.dtb \


Can we remove these overlays now ?


ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
ti/k3-j721e-evm-csi2-ov5640.dtbo \
ti/k3-j721e-evm-fusion.dtbo \
ti/k3-j721e-evm-gesi-exp-board.dtbo \
ti/k3-j721e-evm-pcie0-ep.dtbo \
ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
ti/k3-j721e-evm-virt-mac-client.dtbo \
ti/k3-j721e-sk-csi2-ov5640.dtbo \
ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
ti/k3-j721e-sk-fusion.dtbo \
ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \


> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index 75e62afd..65c14333 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -28,6 +28,11 @@ UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>   PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>   
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am625 \
> +    ti/k3-am62x-sk \
> +"
> +
>   KERNEL_DEVICETREE = " \
>   ti/k3-am625-beagleplay.dtb \
>   ti/k3-am625-beagleplay-csi2-ov5640.dtbo \

similar here. Can we remove the following overlays

ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
ti/k3-am625-sk-dmtimer-pwm.dtbo \
ti/k3-am625-sk-ecap-capture.dtbo \
ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
ti/k3-am625-sk-mcspi-loopback.dtbo \
ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
ti/k3-am625-sk-pwm.dtbo \
ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
ti/k3-am62x-sk-csi2-imx219.dtbo \
ti/k3-am62x-sk-csi2-ov5640.dtbo \
ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
ti/k3-am62x-sk-eqep.dtbo \
ti/k3-am62x-sk-hdmi-audio.dtbo \
ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
ti/k3-am62x-sk-mcan.dtbo \

