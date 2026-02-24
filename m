Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB5CF4BB6F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 18:14:25 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26960.1771956863919819393
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 10:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c5O8nkaJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.34, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw82S2eBUjVdSfu7O2EJYOCbsxHEa4h8nl5PLoM+2c4JFHX7G4uD2OXCYeUhv2b37sHfkyhqxOZQ88bCXv/WKOAW3zHxEjf2HRJy7yMT1ews32PekBtXuvmYJk+Abhn8G/7kb8IlBpSYHdM8rRTzaQnBjT5Q6DaXBAQ4aTcmSLYfaCmwL1MHJq97ff4Ol3u5lzU/JgtuAMwHF77Up6EBXimvTFaSgWWzamoGkg6HHnayZzQo8GpHCJN5SJVouGMM4ko835m/W0/sg1NikMX69XWPdDSogrJbbGPvvAJLG7M623n53298SdvYFJ+TbXHFAL6wRLPQmGJUrK+Xs0pPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oca9PdVvES+vJhWV9wo8DShcXM2VYAKB6787JLWUs2E=;
 b=r3XZouT5+A57MTy+CHpSdQftbrmYz3IKwFWboyeToUBQUzF71BpmzNR2wQUd9GtpB2deZTJt4yJ8DOZnr5/y6Jfsve6H6IZlokKC89SpeVvTkp6XVuv5Z9gVABfDnFw37isQdbl64Zbvr6YH+gzbvCWvsERWu5CedAFRulOq6w60vkFukSH418D2uNvmTbo9mcVmJ/Y1KqAfUhzmeEuqkR/ezPXy50w0dxfoR+e0KV6LMeafFYshsT7rsMhqxC13t+0r/+G0JAsCRpielttGIg/8NGMTUqK7I3Ok+O5uDaqfVtrrAxlvYWkUarJ9QxEdgForDGjc3C7SV4Jl9SYymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oca9PdVvES+vJhWV9wo8DShcXM2VYAKB6787JLWUs2E=;
 b=c5O8nkaJxWfb+r4AdAw7CokCsJG88z/Ml3NFeHUzzLnWrlQ/86R0/MRmCztO8TuUurHssW3IP/n1iHq1p0lKOV78ubCD4XUS1Q6yMHuC9EIKksPdEVh5kf1UqldITY+Iq6xpE4PsB6ykWjE58HWANicmvE0VPyc2G6ld99DhX+0=
