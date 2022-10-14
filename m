Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51A5C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 16:08:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.9332.1665763696286085253
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 09:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nMWfRdG5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29EG8FDZ056666;
	Fri, 14 Oct 2022 11:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665763695;
	bh=hvkbxN/f744S91qIkl7ckLsCbwvq6pkH/x7wXNfrTqM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=nMWfRdG51uTYig02WjHCtdJTUj+f9b+EJ2hatA7Pe3q4RNCl3QIzRHtYkn30Ii6Wa
	 F7F5PVIPsHqIceGePYjl/jo7GVE+72YOt6zzI6i/YD1MiawL7Alxgkkm4OMOIKR0Zb
	 LE59VbQuKmyGSNWu7pcPyfEcjETS+aDnD7HdVKuE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29EG8FNJ035747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Oct 2022 11:08:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 14
 Oct 2022 11:08:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 14 Oct 2022 11:08:13 -0500
Received: from [10.247.29.70] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29EG8DaR039127;
	Fri, 14 Oct 2022 11:08:13 -0500
Message-ID: <50f39766-c48f-d021-ab1d-cc0c8a814fe0@ti.com>
Date: Fri, 14 Oct 2022 11:08:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti] PDK Source Missing on Dunfell
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>, <meta-ti@lists.yoctoproject.org>,
        <s-adivi@ti.com>, "KHASIM, SYED MOHAMMED" <khasim@ti.com>
References: <CAJdd5GZshPXLmnpvNN-086V2oDFYCifCVx5+02--Dm3tAbVVTA@mail.gmail.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <CAJdd5GZshPXLmnpvNN-086V2oDFYCifCVx5+02--Dm3tAbVVTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Oct 2022 16:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15175



On 10/14/2022 10:45 AM, Joshua Watt wrote:
> I'm attempting to use PDK sources on Dunfell (basically trying to
> include any recipe that inherits ti-pdk-fetch.bbclass) and it's
> started erroring out saying that
> https://git.ti.com/git/processor-sdk/pdk.git  doesn't exist anymore.
> I've poked around on git.ti.com and it looks like this repo doesn't
> exist anymore, or maybe got renamed to something else?

Sai Sree, Can you review and comment.


> 
> Either way, it appears that the PDK is broken on dunfell since it
> can't fetch and I don't know how to fix it.
> 
> Thanks,
> Joshua Watt
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15174): https://lists.yoctoproject.org/g/meta-ti/message/15174
> Mute This Topic: https://lists.yoctoproject.org/mt/94329474/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

