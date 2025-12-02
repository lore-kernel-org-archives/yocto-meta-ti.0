Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9912AD116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 00:51:30 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7165.1764636681829131266
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 16:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VkvTLYEX;
 spf=pass (domain: list.ti.com, ip: 40.93.194.54, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVqCbqq6Ib+0sjAal0EnkP98iciBDZmCnbTst3PydQYqIkFvlp/Ccvq4LLdtDASUwJBo+jnrwZR7x7POflnZYydJb7uxI1WF/wtaL8XfHgo49oFiQU+HBf+rowcRYSsp6Ll2whD3TFMzKqTE8pf2p/OIyP8gsDZS7KVFzMkYYw7MT/s4yxpVjQTALvW+ky9Ys/0nO1kkb7BgucBKvYq/83tazvsD0jLbdfKZZBjxLM4cNpwM+C7aBf83j00wuDZTgThxibk5L1ztOKPgM7axUb6e4OeinBATeDLPKxIIfIRLuG3IeluLZnA5/HWIp32BHRCxBqdlmKFiZabf7NYsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvMUR9wURfu7tW5bXVGE6kZv5BRCFwsOdFUHdPkY4bE=;
 b=eZo3U5CgNSgT7FKAMxsr3x4ycL+5+npm++wx91DNrVe4LOKmQoa90Ao7LB/7oOyiM5nzljhxXJ+erG/lkY5baQ6UnJV963fZx1EOdN7z/HVNH7C+6wzaCWDFAY04mP5dB494OUBHRlDrmlTS/6ime8ZE9TAq0wZTqm+O0j5DNS2fEMjcNqOBPEfDD68rVthG+Uspt6HoMc67hbOosyNCUuuQDLIfihiI0p/Y2As5CDbnt9Yah0P3rgZi5xbjDpReQL5kzja7dfFPsNaT2Ufypffz4eS/RezFa815rff1sabRg0+qcCYzYICp4ZR3qtAPMxgIAj/8R9lvbeNbkENUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvMUR9wURfu7tW5bXVGE6kZv5BRCFwsOdFUHdPkY4bE=;
 b=VkvTLYEXsg0b/ppoC0E5l8Jrv47HVwZhh0pFWKAWzXfocz6p9xTm+wMr2K1uy8n5F+8PHCfO0bHEU+LtUUMoJ6M55bC3dUIxwmctQG6fpAdI/BqbVQmjVhmYWHMJW0CPcPJQmlWDrMqTw56GaVIzYUFUBfQk/u9bljJPZF/aXC+QvoJqELUjIfK4Paf0UHZ9FJryfh1Pyj26XZgGCaqagYlpzAPPM9kN5N9fHO4/K7ndAp5SHgNhcjqu3tTi8KdQWVzjvJcoSDUcnUJL/b+FwyMxKAhccrTfExjHy443NCl8wPSBEoT3EWTS669nbBrDiZl2mqvcY/PN8xSzB1g6Aw==
Received: from SJ0PR13CA0159.namprd13.prod.outlook.com (2603:10b6:a03:2c7::14)
 by MN6PR10MB7489.namprd10.prod.outlook.com (2603:10b6:208:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 00:51:19 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b1) by SJ0PR13CA0159.outlook.office365.com
 (2603:10b6:a03:2c7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 00:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 00:51:16 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 18:51:07 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 18:51:07 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 18:51:07 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B20p73R1405404;
	Mon, 1 Dec 2025 18:51:07 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 592112A61; Mon,  1 Dec 2025 18:51:07 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512011246
Date: Mon, 1 Dec 2025 18:51:07 -0600
Message-ID: <20251202005107.778617-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MN6PR10MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: c28bde3e-27bf-4686-d37e-08de313ce688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1iYzrJxGnO81Y5SrTnzRWd9MEOrdgbqXh18C+6hJZgPujeMrBRSt0wsTVQjs?=
 =?us-ascii?Q?jYTgcTWhJxIOZ0mKHOtXuAB8c8LCl8hhVmzioYlSIBsiEhAYdQQc5T/mxz4+?=
 =?us-ascii?Q?poPhEJEILlCOtFU4lnd6Z4Ucea26+NcfsegJYxq6Ew9gqZJB2bzBBv4oCTUs?=
 =?us-ascii?Q?vv8dTPOyCNnOYjsORr5wNar087r+1QLIw0SLW9qP6it+CYSrBN93Yc/yK9Y5?=
 =?us-ascii?Q?4MHsXjzKGm4f3fNv4lXjjjZWClbzfQNYysqOqGEWdeX94U76NxKz1GoQIYWs?=
 =?us-ascii?Q?QoRwxGrkfMCl18zn5bl4tCh/tDpxKP4gxbi2R2m++irRDho7FzA3hoSmr1cU?=
 =?us-ascii?Q?HgTIwwOpIyOQyPtW7jN+IEYVlILtqI6qP9gg8u4F0b03C9O9KDb+X4BpBxVP?=
 =?us-ascii?Q?G2z70VMJGMpsYKCjvUZ65mGxn9FkMSsO0/HtNVU9nheKSTW2vK1og9vw9kA4?=
 =?us-ascii?Q?P9c+sPWI3LyNwBK3fpk9lZW8bz9XZmnP3V7A2a06oKpeFl8aTxXvBYEQEnk1?=
 =?us-ascii?Q?61z6kqm587KsW2veyYVlvOnkcOK1qhRtGTSqalpGeDogzFTH2OVoLhXP37hW?=
 =?us-ascii?Q?P0OY2p8mLCCP7AixUMS0hss/D1HEI19+rBYRdIwDwVzoPnj+FFUX1pLKVvZp?=
 =?us-ascii?Q?qSWomDu2MyG+9eUAiIyvk3AlpxLoFFQGHGHzCXVmpkxQH9jrBwnvvHTNnomQ?=
 =?us-ascii?Q?409HOy0KkyAVw1TZ+d72a+Gh9fzrZyEbJNO02fc7vH0PoHNJ4p2KxaqukEYB?=
 =?us-ascii?Q?ZNzbNAVjdK9MS8pMBK+jcvgAsalvNDoKGOAGxPCF/+Qwr0KhJBAiB9T27ORG?=
 =?us-ascii?Q?nlA64v+99BRp5kXewWywY+qLhr3q7sKA1abDE9QEcglMd4oz81/UPsISSi+e?=
 =?us-ascii?Q?k1sqgyGlT1oXYvfK/vH72nUTuZgIoJU0w8nTjudordUsjSUzyhsuvzGxkBSB?=
 =?us-ascii?Q?Iszf7t/8msFk/EdAhBDMO7qH8J0wZHfyHWiV3I1rS28LeTZMTm2rlYni67jw?=
 =?us-ascii?Q?BdCH3F37Blc8+gu9ADaxOCKL3y+eVIUBnGDMDZrRn8JXhVmgd7wIAxJ+zqEs?=
 =?us-ascii?Q?OuULenBZSDk/ZN2QT5oSy7sQeN7vR4vc1qVfEAzoshJexmkr05P7X83wa0mh?=
 =?us-ascii?Q?Kh90y3YB6tX9IOznwL1T0J3q4ZlweXKkovSORnYRHLtdQ60mU2N/dxhEROOj?=
 =?us-ascii?Q?QTkMrqDs0GyNXYiBKG6GTCVsSgVo30dxSV/4iOumnyWGhdRekgxsen/dVVvK?=
 =?us-ascii?Q?kXMy8pZjZ/JsYh3zVLf9mfdM/1m1nVwYkpBF1/+iv1RVnAqN+S95Sgbj8pnE?=
 =?us-ascii?Q?Kjfvdg7F5wxEcg99BY0FaxHGzsCJPFOtsQTo/eK8vjKASOPg/OTtLrC2Uvt4?=
 =?us-ascii?Q?5K30VRS42HeOn8HM7r8Ndn05/cLLo3JLrUlXYiSoY9jWZDBgml7qx4xjmCHT?=
 =?us-ascii?Q?Z0idgf3pG9yf4AKdkl/1OehZgH4FZFve+SSjLi9/xnsoyBSkg+VkJWhj3uMP?=
 =?us-ascii?Q?+WeyBOgl35hi1JBFAEOAM+fBzoKqJH0Z3SyelP53FghU/8HY7lbCH/tXPy9e?=
 =?us-ascii?Q?WsVGBLD+g/qhFVbo4GY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 00:51:16.7363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c28bde3e-27bf-4686-d37e-08de313ce688
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7489
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 00:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19313

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Db45ffc03a1fb1e039dbe54871eeaa7b430bae1a0..b5f45f14e23b=
927f3ab1f4e00c58eacb47b01d31
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D25c84747e21d7299715d04caaa1630de87fd5466..3f3051bacd384bf=
331193070c29053d781296ab0
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D8e631a0bb3c1a4d55198ec1b4a04dfb94efb3dba..1db5=
d0126012c7a0b82eff330f9f8a68b3d10f19
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Ddefc55f21c4741958d594cf0687cadee92b0c7d8..2d5f054=
89a39201c2fcf95d2dc04af57b6f7f356

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index bc6ed338..b03956d0 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,7 +14,7 @@ GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
-TI_DM_FW_VERSION =3D "11.02.06"
+TI_DM_FW_VERSION =3D "11.02.07"
 TI_SYSFW_VERSION =3D "11.02.05"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "b45ffc03a1fb1e039dbe54871eeaa7b430bae1a0"
+TI_LINUX_FW_SRCREV ?=3D "b5f45f14e23b927f3ab1f4e00c58eacb47b01d31"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index a220be2b..8c0a523b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "25c84747e21d7299715d04caaa1630de87fd5466"
+SRCREV_uboot =3D "3f3051bacd384bf331193070c29053d781296ab0"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index d13669a4..bbb52786 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "8e631a0bb3c1a4d55198ec1b4a04dfb94efb3dba"
+SRCREV_ARM32 =3D "1db5d0126012c7a0b82eff330f9f8a68b3d10f19"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 5f5d4513..256777c6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "defc55f21c4741958d594cf0687cadee92b0c7d8"
+SRCREV ?=3D "2d5f05489a39201c2fcf95d2dc04af57b6f7f356"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


