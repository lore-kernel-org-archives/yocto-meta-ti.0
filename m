Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD09D74EED
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:52:19 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1216.1769183538368455995
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 07:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=D8P7nlfH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNExRpQrELNGaijun/Mnn4XRv5XyBJZOrsZgqrFBOySAesQ84vQiLuTuqLr58jj8blKkeZTcBIKDUP3LdoMxcF8xfkRqwAbxPne0hnhuRejqEgfainJua+GAT50Zyv6ca5ysLOBSw6LOP8nqBvCe7xUrSFJqVOLNBG1L0FUgmNNMXQCELamMT95RH2e/xCQPAUN58db+lt5UZP7fiaVkhKvutzE1Im0etyUcr7VjfAUOfCTdXsyH+4KnBgKQq2/Fv8ywCH55DW5MXrHB1Dg8+uPxEPoPMFQ7HVIDfZGDiez9evUpRVDNWrng+m59Z9tj7DrlsXczxkmyZ/7IMoy/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afLabBbP4Tm3jpdCiqc5Z2RGrXvauW2T99uDrelhOqw=;
 b=zDkUhkHifjyiFBB9ypXWk1SP/BbjDFGJMJv4em+cPmn944butjIq6uRZGCtM5IZtz2norlr629m7E5OvPGtE/4l5OCVGzZykj96tL30cgxynygjGby5xUzinA2BCj2TXgKyK/RNlCMN0Ne8zE254L3W3mprWk9h2V1O4CFNCVpdJur2hWcLUaEKc8Q8X7UzSf5P3ndh2yfSqSm46RNNweQXd7RTOlSitmrP9rrVrWAFxu/lFiQCdRSRcFjFVoW9DOrGaCEc3mPxi51rf6qfsDCpFvS6/f4bWzbavUnFbMCZL+U1/TDbjqXJMa0xgS5JZ3/i+oRZP5eU8HrsLy82XaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afLabBbP4Tm3jpdCiqc5Z2RGrXvauW2T99uDrelhOqw=;
 b=D8P7nlfHACle4U1d46ZMKUD70bmzei8V8JY5yO/6fonJ4lmLp+uY6/Awh/OfS8UM1kN9wXCEV1XF23xW4k/QXQLEL9caGyf8BEDlxO6vKo9R6kE0u7BlFP0DOQ8b3N34ZQ6334B5hAhpLFqVhxzMS2FJnSOhSChDy4mrB0/cbS0=
