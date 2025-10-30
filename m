Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9A1CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 12:58:06 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.65])
 by mx.groups.io with SMTP id smtpd.web10.24564.1761829079067003568
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 05:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=uOY9hRk4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.65, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiyv1WkH5m2yeQnsCExPg2UQlDw/I2bdJ3GD5TiTZLloZhSgPIa2XeCHtrcVI6ZkJrixs/qgjjqVQFmh8TH+sFjBkrvyR90PfJ9No6U3Jll0fUxwDA4qWU+i/aeJcOfkS6JWnU021BYNe1V0VLILOo0KF3BbEcko7m1knz2aDHh9JiRIE/jCfyXvPBS+nnxVv88zWXHyNKPMeLoebDGtfnsKCmh8nBpri4Lig8qL8BQFMD+vB2Qfsv+U3M5kX8VOVfrlQKLa9NPqv4vx8GeZ6wSk51Ro95Oorm52jnEU0snXUR57nIioO6EC5QOj8t/JqfsPpImV6qzmVniflBa9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqcMqWOut60Bn9H6oqY+pG47chJGU7Og2XRBtVdWT4s=;
 b=vTFyC2Ftca6TY0qfr8PHPyUs53J0UGCtI+FRE9Qb8bNTw+kjj4u0E8/E+FnBIHCW+r/vkmb2MXp0pngXUPLYxH0kl0FP5obCnG83iPGbsaIYbFNC6vvRmgR8X85SzaiHXyRbgCxJ/qFGoqaDpOcIsOrG8WG9MZFjZllqzS6mMF+JIq8PzHuVcBb8YvmremMIjWlu0n42PuxZOkC5jLgsfiCnfVgH9YbWPqGDyAkSdxbAXppLg9wRwos492gjz0PHWKqEDHGggWonVXFWWhY1j/pfF064Ms838kDJhyt06Ar//fR8rV8GOzPq/zRzbB56yIVIakCWjTR09591InYC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqcMqWOut60Bn9H6oqY+pG47chJGU7Og2XRBtVdWT4s=;
 b=uOY9hRk4vXIoGt2RLe0rJ/ksov21tEyWhsAkhnCtU7PaWyhKY5/x9sA3MuZpP2xJtxhfC5Tkr1CA7Z3NUF9cI93gXApBLCxR7zjRcIqBttsyUk5Gqb4BgbffHdWhswFettOxo1m9NQenLMZ272msbvk6voSQ2K/0/ksTcOb5CxQ=
Received: from BLAP220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::20)
 by SA1PR10MB7756.namprd10.prod.outlook.com (2603:10b6:806:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 12:57:55 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::69) by BLAP220CA0015.outlook.office365.com
 (2603:10b6:208:32c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 12:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 30 Oct 2025 12:57:54 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 07:57:47 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 07:57:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 07:57:47 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59UCvlR62219488;
	Thu, 30 Oct 2025 07:57:47 -0500
Message-ID: <1f347a56-1bfd-4eb3-b676-d16e4899e51d@ti.com>
Date: Thu, 30 Oct 2025 07:57:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v5] ti-librpmsg-dma: update
 ti-librpmsg-dma SRCREV & LICENSE
