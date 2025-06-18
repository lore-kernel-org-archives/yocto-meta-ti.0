Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A8CC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:08:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1182.1750266493423005151
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 10:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ShuXwQy7;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IH8BI0369448;
	Wed, 18 Jun 2025 12:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750266491;
	bh=WL0UZR6PtzFPvh4pdat6hh9lroOIcUKJLLu8Deqr/Rg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ShuXwQy7EAVWVHMSJ2Vtb/piI7aww2STBiVFS0ZJLw3K3hH9eoZbPgtPJWDbhYrgY
	 W8tLxPmwaxNqjniI4uBxhLrJaN7jXSH9YNemABdJEJYCM2P/mprUgqI32b0c+khwH6
	 2SQ+7G9z3X383BSz+E33V8VchvflWcFyhDyAyFRk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IH8BZP562104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 12:08:11 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 12:08:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 12:08:11 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IH8AE43854752;
	Wed, 18 Jun 2025 12:08:10 -0500
Message-ID: <5bd386d1-f911-4b14-ab1b-368f847adafc@ti.com>
Date: Wed, 18 Jun 2025 12:08:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH v3] recipes-bsp: Add TI TAD5212 DAC firmware
 recipe
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250618170217.2577275-1-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250618170217.2577275-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jun 2025 17:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18656

On 6/18/25 12:02 PM, Paresh Bhagat wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> Add TAD5212 DAC firmware images for am62dxx-evm to support two DAC
> configurations:
> - tad5212_01.bin: Configures 1 DAC with stereo channel in i2s mode.
> - tad5212_04.bin: Configures 4 DAC with each having stereo channel
> 		  support in i2s mode.
> 
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> Boot logs
> https://gist.github.com/paresh-bhagat12/38ad3188e2da2546627341cd9416ccad
> 
> Change log:
> V2 -> V3:
> 	- Removed redundant info in recipe(licesne and checksum)
> 	- Package firmware only for am62dxx-evm
> 
> V1 -> V2:
> 	- Updated names of firmware in recipe
> 
>   meta-ti-bsp/conf/machine/am62dxx-evm.conf       |  2 ++
>   meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb  | 17 +++++++++++++++++
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc     |  1 +
>   3 files changed, 20 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> index 9fbbb90a..1e41c53c 100644
> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -14,3 +14,5 @@ KERNEL_DEVICETREE = ""
>   FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
>   
>   UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-dac-fw"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> new file mode 100644
> index 00000000..8f68009d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${TAD5212_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "am62dxx"
> +
> +TAD5212_1DEV = "tad5212_01.bin"
> +TAD5212_4DEV = "tad5212_04.bin"

You usually don't need to make variable definitions like this if you
don't plan to vary the value and are only going to use the definition
once, easier to just use the name directly.

But that is just nitpicking, everything else LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> +
> +do_install() {
> +	install -d ${D}${nonarch_base_libdir}/firmware
> +	install -m 0644 ${S}/ti/tad5212/${TAD5212_1DEV} ${D}${nonarch_base_libdir}/firmware/
> +	install -m 0644 ${S}/ti/tad5212/${TAD5212_4DEV} ${D}${nonarch_base_libdir}/firmware/
> +}
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index d1dd9df3..08cd0b30 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -17,6 +17,7 @@ CNM_WAVE521_FW_VERSION = "1.0.8"
>   TI_DM_FW_VERSION = "11.00.09"
>   TI_SYSFW_VERSION = "11.01.00"
>   TI_HSM_DEMO_FW_VERSION = "11.00.09"
> +TAD5212_FW_VERSION = "1.0.0.0"
>   
>   TI_LINUX_FW_SRCREV ?= "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2bc"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"

