Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B87FEF5872
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:32:34 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25293.1771263146025585271
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gxLZWto8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.22, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmSIBpn/IW7U6qAb+0Hz1Ef9NZioVlowNLaxYW+nqxQ6AuOeEkC53XiaaXk8uaKKq45y1PQ3c1XQPfDUicGnu5F6DB5m03LcltICjBtytYmY4OFxu+LMskO3n+mbJ8XXf5fJMNm1g20yb1huxlQ9MG5ou2MJfnAmTUo8vKP0joZ8geFy0ZrGRG/qu8wfceIGJtMzvBoVrF0XBXmDahEmHxmZRyMT8wVUoMN9VRDAKGQsZdyclKEKO402/QG80v9VekICHT68mG+ZWOJ2SI5ijgJIhdzAi84H2/p8l/4JFJAer2h+O3YidKts/0xBqGKZarSVy6dwuQFcY+Kt26U+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqIhWessIqiV4bSVhiWfOIhGb0Ix9x50KW+mML2XhtY=;
 b=Adxgsx/xKXU2u37B6EcTMtF+vn5OP2x7h9iawWBZ1G3LGGyYrjMnVRYvyNaT9BTpu/SRXi3A1HKyn8tawHYCALA0RyVyYCcfSMbjbQT8gU8ttfBXZrC+rkrCpM9CmerDRpzmEYjs3SgtOf9XSPAyVOwraerdF7ImxrmmFZjdVUWcM8CZJKBYA33D8Zdzf67PfW5HT1BQQHsdYCAxwgxBWmCD3OYBXA5y+FycihruzIepxm8ATP/Tx73Y+BYG1nJ/5fYOpIOCylq1oMpRnUFWtcr9VZlPeiJIwQxx+yI9ufWizjekhphJGZ4um0VEkbxqgszviQy50rPykdc4j1LHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqIhWessIqiV4bSVhiWfOIhGb0Ix9x50KW+mML2XhtY=;
 b=gxLZWto84fpn2UlQaNG9BsGIm2Q2EYtxVmUL4tobBu+I74DRq7OW/BujJpXfCKIDJsJG0ZJBHLxosYgPFPlA88az7OmRJWWROkESH1lAGCmF5MWZnIo0OXxoobAOb0OTrlyamCsSWnA6n7uYclBlLAb8qY5i7WCtDeLsYjmNQYk=
