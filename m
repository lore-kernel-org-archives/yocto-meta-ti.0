Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC2AD29FAB
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:18:29 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50637.1764872302824398999
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 10:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=inrXMpb1;
 spf=pass (domain: list.ti.com, ip: 52.101.43.26, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsKPGMpD1uNDTLmt9m38KG101NDDzCkE+rOSG3CwTWlZ0rFuZPRKM1qs8x1bftmSFZ3nUV9ldCAlXVFkMmUQCL9b5nSYvs0PZ6xg1nZIIkVA/ENu4f8626EGv5Z+jl5z+gG5p8pdD652A83P0G6yIA+WRRmeMklllm7IYu9dAaKFC/vRPZxoujLkDab/tkcRMFevzinOenqXdYtTAd7LaUswms5cIUmG3ZMIYkJLdsXf4AHwBgQrQR5LfkGGzxQkdJhI2eiBv1MHnMLRkPakW4kUp03A+23MMsOv8fBv6zFQpmSORAYQ5bGQ/MjPQiHIAvAEisbdaW/iDEv9YmLb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKIhq3B9JFNX2CD1Mz/7+sSQ+yJzMck9ACgf8Iu78QQ=;
 b=P34nFAfj4U7eUfG7+0HLzULnlpipzHAto64AcRPcNWvw9tYxuyFiEkyK6I+A0dBSpxcgJb6om5sZE05NRZfABiROxwKg5qIuznrftO5qAhjELMvZR4UV7b89Vz75QVahcp0ACqUDsa+LmrkJbYsHdKFP7ChnVWUsepMek5Do22jJCKAx4eovEWpeCWLKpfjoUMKTiWoEgId3QSVNHxCMyXcBBKJHRRUIsxQM5RoSmtlWL2zVkCAie4hKiO1Gs3nWe50z7YRm9k4LsF6cl9FGdoq8eCiNbdc+AZRYsWKZTXUDFW5jdj66gEFzGZT4piqedjQIf307QpTdRjbJD9dadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKIhq3B9JFNX2CD1Mz/7+sSQ+yJzMck9ACgf8Iu78QQ=;
 b=inrXMpb10r5T17uXyLw7F9zx1wD7Dzuvj4E8NReH0Bca712nWQTRqWnMkbpAWdZjjXsTpZ4VPGHv5TWKu9svWEjtSpNhNMrv6w0Zzt0y6yhcy0eZFr4EdhRBs+uXQvs0YQ0pfv9/iYsK5kONb4ExZhTMVBJmhHJhQ3kinulrGt0TXoLR3tyRWt3UtUxjkuAWR07274eoMLr8xwJQkK4gpIGEhoUrHnTyEyjxA2qibRcPHGJNzcx3UWkAb221o5BWbGo1jU/pwjxopJX8tK3D28Unl9cmCD/9TubzmzCtOT1oFT1tWBnKMq++j94FEQr5XwvFLU/16gJ7DEea94fFuQ==
Received: from BN9PR03CA0114.namprd03.prod.outlook.com (2603:10b6:408:fd::29)
 by SA1PR10MB6520.namprd10.prod.outlook.com (2603:10b6:806:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 4 Dec
 2025 18:18:19 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:fd:cafe::ab) by BN9PR03CA0114.outlook.office365.com
 (2603:10b6:408:fd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 18:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Thu, 4 Dec 2025 18:18:19 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:18:16 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:18:16 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 12:18:16 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4IIGh94158215;
	Thu, 4 Dec 2025 12:18:16 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id F1CC02A67; Thu,  4 Dec 2025 12:18:15 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202512040100
Date: Thu, 4 Dec 2025 12:18:15 -0600
Message-ID: <20251204181815.2021473-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SA1PR10MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 5716cee8-c355-4758-4667-08de336180a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?132scqUvs796DrRVZ5StcQSrcQhZPBvcmpw7N3wLH1MrZoq9fR709eyYqC/M?=
 =?us-ascii?Q?P4ld8024ZfEh7/63HxRud5z0mXlCRRE3j8UA6vuVZoEhUZE+UTKcSQ8h0wmK?=
 =?us-ascii?Q?wr0i0ZumLiyeA2c7cM/bv/Fa/YpNWrSg63W0nq2g57oZXy8NY7OjEfi6OTVK?=
 =?us-ascii?Q?Fujdfu8lBNYKmSVAc4t2eYs5Vbkr0Toruv3MDzFujqvvlKmLYWPXu3S8DjR1?=
 =?us-ascii?Q?0Ilw9KUG0S9VhDtBX1+dv3LdK3EyttzH9UL5aDiWi0wf5zp2tRXoutnLcv4m?=
 =?us-ascii?Q?yfrQ1kMBiPFtHDgko0pRoB+GX+GxOHq4r9PswoKFxHSF8esTjB7+OGksI5JC?=
 =?us-ascii?Q?AjRFvPoKlfheLKjGbxpyzVC4lb7DER5BnbiA/W8jlSuAPD6DR/3/e2MQSA7V?=
 =?us-ascii?Q?bUpfMu/qnP5S11TKfeL3vQjd/aXKtxerF+AZEcQj/Ns/8hDU0IxsuwSBvJzQ?=
 =?us-ascii?Q?btcHO6HhDkqZA/YCYjxs9mkFD0i335Aq9MxXhU84IeKup5jj0EcCwzNjqjpj?=
 =?us-ascii?Q?VAiyIqKlZNzEcieIaa6As3g3oyFfGssk7ZbdX9oKpAbPHHjGKcCKuAhdtmAM?=
 =?us-ascii?Q?B2Jyi270K5A6QBzdwisdCkGX+y0JC74Yu1ct6+57OZBLO4z2dz9O4bRdbzQ0?=
 =?us-ascii?Q?iQn/3OHD7chYqdRHiAxVE8aOMYqWdddQ9r7hD+N6XTv10vHmI+u5+cFKjRQL?=
 =?us-ascii?Q?OoP0f1y40cFHQGHp1I232dNlV8OHJreeukkdeBzYtj0KPg69lK/74pfFw8bT?=
 =?us-ascii?Q?ysyR3nFURxsYCt++PyqgxDR28MY4NHHJplVB/H6nUAiN+CAHGA+17pNdIAl0?=
 =?us-ascii?Q?iW7zkjIIGbqQyFjtTPwcG8Gv4zkFiOLlejZfefh3HdSULrcbLvtA7vTOs8if?=
 =?us-ascii?Q?Mi+SC/CxXWtRTw3HePpATI/6iBh2hKwfmfuQ/jCo4Lr2RRI8dtfZwCv7GtrY?=
 =?us-ascii?Q?XzY6xDsIYV16/6YwGimzXN1bCgKFAdwQmRqPFrN6MOK/+PCjCIoOnR7oQU3P?=
 =?us-ascii?Q?D4n2FFFNdI2PPn7HxKtqr679XWaZ3kh11DVn5Rd616U40/6XFMxZsseHx3Db?=
 =?us-ascii?Q?wXG67kdoDjrbNdhoZ+wpOLbJZYqfEVy4JjcCVADD2vNKEwcgJ9ltISvb4xuN?=
 =?us-ascii?Q?voFkRZtiS8az6aboL2bzZIqA3gBjI4vt1kikQoIFllFwhpFARGvdvQSu1SMz?=
 =?us-ascii?Q?U+gZoNVcESavH0lJFoeTx/Wbxj89OezMLn+RPsILaStFqQLszfRrt6xrTt2d?=
 =?us-ascii?Q?NrukLCxbVNF+SmgtiQ4gswW/Pkve/I0bssP8MjgIdzjPm3wX/Hx5BJZkgneJ?=
 =?us-ascii?Q?DuZ5aw7+WssxDDaDQ5TZaXGuyJy6pDQ249wSwjnxg9JFq+5jFzsz40co5486?=
 =?us-ascii?Q?i106Q81dN8jQEebTpSiY6KEvH+03MSXLaAiavJdQuZm1sbxybjjsePpuhh6C?=
 =?us-ascii?Q?EbgWZnQuFX/i+Wz7dJoHbX9sDn8nnD3Upwo2G8EyTSkr/ibeIqyxMsjIVcok?=
 =?us-ascii?Q?wEmrNCzEqbZIjQVSGDzKpVXrA0jE7MFp5+2I7dulTCfSWPelHsr4boZahUYZ?=
 =?us-ascii?Q?z1mm7TyUZsZtPKJgWoM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:18:19.5012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5716cee8-c355-4758-4667-08de336180a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6520
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Dec 2025 18:18:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19330

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D0a37dc07b1120127eba73c7196a0b532350b9639..b5f45f14e23b=
927f3ab1f4e00c58eacb47b01d31
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Da44465cad8a30cbad5e8b22baef59aa7f5151494..3f3051bacd384bf=
331193070c29053d781296ab0
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D6ebb538029fdce262760611915225be608c31257..1db5=
d0126012c7a0b82eff330f9f8a68b3d10f19
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D1a86d36433eac7cef246d41fbd4d2bdd9612253f..2d5f054=
89a39201c2fcf95d2dc04af57b6f7f356

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 870707ba..f728ca92 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,14 +14,14 @@ GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
-TI_DM_FW_VERSION =3D "11.01.09"
+TI_DM_FW_VERSION =3D "11.02.07"
 TI_SYSFW_VERSION =3D "11.02.05"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
=20
-TI_LINUX_FW_SRCREV ?=3D "0a37dc07b1120127eba73c7196a0b532350b9639"
+TI_LINUX_FW_SRCREV ?=3D "b5f45f14e23b927f3ab1f4e00c58eacb47b01d31"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index e2b42beb..8c0a523b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "a44465cad8a30cbad5e8b22baef59aa7f5151494"
+SRCREV_uboot =3D "3f3051bacd384bf331193070c29053d781296ab0"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 0ab214d3..bbb52786 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "6ebb538029fdce262760611915225be608c31257"
-PV_ARM32 =3D "6.12.49+git"
+SRCREV_ARM32 =3D "1db5d0126012c7a0b82eff330f9f8a68b3d10f19"
+PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
 BRANCH:ti43x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index ba1e6ed6..d6f51eb4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "1a86d36433eac7cef246d41fbd4d2bdd9612253f"
-PV =3D "6.12.49+git"
+SRCREV ?=3D "2d5f05489a39201c2fcf95d2dc04af57b6f7f356"
+PV =3D "6.12.57+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch=
 \
--=20
2.43.5


