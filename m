Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC331C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 19:23:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.820.1651778596076808393
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 12:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vKcKXLnT;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 245JN8R4010915;
	Thu, 5 May 2022 14:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651778588;
	bh=X4sg1GnsSyvm4NqSGnVt26hfTIX2cRlfVn5i4isd388=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vKcKXLnTU/CwI0Hn5+dQ/krab64RyDZcdzvmwxSdg1vpXlW9K8WV4aYAVlSA9Hto0
	 99dQvnrk9SGdfJ3UEQQE296f91BPTcO1ziW1gUV5l66si9oovkPuzKJGP4RuIwc7us
	 PKg1mCd+jHMHazXCCuwxB43hieF8ytUMSRhLqgTY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 245JN8Pp027998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 May 2022 14:23:08 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 5
 May 2022 14:23:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 5 May 2022 14:23:08 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 245JN8Lb016289;
	Thu, 5 May 2022 14:23:08 -0500
Message-ID: <0048babd-1df7-5110-bae0-b0f179a7d813@ti.com>
Date: Thu, 5 May 2022 14:23:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [master][PATCH 1/5] am62xx, j721s2: move "gpu" machine
 feature from machine to soc config
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20220505174422.334666-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220505174422.334666-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 19:23:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14711


Series applied to master.


On 5/5/2022 12:44, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> In most cases machine features should be set in the corresponding SoC config
> to be applicable to different machine variants, like GP, HS or custom board.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/machine/am62xx-evm.conf    | 2 --
>   meta-ti-bsp/conf/machine/include/am62xx.inc | 2 +-
>   meta-ti-bsp/conf/machine/include/j721s2.inc | 2 ++
>   meta-ti-bsp/conf/machine/j721s2-evm.conf    | 2 --
>   4 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index 44f46d78..33b3294e 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -4,8 +4,6 @@
>   
>   require conf/machine/include/am62xx.inc
>   
> -MACHINE_FEATURES += "gpu"
> -
>   KERNEL_DEVICETREE = " \
>       ti/k3-am625-sk.dtb \
>       ti/k3-am625-sk-csi2-ov5640.dtb \
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
> index f3bde639..56cd7c20 100644
> --- a/meta-ti-bsp/conf/machine/include/am62xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
> @@ -1,7 +1,7 @@
>   require conf/machine/include/k3.inc
>   SOC_FAMILY:append = ":am62xx"
>   
> -MACHINE_FEATURES += "screen touchscreen"
> +MACHINE_FEATURES += "screen touchscreen gpu"
>   
>   SERIAL_CONSOLES = "115200;ttyS2"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
> index 113f86c4..06654179 100644
> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
> @@ -1,2 +1,4 @@
>   require conf/machine/include/j7.inc
>   SOC_FAMILY:append = ":j721s2"
> +
> +MACHINE_FEATURES += "gpu"
> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> index 5d977776..a2c15f74 100644
> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
> @@ -4,8 +4,6 @@
>   
>   require conf/machine/include/j721s2.inc
>   
> -MACHINE_FEATURES += "gpu"
> -
>   SERIAL_CONSOLES = "115200;ttyS10"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   TFA_K3_USART = "0x8"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14706): https://lists.yoctoproject.org/g/meta-ti/message/14706
> Mute This Topic: https://lists.yoctoproject.org/mt/90916827/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

