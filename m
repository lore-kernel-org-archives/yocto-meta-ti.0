Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86E4C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 17:10:43 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.25064.1750180242314076432
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 10:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WqbZDthQ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: praneeth@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55HHAdZ1079403;
	Tue, 17 Jun 2025 12:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750180239;
	bh=mPyLttaqwi3sNxLOi6fcWnV7y8X9xWYGUuRxY/17z5k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WqbZDthQndBAphoslL1/2B9IVmHgMST04CpGtaYqqoAtNzDmF7A1GzS+d7I1UBQjW
	 vzTeksuMSg1HBnegxkMo2OtdHBz8jlZSsAUQTLEwPQEuR4NXoYZ3ldfmMONna+yqYf
	 PKQnU7VsPVE81wRQkuj1O6RKWSeeZCjYwjWEaJ1k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55HHAdEx1968600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 17 Jun 2025 12:10:39 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 17
 Jun 2025 12:10:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 17 Jun 2025 12:10:38 -0500
Received: from [10.247.26.101] (ltpw0eb5ja.dhcp.ti.com [10.247.26.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55HHAcTO2052120;
	Tue, 17 Jun 2025 12:10:38 -0500
Message-ID: <1cfb1871-ca94-4c7e-af20-f2f5c5889176@ti.com>
Date: Tue, 17 Jun 2025 12:10:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] recipes-bsp: Add TI TAD5212 DAC firmware
 recipe
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>
References: <20250617101904.3686160-1-p-bhagat@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20250617101904.3686160-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jun 2025 17:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18646



On 6/17/2025 5:19 AM, Paresh Bhagat wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> Add TAD5212 DAC firmware images for am62dxx-evm to support two DAC
> configurations:
> - TAD5212_01.bin: Configures 1 DAC with stereo channel in i2s mode.
> - TAD5212_04.bin: Configures 4 DAC with each having stereo channel
> 		  support in i2s mode.
> 
> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> 
> This patch depends on new DAC firmware patch on ti-linux-firmware.
> 
> Boot logs
> https://gist.github.com/paresh-bhagat12/e4e2a7a1291d0f2d7acd0971bf2ed539
> 
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
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> new file mode 100644
> index 00000000..7d333b9e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "TI DAC TAD5212 config prebuild binary firmware"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"

not the correct license file.
update to match 
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware-next&id=ef1e9d0dd2c3ba0af102cea0edb7044a12c8fb5b

TI-TSPA


> +
> +PV = "${TAD5212_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +COMPATIBLE_MACHINE = "am62dxx"
> +
> +TAD5212_1DEV = "TAD5212_01.bin"
> +TAD5212_4DEV = "TAD5212_04.bin"
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

