Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A617CF4BB70
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:18:35 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27070.1771957108057862279
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 10:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Y68FPblQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.47, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlaqMpJvRoA4h5c1Vdc5WLh4QnWHCHtMu8PS+jXTcnKIMjiVR8DFxjIDQa/Oxy0wzWsqvNgkE5xzs1TQXs/viKoZQG10TDjpvMq76kME8cZxJmzMdpKLPGsFRkTJxDseiJ544XJ6f8T0oMWE19IHKrjZRLUA3Fu0M3JMg7JXiYyR6T1N706PEnbKR1d69nu1C6SPVnS+zSpGHbgJMcna4VcU2YnIC5u+3O0jivxbbqwQaTb7AQ2UOhJ9pqY8is/uOD5nbKeWiSiinUCgI0UC5VMQRltKcWfC441poecZW5tpD2djJFWYB3iA4vzgH2xYzQ+5PXiifUKej3hGvDyOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hkWlCv7Fsfxf7ZxqD8hsXJEpvT2mWgIGXKKURdqZgc=;
 b=pYNfwrst1i8hyBVk9gr9agRtdkJh8BBCd7d/Tj283d/Z0KjBjPmOC9YKEF9QiLFUGTX79g+y56ZnXCBAnKpd7YIEwunhiL4tJIo80MCyr9iPBMjU+ZPgBn/UGrZXJW2pDpVM3tldMYMk9HY8cHVuV/UvFkXhkcjvjHbYLYBNMci4u5Z9d3skfy4JrFFJ7cmjhmb1B/fBkktEkfJkO4OUZ1/cs5ZeAIBurQ1e8suTwxYfz2q5Mjwqb/IVRn+yqX8yMMZLnIM+E7RZym3lnV/sZ7Ew8E07WNUYm25VK90Hpa0jRi37Uzbv5LbeTgIV0W629vPs3vS54/Mg+ZZSo+mbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hkWlCv7Fsfxf7ZxqD8hsXJEpvT2mWgIGXKKURdqZgc=;
 b=Y68FPblQZi9YEO15GefNFBMoprTQyTIylpJlTSot8Zg/x4hwIdbZKIJS8wJXG4cgYXp4I26qSzoyXIGZCScftBqDgaYsVcMW6CZJsNd9N84qH4JhGAaFoVszxoTUb4m2WuihbtZGNepC9bkh7WzW17xzAZFd1AnshRJGI00fJEQ=
