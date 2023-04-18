Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769C1C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:07:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.20124.1681848467363464257
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 13:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BnEa6DPG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33IK7hLA115628;
	Tue, 18 Apr 2023 15:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681848463;
	bh=1rDBM7VKLCPMEKSNjNYr/7EZWz9pPibyFDnE9DFZiuw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BnEa6DPGXIszQV26kiW3uiQhRsNJzndKYYvTi7wu1bspr1u3LwASM9WUG9phAc4dg
	 UyQ2k22l8iBT2I302JYYFzL3nNqZdGauLS6EJ/B7QH+USy9mkFt1lzK8d3qvDls9DY
	 TTTedQm37JGra78X0MdaAkkhEU94HORWkmSHtX7k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33IK7hTV054463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Apr 2023 15:07:43 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 18
 Apr 2023 15:07:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 18 Apr 2023 15:07:43 -0500
Received: from [10.250.33.87] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33IK7gEV022493;
	Tue, 18 Apr 2023 15:07:42 -0500
Message-ID: <34d1b4dc-98b9-50ee-bd28-0d8151042000@ti.com>
Date: Tue, 18 Apr 2023 15:07:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti] [master/kirkstone][PATCH] meta-ti-bsp: add mesa to
 SIGGEN_EXCLUDERECIPES_ABISAFE list
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230418200217.301038-1-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230418200217.301038-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 20:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16412

On 4/18/23 3:02 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> For TI platforms with SGX and Rogue graphics we patch upstream Mesa with
> PVR support and conditionally enable features based on virtual/gpudriver
> preference. This makes Mesa package platform-specific and it contains the
> corresponding PACKAGE_ARCH = "${MACHINE_ARCH}" line.
> 
> In order to get greater re-use from generic non-machine-speciofic packages

Typo: specific

Otherwise LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> down the dependency chain, such as Wayland, Weston, Qt5 modules, etc. we
> need to mark mesa recipe as still providing stable OpenGL ABIs, such as
> EGL, GLES, GBM, etc. - add it to SIGGEN_EXCLUDERECIPES_ABISAFE list.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/layer.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 948db4f9..e9b7f92c 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -19,6 +19,7 @@ LAYERDEPENDS_meta-ti-bsp = " \
>   "
>   
>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> +    mesa \
>   "
>   
>   HOSTTOOLS_NONFATAL += "truncate xxd comm"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16410): https://lists.yoctoproject.org/g/meta-ti/message/16410
> Mute This Topic: https://lists.yoctoproject.org/mt/98352641/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773410/xyzzy [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

