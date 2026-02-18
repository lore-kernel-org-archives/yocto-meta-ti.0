Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D16E9A049
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:47:30 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.712.1771451247952385687
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 13:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=R2nTBhbf;
 spf=pass (domain: list.ti.com, ip: 40.107.209.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bf+zMgZk9lpKB3Nf19CDKyNto95nutD/Q+bXN7v6F2m7Zix+HfbZJ4XjNVjW7AbU3qerbsjkhHkRWxgl7qeV5Ea18QY5drBt8c9C3r0m17pRA8uatQFvEA0uIqsroONy9AkmPpp+tnAp8jNDGcHETlmWejlrKN74UH8fEYn/Vf6w3aMZwZP2+hhrk7UVYNlRWr1GOMrwQgpym2+ZoUDsWWovxj61Ne1fIZxsZXbyKommk1uLgb9nzaUlyhi/SK30a2VXbAbuEf5zYorcqs2f76k7+W+2lwZWvgDxz2KIy0vay5Qw6tILqLBKJ+dwdNXb90kNQ3KAJ0SHS1cRlAVZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og5lRcJL6hOMXp0Fk+YuVZBqHR/D+kLKV+KFzcZloFA=;
 b=TtVfO76qtxVJE8UPOiru92dGn2EFJBJ/fRup0R8VnbtlfWaoCtXfZAurIU0CYmDFpgC56IRRBrtRFCExwoTYMs2S8Ev5jC2v6/IouniMxA2Rpp588yybVnoWV1IZDa7amMSqyqsua6tYPluI35MKh4Z6krccyenc5bTP4GLyhZR8AUY09v4OPaNjIvwnzDO15GJIt+a77JClnLUVpM0tZ3n/ir5FU6ZPbjpwhkrmcl88pQ5g8AfkWpCCX0SHp+uupqZ5Rpgse/uIIXiMQHaYp8SfyqGt5beNnZJh3gpfP7ZozuRq3DJ1+Fzjtp18obFvwgttMX0HuvqE4tCjxRg+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og5lRcJL6hOMXp0Fk+YuVZBqHR/D+kLKV+KFzcZloFA=;
 b=R2nTBhbfQs7gswyBb5+tEqGMkiTzfXGO7x+h0f0zU8wYARdf7NGssmyEyVikH3ZO158fS/lRFGSX6xr3yCYkC3PE0iJB4xjhmhDwiSMwNW/dOOtX/UqP1aiL4UaYIi8ExtIbfTf+zO9Nk9wiGc/bYA/2NB2w+dEOhH34is30DMr+2k9px0SbBQDVgNKtgbEs+drIVXGNYhENX4VbjiRPov3ccYCifHLkPcT6pEOd31FDM0y57g+PcfpMxI94YR/jB49HqpWMLT3dy+AJNMqoNGfpMZbKATNB8Qhk7I8/uYB0vtKFb2MdyNxOq9fq/ZVJmCWw4yLtoE7PqoLqrXvhiA==
Received: from BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34) by
 CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 21:47:22 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::6f) by BYAPR01CA0057.outlook.office365.com
 (2603:10b6:a03:94::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 21:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 21:47:22 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:47:21 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:47:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 15:47:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ILlLj81523314;
	Wed, 18 Feb 2026 15:47:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8AFE49ACF4; Wed, 18 Feb 2026 15:47:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <rs@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver version 25.2 -> 25.3
Date: Wed, 18 Feb 2026 15:47:21 -0600
Message-ID: <20260218214721.3384488-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260218213904.1344360-1-a-christidis@ti.com>
References: <20260218213904.1344360-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CO6PR10MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: dbce5f9d-ee55-4bd6-20bb-08de6f374c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lptn2eV+NEx25sXGB8o/9efiPcD3ui43E7spyiomuee/hFGr0AqPYYrqSfKR?=
 =?us-ascii?Q?hEYlKbLt7SrdQlFGxD+GFshmfUX24efqGZKu7RNCXO7B4eS4bZr0RioB3JaV?=
 =?us-ascii?Q?irfvm3G7cGO7JVkJaSORRKobuAHXStOtbj4jq1cLLtex22HCfMzanJ32WIdY?=
 =?us-ascii?Q?dBkhnnPGw4UZh1MIyGrUgZ24cajWY6MwuFv15A7JSJ4f2V/2pob9tubsIVV6?=
 =?us-ascii?Q?6KEGR3i0ZEEVMStokRCF4ct3/AXFWGwRN+8k8vvQqS7MZFrlIUmhNaaKE0Sb?=
 =?us-ascii?Q?Gh+9nHrR+a7L5F0VWyKWpAQbdOxJyddLDy3r7alu0C4wJbbjpuUQdkdhUNNy?=
 =?us-ascii?Q?0NJ/yG1G2+c4znS1ykkTpBo4sVSOU3bymhpHpbkXpcU96CEJaMvAVGhHI/Ha?=
 =?us-ascii?Q?gDr9AzlVdK3npDFTsn9TnbFm6zaGfpNKyV/aKR2l2x1Le3QjynvmvYJadAce?=
 =?us-ascii?Q?fLI0G4XVZV3x7gAmD0S2Y5Xtet5wca1q8kpdlBposq1whcG2JQxcSyJCdydi?=
 =?us-ascii?Q?RLv4uUYxMOUqVmr/hNcDfYMYzXJiWwmUKI4XxmfhHLxO5C5jAoCJGb75xREE?=
 =?us-ascii?Q?zVeR1dOuLJUEGxHt/AKCGZr1DhI76bjhocdbXieMTBeOSQD6XF9mBZVgCwGG?=
 =?us-ascii?Q?dCkhv60LtF5wmoiI6T3ZTVOma6mfds3kXOg+agD99eulM2QQzc72dAgObLpw?=
 =?us-ascii?Q?Cx7B51DGmEKRBH4vzmUYFodqdcIphPTmATYgkQ4TRsmL4nk35tCLLILOd7ex?=
 =?us-ascii?Q?kZl2tY+H07q27ZHrk+/flMxSAz60WWQPyluwIcZsHJe10tG73O0pjURPSVvR?=
 =?us-ascii?Q?ryhqIwWIhCv048ew0NznWKCPhjOlnOuX7opOKivjX4LUKDbB5u6P759y3fpz?=
 =?us-ascii?Q?lxhkdfrwwAd9+TemY5XwXiPl5kPfOVch98KS1eGJLtTvAM+fRuVOFGuzus2R?=
 =?us-ascii?Q?4rSKaPAvengXz3YQLBcACGxL8ciJHfzXgRnbORy+xt8eSxIoQwBOMkA2qmU7?=
 =?us-ascii?Q?BjWAal3VmWOf8dlPQW3VIyGuQlnbjOPOAJ1wuqwKyf0UtMkX4oIIsIfZ+PSi?=
 =?us-ascii?Q?0IcJhvlToxEXNP1Hhm4I38QluTCJ6Gyq4MgTciO0p+gEY3/f40Xxer06MUo+?=
 =?us-ascii?Q?6bbRb9s74bCd4i9IT1BqhLczeVWyeJc6V36euqPmtf2FVy13xmwTSLiw6nhn?=
 =?us-ascii?Q?b77CTGy6AJvNMGa7mFqd4LkCneLjghD3Hhx47lkxij96s8QPHq/K3ptT443t?=
 =?us-ascii?Q?3NsSJqT2sGLZLSPOqp5kI4GysgaLGh8MY7ByhZB9AtQhmF/hXZp03SgWixA6?=
 =?us-ascii?Q?vNDuYekhacmRcuNU/xTy2J5w4RC518ysI2CU/mXZPfNWClgE4OGCjA7Fh2LG?=
 =?us-ascii?Q?VDeUtE3joi30rcL9ae98Mrthtr9Ni5roHuANlobHdsKlvNNo6Y6kk7nw67DM?=
 =?us-ascii?Q?wUufxrKb5u6LRacFCL1p3NArlQkArNGbluITRD5haJb3lKs0gNGhjNDeHTCO?=
 =?us-ascii?Q?+8548MbQaBLqr4x1YByy7hu3tMp9FwN9ckaLXWKmCR0wi+evpQoZl1MGWW3e?=
 =?us-ascii?Q?vFbAKMs+JcJX6iWxe040R2x1RTth/t79U6WDofF3Y986h3z6vqAlsuZudYB2?=
 =?us-ascii?Q?6TgXOMF2oRVKy7BzjHXPC+PHqszvkrJVYwm2Qe4kzq3pS0DS9+43hOkJCarv?=
 =?us-ascii?Q?jCKhhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	r9sH6Lu0grlT3tefyZWkq1+tCzniQ6HCEAaiR1TVrdnq+dolgk6jblZn9XuNXvWHxz1ZzczVrsNhIvwo4vwsVwUSMLbj4cLY9oZ5ccQViJJuQ3S5iWw8Lo+PRL7PrWaB0PLCMBUjga5LLvz1HuY0lT50JpWrKYPnxpTXXsac8aTl1lLkO2UiU+X7o1ypxmavlpKoo7MkubA8IORkdcxb0mxCDvrsRi3q47zEt1jS4qdCszUR2Nl0NmEqvbuMphZ+EwmevtLbDG2cH5N0U2bTJ2gmFZARcBYyU6vxnkQ9zeXnjhnfrqhbZckXWyCgZlUhhwOF/DJFWeynVkILBsD1L1nZp89XrwveeDNDeVV2hL1g3kSOvdI3tNbt3eVr5STjwLsN/ez5SCwWbzTjqpFOxILQfBRsRF99XsgpULd2U7vO0DWLJLuKlXm8HLiaoKUQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:47:22.3283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbce5f9d-ee55-4bd6-20bb-08de6f374c25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5636
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 21:47:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19545

meta-ti / na / 20260218213904.1344360-1-a-christidis

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver=
 version 25.2 -> 25.3
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 18 Feb 2026 15:39:04 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5015e898d71628a8846c346219fbe305b=
35082c9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Hari Nagalla <hnagalla@ti.com>
- Commit Subject: ipc: ti-rpmsg-char: Update library to 0.6.11
- Commit SHA: d7ca6a5d0381a9e2524fefee36963f960ab70c00

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