Received: from BN0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:e6::28)
 by CH0PR10MB7410.namprd10.prod.outlook.com (2603:10b6:610:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:18:25 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::24) by BN0PR03CA0023.outlook.office365.com
 (2603:10b6:408:e6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:18:25 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:18:24 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:18:24 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:18:24 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIIOV33196178;
	Tue, 24 Feb 2026 12:18:24 -0600
Message-ID: <bf5d77fc-bf6b-4640-8a7f-987cf9c63b8d@ti.com>
Date: Tue, 24 Feb 2026 12:18:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board
 configurations
To: Randolph Sapp <rs@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>, <robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-2-rs@ti.com>
 <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
 <DGNE84W70NUT.2CHW91HOHCJ9J@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <DGNE84W70NUT.2CHW91HOHCJ9J@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CH0PR10MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae8134b-b570-4e44-7435-08de73d119f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3ZQcTZUSGZIRm9kSnhwZEtlOWRTeUMwdUNGMkVYWU5pVE9QR0p4MDMvbGtv?=
 =?utf-8?B?MzJSYXZVTGNEVTZDUkVveW9DemkxL0tIR1had1I0S1gzTDhtOTRmMU1WK2VL?=
 =?utf-8?B?K2JFWkljMy8zckthK1Y1dWlvUVJpWUs0aVhTQkhySFlsZHNDN0VYZ2c1d3Jk?=
 =?utf-8?B?UVpkTVBBNVFSZjlMVndzODBvamdkZm9lN0ZZOUpXelNVTkx0Y09NRzdFWnY1?=
 =?utf-8?B?ci9zWGNyVHk3VUgwQlhjU2FLN1g2aW1vdmkyYm9jcmRkd1RkQjN5SERPUVE5?=
 =?utf-8?B?WUJvVU5DQ1llaWRnMlQ4WW5ZaDlkQm16V2JuQXZpbWVVVW9aNkY0aFE3N0pi?=
 =?utf-8?B?M2VFZFpvanFKN3NmUDE4OFNqY1hidDJDaDRra0d3KzVIK2k3YnJSVWhtcjQz?=
 =?utf-8?B?RXpETzhUU1k5Snh1THRabnlYc3F4ZDh2QmRwTTg2K1JLdlJXM1U2Y0Y3cXBO?=
 =?utf-8?B?ZW5aTzdhdXM2YjBRUjRKaXBlRjJ3ZkFBRDkxYzZLUW94VjFaSWtrdis5UDNX?=
 =?utf-8?B?Y1ZUM1kxRnljOWg5dktDZXJPR1cyd25UNzN2RnZqY0hDbkFiellaUll4OGxp?=
 =?utf-8?B?M3hWQkVnNE4vb0hiK1VjKytvcUh1NXFpVzdXd1RrN2hubHptWnF4TnRCS0ho?=
 =?utf-8?B?MnJkZFpPam52NVlucTN1Sk81dytybFFoQTFQLzBlVlA5S3cxODVBQjZNVEFE?=
 =?utf-8?B?WGRTcFJ5Q1BXeFlWcllZdXg2K2lkNndld2gyaDFOVStFOE00SE02aG1ZaGhF?=
 =?utf-8?B?MGJ0ZTJRRm9BdWppeHo2VmdSWmgyd0VSMUFiUXJ4NDNBS25YQUhhbEsyaTVz?=
 =?utf-8?B?RkFJS3pnTlhyT0RUUk4zMXA5TFhtMlNJNVhDTkFKaDBHU0sxMEh1Uk5GcXFj?=
 =?utf-8?B?VHpYbXJHd0NoUVg1V1B4T1orLzRUeUUvZDZ1OFBrZGxOUk4vTElOYnVoVzVT?=
 =?utf-8?B?RkhmUnVzajJqM0JVa00wKzQ0MWduTVV6WkVKZ0tPeWJycW8xQ09WQnJ0d3FM?=
 =?utf-8?B?NHlRZng2T01QbHc4TUc3ZDVLcGliQ0JJZHd2dW9mNVc1ZUQ1OXpyU2FpNmE5?=
 =?utf-8?B?amV1bGRYTitaSzFuSHFVQjQ0TEhJOEZ4WlF1NVJMR1B0YU1qd2dSMnFqazlz?=
 =?utf-8?B?RVp5K2ZQWkFXcnZmWDVhTVV6UEx5WjhPdG1BT3l2N0RtREFMQ01vVmtvN2ZF?=
 =?utf-8?B?U2phUzJQSEVMeHpJQ3h0b3BUV0ZqMnpmdGZNTkVSSXZoblhjenBzVlFacUtN?=
 =?utf-8?B?M3JhdGM3REMvcjUzb25oQ1hSdHZvNXJCblBrR1U0eE1aUXNqY0twc1JRTWZ3?=
 =?utf-8?B?cGxGRnBFSlRsSlY2OEhNTTlFUVEvclNJUGFwczdYaUZ6anVDZHZxb2o3L295?=
 =?utf-8?B?eHNPMTN0MGZKdkpRK2hTWForOHZRYlFvQ3dld3E2alNySzhJRWRyUUlnc1d1?=
 =?utf-8?B?M2dsSVc2WUFqNGdWTEljcGlncjMwdE1MTDNlY1o3QTNSU2E5MnRhL1BYYmpS?=
 =?utf-8?B?WHQzY3RKcXJ1dnB5SUszdEdJdCtYTU5IYUtDNStwWTZVM3M5YnZPVTl1WGVI?=
 =?utf-8?B?ZnRkNnBPbFN0QmNoTUI2NmZwaFF2MEErdmR4YnBCYU0zdEU1NkJ3V212R21m?=
 =?utf-8?B?cUsyb2lCNzRuNDJ3aTkwVlhPU29rVURrSll0Z24wRWVhRVRDbkJIOHU0NktJ?=
 =?utf-8?B?R2dUUEdIczg0cEpWWkQ0bWk3ZDB4WFNLbDNnOWM1TUxMVVNOU3lmOFU0VXFK?=
 =?utf-8?B?SXNtVWJGU3pJV0JjRDQzTUp6Vkh2TjRnNWtIL255OHBUMEREZGtoeWo4a3ZJ?=
 =?utf-8?B?bmcxSWhxR0Y0NFRTQkUwem96elJlRkZrcklCSldVZWsrTDdoZDVJSjFBZ3JQ?=
 =?utf-8?B?M1hzRThhUXZiN3dhWlVHamlvbVczWU5mOW1KTGVyTWhQSExBcDdNa3d3NTN1?=
 =?utf-8?B?YWZaK1hYSzRGK3d3ZjZoOFN5N0Z5T1lENlY3R0llU3ZTSE9BKzlPV1RIbFZE?=
 =?utf-8?B?bWljK3NqbzlncUUzQWQ3V2FNZHFoY2M1SjlXWm5uVDFGK3FEQWxYcWJ1V1pI?=
 =?utf-8?B?MHd6MDVkcldleEsxOGErUm12RmJhbkpKQWpDbHJYdFJqY3FjdkRmbWY0QzJ6?=
 =?utf-8?B?clJCc0RnYUxBanl5S2Jxclk4R1lOWVBrVGFQT203VTFFVGhiVE9xd3VESHVo?=
 =?utf-8?B?bEZudGtsMVVwR1pXTHVBaVN1c0lQVkE5QnZ4aWJVbHo5TFRrSzhBOElxUDJU?=
 =?utf-8?B?MExWVTJGUW9vK05GMm5YcUt6a2ZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XRI2nuAbAtn9LDjpqmkQnHiXD4xSa0r0GvJmTpNFvhrTbI12VOj/V7hpEA6sUSVZcvUcRMo9BvY1hCD8xsVK0l4wrTxPvLW0kh/7TMERWFuoOs+62silbUuoZMZ4tFXAeA8E3cxcidx0jc4RPpbh2jc6VkrksXRtf1xCPkhodRkKuLfNxZtkwvVvVHeeuwHlOG0sFufUGurAA86H2jz9YFSN33wAqOKg+DrQ+x8sM4KD5Eal+1CrXy5qy6hbaCRoxj+SOTHPvaNLqIPBtmMAsO9tUsNZlPIXqcSHNXT4je8FIO+WX27LkOeHm0uDemcfiTpdzHjmXGycY5LapFaDXi8jnwZ/qo859IsDH6ia0BHpsCJJozdghTzvHH8nI2uiI30KbNztXSZyVfbCEtv3YJOkDVym5qnS5cR3uvZeS8BS0ZP+CrKS/4dxsasSvZQ4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:18:25.2871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae8134b-b570-4e44-7435-08de73d119f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7410
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 18:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19586

On 2/24/26 12:11 PM, Randolph Sapp wrote:
> On Tue Feb 24, 2026 at 8:55 AM CST, Ryan Eatmon wrote:
>>
>>
>> On 2/23/2026 5:57 PM, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Move all beagle board configurations to meta-beagle. There are 2 skews
>>> currently:
>>>
>>> 1. A base TI configuration setting all the default variables required to
>>>      use the device with meta-ti-bsp provided packages.
>>>
>>> 2. An override that uses meta-beagle BSP components. This includes all
>>>      the values defined in the TI skew as well as any meta-beagle specific
>>>      configuration.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>    {meta-ti-bsp => meta-beagle}/conf/machine/beaglebadge-ti.conf     | 0
>>>    {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf | 0
>>>    {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti.conf      | 0
>>>    3 files changed, 0 insertions(+), 0 deletions(-)
>>>    rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebadge-ti.conf (100%)
>>>    rename {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf (100%)
>>>    rename {meta-ti-bsp => meta-beagle}/conf/machine/beagleplay-ti.conf (100%)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
>>> similarity index 100%
>>> rename from meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>>> rename to meta-beagle/conf/machine/beaglebadge-ti.conf
>>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
>>> similarity index 100%
>>> rename from meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>>> rename to meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
>>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-beagle/conf/machine/beagleplay-ti.conf
>>> similarity index 100%
>>> rename from meta-ti-bsp/conf/machine/beagleplay-ti.conf
>>> rename to meta-beagle/conf/machine/beagleplay-ti.conf
>>
>> NAK.  There is nothing needed in meta-beagle to build beagleXXXX-ti
>> since it uses the TI kernel/uboot.  So just moving it over there does
>> not make sense.  I don't think this is the right thing to do.
> 
> Cool. I want a second opinion. Who the hell would look at a beagleplay machine
> definition and not expect it to live in meta-beagle? If you bring up that this
> is a generic definition using only TI layers and should therefore live in
> meta-ti-bsp, are we going to start adopting all customer boards that use our
> Kernel and U-Boot recipes?
> 
> I don't really know what you want, but I know what Andrew wants is dumb in that
> it manufactures a circular layer dependency. I'm not doing that.

I think we replied at the same time :) Anyway, what I want is to not have
"-ti.conf" versions of the same board at all and just select the BSP external
to the .conf files. But my second place want would be this series as you have
posted it here.


