Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A763C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 15:51:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.987.1685461895560256959
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 08:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qgJ0sg3N;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UFpWXl111618;
	Tue, 30 May 2023 10:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685461892;
	bh=enBjqwgLoZrhE22SdwGb1bt/iy1cvRLo2ev0V2KoNNU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qgJ0sg3N1HlgSZk/03Bf3d7ySvO4BPav66ZJAX6RjLIpKT6c1/9fy4at7NgR240Fk
	 3O0FpJ304wfFJHRM0TE6RiNbBPJwakC4Inl8TPaetey1UA8jrULpW83ySS8NmiqYG7
	 sMbV+J2GDNByXlAec++zfz0nuuZ1L+REs4sa4M60=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UFpWR3097630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 10:51:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 10:51:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 10:51:31 -0500
Received: from [10.250.34.213] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UFpVD9099702;
	Tue, 30 May 2023 10:51:31 -0500
Message-ID: <fefc4b3d-9ffa-c9b8-ad87-97fa9ef8edde@ti.com>
Date: Tue, 30 May 2023 10:51:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-img-rouge-umlibs: move
 to new subdir
To: <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230527015837.231817-1-rs@ti.com>
 <20230527015837.231817-2-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230527015837.231817-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 15:51:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16624

On 5/26/23 8:58 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Move recipe to new rogue subdir since we offer more than just libgles
> now.
> 

I did something like this as part of: https://lists.yoctoproject.org/g/meta-ti/message/16381

ti-img-gpu-umlibs as the name feels more consistent to me.

Andrew

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../{libgles => rogue}/ti-img-rogue-umlibs_23.1.6404501.bb        | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-ti-bsp/recipes-graphics/{libgles => rogue}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> rename to meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16615): https://lists.yoctoproject.org/g/meta-ti/message/16615
> Mute This Topic: https://lists.yoctoproject.org/mt/99161819/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

