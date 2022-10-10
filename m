Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE57C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 14:26:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.6862.1665411995502329789
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 07:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ibBatwc7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AEQYHT111346
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665411994;
	bh=bQ+DXwQANA9roJQ/bOJgxsEMRxE81ZQwV1frNsgXECg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ibBatwc71FQjx6HcsE37wDiFJELiOyv7Gg9OMoLdcIaEgJP5qoTdkgwbggAKeftAe
	 yPPAah8vBgXTuAG3yNPSb8ZxfjGaT4QHI/b5JAF/eLAPEsARj8mIXjm0QlanzgvEED
	 5p2Lk8dlIYR4JvaRCGa9uPW9EdxIzVpaKP93G0Nw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AEQYDl019465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:26:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 09:26:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 09:26:34 -0500
Received: from [10.250.35.37] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AEQYne029531;
	Mon, 10 Oct 2022 09:26:34 -0500
Message-ID: <d013d36b-adff-f4c1-7aea-e3ab3fe76e83@ti.com>
Date: Mon, 10 Oct 2022 09:26:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][dunfell PATCH 3/4] conf: machine: j721s2: Add OP-TEE
 flavour
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <reatmon@ti.com>
References: <20221010134649.20977-1-j-choudhary@ti.com>
 <20221010134649.20977-4-j-choudhary@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221010134649.20977-4-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 14:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15123

On 10/10/22 8:46 AM, Jayesh Choudhary wrote:
> Add the new OP-TEE flavour for J721S2 instead of default k3-j721e.
> The TI-SCI ID for MCU domain sa2ul/sa3ul are not the same for
> J721E and J721S2. So a new flavour is added in upstream OP-TEE.
> 

You are not really adding a new flavor for J721S2 but rather
re-using J784s4 as they both use SA3UL. Would be better to
add a different commit message here to make that clear.

Otherwise the series LGTM,

Acked-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   conf/machine/j721s2-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index ba5e8def..ec9b7454 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -9,6 +9,7 @@ MACHINE_FEATURES += "gpu"
>   SERIAL_CONSOLES = "115200;ttyS10"
>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   TFA_K3_USART = "0x8"
> +OPTEEMACHINE = "k3-j784s4"
>   OPTEE_K3_USART = "0x8"
>   
>   KERNEL_DEVICETREE = " \

