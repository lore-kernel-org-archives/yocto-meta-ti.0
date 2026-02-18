Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A558BE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 19:31:42 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2456.1771443100740966573
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 11:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=c6qJSHBI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.62, mailfrom: praneeth@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKsrz/6eFa1LpG4jLiF9UMqDN2qjZVlKNxtjPhge9k/erAElCykL18/udKfFA3J0oNAryc88XNVTqUtN/GEp6KH5dYa4gZnfF80o8Uvx4Q9jRC5bu90oJPmibTs/C2oSEtTSDBSWR8CXUgJIy/gC4R6HCUUv5X33UjzUcbHJ/8/jDzROfL1SHzWnWqCSm9b2BbXnVdWNCAJF11DPzSMsRZL/6OG7IPaB7+dBy8uYBUa1aRs8qY9tB1/CRIB46xjOrWCzLGVXf3QU+WzqpKuHTwHluroa1GMm/NzHKyewUO3eXX99AgbMXnVZfDKS0Do2D0AbcxHGAMzeHz0Mok0pNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p4CSqVVilpU+ZCpMqmoX7YzgXecwDoI/6Jr1exB9R8=;
 b=b6Z2pz5fabzxGOPPZU79ye2lgO3w8nPIdM/8lQwE0sHaAY+0wD5NJOHyP6PPSDVXlUV4bYjgeGOXyXKrMqpy9gPsEzlo7KeMcXGLpvaFpPyFEBgDBu8f6qg3Ymsi8t+7bvbnNGgvPCoEEO6BQqm4oSgwRhRWDIPN8Y+xbPF6ZWJbbtQ7C3TMUJpMO/CTQYspbw+Nru2JXSqYlSlUinqUW3Wbjd7AxfX51Q2IMWpxJdY+W9FJeiPTK+MtueTrpRvW1bAwc0C9GgHhv7vdNx5ugwMObFW0M+j1sw0ryuvRNyhBOsK9pBnuxgzabdAq8v4SX/CZ+AIaPOw+84Q0xInZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p4CSqVVilpU+ZCpMqmoX7YzgXecwDoI/6Jr1exB9R8=;
 b=c6qJSHBIBzN2Fs/1NwTRiNzSNOEyrDz47cw1X3ugEM+n33VzGkZaHBpO1SG/qD8shWes3vy6rDACVsn7uMeB0Dd7TiNkYf3hasbM7OaWDXDcG9PT63VClgF2+LTC1ZMobWVF3kvsnQQKK/zDIZDOB3v5J9gTVRgnRFPX03Ubngc=
