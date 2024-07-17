Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B673CC3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:41:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.15390.1721223702720541157
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 06:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qHRt5po8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HDfgit021884
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 08:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721223702;
	bh=mPVhDCUMpJow4YPYJAgmLwcfkpJi1Xc9va1FtxicfXA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qHRt5po8BNwibQLyy9pnFMQuY+u+5wsMoBEEP6/rpObdnemMlPo8J8e/S+rPqTUVR
	 6MGDd7PssBVZsaBxTdslzMfx/W2emXsJcHXwdpthfVxOH/H9v/Br0ShyQEbdr9K/V4
	 DLCeQDa8IMWbWTJZDYarZTDbQrNOT3OMmnlbWzaA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HDfgAR071611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 08:41:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 08:41:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 08:41:41 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HDffKQ019622;
	Wed, 17 Jul 2024 08:41:41 -0500
Message-ID: <def67aa5-9757-486c-b474-4d7372f8efd3@ti.com>
Date: Wed, 17 Jul 2024 08:41:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 3/3] meta-ti-bsp: j742s2: add
 Rogue GPU driver to machine definition
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, <n-francis@ti.com>, <u-kumar1@ti.com>,
        <detheridge@ti.com>
References: <20240717133614.787998-1-a-limaye@ti.com>
 <20240717133614.787998-4-a-limaye@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240717133614.787998-4-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 13:41:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17877



On 7/17/2024 8:36 AM, Aniket Limaye wrote:
> Add ti-img-rogue-driver as the preferred provider and enable the gpu
> driver in the image.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/j742s2.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
> index 41f3a73d..60d91f16 100644
> --- a/meta-ti-bsp/conf/machine/include/j742s2.inc
> +++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
> @@ -4,7 +4,7 @@ SOC_FAMILY:append = ":j742s2"
>   MACHINE_FEATURES += "screen gpu"
>   
>   require conf/machine/include/mesa-pvr.inc
> -PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"

NAK.  With the new BSP support this should be:

PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"


>   # Default tiboot3.bin on J742S2 is for HS-FS
>   IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

