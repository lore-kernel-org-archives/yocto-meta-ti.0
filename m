Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBA0EEC2A5
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:32:05 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7287.1771885923270419568
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QBXj6pZP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6+YUROvN2XCBexEsev1PNFeM+4y3/o9pfuyGzLcDUdpjD1wstNlBKLAU/gp8EqSFuA0MulukqucKIbBcANYPcuO67yiitd9mArkx09Y3GzYykw+jmGhVEy9TVJ4EkRowofzyYZSCi1SZd6VJd6QBao4eC5RO6HgKAqUOGlVAlQaytscoAgHpHsEUxeZ15FPKbbweGh8Zd+AnXT/6fauF4YzBZodo78WKCkhram6A01NpCFhSuv0jZKN35LLRoYoZluuiyYJBaUMwZp55boyYp2q3sRB35zDmIomYCOWvfliubtB0q3nADHpU0IXZQmr5iomifrJ5lrQDi+hkyowMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70fcosI9Q2KqahnZVkBPydureP/cIh8k63JibaoUk4Y=;
 b=QnGnbW1EPCHlGGJeYKbBOZW03w1ZQAGHum1yQ80bnpAHWfpF6RwQq94ilvG28G2i3ja2P1lYd1vEhu9/NuenludOMYThhtlc8fKIaYqFDiIYC0Uzb92/j+eUZsL29oZc34bN64avX6IGIohD8THPjDL/gOnMnwFAPwISgpN3VuB0Yztxo+Ay6HvHporDGLxjWJvAQmJdBgorbsfZZNhxkRWbuJe1F3hQjQBGC9BCxLAQxlU0NY+mQPutNIZRwecIdUfkTHjmEEPDHIFk75Laa/yKy6kA4yHhtSOBZ/NESCt/ABgjICIjBNQsvLjXs7aZqRnH2p0JEb6rvSuABH/fmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70fcosI9Q2KqahnZVkBPydureP/cIh8k63JibaoUk4Y=;
 b=QBXj6pZPV4bMsV6+/Q6TTmUpmvbpom3SM082TO4h03FXmUQG07Ke9mNePYdvbw8FsZvPoPy6WJaNXTxri+KqYw/K8IzJ4Um/Ur4+RWoHs52w9mHqSHQIuII9lgYcVz1N7nVztqHJuoCVMKyMheANffT7fiMO8rg/MV43/YCeSgk=
