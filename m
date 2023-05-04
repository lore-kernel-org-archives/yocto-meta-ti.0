Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E780C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 14:29:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.51768.1683210593837064778
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 May 2023 07:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mG22IuZh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 344ETpYv128767;
	Thu, 4 May 2023 09:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683210591;
	bh=tXibLsHyqjaKoNSHsmyG5vorf8jAkD8jV1Z5UfX9ax0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mG22IuZhQdsgV4bx9yktiVyD8cmSbfl6dm57eVdS+IbCLMxhBAkEY21gbe5bAkvh2
	 vx2rqweUQs1sT4FHU5wqWyRG7cyJV4Wv3sWcU8ToBUOnhwauyZubLag+IQ5kCd98vY
	 SV6G/QBCNxpEXNV/bgK3lUiXAZ0vEB6lnhgyQ5yc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 344ETpaH078871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 May 2023 09:29:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 May 2023 09:29:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 May 2023 09:29:51 -0500
Received: from [10.250.32.153] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 344ETpCG026555;
	Thu, 4 May 2023 09:29:51 -0500
Message-ID: <aa2002d0-9940-d264-1ffe-cc2a349bc6b0@ti.com>
Date: Thu, 4 May 2023 09:29:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [kirkstone-next][PATCH] meta-ti: conf: am6xx: Add display DT
 overlay support
To: Aradhya Bhatia <a-bhatia1@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Paresh Bhagat
	<p-bhagat@ti.com>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, Gyan Gupta
	<g-gupta@ti.com>
References: <20230504062128.28222-1-a-bhatia1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230504062128.28222-1-a-bhatia1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 May 2023 14:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16486



On 5/4/2023 1:21, Aradhya Bhatia wrote:
> Add the Microtips OLDI Panel DT overlay for AM625-SK, AM62-LP SK and
> Rocktech OLDI LCD DT overlay for AM654-EVM.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-evm.conf    | 1 +
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>   meta-ti-bsp/conf/machine/include/am65xx.inc | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index d54213d4cb7b..0c0170defbfb 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am625-sk.dtb \
> +    ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
>   "

Starting in kirkstone, to support multiple kernels that might have 
differing sets of dtb overlays, we introduces the 
KERNEL_DEVICETREE_PREFIX variable to allow for pattern matches to pick 
the dtbs.

The only items that should appear in KERNEL_DEVICETREE are dtbs that are 
in the upstream kernel (latest and greatest).

Since the KERNEL_DEVICETREE_PREFIX covers what you are wanting to add, 
you do not need this change at all.

>   UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ba1a12a7fdb7..9902987abc34 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -11,6 +11,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am62x-lp-sk.dtb \
> +    ti/k3-am62-lp-sk-microtips-mf101hie-panel.dtbo \
>   "

In this case the KERNEL_DEVICETREE_PREFIX does not cover what you are 
adding, so you would need to change the PREFIX to:

KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62x-lp \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
"

>   SPL_BINARY = "tispl.bin_HS"
> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
> index 7dc234be671e..e0abad3e8f30 100644
> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
> @@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am654-base-board.dtb \
> +    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
>   "

Since the KERNEL_DEVICETREE_PREFIX covers what you are wanting to add, 
you do not need this change at all.


>   # On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

