Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D621C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 06:41:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.52267.1656398478832445732
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 23:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sSJyRvoo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25S6fGVW077435;
	Tue, 28 Jun 2022 01:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656398476;
	bh=bPyeALUXcB7mJrqiUxOvih4KXG6GBoU6owlQ7kCksAM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sSJyRvoojEx8kuRDVwYjWhSKoVttqTvS9pdYp7yOLsiDOfwebA1K/1qoBqJkdXicw
	 4f9kbrnXs7tN2bUZzgGCrFraU/Svs3fRkArAmnhRQ8lQHq57g40e7GGfSWhwvlEwE+
	 3iZ1BdEzIhuqRcS6NeouOCCtz2G8JvQtLjQl4/UU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25S6fGIW044270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jun 2022 01:41:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 28
 Jun 2022 01:41:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 28 Jun 2022 01:41:15 -0500
Received: from [10.250.150.101] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25S6fDcM088823;
	Tue, 28 Jun 2022 01:41:13 -0500
Message-ID: <9d5eb1b1-37bf-97ec-e455-99a7cdf852a6@ti.com>
Date: Tue, 28 Jun 2022 12:11:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-ti][dunfell][PATCH] optee-os: Use software RNG on AM62x and
 J721s2
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220627204042.27706-1-afd@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220627204042.27706-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jun 2022 06:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14845



On 6/28/2022 2:10 AM, Andrew Davis via lists.yoctoproject.org wrote:
> The TRNG driver is not currently functional for these two platforms.
> Disable the TRNG driver until fixed.
> 
> Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   recipes-security/optee/optee-os_%.bbappend | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 16c10979..7fe5f26e 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -6,6 +6,10 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
>   
>   EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> +EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
> +EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
> +EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
> +
>   do_compile_prepend_ti-soc() {
>       export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>   }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14844): https://lists.yoctoproject.org/g/meta-ti/message/14844
> Mute This Topic: https://lists.yoctoproject.org/mt/92030864/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

