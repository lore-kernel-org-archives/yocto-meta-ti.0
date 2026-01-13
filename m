Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD0ED2D108
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:17:52 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60014.1768313867168671943
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=eYVuei81;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdHXbfIodcWMvcRW16M6OPtLAP+ulT8W9lyEDj7CrvkBZKPBi/+u+Me+Y21MJ7sjt3n29kbRz5+5Am684XcsjnIf23XeJPQBawJn23p8pBdQc7AY2q2Y8otQGoPvQeKV3zKqvvRd0hTFt/aiUSaKxCf1RdEjRs3O8OxYNYJHTlFYl/2UO1VlcenfcK73zoJ5FhMFp8eNth5DLeHQXJCKQIeGb4nt7II0XSPpKkzbyIoDk0NCmcZjcUYKDOxOlaYx4ODusX/69JLfwe4xNyhvYWwz3JHA8DPo1xoZ2lnAEYMsLUwTQ10YZbrcXRny7itwJUY9x4WyzmlDeMyK/H/9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNMf3N/N6VB6WzjDAts4d8CaMNkwzVigkfb5g3sNFmA=;
 b=q6j78IVit97Qw/2VX2Gbk7YRq8/ygR8eimYj0snMjkB577TYJ5LV9IX5mHfkqwAn8nCpK+EwP9VeFIbvk9kaRXgSqUN9CoFNAbL4BNpDZtwt7yzMRe/hORK5rT9JIoI8jMLR5Fmg1Eo2ySHIfUt06F0/uSzd8pA+Qzg1vZWWb+xt7ebUbXeYDF6cQiwLux5CHbJhUgWKU1I8t1YP8NwxrSqEc7KiryRcQKnunstZndni25vaV3psnaN1GSMPab0dEoKqEE26DEM9ptHL0iJ0NkZOyfdZ/2Wj/GYRJEQkplSXaBU7p8kJwKQqUGIZBBdy99cB9ajVQxvMxCdOS2jjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNMf3N/N6VB6WzjDAts4d8CaMNkwzVigkfb5g3sNFmA=;
 b=eYVuei81UvI/eHgR6odxtHBCeWysxfRbTqjmVmoDDtItPKoVNRM/14QGHViV1pQRwuAs6d4jKMJqD0iMbtAeM4HFJflyAOhk3ZURYaOZ6dnhpLMaOYE9JF7l50RmMg2pfHAqVhnq3GuSfR1YvimCw0J9X7C04KghFLJTBLoLoX4=
