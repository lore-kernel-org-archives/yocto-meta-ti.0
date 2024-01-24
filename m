Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9E1C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 18:23:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.30650.1706120586452773631
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 10:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iB8Or3Z+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40OIN5va069327;
	Wed, 24 Jan 2024 12:23:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706120585;
	bh=m2VCEDw1OR2zJvFM7f7FCvGdfSVzLVQYa8dOuXnGLTg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iB8Or3Z+KyE9ZldTvGsS+bVRv3vfucHnxPJ5uzv8vpQIE/8J8wg0cCO5x5afV6ovl
	 yl4wtwyh5AnWTOj/Msfa+0/OmwaeiLYqYYyQLxJbbCu7IiSh1LVoBnyHXEdA+tDsBH
	 eBRj7Ng703SQuE0i7yPXoxv7KPPnoaA0q26upDeQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40OIN51J119451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jan 2024 12:23:05 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jan 2024 12:23:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jan 2024 12:23:04 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40OIN4vu087148;
	Wed, 24 Jan 2024 12:23:04 -0600
Message-ID: <483d270a-732d-4eca-b5eb-f510f4fc79f2@ti.com>
Date: Wed, 24 Jan 2024 12:23:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone] [PATCH] meta-ti-bsp: Add bootsplash image
 file for AM62P
To: Devarsh Thakkar <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <n-jain1@ti.com>
References: <20240124144617.327734-1-devarsht@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240124144617.327734-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jan 2024 18:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17413



On 1/24/2024 8:46 AM, Devarsh Thakkar wrote:
> Add TI logo image as bootsplash image file for AM62P and install it in
> boot directory from where u-boot can read from and display during
> boot-up time.

I'm going to send another patch that updates the u-boot mainline recipe 
to 2024.01 and move the logo code out of the .bb files and into the 
common .inc file.  Can you rebase this patch on that patch once I send 
it and make this a v2?  This will reduce the number of places that we 
need to maintain the logo install/deploy code.

I'll let you know once these changes are in place for you to rebase off of.


> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62pxx.inc           |  3 +++
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb    | 10 ++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> index bac68253..20e0771e 100644
> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> @@ -9,6 +9,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>   # Default tiboot3.bin on AM62Px is for HS-FS
>   IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
>   
> +# Bitmap image tarball for early splashscreen
> +IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
> +
>   TFA_BOARD = "lite"
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index 4fe1218a..c98cbe61 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -17,3 +17,13 @@ do_deploy:append:am62xx() {
>   	install -d ${DEPLOYDIR}
>   	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
>   }
> +
> +do_install:append:am62pxx() {
> +	install -d ${D}/boot
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> +}
> +
> +do_deploy:append:am62pxx() {
> +	install -d ${DEPLOYDIR}
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> +}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

