Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8857EEC2A0
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:28:05 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7254.1771885675671736187
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QOHpRcx6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.50, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMHDgzU8Hk2NL/ctedjy1fxCFdSddVBuCprRLMhsyB7WxHwORTface16EAchxc33MOXvYtxaoseCPLK4ORerRgTD/dP9MaLMkhcpQ7ev68oxd7ufEPXC65kXItWueCRog/apUjTWLXZFInUwhvQib6ze6rdaZNOg1PIxT4WBXWPPoyOH6GTctflZsMLhPvv0g0eDQ5uP7I6US8cv/cYItJ4cgZHm1mRd4tTYaw6Beu9RJR4pGqLmnsbmlpYb391oweiw9LmtMsnnI3pTWXOAOuhO/51MEp4OQqwUhhtFlcdzpmT3I9FZ9cP0vYRDYGOL2OX+J0XHxWzOh1TYY/embQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk/ecMZUQINdg7cz4Qv4teUyFkUZ83u2hSr/Oa5OE2I=;
 b=WW/3OKmJnRs2N19Z94P5NsEj4E0uO0SdcZZjRwBLdeLOha6DEeQG+ZZLa8rgq62fUgaMLDcqsAx55hd0vss35LzWgvqXYLqx5Bd08GaUI4rIIYNVRrnWHFS0wVRWilGTa5oltL6zAWgIX/Le2kB2b+p4IPlK4NiUTXwP9xEo/ojAqfB3ymlcJ+9pkpU5C32I9mDuw3RaLBrG+8MJlNnKvp7PANB6TI8hVm2NJWc8y9DmvDLBSJpIfPdQyR8nPDnP+fNf0XnX65zZOfxfTAdxmbxZecCiJyAWhd8r21T5qmnfs2t4ykW9O5ADI01IjkRMQJwQsCLd1t5I38osA41JHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk/ecMZUQINdg7cz4Qv4teUyFkUZ83u2hSr/Oa5OE2I=;
 b=QOHpRcx61RwlWgKu1g5C+IUw4plTqpNRYGmdQ+SjFqyl4HNYVqJ/1q8uZV32zqmQPxqXnHb+S9fNVELK9XbI5OmHcqJ4li7Soqk2iDourluaokUTTOPIEo0p4JiYUUhpp0+/lA2Y+QxHfTYwclsFDOQodoWvo4BUfDloHEXDey0=