To: Vishnu Singh <v-singh1@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20251029060209.707510-1-v-singh1@ti.com>
 <20251029201133.GH3125@denix.org>
 <13f9b7f8-37a3-47fe-97f9-5a52f0836967@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <13f9b7f8-37a3-47fe-97f9-5a52f0836967@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SA1PR10MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 80635cd3-5c58-4f29-7a2e-08de17b3f12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YXZObEJLS2JZZWNrNlJ5TThZdzV1Yzd3OUp1Zk04Qkk1SkpzMDU2RndsbXd3?=
 =?utf-8?B?THd6ZEpoSXlMV2tkTS9sMFlWbUFtUkJnZlJBWEpvdjIrcEJoTUF5L2FkTDRC?=
 =?utf-8?B?UzkzS2tCSFl6ek00VUZvWWxSSWpmNE5wTmtvL1h1UUlmYjhoL1RnOW1WZlJl?=
 =?utf-8?B?VVZjOHI0NWJEZGxudHRSSmhBTEhobStrbkRBeGlUUHdhSlZ6S1JSVUcxRS9l?=
 =?utf-8?B?TDg3WEpGc0xIWDJUdUpPcTFRTjVFTlZBV29wMHFjZ3dFLzNjRXVjeE05U0hW?=
 =?utf-8?B?K3pndXNIZ0pna1o4UTl1cXlVUmFxTDArclptam92UTdBam0ycCt0a2Vsd0ty?=
 =?utf-8?B?OFBpWWtDWWxyRXV1clVzeVo2SlIwb1N5SWdLd1hNakpQaHBTTHF4SWdtaUlw?=
 =?utf-8?B?RDhqTHFCd2ZzejNqWnNTZWtpcDlhVGkyUytQYnBMTEVNbldOMUZZRHdzRHNl?=
 =?utf-8?B?aDhzTUx4WkQwNmYxZ2RMQndrQUZTWXJGR0N3WGZuTThla2ZFQjVxT3F5RUtq?=
 =?utf-8?B?OXZtSHpkN0FWdjVxYTdKV0RvSnV6UTBxMm1EOXAwZHI4aWZHK2I0SlE5YktG?=
 =?utf-8?B?ZDA0Um15eWw1ZW9wQkUxNkdodnlJaXhkTlNsWGVJVEhMMWZVdVVFSEtCQVJR?=
 =?utf-8?B?cUZ3MXNNcXlab3BhZWJPMEpiRldld0NUWDk0VmNuQ1MrMThQR0RxOTh1YlVC?=
 =?utf-8?B?dFgrUXcxbklZUlF1bzF1V003MG03aFNMZ2p3NHpHbU1xdHV6UmtTek9jZDdV?=
 =?utf-8?B?OXVQbWFLWkJRVHFFcWZRTWRDU3N1M25NUjJKZWFEOG10ZXpRc01EbXB0aGxx?=
 =?utf-8?B?SDhSeDF6cW9scG5Fa2FOd0dYdEh0eWw1RytQVlNub3FSV3V6cWZMSDFzbXFj?=
 =?utf-8?B?OE9sMlhGbTdDcGZLbkdFYmV0YTBPRlVoVGl2b2Fld0pxS2x6SmYrWDY1bERW?=
 =?utf-8?B?YTVyWHVNVkwyZ0ZjUWIzQzh0L3daeGwrN0JxWklxQktQdUJLdVJwV1BDdXh1?=
 =?utf-8?B?a0dxdFBXR3d0QXBBY2ViUGpWYWtTTjJROEVVc0pZcmRvU0JJTGVDTDQ0VDY0?=
 =?utf-8?B?RlpJeUZUamdyMkNBUm9XV3JkMzlpeGRWUDFzNityR3JpZEZnbEhuM1RpTWs2?=
 =?utf-8?B?c0JRWVB4SVRLbnVqdjdjZ3lYS1lDaTZwVmwyREQ4aEExeDh4eGx4MWkyRVBO?=
 =?utf-8?B?RzliN20ybkJOSDhnTnY5RzlFZHo1dExOYnVWYThySUpYMy8vTXJJM0dMYzhU?=
 =?utf-8?B?RDJ4aGFUb0FER3BPdjlSd3A4WEs2RW1VN21VWWJvbnFOUStRSHRpL2ttVmlQ?=
 =?utf-8?B?MWpGL2hZcEgwQWg3TGJ4YWtkYzVNc0l6R2R6QnpkeVNBU293bnhrekxnajJK?=
 =?utf-8?B?VTJ0U0VJdnRWRXBlTlZ5NEMwZXZmMWtuaFJmYmFhS3BBYUpPWHhHclZJMEpm?=
 =?utf-8?B?UGdYcm8zVXFWamJvM0RRdkZKZkFYK1pZZ3Z1dXdWTEZ6WGRVQ2ZQWDJ0ZE55?=
 =?utf-8?B?S0lnWTE3QXd3SENHcU1zMC80T2t1YnBnM1hMTHA4dUp1WGtOSFBEaDFQbTlI?=
 =?utf-8?B?eXdBTXhFV3NuekMxQTVGUTdCVDdtYTRiWVFxR3YwSkxlZWlqWmpEMWpadG5T?=
 =?utf-8?B?bXFFUC9wbEFvWkkzN2lqdGlRZU52T09GZ2hmOTAxMExlcFZ2OFpkQS83cXdU?=
 =?utf-8?B?cXFiMEJBYW1MalFOZGVNbm5pYW00QVJFcjArZWRBeUFjVlMxaGZWWUxpYWp2?=
 =?utf-8?B?K2FOa0o5cmg2VlR5YVdRYVJBcTBhSVNxajBSTEtSL3VTdFdvRGloVjI1NExE?=
 =?utf-8?B?S3hZQnZKaHd6Z3dCL0tmdEZPOVBSSXY4U1hsZDNFeEtOZ2hVKzJib0t5alNM?=
 =?utf-8?B?OFpadmdUMVBQR2Y1M3VGVWVnTUdJU3FBOEswRmpFYmZOZXJhd2hSdXZCazdN?=
 =?utf-8?B?Sm44dWFwTXQzVGxMSGhYV2xFYzk5RFdKQ0pqakxNQ3JVN2dsV2t1c0YxWSt1?=
 =?utf-8?B?ZmM3T2VXWTY4dGtzdnpzdmJhRUdhajE5S3hidU1qOVR4MjdpRFBiMFVsc0Iy?=
 =?utf-8?B?K0IySUZTSENjZ3ZXcHNlbFpEOHFyNVErak43bzU1QTd1aXBDNkUyMlQ3TXp1?=
 =?utf-8?Q?2psQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:57:54.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80635cd3-5c58-4f29-7a2e-08de17b3f12f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7756
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Oct 2025 12:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19212



