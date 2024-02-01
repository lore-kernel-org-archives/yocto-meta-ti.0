Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B07BC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:34:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9478.1706826851399409216
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 14:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fZtAx3qo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411MY93E117209;
	Thu, 1 Feb 2024 16:34:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706826850;
	bh=Y2Fwx5Sp2pw9vWz0DpCtuAlxV9wJG38aECNzqmVXd7k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fZtAx3qoFJzREylmL7f2Ydwt8K+p5wQ/O6Kn+BBxqsE0Retz7iv8QOOOK1gTwf5Rn
	 qfcJSrGsfAGL3ygaHekQryZcybgiM07+yKZzBT/3axjKzCuMktN4/KwhNGMKb8Q99X
	 8jUi6IGmIcbh4N03nbtOu5FTgyYBXZYalW74wCeQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411MY9FN076481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 16:34:09 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 16:34:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 16:34:09 -0600
Received: from [10.249.43.59] ([10.249.43.59])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411MWvN0083872;
	Thu, 1 Feb 2024 16:34:09 -0600
Message-ID: <4c11b4f6-20af-4adf-8858-2d40b7d99a01@ti.com>
Date: Thu, 1 Feb 2024 16:34:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone/master][PATCH] mesa-pvr: bump srcrev and drop
 conditional logic
Content-Language: en-US
To: <rs@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240126190416.1368711-1-rs@ti.com>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20240126190416.1368711-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Feb 2024 22:34:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17435



On 1/26/2024 1:04 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump the SRCREV to include some useful patches that:
> 	- Fix the ROGUE segfault issue introduced by SGX (this was what
> 	  the old conditional logic was addressing)
> 	- Fix destruction of event queue with proxies still attached
> 
Working great with Chromium v111 that we are targeting - I tested on 
AM62P  (BXS-4-64 GPU)

Tested-by: Darren Etheridge <detheridge@ti.com>

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> index 554fadd3..5abd0793 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> @@ -28,11 +28,7 @@ PACKAGECONFIG:append = " \
>       ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
>   "
>   
> -# Temporary work around to use a different SRCREV for SGX Mesa, vs Rogue Mesa
> -# Idea is these two should be the same, but currently a segfault is happening
> -# on certain platforms if the sgx commit is used.
> -SRCREV = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', '7c9522a4147836064f582278e4f7115735c16868', '54fd9d7dea098b6f11c2a244b0c6763dc8c5690c', d)}"
> -PR = "sgxrgx${SRCPV}"
> +SRCREV = "1be98ba80452ebe38546a7fca26b5a70f2629083"
>   
>   PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
>   PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"

