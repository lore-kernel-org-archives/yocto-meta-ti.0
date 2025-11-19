Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B558CF397B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:20:20 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12663.1763572809382421008
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 09:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rNfgv+Ud;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.193.47, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hd9LCQfNzfHFi6vZm0JcUccYwIwBXRwMUiNmGdpWj0M8GJvnPGO6xSpe0qWy65iqqsXH9x4IeYRT4w5rDKgliKLT31AI+dAwrq/Z7DRwYKrIXHzTnkQ5qshOU1JQYSgoK47gFe3CT0b7FbyeR1aOV8r3nyM/vJb2NMCwIyyjZ0+46W37AV3eBRhI8iNPqvrkJe314tItaE4U1AtYJRYwFcKpyfhYmH1K1dGgifNS3syMxGEwOecnWx4ZxbzYcs6w6z1jiObhKsSA9tHTXVZJ29iucAcC7RF+P4Keb32JpkL4Ewmxxbva3H3jxxL4CDJlHm6J8X3d29T3UQYzj4MYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy27sn+6dSDyc2E+k2RqXWmfy8uZoeKwTECrPgWcXG4=;
 b=hje9Zuo5jJVYDbGsmzI2PBE/NN71JxhiXnnjFMG+GdC1EZZlRfhI0DEkz6a/pLoVU7i4U8/HtEDKwdmk1qjEJ2BOTZnqu816KEN+O492s02zQztC1KtHzdGcUxucNKntCanUIlBYnkisVp1yGtKqXwmdw45apQRLwBJezJBY4BxHfm/pudRg3oYg3m23HEyONfS9GdJ0i0VBW2ygLvEAKkIWNEZruLVPyr2sqlNiqUA65vatx/lYC7cLu6r3P7lIL9y/qhKxf81WgQHWcCUp48nEnXr64hoBQWl0NkRYIo/pVHeo9yfz8239AjL1dVZHVtZpAsQOUfmmb8AqSLbQCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy27sn+6dSDyc2E+k2RqXWmfy8uZoeKwTECrPgWcXG4=;
 b=rNfgv+UdyTiSbwbnDxlPJlHrugSEnezT5TjuZPUCCMAc/rpXTDda7lIlrDFQfZqBW8YpING0d1IkeIrUl61t2D7yCxX2v8rosOKct/fP81+qtPGqnwkhLYJywTHgjVCpl7z5twg+m+bRwsfVPrFQNYb+QVhmbrQaZM9J981ItcI=
