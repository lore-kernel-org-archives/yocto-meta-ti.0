Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978E6EEC296
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:54:55 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6458.1771883688622840198
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 13:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=oOw4CaFf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIWaJSWYz6BhMQ9avXL0xpeipTU8BewRmcPSYaOpJWWzSRY4tpjRXDYW4UpW+tOVAk3LxYWyNaKoVWSEk38O5B2M55kRCsv36n9ywafL0a4bEA4ApBPaA1oDPSfjYHBJmMxIY/bCZFoMrIGgPTQ4whKy6NcfWGvr2uh1DRZAAApFk4i5eMlNuPXTfjRylTDILXeY4h2pLO4LWEMsyM+f/32j0+If+DQvoQxCH9aTrh3PuO7XV3qZMzyemA8aQCL6NYxMnCwhJVgAPjeuzsCqjhRY+a/Mx4FDWLuoym+HuqgCS0OQPQmON4Qg9TPdlpMSkgrqc1ymu/30PJvG62Qg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuhRPVQXBaXe3KhhZrPc4QcIhf60/TdZuE0rF5ZIzWs=;
 b=c7kZfHqVxH6Tdn4k9logZnjsDE9ap99fRLIj+vp2FeciqqIR/by45wWBn+QcWmjKEyfjC6/wlpjV2/VzTLiRvZwGoOrUOKunpjiJn5dp5+9+E0xfeCgPQYWgoqCg87KUIXMyAGL1h0jtoGRTnxJbfoV42AefEGqgKIXuLn7wAI1EuTSNOfEmY2V1P6t81v2xFydyusyv43tIo46Zz4MOdGXlY0Thij2F2ZsV/RALAP+ujeSNmP8K8oGxJ3Z5IG9YV5Q0p4TpR/krmqjm7oBnGTkiraTJc38QzGUoFb4gHsDqzAn5g/HERyTIgWKO80TYz6fIgTdtW+KnMMmq1W9mNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuhRPVQXBaXe3KhhZrPc4QcIhf60/TdZuE0rF5ZIzWs=;
 b=oOw4CaFfc9Pxm/acr/6gy8mG1EAZaUUhdDraOR4GAGHPnRU8/nHM+dqNj7NRatuU6xXuCALS94Z1fCk84Pg3BbW94Ax17xYyzSc8l2W3RT4c4Z9RmMzzvjXzVVZ5OA8p8UI/fjFSWvfouC0W/ATBXt1lZGGzNONfkllG1L4EwAE=
