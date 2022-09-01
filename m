Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205A5ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 18:56:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16497.1662058615096873810
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 11:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=B5O8hkIy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 281Iuqkb086464;
	Thu, 1 Sep 2022 13:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662058612;
	bh=U5Iu222y1kORdhnmLXUV9px/tuleUEe1RYwtiFtO8Og=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=B5O8hkIyuMDt4evXMZwPStlVhkpSW0pMbe138Z3tS9m6LqRsbLkqBVrFDSqY90/N8
	 lGFFkshy6a+YUQ4P0a0+nCMAArJj7R1AvsSdV9FOad5HI8gB9GoK2NJLbscBEeT9T5
	 ky42FwxIToAUnDVjQeIRO1E0ubdFx7cQkB0kocak=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 281IuqVM030823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Sep 2022 13:56:52 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 1 Sep
 2022 13:56:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 1 Sep 2022 13:56:52 -0500
Received: from [10.250.34.212] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 281IupZS016185;
	Thu, 1 Sep 2022 13:56:51 -0500
Message-ID: <f71a1fe4-92e3-0e82-e2bd-07b5a32fd86a@ti.com>
Date: Thu, 1 Sep 2022 13:56:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 2/2] optee-os: Lower log level for AM62x
Content-Language: en-US
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Anand Gadiyar <gadiyar@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220826191641.31116-1-afd@ti.com>
 <20220826191641.31116-2-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220826191641.31116-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Sep 2022 18:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14989

On 8/26/22 2:16 PM, Andrew Davis wrote:
> During resume from low power mode suspend OP-TEE prints some messages
> on the UART. It seems this UART is not powered at this point in the
> sequence breaking suspend/resume. We should track down the exact
> prints and quiet them. Until we get that fix upstream, lets lower
> the log level for this platform to unblock the LPM work.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   recipes-security/optee/optee-os_%.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 4081b324..3cda8559 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -6,7 +6,7 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
>   
>   EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
> +EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"


ping.

Looks like there is now a merge conflict for this, easy enough to
fix, add CFG_TEE_CORE_LOG_LEVEL=1 to the new am62xx-lp-evm also.

If you want me to re-send let me know.

Andrew


>   EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
>   EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
>   