Received: from CH0P221CA0041.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::25)
 by CH3PR10MB6811.namprd10.prod.outlook.com (2603:10b6:610:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:20:04 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::e6) by CH0P221CA0041.outlook.office365.com
 (2603:10b6:610:11d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 17:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 17:20:03 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 11:20:00 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 11:19:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 11:19:59 -0600
Received: from [10.249.33.103] ([10.249.33.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJHJxkC2213335;
	Wed, 19 Nov 2025 11:19:59 -0600
Message-ID: <c09abe97-c3cd-41e5-be55-dd611c7d65a9@ti.com>
Date: Wed, 19 Nov 2025 11:19:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver
 version 24.2 -> 25.2
To: Denys Dmytriyenko <denis@denix.org>, <rs@ti.com>
CC: <afd@ti.com>, <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<denys@konsulko.com>
References: <20251117211517.785176-1-a-christidis@ti.com>
 <3165a1de-6525-4f7a-9795-dd00ffeccdab@ti.com>
 <20251118190921.GD3125@denix.org> <DEC9K3CR2WGF.2TLJJ2M5QQ6Q7@ti.com>
 <20251119145251.GG3125@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251119145251.GG3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|CH3PR10MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3f3eee-4322-4aa6-a4c2-08de278fe09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVNmQktHWUR0YkEwSDdhWThjNGhjRGFDMEs3MFhXTklFdWFZQVU3WmpxaW9C?=
 =?utf-8?B?b3Rsd29UaXFnYlNaaC9Tb3FoMHdhOWpjQ0FqTDFEZ2lqcWxKWG12T2RJMlp2?=
 =?utf-8?B?Q2ZYRm5wc1ZFMkxFRTF1Skx0UXRWM2ZCYlliaHNPdEdLTmhic1EreE1qUlZ6?=
 =?utf-8?B?NlhDbzh0Mm1zTEdjSDhRaHUwYU0rU3ZlbWNDdVVJZWFVQ25BSStuUXV1SW1Q?=
 =?utf-8?B?cCtZQTg5WGswanFiZzJHWnlndytpTVBhWjBleWMrZjBnRkltaHNyV0t1ZG1x?=
 =?utf-8?B?cDNJbVMrbVlySWRMMFlWbUJNNFIwTzN3NjZyaVBNNS91VjJpTktBVktzU1Fu?=
 =?utf-8?B?MmhaL0Zka29SSmExN0ZEU0tnS3BWUWo2Q3VEZjFYZ2tib2NNNU1ET2hhb21o?=
 =?utf-8?B?MFdsOHkxZDFORGYwUWI4dGFZRE55K2ZxWFRGaTEwK2p1aW1nWGVVSk1pVDN0?=
 =?utf-8?B?eUJjT2w0RXcwNkFBeUNxNDMrWmpkKzJIWXJzTXJjYkUzNEtBSTh4d1BRelpz?=
 =?utf-8?B?WEg2Z0RPNTdMVVJWVFZIbUJGY2JMZjJ3RlhhVzZiVWFmU3d3eVBZeU5aeFBO?=
 =?utf-8?B?U1VhVVM2WkFGWElBK3hKU29XSlhUSG9kbXMrMkIyN1lHYVhkdG9YR3FxN2RI?=
 =?utf-8?B?dnJZbm5HckV2ZjB5UGtnQjFTN1ZidlJYQUhHdmZDYzhPd2VpdjRhRmhoUFFh?=
 =?utf-8?B?K0hNVnNha3E1TDE5OUxrM0pBMmY5VWk2SXlTRDRnRzNMMmhOQXl3N1pCWGp6?=
 =?utf-8?B?Y1ZMajNDanFkTVFWMHQrMFNzeDBNMHlBWEt4dFN5V3Vjb3A2NTZnWjdqajFC?=
 =?utf-8?B?V0pncFBEaWt6STBtUGluSTY3Vys1N0pXMlNzV29GSW5oTEtPL1JYaGxLRnd3?=
 =?utf-8?B?MjZXYzZoYWFhVmdvRlFjMUJhclZTSDNzVGpMaGlzWlNSVjVkRml3akZLOC9U?=
 =?utf-8?B?a21YYnNIY3NBd1ZpaVBIWXppVS9ENUROSFN6cnFqUTVGanZ6RHZEMll1STVJ?=
 =?utf-8?B?RTU3Z3VqVEkzQjRYbCswcnVaU08wWGNjU3lQbE56dExnSGE2Nm92TGphUVF2?=
 =?utf-8?B?bkVVU0NBQisrZVNFUW5XNUJTSEZ6dzBaUzBCZXEyeFRyTWlSRXhUTWQ4QUR3?=
 =?utf-8?B?VXhQOW53dXA1L213aXhiQnhMUWttT1dOc2U0cnlja0c0NEs5Q21VVnY5TkRj?=
 =?utf-8?B?TXlpRjhoTDFNSkhMZmxoZG9CNzVoN3dPQ0tHMCtmTTBXNDFacGRKRzIvRmhC?=
 =?utf-8?B?VUQyckdacXlWL0JLZWJ1cmVVWEVZMXZ3NlBUZ2JlcE95M0ZLcXZoZDFCL25o?=
 =?utf-8?B?K3dsV2VabWZ1RkJqSkJjTDU4Qlh1MFQwTTJXZ1FGSVJZTUJiL2JrZnFpblVr?=
 =?utf-8?B?cGdseUlZbkN5UTZIeEtIWnhPQ3ZYL2QwTENjMjc2SFllczU4WEpmbTdGZmRv?=
 =?utf-8?B?RXNTa1h2ZmxoVnBCOTBOWS8zYW55MjdiSyt6Vi9FZU1NOXBMTkJyaUE0Kzkw?=
 =?utf-8?B?aVVwemhPemNER3hPY2dtRFNCTmV6ZjNKMVlhN3dhczVpWGRCNWlURStUZ0g1?=
 =?utf-8?B?STdXTG9uYU1YZ3ZzanpoOHJBT2hDamw4YTB5QUtFNEY5NFF1N0JIUTFiRS9H?=
 =?utf-8?B?RmFSM0xRanI3NC8xUUlLMzdqbFVqQjhETmhlZG82ZDBPaUJBa0pBL2tXczNj?=
 =?utf-8?B?T3JWeUFEdzRlVmN4SEMxU1FJdyt5Vk1SdFVsNVM4bXNaeHkvV0UvcHIrMnA0?=
 =?utf-8?B?bENrVjQrdWlaNmZFWWlSN2FLRmNaaHhZS0w0TlhxcUhHTmhaWmh0Wm94VS9q?=
 =?utf-8?B?blZLaStVSjZYejNEckRLNUlyYnQ1NnRIbGlSWU9wK2dsN2dvTk5HS2xrVkVM?=
 =?utf-8?B?dHVySDdhaFl2VTVXRWNYK0VKV1QwSXJXRHYwcUhsN1hCQjNDU25nMnE2UkFh?=
 =?utf-8?B?UGMzQ0NQdlZ0VE5ZbDY1UW1VQkZ5Zi9QTjlvTThxTFo2NzdiNENSNTRhRGRU?=
 =?utf-8?B?RDRLZXEyUjhnbDhRclN0T2VDVUpTeWpibEYzczV0ZjJKY0tVTXR6MzJNZzRv?=
 =?utf-8?B?OEFsa3NGcXNscUxZRXhKbHd6eUFhS285clJDWWlhWGswYTlmWnJjdzRacFVI?=
 =?utf-8?Q?fUcU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:20:03.4523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3f3eee-4322-4aa6-a4c2-08de278fe09d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6811
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Nov 2025 17:20:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19293



On 11/19/2025 8:52 AM, Denys Dmytriyenko wrote:
> On Tue, Nov 18, 2025 at 07:00:52PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
>> On Tue Nov 18, 2025 at 1:09 PM CST, Denys Dmytriyenko wrote:
>>> On Mon, Nov 17, 2025 at 05:22:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>>>> On 11/17/25 3:15 PM, Antonios Christidis via lists.yoctoproject.org wrote:
>>>>> From: Antonios Christidis <a-christidis@ti.com>
>>>>>
>>>>> New recipes for GPU DDK 25.2. Update BSP configuration files with new
>>>>> preferred recipe versions.
>>>>>
>>>>> For the driver recipe, specifically unset the CC variable due to yocto
>>>>> appending CROSS_COMPILE and CC, resulting in a warning for the
>>>>> do_compile task:
>>>>>
>>>>> make[1]: aarch64-oe-linux-aarch64-oe-linux-gcc: No such file or directory
>>>>>
>>>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>>>> ---
>>>>>   meta-beagle/conf/machine/include/beagle-bsp.inc        |  4 ++--
>>>>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 ++--
>>>>>   ....6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} | 10 ++++++++--
>>>>>   ....6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} |  4 +---
>>>>>   4 files changed, 13 insertions(+), 9 deletions(-)
>>>>>   rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} (83%)
>>>>>   rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.2.6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
>>>>>
>>>>> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
>>>>> index 448e2086..5060e286 100644
>>>>> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
>>>>> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
>>>>> @@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
>>>>>   BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
>>>>>   BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
>>>>>   BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-img-rogue-driver"
>>>>> -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
>>>>> +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "25%"
>>>>>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
>>>>>   # GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
>>>>> @@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
>>>>>   BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
>>>>>   BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
>>>>>   BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
>>>>> -BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
>>>>> +BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "25%"
>>>>>   BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
>>>>>   # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
>>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>>> index 0ea7bd7b..eaa501c3 100644
>>>>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>>>>> @@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
>>>>>   BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
>>>>>   BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
>>>>>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
>>>>> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
>>>>> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "25%"
>>>>>   BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
>>>>>   # ==========
>>>>> @@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
>>>>>   BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
>>>>>   BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
>>>>>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
>>>>> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
>>>>> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "25%"
>>>>>   BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
>>>>>   # GC320 support requires out-of-tree drivers not yet available in 6.6
>>>>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
>>>>> similarity index 83%
>>>>> rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
>>>>> rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
>>>>> index ddb401a5..b2f5e4ea 100644
>>>>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
>>>>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
>>>>> @@ -17,7 +17,8 @@ BRANCH = "linuxws/scarthgap/k6.12/${PV}"
>>>>>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>>>>> -SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
>>>>> +SRCREV = "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
>>>>> +
>>>>
>>>> Extra newline?
>>>>
>>>>>   TARGET_PRODUCT:j721e = "j721e_linux"
>>>>>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
>>>>> @@ -29,7 +30,12 @@ TARGET_PRODUCT:j722s = "j722s_linux"
>>>>>   PVR_BUILD = "release"
>>>>>   PVR_WS = "lws-generic"
>>>>> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>>>>> +EXTRA_OEMAKE += 'KERNELDIR="${KBUILD_OUTPUT}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>>>>> +
>>>>> +do_compile(){
>>>>> +    unset CC
>>>>
>>>> This feels like something that could be fixed in the driver's makefile..
>>>
>>> I agree with Andrew - this seems like a bug in the corresponding Makefile,
>>> where CC is already defined (with all the necessary flags), but it gets
>>> composed again directly from CROSS_COMPILE, hence causing double-prefix.
>>
>> I disagree. The CC variable in their build system is supposed to either be a
>> full host toolchain, gcc, or clang. It was never intended to be a cross
>> compiler. If it is a cross compiler, then it's not to be used in conjunction
>> with the CROSS_COMPILE variable.
> 
>> In either case any extra arguments provided to
>> the compiler in the CC variable will be stripped away.
> 
> Not correct - from the make manual, see the clarification in parenthesis:
> 
> The variables used in implicit rules fall into two classes: those that are
> names of programs (like CC) and those that contain arguments for the programs
> (like CFLAGS). (The "name of a program" may also contain some command
> arguments, but it must start with an actual executable program name.) If a
> variable value contains more than one argument, separate them with spaces.
> 
> https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
> 
> As make itself doesn't care about host vs. cross compilation, it's a common
> practice to set CC (or CXX, etc.) accordingly:
> 
> $ make CC=$(PREFIX)-gcc


I am all in support of doing this the "right way", but I'm going to take 
this specific patch because we have the same patch on scarthgap already. 
  So we need to iterate on a second patch that cleans up this one, please.


> 
>> The build system used on the km and um are the same, and the user mode
>> components produce intermediaries that are executed on the host during
>> compilation. This requirement dictated the above variable interaction.
>>
>> Yocto in particular is mixing CC and CROSS_COMPILE in ways I haven't seen on
>> other build systems. It's also only doing this for kernel modules. Seems a
>> little too niche.
>>
>> - Randolph
>>
>>>>> +    oe_runmake
>>>>> +}
>>>>>   do_install() {
>>>>>       make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>>>>> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
>>>>> similarity index 98%
>>>>> rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
>>>>> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
>>>>> index 949c2d5d..e4b95f8e 100644
>>>>> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
>>>>> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
>>>>> @@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>>>>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>   COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
>>>>> -PR = "r4"
>>>>> -
>>>>>   BRANCH = "linuxws/scarthgap/k6.12/${PV}"
>>>>>   SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
>>>>> -SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
>>>>> +SRCREV = "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
>>>>>   TARGET_PRODUCT:j721e = "j721e_linux"
>>>>>   TARGET_PRODUCT:j721s2 = "j721s2_linux"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

