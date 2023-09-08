Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D300EE800A
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:15:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.39867.1694182509587816767
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FYgt87xb;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388EF5if045162;
	Fri, 8 Sep 2023 09:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694182505;
	bh=bS/mN5jo1/Z0yuXDFVvfDvuFZm6tPkPoFuixE9U4FPE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FYgt87xbQyBNI4sQc1PQZxLquC6JJQvgdvcjo48du5f0XJ2TFNI/1IVdQBgqD+Ysa
	 In6eYxWH4eVoVAfXumPBYBbiCwGb6Z8/tqzNNY/4HiSwly+Lqe4vUmCVRzUYh2oXlf
	 9LoIuO6F0cCQDQjpstYQOXBj6geTaz16pdPNMCdw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388EF4lu013882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 09:15:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 09:15:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 09:15:04 -0500
Received: from [10.247.18.57] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388EF3mI083032;
	Fri, 8 Sep 2023 09:15:03 -0500
Message-ID: <956d7bc5-014e-359c-f6c7-15246028b6ea@ti.com>
Date: Fri, 8 Sep 2023 09:15:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] conf: machine: Add
 am62xx-sip-evm configuration
To: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Nitin Yadav
	<n-yadav@ti.com>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230908130234.2227726-1-c-shilwant@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230908130234.2227726-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 14:15:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16935



On 9/8/2023 8:02 AM, Chirag Shilwant wrote:
> - Add A53 and R5 machine configurations for am62xx-sip-evm.

Can you keep the name consistent with the convention
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2023.04&id=600ab30716936aa7f91dd11a9b1b8f8a184122e0

s/am62xx-sip-evm/am62xxsip-evm

> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf | 11 +++++++++++
>   meta-ti-bsp/conf/machine/am62xx-sip-evm.conf      | 13 +++++++++++++
>   2 files changed, 24 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
> new file mode 100644
> index 00000000..472da1cc
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
> @@ -0,0 +1,11 @@
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

This is am62x config. Please converge config name from second patch and use
am62xsip_sk_r5.config	


> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
> new file mode 100644
> index 00000000..dc4f3b77
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
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

same comment here . This is not the correct config for am62xxsip