On 10/29/2025 10:39 PM, Vishnu Singh wrote:
> Hi Denys,
> 
> On 30/10/25 01:41, Denys Dmytriyenko wrote:
>> On Wed, Oct 29, 2025 at 11:32:09AM +0530, Vishnu Singh via lists.yoctoproject.org wrote:
>>> From: Vishnu Singh<v-singh1@ti.com>
>>>
>>> Replace MIT license with TI-TFL to align with TI release policy
>>> and product requirements. Legal approval: SRAS00013045
>>> Update scarthgap srcrev and disable 2dfft example from lib build.
>>>
>>> License-Update: Replace MIT to TI-TFL license
>> Sorry to be pedantic and blunt, but that's not the reason, that's tautology.
>>
>> License-Update tag (and the commit message in general) must answer the "Why?"
>> question, not the "What?" question. We can all see the "What?" question being
>> answered by the code change itself. There's no need to repeat that with the
>> "changing X to Y". You need to explain why you are changing X to Y...
>>
>>
> Reason for changing the license is that SRAS for this is approved with 
> TI-TFL license and C7x firmware used is licensed under TI-TFL.
> 
> I will update the commit msg and License-Update tag, if this is ok then 
> i will send v6.


I think he is asking more for "Why did we decide to change the license 
from an open license to a more restrictive one?"  Just declaring that 
there is an SRAS is not an explanation of why we changed it.  What is 
the reasoning/history behind the relicense?


>>> Signed-off-by: Vishnu Singh<v-singh1@ti.com>
>>> ---
>>> Change log:
>>>         v1->v2:
>>>                - Update commit message with license-update
>>>         v2->v3:
>>>                - Update SRCREV (license updated in README)
>>>         v3->v4:
>>>                - Add branch name in patch subject
>>>         v4->v5:
>>>                - Update latest SRCREV
>>>
>>>   meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> index b624871d..7600f867 100644
>>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> @@ -1,9 +1,9 @@
>>>   SUMMARY = "RPMsg DMA shared library"
>>> -LICENSE = "MIT"
>>> -LIC_FILES_CHKSUM ="file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
>>> +LICENSE = "TI-TFL"
>>> +LIC_FILES_CHKSUM ="file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
>>>   
>>> -SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
>>> -SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
>>> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
>>> +SRCREV = "153951932925a72346b76d98b2774952c48a82fc"
>>>   
>>>   S = "${WORKDIR}/git"
>>>   
>>> @@ -11,6 +11,6 @@ inherit cmake
>>>   
>>>   DEPENDS = "ti-rpmsg-char"
>>>   
>>> -EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
>>> +EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
>>>   
>>>   COMPATIBLE_MACHINE = "^(k3)$"
>>> -- 
>>> 2.50.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

