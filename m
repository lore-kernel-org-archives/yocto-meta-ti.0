Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E8DC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 15:37:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2009.1750261053926022444
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 08:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XfjUeS7B;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IFbVjI340291;
	Wed, 18 Jun 2025 10:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750261051;
	bh=hZ6u1FYzh2RmDpo3Ve3nC2DDsL3bBmAhtdwdhr3coWQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XfjUeS7BhETm0fq246gHeGwuEiNKpLIoe1ejeNi0uLHl9eTBWnajZbKgD8so0OeQz
	 XVrUq0T6luRANP4qCfAL141qDgW2UfuFivrEObt+pAlzzareAmbn6SdN5r5/I2Yc7e
	 dAkWpgZFdPItMKzXt/YXtX/n1oKbMpHjpBMFtjNg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IFbVXv2868169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 10:37:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 10:37:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 10:37:30 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IFbUkN3957855;
	Wed, 18 Jun 2025 10:37:30 -0500
Message-ID: <d4118654-6519-4d2e-adef-d875a320915e@ti.com>
Date: Wed, 18 Jun 2025 10:37:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH v2] recipes-bsp: Add TI TAD5212 DAC firmware
 recipe
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250618100143.1955550-1-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250618100143.1955550-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jun 2025 15:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18653

On 6/18/25 5:01 AM, Paresh Bhagat wrote:
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
> V1 -> V2:
> 	- Updated names of firmware in recipe
> 
>   meta-ti-bsp/conf/machine/include/am62dxx.inc  |  2 ++
>   .../recipes-bsp/ti-dac-fw/ti-dac-fw.bb        | 20 +++++++++++++++++++
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>   3 files changed, 23 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> index ac4e8e17..3c60acb1 100644
> --- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> @@ -13,3 +13,5 @@ IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
>   
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-dac-fw"

This firmware is specific to a DAC found on the EVM, not all AM62D based
boards will need this, above should go in the EVM config (am62pxx-evm.conf).

Andrew

> diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> new file mode 100644
> index 00000000..68b17aad
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
> +
> +PV = "${TAD5212_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "am62dxx"
> +
> +TAD5212_1DEV = "tad5212_01.bin"
> +TAD5212_4DEV = "tad5212_04.bin"
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

