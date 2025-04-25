Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD62C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 21:32:02 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2009.1745616716843017524
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 14:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CbvyhWnQ;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLVsVd2283936
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745616714;
	bh=+SgoD/24mro9olcPjWty2sKP6SdZbwBkJ9XEA9wiOaQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CbvyhWnQbPKGiK2cEfWlAcb5yAEcrCcmKCXPdWtfbjPjZuYUT+Xy5EZOJMMfkxV1M
	 7a8UmUqurw+yp4D7NnD4knPMfz23En4APv/HKEZpMvgIJNeKWW8bNa40l2LVXmhqrd
	 WRaQExhPJOKtMkIJwrJ27xbHUCbO3hvQk32bTvn4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLVsRl086890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:31:54 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:31:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:31:53 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLVrxB116612;
	Fri, 25 Apr 2025 16:31:53 -0500
Message-ID: <a54ddd34-e987-4c37-a234-ca94e2d7afe2@ti.com>
Date: Fri, 25 Apr 2025 16:31:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Fix
 PACKAGECONFIG[dm] arguments
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Neha
	<n-francis@ti.com>
References: <20250425204857.3271868-1-c-shilwant@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250425204857.3271868-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 21:32:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18512

On 4/25/25 3:48 PM, Chirag Shilwant wrote:
> * As observed in the u-boot makefile [0][1], the argument
> anticipated by u-boot binman is "TI_DM" instead of "DM".
> Hence, fix the same in meta-ti-bsp.
> 
> * The behavior went unnoticed until now because "ti-dm"
> was still being sourced from BINMAN_INDIRS, which referred
> to "ti-linux-firmware" and the PACKAGECONFIG[dm] feature
> was redundant.
> 
> [0]: https://github.com/u-boot/u-boot/blob/v2025.01/Makefile#L1408
> 
> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2025.01#n1409
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 9a74b840..e337f84f 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -63,7 +63,7 @@ PLAT_SFX:am62pxx = "am62pxx"
>   PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>   PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
>   PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
> -PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
> +PACKAGECONFIG[dm] = "TI_DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
>   
>   PACKAGECONFIG:append:aarch64 = " atf optee"
>   PACKAGECONFIG:append:j721e = " dm"

