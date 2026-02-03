Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DF2E87844
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 16:06:16 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19990.1770134773001073498
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 08:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qyNwkSFB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.25, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmIeRVjnrZP3A68Zed3xHYRiZqN5WGTAZhpLsQe7/SoYhBgVxLbxbgGRP23XsbGr6N/DNUkAS/CW6OZ0xKUBtlvKQ5bCz8vhQlerDXrE+F7L3KDJ0e0Q3pG2Y8MQ8ICuKp5kXVuitkLlH5VTw4DMiSiKVLGKTl0I61fW7iOL3LdtPq+n73Y9C4sw27CCB9N2G6ocoMEU77KVDFkTJFb3L+7g1mLRSI7/+VL4W1dUkCd9485Jlb2bpS0Il9czbB8NSlUKM7w32SDaBE+y//4dpQak/fPMbI5dKHx3zbZa6pImO6YI0ws8cs9eC3CyJKJUnn5baTfdgIqLD2mGGtN4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zg1jAwAUsM7La01oKU1yKKVAzvT3As0YvbELzsM72ZU=;
 b=ahgYtR7LtfnXzdTYSNJ4mYiZ0tql2Tq+1LYKZMPT9Rpn84f4TeJnt2ItHsPdSPRX/Nd4YAR/QSceH4DjdyTld4p2sv6chQohTTtPTZmL0B7FY+YQ/ujdbty9upp1H+0nY3H5uP5Geh53TjEXsU8sg7imV5rra0pR0yGo4FZrgltnQaw05nW9sJMHziNEAG9QU5JxyJB8pQoV+3sPrBtHchQwlxfkY10u9fCjscJqIyzBX1XlQeGcuBT4dh7BnPsDVfe9V/iKFMdHtllGsOVZqnFLI72HmX9CWi9sj2fcQWoQkJXLyEcUywk/fWer59YOGUptikHM4WUuevv1YxMZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zg1jAwAUsM7La01oKU1yKKVAzvT3As0YvbELzsM72ZU=;
 b=qyNwkSFBTApPUPRKFZFLyEwX/1slo5WSmIVe8BMpUnAbGPEGFmzemwcQuQ3sXUiKED3FGtdG4eryPKUj+lgeguXVLt3QsrnYoazs4WSV9TaUlJsV5PSJ4ZJVB/zEWEz/XfX3cY/jjJ/8bjdrCgmppkIov0tEPRvQWrA6ujNAvTw=
