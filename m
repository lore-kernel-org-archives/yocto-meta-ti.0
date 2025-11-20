Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C8DCFA454
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 23:09:43 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.890.1763680178667339668
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 15:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=o5Rf6sSm;
 spf=pass (domain: list.ti.com, ip: 40.93.194.36, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0NnBmISiB2nsPcoSrmU1fFLXww2FCRy0XFaudxcQOlkdv6oE9mz1yw7u53spjtQGvSUTjXgJ4CfAshu0G2jvJQQJJPZhN3s1IGJNA2TwcDJBYoPEJJILt8un06Lxxrh6HQ853tPhnWzfSmu3C1XbUqhn+wyOxbXVPZSNgMk91TadrEK774LCEr4AzuMlsAD1jmChFFDNUV0Ero9OHf17MVagwjRdU+V2oyly8aN3TwN2lhXUn2/+m61TXU3t/T5YOkOcuJMasoUnG4jmcEll/IRr9XPReyn97oj2qgjBAlATkaDhGBeWpviQ2iimSpGfyz/96xHdvep8MiZQAbgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1gpLnmvJEuvAJihcXpRm5wgwc5QXJnas6UNb3+7urY=;
 b=KvSYSRwc8f9Pou+dMSzN6GoRit3T+S8wcUdsS/+HbIX1InevVdgpaixVbx3EzOCOVZOABNtVXQeHXTmBje52qAnqZzcNYpYeAl340Aepm4kFZCQJCKvVFwaaVYpz6iGunS2J8FuR/TCPpZ6GXAhu5nlyrI7jn2SPKdnMuCqJCxhkoaoPP2M1FIGn14axhd/5PZRBCo2637mLfxNEUxfthWchznhBT4V9pvYNvf+i+Svoz5x9zePlnQMGpdj/Ocm7HZ6fHRjF0ce1+u+lU6kZa0icXYSTLjmkn3XVjriVVMQwIP0kwnGE/Rs6rZwdKjRnXY7UryYzeqJmfFaVOswxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1gpLnmvJEuvAJihcXpRm5wgwc5QXJnas6UNb3+7urY=;
 b=o5Rf6sSmENhe5QBTSj0KnFmmzI6zhl+8IqDITeb+d/zepd3HYhIf+SJDMWan9FqwkdF2i8cfexcvwzIHhJ2gRPXVkx/2op+IaemiZd9deRoVMRaNgRTgnal8ksmZHMHyl6O/nVJkxGyHtAgN/z9/FSei0w/31rsOgW/PwZ6n/yKHlsi+3J566X6WEwLH0U1AZcyG6RARG2ZN8CFdveJ1xKqFlVD8Jc7f9fsxMTQ3aqQLX+vZwRFgIgdmGa9s1YiNWfVaABRnFeBf5O8DyYt+FB0HEIUqXmo+k+Kg6ripuFJVhBGyM9C/hgdS4lJIs/1V5wTB5ac4eo+GDia+xt9Y0g==
Received: from PH7P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::10)
 by DS0PR10MB6749.namprd10.prod.outlook.com (2603:10b6:8:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 23:09:35 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::5b) by PH7P221CA0042.outlook.office365.com
 (2603:10b6:510:33c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 23:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Thu, 20 Nov 2025 23:09:34 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:09:32 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:09:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 17:09:32 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKN9Wox271067;
	Thu, 20 Nov 2025 17:09:32 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id F2BAE2A67; Thu, 20 Nov 2025 17:09:31 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511200845
Date: Thu, 20 Nov 2025 17:09:31 -0600
Message-ID: <20251120230931.1485281-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DS0PR10MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c561a3-4bd2-4fcb-3ad4-08de2889debe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C0T+e/6wG1xdMDK2Izh0A0F40W/Ki7ZxSlFTWkz2xCU9RblLsimLaX9o9eJJ?=
 =?us-ascii?Q?9RIppVfMl6hqAXVZON+lMB1xOEIIKZMzdTQp7Zjb02okNjWSbBgF06IT9B0o?=
 =?us-ascii?Q?klpfX+fSMK7Pb4ke1qRtBNQ6lKenznRo42/6mmWVKOIL0KtcnWBU/9HGmUVQ?=
 =?us-ascii?Q?9wOHv6uyVJ2p9KQlHaSf8gvfidsf1AeJkSBsO9cO1PrndPMdZccgBlETFTdQ?=
 =?us-ascii?Q?r6XJ4vazjV+sbQ51JsQQY/JLbYdS8bFswiXSWVSPBx6ULkMFc7hofcTahk76?=
 =?us-ascii?Q?/IIzO32FT0ShFQk92LhCLXcl83v1hrOwzDaBqPt1O0s2mhHiKYKv6QQ/bcGD?=
 =?us-ascii?Q?Af+NUibzOSxyMrRvVpsjB8tsNcg6H381dofsodpD6WY/oluwqr4RHlp7wU98?=
 =?us-ascii?Q?oldTOzct5TpWiMuoppYbeZeaQS62rNyzrHGri6QX8axgRCu0+3AY2FY2saG4?=
 =?us-ascii?Q?htrqQx3HXVKk/B1gNubuhaZUjtmJVeDYhB2Uhscp9u9wBlDWo6TxsBBJMDcS?=
 =?us-ascii?Q?TJijEjHRQ48/q+MdAY6Q1ZKzpwZYH1EosU1b3YFd0dzyYyIki6s8cXUv53NA?=
 =?us-ascii?Q?hDP+fdFS8XEPO5+y5I8I0gg38lCsF2TI2sosvWsc5Iv7ftW4EhQD4zlkrEe9?=
 =?us-ascii?Q?iM3Y2ckwN8nju2zMyxzojpIxfg0Qb3dmgo8tdqqwGKxAfZtXytZFyEA+DQwg?=
 =?us-ascii?Q?mDDFaCaY/xGpPKf9vtJtSZ3vtQ2k0iIk2tpAb8Uw5Oql832RaQbNaD4UEUMy?=
 =?us-ascii?Q?a3CCUJM7YzDmDVr/GyMK+DW+oltocHMqHw2Db8wqp3/PDx9k0xKbsybhhty3?=
 =?us-ascii?Q?yeuaQNiGqwA8RHPGUMR2E9Cl8l3tnfk42lStEW3m22PFbw5o6bg0NbbrFsbf?=
 =?us-ascii?Q?1jQMzYozunC/MFOjXqG3KvNPg8p8ewBsDeslUhnOSXdCfZsNK3MRnEdJ/kYR?=
 =?us-ascii?Q?lCNJrPxV8arxxN88nLW5ILMJXalrROsVlFXnezA5Mc7KdqU3J3+y/OY559O6?=
 =?us-ascii?Q?wFQ1ktpXdUq0oLw773mt8NSgKHP75Pmkta27yPXDDft5ngMpIPyuTZx1+YmJ?=
 =?us-ascii?Q?FyJU9Czy3FNLqZogh74YVWMGilcP4m3Sl/4ZYPmOV1bErEGy9FfaikBAJTPm?=
 =?us-ascii?Q?rFQRz5dH3eupzkkuJCozvGavz5vjGy8/KwlP/yNywnYXte9VfILfnVyGZYH2?=
 =?us-ascii?Q?G2FdIPWoNJBV80wwdP0LgNo0ozHrcbk5VjPotEFK7fd5KIHv7lfAyKXH+grU?=
 =?us-ascii?Q?l1BOVwGsWLfccYSS6Q1MHz+mdTyhi++0Kjr4IdMdC2Hmb8n/LRDJNKcP7VyH?=
 =?us-ascii?Q?rFNvHikOwkQ0PbwJbWpZIT72aNyz/y4uXKPujc2PF+kOSlBIDg4Z+9XX7+tT?=
 =?us-ascii?Q?UscCR7KtfvZu4Y2m4rqvBS2gt9XmQ8JQBPWLD8W+cNAuZ1yGIy5eOeBpZOIg?=
 =?us-ascii?Q?LhBfb7fKzTixZvRoVKpLJp4XWC3UpAc7AxRPPSi4b91aAXKDCNY1BBMcmh+p?=
 =?us-ascii?Q?Gu3UNw3GULq4vw4m2ifwZ1PevQ1zW734KjNjUYa2B3AM48gNmZI98Z/BN0sd?=
 =?us-ascii?Q?0PIxt44OmpTMnEFVTvE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:09:34.4504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c561a3-4bd2-4fcb-3ad4-08de2889debe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6749
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Nov 2025 23:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19298

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D0a37dc07b1120127eba73c7196a0b532350b9639..b45ffc03a1fb=
1e039dbe54871eeaa7b430bae1a0
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Da44465cad8a30cbad5e8b22baef59aa7f5151494..25c84747e21d729=
9715d04caaa1630de87fd5466
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D6ebb538029fdce262760611915225be608c31257..8e63=
1a0bb3c1a4d55198ec1b4a04dfb94efb3dba
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D1a86d36433eac7cef246d41fbd4d2bdd9612253f..defc55f=
21c4741958d594cf0687cadee92b0c7d8

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 5fb82a46..bc6ed338 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,7 +14,7 @@ GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
-TI_DM_FW_VERSION =3D "11.01.09"
+TI_DM_FW_VERSION =3D "11.02.06"
 TI_SYSFW_VERSION =3D "11.02.05"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "0a37dc07b1120127eba73c7196a0b532350b9639"
+TI_LINUX_FW_SRCREV ?=3D "b45ffc03a1fb1e039dbe54871eeaa7b430bae1a0"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index e2b42beb..a220be2b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "a44465cad8a30cbad5e8b22baef59aa7f5151494"
+SRCREV_uboot =3D "25c84747e21d7299715d04caaa1630de87fd5466"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 0ab214d3..d13669a4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "6ebb538029fdce262760611915225be608c31257"
-PV_ARM32 =3D "6.12.49+git"
+SRCREV_ARM32 =3D "8e631a0bb3c1a4d55198ec1b4a04dfb94efb3dba"
+PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
 BRANCH:ti43x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f97df6ff..5f5d4513 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,8 +22,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "1a86d36433eac7cef246d41fbd4d2bdd9612253f"
-PV =3D "6.12.49+git"
+SRCREV ?=3D "defc55f21c4741958d594cf0687cadee92b0c7d8"
+PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
--=20
2.43.5


