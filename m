Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097E1EEC2AB
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:59:36 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7959.1771887567554449974
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wOoXK71E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.44, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvFG7CSoNuk/Xbv09biYCecBajGdlPX6qo9oiEb/bNG3EtwQVJgzU0Odnx0xdQ6abMEMYJRJ7tfNX/Kuzh0CMmOLnPpi+0nIKkD96aXk9b2Tk1mSFKdeaUDJBFn+pyOJJPvn1QncJ+a/UPBmxrUXlAy7vR2/AVyRHqiWfmaQdB1o6yCzHhJHjbyju1JEyZnQA/56VNnUx8fwj3pJUKV/6SOgynvMiFq7IPKD72d9fBtyElEHXHeYpgMxDZfaaoBcMTxpxEs6SqxP3DUwoVl9067FiQ3MED+QEMxwFgMoLK6HuvKYQJjJrlZ5PNn3zQQk4XmvUOrikFqmKUpMTYl4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrUc2vgU9j4zoozNYuVaUpoyJAVQS+F2jyqeHYG6FeQ=;
 b=gj0e8pj1NkbspNRcyzmaJbwZdNwu+K068UNilI/28V04MnxISz3Lv13uT/14t6wtVjRb28AXu3e5kfA2X0LWW1YTREOfmY0scWQP2Orap4Vl8UiOeAfIUfS7V8LqY6byyE4elg/jepZ8zO/54xxNuQuml0HH3fePzvne5/mDr1ISR61+nPwq/OmOvD3KbWn1ZGeSX6S3iQ9pEvu9DL3eMMFCZxq+52T/Wl1opyGp5UgV8PWMbU3gF2EV9/HIDp0Bt7wML40W4rxOjT7du6ns+KBh7QE6P3ERjjSrrnXQCrJiDAsFdXD+GbYhSgrqsxpsJv0gAyxE1XxZcsYFfy/mcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrUc2vgU9j4zoozNYuVaUpoyJAVQS+F2jyqeHYG6FeQ=;
 b=wOoXK71E7zsiuwBU3s7BjQvTBIms59765GcX8yiNv9IEzWpoWB1EEWW9+TxgKFI63NJIVqf9lnyO/CT1zV1cu1Cio4p7Qz0i1EwrSs8P5pY3xoHWAwGsIB8nUbTVnrHcW/Iyqw91CTOy2c3+GdiaADlDZOtr+IDGijFTpoue1Io=