Received: from MN0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:52c::26)
 by PH7PR10MB6201.namprd10.prod.outlook.com (2603:10b6:510:1f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 17:32:22 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::f1) by MN0PR05CA0019.outlook.office365.com
 (2603:10b6:208:52c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Mon,
 16 Feb 2026 17:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 17:32:21 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Feb
 2026 11:32:21 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Feb
 2026 11:32:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Feb 2026 11:32:21 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61GHWKwe2084233;
	Mon, 16 Feb 2026 11:32:20 -0600
Message-ID: <67b83eee-aeb9-4727-94bb-fe0015684675@ti.com>
Date: Mon, 16 Feb 2026 11:32:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
To: Denys Dmytriyenko <denis@denix.org>
CC: Vitor Soares <ivitro@gmail.com>, <meta-ti@lists.yoctoproject.org>,
	<reatmon@ti.com>, <denys@konsulko.com>, <vitor.soares@toradex.com>,
	<francesco.dolcini@toradex.com>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
 <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
 <bb0eb4c0bf8543175b3aa50f0d954aafce56d576.camel@gmail.com>
 <8a5487a0-824a-4f39-aa50-cf6466764574@ti.com>
 <20260214162932.GN11121@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260214162932.GN11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH7PR10MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c632a3-bc53-46e0-891e-08de6d81576d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8uEW12FDOtAmHHydTAR4ercJgtpEhd6BFbY4e6kEmiOwUPvo2i3+90LFzEss?=
 =?us-ascii?Q?TUOkYMhVFaEnD5wVmsPMiK3D3zpK9hdsgSUG1gKUVQdRhQ5rp9U7E5nelIWo?=
 =?us-ascii?Q?RbhBhdBehLK1lN5V3ptGY7pjXRLIkPO+c/D8h6U482nHDKCruFuHyEI7nhRo?=
 =?us-ascii?Q?ycLgEoH9c3LQgmj4t1WAK6n92Rp0CyflPgXiohP+R01dGLn4Qyr0wU05Mee7?=
 =?us-ascii?Q?QmrSoQUKMB1u9Oybxk/Kd/SGeo52KVqOPuqqFJ0fyPWSJVA9VEUSQAONtabf?=
 =?us-ascii?Q?NVEJo90TxokhgyX8UOLoYZ/CgrZhLi4YvZFnI5J4Guu3p1Q4s+Ftndrljfr/?=
 =?us-ascii?Q?RLKVR8dg2QjWqH3xsnPMs/I2Hk+0MWwhT46gRQWof7surDDNKWsRxDUBo3Mr?=
 =?us-ascii?Q?GdAM9gyhLebDN4S3aLqVrNhWduY0wUGpL9Roc0Lmh2jykG+hDR6iVt0xKd81?=
 =?us-ascii?Q?yxNCFm0cnT36StGJk0CRVgOoofjLTmqqux7AumLNl3YOzRMuTFV9yjDOeZW7?=
 =?us-ascii?Q?f19L4mHC2e0s06l+GX5vEYNAwt8hwhwqCob8fxXvfAovWWZRl8Bizpvjc6l6?=
 =?us-ascii?Q?5sPrBNaiOtV3vOKBBpFMHV4okXgxrOfBzkJnJ8JtbZUsRUSnitDDakxdGntL?=
 =?us-ascii?Q?ZoLiX27zrh+8wgp57d+bpK5eXi4lPl4QGWbNjE4IM2ejcng9edFDDSw2HPXB?=
 =?us-ascii?Q?IFmqD4mREffwe+s1PySQAHn4M8yiysLAJHN81qD0Z0/ozILdtMVPYIQ9x0IT?=
 =?us-ascii?Q?zsGFGxB2pfqOAGGnnNYnIk05x5qsc8gtH/Hj/RQTUkQwz8UeZ0kFRNoMZA/F?=
 =?us-ascii?Q?63aW/ygwPc7NCIX/7ZqdIYpSf5UEizK0RJr1YANTKZ9uiwHTAi/Sjjc91iOJ?=
 =?us-ascii?Q?cslnOx22QZM0JLhonmme2MajH4shS+zZvj4oDQTODKMINKiE2qrfXsRfD+Fz?=
 =?us-ascii?Q?59qz4X13K+WInSLNQl4gGTdsctwZSyc5s3JEIGauD1fLCnvBINuBGfaGERvU?=
 =?us-ascii?Q?JTU2WLVM45mX5Zco3nFX+ScynFzBzk0b8hfivIPq2NUG38BCgsFdH2T78/VL?=
 =?us-ascii?Q?jT1/OwvKVFsPjHcigrgIZjAGKwXGWC2aSoi3x/zQbQot00zKEBKSal/afYj/?=
 =?us-ascii?Q?jnVB/AdeG1LdwVtdvLpksltTAHRnTvjjSWQVZ07SDoZETS2oSLOYMr72v3tQ?=
 =?us-ascii?Q?sb0QTmLPRN/UZe2xdptsXexcoIzNbAEqofdkfvwvEdVh+O/xTGSPwgQA5f/i?=
 =?us-ascii?Q?uc1m0NjuK9K6TdmxffDH2PMYwdDQ2+9hImfel0BiWy0FJrt49skysPOj+J04?=
 =?us-ascii?Q?aStL9Pa6jmCYh+nr5XUTjFTI1EpuW/EGpZd78v7U2Bdc2sE7nlMGjD5LKM9x?=
 =?us-ascii?Q?zzXCY6ftTuXnT2Met3RbSZ3Y4wkh0p69OPDKPChfP+Z1l+B+mvr43bGBe9Xt?=
 =?us-ascii?Q?UXE+aGr2170+KSPZ35NK5u60wL9vaiW+3sUbWfFwbLUcbO3Tjt4N9oQM3FU1?=
 =?us-ascii?Q?O3B807+kyYUUJZt3NSrQrszPEDrU6iJhCrLyQ16XPFRVpJzgXksIOqsS8oYI?=
 =?us-ascii?Q?k9yUvW8sw7O2Fl5N3YGckFEVmPLyOz9FXc+T4utIwkm3QeIRkgybMIoegKSj?=
 =?us-ascii?Q?rg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MTUcQqBqiqNoeleWWyVa1JRwiRm+0q7+KDNev+xvLRHmuObUDVrjqi7eE0efdgqoSoAlXJJ6aFVYR2vkvBvmbOCkF3TbzMZoYkCQxXfrQUn9K6UlRsKxjHfGB+1jRy4eFOLqZBUSsHgnehABykfwceAS05kw3bzAFnp8jfQeOz35FqdQZwxRpXswLC73QpeRrI1mBCfa633hv0yTAK1dS9E1489K5T3nbykUaQIqBhzpOWvix385hlB8/s1qeQs2URPJRxhgbqo9ga+k+mj7RpYFCH0PjgoGzq22VPPUoghr+G5w0pAWSG649nuplGZbGVncb8An07+1kWHk4l1rOOaM9N10F9DjjOwP4CzJyIZWvVke7HaAnH1OGAXJCIhJvjhiJcyjdOhH8oq4jT+EOOL1GO9p8aWijNX8fQ5jaeLL2c36RyjbkeTILMMEIsvC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 17:32:21.6948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c632a3-bc53-46e0-891e-08de6d81576d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6201
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Feb 2026 17:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19517

On 2/14/26 10:29 AM, Denys Dmytriyenko wrote:
> On Thu, Feb 12, 2026 at 04:03:34PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
>> On 2/12/26 5:42 AM, Vitor Soares wrote:
>>> On Wed, 2026-02-11 at 18:52 -0600, Andrew Davis wrote:
>>>> On 2/11/26 11:15 AM, Vitor Soares via lists.yoctoproject.org wrote:
>>>>> Hi,
>>>>> While working on our Toradex Aquila AM69 SoM support, we noticed that=
 k3.inc
>>>>> defines:
>>>>> SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>>>>>
>>>>> This caused systemd to enable serial-getty@ttyS0.service=C2=A0on our =
board, where
>>>>> ttyS0 maps to main_uart4 - a user-facing UART, not a debug/console UA=
RT. The
>>>>> getty continuously outputs a login prompt, interfering with the inter=
face.
>>>>>
>>>>> This made us question whether SERIAL_CONSOLES belongs in SoC-level in=
clude
>>>>> files
>>>>> at all. Our understanding is that the console getty is already handle=
d
>>>>> automatically by systemd-getty-generator from the console=3D kernel c=
ommand
>>>>> line argument, which makes SERIAL_CONSOLES potentially redundant for =
the
>>>>> console
>>>>> UART. Any additional UARTs beyond the console are board-specific and
>>>>> arguably
>>>>> belong in each machine config rather than a shared SoC include.
>>>>>
>>>>> We are not 100% certain about this reasoning and would love to hear t=
he
>>>>> rationale behind the current approach. Are we missing something? Woul=
d it
>>>>> make
>>>>> sense to either remove SERIAL_CONSOLES from the SoC includes or at mi=
nimum
>>>>> use
>>>>>  =C2=A0 a weak assignment (?=3D) to allow boards to override cleanly?
>>>>
>>>> We simply noticed almost all our EVM boards used the same console UART=
s and so
>>>> refactored the definition into a more common place. But yes you are co=
rrect
>>>> that a file like k3.inc seems like it should contain only items common=
 to all
>>>> users of the K3 SoC family, and not simply common to TI EVM boards. Ch=
anging
>>>> the assignment in k3.inc to a weak one seem reasonable (although I thi=
nk you
>>>> can still just override regular assignments after you include k3.conf =
in
>>>> your board conf)
>>>>
>>>
>>>
>>> You're right we can override it in our board configs, but I wanted to s=
hare why
>>> we think this is worth reconsidering.
>>>
>>> The issue is that SERIAL_CONSOLES in k3.inc mixes SoC capabilities with=
 board-
>>> specific UART usage.
>>>
>>> The K3 SoC provides the UART peripherals, but doesn't determine which o=
nes are
>>> used for console, user interfaces, or other purposes - that's decided a=
t the
>>> board level.
>>>
>>> Different boards use UARTs differently. On TI EVMs, ttyS2 or ttyS0 migh=
t be the
>>> debug console. On our Aquila AM69, ttyS2 is the console but ttyS0 is a =
user-
>>> facing UART. Same SoC, different UART assignments.
>>>
>>> SERIAL_CONSOLES creates getty login prompts on listed UARTs, which is a
>>> board/system integration concern.
>>>
>>
>> I think the same could be said about `IMAGE_FSTYPES` which is also in `k=
3.inc`
>> but really should depend on the type of media on a board.
>>
>>> If TI's EVM boards share the same UART configuration, would it make sen=
se to
>>> have a ti-evm-common.inc instead of putting it in the SoC include?
>>>
>>> Happy to help with refactoring if you think this direction makes sense.
>>>
>>
>> This directions makes sense to me, I'd have no issue with a ti-evm-commo=
n.inc.
>=20
> This seems like an overkill for a single variable that can be easily reso=
lved
> with a weak assignment. Moreover, this can quickly get out of hand with S=
Ks
> and Beagles and how those sometimes have convoluted mixed ownership...
>=20
>=20
>> Or even since it is just 1 or 2 lines that would need to be moved out, m=
ight
>> be easier to just move those lines back out to the different board confi=
gs.
>> If you want to send the patch then up to you.
>=20
> Isn't it how it used to be originally?

Yes, I'm basically saying I'm okay with reverting my patch[0] that consolid=
ated
these[0].

>=20
> The idea of a generic setting getting weakly assigned with a sane default
> is specifically to make it easy for downstream layers to change, while ke=
ep
> things maintainable upstream.
>=20
> We've been slowly trying to unify, cleanup and consolidate such settings =
in
> the past. To that extent, I keep reminding Ryan and others to avoid using
> :append override, which is hard to undo downstream, as well as use weak +=
=3D
> instead of =3D for assigning SoC and machine settings.
>=20

The patch that moved these to k3.inc used =3D, it should have used +=3D, so
changing that to +=3D is also an option if we don't want to revert [0].

Andrew

[0] https://git.yoctoproject.org/meta-ti/commit/?id=3Dbc894bf52eaa4359eaa64=
a64e950accd099a81cb

> We've seen instances where a sane generic default works for most of the c=
ases,
> but for a couple of cases need to be changed in more specific location. T=
hat's
> why we have hierarchical include structure from most generic to most spec=
ific:
>=20
> ti-soc.inc -> k3.inc -> j784s4.inc -> j784s4-evm.conf
>=20
> On the other hand, specifying U-boot defconfig (UBOOT_MACHINE/UBOOT_CONFI=
G) is
> almost always done in corresponding specific machine configs, simply beca=
sue
> there's no generic default...
>=20


