Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5649DC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:04:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.56125.1699283076257714942
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 07:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bT76g5xc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A6F4YmX065620;
	Mon, 6 Nov 2023 09:04:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699283074;
	bh=1/eSVXx8zaxD6I6fvAMWHZ8Y/A8jxZatBGdgEbsXrNo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bT76g5xcfFkVlqD53zLgfteBz0ZorZY+xWk5KiIgfyHj0RFFuACjB2v3jbiMj45cs
	 fWo/Jrt6PD0scyplATrWfDuKOEAXZr2WkTEyDxHbvIAg9xpyXduh62C9getV1wNCG8
	 5JJMhN74S5xS0dFxzAJvWzGoxfXMiYa/tHzBzf4c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A6F4YfZ007168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Nov 2023 09:04:34 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Nov 2023 09:04:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Nov 2023 09:04:34 -0600
Received: from [10.247.22.64] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A6F4X2Y112527;
	Mon, 6 Nov 2023 09:04:33 -0600
Message-ID: <b4ec0bc6-7f32-4ae2-bac2-e3339557ecaf@ti.com>
Date: Mon, 6 Nov 2023 09:04:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] optee-os: Enable OP-TEE TRNG in AM62X
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231106-enable-trng-v1-1-59cb0b4f9bcb@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231106-enable-trng-v1-1-59cb0b4f9bcb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Nov 2023 15:04:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17249



On 11/6/2023 5:25 AM, Kamlesh Gurudasani wrote:
> Enable TRNG in AM62X, as bugs related to TRNG has been fixed now.

Can you provide more details on what fixed TRNG ? Assuming its something 
specific inside OPTEE 4.0 version.


> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>   meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> index 91b66a36..d1c15cb2 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> @@ -6,7 +6,7 @@ inherit ti-secdev
>   
>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"

How about doing the same for am62p ?


>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
> 
> ---
> base-commit: d5e768e29b3f8091cbdedb702ff4185f73af4f3d
> change-id: 20231106-enable-trng-e56f79d668e8
> 
> Best regards,

