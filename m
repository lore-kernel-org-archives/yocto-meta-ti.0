Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F983EEB570
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 23:19:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7436.1694215147375870567
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 16:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gmYe34H6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388NJ2cn075217;
	Fri, 8 Sep 2023 18:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694215142;
	bh=N0jV7smX16ceSZgaHeo69Oj9K6/skRSPF+3/kR5l0Qg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gmYe34H6SHzAGWWa/ktZ28vPFIgFffXcbyCkwop7+ZvgPJ3/DLkMUgkaKjyhG+h/U
	 yHZ8pAW5HapPRpwoQJId4ITdQhKIHfZgksCSSsn70jDGy3zBuY8ZV3juvG13zh9MC5
	 QwYNkfVlFtvafxvgK4s1P0+49cT9yi15EbZTQsdU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388NJ2ff027350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 18:19:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 18:19:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 18:19:01 -0500
Received: from [10.247.18.57] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388NJ1Rf010512;
	Fri, 8 Sep 2023 18:19:01 -0500
Message-ID: <8cb959a3-3552-c08f-3a0f-969ff21b5dac@ti.com>
Date: Fri, 8 Sep 2023 18:19:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/2] conf: machine: Add
 am62xxsip-evm configuration
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230908203820.2771293-1-c-shilwant@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230908203820.2771293-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 23:19:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16944



On 9/8/2023 3:38 PM, Chirag Shilwant wrote:
> - Add A53 and R5 machine configurations for am62xxsip-evm.
> - Use UBOOT_CONFIG_FRAGMENT as am62xsip_sk_r5.config for R5 machine configuration.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 12 ++++++++++++
>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 13 +++++++++++++
>   2 files changed, 25 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> new file mode 100644
> index 00000000..a5be1130
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> @@ -0,0 +1,12 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX SIP EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENT = "am62xsip_sk_r5.config"
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> new file mode 100644
> index 00000000..dc4f3b77
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX SIP EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62XX SIP EVM
> +
> +require conf/machine/include/am62xx.inc
> +
> +KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am625-sk.dtb \
> +"
> +
> +UBOOT_MACHINE = "am62x_evm_a53_defconfig"