Received: from BL0PR02CA0105.namprd02.prod.outlook.com (2603:10b6:208:51::46)
 by IA0PR10MB7184.namprd10.prod.outlook.com (2603:10b6:208:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:17:42 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::ff) by BL0PR02CA0105.outlook.office365.com
 (2603:10b6:208:51::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 14:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:17:40 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:17:22 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 08:17:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 08:17:21 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DEHLwl2382519;
	Tue, 13 Jan 2026 08:17:21 -0600
Message-ID: <86235717-16b8-4a88-bed4-3b1849cc5628@ti.com>
Date: Tue, 13 Jan 2026 08:17:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] initramfs: Add dt_to_config script to initramfs
To: Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<a-limaye@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260112093125.73038-1-m-shah@ti.com>
 <73d10ac5-9888-4313-a8e4-f7ec3611065b@ti.com>
 <20260113115517.q4jhbqlu6zhdrdlx@antiquity>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260113115517.q4jhbqlu6zhdrdlx@antiquity>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|IA0PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 581962f0-a2e3-4736-78b9-08de52ae82f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TUpPdDR4eFZUajdiMkJjNXZYTUJMVmtrV0xhdkdNU1gxdWlGNHFyTmZVdEtq?=
 =?utf-8?B?c0l6M095NDcwTVJYNGl4QktzWHRoNCt1M1J1elFQQXRIRUtxdzkrSzhkNTg5?=
 =?utf-8?B?SDlhOGh4T0wyWG10d2VpdHFUak9TUzZyaEVRbHJpZFM5c3NmYjVUbHpLYnMy?=
 =?utf-8?B?eVh6MStZZ1B6TFMrQWZYeDc2ekFSSWJCdHFjRks0Y3llaWhBNW9MWUxTVU1O?=
 =?utf-8?B?NEhOb1gwb2lla25QeXFNekxEcE9jQ2FTVHFFSnZ0d0NScHFHWHBXRmVhWlUy?=
 =?utf-8?B?NWkwYTNwT0NtcnZ2OFZqcG5xRG9ZU0c3K0d3Q2c1Z3NRS0gzZWQvYWlNWnhQ?=
 =?utf-8?B?VUF2RUVteVZNNEhTRG5Mbk02UzQzdmRSTGNhNDVNOWh5ZFZ3bW1vNGphNytq?=
 =?utf-8?B?bVFWN2xWRGJpWXh4aDF3cGRGdHErdUhtZ1Erak9BTW10SlIveXJlTlVscDZ0?=
 =?utf-8?B?YjdTYlhQcm5iRHJvTlFCRWM2RERWdENxUWFRUVd2SE1KVFRkcmZseGhQMkNs?=
 =?utf-8?B?SVAvUmdpMHVNZVI4cmRLeHRjbmluV1ZJSWsrUkExV21qWjdOS0JtQlNGbmoz?=
 =?utf-8?B?Y3dLdGJSUVQyWHFTN2EyWnpzNkoxT3IydVgrbm51MTBYM25xcWNMenJqeFF2?=
 =?utf-8?B?UHFBaFF1d0thTGRSZWpVWkw3SUNxTW00NEh5d3k4U2ErUExtV2t6OS8yM3Qx?=
 =?utf-8?B?MVh6NGhwQXQ1aFgrcWFKekMvZ2xGR3JCYnN1WWQvbkhQMEF2S1JGOW5oYmsy?=
 =?utf-8?B?aTREZFAyQzg3MVhGcW1ZWGhDblVYSFFLdTY2a1lTNTJEaFVzSzdnbDA5NVgy?=
 =?utf-8?B?dUI0djhyRTBvMTVQdDNOa0JSbjNIZC9oazZGVVppbDJ4TGQ4djZCcFZ3MTNk?=
 =?utf-8?B?ZFhqNVdWWGZ4aDEvMVhBSkRRSW5oa2NhVTFIeE1WTk8yQkRLVkJDYWxGOThQ?=
 =?utf-8?B?MDJjNmlhOHlhWklwclE0S1lSQlZSTFZ0TUUzVjByM0pXa3JvVFlNOHdIU0Vu?=
 =?utf-8?B?azl1b0Z5QUFEQzY4Um1NZ0pVOTNsb0lJak03eHR1WVl3M1o1TlZEcVZJTDVv?=
 =?utf-8?B?K2hhYjI2ejFjQlRONnlsRitmRGpSSE0rd0xhU0NLcTdwUSt5UWZyTHBqWVI1?=
 =?utf-8?B?WExsb2ZEcDZYTFNNOHFUckFCSEJrSmQrenJhNlZnT1JYdSt3dmwzUjhRdEhZ?=
 =?utf-8?B?OERFaG1ZUTZxQXJFZllIbkUxUEVQTytnQmZLNkx4U3ZtSXpNS0JsamlDU0VC?=
 =?utf-8?B?L21tTWhMOGlGcUdrbjJPb2dTSWcybDlDYmZPQ2F5dkhXcXhnZ2pvaXVoR1oz?=
 =?utf-8?B?OG1pSnpLZFZrZHNzVGkvd2lNMnpVU1JCbHBveXlWM3dLOUc4MkZEcElaaGNn?=
 =?utf-8?B?TUhaZzhRbUJTZGNXajZMQUdGT0NvL0t6UXFpZzdkMTlxYVpCUmZlRUVOU3dC?=
 =?utf-8?B?NWljeU5KREtjOWl1ZEtQYTRmMzRBVWZuSjRCdWlJVkN0ZTJxTzYrMDlEOTJi?=
 =?utf-8?B?L2dUWk5JTUlEUjBsM2tkMGRkbXQxMTBQV0I2NGxHVkIrdXUvd3p5R05DNFNU?=
 =?utf-8?B?RE1UVndwVGMzOUw0Rk93OENKaUdPaTdTYktycUJwdWFHcEVGanduR1grazRS?=
 =?utf-8?B?YkxOVVJQcTIrN0dnK1VzeDFGb0pXZlNYS01vNFZGNU1tcUY0MTFIVy9kTHZ3?=
 =?utf-8?B?QkpKOWhlanRDOGMrWHE3a1YydTNoYXZzN255KzZmSThXK1h0dWYrTjhTU04z?=
 =?utf-8?B?dDJuWm1aY1JlQ2ovYjh1TW5PVU1GWUdHWUliTE9KeFV2bUFBOVVGa3BldG96?=
 =?utf-8?B?R0U2SUR0c1ZJSlpYRkRVK1FRTTZmci80L0RZZWI0aGsyU0xLcXJkSTdYMUV3?=
 =?utf-8?B?Zmd1ZWpWNElMV1RBcTlGbzh2bzdHMlZNK2R6Qys2TDJBMjYyblJpLzVsZFNB?=
 =?utf-8?B?VktXQkFudmJ4Y0xLdktLcTFJQ0lNRlNVYmk4eXpwcGVqTU1PcXRxYUVnajV2?=
 =?utf-8?B?WmVWUmIyRDY4dVpqcjRQSDdaVE4wNkowcWJ5bk11aWZ1QzAyTWUwUmk2Tjln?=
 =?utf-8?B?K3dZL0hNOWprckdNZTEvUjVodUlvVkFzOTIrZFZadW9mNi9CUlJqanlKZm50?=
 =?utf-8?Q?xgW4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:17:40.7279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 581962f0-a2e3-4736-78b9-08de52ae82f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7184
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:17:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19410



