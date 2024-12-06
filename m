Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E4FE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:56:51 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.38988.1733497010075241242
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 06:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mX6T8nar;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6Eun4b2373571
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 08:56:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733497009;
	bh=l+HuCUfvVe1rpG07ddZT7AM4nk4tqdjy0YTXMGf3CKQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mX6T8narwMbMknbKZzNS8FjeDs8UVkHJrBB6s37Ad/ie6JOknZ7JiGuruLPYx9NeS
	 kl3T797Yz3O1lTWl0waC/o8yW0rltgzqa8hDtM7rvI2xt865Clrknb5tFoE+9UvftC
	 kOmFkILoxi9f30/SgyqashVR17A3eQCj+ecMZGCQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6EunaK029781
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2024 08:56:49 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 08:56:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 08:56:48 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6EukLv033735;
	Fri, 6 Dec 2024 08:56:47 -0600
Message-ID: <379643c3-612f-4da3-8f0b-2d8f68934079@ti.com>
Date: Fri, 6 Dec 2024 20:26:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] am62p: PRNG: Remove
 software PRNG
To: Aashvij Shenai <a-shenai@ti.com>
CC: <praneeth@ti.com>, <kamlesh@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
References: <20241206053521.1126544-1-a-shenai@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241206053521.1126544-1-a-shenai@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Dec 2024 14:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18086

Hi,

Based on the convention, commit message title should be 
recipes-security: optee: Remove software PRNG in am62pxx

On 06/12/24 11:05, Aashvij Shenai wrote:
> With the latest TIFS fix [1], AM62P is able to leverage the hardware-TRNG
> instead of having to fallback into the software-PRNG.
>
> [1] - commit: 98de0a4290ec200cc224d4a5a6f42d2126230e2f ("ti-sysfw:
> am65x/am64x/am62x/am62ax/am62px: update to version v10.01.08")
>
> Repo: https://git.ti.com/git/processor-firmware/ti-linux-firmware.git
> Branch: ti-linux-firmware



This entire story could just have been,

[1]: 
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=98de0a4290ec200cc224d4a5a6f42d2126230e2f



>
> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
> ---
>
> Changelog:
> v1 -> v2:
>    - Updated commit message to include fix and moved test logs
>
> Testlogs: https://gist.github.com/AashvijShenai/9ea3e128ab29f703c2b6d988cfd0b82a
>
> ---
>
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 43b8ce1c..f131f1ff 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -6,7 +6,7 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
>   EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>   

