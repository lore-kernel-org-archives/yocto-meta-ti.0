Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5976EEC2A5
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:36:05 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7370.1771886157905927369
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JuDZFkWo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.39, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkS/agyUoR9zUvyeAV2NOXjzA/slYO4eicGi7JNONPoxaZhgJ32Y7/PgpudPdok6mX+lgAk72KpLtBzwjGr8Bg2p3CrP/5WRbm1ynSCHLpVneURvZTELtiZ6hXmFCeYBoQ7bvZl6LJOOaoht/wlzzX2+CO1btyao77pVGoHXikSxWREY7h+bfxaJ18Vs3Lh8MPE97Fa9JghJffN1RnQFSiARIx2ddsXIlRRZ2tcR6u42C1y5zcsQ7ZK2iCXf3be/ETMxShMaPAPQr8yV0GGkC9kijp/nZfST9TWaFtj8m/aQMu+i40ARTjkGSlBcMgbWJyQhkmRQHnVeqwWjjER0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KMWMrTnwKClG4lFjsKQ95hV3N53Hk8LhtwrFy31kRA=;
 b=g98xkSLM60LjT+ZATtSGMk4O/teIIPTxRsXxgx1RxKzwh/crhRG7TYIrPNa4hqbNdab4+w+zQQaXQrN5IrlEHcteTYfiGqv3fldxPAjod2h+r1Wxb0D9T0bo07B0cZNG4ba1cgo6D2+GEo7aLLBRGDQDAulFe+96CdQUpdq8xv979HQLJpLoO1esGzR0VryCRJpDc5mV9E/Ere+r7KvZEKaqMn72CFE97BTIvlH7Ti7DhTAEjorp988n4zzmQ09CG9kio2COITGWW8mMrTi+KV/Z9hf6BZ0L7ZjVbKyMkX1v37KZggnbN5rrgcfajCx02GLdk6cfUrlA2163daLI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KMWMrTnwKClG4lFjsKQ95hV3N53Hk8LhtwrFy31kRA=;
 b=JuDZFkWo4/xIjwKRcEDfReKIj5KfSLhh996XQ6IIzLbeVubftjagNdGfS7U3usE3/pOZ/awV0hTdn5Fi9AavYE+L9eoV6dteQy3d1RGjpdSI9dFbdQfi3rWqc9/P6QjeYIxiLWGvNDOasCv8AWnYFphyj3G+14DHaIsBn+CSqiM=