Received: from PH8PR21CA0009.namprd21.prod.outlook.com (2603:10b6:510:2ce::26)
 by BN0PR10MB5048.namprd10.prod.outlook.com (2603:10b6:408:117::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 16:06:08 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::c0) by PH8PR21CA0009.outlook.office365.com
 (2603:10b6:510:2ce::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 16:06:07 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 10:06:06 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 10:06:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 10:06:06 -0600
Received: from [10.249.64.47] ([10.249.64.47])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613G66Gd019022;
	Tue, 3 Feb 2026 10:06:06 -0600
Message-ID: <347eb022-bead-4c37-8046-ebfef716bbcb@ti.com>
Date: Tue, 3 Feb 2026 10:06:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Shrink size of
 initramfs
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260109182737.2973551-1-reatmon@ti.com>
 <188C8BB97D98E175.3496637@lists.yoctoproject.org>
 <188C96B95948D0CB.2979268@lists.yoctoproject.org>
 <20260203153538.GV11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260203153538.GV11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|BN0PR10MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 534eb761-41e9-4459-babc-08de633e23b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|4022899009|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlhsQkJXN3pDL0NnaHZ4MGpIVjdrTkk5ZjdQMEsrYWZDQ09uRDYxczVmeHhs?=
 =?utf-8?B?NEg5alpTcitIKysyNjVoRDNZekxpbExaYUtlaFVFb1ArWG5LbUN6RjljTjA1?=
 =?utf-8?B?WWlZWDRRQU5mazNtazA2MEQrcHFXSHlsMFlvL25KUVhtY3p3VFZrTXVJcm1Z?=
 =?utf-8?B?NHcwSks1cTJ1Yzl3bm0wYm5YMENZaG1BSGF1cWFIb3pINXA0aXFMaE1PNFpo?=
 =?utf-8?B?Qkg1SlgvU1JGZnV3TU1ZL3FWVDdQckgwdlh2QWFYSzRidWkycHNaM2QzZWdj?=
 =?utf-8?B?ZU1Tc1V5dmR6TXNYbkM2Z2lEcUR4MkFTb3dkN28ya01UbVFQWnU0YkIxVzcv?=
 =?utf-8?B?S2FUeWR6S2IzTTBLSVN4Q1poWW9vNDJlSDFLRTJESVJIbTY2VkdmbllHcnFh?=
 =?utf-8?B?TUorVnB1RmFXOXZqTHNkNklOVlRiVzZaVExmVUVYNTRRVmt2RjNSZnV2NTg1?=
 =?utf-8?B?Sm1veTZZQS9ZVGNSTHRTSldacEVxUG85Q1NXazZNZ2NhK2ptUCszcjk3SG9p?=
 =?utf-8?B?WFFMU1Z4cUNZME80Zm0xM0ovRDBUcGR2ejdFUWpXSEdSNy9vTUU0c3RkUG53?=
 =?utf-8?B?RkRCaG1KaWxYMkUxNEV0Y2lsaDRuUUVYemhRY25LNFUvanB2enZEVThnYzRT?=
 =?utf-8?B?MkhSS0pkREM2Z25lQ3RBU3hRclltbDNFSFNXQmIxeWxFNFBQZmhOSkxpeFd3?=
 =?utf-8?B?U3NHcThwU3ZOVmMySGt5eVY0SEdabHkwbXZuVWhla2Y1cWZBc0c1aUVrclUw?=
 =?utf-8?B?T0x3K2RyTXpRQTY1aDJBVTV2cy9jMHZ6aWlVQVZrNXdieGVwTkxmUkJWaFl3?=
 =?utf-8?B?UXdzOHNVeHozRlJVQnIvR3NRU3FoTFExSnExNzZvd0VrWlRNNlJMU1dUOXRo?=
 =?utf-8?B?QktWSGVMRGhhc3Z3aE9OQVNPYldTeCtpNEg5ZVFONWMzN2NRREV5V29CTFhv?=
 =?utf-8?B?NWNGNXZPaDFGZ3hRNkNiYjE2RkErNStVYWQyYjgrOXVaNStEVjloa3Y2QjZq?=
 =?utf-8?B?MXZYUFhRN0dmdlBycmcybnlZQ3BtZnl6VzdicXZPWVBKclUyam5yRzByb0Jr?=
 =?utf-8?B?SnRtc003ZjRMS29udndySGxWamNyVkQvZWxtNCszeFZPUzJrc0dIeXptSmds?=
 =?utf-8?B?S1o0S3JmZmhuMW9MQ0NJcERIY2UrSEtvQnJyREFIKy9ZUU9zNnp6cDBvZFhO?=
 =?utf-8?B?RWJsbFcveXVlaXRNeW50UmEyT3ZQa3FvakJPa213NGhYSFA5Z2xyZnhvZGFH?=
 =?utf-8?B?Z1FkQmlHRWhrUGFwOHFQUTVHR2RsWWhZZVpRUHVvTFdzMENIMlJ0OUNlWmx4?=
 =?utf-8?B?N2ROUUVoQjh5TzNFZE1yelRKWHZGOWxNS2JNeDg2QkFTTTdBLys1S1grQmhC?=
 =?utf-8?B?eGx3bURyVDZ5TzVKN0ZQdTBqdVBoaDVvQzI5TncvMDI3YklsUCs4R0RiYlJu?=
 =?utf-8?B?cThCd2xnZjVJSWZuZ0Q2Y1Z3V3JiYUVlWldQdWp6bVlDK2hzbmtkTHNRUEZV?=
 =?utf-8?B?RGtHUzBpYjdOc2FwZU90YWh4aUppRWhGWUxXZGxaUktiOUZSZ2ZvKzVmN25x?=
 =?utf-8?B?U0xHKzdKZzdFcDMxa2JqZ3h5ekdSb3I5bTZLTUFnMC9mQ3FIejkzTTUzUjk0?=
 =?utf-8?B?SWU5bGhQNkpVNTRGQUphMGYvQUk2ZXh6ZjFDUzNPUUFid25GQ0xVeFZtL1lK?=
 =?utf-8?B?WXRmSmluMzhGRW5IZW9WM0Y3Y1NyMVpVR096azNXNUFlSWVVMEsvb3ZIbUdY?=
 =?utf-8?B?enhoWWI0cXJzMFNFYTZDa3Exai9rRS9tZnN0VC92N01lOG81S0JlVmRBTSsy?=
 =?utf-8?B?cXAxRlJuR1lTOHArTWhkbWNvWGtvazdUdFpFNGNBZVAxR1VaSlMvdHplc1VY?=
 =?utf-8?B?WTZlREhmU1NJU3hXbXd2cm5WMW8wWnk1dTh1VjM5N05WUHd4cHJGbTF4TG53?=
 =?utf-8?B?UlI2bWFFcHh1S0JVTWpSRGVGK3lPb0xBOG9aU013dEEwZGZGblZ3VnJyVzVx?=
 =?utf-8?B?VUlaSXRXUXJVM2FlK0taNFFNZ0hnNWMxZkFkZUdQSnZDck1yU1d4OHZ4ejRQ?=
 =?utf-8?B?Y0VzaUNaRnpNRHR2cG1GNVdpRzc0YUlzaWI5RzYxSDczUC9PamdFZnU0eU9s?=
 =?utf-8?B?M0R2enBOWEpvdHVMVGg3V1lmeXhRZ2xMcWxDUXNGdXVXTkhDbzZxQ1ErZ0dC?=
 =?utf-8?B?aXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(4022899009)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9sJgRQoxCzVtb3VnBDTEDNZw9Uvi6E6pM66402l1RAZEd/rkIhVzFUiidbogyOf9Za7On7UddaXVRy6WQMsLY/4qT2PoPYcYpuRhS5QBYb4Kgubn9fMnRNQFK4RsEwMc85qBX0hRsYqDeqL4tF+3QdggGK8b1Qnl/2Lr8SVDoyWwcrWn8js0tyTUOs3eAuL1Gg0xzrwnSB5mvHfE/Y+yIToBKKm+rvDheRtkDQubg0H+5oPiv4PJxBc8r1cIKWDILGuXE2SkO1Djh6zcTZXFBYpKNjqESITHe4JHJFIYvtY8h7oWXLsqn+xLf/BXeb4vWW3VsC8Nrzi4rvqTkwZ1MBXlz2Fd3euytv5j2g4jBoO6oOAlIlh2gby+NuE6a+B6+qpNTZS52H2KYW1RNls67kUpohk0kzIK96e8RMqasdMicSWO7eG5ueWh+brrKHvV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:06:07.0812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 534eb761-41e9-4459-babc-08de633e23b8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5048
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Feb 2026 16:06:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19459


Yes.  Please send a patch.


On 2/3/2026 9:35 AM, Denys Dmytriyenko wrote:
> Any thoughts or commentns on this? Should I send a formal patch?
> 
> 
> On Tue, Jan 20, 2026 at 07:14:30PM -0500, Denys Dmytriyenko wrote:
>> So, if systemd is required and to respect other VIRTUAL_RUNTIME vars, need to
>> double the initramfs size to 128 MB.
>>
>> Yes, maybe systemd recipe in OE-Core needs more granular packaging for only
>> pulling minimal dependencies in order to get even smaller...
>>
>> =========================
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> index c759808c..5ed9391e 100644
>> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>> @@ -11,6 +11,12 @@ TI_INITRAMFS_KERNEL_MODULES ?= ""
>>   RDEPENDS:${PN} += "\
>>       ${TI_INITRAMFS_KERNEL_MODULES} \
>>       ${VIRTUAL-RUNTIME_base-utils} \
>> +    ${VIRTUAL-RUNTIME_login_manager} \
>> +    ${VIRTUAL-RUNTIME_init_manager} \
>> +    ${VIRTUAL-RUNTIME_dev_manager} \
>> +    ${VIRTUAL-RUNTIME_update-alternatives} \
>> +    netbase \
>> +    base-files \
>>       base-passwd \
>>       initramfs-framework-base \
>>       initramfs-module-udev \
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>> index 223fef7a..ddf4e5b4 100644
>> --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>> @@ -9,7 +9,7 @@ LICENSE = "MIT"
>>   
>>   INITRAMFS_FSTYPES = "cpio cpio.xz"
>>   
>> -INITRAMFS_MAXSIZE = "65536"
>> +INITRAMFS_MAXSIZE = "131072"
>>   
>>   IMAGE_NAME = "ti-core-initramfs"
>> =========================
>>   
>>
>>
>> On Tue, Jan 20, 2026 at 03:52:56PM -0500, Denys Dmytriyenko wrote:
>>> I'm not sure this is a fully correct change for the ti-core-initramfs.
>>> It might be fine for the tisdk-tiny-initramfs though.
>>>
>>> If I recall, the requirement was for this initramfs to use systemd as
>>> init manager...
>>>
>>>
>>> On Fri, Jan 09, 2026 at 12:27:37PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> License-Update: Moving away from packagegroup-core-boot.bb removed the
>>>> LICENSE setting.  Just adding it back in.
>>>>
>>>> It looks like we were modelling this initramfs off of the wrong example
>>>> from poky.  This setup produces a much smaller initramfs.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>> v2: Add missing License-Udate.
>>>>
>>>>   .../packagegroup-ti-core-initramfs.bb         | 12 ++++---
>>>>   .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++----------
>>>>   2 files changed, 22 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>>>> index 86b69aff..c759808c 100644
>>>> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
>>>> @@ -1,16 +1,18 @@
>>>>   SUMMARY = "Minimal initramfs for boot requirements"
>>>>   
>>>> -require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>> +LICENSE = "MIT"
>>>> +
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +
>>>> +inherit packagegroup
>>>>   
>>>>   TI_INITRAMFS_KERNEL_MODULES ?= ""
>>>>   
>>>>   RDEPENDS:${PN} += "\
>>>>       ${TI_INITRAMFS_KERNEL_MODULES} \
>>>> +    ${VIRTUAL-RUNTIME_base-utils} \
>>>> +    base-passwd \
>>>>       initramfs-framework-base \
>>>>       initramfs-module-udev \
>>>>       initramfs-module-nfsrootfs \
>>>> -    nfs-utils \
>>>> -    nfs-utils-client \
>>>>   "
>>>> -
>>>> -RDEPENDS:${PN}:remove = "grub-efi kernel"
>>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>>>> index 1a102d82..223fef7a 100644
>>>> --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>>>> @@ -7,29 +7,26 @@ DESCRIPTION = "Image meant to probe boot essential modules\
>>>>   
>>>>   LICENSE = "MIT"
>>>>   
>>>> -inherit core-image
>>>> -
>>>> -IMAGE_NAME = "ti-core-initramfs"
>>>> -
>>>> -IMAGE_NAME_SUFFIX = ""
>>>> +INITRAMFS_FSTYPES = "cpio cpio.xz"
>>>>   
>>>> -IMAGE_FEATURES:remove = "package-management"
>>>> +INITRAMFS_MAXSIZE = "65536"
>>>>   
>>>> -INITRAMFS_FSTYPES = "cpio cpio.xz"
>>>> +IMAGE_NAME = "ti-core-initramfs"
>>>>   
>>>> -IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>>>> +export IMAGE_BASENAME = "${IMAGE_NAME}"
>>>>   
>>>>   PACKAGE_INSTALL = "packagegroup-ti-core-initramfs"
>>>>   
>>>> -export IMAGE_BASENAME = "${IMAGE_NAME}"
>>>> +# Ensure the initramfs only contains the bare minimum
>>>> +IMAGE_FEATURES = ""
>>>> +IMAGE_LINGUAS = ""
>>>>   
>>>> -IMAGE_OVERHEAD_FACTOR = "1.1"
>>>> +# on the kernel image.
>>>> +PACKAGE_EXCLUDE = "kernel-image-*"
>>>> +
>>>> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>>>> +IMAGE_NAME_SUFFIX ?= ""
>>>> +IMAGE_ROOTFS_SIZE = "8192"
>>>> +IMAGE_ROOTFS_EXTRA_SPACE = "0"
>>>>   
>>>> -# To further reduce the size of the rootfs, remove the /boot directory from
>>>> -# the final image this is usually done by adding RDEPENDS_kernel-base = ""
>>>> -# in the configuration file. In our case we can't use this method. Instead we
>>>> -# just wipe out the content of "/boot" before creating the image.
>>>> -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
>>>> -empty_boot_dir () {
>>>> -	rm -rf ${IMAGE_ROOTFS}/boot/*
>>>> -}
>>>> +inherit image
>>>> -- 
>>>> 2.43.0
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#19458): https://lists.yoctoproject.org/g/meta-ti/message/19458
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/117180106/6551054
>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