Received: from CH0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:610:b3::10)
 by BLAPR10MB4897.namprd10.prod.outlook.com (2603:10b6:208:30f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 21:54:45 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::f1) by CH0PR03CA0035.outlook.office365.com
 (2603:10b6:610:b3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Mon,
 23 Feb 2026 21:54:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 21:54:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 15:54:43 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 15:54:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 15:54:43 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NLsgCZ1069128;
	Mon, 23 Feb 2026 15:54:42 -0600
Message-ID: <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
Date: Mon, 23 Feb 2026 15:54:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
To: Andrew Davis <afd@ti.com>, <rs@ti.com>, <denys@konsulko.com>,
	<praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|BLAPR10MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: fa40585f-4c7f-4ca5-6014-08de7326274e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QY2BW2+CfpGn7fykWRe72KabTEWNHOgI0L9viPt3+nmUZMg/z/BxsqjcqIKW?=
 =?us-ascii?Q?a5eCMGzJkQxsnQwVGUd1ln+nk33hJsmjj0HB8p5GJVzvVXwA7UvLgjxI3veD?=
 =?us-ascii?Q?o3w6Gb9TATWMIuQWA+BjSJ7FYO5+76liDfOnIFejXwv1zCVoOLnS/ceCfElP?=
 =?us-ascii?Q?jUhvB214e3NMaDUrXs5Tx5vCziAsoLPNiAXVrsDiCODr3XqdqXVzL5aqqs/m?=
 =?us-ascii?Q?W/dtcFb9n3HAgkN+3K1TL2mR2n5EP1RCDSou4CPwby4j/8OhpyR1Dq7K4BSV?=
 =?us-ascii?Q?x8HmkHpzAnT2oi4+9kYLLYgLF1BnnLWqGBLy5sdCuGsQfCXFQ9wHgoYTC3vb?=
 =?us-ascii?Q?EAqLOokgwO4Rve6hkHrS6ZcXmq3zD1yAcT2q8EAP4OZOG2StJssHRI5CrT4w?=
 =?us-ascii?Q?88wDsrJL7B1XcTKXhdSFyt3nkjvpYfnqsm3XXI4r9nwrvGDmcCWUVo6ULGJ6?=
 =?us-ascii?Q?52YVnEcaT9YWcBNYGS1rLweqTxWPN30SGRe1VcusmBYEQ15/SyJOEr7H6zIL?=
 =?us-ascii?Q?v+mVBcZUFfYZs/BiuB/eCRZ7LILZMCKS2GJTqzTq364zNODEour/tuErYXV+?=
 =?us-ascii?Q?+bRxhdDqjFFEsY91InmC0QvxQAWnT9LoeDE3mLo+BlGCj4r158FIo1cIw4dD?=
 =?us-ascii?Q?Bhs9nN1BQUJ2iMlVJvWUCC3/WYYOs7JeRIG7+G6TG51CBNBgdl69uQBsnBwM?=
 =?us-ascii?Q?tTVsjHCCTbexW9ntoj3bTTmK5aq8gLC5K82ppAAy+qyeDduLOJ9NqJ+kQrWB?=
 =?us-ascii?Q?55l1FLB3oyGmJdjJTJ/b/0vx9QmsCzY8rUUqjWjvzFOaq/Bw+8ns+9kx0Dj2?=
 =?us-ascii?Q?tAWjzw/YXp2fGHS/d6Ctsh/DfzKQkQju9ii3w+1/NtP0e47RGIeXt8z8sxpa?=
 =?us-ascii?Q?3nUVMK/erXMkBKyFwpA6s4D53J5rNjtO3o/guBOmlPwdVQOtcPfqDLw74uW1?=
 =?us-ascii?Q?Ku+e/T6QLyz0foEv1YSapTbg7CjaDWqiZn07A7N+7DW4W3GfFWD3+j/ndxFW?=
 =?us-ascii?Q?h1yqOT3uOk4KyZUU6N/Fe4orJpN5VaJR04vSDSNce85PYsDMGhQlYLSIY4X1?=
 =?us-ascii?Q?/hvpE7adW80lUfEyXnsxuoY0WXCGnFcluWwpoHgAlBp33OY725cztlm8Hpi5?=
 =?us-ascii?Q?FNi0MWSoj0sCAkNMfyBstltg0in2fuNNM7YHLUgXbMACVNDz5B+3x7D9YJQO?=
 =?us-ascii?Q?vUHK3TNs3mCfDG1hyffyiDfmzWl4++8B3Q0rQJRvZk4/Id5xmEq0dTvtqbux?=
 =?us-ascii?Q?gH+uiSFOLqV7p3O2gfsQb4wSVdlfY6/3Du9LVlcryj89CQhfLPOAyh4bTHHq?=
 =?us-ascii?Q?wH1pdNeUxag8u1AThkYhhE5r+rh0KloLFTvKAmiqJVPE9fzkNvdT9bqNexLA?=
 =?us-ascii?Q?ko0DoJ4YV/eRrFUHHwV8o4ulEOpYo+AWFpM+ZCineS888O+P6SnhgMjPFGFE?=
 =?us-ascii?Q?RiuH8OqEuaml4midOHbcVsDekm1r7iMmUVkrMha/2c/N8UIgj+kUMnH6L2hH?=
 =?us-ascii?Q?W+gqiGrJ3hBU8LA8PKx8D6KxSSSwtI29JYTVXGLszaPHMP3L0qPYCo40LnsI?=
 =?us-ascii?Q?YIDf0Lyp2sGSnmrznL/CqHl1Q0qLet66/paoBI0AmqMbN5HuP1y8szglLx7p?=
 =?us-ascii?Q?OjOP3Fs1e71eWsOhjLb8v1zowW4oI5+RANVQf/P7/rxadpuCMRwwv3xRt9hy?=
 =?us-ascii?Q?3AvfOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	am+wNKK9+jWznpdSwtUovYS+UJi9iLgWy6AN8cHqqs9kHiI9YMFTJCQ3nkEcYtRhi8XtX+96XIaGN+xPHb7E/QVzNhoItWB/mMGpcDfB2LJPHObMkft5NEMJ927aBxaF7Kw/VhacmLkUrdZZCKzXsIBOkdnWVb7VPjF5ayIioE6ap+rsXcSm0S2r/AMD9jKrq5AMiR9wpSsgq8rkSuoSNCEKQrImij4G512lLB41KSIpxvUYeI4TdtkNNZVLPtNLqrfey/SGhJCUSchu1NrC7KonobJD3FDMGQpt6ja2xHcrcpeVwm9167Q/PNad7hkXTYYBCzVd3/5+DaUju4qfvEgzBsYrCDsE9tm+SqXko2ozGEhrfaWoNVGW1YaG+KraeBVl4ZzLVrpI/LdpiyhoAExXJ03eSZK+O15ohaZp3uJENW+3NmJhxvH8Wrwj2f2e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:54:43.7650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa40585f-4c7f-4ca5-6014-08de7326274e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4897
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 21:54:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19568



On 2/23/2026 3:51 PM, Andrew Davis wrote:
> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Add a TI configuration for the BeagleY-AI development board.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 ++++++=
+
>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++++++++++++++++
>> =C2=A0 2 files changed, 23 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.co=
nf
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>
>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf=20
>> b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>> new file mode 100644
>> index 00000000..88d0888b
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>> @@ -0,0 +1,7 @@
>> +#@TYPE: Machine
>> +#@NAME: BeagleY-AI (R5F)
>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>> +
>> +require conf/machine/include/k3r5.inc
>> +
>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf=20
>> b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>> new file mode 100644
>> index 00000000..088cbd62
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>> @@ -0,0 +1,16 @@
>> +#@TYPE: Machine
>> +#@NAME: BeagleY-AI (A53)
>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>> +
>> +require conf/machine/include/j722s.inc
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>> +"
>> +
>> +KERNEL_DEVICETREE =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a-beagley-ai.dtb \
>> +"
>> +
>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>=20
> This defconfig doesn't work if you select an older BSP.
>=20
> Thinking on this, the only difference we should have between this machine
> config and the one already in meta-beagle is the default selected BSP
> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config and
> select the BSP with TI_PREFERRED_BSP? We could do that externally
> from the build env, or with a branding.
>=20
> The issue with this patch is we would now have two configs for the same
> hardware, and there is no TI produced BeagleY, so having the machine
> config for it in this layer just seems wrong. I have the same complaint
> for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
> them in the same way.

The difference between the two platforms is that one is supported by TI=20
and one is not.  We do not answer questions or support the meta-beagle=20
boards.  Those are supported by the community (aka Denys).  But the=20
beagleplay-ti board using the TI kernel and TI uboot is supported.  We=20
will answer questions about them.

It was a decision from Sitara management to do this.

That's why we name them differently to draw a distinction between the two.


> Andrew
>=20
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19562):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/19562
>> Mute This Topic: https://lists.yoctoproject.org/mt/117964418/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