Received: from DM6PR07CA0107.namprd07.prod.outlook.com (2603:10b6:5:330::21)
 by IA4PR10MB8279.namprd10.prod.outlook.com (2603:10b6:208:55f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Mon, 23 Feb
 2026 22:27:52 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::10) by DM6PR07CA0107.outlook.office365.com
 (2603:10b6:5:330::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:27:50 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:27:42 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:27:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:27:42 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMRg9n1590592;
	Mon, 23 Feb 2026 16:27:42 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 16:27:42 -0600
Message-ID: <DGMP1O03MM2D.1ACCARZ9FSNHW@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>, <rs@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
 <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
In-Reply-To: <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: b948aee1-ff42-4709-979d-08de732ac73a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?REFtcytzYkhaQ3ltbnVUOG9PeEZRRnN1cWdML1l3NFdWN1V3MktndEloRDF4?=
 =?utf-8?B?Q3FKRUdNSm5uenNiNHFjM2tpQ2ZtcExxRHc3bUJtK1dBUFFnVjUzVTh6VGtE?=
 =?utf-8?B?SVJNNW5ZMUtZZXFibDZ5bDJZQ2YxNzFGTHVnOHczU3lsZTJ3aGJ4SjBaTDNh?=
 =?utf-8?B?REFDN0tlNitGbUdaRktqR0JYWWsya3ovNSs4cDVnYUVOMWx2VDNSOUtXTXhl?=
 =?utf-8?B?NDRRVkZEb1NOYllDMmNQeExVb0tVZU9LTS9oc3ppZmpsdWFnVHZ0ZHZCVzUz?=
 =?utf-8?B?QkcrUkhaYnVieE1HSFVmSUpsZm1XTE5kczJQdUM0RHBIYUR6Umw2L2tVU3lJ?=
 =?utf-8?B?TUI0REFYOWFLa3NSMldoWjZwQW5aRW9ZT1RpTzRRQ0NXUUVRTzVISkc3ZVBu?=
 =?utf-8?B?ZUxoRmVrcldzOVFUZTkxQUFNUXlVVERlY1A2cTFRaDJPbCtuMWE3SnFTTUU1?=
 =?utf-8?B?a3kxZVhUeXM1UGI3T1E0RjY5ZGQwMzFaL1BEeGxWSjZkOVJjNWtYNmxFODFW?=
 =?utf-8?B?LytUNEJJWEJyaE0yaXZWNnFjVjJSOWVyTHhTS1ZKSy81WjJKUjY2Wm5JU2FU?=
 =?utf-8?B?OTI3c0tmLzN1aUcrNklWT1BIRmtRVGl5amVHK2RkRGJaY3N3ZUkvZTVPMVBr?=
 =?utf-8?B?cmxTVFBrbGt0YjFxdUxJeUlPT3Q5K09GMTJWbmZHNGZIVWJXdFN6NWpXQk95?=
 =?utf-8?B?M2dnZjBjNVJvZ0cyWE9iaVNDS01jcmMwbUVML2dhdzFHOXZHOUc5K0tZaC9s?=
 =?utf-8?B?V1NMaGs2WE1tOUdIUjR1dklkZXV1STJrV1BDUjlzOVNXTWpRbHkvdGc1VytO?=
 =?utf-8?B?WnJPMDZteHdYMHBNUjVmWUpXNzU5VWw2UTR3TWJYbFV0NWZCNU1ESUdidy83?=
 =?utf-8?B?Q1lqVEQ3Kzd4b01oVGZSVFFwcm1tR2xvVUpNbEZNakpDeFRVdGcxcjNuMGx5?=
 =?utf-8?B?WW91NnRuR2UvdVlIWXBSZmNxT014dDB2VUpWcHN1K08vUjYrVFUreVIvbHdl?=
 =?utf-8?B?ZisxV2tHQW41d21tMmFWZW50SzhNOGVoeThZNEd1ZzhsUWZYTy9NcGdaVFBk?=
 =?utf-8?B?UWdkSXNGOVpJSUwzVlFUcmFpblV5RzIxTXlSVDBUdHdEaExKeUxsdHM3MHlH?=
 =?utf-8?B?cU80di9lR2loam8vQkR6UFFvallrZlpjc1I2YU9lYyt1WmtuRVRrOU1wN1VR?=
 =?utf-8?B?ZVg5amlhZmFza1grQnFiRi9XMXVTWlE3Zk42c3dXZlVoODZXWVl2N1o4Y3lR?=
 =?utf-8?B?TVRpa1NWcHU0dTZHMlF1bldsYnhjRExlYS9vNm44S0NyNEdtZVJpVVZwL0JH?=
 =?utf-8?B?OWZGSUVDaXhqQmw5MjFuVEVKd09TYXlHS3Arc2tydWc3U25vbjBUTmtDQ25k?=
 =?utf-8?B?dUh0a1dZUis5eXJMenZTYk9mZEpSYUJQdUVGcFJyVFV5TWJpWVRvQTIzYlds?=
 =?utf-8?B?OWdkOXY1OXNBRGhtMHU1RVp2ME1GQmk2elZRYXE4S2YyYTlpSlZVc1JoTklH?=
 =?utf-8?B?QXFVcnA5SFNKRVVLOGNEMnFDRTkwRStzK1h2MnRGVkdZaGpJTW90Nk1MZWpR?=
 =?utf-8?B?MmZRcWxGTFAzWnNsTklvbjZRcGU4VGlOUUxLd1JLQXdaZ3NybmRiUmZVM3E4?=
 =?utf-8?B?THU1akJYYlBHcE9ITk9LS2lJWmVKMTNMKytFblExNlhjbkFteDVQbVZ3WmYz?=
 =?utf-8?B?WTNaRkl1YTk0a3pTcWprVGg0NWptMFN4bXEzYm9MUzNFS0tNS2JjNE5QSEJt?=
 =?utf-8?B?QmJIRVBiQjlETEtKeCtiNFVmWVlBbnhRTWZ4dnh3eGZueWpyeXVZNXdxV2c2?=
 =?utf-8?B?WE1OcUdCY2FnTTNNVVpBSkkvb0NGZHhXQ1dNUmZzS2YyamEwaHNKeWIvM2ZX?=
 =?utf-8?B?U1lJTXowdlZGQlpSVjdXV01uRjZ1VnRUYnBFZGxpalI4ZEt1ZUF4WExHMkdU?=
 =?utf-8?B?SkJCWUZ2cGJRUHIvc3hLRGs5NXk1ZGc0VnNTczJNbm1kLzNiaDc2emsycCta?=
 =?utf-8?B?VDI3OTZXSWpqb0RlR2hCYWRBWDg5aDR3bGhHMlBYVnZ5eGdCWFZGM3NIV0Qw?=
 =?utf-8?B?L3Y4M0E4OS9FaG9weld1MTk3cTduSEg1ckpzM0RCMkpLMVlxS2tNYm82REJh?=
 =?utf-8?B?K0lxcElJMnlqNEtVaHJxUlBkb3A0eE55MXMrWVpFUkF4dlhoRFVqUy80bGFE?=
 =?utf-8?B?Z1hsNGFFdDZiY3pWb0x0ZEtuT0JmWUN1Y2FPQTNEeTNnL3U0clRzeFlYRGZL?=
 =?utf-8?B?bUpvSmFiV1prMVJOaGNuQmFKQ3p3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BaHErWPPmKqaQ8HVangbiRi3wO9zRmUKajPbUK0XNa5wxPJ0bcoqlcC17nAKWBxX3nASjjZPygPjl7lxMo1Z6uv1UD1YSSb5UlGDbEZoSRMhOFiCiIzhm/59FNyx6KMYXEU2sdAKtpwQA/NdzrWyDls9MQRYJMIfzn48sEIvXggI+BjcIfTNd7AqH6U+PuYD0DkCUAy7JRpCDyesbRAcXDsAlmx087k0ubjFFbDCkCD62xyHVnKUTxSqPI10R6yaHZ8GfGB3gEbyg2v2kgNuCVrfl2xmZauzLuFErBxSuicxaNKasM1Kjda2shuNf2yIfJdgt36RH9+7+7P+SHkzaDWdBFEyLpjRQ/CH/S/enAqydaPazcnS0xUUZNUTDQxNfjH7GxDelxKIOw4KnJ4yA9Ni9m4ixHI6bUksAOC9ShbYVVtSyopZ/JKJssyBuCt7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:27:50.0644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b948aee1-ff42-4709-979d-08de732ac73a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19572

On Mon Feb 23, 2026 at 3:54 PM CST, Ryan Eatmon wrote:
>
>
> On 2/23/2026 3:51 PM, Andrew Davis wrote:
>> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Add a TI configuration for the BeagleY-AI development board.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 +++++=
++
>>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++++++++++++++++
>>> =C2=A0 2 files changed, 23 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.c=
onf
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf=20
>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>> new file mode 100644
>>> index 00000000..88d0888b
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>> @@ -0,0 +1,7 @@
>>> +#@TYPE: Machine
>>> +#@NAME: BeagleY-AI (R5F)
>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +
>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf=20
>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>> new file mode 100644
>>> index 00000000..088cbd62
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>> @@ -0,0 +1,16 @@
>>> +#@TYPE: Machine
>>> +#@NAME: BeagleY-AI (A53)
>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>>> +
>>> +require conf/machine/include/j722s.inc
>>> +
>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>>> +"
>>> +
>>> +KERNEL_DEVICETREE =3D " \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a-beagley-ai.dtb \
>>> +"
>>> +
>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>>=20
>> This defconfig doesn't work if you select an older BSP.
>>=20
>> Thinking on this, the only difference we should have between this machin=
e
>> config and the one already in meta-beagle is the default selected BSP
>> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config and
>> select the BSP with TI_PREFERRED_BSP? We could do that externally
>> from the build env, or with a branding.
>>=20
>> The issue with this patch is we would now have two configs for the same
>> hardware, and there is no TI produced BeagleY, so having the machine
>> config for it in this layer just seems wrong. I have the same complaint
>> for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
>> them in the same way.
>
> The difference between the two platforms is that one is supported by TI=
=20
> and one is not.  We do not answer questions or support the meta-beagle=20
> boards.  Those are supported by the community (aka Denys).  But the=20
> beagleplay-ti board using the TI kernel and TI uboot is supported.  We=20
> will answer questions about them.
>
> It was a decision from Sitara management to do this.
>
> That's why we name them differently to draw a distinction between the two=
.
>

That really is unfortunate. Inclusion of meta-beagle in meta-ti does not ma=
ke
that clear, and the layer README(s) don't offer that information freely eit=
her.

- Randolph

