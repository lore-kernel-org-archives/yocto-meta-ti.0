Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17736D43354
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:47:43 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.690.1765486052918879271
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MKQCyH7Q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9qKP49KJJBzdq65UzyzLpe4/ear5hMM5YNn2FqAM4LmjIu+So6YFLz6jI7uHXzR14twi/JPjqMJAJGbFr+aS0Cjr/WmQEf4GHvha7mQC3RrP3izOJdIfWCAmTPRLpFTEnMqOC18KyBgrtAh9duN8ZgDa5UdNINWdRzF68ptfyYSacZKLj7nwsT8+pDC5q5eOs9hOb/CMSc/te7+JcqPwUDY6TMx58hjJuIPyRgXyBWS211vjuKMism1QTuHnFDABQdKqgFBD4tzI9GVOREJ0weUb4+76QC+p3EklTsK2jmwqzldshCAtNZW0v4evzdmcJcn9EQzPC1IBlBm90orKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh/6R0gKwSCu6948llRDFO7Zot0bxNVFGpxTNO40XjM=;
 b=AArUbr9tAPONt/OuduP3GI59E9UcAoMsMFBk9N9BooJBVZldqVkuwJ86jWONkv8KxSrnX+75D+higFjD98BlA25eT92m9JaPKNv3Ediyuz3xKz0Pf5JsT8EReT8vnvqmaGKTlocnabn0FJByUmxKdHLOUs1Mq8ZqooQRYivoyrOBqGMFELadiIda9ytfwd8/kPfwWICFiuJzyhEiOeq0alwkNTB5iycB2xZixas4xAwi8SfImd1EsoUbrjvMILCi1+gN6svtaDeFcuLa0ZD7WrJEMRjwBdpM08USYb8v9wPqiYXyttJW0jWrYA2RB3y2tbrtbVXFOO+Jx2gHltG4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh/6R0gKwSCu6948llRDFO7Zot0bxNVFGpxTNO40XjM=;
 b=MKQCyH7Q0HNvDjj72L46zUMYtEJdvqO0Z7xoIWlKwcJJMzc4Wv3p9AWfAlQP9lvwGM9dDcBXutOrLjTMYq3tcLIZRaTjE2BkQBD9PDl+0ZSjvnlPpVg4X6RE6nR8Pe2hKF6BSqYHYXb316KRvpV+AZW3ZGnsgNIMU8n6a9sc5Mo=