Received: from BN0PR04CA0156.namprd04.prod.outlook.com (2603:10b6:408:eb::11)
 by SA3PR10MB6972.namprd10.prod.outlook.com (2603:10b6:806:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:35:52 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::e3) by BN0PR04CA0156.outlook.office365.com
 (2603:10b6:408:eb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:35:51 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:35:50 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:35:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:35:50 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMZoXR1123497;
	Mon, 23 Feb 2026 16:35:50 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 16:35:50 -0600
Message-ID: <DGMP7W52NQ3A.2F9RAJ2QE3HTS@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Randolph Sapp <rs@ti.com>, Andrew Davis
	<afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
 <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
 <DGMP1O03MM2D.1ACCARZ9FSNHW@ti.com>
 <7e3a364d-5547-4478-b461-28979e200a18@ti.com>
In-Reply-To: <7e3a364d-5547-4478-b461-28979e200a18@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA3PR10MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5826ce-8c21-4783-2592-08de732be5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WEtndkkvRzZhYlZpcytsbHJwRHZCK1U4ZTlIUTNRZkJQZFl4V2pNWmRIT0pQ?=
 =?utf-8?B?YUJXNy9PQUx4N0NiZ1dOYThBYTJ6Y2xlMWZtb2F2aTBGdURweEt2dHhDUFNr?=
 =?utf-8?B?blptZVR0d09abjBvbEx1SjYxMlc5UEczT2R4TVhxVllkRzVuVUVvNlZPeDNX?=
 =?utf-8?B?ZHRsN0VIaVhTSFBJWmp4Ry8zSS9rRVF6dWpjRm1ncWtKd1BhZ1JGV1NRcS96?=
 =?utf-8?B?MWV4bkdYeFNXYjVHVnB3Sk52TmdDeUR2dkdZS3l6YmloM1h5VFNRb3VESXJN?=
 =?utf-8?B?SUtpN2RZbTZQTEtKSy9JeWN5ZXdoeFFjS0JVS3FpWjdBbTl0c2IvU0lmSSti?=
 =?utf-8?B?WmplR3pXM0djeEFsN05EUFFEOFV6NXBCTlR6TWJTS1YrQzhMRHpPTFlRei9o?=
 =?utf-8?B?M095SkRuaEYvMEtybkZqeFprKysrZXFEdXNpZ3l4TnpUN3l2bDFoTENUT1Rl?=
 =?utf-8?B?bVBodC8yMVZsZ2NmT2Y5bUxIeTlkN1ZBZ29jaTRnOEU1c0lYbW5QUVFNMDNJ?=
 =?utf-8?B?Q1RQaXdYN1JSZzB1OGU1ekFLdWN2UFZyWnFEdjBSMi81ZnFkUjhIejNYQUpB?=
 =?utf-8?B?NWV4dmtLSlU0cUlYcC9rZ1BmVlFxT20vK1VmUUtCaGVHNXdyVWpiWlcwUnVJ?=
 =?utf-8?B?WldHZkcvdThweTNqbjhvb3huZ1lleTBieUYyV2VodEw3Y3l2cldKb0RUM1dz?=
 =?utf-8?B?cWs5cHF0RHFUbVRiVzAxQXBTN0pzMk5kNmR0b3hPWndFVzc2akZQYk5sM2hp?=
 =?utf-8?B?bFBPTkRPQkpVOHFTa2hZYVNrZDZvSkNDa2VJazBYWU5IV2xycTR4MkgyWXZW?=
 =?utf-8?B?WmFvSVA0VllkTWo3S3M0VTdORUduTzZOa1d3OVUzUFM2eDBwN1FjYWE0YkVU?=
 =?utf-8?B?bFZtSlRsNExEMmlKN3FZeXdhRHk4SU8xVnBBWXJHZmg4UjZhVkF4MXNyeVdK?=
 =?utf-8?B?aCt5Z2M0UVdJVXJVcmxEU1V5MjAxMS90bWxBTktOTFNsZjg2MlowS3BWN3Zn?=
 =?utf-8?B?TXFVUCt3c2NOYkVZNlJTMWlhMU1rSnNhZUx3RU5hT0x5TjE0TW84WkpGVm9S?=
 =?utf-8?B?Wmt1K2F6bU0rZ1ptY0UyTXE4NE96cDVETTI5ZU0vNXdjem1tRzVab1NpQnUz?=
 =?utf-8?B?eHE2L3l0ZHJxSU5PalBJcjNnbUhHTnIvcTYxMmt3UHlOT2hNN0g2REVTOGVn?=
 =?utf-8?B?alYyY3F3T0dkYU9TVTlpdGJnNjRWR0I2cGhxVnFWeEhvUGpZRmpLU3E5NHJ4?=
 =?utf-8?B?OGZtOWpmQmgyeWdVZVZ0VVZKdVVwa3h6NFVQZytiSHZ4dDVCMGVuV2k4MjRX?=
 =?utf-8?B?TncvQ201UDJiZW52d0c4clR3WDRvMXJSNjFON1RVRGEvVW9TcGVkd0Q0N2pw?=
 =?utf-8?B?L1Y3K1VBZ2FBSUI4QVJMdGVDdUlKZXFvVVlQODVGZll3QXVseTNkbDRSR0Y5?=
 =?utf-8?B?VVpoTlEwbjBsci9wbGtLTE5iWDlPU2dncjRPZGRIbkNGeFlkamlpa29nTkZv?=
 =?utf-8?B?a2FWLzVxaU1QWldONFhNZUN5dGFtTTYyQURDdE4rZGlDVE9NcTRlVlBHb0di?=
 =?utf-8?B?dER1THhaRlpPT3VWdWNVUUFnTXllQTNXYnh6OG9GcVAwNURFYVJwam9adnI1?=
 =?utf-8?B?dDJsRXNDck1Yd1BEVDM5emxnRUdxODFBSFlsZk5UdHFkNlN5WGs4N2pscWUr?=
 =?utf-8?B?ZmFCblNuTnREd2VmMDh4L2dFUHduZDNRWE1qTkdEWkxoV3NkSytVKzN1d3Mv?=
 =?utf-8?B?NGJnNkZLeEpiME1xNUp3a3gvMXpOVnAyUnVtQzZZbTVvdXBwMEtnUmFMMGZ5?=
 =?utf-8?B?bW9JQlA1RnQvdVJrazRuMDZySTllRlJGNHpTVnVtNXUvdHdPY2RrQitTYVRz?=
 =?utf-8?B?RStJR3RGeGY4L2JOczJWdXh4VEFvU2ZsMldsUkhZTVZDc0tqaEE5T29BVURp?=
 =?utf-8?B?TmJESWh3dk1lZTJqV3k0VVZOd3d6SVV6dmhDTEx0SnphM1dTMmhKQ0FrMVNh?=
 =?utf-8?B?cWdoUWEvQnJXZllNRElrSmhaNUZOVGxZRHJkTVE1Q1RSZ292OThOSlgzczBy?=
 =?utf-8?B?TUNveDJhRHVQbmN6d2RHU0ZaQTE0SmhpTWk3VklRTUZ5OUE3bFRpdEt1eTY3?=
 =?utf-8?B?aU1zUWZpT0RLci9QaEVkQjBzU1dBd01NQ0VIV1M5UTlJS2JLT1VhcFpwZ2VK?=
 =?utf-8?B?dzhveGNUck9yVENiVnNBVkJaRlc2ZU50ZldWUWNQSCtkYzJZZHhKanJmVzhp?=
 =?utf-8?B?aTVjMkdDRUtuR2V2bkNHSjc3WW1xOHlXeDEwUmZSR2FCa3lDTTZ5R2F1cFND?=
 =?utf-8?B?TWZRMjBHMzFSdmZUenpCR1grTldQcVVVRFZMaWIreGZUNXBCMDk4T0VmZHcw?=
 =?utf-8?B?dmJReDV0S3dQdm0rNU5vb1RGNG9rc3YrZkNlZzF4a09ya1JLQ1YzOTRHYjVJ?=
 =?utf-8?B?OWQ5VVU4Wk9XdmpUVk56WDd1NitOYm1pUGdlTmxLSWxxN3MwRSt4ME9WQXVJ?=
 =?utf-8?B?Z2N3WmxNYXYzcDhxZmZ4bkZ1dXdBQnVyQ05XdU1TOUsyQzBPL0J1M0p6cCtx?=
 =?utf-8?B?c3JKNUVyVkJ0cUcwUVRsYlhNYzhGRXhhNEVma1d1S1l2ZWJLUFY1L1gzbTVZ?=
 =?utf-8?Q?jPhINIiCDiBh6xfQ0IvaFooc+0a0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xeP5JSudyPXJ74npzZ1+lOJ6LgytdXe4v6R2PuBEFqbIIyQj7L4Esa2vkM6pWGA8F64fcenj3pp+nsMlmwPHi5DFYMtVxjFyN+iOfr1igFugJAI9Upjq0cSombhVIXtJtv6PK9ygoM8nBUFeM3t5nlTbUgo61zRF3B8Wjyvy3D984S+AhFw7mn1odwnC5JWGHIzERGJ9TuRVr8yUek0994WybtDvyeArDjm3iBhJUlxFcbmsk7eebfHof0+twSedRN4zfcgZN8Q37AhZsmSO3bCu8t4Os5VG23GhXiLrzb9aWeFBD7f6FIe19zwlNxBgymiawondRB39sS+z0Ule4oEtZw/ATt6LBclAeE7/AxILaACDFl2J4wu+5NphJUNtSFxePLWM6WX8exMhJxcEplDZQeGlv404yVxh7leV/apJVLe7z6TRYmDzjK4AFqmw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:35:51.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5826ce-8c21-4783-2592-08de732be5ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6972
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:36:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19574

On Mon Feb 23, 2026 at 4:31 PM CST, Ryan Eatmon wrote:
>
>
> On 2/23/2026 4:27 PM, Randolph Sapp wrote:
>> On Mon Feb 23, 2026 at 3:54 PM CST, Ryan Eatmon wrote:
>>>
>>>
>>> On 2/23/2026 3:51 PM, Andrew Davis wrote:
>>>> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>
>>>>> Add a TI configuration for the BeagleY-AI development board.
>>>>>
>>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>>> ---
>>>>>  =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 ++=
+++++
>>>>>  =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 16 ++++++++++++++++
>>>>>  =C2=A0 2 files changed, 23 insertions(+)
>>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r=
5.conf
>>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.con=
f
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>>> new file mode 100644
>>>>> index 00000000..88d0888b
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>>> @@ -0,0 +1,7 @@
>>>>> +#@TYPE: Machine
>>>>> +#@NAME: BeagleY-AI (R5F)
>>>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>>>>> +
>>>>> +require conf/machine/include/k3r5.inc
>>>>> +
>>>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>> new file mode 100644
>>>>> index 00000000..088cbd62
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>> @@ -0,0 +1,16 @@
>>>>> +#@TYPE: Machine
>>>>> +#@NAME: BeagleY-AI (A53)
>>>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>>>>> +
>>>>> +require conf/machine/include/j722s.inc
>>>>> +
>>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>>>>> +"
>>>>> +
>>>>> +KERNEL_DEVICETREE =3D " \
>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a-beagley-ai.dtb \
>>>>> +"
>>>>> +
>>>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>>>>
>>>> This defconfig doesn't work if you select an older BSP.
>>>>
>>>> Thinking on this, the only difference we should have between this mach=
ine
>>>> config and the one already in meta-beagle is the default selected BSP
>>>> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config an=
d
>>>> select the BSP with TI_PREFERRED_BSP? We could do that externally
>>>> from the build env, or with a branding.
>>>>
>>>> The issue with this patch is we would now have two configs for the sam=
e
>>>> hardware, and there is no TI produced BeagleY, so having the machine
>>>> config for it in this layer just seems wrong. I have the same complain=
t
>>>> for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
>>>> them in the same way.
>>>
>>> The difference between the two platforms is that one is supported by TI
>>> and one is not.  We do not answer questions or support the meta-beagle
>>> boards.  Those are supported by the community (aka Denys).  But the
>>> beagleplay-ti board using the TI kernel and TI uboot is supported.  We
>>> will answer questions about them.
>>>
>>> It was a decision from Sitara management to do this.
>>>
>>> That's why we name them differently to draw a distinction between the t=
wo.
>>>
>>=20
>> That really is unfortunate. Inclusion of meta-beagle in meta-ti does not=
 make
>> that clear, and the layer README(s) don't offer that information freely =
either.
>
> I would rather drop the beagleboard-ti and all TI versions of the beagle=
=20
> boards and just rely on meta-beagle and what beagle officially supports.
>

I don't necessarily hate that idea. Guessing this is hinging on Andrew's id=
ea of
overriding the BSP provider variable directly for our internal testing?

