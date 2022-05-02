Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5184BC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 18:01:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.578.1651514490736900087
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XVovE6sR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242I1T2u130053;
	Mon, 2 May 2022 13:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651514489;
	bh=+Jm7Zi8lz6W5OaUsVVDY6KDKhLvtQjUO20g9KycY1/g=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=XVovE6sRlrMaMdy5eGRVF4tV5y60nl58baQxbHcGOkSIzsNcDaloaBuirBzG5XZ+i
	 Nu4xQAFyZr0IE2/YVRAc5ordJ/XtxnRzIDPQRnObrGz/ADlESxDwnHqgIMt+yQUrgM
	 lMOwD20WPbNj9qHYME/hAMr078F5f6ujcwG/YehU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242I1TRV101623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 13:01:29 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 13:01:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 13:01:29 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242I1SwP025352;
	Mon, 2 May 2022 13:01:28 -0500
Message-ID: <96c448d0-bbc4-61a2-3b2b-ef028873e372@ti.com>
Date: Mon, 2 May 2022 13:01:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [PATCH] cmem-mod: Fix kernel module packaging for
 usrmerge
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20220501165828.2831061-1-raj.khem@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220501165828.2831061-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 18:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14673


Patch applied to master.


On 5/1/2022 11:58, Khem Raj wrote:
> ERROR: cmem-mod-4.20.00.01+gitAUTOINC+86269258a4-0a do_package: QA Issue: cmem-mod: Files/directories were installed but not shipped in any package:
>    /lib/modules/5.10.100-g4a12bec7d3/extra/cmemk.ko
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb b/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
> index f7965593..ea2cc5f4 100644
> --- a/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cmem/cmem-mod_git.bb
> @@ -8,7 +8,7 @@ PR = "${MACHINE_KERNEL_PR}"
>   
>   inherit module
>   
> -EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'
> +EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra"'
>   MAKE_TARGETS = "module"
>   
>   KERNEL_MODULE_AUTOLOAD += "cmemk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14639): https://lists.yoctoproject.org/g/meta-ti/message/14639
> Mute This Topic: https://lists.yoctoproject.org/mt/90818354/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

