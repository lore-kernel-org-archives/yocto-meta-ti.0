Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D89E909D5
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:22:38 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15905.1771345351209431759
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pgr1FJOq;
 spf=pass (domain: list.ti.com, ip: 52.101.53.11, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwtJk+C1bnFCs3p3SCGmOsTMsFyobXZeBhy19GbQNN3W5ds36fGUQUoMiN2MiOpP/hFT7GjFCc/Ly5Jvyz8mf1U/R4b7Vd36HtV6d/mJn5a+x+s1MFAB1vV/AuN6e71auXsDqsI7OKB4KOeasnx6WSZVqEWqbEk81sQaQ+XHDk5I0sEFtH7e1Pg2H/M0st3k6JuUepSwPW4lagowqBxy7jLGAQbjvXcsnm6ImZ9K7Y/T/HE+kRHUsi+kF0lvX7qU6r+himKqjOKJmCaqayDqbs37HxiDuW7tDLAClQ/mJRts/lLAhdrqNR4l/6LkXO9jRe8+PuAcjLAjSl2tv26v/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/7350BdPKff+AFLCf9blAwKIaLY1a0QLI+inImfarA=;
 b=lRfGLFk8ZYhLmtdqwtiATwCc8i3wH1eX0GsHmo5sIyRUtGRV12CmCun1vhrIed1SyhpnC/Obq6rYgjULijSfXEtg0vOTIAXIuizFeUKqknQzV9NRq0I4WjvWcXPLCP6J4J9zrijcN+iAuHzEXMTcttax4L2iOe6wCyBaGhfZ+CY12bLtFO7AH3r8N2nKnqYt68flZE1/NI7t1AwpMkBy+PS4TfEqBlG6zjYgTNzAfik/rCRwqaOCsAlsnvH7nvADrJETfxLiA2VdOVX+dZel0RE8kML+KiUSB4TtXUzdofPetY7QN/ld9T0PyCarO5Md0XlpIXWz9TlEaB28/0Ue3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/7350BdPKff+AFLCf9blAwKIaLY1a0QLI+inImfarA=;
 b=pgr1FJOqlmCvOlrkSE0tsxhPak77NfYcWOY1FtjHSClSheWQjJjH2xCkmxQLNK8+3TqE6eHT8hAwLwkeG0a7jw0ljeM+uQSSpCezNLnmbITZaRGpaIt8rdxpZ0iJNb3jUgUgSUSGJ642V85tGfvJqAsokwrOdpMGjHxUFadjY16KMGDXBS/la9gaXCsGuZGi0e/9NeXRlXaugXsK1N+2aHUlu8JVaxPKM0iSoxFdy8SNHK+MwCx3aKvdAx/XQKv61Vd6+bmpIssxlcv6lS6Z+ADBaVSGTnyqf1eJM7TmJ70scuQep/7KUfhj6Gx/OZJeIWgAsAghd8CmZp4J562hpQ==
Received: from BYAPR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:e0::20)
 by LV3PR10MB7818.namprd10.prod.outlook.com (2603:10b6:408:1bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:22:21 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:e0:cafe::87) by BYAPR05CA0079.outlook.office365.com
 (2603:10b6:a03:e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 16:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 16:22:20 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:22:20 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:22:19 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 10:22:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HGMJVC990774;
	Tue, 17 Feb 2026 10:22:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C83AA9ACF4; Tue, 17 Feb 2026 10:22:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Change assignment of IMAGE_BOOT_FILES
Date: Tue, 17 Feb 2026 10:22:19 -0600
Message-ID: <20260217162219.2586527-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217161041.786432-1-reatmon@ti.com>
References: <20260217161041.786432-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|LV3PR10MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d605dec-f050-47b0-e69b-08de6e40b9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PkEeIKaJ4f0S6nCbV0APJ/y1DRH1mCU/gkAwa1y0e4foBSeKDgsDfwAZQCI5?=
 =?us-ascii?Q?IEE06PCzSTeN6k+kok38aVDJblA+enZoS5y6A9j9FfiCa2A2B1t62wo6JHFX?=
 =?us-ascii?Q?443FgjnAOTlj6KNV1YSSRwZiyDKWMHVJT3BZwQA0CshR40mWr342LzMwS6lY?=
 =?us-ascii?Q?p8QOyPAWKcLGMXWi7yKjzaWoSDsSFjjMTTlbaGNWCZDX+CmDqnMlyPfEASTj?=
 =?us-ascii?Q?ycnGl2iUex44R4yPoxK38bTLWCJRXqaFGvir8ZkJOdC950phGPYphmVlk4X2?=
 =?us-ascii?Q?Rolfzi2OF2QjoXmXCUicS0p/bk7/rIVlidCWj5zjw7i2pV/ITwcBKVCGZwL/?=
 =?us-ascii?Q?/eDNHLEg80rigi0vTYKBZoa4oNnBaEQUGoMlfVsLoHLu9tvV+TfniJr2RwQ/?=
 =?us-ascii?Q?CBia5MXhozJMkG1OdzkZiaULstLroOL5EPEl8XnVg7svYjGTl5fafdpmoX+M?=
 =?us-ascii?Q?Ys0r5ykfCeMZnSPSKtGi37g6BIAlDbEzbfGAHAN5EJYGgrCMbHYQRnQjjqW+?=
 =?us-ascii?Q?1W8kVOnTOk1MkeDATGrGkCuEcvn/1fRpmfJ7ReNEKu+51lIJwdf6is+u0xgi?=
 =?us-ascii?Q?MSyHHyoN/8ZPFZqQRu8zIJVIwUhdY2Ch1edjpUNEJMrEd8kwnIw5O/1mHOCz?=
 =?us-ascii?Q?B8nhsIyKLU5/BIvILwhQK5vF0+mxMHm6HZzJt57k0LxMHFF7QgTzVz0QJ6Sh?=
 =?us-ascii?Q?SvsAK6CT+3dv2JWzactaf7VGU3d9wzx5jI5fnAwj9xM1qA1N84zSHP+rC+8M?=
 =?us-ascii?Q?gaYeK9TNr8aCyvwxb6G34xTNDFzIEOYEfE9cYFkyu0BKRQ+Bpm2mb+TrQWx4?=
 =?us-ascii?Q?FSyriQfXdm8nj7rC+HyXckBZundlWGTzcZrJqpJ6Q08DpucfCaqFg3fZvACc?=
 =?us-ascii?Q?f8nE+JzP6fTxB9pQ2yd35UYn/XH8RB5uzsbYMF5Vc5CqVd3TvnOmtS65Jll0?=
 =?us-ascii?Q?dPrxTnp/tTsNt+bADAH0OoUTg0rFTQOycj8iTO/gSFBUp6oIacj++hSgDVx6?=
 =?us-ascii?Q?plQCl97/Vh6tHU5DoTwIXNBGdtCmQaLxU4uaFatKT8FP0pvDl/9XpXa8bu8/?=
 =?us-ascii?Q?1SYgUy6u/X2/pT9XJ33rz/caPhfW+vIOh58qvFvQ9/NMBKYarwiaGuerL8kN?=
 =?us-ascii?Q?e77tuz+Y7tBIQ0SYso1/Wsr/AiH/qWdne6is0AQlruN51OwWIdfRmwi+Ynoe?=
 =?us-ascii?Q?N+RM+RG5j6frQz3o+6cV6PPeRpbKQnqzk9WtDL2yjoFzH8zi31RbEmFybL7v?=
 =?us-ascii?Q?k971UzOQRcdgBbFmmq0by0B25aN83Hl6QetMX3Z/AEl2Cslp9YwnpsexC8rP?=
 =?us-ascii?Q?bXHnFFrp9HhK71lj0b1AG8iL/oGKXy8DajXA7eV5fCIaxHSmX4MN4UZ+X3mo?=
 =?us-ascii?Q?EQxU90ApukbaAZwZ9Ub/tZW68Dl6Txue764qeNiwWBwBRLhOVQyIuI8C8rUi?=
 =?us-ascii?Q?0Q4EnqRVofc/cSgKID1e7lo9mnoRdtTmYBlynYbBvEJGSF6I9dxMXN1IWOTy?=
 =?us-ascii?Q?pqnQYobaccDB43aV24uWDwUr2w2iaYQK6ky2bv5BOTZeJJSQKTLtLpFzshec?=
 =?us-ascii?Q?C/9JuidostAuIihfAsEw17CBWCoDxrcUDrY8tRMcWvI6HtwHz1V4Ctfbn6Xk?=
 =?us-ascii?Q?r+KqXrXm4eKRxjCpCCnPlFqFHVyPy0TC+CZwarlm9gmhIDSXAGEK9QZ3ChMD?=
 =?us-ascii?Q?ThEufA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	X/QDJvLGQPYobiXh7B4NTRyko8IntZ7KRIDMFfzaRM1RCBgBiwJ2dRdOWjb6VOgLeEOGVby5UIGPTy4Hndztl80I3IzKXD2fl9WWOzgc6z+e1sY24LHrCb69ZAQQxq4MeHsJFlSehcY8Ovrjbnycypl8E4bekmLDhGsHhBVGOwnC5xusmZaYQE648Q+z8UkFAgYLLJU7e/VGDBMaOUX0Pb3y13KOXwMgqUVOUOnWG5tYMlGMV1n5HNH2IHx7Js10R3A3JgqcSU4y+Qs41EHje3vZanWr3zyM8Lw8qV5xzMF8degiUDdQj8gIK1GKDrbhKOwrx1Udoc+8j5iyezWWPawatLfxjKfLXDdo4k8tpPHNFSUUSYmJUIVTUYxIi5au+xmE1AIj71Npq3lfCGDxEbJJEMinSpcPUKfWmDceRU6bICDjvqChxbP5MCDBOn8Z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:22:20.7047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d605dec-f050-47b0-e69b-08de6e40b9db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7818
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:22:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19527

meta-ti / na / 20260217161041.786432-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH v2] ti-core-initramfs: Change assig=
nment of IMAGE_BOOT_FILES
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 10:10:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 191366355266f3f009dc43227083621ba=
adb592c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 1c2398c320609f8f473a30f15de592549c461fbb

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




