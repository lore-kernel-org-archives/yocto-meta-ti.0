Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B70E77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 09:41:01 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.97280.1733737250995835007
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 01:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vOFGhrS7;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B99eoi22490526
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 03:40:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733737250;
	bh=KB67dbf6AIh4G/HVxYE4+lgM+d2wUj5VeSH5nMyfvvA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vOFGhrS7qcR76gMKEoZqPboviFVIKSjG2UndFblVJE84AQ6pxczzSAzLaGr991Ozw
	 MDR0kQulQ03ScXTakLo8cMW0JHfbyYm0UnIkv43GEGRwkq6ugYz1BYRvPNLUMlcNr3
	 7pKixoXzcthqZ8CxLqUrx2wCORnv7+m/3cRaeICo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B99eoXo083455
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 03:40:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 03:40:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 03:40:49 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B99elq3084827;
	Mon, 9 Dec 2024 03:40:48 -0600
Message-ID: <ae4735ca-8f95-4537-8e9b-acaaa4b1d860@ti.com>
Date: Mon, 9 Dec 2024 15:10:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] recipes-security: optee:
 Remove softare PRNG for am62pxx
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <kamlesh@ti.com>, Aashvij Shenai <a-shenai@ti.com>,
        <reatmon@ti.com>
References: <20241209084531.1412473-1-a-shenai@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241209084531.1412473-1-a-shenai@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 09:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18095

Hi,

s/softare/software in commit message title


On 09/12/24 14:15, Aashvij Shenai wrote:
> With the latest TIFS fix [1], AM62P is able to leverage the hardware-TRNG
> instead of having to fallback into the software-PRNG.
>
> Backgroud:


s/Backgroud/Background


--
Chirag


> The default priv-id for A53 cores in SYSFW for AM62P was chosen to be 4
> while the other K3 SOCs were configured at 1. Any firewall TISCI API
> call that used 1 would not be able to run on AM62P. The TIFS fix changes
> the AM62P value from 4 to 1.
>
> [1] -
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=98de0a4290ec200cc224d4a5a6f42d2126230e2f
>
> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
> ---
>
> Changelog:
> v2 -> v3:
>    - Updated commit message to give background and branch link
>    - Updated commit title to conform to standard
>    
> v1 -> v2:
>    - Updated commit message to include fix and moved test logs
>
> Testlogs: https://gist.github.com/AashvijShenai/9ea3e128ab29f703c2b6d988cfd0b82a
>
> ---
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

