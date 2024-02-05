Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885E4C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:14:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.65300.1707146055754494907
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 07:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YU3IJ9L1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415FEEPD016694;
	Mon, 5 Feb 2024 09:14:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707146054;
	bh=Y3NzbzQrVyk0m69c4xSQb2qJwv6miITlgwImn5ZaedU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YU3IJ9L1x9k77bfdCVT9pkDNzi6tk3BJP8q4fJNYUpzQSp3Xeu7alfZ7EwVzGjQCQ
	 vSBKAl/6Plx8Ioe10Ygr2qUFbhRwBMd4gHqf+EhyRgrPUNrHZE1+eWejuNzWTCo0tM
	 FuxyiHrXHLaID0HZnmgcE0bq9NiMdrlIPbs4Lucg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415FEEV8035576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 09:14:14 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 09:14:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 09:14:14 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415FEDjb028119;
	Mon, 5 Feb 2024 09:14:14 -0600
Message-ID: <6c7d7efe-7816-48f1-808c-7f3e686de8a2@ti.com>
Date: Mon, 5 Feb 2024 09:14:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone] [PATCH v2] meta-ti-bsp: Add bootsplash
 image file for AM62P
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <c-shilwant@ti.com>
References: <20240203070525.1728676-1-devarsht@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240203070525.1728676-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Feb 2024 15:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17439



On 2/3/2024 1:05 AM, Devarsh Thakkar wrote:
> Add TI logo image as bootsplash image file for AM62P and install it in
> boot directory from where u-boot can read from and display during
> boot-up time.


Thank you for the rebase.  Was the config fragment that Chirag asked 
about ever sent to uboot to avoid an issue with the recipe in the 
processor-sdk?



> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: Rebase to updated uboot recipes
> ---
>   meta-ti-bsp/conf/machine/include/am62pxx.inc |  3 +++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 10 ++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> index bac68253..38e35851 100644
> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> @@ -17,3 +17,6 @@ OPTEEMACHINE = "k3-am62x"
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
>   
>   SERIAL_CONSOLES = "115200;ttyS2"
> +
> +# Bitmap image tarball for early splashscreen
> +IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 493c1c31..42ddf40f 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -341,4 +341,14 @@ do_deploy:append:am62xx() {
>   	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
>   }
>   
> +do_install:append:am62pxx() {
> +	install -d ${D}/boot
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> +}
> +
> +do_deploy:append:am62pxx() {
> +	install -d ${DEPLOYDIR}
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
> +}
> +
>   TOOLCHAIN = "gcc"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

