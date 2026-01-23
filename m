Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFDED7789F
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:57:39 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1452.1769191054871668235
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 09:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aS/rcO9z;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.23, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6GolEFZwrvCrSenYxy5/cLvblAK1rLeWA+eQfRW8bes149H44SJhNwkycm/fzn/ZkQ/bYqKL30NdppYdJmMOoZGUu585zCzHEd483uCskoPrfjZsAJktnb+CjWLb5Y55KP4nhRIZlij6ON8ayUzSxFDd/5/SrWz7CooDKC8OYi7e6BDO367xEDlX8atN4tCj+ZJWb75PQRnEr7sbFRJpPlhwdLlh3y2N7e1c6IFuvv6ytCkIWMqZGKTYInbm3PO1Hm1x2wHAQzwAhWMGu+GngOC5V1CJVDZ0UZYhjtGpvZei7J0beN9LgeiX/y2Pbt7n4qhLC/GpsGg/K39iS1MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiF1kTHMvc97AbXhsVzn+BMQHKaxviN2YIvAUb54waQ=;
 b=tImf28qPiN7M2dhXozfg35m43UZDg6H8Y1svxQyULk+5fw/sU029zgfHjCw5MKToHAW1F0/+5/C4MX8xlDlKcOB5QySuqxbsWYE1IxgCQyv2x/c13bHxBEIjeo+2xqj6t4YR/ewAe16e8s1YvixFyVY/L1LgkM+y/kBSj1g7PAQNM6pJo7jUj4v6iz4Ukm/za5xdcDz+CPOXhXwD7wsi7vtvL6vAWJygq+m4jHT5F1G5KPMb3HlT1q2lShzQBnf0msoiIPbGpKCa0fWJfxVQru0hHKQXc6ZVtKkzE5vmNobkFxu+KbtMjxeyMtj9cTZ8BvTSaQ3pc0vNRTpUEb1qWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiF1kTHMvc97AbXhsVzn+BMQHKaxviN2YIvAUb54waQ=;
 b=aS/rcO9zHu/j25t92JO7Ey5ljt/7cnoh6LluFElKCwXcnkkIy2c5sWw/AFW2Sy6KobquLY6IoKJFvgDFTSYzgW6frVmnK4q1iJwOCNKYHF+R1+FsSQgKoNaUJfIgDWRYFnhY0F1BJQUkiLm+L3j9lwK0TwGYKKph9DOI1CDTXxQ=
