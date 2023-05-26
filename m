Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D11C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 19:00:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2089.1685127611149104954
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 12:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pTKcYtt6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QJ02EZ087745;
	Fri, 26 May 2023 14:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685127602;
	bh=IScBF5ZwTnp8cCh1fikCYn9WJhscBjhigQ+2451xfo4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pTKcYtt66TnMjnMnBa0RR9kM7gq/93ybD6fIecbEo+jKvFXx/Dl08cxqklOBFNYp9
	 /JA1v/RTe2s8HKu16+VKb4n0AvlDaunn/+FGX4RBu55Y/24mfahWxioKtPud5Yih0c
	 VSndRd5ws+3N6Q0uKUxZtc5JW10VRo8uLQBcuOgg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QJ02Jh072645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 14:00:02 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 14:00:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 14:00:01 -0500
Received: from [10.249.39.16] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QJ01eO130717;
	Fri, 26 May 2023 14:00:01 -0500
Message-ID: <ad0555c6-417f-e11b-d6ac-519b34e94395@ti.com>
Date: Fri, 26 May 2023 14:00:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] check-layer failures for meta-ti
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <202305021517546e066d50@mail.local>
 <20230502194743.GD9226@denix.org> <202305111450394ec6a4fb@mail.local>
 <20230511153603.GX9226@denix.org> <2023052210025257f03d87@mail.local>
 <20230526182211e8b9af02@mail.local> <20230526185748.GE9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230526185748.GE9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 19:00:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16609



On 5/26/2023 13:57, Denys Dmytriyenko wrote:
> On Fri, May 26, 2023 at 08:22:11PM +0200, Alexandre Belloni wrote:
>> This still fails:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1369/steps/19/logs/stdio
>>
>> Should we stop testing kirkstone for meta-ti?
> 
> The fix was already submitted few days ago:
> https://patchwork.yoctoproject.org/project/ti/patch/20230522181143.713064-1-denis@denix.org/
> 
> I see it is marked as Accepted, but is not merged to kirkstone...
> 
> Ryan,
> 
> Did you miss merging it or are there any issues with it?

My bad.  It's sitting in the CICD queue.  Let me "fix" that.

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16608): https://lists.yoctoproject.org/g/meta-ti/message/16608
> Mute This Topic: https://lists.yoctoproject.org/mt/98641101/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