On 1/13/2026 5:55 AM, Nishanth Menon wrote:
> On 08:43-20260112, Ryan Eatmon wrote:
>>
>> why is this needed?
>>
>>
>> On 1/12/2026 3:31 AM, Moteen Shah wrote:
>>> Install the dt_to_config script to initramfs image from
>>> the linux kernel tree.
>>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>>    .../recipes-ti/initramfs/ti-core-initramfs.bb  | 18 +++++++++++++++++-
>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>>> index 1a102d82..44574377 100644
>>> --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
>>> @@ -29,7 +29,23 @@ IMAGE_OVERHEAD_FACTOR = "1.1"
>>>    # the final image this is usually done by adding RDEPENDS_kernel-base = ""
>>>    # in the configuration file. In our case we can't use this method. Instead we
>>>    # just wipe out the content of "/boot" before creating the image.
>>> -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
>>> +ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; install_dt_to_config; "
>>> +
>>>    empty_boot_dir () {
>>>    	rm -rf ${IMAGE_ROOTFS}/boot/*
>>>    }
>>> +
>>> +install_dt_to_config () {
>>> +	# Install dt_to_config script from kernel source to kernel build tree location
>>> +	if [ -f ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ]; then
>>> +		KERNEL_VER=$(ls ${IMAGE_ROOTFS}/lib/modules/ 2>/dev/null | head -n1)
>>> +		if [ -n "$KERNEL_VER" ]; then
>>> +			install -d ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc
>>> +			install -m 0755 ${STAGING_KERNEL_DIR}/scripts/dtc/dt_to_config ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VER/build/scripts/dtc/dt_to_config
>>> +		else
>>> +			bbwarn "No kernel modules directory found in initramfs, cannot install dt_to_config"
>>> +		fi
>>> +	else
>>> +		bbwarn "dt_to_config script not found in kernel source"
>>> +	fi
>>> +}
>>
> 
> 
> Not in this form. we need a smarter version of dt_to_config that can
> help pick the right kernel modules needed for initramfs. dt_to_config is
> just one part of the puzzle. Context here is this: we would like to try
> and transition default upstream defconfig to enable ramdisk by default
> and then with the right modules in ramdisk switch over to the final
> rootfs. if we install all the modules in ramdisk, ramdisk will be
> unwieldy.. So need a smarter solution to the same.

We currently have the list coded in the machine configs.  So we are only 
included those.  What does moving to this flow buy us?  And it sounds 
like this is more of a build time thing and not a boot time thing.  So 
this shouldn't be needed to be present in the initramfs, right?  Or am I 
still missing something?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


