Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACA6CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:32:24 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.13])
 by mx.groups.io with SMTP id smtpd.web01.398.1761708741155893745
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 20:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ahZp79Ig;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.13, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcHMvMOLFy3lidIwQxGNVIX7r7WqONdfBmlqHwVrr96BTCA7JOrqFp5hF7ez6T3kY9Alu0N8VJD1QUeVoxqpZjIMMfoSAxP58IzOnZmKaVuvl46sHHa7Cy0x4L6Qa8i4/8ZJmkepwvjLhxIqq7E92H94PgTGS7zzYZozc7cIHFVzlKr9TuuZTINEV/TBHqm2maljO0m//oiNpgn8OYfdFzAOnKsct8wSMAzbSeglc1WCkLt+LE2KPRa5UxVGhiXuqaIoUjef8KaJf3aIz+emqV8U6sbQxymcDdYBZPifzWSMIbrxxQ5kBoWrF97LhI5pjR3VB2nYkSqUSQac5wlqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+OTNzmkZmvh9fDas6yOhURTphS50KGGEWwiZcLkfXM=;
 b=O7SgO5gHdwTb9+tpA/ETcU2lPXrpKT1Wjr1hlLjqvIX+D05fQkO6pPqCZtatTfctnD13A0FaiDXxp4gLj0hiBhBlDRya8nDsIMwysy/zyd3IcYuPtj3fwC0/AQF2CZJw/q8OegTqyeRVbIVMuvVL6fKZlLt7K1+XItZTdhEQ7Js+N0efzaF/ox739aHMcwiWGXT6Gwq1mWQBd8A79/OuciEfW87Y9EFCGKx2MaMN/xQ3bZvgtKpqnixgHJkYLUnThW3wlJFXVxc0KGRDASUWRZxz+PkR+ieJzyX3zNnIf7/PA4FRck3/fbwNjE5X3X/CCYppb1JvOyrtbAndNGeAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+OTNzmkZmvh9fDas6yOhURTphS50KGGEWwiZcLkfXM=;
 b=ahZp79Ige9CecAWP4rjiqnwrZi5M11ojcg1ayktUzlNc30FKlHLieV5XbAWQPCyHwj6FElUcStfARnmbb+Rbftl82II3J2eLWatSPIWow9Pr5oZYPI9lGdMSARjGWd8pLU6WnaQIgogkzBesGggskWC/VTHchJy3Y+3kSbJEoLw=
