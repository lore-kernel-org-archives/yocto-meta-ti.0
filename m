Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9422FE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 19:26:12 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2338.1771442763560556736
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 11:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=mcuwr5OE;
 spf=pass (domain: list.ti.com, ip: 40.107.209.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeFIxFuriciLXofL+fPZPkj1q4dBMeeFrnDYEGWKMptz6Z3lYxJsU26XEbcyTr0GbRh55+W+76OsUO4mOxLKC2m+I1Ssq+gDSLC8J5Tcry5MN/AJBw6PFZTMkdez0I9d68Dr2o7MtUyvIMDVl2OKDAxJ5os4V3hcqMQMgUeaHLxJ1pdE0tWpYTNNNha5ySVXGtZE155kQe4CkjLOOLyfCiauF4jpXCz7W7HI/1A3bgbbq/017owQf+kpq6UqfR8SZS3NIEvyGhQgYQz5/Af7M7GH9W0AAFuA44Jy++xPOFLRQgAOfLJZKBjsg61H8UYuw/uhHdZUNpTSpc04eXZT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q+xOH5UlSkjBzHLkSfibP8VN8rz+aDc5O3ieV4cC54=;
 b=Eph0mdH+FFkiT3qwryGxcn2XMU37/Gx0MdFjlgBwDRQA8I6yf1VF6w8J+XtVP4lcoa8IAxFMwEyLpf5mwJXTn+3ojUtbaDn29tPc19U7U8qknY4CDiNFOvTmBoqHlwNIpe5LDTgq4wgkvboMjLp3bHyDPpuX5oSDGf4qoVJUlu0PeLCPPtQS4xgNDQs8DqEMY4IxiyiMp0Y67Ntrb9qXERZEZi88/7IpG1nR0ZgRpJ7FWQoP+Wp/327guXkUs0K47+xVqo8+wG9OIFhZsHpRVxyzYasYEJi0Q7rcsD4cxj2lwgg3pgd8FqgF4AvhBwHHXMqFXX5/bYGL9jZ94rasbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q+xOH5UlSkjBzHLkSfibP8VN8rz+aDc5O3ieV4cC54=;
 b=mcuwr5OEiL0QQ5H6WS1sVm/4FI+g1kCWuRla+U/bBdv9s7PcRv8ke3XqFFxzYuKWsAZJ7nWtSEdm5xOX7M1hhIZjKJZ23aTnuN9Bzkuf53vuilI1chqfC6ZX633kCIOoJHEcabiFMqtuJ/dHKMcvnF/2WndQSXFJ6wozwmhtRD/qec1kKVetPTPMizMR+FGrn4yiRnllBk3chikZBAiTyqxv4dTNKh4GIqky1qJj/oLb7BY6L2SFcLOqzEAvwY502maFbccgJt2JCGRVX1EqHgqoZ89QeY76fAh3LsnCyffKw/FY9mzcTRhyJiREoyjey7sTe5oN2YqYsvb4fmR+fw==
Received: from SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19)
 by DS4PPF9146A834F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 18 Feb
 2026 19:26:00 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::5c) by SJ0PR03CA0104.outlook.office365.com
 (2603:10b6:a03:333::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 19:25:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 19:25:59 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:25:59 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 13:25:59 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 13:25:59 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61IJPxsO2009958;
	Wed, 18 Feb 2026 13:25:59 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1BB839ACF4; Wed, 18 Feb 2026 13:25:59 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Hari Nagalla <hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <nsaulnier@ti.com>,
	<b-padhi@ti.com>
Subject: Re: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.11
Date: Wed, 18 Feb 2026 13:25:59 -0600
Message-ID: <20260218192559.2412898-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260218192325.12701-1-hnagalla@ti.com>
References: <20260218192325.12701-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|DS4PPF9146A834F:EE_
X-MS-Office365-Filtering-Correlation-Id: 005ccbb8-e499-4bdd-0dd9-08de6f238c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QbzbOSqR0gv7bon18eH0bqNBn00FsqnOhWN9jGg+ZCS2wn/Fj2LCL1S5xhBu?=
 =?us-ascii?Q?qOH5bzgpPghLK2RUWtlAoPX53HoalTMpEySDFBIe9DSn1Igsu7aLRO7Qg/dX?=
 =?us-ascii?Q?eGf1sVamkLuq/x8ZWipHJv/DutKS6C+yEwfgiVH5ZAIF6lrAkpfl9KZJa9Oz?=
 =?us-ascii?Q?xMzfKmOIOKZuWMTzmi65AhoCbpse6EF0Gq0bXAVEf8beVzkj5qauaEJxr1CU?=
 =?us-ascii?Q?p/UtQrqAtnEi8FguKlJtm7K9px/5T2nPcMkISeRMxxxYfhL3iroVrxnmE51H?=
 =?us-ascii?Q?0lhJ2hFs3EIuxb0Exg8IqS/vx5491YHksKFRn3zFY4U1TpQKCctZoABtb3Cu?=
 =?us-ascii?Q?RNBzZledBz/3dMMKxpsv07QauldBxYz4DV0Q2LVUEuBKVZkSymPNUVFYftHr?=
 =?us-ascii?Q?TKAT+jgoaN4INHTOdeGHuRXZgD+npeCkqBm3xchpBYOk4UEhniCgaI6t4ul1?=
 =?us-ascii?Q?w1SU88A5Fke65UKPGctoAoGGiQKkoNoOPkjIVhTCWOjbOOkGthAgYGcn4qqb?=
 =?us-ascii?Q?mQQiO9F2Wd3zCedT/ECEbRofuP5MYIGrVW+e0ewoZuCNAw9OJSXBG0HSGojR?=
 =?us-ascii?Q?xhz0np2gfoZCrIfHWtuScy2mJiGo2B0TNmqvtgEaM+9GEGsvg8rb635ZOeNa?=
 =?us-ascii?Q?xwGB4TL8eSt+XAENFQg4/tA2Ey1zSjs9QaM9dHg9SSQig/3gREgdoNBI41YX?=
 =?us-ascii?Q?flC88xt0jX2kpo2FJ+wG4Mj3tV+uGX3bF5WSXP5tYS2K8h25wFiAtNZiVxMM?=
 =?us-ascii?Q?jIjwiglUtMkZ+eb3cqlvCy3WrJPUZNKc9pm3c5VYpTKoFsPH1/DMNpttpn9s?=
 =?us-ascii?Q?diFjJVd9vWlqYeOakm6H98hYcCp6agVHx2fymp8qZ21wW4C1l7XA33/QsL9D?=
 =?us-ascii?Q?27K+rwGmVL0LeneUzxjERvozNFyO28t09v0hfKrLNYdCJu6eQfjCrCWYX7Oo?=
 =?us-ascii?Q?TcbtcfdtIHF/1FQVwGQhwktX9ELzEvrTNMn51kQihr4gm2iH5wojNM37XsiL?=
 =?us-ascii?Q?pwuEAH/OvNhoAASqaOOf6wQZtxU3WK0e4z8J7muCgGoobOS4RuVYrxobTnGo?=
 =?us-ascii?Q?yJ74CaetX+2ttll7xJczS7t+YjkKjoT/ACQR00kUbXnv5zljCftqVoCAtd3F?=
 =?us-ascii?Q?OtBg20l0i4IF/4nj3GnvFMmbe0b56y2FKw946Ii2rn5gCASPOAy9otUi0on9?=
 =?us-ascii?Q?gcol26fm67xFhWVjhePUbRSH+S1qpGViom1Kar9qTEH8MWTNBR/Q1q0ruD2g?=
 =?us-ascii?Q?7FaZ0L24+39CuldXxQmul8OLPlu3FnXEClGhTRYRRioK+tcmkdLEWuvJS/cn?=
 =?us-ascii?Q?z9stymtC30vtXL9tjL9S3t5bWgNXafEBri1aTwmqKAIDCiZ1WcwSaqA5Qvba?=
 =?us-ascii?Q?2U+XAqC1CEJGil3l+XJH84RhyGcOeeGyB/zIfJTRpQVD/sUmLBksrp+7DEU/?=
 =?us-ascii?Q?dGG3Dx4tKAqgwbYPU1uMaedpnnvN+fis8tN+muDCyI/LKMsN/YLNuVJCzguW?=
 =?us-ascii?Q?s56t+vYBtbFPiA8Z/5mMzs3I9e0Dol0hcxMp9sj5iKxHWEzvwQX1rnfifhXD?=
 =?us-ascii?Q?kAx141KlWwgAeGN3RgdjF2R/wwic84c7WEGmn/a2FoWdpKKvxr90YYLoD3hY?=
 =?us-ascii?Q?Bw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jt68Jzf2Pidle2Hx2AcbtYQSYwu4WKRsr7RMRoF0rEvVS6qKI07uLPqlMN2z7/SZ0Z+fuoKzThkbOgpSkysX4e/R0LAhFnqf2h/JmpMCiOkPtD2NNQ32Shrv0NaBkpKM7Lh/FtLN4C6v08IxgJFfx/eDhuopjSGhOoNzCmr49qbS9hnuD+Mf6X9bZLbPRba8CQ1e5b//Euiwe5SGFwoGk5Vc6KEF231i6Cg1F9kHkSl/B2maVmkNMy5YcI1eLTW+ofk2pS3uWJOOEPZDSpMRnj/NUn0jHBFYFPBRAJUvM4LwqmmqUiYsyY2yf+XEi9bX7vUz1waZiYJy3gz2xNgPXTVHbJmYlmFB/wEDW4IehFJr0t7ws5iKzPu3Zk6hMuhKG732rPE+QSbY++MpBVKcQuR53ebvAfmtkjqHqSM3JFQoIq3eHXL0hPjJ9RTvQS7y
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 19:25:59.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005ccbb8-e499-4bdd-0dd9-08de6f238c3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9146A834F
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 19:26:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19540

meta-ti / na / 20260218192325.12701-1-hnagalla

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.11
    WARN: Commit message should not include directory path to recipe: ipc: =
ti-rpmsg-char: Update library to 0.6.11.
              ipc (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.=
6.11
- Submitter: From: Hari Nagalla <hnagalla@ti.com>
- Date: Date: Wed, 18 Feb 2026 13:23:25 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 670ee830d9c83d80a2497d16dfcbe1926=
7512876

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: e3c0d1cceaabb4564de393e8dca459ef0c3bf836

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.=
6.11
- Submitter: From: Hari Nagalla <hnagalla@ti.com>
- Date: Date: Wed, 18 Feb 2026 13:23:25 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 670ee830d9c83d80a2497d16dfcbe1926=
7512876

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601300920
- Commit SHA: 5258ee2f903d8f1e0cbcb9d01488d08b57314009

Patches
----------------------------------------
FAIL - [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.11
    error: patch failed: meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc:7
    error: meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc: patch does not app=
ly
    Applying: ipc: ti-rpmsg-char: Update library to 0.6.11
    Patch failed at 0001 ipc: ti-rpmsg-char: Update library to 0.6.11




