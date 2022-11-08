Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B127EC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 02:03:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.3481.1667872979467217516
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 18:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZSRieYfS;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A822wD4071847
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 20:02:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667872978;
	bh=/EWexTXpfPTB0tMszAGtLt1VfjeYRSQ84S3ZNZS4r1c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZSRieYfS83iE56JCUqe2HConn5HZxZkt8LcwnoiG4GeKACbtKsm+tiCuwia0dUswM
	 9rTDcJ2NoAyGvoLacJM5WHUU2roCB6YkpiWlR6SeHjW0/PdQ1RVWSwflnn9X1zisHh
	 XyK/TBoWelQl1I7/C1/yXtIa2BDnGd6HMeMq1dyQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A822w4o071022
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Nov 2022 20:02:58 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 7 Nov
 2022 20:02:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 7 Nov 2022 20:02:58 -0600
Received: from [10.249.37.150] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A822w45096604;
	Mon, 7 Nov 2022 20:02:58 -0600
Message-ID: <60ee6c35-5f80-212c-126f-240ffe635193@ti.com>
Date: Mon, 7 Nov 2022 20:02:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH v4 1/6] conf: machine: Add J784S4 hs
 platform
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
References: <20221107092048.555881-1-m-chawdhry@ti.com>
 <20221107092048.555881-2-m-chawdhry@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221107092048.555881-2-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Nov 2022 02:03:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15334



On 11/7/2022 3:20, Manorit Chawdhry wrote:
> Machine conf for J784S4 HS platform.
> Used J721S2 hs as reference.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
>   conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
>   2 files changed, 22 insertions(+)
>   create mode 100644 conf/machine/j784s4-hs-evm-k3r5.conf
>   create mode 100644 conf/machine/j784s4-hs-evm.conf
> 
> diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf b/conf/machine/j784s4-hs-evm-k3r5.conf
> new file mode 100644
> index 00000000..80a228a0
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
> +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"

All of the previous RFC versions had the string 
"j784s4_hs_evm_r5_defconfig", but here it is changed...  And all of the 
other HS platforms include the _hs_ in the string.  Was this intentional?


> diff --git a/conf/machine/j784s4-hs-evm.conf b/conf/machine/j784s4-hs-evm.conf
> new file mode 100644
> index 00000000..62357d62
> --- /dev/null
> +++ b/conf/machine/j784s4-hs-evm.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 HS EVM
> +#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
> +
> +require conf/machine/j784s4-evm.conf
> +
> +UBOOT_MACHINE = "j784s4_evm_a72_defconfig"

Same comment.


> +SPL_BINARY = "tispl.bin_HS"
> +UBOOT_BINARY = "u-boot.img_HS"
> +UBOOT_SYMLINK = "u-boot.img"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

