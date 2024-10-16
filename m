Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09AAD2A558
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:51:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.32426.1729108276365577526
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 12:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VHzGr2s+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GJpF9d047928;
	Wed, 16 Oct 2024 14:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729108275;
	bh=SPXb33Umar8LIwoOkvQKwjmc1GaObXQ0zCJ+MBO/mOk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VHzGr2s+a/1xwah0AsfVBhC9yLHTvNBYZD2My8STpXhBb8aL/4ATxrYNXqWmounCO
	 01EFDkCzv5+fRFwrSyjAALtgzgTALsC7vzQQajo+Z84AbyfPmGlxtDscPFDP7qu5Um
	 IvyKrwgPN5iHIBONELCHbIYabHqPj++3kuG3fRJg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49GJpFpb006139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Oct 2024 14:51:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 14:51:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 14:51:14 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GJpE47108838;
	Wed, 16 Oct 2024 14:51:14 -0500
Message-ID: <1b233cb7-062d-42df-bbd7-fe00724c8ae6@ti.com>
Date: Wed, 16 Oct 2024 14:51:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: k3: use weak
 assignment for FIT image variables
To: Sergio Prado <sergio.prado@e-labworks.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <rogerio.borin@toradex.com>
References: <20241014202746.1818435-1-sergio.prado@e-labworks.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241014202746.1818435-1-sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Oct 2024 19:51:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18007



On 10/14/2024 3:27 PM, Sergio Prado wrote:
> Use weak assignment to make it possible to override the default
> value via classes parsed after the machine configuration file.
> 
> This is the case when using the tdxref-signed class from
> meta-toradex-security to generated signed images for AM6X.
> 
> Additionally, explicitly set FIT_SIGN_NUMBITS to 4096 to align with the
> default rsa4096 algorithm, preventing potential mismatches between the
> signing algorithm and key length.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> Signed-off-by: Rogerio Borin <rogerio.borin@toradex.com>
> ---
>   meta-ti-bsp/conf/machine/include/k3.inc | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index a296f64fa141..07f0bcb48bfc 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -26,10 +26,11 @@ UBOOT_SUFFIX = "img"
>   
>   UBOOT_SIGN_ENABLE = "1"
>   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
> -UBOOT_SIGN_KEYNAME ?= "custMpk"
> -UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
> -FIT_HASH_ALG ?= "sha512"
> -FIT_SIGN_ALG ?= "rsa4096"
> +UBOOT_SIGN_KEYNAME ??= "custMpk"
> +UBOOT_SIGN_KEYDIR ??= "${TI_SECURE_DEV_PKG}/keys"
> +FIT_HASH_ALG ??= "sha512"
> +FIT_SIGN_ALG ??= "rsa4096"
> +FIT_SIGN_NUMBITS ??= "4096"

These changes appear to break the build flow.  Since the the only real 
change is the addition of FIT_SIGN_NUMBITS, I'm going to assume that is 
the culprit.

Signature written to 
'<snip>/build/arago-tmp-default-glibc/work/am62axx_evm-oe-linux/u-boot-ti-staging/2024.04+git/build/fitImage-linux', 
node '/configurations/conf-ti_k3-v3link-imx219-0-2.dtbo/signature-1'
Public key written to 'u-boot.dtb', node '/signature/key-custMpk'
Signature check bad (error 1)
Verifying Hash Integrity for node 'conf-ti_k3-am62a7-sk.dtb'... 
sha256,rsa2048:custMpk-
  error!
Verification failed for '(null)' hash node in 'conf-ti_k3-am62a7-sk.dtb' 
config node
Failed to verify required signature 'key-custMpk'



>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18006): https://lists.yoctoproject.org/g/meta-ti/message/18006
> Mute This Topic: https://lists.yoctoproject.org/mt/109009846/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

