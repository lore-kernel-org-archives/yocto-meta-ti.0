Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C2ECCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 08:50:44 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9016.1762937439968703822
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 00:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Nz2LA3D2;
 spf=pass (domain: list.ti.com, ip: 40.93.198.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2N/g7/cOhNfzT9XwAsZTD8ipD0KsLH3Q4iaQeC0jimCx4gIzKCoStBmLM/qNsxO02iv3gLuzWRsE44pRLog1Z71T3bmBOLKaAF3BrCx8GeresrR/8044FOOSfXffLGVqah407YhjpWhrkp8UAXHT8y8yFc2wWC97CRPEfiJcwjPxkZbrEGZUODfNAHNfDDo8ovmGaSdGHdEHFY07PCcl1/4Y9hOzWUiOSUSOn1Afi9o/y4Cy1qNVRRtimpIinR+UOlTNujx+ajxNyl6pUTYoB+26y+06pnX6FA+4PguctFcBadC+24pCPTQASDiTri3YUw+DW1U0UwwvjgnP2cEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmgEn1qK+wT2jEEaCbh97mju5YYY5vbo1yJvf2NfVNI=;
 b=uYk/lVKHU+3soXaZhYOkjR4/bKKJdJF1fXU+KH09gQG8NJgMyEsOBaYOAQTKbxjCBolGm3indOCuXNBJplWzl20ooqP4BHUtzyLg5rvHPpuJlo6i+UcF68nDUQ5dXF8IPiS000erBIwbD8cvqbI7Z7xYSTpTy+QOix36aTQuOICujKRNDWla2n1LnSWG5z/fprHj2bOiqeAzMPi2qFf7t+SU9vehuMHfLC6N7ZOz5ObJb8yU5/9X3TY3mloXvqGrG9SVCeihz6ldad/XA4bJ9omD/mTZgCJBMn0r6RvZbaXW/ykm+qFZMa0T7TQ27wtwFQLayTOQBF7A6Nqq4QSgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmgEn1qK+wT2jEEaCbh97mju5YYY5vbo1yJvf2NfVNI=;
 b=Nz2LA3D2W2wVQ+VHQbzsITQfndU+gyCPXgRrqzEN8NOlD06DKzSq8b07tA6S0uGRFoSXOztAvylG3FoFqEBq8ytk8nCS0jhsGkxgoJaojbXkTWc8pc0hotaJI436RJK99oFm+ezEc4WEZ78xny72cZIdLfid+1Pd6wmLhKYGnnOeGNmXpwuu9Ytn8IvXt/dLJwr69mqWEcarp5CxaS0+8+2S86lceY6rdNi7LZk4BJ/UsRt0HyW9LD3SBl7I/dgcrHXlXGhwOUmzGrX4zrFLcD5ZzXDi3zjqn/PQuV3bwpOqHm8gz5tNHVBWR2AF++djzmiI7mHoM4kVPSoFf1zz/Q==
Received: from DS0PR17CA0019.namprd17.prod.outlook.com (2603:10b6:8:191::8) by
 DM6PR10MB4124.namprd10.prod.outlook.com (2603:10b6:5:218::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Wed, 12 Nov 2025 08:50:38 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::f3) by DS0PR17CA0019.outlook.office365.com
 (2603:10b6:8:191::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 08:50:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 08:50:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:50:32 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:50:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 02:50:32 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC8oWvX2412762;
	Wed, 12 Nov 2025 02:50:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 36D1C13F521; Wed, 12 Nov 2025 02:50:32 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511120100
Date: Wed, 12 Nov 2025 02:50:32 -0600
Message-ID: <20251112085032.166181-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112084840.536298-1-lcpdbld@list.ti.com>
References: <20251112084840.536298-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DM6PR10MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: b105edbc-0633-400c-feb1-08de21c88c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OSFP/YhxmhMKywi+CjNoRuOO0GVvr+hRTp2O7tsp344yyQhtMZ4Ta5ZDlJzn?=
 =?us-ascii?Q?xalxsirBLDSbXIO+kJbYpdQcLfRgimZ46rSa53Teqyw1v5yTsXb1sKM/9RPr?=
 =?us-ascii?Q?po0jSvsPPTQ5b+a+ipJnl/a1epsgjAi3khz/FYIx165YrZQn8WjwCrZ9pg2Q?=
 =?us-ascii?Q?dduKETtVuau4DUw8OAoTcyvSXAYRoY+Y7ZeU7l/3iIt5LCKC7/+pISpUbqRe?=
 =?us-ascii?Q?w9kkgKbA51lieyi5fnOPBrsjG/u18JyFzcoe1ZL2gaGlOAco6z00/JaWRrlu?=
 =?us-ascii?Q?DuQbOdP4AkM/2TwLgl4E69FI7AiCgpUkulg1Xe87R+6DFFt5lpy2p3XYAULI?=
 =?us-ascii?Q?GMK6m5MoKKRNYl8fIlyNS4HfCu2kIPVeGuj9FVIl0zkIojMhzR+f2mDxzsmN?=
 =?us-ascii?Q?3ZDawDgkTYpcqthQqn7mKvhbWQZY3kJYiWuzCKmWGrEgQ62aFc3+/aJR544J?=
 =?us-ascii?Q?pfp+3voEkzsliBBJZADP4gS94cdnZpvpQI44pxnAsrYh1XUcisVygeuPfgC/?=
 =?us-ascii?Q?qHViMyuVx4UYSvLjeswbxbHa1Db/RqVCbMavhHy9LCRNXxo3ZjAOPECeZSOC?=
 =?us-ascii?Q?+vJjFKdT5jgk/R4vDeCly6e8/vE9uK885SyrkfHqSfiqYAJNqMxyzhUYhF+u?=
 =?us-ascii?Q?YOsZEpv4Qhx+BDSRhVkwNEnJAKsk1Q7bbxVuEPqluHEIGAQXr2EJKGjCCR7Q?=
 =?us-ascii?Q?ZtJTj4hB4IB7eD9eMud7fPWXtsEKto3SiFUl6z/kNyNmk7bmvT7Jgt/WXoSW?=
 =?us-ascii?Q?kj/NeeHesyJgxSU5UtnWWuDEpnmBnfNbnwAX8QUlE7CyKhjMWfQ8WT6PJvBq?=
 =?us-ascii?Q?ZvbGI8F1blv3i9VjYdwft1oUC8JJJAjIZR0YTijRDcHGp+CK9K37ViiDb9M+?=
 =?us-ascii?Q?YXQdHedmvmxU1Z7ef8L1pLAoNmYGQdBmFfjjAWGNabGuN1oGOHF8i9/b/XMg?=
 =?us-ascii?Q?gGmOxXDexjhJBJia6/xo5zVpkYUS11HN8Yo/OTXyUO8aopSu+xL9ows3yy9u?=
 =?us-ascii?Q?mI7MnE2t3DlHOuL8DlJ9DtSNs+4rp6WP5ztqXjHf3MLVh1BcfjNpUGtWYYWA?=
 =?us-ascii?Q?an4UhuhgXtFS12ZiNlyElS/0uJCaR7Y3618GMbzwADsvrjc0tGjpki4PAV27?=
 =?us-ascii?Q?1WAqZ7gdD4f41Xcqwh9qQQXgrWYpjS9oFgeauu2/VtEZYhsYMaSodaKhSKIX?=
 =?us-ascii?Q?mcVmjtOmCm1KLed/aKbBilHRoYWHqBlNMoJygAOjihBTdGjGy7Zmv+RcGhdT?=
 =?us-ascii?Q?UkGioFDHU4tFSpwN/CvaBgPsEYwey0hBQXdc5tshzemOSljeDlCrbu+kx+E6?=
 =?us-ascii?Q?e0k+DDJ1lk/Re+JDDXVBQUn7BayvhTpAIUlzUZAxL+I7mdgZLxwV32SGeKNP?=
 =?us-ascii?Q?QG0/GoCXsSRWqxNUfFtjBdV1TTBJYA1ZVLk9EMJL9ksjO6TaIu0fkovEmMz5?=
 =?us-ascii?Q?cS07+EOOLn7fDCZrrh9MIFaNJo4QfBMAcgcBN2vrU98OOatALyTsx6rHjSFY?=
 =?us-ascii?Q?/jVgssB8Y/tz7nl2jqsAhM9Hl7LNGu1QEU9ZfYHr3f3O11EIMsHgjfeN/30W?=
 =?us-ascii?Q?nmsrbEHf+hPB2cEHYQQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:50:36.8598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b105edbc-0633-400c-feb1-08de21c88c9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4124
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 08:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19248

meta-ti / na / 20251112084840.536298-1-lcpdbld

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
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511120100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202511120100. (COMMIT-MESSAGE-2)
        patch



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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
511120100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 12 Nov 2025 02:48:40 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d01895a206a37d816a424934cd8440ebb=
2951710

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add new exception for packagegroup-ti-=
core-initramfs.bbappend
- Commit SHA: 24fd5dc0935b9081280cbdae6fe0ed542c006039

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




