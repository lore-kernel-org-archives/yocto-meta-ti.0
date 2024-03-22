Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8068C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 15:25:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16395.1711121103733031028
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Mar 2024 08:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IH8f+sJm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42MFP2Sv047361;
	Fri, 22 Mar 2024 10:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711121102;
	bh=+E/i0U7e0u4qORhtSCEWmaiWa84oVfq/XFQomvWfTT8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=IH8f+sJmdCFaeVw/peSak1yJLny4j4r/csedIYZElSL0TIGklhwPyr2qhmtFEYJ2r
	 3o+kfUd6IVsFCfxJIE7dYK61WqYNM+VklLV3/vaz5biKw+ChgB8V3MCB+jZKEH07qu
	 KbGf17GkU5cULU5HclCIzJy4zbjWONC1bOTN9GHk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42MFP2wx063219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Mar 2024 10:25:02 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Mar 2024 10:25:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Mar 2024 10:25:02 -0500
Received: from [10.249.39.109] ([10.249.39.109])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42MFP1KM030165;
	Fri, 22 Mar 2024 10:25:01 -0500
Message-ID: <7b98b733-4ef3-4afe-aa2c-24272d802685@ti.com>
Date: Fri, 22 Mar 2024 10:25:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] Revert "python3-yamllint: Temporarily
 carry this new recipe"
Content-Language: en-US
To: Samuli Piippo <samuli.piippo@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20240126192526.15795-1-reatmon@ti.com>
 <16770.1711100874284340056@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <16770.1711100874284340056@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Mar 2024 15:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17548


I'm sorry.  We only support the LTS branches plus master.  We do not 
have the resources to maintain every branch.

You are free to pick up the recipe in a local layer for your project 
that is stll on nanbield.


On 3/22/2024 4:47 AM, Samuli Piippo wrote:
> Now that the recipe is gone, the layer is compatible only with scarthgap.
> Would it be possible to keep the recipe or otherwise get a nanbield compatible branch?
> 
> -samuli
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17547): https://lists.yoctoproject.org/g/meta-ti/message/17547
> Mute This Topic: https://lists.yoctoproject.org/mt/103983388/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

