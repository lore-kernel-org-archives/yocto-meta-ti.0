Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CE2ECD6F2
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 21:57:40 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30720.1770847054714083911
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 13:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ELZoSQmL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.5, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3d17V7p8UB3eoPAYeWxcgpszpdW6vHu4w9KJOCZfjLGObMLfuLAU7gjdPyfwHTQhiTWAIlzlNZKO5IvOx+unn7hTBB4xNoLfqYdSJlviIky/77IrCZBCM2f0/AqtuxeiH5u4OChqSYKpYh4WEa+dcqYJB/Cv+ZY8UgNvEUFNgD/4Dyahz44px3SGgPF8WvEQzN6zx22z7Jwj2DQZ30J0DT9T2sw0vF4df1XR1M49Pse23UIaXl90GVbSw6fTCM9i3M3rM/xHLBVKlamln1XXIIkM8uiciC3HxjbzTJXQk09oO5EetLnoXii8Px2Pz2fl6Jy96tjJdK+nlwtrFwTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCaD+jpnVjp//CsU/Omak4o14zzR/YfpSun0FG5CKCQ=;
 b=eOin1F4br7Jamp998F7fNPkUsUphLh8UuzsfGJEOkgYU+7Ngh7NkzXCcoWdS168qPkyMifrAOssM5bQFBgLTq85IRId9i8eu0EwyVIxtwqZqt/c4kR69mByLgLSCpMmE8UO6x1oiwXFGGVEgdc+8Y+yY9vA5ukDXXJcY17NHtz//wWFtji90WNqiXl0A/yCIqggTtjYPoiOK7/wMEjsf5rvLT4Y4f7Y62712CZ5+ES9UpG2VoX0G0pLW/PKWNxN+aoVQhFK85nvKpC7/70L/vMvASRh4dnLkiM4GXY+qplnL7JYbmmuSg1C7Gj9CWNPq3ZuYxkOace1mMoYnPvl6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCaD+jpnVjp//CsU/Omak4o14zzR/YfpSun0FG5CKCQ=;
 b=ELZoSQmLcb9Wv9McJDkEBtWF7/xXKT0Gs4AWCWuRvNrCzm0xJkXIQbd3iU7U5vTleV7GLxM2MLK8ByaTwm6fenU49J5Hy9Iui3wA9sLsl4+CRVkutFaQdyQwUD7RohhrEJMsZmXr1uOo8Y60i4F1hy7QOBasZhf9gUR25sgTOyQ=