Received: from CH0P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::17)
 by MN6PR10MB7468.namprd10.prod.outlook.com (2603:10b6:208:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 19:31:37 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::80) by CH0P221CA0021.outlook.office365.com
 (2603:10b6:610:11c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 19:31:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 19:31:37 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:31:36 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:31:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 13:31:36 -0600
Received: from [10.60.24.86] (ltpw0eb5ja.dhcp.ti.com [10.60.24.86])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IJVafE901058;
	Wed, 18 Feb 2026 13:31:36 -0600
Message-ID: <c14925c4-93a7-4313-b0b8-218be2915faf@ti.com>
Date: Wed, 18 Feb 2026 13:31:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.11
To: Hari Nagalla <hnagalla@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <nsaulnier@ti.com>, <b-padhi@ti.com>
References: <20260218192325.12701-1-hnagalla@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20260218192325.12701-1-hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|MN6PR10MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 347a2ee3-5647-474c-8635-08de6f245551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T3dHL3A0ODNPQmZlSlNJcHA0dWY1dFVXMysxcTlRSzVuTXhhYkpNbE1JOVRr?=
 =?utf-8?B?NnpLdVhYdnQwcWFrYlFTZ2Rkb1FBdDNsVS9Wc2c2cWpxK3NpaGcwRHRtYVlm?=
 =?utf-8?B?R0oyeGlVWFhrMC9aOXNBZ3orU3hOelMvMzJUb0lYWitNTkZOUWNGWjUzWUR3?=
 =?utf-8?B?dUJYRGx6andWSFFRdndYU09yUkxPcFFqT2FxMnNUNUhaS0dUMzB4UitRdGZu?=
 =?utf-8?B?YzcxUjByLzN5djFCS1lMSVBrbm00YlBoUnZtTlluRWpYdWU0QnBwLzlneFBo?=
 =?utf-8?B?OXozWEFYWUphSmZ0VDFPQzhONzBITGNYZUVuc3ZOQUJLRkJWY2FILzFiZzVH?=
 =?utf-8?B?MklBUldDZjIwWThjUWE4WlJwUFpUaEFrdFFvUHZjbjlZYm9rV01jZ0NFSU1w?=
 =?utf-8?B?ZmNsMmtORU5FSmM4QThtcitZYk1Ya2o2WXNLdXR2NnZqL2VEeGIwWlJSM3NZ?=
 =?utf-8?B?QzF5RXpCYkNzZHhobFNOelNiQkYxNTZyWmRTR1FoRCtpbGZXWkxCZDlSL2NI?=
 =?utf-8?B?UjlwTUpydHZja0ZlQUNMTW00RlAzbkZnc3VYOCtJSjd4OGY3SnQ5UVdDOUdt?=
 =?utf-8?B?UzJ4VWt5Tk0xNnVIaFhzQlphb2hGMGMvUEEyaHFBYjNNOUVwcml1bnlSVkxO?=
 =?utf-8?B?TExXK2xLSWVGd2xLN2dBV3FVdFYrOG52QS9LRnRpRGdjbDZyL01KMis3Mzdq?=
 =?utf-8?B?OVIrcXBMdkJVZzJpa2g0Q0ZUVmJLK1F6UmNHcGxvY2lBajV4SkxmeEtXb3Q5?=
 =?utf-8?B?UWhERVBMUmdOTXVPOGhuVm9EaWVHNWRIODVkTytERnhIZTRsWkJqNVQ1enJV?=
 =?utf-8?B?VmYvdExuNEc4L1VDTzVTdEZ4d2FIOGQ4aUx1WUNnU09VNFprb3hZV3pxYlpN?=
 =?utf-8?B?U0NkU1MxaE9WanQ0cy9kbExTTWNiNG1PUVJZYzBsSzRyLy8rU1NZK016aDZC?=
 =?utf-8?B?V0pWbWtVQTFHQnl5ekt6NDZRSmZmd3NLVmRwRWxhaG9yQVk5dC9KNit6Yy8r?=
 =?utf-8?B?Zmlpemg5U1BxWk9YVEw1SmJWMGN5LzN3aXhXWWpZTHd2cmNQcHRLYVBvbmY2?=
 =?utf-8?B?NGwxbW9IdzJzSGpxTTZ3SURvbjBXZmZzSjJLdWM0andGbVpTb3puaTdrRzFS?=
 =?utf-8?B?VXhmaUgvK3BlMWd0bTJ1VEQ3QSttSWtlY1NFZ2svanJ4WTNNYkZGSGRFYzNC?=
 =?utf-8?B?bTRRWWhuYWdLSW9hOVFabWExNVllOFBQeVliaVYwd0JoK01jd0ZldlljTmNH?=
 =?utf-8?B?T0x1NjMwU0ZqUWFwQ21xWXNoRi96K0ZCNy9TeUo4U24rN0RHNUp1N1RWKzY5?=
 =?utf-8?B?VXhQR0dRRWw1KzJXV3ZyZXJCUDlsVlB4cmxNWVRFREpWS0puZHl0WFdCWk9M?=
 =?utf-8?B?VzBiVXluL01BelI2T2xLaEJlZzVvemQ4Mm4vK3pHTEFaZUo5UG0vUTBoT1lx?=
 =?utf-8?B?RktobHNtVFJVakVURU12Z1F6bWtLejZtMHJqOEFteEJ1N0xJaWlPN2JDMlh3?=
 =?utf-8?B?M25nbGV2N3AxR1lKSUJ0bksrUHhBQ2JLd3RiT3R5TDR5KzNJQUZ1ck5uVk92?=
 =?utf-8?B?VFVMOW9iN2VwaGVpMGZTYVowbkdhbzZBbkN5Qy9oSmpSWFowUDJTaEk0NzdD?=
 =?utf-8?B?eE1KcDZQNXpvZ3lFY2VPMXRYeEovdFEybVU4Ly9yS0tpUWFLNUtKSDVRdVRB?=
 =?utf-8?B?bE9HRS9WZDQxVzR1N3M0RFdNRzNVenU5MmJPcS9HZks0bThOTERuSjFCdUhh?=
 =?utf-8?B?UkFyTi9CRmtJZDE2SmNwdGFyeUJub3FDZGtMUmptTWo0V3dNWDhURllzZ1hy?=
 =?utf-8?B?b0RCZXFQay8rdmRzRTVRTG03MHV0ZlpEM0Y1L1V4VmF4RkR3cGlOa3R0MzdV?=
 =?utf-8?B?SlNTRlRrYmVOQ2VuOVM3d2oyTHBQTW9GTGtVbDkxaGs4ZzRxNkYxa0E3Rm44?=
 =?utf-8?B?aS83MEg5dHlJeWtjdVRKMDkzcWY3cjV6c3BJcmxGaEtBYWM3R2xXbTNCbXNB?=
 =?utf-8?B?b0l5UXQ0Q1FQQzhDZGg2UVczVkZrMTNGQVBKTU5oVVo2S01RT0luZ2h1QUh3?=
 =?utf-8?B?VDNRSThBZ3VRc2o4cExmWGhmUXNLcU9VMzdvU0xwRUlVaXlibGQ4SndjN0Rq?=
 =?utf-8?B?dXRncDloeGZ5WXVqbjczR0xiRjFlSWxycEhBdUl5czdldG96UGEyemhIR1dr?=
 =?utf-8?B?NklrelI5ZUQvNzdTY2Y1NGVibDZZREdDTHN2ZG5kV1hHSUluV1FMQWIxZWkx?=
 =?utf-8?B?Qi82OXpKWVZmZG15ekdadXRrVS93PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ri2uyRLw5CKt1pfeswik6sqYGvjXgQ0ijDNOsv/eI5gBKjXWxVXuwgSZp3iicNSr/VSXivE6ftQ9N3FaPcBkmt5ZDJbVh/ZWsKQR/2IZ/eSkHx7FEclRrFYRzZbqjBJ42OTWkftdq3vobZ/mX+b/3ktlmHCCSRvgY5hwe6v2/3pBcs+hpt74QYQeA1AOVx89EtpnciEp61xavdRzwOf1123y8Df8mH60HxI/p/Ux9lJzeZIoFtvRC9l4fEkSATjod6mbQEbRbtpZwiOD5UVUx4JRhX/RHfb16zyySoYBIRliLg2Fr1letUMTP6IF+1ruXS5DRzfYpkiiIPWJf5lYlA/EO7cakm664n5ZEvpqqgveecDgPnp/B/xji9DfcF/vhsDWqX6YzpUN4uMGLicg1M/NKDKmYXtDzZPmhVShJ70GECqaHc7b5aVa5YlHwHsl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:31:37.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 347a2ee3-5647-474c-8635-08de6f245551
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7468
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 19:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19541



On 2/18/2026 1:23 PM, Hari Nagalla wrote:
> update ti-rpmsg-char library to 0.6.11
> 

Isnt this intended only for master?

Why needed for scarthgap as well?


> It brings the below fixes:
> dd4783422bf  lib: Do not update local endpoint
> f26e4a30ca7  example: benchmark: move latencies array to data section.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> index e8f0f8ba..f9fb0f25 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,9 +7,9 @@ PROTOCOL = "https"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
> -# 0.6.10 release
> -SRCREV = "057b1a249261e26d00c501b59646957160ec815b"
> +# 0.6.11 release
> +SRCREV = "dd4783422bf4fbed1015bfaa51054e40057b4f04"
>   
> -PV = "0.6.10+git"
> +PV = "0.6.11+git"
>   
>   COMPATIBLE_MACHINE = "^(k3)$"

