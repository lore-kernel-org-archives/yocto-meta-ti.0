Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7C1C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:50:11 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.121558.1669650608072993078
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 07:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jn7gnEL5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ASFo6LP104253;
	Mon, 28 Nov 2022 09:50:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669650606;
	bh=jllV9v9qK/MSKPo0ojEH8vMlzuJT790Q3JUjLXj/IIg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jn7gnEL5XZgPWsvDZglvvB3Qf78B2Lgmd7HbxzUxBJ2anNlcT6tuyEpREWF+jqeKf
	 uj9RTTyYzDOQBz1wyhoPc77U/G0gMMLz00OFh5r0PpWRUY42nHoFt9pIfMevQST2S/
	 VArDhYlpFGHzOCiVZAebmvgl7al+owxB2hsBDCPM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ASFo6RY127184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Nov 2022 09:50:06 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 28
 Nov 2022 09:50:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 28 Nov 2022 09:50:06 -0600
Received: from [10.250.38.44] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ASFo6hl063574;
	Mon, 28 Nov 2022 09:50:06 -0600
Message-ID: <61768633-fb6e-4aab-fa78-d222a4eb22a0@ti.com>
Date: Mon, 28 Nov 2022 09:50:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell PATCH] optee-os: Update SRCREV for OP-TEE TRNG
 in AM62X
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <kamlesh@ti.com>, <jm@ti.com>
References: <20221128054627.131772-1-j-choudhary@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221128054627.131772-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Nov 2022 15:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15371

On 11/27/22 11:46 PM, Jayesh Choudhary wrote:
> From: Kamlesh Gurudasani <kamlesh@ti.com>
> 
> Update the SRCREV to the commit when trng support was
> added in upstream OP-TEE for am62x platform to access rng.
> 
> Also, enable trng support as trng support is added now in OP-TEE
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Looks good, same is needed for kirkstone/master branches.

Acked-by: Andrew Davis <afd@ti.com>

> ---
> 
> HS-UART-logs:
> http://serenity.dal.design.ti.com:7777/habajarafo.yaml
> 
> GP-DFU-logs:
> http://serenity.dal.design.ti.com:7777/atejarexak.yaml
> 
>   recipes-security/optee/optee-os_%.bbappend | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 2b591d58..751dc3d0 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,14 +1,11 @@
>   PV_ti-soc = "3.19.0+git${SRCPV}"
> -SRCREV_ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
> +SRCREV_ti-soc = "d6c5d0037b46f46caf71d67d7825d4b722cbcddf"
>   SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"
>   
>   EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> -
>   do_compile_prepend_ti-soc() {
>       export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>   }

