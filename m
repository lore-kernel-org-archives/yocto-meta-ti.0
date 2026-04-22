Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AE1F9EDD2
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:40:39 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82839.1776865238359290913
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 06:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nT7NrBYk;
 spf=pass (domain: ti.com, ip: 52.101.57.64, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz3h3cuqruzgXvXXaTEKwjEH950ImqnWAzODPJsp882k+TVIUgSpV+buGKDc/iJszpdJo3iKywbcwY9oRvLokKAuce+55XhISDm/jClbMaQyH3dWF/mL0HlPJEYUDo0ttfbUBWjb5sqnwNAJV09eDCdTg7MzsKsG5EGDza9addgToAFwwYSxLJ8g9+APUysjjJjFk8097r7rq+JOSSCcqf8c1uJkO7w6Rv9RSpeIr6YVHUFIldLj7yXxof7d8ExSaHL2G1TJJQzwc/lU3B2e20/+/ard/QwtXTAxkuxEfqBpRLsQBHEjsWNeh8Z92hl/PmuGG1+KRoVwe4GIJ993Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssmDtGVO/TTaYGrp/IzSO3Per6QaxF2pSNnycPcqgeg=;
 b=Hj8VZJxOFoADY8apbGtljwU4q14seOolNNhfDuNUL+b2+UkX2zcevSI1LDpkYRcJcBbe6mhcewt3h6ONTHUhGAjUZJ7TTjCNcG7+bINlgzZkFKN7qra35YPXoZNoxVai8paoV5/LgZGOD/zTHerz0OenHrKdNePhMw5KVwA0jWH5fG2eKLG0gKzekkU6e/gPcY3rJjdFxhAH/wJYI7wGvw7d2+WQ6SFGBh1/HcEBXyKOkkeFnfOQUpB6lVLPrn16Vyxzhhm9Sqtbi9yuVPkjzwww5DayVFU6NRDixyDVodVWKtFGdFM+7Wln0KeX8FUzfyIJhaGoa8WpJArK21Of1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssmDtGVO/TTaYGrp/IzSO3Per6QaxF2pSNnycPcqgeg=;
 b=nT7NrBYkievMTykypKkefmQXP1+OWm/mHIqAHDpXY7yZU35KvFobs6XQyqIzBlj9cv6D5f4g7n1vO7xyFib5KwxbBPbsCeY8Rqtv5/PaUPruPgHcW+iATEkypKSA29XKN+f2UaaI4Fcm170+CQeRPRh+u1up16EWp5pKDr85i/M=
Received: from BN9PR03CA0747.namprd03.prod.outlook.com (2603:10b6:408:110::32)
 by LV8PR10MB7992.namprd10.prod.outlook.com (2603:10b6:408:1fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 13:40:35 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::fa) by BN9PR03CA0747.outlook.office365.com
 (2603:10b6:408:110::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 13:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Wed, 22 Apr 2026 13:40:32 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 08:40:32 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 08:40:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 08:40:32 -0500
Received: from [10.249.32.238] ([10.249.32.238])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63MDeVvB2267409;
	Wed, 22 Apr 2026 08:40:32 -0500
Message-ID: <79079a96-8421-448c-b297-42012e3b4163@ti.com>
Date: Wed, 22 Apr 2026 08:40:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] weston: Update to 15.0.0
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Denys Dmytriyenko
	<denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260324162004.3215160-1-reatmon@ti.com>
 <20260324164438.GU11121@denix.org>
 <88c431e4-862d-48eb-b2ab-d2502596bf9f@ti.com>
 <20260324184327.GX11121@denix.org>
 <wawx3v6oo27qezvbdiaq4gmuytwquwlxxev7kjtqni3mtxol7b@rgr2c6nppzdq>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <wawx3v6oo27qezvbdiaq4gmuytwquwlxxev7kjtqni3mtxol7b@rgr2c6nppzdq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|LV8PR10MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: a00a42dc-c2c5-451d-f679-08dea074b9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003|11006099003;
X-Microsoft-Antispam-Message-Info: 
	XsGaONjIkMe7lvj9w9UyR3htjhtr2gKjyjph7UYsVjoKDpp8uFHMzxhIIj7ZYQ+OWQK61JrHz6JEZtIKkQ8kGg2CqfxNGqbAawfY3zMMtHd867Tat9UyUSxR60H+FxOzfUv9KChCMuYQWHFvvzf0kBj/YkeiaVarvpWkLlTPDBSRXUaL1laqp9wwfwLz7/w5TB/1rI1XkinTyQG44UTN02TFt02nTyRSwt9yQF3AuYDoEV8mltGpwXylpWVZsqM9QQeawgXEytMHTjF9GIld0M34dYcVae4tBTJD46SqkixwppxVIO8R9m2h0z81J/NNMgBvzorYwPeIxn6GyEps/Cc23ROQEaYlWjait8OF4XY49CHWyCOcxaM7HMLhrpLwld7wJVnxonCFWPcK96MYA8z5NEBVCUCg2CUUjdV9aGRR2C/jpHef5EZHJGlZrhte/k3b4BI4fYTHoY73t+0Sib4IE7j8hegthD2ta4uFsk+g2ViWYnE6uKu26uLwM2b6/6nHNrBGVHKdrEg/WNfgCF2z1t+r9SzSiR2C8nkm7V8BPh/FjIAhnckYnT3NbEJvhj897nDYmLqXjGQ0EXkNqul+XyzrR3AtzRQf6nU6R9/GS28uKUVyr2+o1TdqqsQJE7Ln88sV5KwAbzseQ1PcVXbH1Qqqm8cqV3b55MQv09vDZLH61s+S+PZU6jdlL5tlFEky7d5xAYaIgC43+vdSC3SCeLDvYiCl6/UU4TtLhu4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003)(11006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IOTmhbR8sqnuh8BYwiEbAFRLxXUWclZ88CxZcHT+zW1k96MNVMBFwVYgtxKrxHVFJTU3mtWgl7rUWYt+ucCK654i6ZdW9EwLBN+vFD1S8Zd/8gtCP6q9bRnioaFM8NGr1DdituQ2Ul5rgndhxiCzf/BBHoFSv02DoNy//+1v+mf/SU5eQodkYdVjxEE7xaKa+7IjPSLgXJ2VjsMx92COrS1VKKbO2r4NZpBIqkgTdDFgqIlw30isaaovNWbpPYEuHIi/u3X0o5vENfjfjUDInIY25TAlw/OR4r9117F5c1AJGRg9t54HqwFHYJmTKwXNtRZggFg9yoV4zZHQqVdELGnbyrBDb/m/W9h2ZaWu9meJj0gzX+bN+5GKkFmhDbsEtDMvYO1Xu4WiOrqpuNv3exsSYBsIZK8mw4XCKD/hy5S5MC61yLACuAkD42pEuYKw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:40:32.8804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00a42dc-c2c5-451d-f679-08dea074b9f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7992
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 13:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19866



On 4/22/2026 4:30 AM, Ernest Van Hoecke wrote:
> On Tue, Mar 24, 2026 at 02:43:27PM -0400, Denys Dmytriyenko wrote:
>> On Tue, Mar 24, 2026 at 01:18:32PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 3/24/2026 11:44 AM, Denys Dmytriyenko wrote:
>>>> On Tue, Mar 24, 2026 at 11:20:04AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>> oe-core has bumped the version to 15.0.0 [1].
>>>>
>>>>
>>>>> We need to adjust the bbappend version to % to better match future version
>>>>> changes.
>>>>
>>>> You shouldn't be doing this rename.
>>>>
>>>>
>>>>> Additionally, the patch needs to be updated to match the weston code
>>>>> changes.
>>>>
>>>> The bbappend is version-specific on purpose exactly due to the fact that the
>>>> patch won't apply against different versions - it has to be massaged every
>>>> time there's a major version bump, we've done it many times before.
>>>
>>> But... if the patch won't apply then the build will fail.  But it
>>> fails in a manner that is more obvious then just an upfront error
>>> about the bbappend not applying to a recipe.
>>>
>>> Either way, with the new bbappend logic they put in, the build will
>>> not go through.  So what does it really matter if the bbappend if
>>> version specific or not?
>>
>> Yes, the build will fail in both cases now.
>>
>> I guess from my perspective, getting a patch failing to apply all of a sudden
>> is less clear indication that a major version update just happened upstream.
>> Versus an error message saying no recipe is available for this versioned
>> bbappend. Moreover, do_patch() error happens much further down the build
>> process, vs. a dangling bbappend error comes very early during parsing...
>>
>> On the other hand, with your way, if the patch happens to apply cleanly to the
>> next major version, no intervention will be required.
>>
>> So, pros and cons for both ways - I'll be fine with either...
>>
> 
> Hi Ryan,
> Hi Denys,
> 
> We have our own weston_9.0.0.bb recipe in a layer that is used alongside
> meta-ti. Because of this rename, the bbappend from meta-ti started to
> apply onto this recipe as well, and of course the patch is not
> compatible with that version of weston.
> 
> Probably we should not be keeping such an old version around, but while
> I initially also thought that it is just a choice of which error, this
> situation shows that there is a real reason to keep the bbappend version
> specific. It's not just about getting an error during parsing vs during
> patching (which personally I do prefer) but also about not applying to
> the wrong version where the patch might be irrelevant. Please let me
> know if I misunderstood the situation here.

You are spot on.  And this is a good reason to keep the bbappend version 
specific.  I'll send a patch to fix this.


> Thanks and kind regards,
> Ernest
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

