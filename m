Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811A1CD4845
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 16:19:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1835.1695399545514953930
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 09:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cUdeLLs3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38MGJ2br078261;
	Fri, 22 Sep 2023 11:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695399542;
	bh=lPu5E9lk394KrP8LDMKcHiOtwBBPJDQHjRoNJHAWFEs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cUdeLLs3w6SE80hZXRA3KynimOQSfpWar3azMEkz+CBxGrAK0tRuTVjz5TAmBP08h
	 3v5XrTEVQjZCYoXp+KpAqTmF2oropWbALIRXHw5yyWEXuY2VkkXWQiLN4AAlfm3eAX
	 iJuzGNqa5NK0XfKCzbg0bBbAbzc1cDS646Av+2nw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38MGJ2mB019497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Sep 2023 11:19:02 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Sep 2023 11:19:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Sep 2023 11:19:01 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38MGJ1D2026443;
	Fri, 22 Sep 2023 11:19:01 -0500
Message-ID: <466762cf-f461-9110-0e68-90699860eb54@ti.com>
Date: Fri, 22 Sep 2023 11:19:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [meta-ti] [master|kirkstone][PATCH 2/2] mesa-pvr: remove auto
 configurations for sgx driver
Content-Language: en-US
To: <anandb@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <s-adivi@ti.com>, <praneeth@ti.com>, <rs@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <denis@denix.org>
References: <20230921124848.3663826-1-anandb@ti.com>
 <20230921124848.3663826-3-anandb@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230921124848.3663826-3-anandb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Sep 2023 16:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17010

On 9/21/23 7:48 AM, Anand Balagopalakrishnan via lists.yoctoproject.org wrote:
> mesa-pvr should be dependent on user mode libraries and not the kernel mode
> driver. 

While true, this patch doesn't do this. Currently the mesa-pvr is not dependent
on either the user nor kernel mode driver. And you didn't add the user mode
dependency here.

> Remove auto configurations in mesa-pvr when gpudriver is set to sgx
> kernel mode driver.
> 

Why? You will need this later.

Andrew

> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> index 0de3cb94..d8c438ff 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> @@ -25,12 +25,10 @@ SRCREV = "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
>   
>   PACKAGECONFIG:append = " \
>       ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
> -    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
>   "
>   
>   PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
>   PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
> -PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
>   
>   PACKAGECONFIG:remove = "video-codecs"
>   PACKAGECONFIG[video-codecs] = ""
> @@ -42,7 +40,6 @@ PACKAGECONFIG[xvmc] = ""
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
>   
>   VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17002): https://lists.yoctoproject.org/g/meta-ti/message/17002
> Mute This Topic: https://lists.yoctoproject.org/mt/101499136/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

