Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F202D64061
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 23:55:12 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1848.1765929302666909707
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 15:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=F5JqpKyX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.66, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1zUIzHV6e2h5xbPInmmhHEZbSihN8mIlEJwW7hZNl6y/KkSNDnyPz2qcNcoyQ7k68P7N2yqMGsjQL88uBYDogP77dXHkyL5B+58dddyJO8Pl66Lz04ge8Fs9U9Tb5Nf6LspinYy9Q5getpIGuOtIDgwj1xgvBEpIMKUV7QoVpCZDmEPrBhmzVhfkUuTu6r6PuafV7TKkiYNRmW++Z5Q4l5ttzEDkK9sq/RQvcKZ2vUSsEwEOil4/+OaF0TVy7t8fAynqNnIJeKnf9r4lkz7VHAUHlW4Ld3AdzpculiE3novyWHt68GKdwmpldq5TrQATPTWTPTZH0yg8lzEpvbZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1DHXS4u2hDc5EcRYpucZ2hmE7Pe5mRCnvFf1TJ8UHY=;
 b=uP4pdkcUoaZqT/ZamHf4sL1QKO/L5k7QmjHqeuR8MhkzykepuWvtO1/vE08onXJPn9sZHHtazEA4TC549WcjxbYHDfBJgVAlPOQXz8FVBXIxqTN78/qDxOyg7TbyBmvm2B2CYOzykwd4gBry18pJv3SZe783SNYgGg9F1cZ3VcaIsQdaEj8dvkdcfKoECfNSMUA3rulbKYiT/6SJYMe8s30lD2/yhdebwQ5ulncyTG6XOuzuHg15DcAOoeCPELuRB9DULMhl5UsHvTuOaS20uVLVdprRaqK0t89s3SW4zYw1Bb6ZQE14tAxV0VDeJI57IoN1gRh/erR2iKQqlDcqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1DHXS4u2hDc5EcRYpucZ2hmE7Pe5mRCnvFf1TJ8UHY=;
 b=F5JqpKyX+67xXpdPQVW99wTAaBxJNdcVpOA9uU+xO+eOWh/g5Zmp+dwrVqCDRpU+FsiyjuUHQFl8I8F2Up6PNdNB/mmx5VLnFns3/mY4A6XDAfhWMHsrlDxEG+FLmORzIAPnk3UeGHoF+XWYJ3rVZm1B4MBUtY8NyRw1/NmrOsI=
Received: from DS7PR03CA0126.namprd03.prod.outlook.com (2603:10b6:5:3b4::11)
 by SN7PR10MB6499.namprd10.prod.outlook.com (2603:10b6:806:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Tue, 16 Dec
 2025 23:54:59 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b4:cafe::f3) by DS7PR03CA0126.outlook.office365.com
 (2603:10b6:5:3b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 23:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 23:54:58 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 17:54:55 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 17:54:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 17:54:55 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGNstcj614282;
	Tue, 16 Dec 2025 17:54:55 -0600
Message-ID: <5c8a14a2-bd66-47e4-a56d-9d91ff5202d2@ti.com>
Date: Tue, 16 Dec 2025 17:54:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] meta-ti-bsp: Add support for BeagleBadge
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Andrew
 Davis" <afd@ti.com>
