Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CD4F5543B
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:23:18 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37276.1771986197457809115
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=P2y6oxP9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.45, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+2ZW5E0/eBpoSvatHf01VPkEg5lAZ90Jd6J8jkKF7RLqgA2dozf4Z82OA6xoXmpeJQSQkbFfpYi919SIXryey1ONrH+0wregGYZ7IIqggDonbdqCYLI4l0FFpUV+n/FV03Y7PyFudcDT48AzDfNMMyMxRJhRp4UQXxinq/tLbaoF0xO7uGsymxykJzIxaKFSFjvjyayGe4pPjiS7owXL154AloBjyWFdjnu2/2DFB2i2yK3knv4MvDgqDCYP6vpVUeYNRbpI+zn4fl6XDxHIBYftxGnhuwW9kFA/nhrjGCPqxKyeqo/rAXxPP0xpoNb5CfuJOrRNS4sAnRLY/zyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2TKl2VBcjog0+AW1kyl4sfH2Y0cn4zf/Bt7NONh9gE=;
 b=Lgy8CkVJwlQkCZCiA2MmrFs2K0U3OSS0fiEpi0L64K6BVDylvrHz8l4V6BGBJw9aof14auzjYPpSPXlOWvgjayfGSey1veUXuvu4nwAFAyMdggttf6cs+5mO0jtOuw/xSIyh8TD/cCUciMXPM0Smxu9dvcWyJhw8XJ5AyJ8lc+5ITlFa0ZueqkG47dYfExb9P9eSsIEIwEzges0I+UEfaMwkWypIyI+O1oSDZYHgPGNxJ8PDe8KZQ2v1ICSkyobW6LlQqH+kfgds5p+bDkcYQVo0BDd/EDd7WOZASEIpGqsUtR7BLmwhHalFdjgWn9DerPEYJV8G6TkoNGWOm0ZfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2TKl2VBcjog0+AW1kyl4sfH2Y0cn4zf/Bt7NONh9gE=;
 b=P2y6oxP9tMYU7jtEZa0lVEXoZhLomauxDACpVEGB5wjo8XJaknPEp1+hoUATzlnvGA0jlWwBUCCC0WmieMzQOEHcDOSh/luI244p9KsLVeyGsEfWcbt69m3w895E2b6vkFbFhqnXAieYOHeJcslKrEXuFyiBoYLtgmN4+GYbkDw=
