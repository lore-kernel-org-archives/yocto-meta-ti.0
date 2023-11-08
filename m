Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15CAC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:44:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.15500.1699454639065202387
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 06:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DKU0aTLY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8EhvKx062222;
	Wed, 8 Nov 2023 08:43:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699454637;
	bh=xfxZ4E+3J8L0BiWCHIahtF3IRsbJts9y51nW9tuRQ0A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DKU0aTLY9HtGsLb0mzEFnln8TjlMdyLRr5EJYwlLDc/cmL/Atkty0pY95StBksFVP
	 mGcXwiw+tlihCM5hmQdi/1hlZh5wu4gSER1eafLqlJ6HixFDRl2nMoHZfzLN9pMDFv
	 3MXPmcqWXuS/R0vUGhYhRyz0qfJmGOT9guSXhw/E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8Ehvol097372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 08:43:57 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 08:43:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 08:43:57 -0600
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8EhvLJ000313;
	Wed, 8 Nov 2023 08:43:57 -0600
Message-ID: <9b081e68-3412-49cc-9477-e3dcc6ce497e@ti.com>
Date: Wed, 8 Nov 2023 08:43:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] optee-os: Enable OP-TEE TRNG in AM62X and AM62PX
Content-Language: en-US
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
        <afd@ti.com>, <m-chawdhry@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231106-enable-trng-v3-1-e93d7d41ccd4@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231106-enable-trng-v3-1-e93d7d41ccd4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 14:44:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17271



On 11/8/2023 8:35 AM, Kamlesh Gurudasani wrote:
> Enable TRNG in AM62X and AM62PX, as bugs related to TRNG has been fixed now.
> 
> TF-A fix:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759
> 
> OP-TEE fix:
> https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
> Changes in V3:
> -updated commit title and message
> 
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

You missed my request on the first patch:

When you send the V2 series, can you base the commit off of the 
kirkstone-wip branch.  I have applied some changes to the file you are 
changing above (renamed it in this case) so your patch would not apply 
currently.  Thanks.


Right now I cannot apply this patch as I have already accepted the 
renaming patches into the next branch and it is staged for prod release 
as soon as CICD passes.

Please rebase your patch on the kirkstone-wip branch and move your 
changes to the optee-os-ti-overrides.inc file.




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

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