Received: from BL1PR13CA0315.namprd13.prod.outlook.com (2603:10b6:208:2c1::20)
 by PH0PR10MB5818.namprd10.prod.outlook.com (2603:10b6:510:140::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 17:57:30 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::5f) by BL1PR13CA0315.outlook.office365.com
 (2603:10b6:208:2c1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 17:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 17:57:29 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 11:57:28 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 11:57:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 11:57:27 -0600
Received: from [10.249.42.85] ([10.249.42.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NHvRWq2580322;
	Fri, 23 Jan 2026 11:57:27 -0600
Message-ID: <d205d346-a6f5-46c1-bc34-7b8f63490575@ti.com>
Date: Fri, 23 Jan 2026 11:57:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-gc320-driver: Port module for kernel
 6.18
To: Denys Dmytriyenko <denis@denix.org>, <a-christidis@ti.com>
CC: <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260122193522.302216-1-a-christidis@ti.com>
 <20260123051535.GB11121@denix.org>
 <188D670E18EED5D0.3711463@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <188D670E18EED5D0.3711463@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|PH0PR10MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: a54162c9-ed4d-42f8-bd3f-08de5aa8e057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|4022899009|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M2lNSKsPAtKqyp3cna0itBaF4VYs/a0y7nAP769M/bKNGu5TdJO9mHacGxPO?=
 =?us-ascii?Q?iuV4FzvnOJXlU9v0hB8HQLTyjV98sue1JTdflz6aAxpYGTT+3+Oxd+3mP9Rr?=
 =?us-ascii?Q?orM//2RYiEgEeSt55FKfBdPBzsU4/Qvr0QVax97qyGzudUoED8CtTa7b9uZ+?=
 =?us-ascii?Q?bmn1Kf2hTmd0Z/uVSOUXOy/xYpK6o99+jiyUhpdkghU+aA5bFHW9mWt9cDIl?=
 =?us-ascii?Q?QPbepjrJOSbXv0pKA4z/CHqldv9Kxgaf4udGVnzp+zlcaZMsFxZvmpOByh/q?=
 =?us-ascii?Q?IvRq2A+mOPm4nXjXGSgfTA2uJwbSSVY46RRvyYB1RFwHNT3RMu8P0HALRWEt?=
 =?us-ascii?Q?f9+7hu1oGnU3Ce+iZf3fhPq9vrOntb0WdjfwuWhlUIK+d+3QV+m/mO269ThV?=
 =?us-ascii?Q?3hSKex0z0MzNLIVWw/rehB0JTvFj5ZxonVsSRd6YGG79I3GRD6879lXipPEv?=
 =?us-ascii?Q?Vd/mZlgV6ysEB8bGNo4gt3OhZC69kaivOnzf8w8g3TCYE+dMt/C1R3RwXM71?=
 =?us-ascii?Q?xjyPpFTvU64yNHGble+3iglC6NYJDM8H40xbziz60ZU2w8yF7Vk8qMiK1aqD?=
 =?us-ascii?Q?9xaIp6snAY0wQ06p5d5q8SlvRUFxUoe64iJ0xM3x5soHYHgGurJnp+1m9oBs?=
 =?us-ascii?Q?v2m28qcYS6RbjzEx0MAOMGFsoFJQmr4Le+77OyagRoBVaHLR2z7sjgcF8ko+?=
 =?us-ascii?Q?PG5MUXBkcucmR8OPb6l4Mit+LRVahs/6ZQe45LSZvgkWtZIFCu1ViwbbDixR?=
 =?us-ascii?Q?cSZd2p9pV647kQ6H02APuu0Z0Rpw9fO4MOLL8cHNpSv6vrZyoDkky/nFdiGw?=
 =?us-ascii?Q?jgfUcfGsntiiwLJ3ZM1qllrW5VJkZppHa0nSwFX6GSd8xmE45iaAIz1/zEna?=
 =?us-ascii?Q?xVKXm6FHsnkni7GPnO6MXtPvxaqKQbYVBeDw1vuPJmVgkDdlGyMX+Ir8KTjf?=
 =?us-ascii?Q?innzDirK3V0y+M5A32NlgZON187o/vJ6yqrmCz612BsnoU8Up5H2nUi6RUOy?=
 =?us-ascii?Q?pPzkUmgZCJ9peuu2Ewj22VdcEsxcW3AZyYM0U4xK3T79Mn8V+1JstOFpht+0?=
 =?us-ascii?Q?ozVZV9x5JaKxfAmBnABSYQ+Nf/rBJCHeSkUXdqaCVMFgXbL24MWZhm9C4Iek?=
 =?us-ascii?Q?trW5Ly+K9awoZxkNIgf3U58E6VZ9ZFhivkqONQD6Bw5wVbbZoAF391NElHB0?=
 =?us-ascii?Q?VCRTuwodIDVRwpo2KPYgas3wKcGoobUnfkwA+O0rWN/irXtaiinCDEnkunSs?=
 =?us-ascii?Q?3Q7m76MtrsWJkbwVKwz7Bb8D/z15vQ2r/T9htcVrlVENdAV5l5KbL/2oo6O+?=
 =?us-ascii?Q?hk3sbZNxJv2DGPEkdnoAiCsihXovViDZSHzxzd2Pm2l5KtULtJDiOckC6aJ0?=
 =?us-ascii?Q?6ZH1vAOw5XNe46zWYU7HT0rUZIA3aC5UGNAMgtZkQqGukmi0uB1rUI70J4OC?=
 =?us-ascii?Q?Jout3E00ElG7ak7rHu4gxHW/BOUzCXbz/bSRyq/21hjpyngxX/xvcybegmCn?=
 =?us-ascii?Q?1g1zeu2iFvUD+JOZR9Y4HcuJqzFaImZxBBjw2US+HD0PKF0dQstTZnpKlkfN?=
 =?us-ascii?Q?KOqSmVp0ePdoDVm/PpBoyxai1ILV1q6rHYp6nk28HxN/f68qiHE/U0V5eKFh?=
 =?us-ascii?Q?Lg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(4022899009)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:57:29.6872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54162c9-ed4d-42f8-bd3f-08de5aa8e057
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5818
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Jan 2026 17:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19442



On 1/23/2026 9:52 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 1/22/2026 11:15 PM, Denys Dmytriyenko wrote:
>> On Thu, Jan 22, 2026 at 01:35:22PM -0600, Antonios Christidis via=20
>> lists.yoctoproject.org wrote:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> Port the kernel module for gc320 driver to build on linux kernel 6.18.
>>
>> Does it work with other older kernel versions? E.g. 6.12 is still the=20
>> default
>> even in master.
>=20
> It looks like it should.=C2=A0 I just glanced at the code changes and mos=
t of=20
> them are backwards compatible.=C2=A0 The only one that is questionable is=
 the=20
> KBuild patch.=C2=A0 I'll do a test build and see.
>=20

It builds fine.  So it should be backwards compatible.

>>
>>> The overall version of the driver remains the same.
>>>
>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> ---
>>> =C2=A0 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb=C2=A0=
=C2=A0=C2=A0 | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb=20
>>> b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>>> index 3acdd130..336f4ce4 100644
>>> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.b=
b
>>> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.b=
b
>>> @@ -8,9 +8,9 @@ inherit module features_check
>>> =C2=A0 REQUIRED_MACHINE_FEATURES =3D "gc320"
>>> =C2=A0 # Need to branch out with ${PV} var
>>> -BRANCH =3D "ti-${PV}-k6.12"
>>> +BRANCH =3D "ti-${PV}-k6.18"
>>> -SRCREV =3D "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
>>> +SRCREV =3D "a7e9a51e89c97fbea974c7d674aa0a95d7c96403"
>>> =C2=A0 SRC_URI =3D=20
>>> "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
>>> --=20
>>> 2.34.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19441): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19441
> Mute This Topic: https://lists.yoctoproject.org/mt/117406593/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