Received: from SA0PR11CA0186.namprd11.prod.outlook.com (2603:10b6:806:1bc::11)
 by DM3PR10MB7948.namprd10.prod.outlook.com (2603:10b6:8:1af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:52:15 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:1bc:cafe::d) by SA0PR11CA0186.outlook.office365.com
 (2603:10b6:806:1bc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 15:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 15:52:14 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 09:52:14 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 09:52:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 09:52:14 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NFqEVH2562725;
	Fri, 23 Jan 2026 09:52:14 -0600
Message-ID: <dc4df950-9b76-408a-83c2-1cc53ea00f1f@ti.com>
Date: Fri, 23 Jan 2026 09:52:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-gc320-driver: Port module for kernel
 6.18
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260122193522.302216-1-a-christidis@ti.com>
 <20260123051535.GB11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260123051535.GB11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DM3PR10MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 0042905d-bde9-418f-94ab-08de5a976101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WEJ1cElXMXhQbUFKRVNlSk1pMkF2M0pqM3pUU016SmFiRjVmZDQrN1o3cEhx?=
 =?utf-8?B?ZDNUYzlHNWNJYUtUSS9aRVV4bHJsMU8vYjFiMmVNYTRUUVIxUFFlaHlWRWxU?=
 =?utf-8?B?NkdBam12eG1MT2drWWUzeXNiMVhrbEhGeHlFaG1zU2QvQlNPay94L25IVG9i?=
 =?utf-8?B?Z1hiY1RMdWZNZ1JMWVNXMTUzV0ZqRGl3L1A5S2o4SWJ4bFVZbG1SOWNtalJ0?=
 =?utf-8?B?eDdCMGxxNkVkS2lrMFlkU1VneWVoSXVGNzJoZE5QWTc1UHBnQ3VHU04wY1hM?=
 =?utf-8?B?bnhrMEFYSWhDdjBoUm04UGt0Yk9uNGJtOXNvT2J4NTJJL1NFbEZua2ZXU0kv?=
 =?utf-8?B?SzQ2aXpzZ1ZCaStlY0kyTk5tSk9FUVh0Y2N4eXl3M0JnTVF1YkI5TFlqcWFi?=
 =?utf-8?B?US9DV3lwSFRYNkV5V2RBa2c0SU9ra1V6RjFmRGtLVzhMakRCbVB4THBveHg4?=
 =?utf-8?B?K0pva01FRGd5QTg0bkJwVFl1d3FaQmhrRDRVNHliQ3lpYThucXhIeElTL3Uv?=
 =?utf-8?B?eVZnVk1BVFRoMzNncEhuVy9BdGZVVjkvcHFwemgwMG1laVNxSFN6OUMremZq?=
 =?utf-8?B?LzZJZlc5Y0hLVVVsQ1dMc0FSNHJVWk5rQlp3QWlSaGNtQW9yOXdGVFFsWmpw?=
 =?utf-8?B?TFJCNWhZT24rV3YyUU8vRWVUcml6dkFqT2wvUE9wKzkwTlNJMFlFRnAxY293?=
 =?utf-8?B?enNoMnJmUkRLd3VPOGZISnY2eXdyMENFV24yczRlbi9abUliNUQvaHNENlIy?=
 =?utf-8?B?Tnl0VzFsTTloOExZdmtRZXpsOXZkc1ZXZ29kUHJheDFZVmJMaG03TitBVGI0?=
 =?utf-8?B?RHpad1RaSVNPcEdFTktaanpYU1dBeWpIeFBrV1dlZTdORTVSc2Iyd1F5WTY2?=
 =?utf-8?B?ck40N2x6elZPZUxkRWdUWldRQ2dUZEF2SGFTM0wveksybVQ3MThWUlBUQm1Z?=
 =?utf-8?B?TGZyODFrVS94YmFOc0tGK2ZQMHYzc3lubjB3Vi93dDNsZlZsZWNpbUdvZDV2?=
 =?utf-8?B?b2FwTnExemdQQnlWS2RaZjRUZ2tJL0F0WDVkeFl4eGFpcjBnRkF5YS9mRjF5?=
 =?utf-8?B?YUJsSEViVlBnS1JNdzRzcXlycmdOWG5YK1BsQ1R4MW9sSEQ2ZmdrWHBVYzJS?=
 =?utf-8?B?bGlBd3hGS1A0QnQyMFZvQUg3bFRBcWUzeW9QQ0kwUUVCZk1qcTZzdkxYWUZC?=
 =?utf-8?B?RFBmbFBiVlFFVUdKMXYybDVlQytEWll2UjV4alNyeVc1ZVNMV3psRXVJdEdV?=
 =?utf-8?B?cmd3cUxzd1VvQlp4cWpIT1VyUi9mUzYwbGU4K0REUHRaRDFEbzZqeVh1MENj?=
 =?utf-8?B?SmhYbmx4L0QyR1hCRlozMjFNMWRLeHAzdVhyTHM2cFR6UGpsL1Rsa2QySkV2?=
 =?utf-8?B?dElVbTRyc1g3QldZNFNZM3VsWWVvbzZhcGF1cXhIZlpEd3ZvSVpxZVVvRnVa?=
 =?utf-8?B?T0g5eERFYjlxLytCZ1crR2EzU0RNZ0dVV0MzcHJvZmJYeW1CV2MwNHBzdUhH?=
 =?utf-8?B?enBxRVptaUNSMkxOYkJCbVNQKzF0QmpmV0x0TVZuUnp6ZEpnaW43MkxreUNo?=
 =?utf-8?B?KzJmY2xMMzV4MFAyRWIyOXlwS0JqeXhoVTV0YkZRMHZmakFCcHZROWl0N0J1?=
 =?utf-8?B?enVZSzdLSVBwNkNYQkI0Yjc5emphU0NzaERuTXpUZktJUlhoZzNTdG1va1dQ?=
 =?utf-8?B?cDBOaGJDbWNLVGREbTZZdUx6Z0pGOG5GOFk0b2JhL3hNUG1ydHF3R1FPNzI2?=
 =?utf-8?B?UEgySUJoUllEdlFtRzR3aEU0ZVBVY1o1cWVWSW9WMC85Z0ZmUDNwRndJUUZM?=
 =?utf-8?B?dU12UjdhWXRhWS9rM1pxSitZTVJHeFd2UE0yWGhBUWRaVGR6SGJ1SFoyODdl?=
 =?utf-8?B?Q0dpZU1uNmhxdmFrZEsyTmZweEc4ZC9panE5MjViTTdwOGpjOXc3ZHhoWHlC?=
 =?utf-8?B?YU5iWldYbE94dTRtYUF0elZQWEYyMzl3NzdFcjcwRk1jbDQ0WFRVbzJwa3Vo?=
 =?utf-8?B?a2lLYWVidXdRU0VkTk9sOFd5NGZLQ3JyZVdhQ1RwSEh3VWlmQkxPdG9vbGJ6?=
 =?utf-8?B?V3pVVytDYURWME84cUxLQ1NxZnphMWtET1VNVmNMaWhzd3lHR0lwZ3Z1STBV?=
 =?utf-8?B?QnJzVDFwVTdqMXpMUGRxNk5IdEYvZ1FFbThhQXpEdUw2UTJmenB3Q1ZOYytQ?=
 =?utf-8?B?bEMxNVhCd084LysvUlRHQTFmS0dObThoUVB0SjVhVURhVEFBSUVNQ1FuUEYv?=
 =?utf-8?B?eHZIdVN2NGJHV0VuRzVzamlXU3J3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:52:14.6880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0042905d-bde9-418f-94ab-08de5a976101
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7948
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Jan 2026 15:52:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19441



On 1/22/2026 11:15 PM, Denys Dmytriyenko wrote:
> On Thu, Jan 22, 2026 at 01:35:22PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Port the kernel module for gc320 driver to build on linux kernel 6.18.
> 
> Does it work with other older kernel versions? E.g. 6.12 is still the default
> even in master.

It looks like it should.  I just glanced at the code changes and most of 
them are backwards compatible.  The only one that is questionable is the 
KBuild patch.  I'll do a test build and see.


> 
>> The overall version of the driver remains the same.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>   .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>> index 3acdd130..336f4ce4 100644
>> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>> @@ -8,9 +8,9 @@ inherit module features_check
>>   REQUIRED_MACHINE_FEATURES = "gc320"
>>   
>>   # Need to branch out with ${PV} var
>> -BRANCH = "ti-${PV}-k6.12"
>> +BRANCH = "ti-${PV}-k6.18"
>>   
>> -SRCREV = "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
>> +SRCREV = "a7e9a51e89c97fbea974c7d674aa0a95d7c96403"
>>   
>>   SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
>>   
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

