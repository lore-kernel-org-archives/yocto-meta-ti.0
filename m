Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D71C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 20:51:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8859.1680123094802965493
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 13:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ISfNBqNL;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32TKpW9B053859;
	Wed, 29 Mar 2023 15:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680123092;
	bh=SLVvce4TGlZF01oOvT0oBnMeuE07AIE/8Nn5Qy4QVrg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ISfNBqNLsw2HTEooENmR9dqF3I/yNAvTZtCuDXXibxvOkymldDkC8NsuaJTGgz3dp
	 AexP+CYBj6cK8ga+9tx/zRmfxk0Q+EXrPrmPQT3iJUqNHyu65PYUkVSgXRk0Xe1bRZ
	 1CJNEGY6jSiNXlOfwpk//dPIpDU6NSgVVX/ofiIE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32TKpWG5058844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Mar 2023 15:51:32 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 29
 Mar 2023 15:51:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 29 Mar 2023 15:51:31 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32TKpVO8092612;
	Wed, 29 Mar 2023 15:51:31 -0500
Message-ID: <d6c238f3-fc0d-e721-32f5-7d41a99c8cea@ti.com>
Date: Wed, 29 Mar 2023 15:51:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] mesa/mesa-gl: remove version from
 bbappend file name
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>, <meta-ti@lists.yoctoproject.org>
References: <20230328025621.15198-1-kai.kang@windriver.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230328025621.15198-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Mar 2023 20:51:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16252

On 3/27/23 21:56, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Remove version from mesa/mesa-gl bbappend file names that no need to
> rename them when mesa update.
> 
> Issue: LINUXEXEC-26101
> 
> (LOCAL REV: NOT UPSTREAM) - Send to meta-ti on 20230328
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend}            | 0
>   .../recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} | 0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend} (100%)
>   rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16247): https://lists.yoctoproject.org/g/meta-ti/message/16247
> Mute This Topic: https://lists.yoctoproject.org/mt/97898091/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Yeah, alright. Here's why we didn't do that *yet*:

There's currently a handful of patches sitting outside of mesa for rogue 
devices. Some of them are fundamental (introducing the gallium-frontend 
shim), others are less important but are still relevant to features we 
are requested to have for the rogue devices.

The upstream-ability of these patches was only recently called into 
question so I'm trying my best to sort them out and get them upstream as 
soon as possible, if possible, but considering some of their *unique* 
approaches to improving performance that will take a little time to get 
it sorted out.

In the meantime we want to use those patches in yocto, and considering 
the way we receive them (tagged to a particular release), we need to 
update them and keep them clean rolling forward while we close the gap.

If you look at the source line in the include file you'll see our 
solution to this was to basically glob all 22.% releases and point them 
all at a branch in a public tree I want to use as an intermediary.

This was done to prevent other build issues with tools expecting 
particular features (like a specific extension of dma buffer feedback). 
Using this scheme, in the event of a major version drift it should 
default to software rendering.

It's a little scuffed, but this was the safest way I could think to add 
out of tree graphics without introducing stalls for any other component 
development. Moving forward I will attempt to track and update this 
recipe faster.

The only reason I wrote up this response instead of just forward porting 
the mesa patches and posting my own version of this patch changing the 
glob to 23.% is that moving forward I want to keep the graphics 
bbappends only applicable to major versions (while they exist). These 
will help keep backwards compatibility open for community multi-distro 
efforts (and better compatibility with tagged yocto releases, as they 
tend to park mesa after a little while).

Hopefully this is a little clearer now. Thanks for your interest!

Regards,
Randolph Sapp