Received: from BN9P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::32)
 by SJ2PR10MB7597.namprd10.prod.outlook.com (2603:10b6:a03:53d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:14:21 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::5f) by BN9P220CA0027.outlook.office365.com
 (2603:10b6:408:13e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 18:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 18:14:20 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:14:20 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 12:14:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 12:14:20 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OIEJLi3191317;
	Tue, 24 Feb 2026 12:14:19 -0600
Message-ID: <c0bc40a1-5653-40cb-b749-3d2a789d1cc5@ti.com>
Date: Tue, 24 Feb 2026 12:14:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board
 configurations
To: Ryan Eatmon <reatmon@ti.com>, <rs@ti.com>, <denys@konsulko.com>,
	<praneeth@ti.com>, <robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223235744.3928753-1-rs@ti.com>
 <20260223235744.3928753-2-rs@ti.com>
 <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <98cd7118-98f0-459b-9192-ed22dd51f577@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SJ2PR10MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 97124690-cfa3-4cd5-0439-08de73d0883e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/01BTgbP3YH6N2cHji8qe6vhwlpMRV2pn4SnHidGnS2zlKgVMhOgE45M26wI?=
 =?us-ascii?Q?BLY029eC4nToVYq7dzEbc8lgdpMQUu3hz2v6otRkEu9QTYhaVbiksC4r5mqR?=
 =?us-ascii?Q?5kVicn5HdcpZyX44j15WmwnIn2GfTDzWFJQfOzpj8R3FyR2pUVv9eIpN04IM?=
 =?us-ascii?Q?ZMyJwJ+FdGNINNpuiBZgMO/wZTZLk24NNdUMFTcO4tWCE+9JSyk61GVjO5G4?=
 =?us-ascii?Q?bRkKIyHuTonsgEqMQjL9SEFonmCkgK77MYLm2+PUeToLwWags22NKy97Mnh4?=
 =?us-ascii?Q?tCmeamMSYbUdqzxJwpUP7cBa7V+7d8uRb24i7oesihOjqpE7OQ7GWuutxOP4?=
 =?us-ascii?Q?lGiU7BI8s1en04n3ARDeQPnI4Wy2wFuJlu21Ux1WAK2cp1CFhCVX5pY8Yi56?=
 =?us-ascii?Q?VRk+pVmYrGcuktC2KbL6Y3NukcsTl0dh9Mi2+0a6SDw7n591AMfXn2Gth908?=
 =?us-ascii?Q?c0ERZThuKdLh6yG/P6NwnQeGmq/XhTXcO7spNgKJHGVoPIN5HJ3sMMnWmA1d?=
 =?us-ascii?Q?LVs01hmD5kHmsoSoeF8MDfoDCLhT/6yd0VpgTrMdCNOSXqkXPt23UJyp5N5x?=
 =?us-ascii?Q?F0Nm2OzozLTltc0saKMFlE1K/URjiXiDtIaT03a4QQXPhb8OiZd+0bH9WBqt?=
 =?us-ascii?Q?nZRzrvcwhGjbz3TA2BdLuJ1xZWL7AvcRSDN6noQHwhEwl2KLkzLLa/HbUM5l?=
 =?us-ascii?Q?x8RjtSlIJChweEd/eAL1IgQx6p+fP6zYFfR356w2eN9BWyhNUHFXDbb5JFxU?=
 =?us-ascii?Q?j3YYmgHzbuiQC4gjMScEZ6GCRDCrnScn9zENAkY6Oz61kPhS7Ypfbqyw8iaS?=
 =?us-ascii?Q?WuTjrWrmpCvzBfce5mqOZV+2jN6xD6+dknf8oEe8wM6kS9O9XFLk2oUuu40p?=
 =?us-ascii?Q?s8GzSjkjQgwnx7cScV7lE5TWKaAJqEk4vwDnD3OV1u2MJjCeDtQvz6PjdZdR?=
 =?us-ascii?Q?3d9nzoyR2aYqY+Slqaus64qA3hcJ7Ey0E9hS9m84M9rpmhHlfHXIJFBlN/vJ?=
 =?us-ascii?Q?6/ileEJJL3yM75CcXvFBsMiSav0wJdQoqBH/Uia4lMGsEEIWz3eWLrrsv+CK?=
 =?us-ascii?Q?Ljt7I99LkxJS1L5YYpUbEVCaNfDUdinACPnS3lGfuqTk+kTh/EpdTmMhPOAi?=
 =?us-ascii?Q?fjflxZr60nKfKKNmK28Wbnw15pMiGxgHRFaYmZnMNPZAsmVXy6JgpKsNe/kB?=
 =?us-ascii?Q?tqhGqzee9gr0YNFH9XjdifoXdx1Aj8ugRiwKu5g1yuIj6rxZm1A1R90OkqWt?=
 =?us-ascii?Q?ePvMLt+DseJ0r6JU45JZ5evgXr3F2sGecH5ojNMU2zKJhWiodXW2R7eriv/+?=
 =?us-ascii?Q?WPUGr+0uxJz5bCK7K4aVVmDnuOFmBz+aH8ZYuFN12CMefXvq7+2PlNSwcSaK?=
 =?us-ascii?Q?wKwUMz9c4Y8xqNwb+clfo39aZjwMsO/PrvZQOj/LZPtZWs95tQy4r/lMI7we?=
 =?us-ascii?Q?lvla+MIRAG1HmoyNRZEC1QPi9k11mRa4s4bQN8OJfYaDUvspLFK+oO37mWtW?=
 =?us-ascii?Q?2jplqGEMad5o1RPX0rx5vdDYnOYJfJm6EO16KcST1++lYoLX9OYDL9NNXztF?=
 =?us-ascii?Q?AmuUdFL0ICe1PRwy4IYLAqmaBy396hP+E9iGFVwbFWAi/NsaMWJ5KQTDhbSz?=
 =?us-ascii?Q?hsoRXOaT8fBszTTJsAOBH9OrDMqc1AOisU690MR2XxSKtUzvahzAz8RFlBW8?=
 =?us-ascii?Q?3u/qFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FdFH3FiwslieYVlbaheu5DYUMa1932xu/Xm7QVY2GirqSR/1ctIeK52o2RCX92spWs5iRpf+Ke7ozjCSkIU+lVj13MwKS3J5MrWGmKURv6tiCa8eihFZaO0kJNql72XjGccPjDrKrtak7PL67WsYL1GwZ9yrnR3+4jx6tsEAbp/7nZAOKqzrV1BAdrft2OSNiE3qg50rcuUmItShMzg8j1+NAdXj00ZJf5WZhWLzCOKUsLDFN6ELuhPotBVj9Qb7VpSVwpZFrhlKQcIIEzMPsqN2hKrKsuSxQwkBs22q2C6uO/p0z7JrHiQHQuAnSa1bBpo14ZKiB6b4ISjvrfBXnnj2XwyW5BpCjANHSEr97vnjoLsDANYKNLySOwiJj7CAPuq4gka0pH25ur2OSklEdjh3ZvFlGpKR82eX4aC5JGci2RcCJQWnHsKgR+23XDBw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:14:20.8104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97124690-cfa3-4cd5-0439-08de73d0883e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7597
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 18:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19585

On 2/24/26 8:55 AM, Ryan Eatmon wrote:
>=20
>=20
> On 2/23/2026 5:57 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Move all beagle board configurations to meta-beagle. There are 2 skews
>> currently:
>>
>> 1. A base TI configuration setting all the default variables required to
>> =C2=A0=C2=A0=C2=A0 use the device with meta-ti-bsp provided packages.
>>
>> 2. An override that uses meta-beagle BSP components. This includes all
>> =C2=A0=C2=A0=C2=A0 the values defined in the TI skew as well as any meta=
-beagle specific
>> =C2=A0=C2=A0=C2=A0 configuration.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf=
=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.co=
nf | 0
>> =C2=A0 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> =C2=A0 3 files changed, 0 insertions(+), 0 deletions(-)
>> =C2=A0 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti=
.conf (100%)
>> =C2=A0 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-=
k3r5.conf (100%)
>> =C2=A0 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.=
conf (100%)
>>
>> diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-beagle/=
conf/machine/beaglebadge-ti.conf
>> similarity index 100%
>> rename from meta-ti-bsp/conf/machine/beaglebadge-ti.conf
>> rename to meta-beagle/conf/machine/beaglebadge-ti.conf
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-bea=
gle/conf/machine/beagleplay-ti-k3r5.conf
>> similarity index 100%
>> rename from meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>> rename to meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-beagle/c=
onf/machine/beagleplay-ti.conf
>> similarity index 100%
>> rename from meta-ti-bsp/conf/machine/beagleplay-ti.conf
>> rename to meta-beagle/conf/machine/beagleplay-ti.conf
>=20
> NAK.=C2=A0 There is nothing needed in meta-beagle to build beagleXXXX-ti =
since it uses the TI kernel/uboot.=C2=A0 So just moving it over there does =
not make sense.=C2=A0 I don't think this is the right thing to do.
>=20
>=20

We don't place the board configs based only on the lowest layer for which
we can satisfy all dependencies, I'd think we can place them where ever
it makes most sense. So Beagle boards going in meta-beagle seems correct.

Plus there is a dependency, `beagleplay-ti.conf` should depend on the base
`beagleplay.conf`. The "TI" versions of these boards should simply include
their base Beagle .confs and switch the default BSP over.

Andrew