Received: from PH7PR17CA0036.namprd17.prod.outlook.com (2603:10b6:510:323::20)
 by PH0PR10MB997667.namprd10.prod.outlook.com (2603:10b6:510:382::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:23:15 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::cb) by PH7PR17CA0036.outlook.office365.com
 (2603:10b6:510:323::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 02:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:23:15 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:23:13 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:23:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:23:01 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2N12f3802778;
	Tue, 24 Feb 2026 20:23:01 -0600
Message-ID: <e6b4801c-d953-4788-b0bd-9420835ab134@ti.com>
Date: Tue, 24 Feb 2026 20:23:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-rpmsg-char: Set DISABLE_STATIC = ""
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18975113A70B0526.558139@lists.yoctoproject.org>
 <189759AF203207A9.1454197@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <189759AF203207A9.1454197@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|PH0PR10MB997667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b20fefb-4e65-4e77-3f09-08de7414d512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34070700014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AuwLOuPw0RS+vv2XgfdtmLtDCqllXBvwZWkxHcmx0efg9uTFPaKTcITPARql?=
 =?us-ascii?Q?KnCNtuCFr585kdMsNDllto4cAE74HWig0tzHPycwN5RS/oobCjdIn1dzTYd8?=
 =?us-ascii?Q?Z/+yDJUIddP13JQ9i2uv309FwVKVrw41qT07k570ODvxcwG2BYp+BGfovnFx?=
 =?us-ascii?Q?KhHrXo11+3bCeUcLxpMrBWXuSDFKm1aU1FjeGPfYU70uMPMxRQ5pcYPBMbC4?=
 =?us-ascii?Q?X3ne3Rw3SclYhouzYiP2ZQoviVP01njKdEYuFcJ+xKw1zbpgD85Cr8ElPWid?=
 =?us-ascii?Q?FIimxBCsSdrQ20NNpHK3lKgXxjumdro8OJS7CbZab/hnJDhsGOjGyVdUqrSy?=
 =?us-ascii?Q?/1VdeOlfIVWdWcRm8R5ynKrh4k2znQcFLpZY+oszxbn2tnaWLjvjKe/H+KSk?=
 =?us-ascii?Q?8H9phlmtviDz6vbKudUVrsMsuiLXQPhkYwrRcG3Qi3kQy4Ezw2vGUEh8TvPB?=
 =?us-ascii?Q?TCkB9c5/ae5oqdkJfdUvMoQqf78sKOEJBbJzcIuDykjTfDFxikuinaGjccOa?=
 =?us-ascii?Q?8lPn1WUQjJa+rfdjmax5vqPb0G4/nrc7fRkGkp4+g2edLTQU5cAmaPxQ76CF?=
 =?us-ascii?Q?W206np5u5yPkQQJfV9hJw6SM51d5mjPRfow/Z5aq73q4G4rakq/hpgjkADeW?=
 =?us-ascii?Q?QQvSfNH3ykX89gIJELPJ3lCx5DO2rpDMxkqLpJwaiJFIzKe2zrWZQ6Fgrpaw?=
 =?us-ascii?Q?grkFExpdxgTf2vlabvrZya5Hg/MG89WTpSOKZVZ2LTePXxmkIJ5Ot3qDqXd3?=
 =?us-ascii?Q?fV07vNIJfq8+/QZxF0ShY+4zjW8VWambTOympjC1y4FIatny3V8Q7BOGB8NX?=
 =?us-ascii?Q?11FXxBPjmVD4Di4TlN9IoZivlZblgOa5HwJKm3WckfSdKgtQAOX/fSWmQ8fD?=
 =?us-ascii?Q?5MzMXvphdWVscUq/PKwP5Gf0I10FVsGV9D5P46m88/LECbIZgXCR/TQ7U3dl?=
 =?us-ascii?Q?V+NLw3F9fPE7EXNQVrQxc8moCxq5jl37lbxvQ12s7TyO7ASXETG9uUDnECPJ?=
 =?us-ascii?Q?DV4HAfjQkGgzykBeL8iQ/N/fY7yUhTKMROS8t/zNUIuLZxVBGz3DjRIvblME?=
 =?us-ascii?Q?b4qRF6611MyVlPZzKEZirziGk9b+e5hrjX8NWKQP7LbzFlePEjRS3qQdxM2q?=
 =?us-ascii?Q?YtD0BsVokj0fuG9Zk41ELlMR7eCRc+bJN2ZArWSxdX4wXvlSk1SUOfkGBHPD?=
 =?us-ascii?Q?DTak6xmr6Yt5CmYdBCOVaYrlef9+7pXHSMkTeE8I4l3eooPMNd9acnBEby5k?=
 =?us-ascii?Q?wsNyfr3m20oQu5+stv3fGcM50vCSogdB+2LWDXf+bFuuPs45Yw0K1QftLSSy?=
 =?us-ascii?Q?VIl7fUX//mVFpAlVWtlVZKNEYCkh1RjabX6/SygQOC7p4HO+2UBovxmXfIX+?=
 =?us-ascii?Q?XSx8SoAjvyx9sQFFSV1TXMcA7bcGqfVvaAJ1iAbvTPXBXVD5rtcqeR2jV+/X?=
 =?us-ascii?Q?IVSnyMUOY4D95wvg+RmU1NXHVXIm1aFcMYQX/EHTYo9ffy30OJYmMSycPD35?=
 =?us-ascii?Q?1uGcYg0vvtideXA957cfv4lVsARzz9sCciYZj/dAcL1NaZJJDaAvJwJMncgi?=
 =?us-ascii?Q?8pmocaQY6G3rI/zRQgfmNSf+a2+2J+f1RZTxU4+N4IP6/Xk4A3VV+WKrMr9z?=
 =?us-ascii?Q?/giTK4UGvnuKGK2iNqabMktKj1lJ+/RrP7Ut77/8ck9RkvdYarEIK7AHAM+U?=
 =?us-ascii?Q?/QNlSw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34070700014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gv4bLRSipWInKjSAgdpOnIWtQQ5kGReXetOBZYzQVYvaLEv0D6h4J9Fk876eTFvwABZmEUv95s+557CR3KUUJHz4IzHiNGz0VOpmClfgUsyaFSbE4ndfIMeRIZYfTgbliDyRrtxTQebg60pgcenFaKz/J+Zo2AA0+kSTaqIN4d5wcnoiqPE7/ZlkVV8IsojGG3DN8Lr3l3nvwGj75D3+YTqpVAD7NXc4vjEzJr1S/AMQcIXgHm4p6NKeby+l3dpQ84A+2o1OgsT6g8FKZDOag4CbiDDUI32fMpMxP3xVFFNevbwqKezcrSDOPDzFk6X9FrJUBdaHpv9HGlaRoFu3yaWqNyxfHfx7E+1TxBzfMsgECPEJ1uHmT3smvy+Q8CedKGAfATyikrMESHniDlIrS1GzQAa8lStkj+kLUqhxUSZgG/tel00qni3Q/GeAZSiy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:23:15.5182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b20fefb-4e65-4e77-3f09-08de7414d512
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997667
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:23:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19595


Well... as I look around, this might be ok to be in meta-ti.  There are=20
other examples of recipes doing this in meta-openembedded and oe-core.


On 2/24/2026 7:39 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> I'm moving this over to a distro setting in Arago and not here.
>=20
>=20
> On 2/24/2026 5:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> As of [1], static libs are disabled by default.=C2=A0 But this package r=
elies
>> on static libs, so we need to allow for building them.
>>
>> [1]=20
>> https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9e=
a3fa9f33553e6020cbc067b24291
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc=20
>> b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
>> index f9fb0f25..f8b9adcf 100644
>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
>> @@ -13,3 +13,5 @@ SRCREV =3D "dd4783422bf4fbed1015bfaa51054e40057b4f04"
>> =C2=A0 PV =3D "0.6.11+git"
>> =C2=A0 COMPATIBLE_MACHINE =3D "^(k3)$"
>> +
>> +DISABLE_STATIC =3D ""
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19594): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19594
> Mute This Topic: https://lists.yoctoproject.org/mt/117985797/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

