Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C422C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 15:44:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.199971.1673970280154056613
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 07:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ktxAe+cB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30HFid5b017282
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 09:44:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673970279;
	bh=4KYFCLdBjf1VcGEYygRScfX4N4AhC7WTFB0Q5h9x5PU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ktxAe+cBgZOtC/kw9LBt78guNHhojdgy72ScleP0jyQ0nh4GgDln0Y++8L0gVOeVY
	 TCHvlQIztyEtzLe5w26FTG6R0/qrdf0D70lBkJkWZbUziXD4HREzMW7CYYdzcIrliD
	 KUovxPqp01ygoORDumRhaRMWbV+ReXnkerARHJxU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30HFicg8090058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 09:44:38 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 09:44:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 09:44:38 -0600
Received: from [10.249.32.24] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30HFibwA076760;
	Tue, 17 Jan 2023 09:44:37 -0600
Message-ID: <4fb6933c-bc96-6440-c266-c95f59abeb98@ti.com>
Date: Tue, 17 Jan 2023 09:44:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [dunfell PATCH] optee-os: Enable SW PRNG for OP-TEE in AM62X
To: Dhruva Gole <d-gole@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>
References: <20230117061257.341041-1-d-gole@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230117061257.341041-1-d-gole@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 15:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15577

On 1/17/23 12:12 AM, Dhruva Gole wrote:
> commit 98506a4a07363 ("optee-os: Update SRCREV for OP-TEE TRNG in AM62X")
> 
> Disables SW PRNG => Enabling Hardware RNG. This is breaking Suspend Resume
> on AM62xx EVM variants. To fix this keep using SOFTWARE_PRNG enabled as
> it was.
> 
> Cc: vibhore@ti.com
> Cc: Andrew Davis <afd@ti.com>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---

Your subject tag is a bit off, I usually use:

--subject-prefix="meta-ti][dunfell][PATCH"

As for the patch, do we have any insight into why RNG use is causing
issues with suspend/resume? I'm not seeing any suspend/resume hooks
in the OPTEE RNG Linux driver, what all have you tried so far to
fix the issue (outside of just disabling support like here, which
should be a last resort).

Andrew

> 
> I haven't tested thoroughly using bitbake and built from scratch yet,
> however locally in my OPTEE Repo the command I run is
> ...
> make -j14 CROSS_COMPILE64=aarch64-none-linux-gnu- PLATFORM=k3-am62x
> CFG_ARM64_core=y CFG_TEE_CORE_LOG_LEVEL=1 CFG_TEE_CORE_DEBUG=y
> CFG_WITH_SOFTWARE_PRNG=y
> ...
> and this seems to get low power mode (suspend resume) functional for
> AM625 SK EVM that I am testing on.
> 
>   recipes-security/optee/optee-os_%.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index db9064deba27..83eb9c6a20c6 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -6,8 +6,8 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
>   
>   EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE_append_am62xx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE_append_am62axx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
>   do_compile_prepend_ti-soc() {