Received: from BN9PR03CA0643.namprd03.prod.outlook.com (2603:10b6:408:13b::18)
 by DS0PR10MB7429.namprd10.prod.outlook.com (2603:10b6:8:15d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:59:25 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::5c) by BN9PR03CA0643.outlook.office365.com
 (2603:10b6:408:13b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:59:25 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:59:24 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:59:24 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:59:24 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMxOQ61630322;
	Mon, 23 Feb 2026 16:59:24 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 16:59:24 -0600
Message-ID: <DGMPPXUSE4X8.3H0G57A43JA09@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>, <rs@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
 <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
 <092333ba-564e-4d75-9c4d-4a37307ac054@ti.com>
In-Reply-To: <092333ba-564e-4d75-9c4d-4a37307ac054@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|DS0PR10MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c6e8f3-9679-4b01-f1ae-08de732f30e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cklkMFVLR0xxTmw2emV2RTlBREFYdE5KU0hQRGgvcG0yM2hPVGZtSlZyY0hZ?=
 =?utf-8?B?OGo3bnlZTmdYTFRjalEvZ09MTkJVcDA3TXR4c0lxWWxYME14c3pBbDc2elVn?=
 =?utf-8?B?L2x4VU1FaUZ4ajE2S1JjTEdsS0YrcEJUOStIM2FHaXZtUk5PRFBOdTZDbXpr?=
 =?utf-8?B?SXBsMjJKQ2RVbm5OaW5iNzc4SE9ZbUlnS21odjZXb3lSN1FQWVlweFJjc3lM?=
 =?utf-8?B?RHJaUURjMHFJSWxIUXhwK1dXZ3R5d01VaW9veEI1TmtHZkh2NVU1UUE0dURl?=
 =?utf-8?B?bnkxYjdSeDlKZHN6QXFUaDR4NDlZaGxTZ3JlZUIyQ3Exbkt5YXJxcE53dENn?=
 =?utf-8?B?Ry9FMmFDSTl0ZjBXNE9NNjcxS2JZanZDRisweGcvRDZxTEZFei9hcmdmMWF5?=
 =?utf-8?B?U0xoMDN2TS9wdzkweEt6czJpOGJhUUVoN2ZIanNNZGsrU096Zm12M2kzQ3dF?=
 =?utf-8?B?V2t6VGtwKzM3UG9ZcUVkK0lIcHQxTSt6RGtwNXowZU1iOEpmQW9Hbi9kdnF5?=
 =?utf-8?B?Q3FFR0M1T2d6L3dPNGJMZ1E5SzlXbkxuT0NLMEY3ckNmRjQvSEdDemxpMDBJ?=
 =?utf-8?B?Z3E1Z3VuSUlaaVRLVVdtcTJjWUFpSnNFOTlFbTIwVks3TmdEcTlGUGFRbmVh?=
 =?utf-8?B?YVFEYnBXU2VKNER3V2s3V0s2M3JoeFFXZ3BBYzljSmFtUS9CZTlGRlpvakF5?=
 =?utf-8?B?cmczTkZkcW5UZWZhTXpjZWxlREhtNytuRmlXKzUrM011WVJuU29yWEw4K0JQ?=
 =?utf-8?B?cFBRVVpFeWZwUVpNL1QxdHdYbmNnVmZHNnBLL1NRekl1ay9zbkpGbkRnUXNI?=
 =?utf-8?B?SUZ2N3VCUGdMczJLRmloL1dna0h4UjR4dDVmc2d5YmplYTlKZlYyZzJXZ0I3?=
 =?utf-8?B?Q0ZqSUdKbjQwbjM5cDhNSm1raFZTNk9NSG1tUW9QZHNmUW1BK2ZrK0NaVXp0?=
 =?utf-8?B?aVJ5Qm1KVnVXMHJ4Uk5BNWNhQ3B6NUpWNjZRZVBnSG43ajJvN0ZxbkE1dU1o?=
 =?utf-8?B?S0QvQm1sRjV4SFB5TGp4Y3hMcm9kS0toSDVyMTg3MVJvV1M5dnNVTVhROVpj?=
 =?utf-8?B?OGYxa2hqWSt3eml5R2tKR0g0VWtPTldlRWdrTk9RRm9lL29JYWdFL2ladXNq?=
 =?utf-8?B?UUs5ZGtIdWx4T3hndVR3MDdtd2krRTJFVjdhWkt4WkRKK0EwK3o2WGk0MFo4?=
 =?utf-8?B?Z2V2YkxuMXV5MjRIUVBFRmVBdnBEOFZGNXM5akZZYWZuK0M0cFNKdlR3Qlcr?=
 =?utf-8?B?OFNhMVhnRVVWMDJINDk3SlM4YTBQazNvTndmcERxaG5VOWFPL3gvb1hrRDdS?=
 =?utf-8?B?akE3UVlOR0Rua01PaTlCZWVIMXA0K1hremdwd3JpSFVRNzA3YlUwamk2WDdE?=
 =?utf-8?B?b0krY0xqSHdJZ24vaVhneUtTSFkxZDY5R3pBK0pkMXNhWDhxbWRtejR6NGZG?=
 =?utf-8?B?a1ZFeGx4QlRqZUt2RHRZWVR4TUlQby9hWno0dHZZbkVXQzlaK25NQVl3OGRE?=
 =?utf-8?B?SEpuWDlvWWNKOTJ1QzQ5bCtaTnRmejBqWDZWdGFIVUVxQmNDVHkyZWVlRmhF?=
 =?utf-8?B?NFkxeHRIdjd6QnRMbThaUityUVc5c0t1MzJoQjRRd01Nb0RMLzllQkgyMGdM?=
 =?utf-8?B?TW95dmJMVnlNeEh5N1g5UXdUcUdBKzdLelFrUkVPTkVWTVlhVmpScmg2MUNR?=
 =?utf-8?B?TWY5bVdDTVgvSUxrZm16ZjZjMjdUM3VvTlhrOEIvRVgwa1RWUXFpbFBIMk9o?=
 =?utf-8?B?bGRhS3p2d0tPM0lVOEZtc2U0TzJsQTI2eUpLeHFuSTYzblU4K1BLZWhjZk5k?=
 =?utf-8?B?QWpRMlh2b1g5VHc1aFh5SjRGSEpLblVmRm5UeXJ5N1N6VXNyNzNlWjltSzdI?=
 =?utf-8?B?ckNqd2hMejFGaXN4VXRxMTFpZTlmM250N21yZFdiaHhxMUd4eTM4OGJsZmt6?=
 =?utf-8?B?aUh6R2pWbWFwOXhGZWZ0clBmVlMrNStvWHJQOEx4dWloUnI1WEpMSUFuVlZi?=
 =?utf-8?B?b2hRRUErU1JQM21ROUUvMjBNTVRoWGNveDFUbGg2bUlRdEVtbWc4MG9WZnM2?=
 =?utf-8?B?cjR0QTlwdHplUGRxTlVINDkvKzZLMm9jRkVXRkRHK0xPZVU1VXZ3OTRFbE0w?=
 =?utf-8?B?WEZtcnlaSXNPdXdmYm1MZXFrY0RGU3VhamFhRDdoSDFVWHJ3UVp4dTVNNkpL?=
 =?utf-8?B?dndRaDZIekRyWjB3dk1ySWFXMGJLOXpSK2xKRHJJL3JMNjFxNUFjMFE5WXN4?=
 =?utf-8?B?eVlNV0kvYnRZakRWZkVpS1hEVnVRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0eYO/upScop1Ew5rvvGq7ICk9QqfS7vCAs5ut6kdprG4PY3DUT7iRmywR03Jl3m3M2g9whxg8j9+PytlOYsmV5mlOjBRWs7OUbgsAQec52O9+xTC7Z350S/AlxvfT8ok6OvTBTXYJK3gOsHaurHAXibrg/4EukSseiSiA3rYb7f2ar6doQMobfBBf71DGh+7+yiPPaZ35wKKOXK6a+sMEYAOw+kqodOWtWL3RVdtVkB8D+UPOEUlJ+qY3f7WdbcTxzI94SDWJTm3Dxklx6g8fSFyYrlwWwcQ3TKeNpO3hunGZ9KK1yFi4btEHWNleaN/la67izk9K6f8tePtdGKN5o/KrkqJMKOTo2G3byXngNhUUuhTfObnSNcZCV6yhFubAZX1v7Bwp2yip4gW1gVQ0y0w6B73Fp8ovuMAndN5EaKzgbM7TJEML50s9wz1u3EI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:59:25.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c6e8f3-9679-4b01-f1ae-08de732f30e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7429
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19577

On Mon Feb 23, 2026 at 4:43 PM CST, Andrew Davis wrote:
> On 2/23/26 3:54 PM, Ryan Eatmon wrote:
>>=20
>>=20
>> On 2/23/2026 3:51 PM, Andrew Davis wrote:
>>> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Add a TI configuration for the BeagleY-AI development board.
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 ++++=
+++
>>>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 16 ++++++++++++++++
>>>> =C2=A0 2 files changed, 23 insertions(+)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.=
conf
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf b/meta-t=
i-bsp/conf/machine/beagley-ai-ti-k3r5.conf
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
>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf b/meta-ti-bsp=
/conf/machine/beagley-ai-ti.conf
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
>>=20
>> The difference between the two platforms is that one is supported by TI =
and one is not.=C2=A0 We do not answer questions or support the meta-beagle=
 boards.=C2=A0 Those are supported by the community (aka Denys).=C2=A0 But =
the beagleplay-ti board using the TI kernel and TI uboot is supported.=C2=
=A0 We will answer questions about them.
>>=20
>
> And selecting TI kernel and TI uboot is done by simply setting
> TI_PREFERRED_BSP =3D "ti-6_12", why do we need to clone files for this?
>
>> It was a decision from Sitara management to do this.
>>=20
>
> To do what? Support BeagleY, sure that is fine, we also support Wayland
> for instance, but we don't go and clone it and rebrand it Wayland-TI=E2=
=84=A2.
>
> We support community projects by working in those communities, in this
> case the community project is "meta-beagle". So let's add support for
> our TI BSP to that project, not fork bits of it into our meta-ti project.
>
> Anyway to close the loop on the two threads,
>
>> I don't necessarily hate that idea. Guessing this is hinging on Andrew's=
 idea of
>> overriding the BSP provider variable directly for our internal testing?
>
> We could at very least start with this "beagley-ai-ti.conf" do nothing bu=
t
> the following two lines:
>
> require meta-beagle/conf/machine/beagley-ai.conf
> TI_PREFERRED_BSP =3D "ti-6_18"
>
> This would remove any duplication at least, but does introduce a reverse
> dependency from meta-ti towards meta-beagle. So the first option of a
> BSP provider override as needed is still my strong preference.
>
> Andrew
>

I'd almost prefer we move all the beagle-ti configs back into meta-beagle a=
nd do
that override there. Makes the layer dependency tree more reasonable and
provides logical isolation from meta-ti and meta-beagle devices.

I'll draft that. Doesn't seem so awful.

>> That's why we name them differently to draw a distinction between the tw=
o.

