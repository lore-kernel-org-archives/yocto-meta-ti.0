Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69049C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 09:05:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9661.1699434351767542407
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 01:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P/gv6s3b;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A895oWi091466;
	Wed, 8 Nov 2023 03:05:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699434350;
	bh=0UlaEsqdSD2IV5+3YuoDfXdgTI+ocQUH7JcCUPPzsjs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P/gv6s3baQgwJj5Jm7Jb2WElwtiYdRSTYYxcFdGNdTy19+4mSpo6LbZ4zgb0r1JxD
	 rDH5LEm/LlmLHqdp/YvS/09FHDdJ8dU17wlZKq+uCakFu0LNeiOVKNtjXnvHN36OYI
	 T12ttpGjjhF3DePiGrmoxTO8VkZbuDqUDJzJIoyg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A895oTc127039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 03:05:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 03:05:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 03:05:50 -0600
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A895kcb035498;
	Wed, 8 Nov 2023 03:05:47 -0600
Message-ID: <81e5c4c5-271d-4d8b-bb61-dbb7af9d5f5d@ti.com>
Date: Wed, 8 Nov 2023 14:35:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [PATCH v2] optee-os: Enable OP-TEE TRNG in
 AM62X
Content-Language: en-US
To: <kamlesh@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231106-enable-trng-v2-1-25ed49b7d8c9@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231106-enable-trng-v2-1-25ed49b7d8c9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 09:05:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17269


On 08/11/23 13:19, Gurudasani, Kamlesh via lists.yoctoproject.org wrote:
> Enable TRNG in AM62X, as bugs related to TRNG has been fixed now.

Commits title & description should convey that it also enables TRNG 
support for AM62PX.

>
> TF-A fix:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759
>
> OPTEE fix:
> https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773
>
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
> Changes in V2:
> -updated commit message
> -included changes for AM62p
> ---
>   meta-ti-bsp/recipes-security/optee/optee-os-ti.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> index 91b66a36..435efced 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
> @@ -6,8 +6,8 @@ inherit ti-secdev
>   
>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
>   do_compile:append:k3() {
>
> ---
> base-commit: d5e768e29b3f8091cbdedb702ff4185f73af4f3d
> change-id: 20231106-enable-trng-e56f79d668e8
>
> Best regards,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17268): https://lists.yoctoproject.org/g/meta-ti/message/17268
> Mute This Topic: https://lists.yoctoproject.org/mt/102459923/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

