Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B45BC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 22:16:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1202.1670624204028941796
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 14:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nvLDnMSV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B9MGgCd026116;
	Fri, 9 Dec 2022 16:16:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670624202;
	bh=MmFu5NFPsoYZ/P0fNxxVxiDZfK+MVisVU7BI5mOCpv0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nvLDnMSVHu2erq2MlkNnL61W1lkcoRKhvyES3HIbvLAjkEM0KgjRgq6Z6yg10X1bJ
	 vnvrtA3xopyM74cfTROPDS02atBt6pCD/R0lOqieBPeirGCRhAYxBJjuJ42SnyDjK1
	 sVKCx+elbzK9dq6fH7aJ7rUNu+rkGLZdJZu9HIwg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B9MGgPu020238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Dec 2022 16:16:42 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 9
 Dec 2022 16:16:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 9 Dec 2022 16:16:42 -0600
Received: from [10.247.24.212] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B9MGg0q106889;
	Fri, 9 Dec 2022 16:16:42 -0600
Message-ID: <ad9c4cbb-b198-23d2-8c0a-7f7744e780bc@ti.com>
Date: Fri, 9 Dec 2022 16:16:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][dunfell][PATCH] optee-os: Revert to lower log level for
 AM62x
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <jm@ti.com>,
        <j-choudhary@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <c-shilwant@ti.com>
References: <20221209143513.6428-1-kamlesh@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20221209143513.6428-1-kamlesh@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Dec 2022 22:16:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15438



On 12/9/2022 8:35 AM, Kamlesh Gurudasani wrote:
> While removing SOFTWARE_PRNG support
> commit:98506a4a07363a1b57012ccfaee263f47e5b46c4,
> accidently removed the changes applied
> by commit:27641e1f2d7f6696fd7bbd8f24fcac20766b6234
> (optee-os: Lower log level for AM62x).
> 
> Reverting those changes back
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   recipes-security/optee/optee-os_%.bbappend | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 751dc3d0..6ea0773f 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -6,6 +6,9 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
>   
>   EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> +EXTRA_OEMAKE_append_am62xx-evm = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE_append_am62xx-lp-evm = " CFG_TEE_CORE_LOG_LEVEL=1"

you might want to add a follow on similar patch once am62axx support is 
pulled in to dunfell.


> +
>   do_compile_prepend_ti-soc() {
>       export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>   }

