Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1795D116F3
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 01:02:40 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7402.1764637350229623426
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 17:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ogVH2eoo;
 spf=pass (domain: list.ti.com, ip: 52.101.56.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9CJL0QzlQbubhpbmrjjfJemtc9UigaBZH7FR3ftcRbK/Z1TbDtgQHZNWixP/btiD3+pEjTRTLvggFC5xBFND9E+QBKNSNWNQ+NTGbIInGchEclMvhsLRk0Nev+I72l8xkpzSJahkMeT+3FpEy072zIqkgFBlPOV+f7jWopYPDGqb84KgWr3PZWMK/NzYl2IgvBKoLyYCCPnZswPVePkoRZmF+Olp8AMq5w680IHKG/3jn3nu/8eo/ERm2qQzqvYqdaG+R0lFL1g4J4D6gOdu3EAAY8rpuhKkqeZWhgaAGRnb1jiz4waOuB3YOLYauS3NW01WkuBu6ysq3JNtfHDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLw99p0lLIDrBroEhtbXccmFhHCjXlUO3VCFeVyzs94=;
 b=oxhrDYNr3zOZtQ5LlqNbIhJnMH9Jk0/jsRenQMxIE4ss6Uynpj6jy112J8Jos+YnnjsaVunLKwIFXSCXWKIEuB/j7e+Wh2yPENfynY/iCtkfqMKvCK7/m2Zdf2TKH2x3w+8sIhPPRK/4yuRz2GI9PVBFqJVdWLmFyrHj50pFnlVNkdaj+qrKvVPoLjMJwUg3ErA5xNEX2XccEF+oiW4WNG/JEQcLz+l26tYMESH3fYl1bvnC1YKLoWROdzOBCgSrqskWzzp/xdyxG36yoesc9iSSQsMZ9AFY8M5yFWBYtM9MjPlLNNfZazswSPi1Dh0JVN53lOAdr2s6q9HZWi+HNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLw99p0lLIDrBroEhtbXccmFhHCjXlUO3VCFeVyzs94=;
 b=ogVH2eoorNYusSrlD0p6K9CyyRVJ6uZv/FdB5JoHYnkXyBeXzuwb1db2EZzTPVSUlJiTCiQq9I2b3jj6+rUjEGGqTxNILs/n5RuYTnvP9ml6jsFPw50p2SamfCUxW+PaPKDdytn+T4ywPYtKMJmsiKchEtucXpwAkdQiT1cJMAFEBunm+gFTbfk3Vw+C2ilPFaV20tcVihSqlqX0mV9XF0VBjokd26MWa2y5Ld6Wv5b8U/4BHdrs1T0YHO9JcbvJkAQPcc005u7GGD0oMGI0lq/j4fZMyiNlOqp1t93Z6RuUjVonIh0vZsLieSWrI5QeDDV3+RAOG9MtDbrx8+1+7Q==
Received: from BN9PR03CA0400.namprd03.prod.outlook.com (2603:10b6:408:111::15)
 by PH3PPF55F79EE4E.namprd10.prod.outlook.com (2603:10b6:518:1::7a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:02:26 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::dc) by BN9PR03CA0400.outlook.office365.com
 (2603:10b6:408:111::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 01:02:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 01:02:25 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 19:02:16 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 19:02:16 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 19:02:16 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B212GQP1482155;
	Mon, 1 Dec 2025 19:02:16 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 17D602A55; Mon,  1 Dec 2025 19:02:16 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512011246
Date: Mon, 1 Dec 2025 19:02:16 -0600
Message-ID: <20251202010216.744181-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251202005107.778617-1-lcpdbld@list.ti.com>
References: <20251202005107.778617-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|PH3PPF55F79EE4E:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d7381b-6d4e-489b-bf02-08de313e74e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zd4VSvg9CtFdoENMYEgJJPZQXuChVHwuRPNm7nX4IvcO9ryW32qdcAGAUHdp?=
 =?us-ascii?Q?JM1RNdFyynTtWtc2RK1ZO1TgeRx1vV/2A/7dzPkUsmrCXaNAfMpxMqZJ5g8V?=
 =?us-ascii?Q?Pi8SgnlYKV5baSzCylk2aRQVMroD7+glqFz1mcF7a2MWGAWwGkPwe7IHMTUX?=
 =?us-ascii?Q?xt+SsxX6xZBMUyldgTvdJF0im+FYGOb/0YaoIuby4nWGKWMLVh5nNqVf0aOi?=
 =?us-ascii?Q?QSb1agrK0fcdHBraxCEF2yWiSwiOAhiHv9DdtZF6WLNRByXDMssDR95UWb2D?=
 =?us-ascii?Q?3CWfhV5CdkRHFCd9FGOp7MnD8qA20EtuV/PC4AHNOAytH1hwwK5AOffcXu5R?=
 =?us-ascii?Q?faxQYWsTv2Ay9mzNbGTje1i04BL4uefX6Ouc81VAcFI3zHVAMr2BpUOXe827?=
 =?us-ascii?Q?d87cU6LpzFQuUhXCesHoxfOo4ARq3fxAhNA/mDZN0tpMEW4evnFoA4FBxp31?=
 =?us-ascii?Q?WWEv33z4DrGRhbTW9p2efDFc2TDrKzbTH50x0E6biZWy3IYiccZsUwQf/mSo?=
 =?us-ascii?Q?sLlmz1MX72R9dCG1eRgx6gQNRDnFnsROdmIghKnNvTm5mSS5A4zZaSoCOvkm?=
 =?us-ascii?Q?IFd83ABvZKdV6jv1b36lUsFSZqGaqZ52pYYxBfAcODRfuTsnBEvfz1fl1YY7?=
 =?us-ascii?Q?hS5cH3NtFhPfk1z1JCoarONTHW+K4avv8t132GiDLr2QpWwJn7dxhmj7ZXmk?=
 =?us-ascii?Q?2oGb4K9RBHfs8GvgMicnpRAO9u+x5J7UyIkSQeg/BLo7cPgqMUli9jiMWL5i?=
 =?us-ascii?Q?Sp7cyKgljchQrXTMq1oREkvOX24LKCOta6JzdrXmb4n4pHsFZ37gP71Zf+0X?=
 =?us-ascii?Q?4YBG1+qRiG1dv3sUXK8hDtyhG2EBN+CJWgqM0ZpDmmywLYXW1kj6WLZ8YbPM?=
 =?us-ascii?Q?/hPuC092ovmobE4mCys2PVDYckg4ECo5bW7Kj2VHJbVnpKslpWHMvWGiqGMx?=
 =?us-ascii?Q?Mn+EJvGUtfXaPcpQw1BCPiudtvoeDCTHkJdlDRPDX9wzii/4wuzd9teRCW8F?=
 =?us-ascii?Q?bDtBKt9qho2+bDF1y8V2WqE+exFxfg5KUw8Sq+nwkL8hUT1IpXtajX1wEIpB?=
 =?us-ascii?Q?uKfjY4zFADrJZye/LYS00UjVptMumpUGVFCUXU+hmQ4UILaNs+fDoztKJdmF?=
 =?us-ascii?Q?b8uKYfhdQVFFvHanLF21E/FNoHoWPP6urZFuEF/bm8IyAApAhxao2ocA74NQ?=
 =?us-ascii?Q?xzMhaG5JC+KwRFq7bqN9M2q0+3z1hcZlQiWM7t4rxvYkoQJoCaYv6spgQ1bS?=
 =?us-ascii?Q?/7UlqcAuZH5adVVSukj2nNzoOBG9mnzTl4jWPA6nnNq3XkKDODerIC2Krjey?=
 =?us-ascii?Q?lv+P4MABsYNrV7MadRIgM5YX+yajO1unEbPn5NeoDLDSWgFkkliWCHV85/Bx?=
 =?us-ascii?Q?r0jKhk+K6uiP8HYcqHfF7r0hebhwUn97RnGZBeEoVPKrYdKbB6KGtOG8aOnD?=
 =?us-ascii?Q?enqWDstsGiDq5jmVmCsLQEO3LfRqSkBublCTkhUgAKXPGT8gBRCMySZAROHi?=
 =?us-ascii?Q?ZuyFoZSqKhGntSvtrIsSbGFw2i76mdafPd1YL3dSIO7Y0F2QYcbzHnBkpXpB?=
 =?us-ascii?Q?a1NBvGF87SWnIRtKMrQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:02:25.0942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d7381b-6d4e-489b-bf02-08de313e74e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF55F79EE4E
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 01:02:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19314

meta-ti / na / 20251202005107.778617-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202512011246
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 1 Dec 2025 18:51:07 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4d04e903338e0a8be5c0dcb689d07858f=
a29578b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Manorit Chawdhry <m-chawdhry@ti.com>
- Commit Subject: trusted-firmware-a/optee-os: Add LPM support on few platf=
orms
- Commit SHA: e174e2d73ce75dd43172d453933dc5dc9ab00191

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