Received: from CH0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:610:75::16)
 by CY5PR10MB6166.namprd10.prod.outlook.com (2603:10b6:930:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:32:00 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::9) by CH0PR04CA0101.outlook.office365.com
 (2603:10b6:610:75::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend
 Transport; Mon, 23 Feb 2026 22:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:31:59 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:31:58 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:31:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:31:58 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMVwpC1599227;
	Mon, 23 Feb 2026 16:31:58 -0600
Message-ID: <7e3a364d-5547-4478-b461-28979e200a18@ti.com>
Date: Mon, 23 Feb 2026 16:31:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
To: Randolph Sapp <rs@ti.com>, Andrew Davis <afd@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
 <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
 <DGMP1O03MM2D.1ACCARZ9FSNHW@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DGMP1O03MM2D.1ACCARZ9FSNHW@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CY5PR10MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a913964-110b-4f7d-3192-08de732b5bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pdYBB7SNcHLRfhu6SqJ7xPHBa8OXd/i0VfBYRRingUxC+z5T+FN34qTnHSvI?=
 =?us-ascii?Q?pApJcbWwbgQ0QJ5VP8wISAkfcJJ+aFewNdrZCvg7Q9m/s6wekzAsCmLzobjE?=
 =?us-ascii?Q?4DuZKy8lAQ+kQFxP36o4mT7P1/RcdL32al3iHyFdZ5FMu70YTezrOkSqOGca?=
 =?us-ascii?Q?RhQhkj2yncCKbCahPK5eK0LIdn82EYnCz9e+lfHAFQcEZ6quqnSAlMQzxqI6?=
 =?us-ascii?Q?uxpjsSwJ+sDu+Y3PRwU19dvSspNqddJEu27TujRFJBE3Bg+Kddrh64JBXJ8w?=
 =?us-ascii?Q?fMRMNqY/VZOxBxwvJ//Iocl8Aw9qomshBJjjfKRpVYG3BJvqyids2GmHOlX7?=
 =?us-ascii?Q?REOWKib5aGKqishFnqVqi98XyHw4TfD5PJorKcpvOwMJ7P+ZMVMKnj2hQEO4?=
 =?us-ascii?Q?+lFBXUU+KD0Q4v20vi98EEYemGDHglAUz/JvcHJgpSu9pYNuid8tyPwVI4wW?=
 =?us-ascii?Q?ljcosBIHCgotrDTqzjaraIIYm/8x6RzlRusnUMWorrqPT5e/u28bgjy8+F7r?=
 =?us-ascii?Q?GmXOBB8bpbNcA88dAnCfRti5ZbtSUO+wHu5J6uVqmNKXxakkC4ttdR5D230w?=
 =?us-ascii?Q?mUBcf5UjN/zNDoY6HNn7spFz6+3EVxKDmBt2ON9RAhQCuYvOiYo3FOIupUTC?=
 =?us-ascii?Q?mzlLu6P8gtDxiFUAd0jxY2teplI7T48kj16WUzPnCs+3pSvqtuKhpNnhckS1?=
 =?us-ascii?Q?JoyrK0LrbyRwXc5xL9dn4Fzps24wK0P/eSovplSgStfzi6ZXo3EpQjZWWLPP?=
 =?us-ascii?Q?Af3gBUWrV6myX3427TEtp0U0bnwTm+lEeIg2wztyjhXgTk04dWEh5l4kFNm8?=
 =?us-ascii?Q?aPiXRMd82T0Zu6dzT/jMGH6IfooCCnUh4d5Ibfsw159HH5ivjSo/k6+sqEw1?=
 =?us-ascii?Q?rED4+AZJ0ymrK6txfUzYJY9dCZLiRuUn54bmeRQq8dMKE00hIfYopPBSGV4G?=
 =?us-ascii?Q?uya3APuENnLfa8ATuRHwoOFDIL7fqS30Lw/Et486lO2IWKapeM5LnLb+OdFB?=
 =?us-ascii?Q?yf2KOoHuhvWW13PNpaIXKGy9Oq7dKIRHofH41hicIcPbpej99wYgIWH5/GD9?=
 =?us-ascii?Q?h3sZynpM47DQ/hidGaBNDqPsM7E6uv+8wgl98AtzxAdVpYy6cZFfPNwPmezN?=
 =?us-ascii?Q?Gj9Pt8scjRZnT4aXo77oF9dwHLqPL2i36MBbj8aesWZn/8lOAJ2RFEYWCzzE?=
 =?us-ascii?Q?gBSNsuMJENTpX4huichx/DN8cKn8BNCxpiRJpLwfEllLkeMOVnGPs+C7vJeL?=
 =?us-ascii?Q?aIHodydzr5j9vTVIpP91/5y7SUvuLtRK4nu/GdzGaCxxaUseOB6ByKlrdDAf?=
 =?us-ascii?Q?UnG9vudkfEQP01G2r+E7GVYRwbKQujoPRkwDwDerhfm48td0T7cacUq+jVs1?=
 =?us-ascii?Q?S3XyzA3LYpr10XDrVq3bqRAmOWdM1QSmT7idX+hKgqIM2eJWAXAxJ3lrXN5i?=
 =?us-ascii?Q?c56do9JjaZZE44xtk5sH5FY140selYy5gcHbN0FSdasKYMkVWRv9SgyhjrJ5?=
 =?us-ascii?Q?FzQ291Cpc9ZGyEeunqAZfNn163SDOlh51ljQLUPy/6mM+H6ZWV2bKZekM3hj?=
 =?us-ascii?Q?y0mqzc3riwu2LWmVs6VLAwhVSjEIehql2Kdmt8gIQh+6GH7DXLF19R/m/5Fk?=
 =?us-ascii?Q?Rax5lESbgW0VLQR7ghnZdhUE6fTSqLYpSXI2qM1mmrc5I9HsUUMvbaHiZMmR?=
 =?us-ascii?Q?Ll/TAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7CVp8yNWM5A70SvO+qkL4JO7DxGUI1mba7CZZ/Z+DMcmQxdwcz27YEziMCu4rvQF1jze/a9wupvbQvyiz+higZNeMN1vcGXoFgQIfFgxv9e3Cdputkebt4O0SJpvUF1LPK1m2VI81qS0CKTn+WbuI3GcloHt9HyXYN12U+x7QZVplDomVyhdoS+kD+r4rryM21xz9oYUfzfm4F8zNgNX3Xtv9oBgbSEGvpcxVJVaOD8iw3oQ5j6uCYR90F8UgVgXKFzxb6xWPKv5NU9NQrSCZ3E8GEL1mS4JNMzWKQrFVIOQCohoKMbEzlsP2I14mBIJ/mGXgf79CPbppjDvhPgW6Cfraf9UnfxO/AbensNMRpkyj9NrJlMyvXdF3ny6Ibkf6FK5UMXGD0RRbrsV2rAYTd5I6shppO+1jLZy23oN0bGlXR551LabSCEyVn7Ry+PF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:31:59.1685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a913964-110b-4f7d-3192-08de732b5bb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6166
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:32:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19573



On 2/23/2026 4:27 PM, Randolph Sapp wrote:
> On Mon Feb 23, 2026 at 3:54 PM CST, Ryan Eatmon wrote:
>>
>>
>> On 2/23/2026 3:51 PM, Andrew Davis wrote:
>>> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Add a TI configuration for the BeagleY-AI development board.
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>  =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 +++=
++++
>>>>  =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 16 ++++++++++++++++
>>>>  =C2=A0 2 files changed, 23 insertions(+)
>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5=
.conf
>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>> new file mode 100644
>>>> index 00000000..88d0888b
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>> @@ -0,0 +1,7 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: BeagleY-AI (R5F)
>>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>>>> +
>>>> +require conf/machine/include/k3r5.inc
>>>> +
>>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>> new file mode 100644
>>>> index 00000000..088cbd62
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>> @@ -0,0 +1,16 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: BeagleY-AI (A53)
>>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>>>> +
>>>> +require conf/machine/include/j722s.inc
>>>> +
>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>>>> +"
>>>> +
>>>> +KERNEL_DEVICETREE =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a-beagley-ai.dtb \
>>>> +"
>>>> +
>>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>>>
>>> This defconfig doesn't work if you select an older BSP.
>>>
>>> Thinking on this, the only difference we should have between this machi=
ne
>>> config and the one already in meta-beagle is the default selected BSP
>>> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config and
>>> select the BSP with TI_PREFERRED_BSP? We could do that externally
>>> from the build env, or with a branding.
>>>
>>> The issue with this patch is we would now have two configs for the same
>>> hardware, and there is no TI produced BeagleY, so having the machine
>>> config for it in this layer just seems wrong. I have the same complaint
>>> for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
>>> them in the same way.
>>
>> The difference between the two platforms is that one is supported by TI
>> and one is not.  We do not answer questions or support the meta-beagle
>> boards.  Those are supported by the community (aka Denys).  But the
>> beagleplay-ti board using the TI kernel and TI uboot is supported.  We
>> will answer questions about them.
>>
>> It was a decision from Sitara management to do this.
>>
>> That's why we name them differently to draw a distinction between the tw=
o.
>>
>=20
> That really is unfortunate. Inclusion of meta-beagle in meta-ti does not =
make
> that clear, and the layer README(s) don't offer that information freely e=
ither.

I would rather drop the beagleboard-ti and all TI versions of the beagle=20
boards and just rely on meta-beagle and what beagle officially supports.


> - Randolph

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