Received: from SN7PR04CA0177.namprd04.prod.outlook.com (2603:10b6:806:125::32)
 by CO1PR10MB4450.namprd10.prod.outlook.com (2603:10b6:303:93::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 03:32:18 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::19) by SN7PR04CA0177.outlook.office365.com
 (2603:10b6:806:125::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 03:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 03:32:16 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:32:04 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:32:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 22:32:03 -0500
Received: from [10.24.69.90] (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T3W2uQ3362969;
	Tue, 28 Oct 2025 22:32:02 -0500
Message-ID: <5d8c90cf-3aca-472c-b928-6b25ebce199b@ti.com>
Date: Wed, 29 Oct 2025 09:02:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev &
 license
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20251027040535.3340080-1-v-singh1@ti.com>
 <03baf840-71b6-4260-ad63-7f3f3d781c74@ti.com>
 <20251027212011.GC3125@denix.org>
Content-Language: en-US
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <20251027212011.GC3125@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|CO1PR10MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c919b34-9bb1-4299-0dab-08de169bc201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ASpGRmEYUKuAVm2TcVJd1Cd9nasuAXfwt36NtDb7ARAq5WhaBP2E9z5LaDrj?=
 =?us-ascii?Q?Gl6oHjUPLmc2KrhnT/Y2V7+dLW3Qwk7c/CyOJWB2/88lq+LM3HgYtH8x4/BV?=
 =?us-ascii?Q?naRad7nccoXP7oNSAy6kpwM0hHWnTL6ctgMq4m3EyWtMCaiswa//GkzP/eF3?=
 =?us-ascii?Q?kDaoCo/YsDdcQcCzCas9zJkyaWXtlPT7UzEPIn7sQvi4YunfcRpjPI4lbBAX?=
 =?us-ascii?Q?+RSts/d0r4UGUx8MSkU+jTdAIER45ZU2desvIUteughN3JLGTT3xffp/KQis?=
 =?us-ascii?Q?7ggmRTmdQGxN2P72I0Mx158WhGdf4Ro88CqG67kYlxxXt+ufPftKbrBHoVbJ?=
 =?us-ascii?Q?vTJ6cEVaOwBRW1p6WZSqz98Gm42wQOSQlfswqwU8NpOawtxLSBfRQbpIVi6z?=
 =?us-ascii?Q?a5NPsqLjXgSYXOaHChPas6HuycU/9UPfguWuM6D3hf7CdVPwKceDHqBM5uGW?=
 =?us-ascii?Q?Zbkljm7Jk2tk7uhs4VPG/Fno5PsogGWISOIo4H9MVnEnn0SZ6VKf4h0DHY23?=
 =?us-ascii?Q?QJKcgo8M+dUMYDAeO8NKpj8sG/A8KGSs+3hkMzpE+kMmGHiLfSIOk1urhvXL?=
 =?us-ascii?Q?aohYv91iWoj89XqPRSkxPCMyu5qIWVQjqrI+jJ2U3W6rnvv/DkqgjcA3eHcH?=
 =?us-ascii?Q?VAPDLUW07/uaFNWYztLG+PwzwvFDj+63KKKBd9fiv1gTbPwDVXs9WTLKtiSm?=
 =?us-ascii?Q?qPRp1McEtwXjfmxZ1bKbEt46Ztm3oFW4sDx56LDN+dj+7ost9YI3IS65b92S?=
 =?us-ascii?Q?BWE4nfzFWMUsw8miOhzJ8ATvvdbOXGOYbMdjg0jYP/4f2H0d1a8GIURiMxap?=
 =?us-ascii?Q?utynTrLxLKw+oWKFHk1L4IVKR3IWwVxrfQRahXLa9meTVHiAni9r7gPs5R8a?=
 =?us-ascii?Q?EV/D7FKUUs18XIrHpJ8raDXevKYS5wds1Zs1x4qTbS6+7HZhGnmeun1hBqtZ?=
 =?us-ascii?Q?l5/C87pd9HOujDWh4dzBwAGUOHzwwe/4/tMEDa+YXWvs3MH30aZ83HwcMrrp?=
 =?us-ascii?Q?uCwgyHOnJoaHxJ7ESSu5unLUSrN3vr7E6642bAdxa/65mrNkis8RIt2Bocsd?=
 =?us-ascii?Q?rv099vkBuTtpbF62sFY/1ccbulolq2J5ndCrtwAVpur849CapIEdQJFsuQJN?=
 =?us-ascii?Q?5+WNnl7Fu/PAbdy3bE9I561IB7U+5WsGDGOKBvJhlbXzj5mve06EGOKJ0I3L?=
 =?us-ascii?Q?W/e9/TY8MMVgsiuf6PYPhX+0c4u0TzHx7zniqq3Dp68Mu+qYBfCmvBP2YahS?=
 =?us-ascii?Q?BTFd8qM6P0ZayMtiRjEsMb3jZx1VQsH1lzWOWyBqFWjXO/0t+dVCLUfYtcf1?=
 =?us-ascii?Q?T1BOqu3HQiO4c2GMwq8Vk+R9BLtY+uKbl9HYWRFH5RwlUEHRFaE4EyNaNptH?=
 =?us-ascii?Q?TZmgtYVx/Pr8DfTQ865mvBLPKIL6Xxk1GC/d6Z/cm/jE6cFQoObAiYd8B7kZ?=
 =?us-ascii?Q?Ypkrdcfp1G2LQhWDphihC21DPkIGsJbVO985CYX9UVRqYm94x00edIQWtKrq?=
 =?us-ascii?Q?IjhnGagYS86o/fncRcZdxe9kaMYwDF/8ygt/oophyeBkdKvBwJxce6f8pZI0?=
 =?us-ascii?Q?g5xKeGNCZ8UVbM1Df+E=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:32:16.3524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c919b34-9bb1-4299-0dab-08de169bc201
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4450
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 03:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19190


On 28/10/25 02:50, Denys Dmytriyenko wrote:
> On Mon, Oct 27, 2025 at 08:03:59AM -0500, Ryan Eatmon wrote:
>> The subject does not state which recipe is being updated.  Please
>> change it to:
>>
>> ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
>>
>> Also you did not include the branches in the subject so PRC only
>> checked against master.  Likely you will need two patches, one for
>> scarthgap and one for master making the same changes in both.
>>
>> Also, when sending v2 and higher you should always include the
>> version history in the patch after the --- to document what each
>> revision was changing.
> Can we also get a little bit more reasoning behind the license change?
MIT license with TI=E2=80=91TFL change was to align with TI release policy =
and=20
product requirements, also SRAS was with TI-TFL license.
> Re-licensing is very rare and usually is something to stay away from,
> especially when changing from a more permissive license to a less
> permissive one.
>
> Also, the commit that changes the licensing updates the README file from
> MIT to BSD-3-Clause, not TI-TFL - so which one is it?
>
> https://github.com/TexasInstruments/rpmsg-dma/commit/47beb4c0a98c1fbbac73=
ef46d69b48b2002c941b
>
> https://github.com/TexasInstruments/rpmsg-dma/blob/scarthgap/README.md#-l=
icense
>
> Please be very specifici when it comes to licensing. Thanks.
README was not updated, will update the README and push new version.
>
>> On 10/26/2025 11:05 PM, vishnu singh wrote:
>>> From: Vishnu Singh <v-singh1@ti.com>
>>>
>>> Update recipe license to TI-TFL, use scarthgap branch
>>> Disable 2dfft and audio offload example build for rpmsg-dma library.
>>>
>>> License-Update: license change to TI-TFL
>>>
>>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>>> ---
>>>   meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-t=
i-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> index b624871d..7600f867 100644
>>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
>>> @@ -1,9 +1,9 @@
>>>   SUMMARY =3D "RPMsg DMA shared library"
>>> -LICENSE =3D "MIT"
>>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa=
02c53"
>>> +LICENSE =3D "TI-TFL"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc=
50ed3"
>>> -SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=
=3Dhttps;branch=3Dmain"
>>> -SRCREV =3D "609fd72f458ba56f80d06810509ef88d010d2c03"
>>> +SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=
=3Dhttps;branch=3Dscarthgap"
>>> +SRCREV =3D "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
>>>   S =3D "${WORKDIR}/git"
>>> @@ -11,6 +11,6 @@ inherit cmake
>>>   DEPENDS =3D "ti-rpmsg-char"
>>> -EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
>>> +EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DO=
FF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
>>>   COMPATIBLE_MACHINE =3D "^(k3)$"