References: <20251216221652.2231748-1-jm@ti.com>
 <20251216221652.2231748-2-jm@ti.com> <20251216225454.GX11121@denix.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20251216225454.GX11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SN7PR10MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4567f8-faa7-47b1-f65a-08de3cfe855b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWd4Yno2U2g4M1BTMnlLZGNPMG9zd2oxTGZBODFvMHFnTXNkL0hMR1l5V3ls?=
 =?utf-8?B?YnJ1WDFzQm1GcENkVitwM0tGb3NEMTBpY1dYT3ZwbEFvVU5mZHE2b0RUeklq?=
 =?utf-8?B?Ry9oazZ4ZzQwN21HQXV5WUE1RWpxYlVsWEg0Mk9YR0tlNy9NazRER0ZQWHJK?=
 =?utf-8?B?cVpUdTBzVmgzMnhXQzVsVGd2d0graHBvbStsZVNjUW52aldEZ0YxNmpCdlJD?=
 =?utf-8?B?VFZCcEN4T1haWWVrWmEzWFN3aDM1UXdQOG93RnRxb2daUmNkZ0ZKWktPZFlH?=
 =?utf-8?B?eGFkNjVOVU8zWlVOaEdqRVRvd0tJOW82STZMV2NUNXJZNVE0M3RuQ2ZXMXhC?=
 =?utf-8?B?SVNwSE1DSTRiWmQ1QURkYWZpQktlUG9PSUs4WHQxTC9rRTNBUXJNMDdvTjZQ?=
 =?utf-8?B?TVRXeXVCbDZIcEIyTHJVdHFrYWxCem10Nlp5OW16Rll6VlVrZ0ZQbjR5NC8z?=
 =?utf-8?B?R1dqVXdmSnBUNW5Zc2tka2hCeXJZTTYzTkF3NXM0VlZFdTFZZ2FNQmZRdlMz?=
 =?utf-8?B?TmY4VStJRnBNQkRQRk5WMWwyWTRhVVR0akNMdmV0OE9ZekRIemZIdGZCOFRH?=
 =?utf-8?B?bWxRTkx2NVRuNk5BNVZhMmw5eERRRXloNlZ4c1l5eGRRbzFKeWtWUmFSUnhM?=
 =?utf-8?B?aFYrRGpZU3ZTcjhqRjBqRHliV0R0TnZrN25lVnpiaGRHcXJyMWhCcUl4T2p2?=
 =?utf-8?B?RFpmd0IreTNld01EMEhubWpQVVlSYXZscXJZWWY5MzFkblZ3WDc2TFVrT2dE?=
 =?utf-8?B?L1ZueEFqbW8xU1pIdEZBbTZyeDdDK2JBVGxrRXdFanJJSTFRRTczMGR0WGNa?=
 =?utf-8?B?MFRKd09RRFFQMytrL2ZjTnU5WDM4TFJnOWpvaXZNUzJ3bjErdWxwR2xwTVVD?=
 =?utf-8?B?dGQ4RVZRUW1ZZ0JiK0VwTWIrNlg5UURHWlZRRkRERjhLZzR3aU5Yd00wS1Nm?=
 =?utf-8?B?K0RaZzg0RFJoeXo4MGN2YVFXWXNCaHk1S2J0SGJ1R1ZyY0tRTCtDdEd4b043?=
 =?utf-8?B?QzlPTld1amxhcWxUc1o3c0Z3ZFhpYzFZZDNKRy9qWFd0YUhiVS82UlBMZVVQ?=
 =?utf-8?B?dGNnRTJ5a0t2cncwUitEWndyYS9sbmQwMWQwc3NLNlhUQXRKWHV1YzBqd0F0?=
 =?utf-8?B?blA2ODd5SWNxNGFXK3JSNSs3TGtDc21QNVptTytUQlc0ZjBBVUVPWkhCQWs1?=
 =?utf-8?B?bTN1c1hFTnd5aWpadGEvMS9EY0NNc3VjZjZMMWlvVld2NXp5bm0wOGV1NGJk?=
 =?utf-8?B?ekZSUFphK1RUcUtpYkVKS0hJWHRPN3NKNHROT3piRVVVUlFiYVVkMHZrNUUw?=
 =?utf-8?B?S2JTNUpKaHIyMm04RFc5UGtIaTUyb3N6c0V3Y2lvN1hrVVVRVE0vM2d2bUU0?=
 =?utf-8?B?RlByaFRhRFZraE5FQXM3M09VYmJNdXljV2dsWXRnL1pISUoxWit1bWxaRXVM?=
 =?utf-8?B?dlBCOVdRRjA0d3NHMzBFOU1walY0MkdZaDFOWDBmRWIwRTQ2SXdWWHdCZFEw?=
 =?utf-8?B?bzBiZHpVLzgxZUlNa2N1UHdyQTFzWDBTVHN6UU9wYlI1dmNTNzRUVC9Vbytx?=
 =?utf-8?B?aFluc1BlcGVjSjVWRDY3bU9JSGJpVmxpRnoya1dqTXUxaXhpTnIzYlhKa1Qr?=
 =?utf-8?B?eWRJeXNSU1lvV0YxUnA0S2dINk1qQytQNjVMTGoxSFRnc0V4bDFTWEVvd21G?=
 =?utf-8?B?eVhId1lKNkFjNFdrNHpqRnJDb3FhSnM4OTJERHdWaGpKenJ6VTJJeVUxQWdh?=
 =?utf-8?B?UmtNSWlNc0JpQXlsT0xZTDdJTWhNSXBwNHZSVmVwY0hwZTFkeXpVb2k4SDht?=
 =?utf-8?B?N0ZjUG9IUmZDdEVybithaTFEdTQvc05uWHhQdHJqTVJvQUZ3VVpIVnM2UGFG?=
 =?utf-8?B?dU8raWR3UWpCcnBVQzMzQnB0SHRvWkllaVRCdStndjBORVMrQXl3OVhRZXpo?=
 =?utf-8?B?WUZCekw4NjhYcU4yR2Z6aVJ1TjFnb3YxNlBWYU8vSUtuMUNsUWRTbXR3T3dw?=
 =?utf-8?B?Tlh2emttUWEwTjhNSXBRYVNFUDdnMmR3OXlUMXZ0cUgySG9kNlA5RkhwTDlG?=
 =?utf-8?B?WTU2QTVSS2xXNEJJQ3lpcEsyT0hSRHRWdkNvdDkrdm9PcEJZQlFnd0NnRFhi?=
 =?utf-8?Q?B9Jk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:54:58.9188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4567f8-faa7-47b1-f65a-08de3cfe855b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6499
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 23:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19368

Hi Denys,

On 12/16/25 4:54 PM, Denys Dmytriyenko wrote:
> On Tue, Dec 16, 2025 at 04:16:51PM -0600, Judith Mendez wrote:
>> Add support for the BeagleBadge which is an AM62L
>> based device that requires new build configuration
>> for U-Boot and TF-A sources.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/beaglebadge-ti.conf | 22 ++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>>
>> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>> new file mode 100644
>> index 00000000..ff870c92
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>> @@ -0,0 +1,22 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62L Badge
>> +#@DESCRIPTION: Machine configuration for the TI AM62L Badge
>> +
>> +require conf/machine/include/am62lxx.inc
>> +
>> +IMAGE_FSTYPES += "ubifs ubi"
>> +
>> +MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
>> +
>> +UBINIZE_ARGS ?= "-m 4096 -p 256KiB -s 1024 -O 1024"
>> +
>> +KERNEL_DEVICETREE_PREFIX = " \
>> +    ti/k3-am62l3-badge \
>> +"
>> +
>> +KERNEL_DEVICETREE = ""
>> +
>> +UBOOT_MACHINE = "am62lx_badge_defconfig"
>> +
>> +TFA_BOARD = "am62l-badge"
> 
> So, everywhere here the platform is referred to as "AM62L Badge", including
> device tree, TFA and U-boot configs. Why is the machine config then called
> BeagleBadge? Does this come from the BeagleBoard.org?

Yes this is a beagle device, but beagle sources are still not updated
to build BeagleBadge. In TI trees, we refrained from using beagle
naming convention until today, that is why you see AM62L Badge
there.

~ Judith



