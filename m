Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BEC3DA60
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 19:21:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1688.1721244088539581079
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 12:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ewkZRHYR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HJLRHT109392;
	Wed, 17 Jul 2024 14:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721244087;
	bh=SoaWW6gF2+SlhYHtl6MPD29MIxA2ylcCj2NU7Wd9Ybc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ewkZRHYRXQaWO1LNgOF+51z7WyFAjbwq50cCiT883Fukzj5SxLv0aeoX7h+QDl/mz
	 frozdK55V7TjtWbVr0vHJKRJizIoNalpFgrNQbo6OYhmbrQpA6hzWhsfWSQMFgX12U
	 mWIwjVhE65i5ZmmBKrDalH6LqqIfLH+SuUrS401g=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HJLR8x087525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 14:21:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 14:21:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 14:21:26 -0500
Received: from [10.249.34.79] ([10.249.34.79])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HJLQvd034371;
	Wed, 17 Jul 2024 14:21:26 -0500
Message-ID: <472d4869-657d-4441-8fb1-a7d762f5a1a5@ti.com>
Date: Wed, 17 Jul 2024 14:21:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] linux: Fix assignment SRC_URI for
 patches
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <17E30F4C65D33828.32717@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E30F4C65D33828.32717@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 19:21:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17879


Need to fix subject.  v2 incoming.

On 7/17/2024 12:11 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Testing shows that the SRC_URI += does not work for adding the new
> patches.  += takes place during parsing, we want :append instead to make
> sure that no matter what SRC_URI is in the various kernel recipes, that
> we we append the patches to the end.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> index 43d2341a..f24fbe51 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> @@ -13,7 +13,7 @@ EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
>   KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
>   KERNEL_DTBVENDORED = "1"
>   
> -SRC_URI += " \
> +SRC_URI:append = " \
>   file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
>   file://0001-vt-conmakehash-improve-reproducibility.patch \
>   file://0001-pnmtologo-use-relocatable-file-name.patch \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17878): https://lists.yoctoproject.org/g/meta-ti/message/17878
> Mute This Topic: https://lists.yoctoproject.org/mt/107402023/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

