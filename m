Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF80C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:38:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14218.1700516281197196826
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 13:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oCmh48k/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AKLbxsY053248;
	Mon, 20 Nov 2023 15:37:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700516279;
	bh=5RyWlnQFZewElBL9EiSxI9je4iRcq5aago8szMopSis=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oCmh48k/ZoE34CM8szKFj+4dtQZazn+Btc8C9mdkwNB1T7JvHp6Nx/K9M+/gFsa5h
	 ElsHr8u0suLb/LIR3b3T66zTPIfzcu+aB3pKdYMPr6dG9/MLP14ZiGXN3jS0SPsfqf
	 RXbiOuRTqFMSP2GkxIXATV1cxv9LV0ErtEJvVCb0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AKLbxpt110084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Nov 2023 15:37:59 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 Nov 2023 15:37:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 Nov 2023 15:37:59 -0600
Received: from [10.247.22.64] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AKLbx6r028327;
	Mon, 20 Nov 2023 15:37:59 -0600
Message-ID: <811b2bf0-4723-403b-8763-98558002daa6@ti.com>
Date: Mon, 20 Nov 2023 15:37:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] optee-os: Enable OP-TEE TRNG in AM62X
Content-Language: en-US
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231108-wip-enable-trng-v5-1-3cf3e216a4fc@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231108-wip-enable-trng-v5-1-3cf3e216a4fc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Nov 2023 21:38:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17317



On 11/19/2023 11:11 PM, Kamlesh Gurudasani wrote:
> Enable TRNG in AM62X, as bugs related to TRNG has been fixed now.
> 
> TF-A fix:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759
> 
> OP-TEE fix:
> https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
> Changes in V5:
> -drop changes for AM62px due to boot failure

Is there a rootcause analysis for 62p?


> 
> Changes in V4:
> -rebase on kirkstone-wip
> 
> Changes in V3:
> -updated commit title and message
> 
> Changes in V2:
> -updated commit message
> -included changes for AM62p
> ---
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index b1846cad..62d6b4f9 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -3,7 +3,7 @@ inherit ti-secdev
>   
>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
> 
> ---
> base-commit: 63dd9c4e39c90c367293a77a76b74c099abc1015
> change-id: 20231108-wip-enable-trng-e93bf6831e47
> 
> Best regards,