Received: from BY5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:1d0::13)
 by DM4PR10MB6085.namprd10.prod.outlook.com (2603:10b6:8:bd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Wed, 11 Feb 2026 21:57:32 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8a) by BY5PR04CA0003.outlook.office365.com
 (2603:10b6:a03:1d0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 21:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 21:57:30 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 15:57:29 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 15:57:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 15:57:29 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BLvS2x2359392;
	Wed, 11 Feb 2026 15:57:28 -0600
Message-ID: <07050526-1409-40cf-9882-6233bbcebfbb@ti.com>
Date: Wed, 11 Feb 2026 15:57:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260211200414.1642061-1-reatmon@ti.com>
 <20260211202546.GJ11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260211202546.GJ11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|DM4PR10MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2a9305-2854-45b0-9859-08de69b88e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODJRY3hicVpJeUdpSk04a1BWVURiOC9hMnNiMnQ5dlQzUVdHQmxBLzgrSUZx?=
 =?utf-8?B?NmUzUjUwbHVSQjA5QWlCSEE1VjBVRFNsUnZXajZwMTdZNHZITlgyRmFMUUJa?=
 =?utf-8?B?Y1hBMFFuc1phajZGSTVvL3REbkN1L2Yrc2ZnUWdBTVpweFMxT2JWS2hLUUdS?=
 =?utf-8?B?TFd5dlAveW14a0p2ZUdRMzNUbUdTWmZGdUNkaGRYK0Y4c2dmZ3RXNUp1SlNl?=
 =?utf-8?B?WW9LM1JuamEyM1ljc3VicjFyNTFUR3dLejdSUldVYzU3WGQzb0RHY1NzZC9q?=
 =?utf-8?B?Y3A4MlVqWVdCeW5JTkFQcXNnWWhZd1Zwc0FjTVVkTkoyaDBacmE4anp0QzlJ?=
 =?utf-8?B?VnNhdmZZQTc1dmRWNmFSRS9wNmJjdTdSS3dVM3hYV3JXSll1Nmk2aW9iM2I4?=
 =?utf-8?B?VUh1VzlJN0lkdkdxQ0hrN2dERWgzOFYyUjJaQUtOZWM5ZkFKN2hRYXk4TlBN?=
 =?utf-8?B?WFY3Uy9zNlJwTFFCNjh1WmM4emhkZHpYYWk2VllkeEkwV2NOb0hKWHYxTXFl?=
 =?utf-8?B?VEEzVXp2RStDWHlmSkRYUnRBNVhKdjRlZ1lPSmFCNThvYkYrNUpDS1lqT3o2?=
 =?utf-8?B?RzlLUW5TWndEaEJUU2pMQkdQOGhIZUJNWkg4SHEwRGo4WGY0MXBWM0s3ZC9F?=
 =?utf-8?B?VmlhMS94bURFdHV2L1NLMEJ5dmdVNTVETWRmc0tZdUd2TG5jQmNaVnRzVlFM?=
 =?utf-8?B?ZGE5NFpEUU4wU1JsQm1FOEc2VHpMNzd3Z0t6L1dacUo3cDhDMGs5NmVYZURG?=
 =?utf-8?B?NE5PUTVLbGh0WE5WQ3ZMWFBRVHZ1UlNtb0xHWHc1aWU5TFBRVG94UytqWlRz?=
 =?utf-8?B?UHBnWEdFK0krMnVXUCtZOTE1UHlYTGFrUTdqbXpaSnE1ZVBuY0x0NWlKL2NM?=
 =?utf-8?B?ZWtPOE1HczJ5WVNpN1NPSGpia2JObFd3Uzl3VmdIa0s2QVRna3k2OGE2QWV3?=
 =?utf-8?B?QlBzdkllZHlWNUl5dWZjOGNFd3hzRDdiWlZ2UnNQY2NOSjNYaGUyZWJoekYv?=
 =?utf-8?B?aGdqbjgxZmN0d0ZIbU1sNTBwczcxQ1F4aUpiWGRVd1NMN1ppMXllUDNnRnZO?=
 =?utf-8?B?WnlJUExsYm9GanlvQ3FlYjNNcWUyRi8rRXU3ZXpTSWtoUjZqcXlKUHNqa1FQ?=
 =?utf-8?B?THZjV3hDUU5mYzg3WGl2RjFLMDFvbklMU213aDc3OG85djAvZDR0Nmswalhh?=
 =?utf-8?B?c0JjSEk2Z3YrVzc5VUM2YlQzaWNtS2xwSjVyRVNLcTVkMTEzWWRKb1Zvb0Nv?=
 =?utf-8?B?OVZaNG1NYis2TW0ybU5hWnZsYjM2K2pFRE5RbXpaTjhGRE9HTUs1Ty9ZUE5o?=
 =?utf-8?B?c0RRZkVXNXVReUdKTmg3aElLOGlQYXFzN1l5RG1VUzRoZy8rUmFkb3FISEJQ?=
 =?utf-8?B?THFBZFUwU1B5dklIbkwwcFRlZzI0NkFzY0kxQURuNjZrNWZtd3ZraGozR3JP?=
 =?utf-8?B?ZGcveG90RGI3eGo4OUFWTkRIUzRJY25nWUM2czVuT2VUVVpvcmVCMTdJbVJp?=
 =?utf-8?B?MW1MWHpCWEhkTUlnWlhvQU10WlR4dmk3dW44UlBJK2NMeEYzL2R6OE94SjFQ?=
 =?utf-8?B?blFQcTFkOXZjSC9BRTZHT3lndlYzbGlxUEIvaEg1blM2c3JnRXl1OHNWRW45?=
 =?utf-8?B?enBKTlhEUEVYN0xhSHFuVHc3OGNERDlhRDRkM1B2RDJiTGoyYldNY2VlbzBF?=
 =?utf-8?B?UVE3Y0ovRUR3Yk9WeUIrdlhha0JxWmZtNVQwcXJET3hIY2Yra245RFJBOEFy?=
 =?utf-8?B?WnVIQ3orVzFvOXh5Sm1Ldjd3OVFqaVh3Ly9RSllVSDBqaVBDclBZVTVRRklh?=
 =?utf-8?B?VGd6cHJVZTJzbWh4YnN3M1h3aG4wamhyMXVFbUFZdWxVM2svWVBqbkVOdkpp?=
 =?utf-8?B?dURmSzdYK2U2YXo1UUJzSHBZQUJmTzM2Z1RhUzRmY2EwSUtYcGFLOGdKL3N3?=
 =?utf-8?B?cllMZ2RXZlRITGxHRmRaSkNiN3dUTlBCTnJiS1ptYjJNRjNUUWRLdWtoWE9y?=
 =?utf-8?B?cHBYT1B2dnBEcjF4YVVXVCsrSEN0R2xaMktDMzI4empwWk83Qm1jZWxYUkgz?=
 =?utf-8?B?Tjg3clptbGZWRWFidG9XeW9tdTlGaDZkd0k1aHU0RFFscS8rWTllYS9qYlc3?=
 =?utf-8?B?enhudHFsVFgrVXlPZVh5V1Q5SlQyeHdiVmY1ajZXQWZaY3VqV2NXbnQ3STVl?=
 =?utf-8?B?WTJKaEJnRVhwZUVadHZWNXBWUGJwODVvM0FCR1BvSktWT0lQMCt1U3Q5eDYr?=
 =?utf-8?B?dCt0YWM1RkRWeHlTZ1lqUXpiRGdBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OvTCE7xtN+ywNXrk0HioBtw0Rjg4/gLDcFqH/3TU0tIq3hecNawBtdMukHrJkzbceHP9w+VKtE0sgdtsW016GcwHLC4tQ2YK5cu3eHpY6Xt5vn/QRUukbg/0qOP/R/qUSJ3PAFcJlD3+qLM0dmiMEyfPCASPkck/NR19BAOGYU0YQQYWG6gV/pDPbSYQ2tcczz26cezk8HMmkw7awADr6Ibw23jc4dwi4i+2gs32/slK7f/ZqoXclhC9PD8KDNGjkRu7t5nb6VFtkKx1vrDDtjhYsXIcHwPwFNT71ddtOkqN0FUi9Tl4ea0IUvIFf+tHxD033d0E7xEKqkGEoNkPvVmhzebYKgu1u3qztliD34bp/l02dqpgMpi9BXjvAsR09eT6XEncicZJKxt7nbXV/b7Wit1zBGf5DLLZ7KuhmCn60SKPe6wETSDp+CYZznnD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:57:30.9422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2a9305-2854-45b0-9859-08de69b88e04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6085
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 21:57:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19489



On 2/11/2026 2:25 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 11, 2026 at 02:04:14PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Clean up the logic of the new ti-core-initramfs to reduce the impact on
>> downstream layers.
>>
>> - Flip the logic in the machine .conf files to track the list of
>>    required kernel modules for that platform, but if the variable is set
>>    to "" then the ti-core-initramfs will not be created.
>>
>> - Redo the logic of when we require creation/usage of the initramfs to
>>    just platforms that need it (ie that set TI_CORE_INITRAMFS_KERNEL_MODULES).
>>
>> - Add a big switch to disable the initramfs entirely.  In that case, the
>>    user is on their own to make sure that the kernel has everything it
>>    needs to boot either via config fragments to turn on the needed
>>    modules, or by using the TI_CORE_INITRAMFS_KERNEL_MODULES
>>    variable to populate their own initramfs.
> 
> In our discussion we agreed to use TI_CORE_INITRAMFS_KERNEL_MODULES to
> determine whether to enable initramfs or not. While I don't mind adding
> a separate global TI_CORE_INITRAMFS_ENABLED switch, but I now wonder if
> two checks are redundant and whether it makes sense to create initramfs
> even when the list of modules is empty, if it's enabled?

I thought about this and went this way for a reason.  If you want to 
turn off the initramfs, but you still want the list of what modules are 
required say for your own initramfs, then the list is gone.  Because the 
list was the switch.

By splitting them into two lists, we gain the fact that we don't force 
the initramfs on platforms that don't need it, and you can still turn it 
all off if you want but have all of the infrastructure in place to use 
it in your own layer later.

> Also see below for another comment.
> 
> 
>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> @@ -0,0 +1,29 @@
>> +#------------------------------------------------------------------------------
>> +#
>> +# To turn off the ti-core-initramfs.cpio creation just set:
>> +#
>> +#   TI_CORE_INITRAMFS_ENABLED = "0"
>> +#
>> +#------------------------------------------------------------------------------
>> +TI_CORE_INITRAMFS_ENABLED ?= "0"
> 
> Did you mean to weakly set it to "1" here? :)

Doh.  I did.  That was from testing.  I'll send a v2.  Good catch.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