Received: from CH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::24)
 by IA1PR10MB7417.namprd10.prod.outlook.com (2603:10b6:208:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 20:47:28 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::75) by CH5P220CA0012.outlook.office365.com
 (2603:10b6:610:1ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Thu,
 11 Dec 2025 20:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:47:25 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:47:20 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:47:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:47:20 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKlKkd1053315;
	Thu, 11 Dec 2025 14:47:20 -0600
Message-ID: <a7e99d9d-b04b-4678-957d-2bdc1a177db5@ti.com>
Date: Thu, 11 Dec 2025 14:47:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2 3/5] ti-bsp: Add ti-6_18 for LTS
 development
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20251211202234.4064350-1-reatmon@ti.com>
 <20251211202234.4064350-3-reatmon@ti.com> <20251211203554.GW11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251211203554.GW11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|IA1PR10MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: a422ed60-a54c-47c1-fe7c-08de38f67d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3pGbVo3WG93cWpDRC9KUUNYb2ZUSmdFczdnSlBrdEYreWhiaWF2YkN0cE1J?=
 =?utf-8?B?OVpWUTdyakM1WWhDRmVaaWUyRm9HN2dUUnB6c01EVGwyRk9rSWlqZjFGeFNr?=
 =?utf-8?B?YTJiN3M4L1lKUURvMzVEcGtYMkExU1JDa251K0hPbWNUaGJNam5PT1o2c2M2?=
 =?utf-8?B?U0pXL2RTbzc2OHRpejhMY09DVFFLT1ZxU0VCeE1aS1h1b0ZGWmlWTTYyQ3Zy?=
 =?utf-8?B?UElNSllYRVZORzRpaHlNbzFDUlc1b1BNbjBaU1ZSQkI3VUozbHoybHpyamdW?=
 =?utf-8?B?L0RmYkN0UVJWMWtrRzNDeDlVUjJzOVR1NVd5eW5tNk5rc0dubTd3VmdrTlRp?=
 =?utf-8?B?OU5RQmY5eTk4VDJjS0M0RGl6NVdYbnNqU2VEOUhYUWttaEhYaXp6VEFHQTNJ?=
 =?utf-8?B?MXhUT3c1K3lzeDIwRWJrN0FueUx2Q0VvTWZib1FaaS9tSUk4ZGlVY21SNnd0?=
 =?utf-8?B?VHlxYjE1QXVJazhzTGFCbUE2Nlg0M1VicXp2b3U1U0JLcnk5U3kyTU5mT0VY?=
 =?utf-8?B?VTJsTkNpTkE4bmZNWDFiN2pORE10QW5DeDJJUkl6MitseGVCekFHTDg3L1I2?=
 =?utf-8?B?MTg1dUs1QTFldE1tK0hyMElDR0JWSXpPbVptMUtaTUIxRjd3WmViUGdwWmln?=
 =?utf-8?B?WVRLb1c5cTYxaW5lRHdsZ0FkVFVtNFJjb2ZLcEE4Z2RNS3RiWGhPQzRHRzVa?=
 =?utf-8?B?b01JVUR2ZS8vYy9Ycko4NGdiU0t2M2ZGRUdUTDZHNXdIMmZYSWhxek9tUjJv?=
 =?utf-8?B?blR1YjhUWnNrSlp4SUh5YzcxKytjRVpiUjRqd1ZwekxSUjFUOXYxT1ROWEIy?=
 =?utf-8?B?MkpMcWxlYkZNbHhYelRhVzRGL3R6QnMwVnMwd0ZFVTVjUGFJQTM3MWo0S0tJ?=
 =?utf-8?B?VnRMb3Z5QVdkWS9RS3ZsNUNVVlFsaEo0Tzc2VjVVSWU3RzNMWDlNV0tMUmUz?=
 =?utf-8?B?NllPeG93c01TV0hBdDZrUVh2Yjl5K2FhNithZHBnM2ZtNUVKU2x6d1d4Vytv?=
 =?utf-8?B?UWpMZitLSnRJVWNQWEZmdFBURWFpdE5hYmJtWGh4YU5XYy9iQVFETHNGaTUw?=
 =?utf-8?B?SjhwazFjczB3TStoOWhsbHE3MGFjSzlFSEd2OXk4N1VwYmpFQVg3WFhVVnZU?=
 =?utf-8?B?dTltaXk4TjMxa1NxQ3VyaVIwRG5mQlh2RDVUV25tMU1UNGVDeTdQWHlTeHdt?=
 =?utf-8?B?VzBNT1l4c1paU215VUVGM2tYQ2FUeVJVZlFMcEd5YkdKOWxTMFRjL3d0TURu?=
 =?utf-8?B?aXlPLzFvZlN5QmlwaW9VQ09wQ0NqZFQydFBhL0x2N25LNHhtbjZveE9ZYVBn?=
 =?utf-8?B?MlpXSjludTFyREZ4NnJ1OGJ5UnpLTkNOYXlYeEZuQTVERjNkdjdzUzJKWE1t?=
 =?utf-8?B?RFpobDRyYmZkdytheTdUYXpSdVg2d1h1WTNENURRYzVqdXd4Yi9Gd1ArcHd1?=
 =?utf-8?B?MndDVVUrTitybWVxUlB6OUdqa3RjREtEL2ZIb29XZkk0TkVjWjNUMEZJZW9E?=
 =?utf-8?B?VVozYStIVWptZ2VtOE1YTWNqY3NxL1A3TFJDRy9ITDVRelU0Y3dSRTVJUGZs?=
 =?utf-8?B?dVhGdTdJQjZ4V0hCL09zMmlqbk1LY3BPQ2VHUVhnWHJUUER1bmFNemgySm5E?=
 =?utf-8?B?SWUwZ3UwNS9pY3hleFRoZGJxZHpoTWNGWGZNRlh3WVY4ck85T051TVBmaFZv?=
 =?utf-8?B?am15OGFXSEN4UDFzZjJuVll0VjVmUWNYUzdnVGtkYkxrc1VPTmd1c0IxUjYr?=
 =?utf-8?B?WThkb0gxb0czVnEyRmR4a2UrZkhjVnQ2NndMeG9mckVXeHlZODdpMGd5T25z?=
 =?utf-8?B?M3NGaTJRbkxadWZPaG5aVnEyNWFvRUlSWk1HdXRwSng2ZHJpeWplY3Y5Nkt2?=
 =?utf-8?B?UUdZeTNNS0Q2SWh4Z3ZIM2FjNmJ5akdBbGJDTXk1THRPbHRJalkwU2lHa3Fp?=
 =?utf-8?B?TGh5dlFrcStFakp0V3pLRHZrVXNRNythamw4Z1pLYmV6MGEydXhyWjJHL3g3?=
 =?utf-8?B?RDVmMkY1K2lFNFYvSWYzN1NUZThtSi9meEdjRnBKTi9rMndaaHJ6VUx6VTJ3?=
 =?utf-8?B?VTk1a2lyNmhoZk9vQTA2WjFmcVMrYnFHbGdBR1FUd2wxTHRnUEpKUFRwdThY?=
 =?utf-8?Q?c71M=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:47:25.1064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a422ed60-a54c-47c1-fe7c-08de38f67d7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7417
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19353



On 12/11/2025 2:35 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 11, 2025 at 02:22:32PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Add entries for ti-6_18 for the upcoming LTS development effort.  This
>> includes:
>>
>> kernel: 6.18
>> u-boot: 2026.01
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: No change.
>>
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> index eaa501c3..0ca2de64 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -3,7 +3,7 @@
>>   # preferences for kernel, bootloader and graphics components, as
>>   # well as a dedicated machine override.
>>   
>> -# Supported options are: mainline, next, ti-6_12, ti-6_6
>> +# Supported options are: mainline, next, ti-6_18, ti-6_12, ti-6_6
>>   TI_PREFERRED_BSP ??= "ti-6_12"
>>   
>>   # Use bsp-* namespace for overrides
>> @@ -33,6 +33,15 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
>>   # GC320 support requires out-of-tree drivers not yet available in next
>>   MACHINE_FEATURES:remove:bsp-next = "gc320"
> 
> Is this needed for 6.18 as well, or is it already enabled there?

We are going to try to get it working.  Since it only impacts am57, I'm 
ok to leave it in so that they can at least fix the build issue.

We might turn it off later...


> 
>> +# ==========
>> +# ti-6_18
>> +# TI staging kernel 6.18, u-boot 2026.01
>> +# ==========
>> +BSP_KERNEL_PROVIDER:bsp-ti-6_18 = "linux-ti-staging"
>> +BSP_KERNEL_VERSION:bsp-ti-6_18 = "6.18%"
>> +BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
>> +BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
>> +
>>   # ==========
>>   # ti-6_12
>>   # TI staging kernel 6.12, u-boot 2025.01
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


