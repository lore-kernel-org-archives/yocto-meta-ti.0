Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE4FC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 14:08:10 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.7747.1665497281350161495
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 07:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vdUP3n+9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BE80LE038471
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665497280;
	bh=Gx9L2VF57na+cw3MJ3S76Df+8Ou7sgvi4tvpSjxftzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vdUP3n+9IRcFF7cPnYj4F/ZXzC7TVVGJsgSEF1K2ZwM8P3K+VPI/cMaTtCGHKszmQ
	 QgQ74WooNTJBSfv6MiOVtH/ikLlPXOfEIUdzywZnzuDmZA8Vn/ik4N3r0uFt1O+Ke4
	 VHMthuwwSptfarQJmlGldUrnzBJrSs8akE3TCfvE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BE800R045284
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 09:08:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 09:07:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 09:07:59 -0500
Received: from [10.250.35.37] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BE7x1p001779;
	Tue, 11 Oct 2022 09:07:59 -0500
Message-ID: <c92fca84-4dbf-e466-eafc-2c9701e4887a@ti.com>
Date: Tue, 11 Oct 2022 09:07:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][RFC dunfell][PATCH 1/6] conf: machine: Add J784S4 hs
 platform
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
References: <20221011091839.1337077-1-m-chawdhry@ti.com>
 <20221011091839.1337077-2-m-chawdhry@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221011091839.1337077-2-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 14:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15145

On 10/11/22 4:18 AM, Manorit Chawdhry wrote:
> Machine conf for J784S4 HS platform.
> Used J721S2 hs as reference.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
>   conf/machine/j784s4-hs-evm.conf      | 19 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
>   create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
>   create mode 100644 conf/machine/j784s4-hs-evm.conf
> 
> diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> new file mode 100644
> index 00000000..b6f2f6f9
> --- /dev/null
> +++ b/conf/machine/j784s4-hs-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 HS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "j784s4"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +
> +UBOOT_MACHINE = "j784s4_hs_evm_r5_defconfig"
> diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
> new file mode 100644
> index 00000000..41fe26b5
> --- /dev/null
> +++ b/conf/machine/j784s4-hs-evm.conf
> @@ -0,0 +1,19 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 HS EVM
> +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
> +
> +require conf/machine/j784s4-evm.conf
> +
> +UBOOT_MACHINE = "j784s4_hs_evm_a72_defconfig"
> +
> +UBOOT_ENTRYPOINT =       "0x80080000"
> +UBOOT_LOADADDRESS =      "0x80080000"
> +UBOOT_RD_LOADADDRESS =   "0x84000000"
> +UBOOT_RD_ENTRYPOINT =    "0x84000000"
> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> +UBOOT_DTBO_OFFSET =      "0x00010000"
> +

Are any of the above needed anymore? These might be just leftover
from legacy platforms..

Andrew

> +SPL_BINARY = "tispl.bin_HS"
> +UBOOT_BINARY = "u-boot.img_HS"
> +UBOOT_SYMLINK = "u-boot.img"

