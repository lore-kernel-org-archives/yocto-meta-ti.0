Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA3AD4A5F9
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 03:35:53 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.354.1768534548275146077
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 19:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lxT1bRk9;
 spf=pass (domain: list.ti.com, ip: 40.93.196.40, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq6iAqz9k6o+/ahBGY1jgfocBhzj/PgXe2qSZ1vKMoo29c1/87MOZB8jiwpuKOvajOe4y91YWZnUXPJuQCGPinI4FkHMMQ188OO5BwQXc+o5weD5XeY2GszgPR5IO5gFt46J0PghkjgmkNrWlbkmzh++IQyi2eTETBVJ68ejeV7yHmQIbOAfY7Q6fPpI582fIl511YCB22XaWTEobEOiKV2jVRbLEV31rUtPJ4fLT320jBLhRDoKFyjZcfkMikFYr8IVELwPRIZQRq38QO0JmpvzVVZIWYxlf5CNDb/ND+c+AsR6pTfVQO41U6yk8hGuajUhMyXbxBRa99e9Z2S6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cd60+GQxyvhmKYZi4bPrcIarWQGf/po4OQzAG7mTv9U=;
 b=j1IgkCL+PoMt+xcl/eY9Hm7Mnt528mL9B601uduM3RZYzcqXx56X5vipR2jYw2k6KdTe0LM5BKWExXhGE4OkgUwSRRHS6J+YxdCqB1j3k8PBDGG0Riz2j9NaqU8loAqw8bHHvbNuXTvUQ4qmu6J7V9qsHUGj5kI0kMje6qxBIQPjhaHmqA/wqkEwOsFNVEZY+in15w9WaRuOa+RDa19dAPyYPEoQLCDrdPh4pEIb4AHnlvXvH3EL7FLjf0hxMXoVkvK+Uuq5W0Oq3dc1pFWaAj+VyzcqxFZsW/+PaL6UDhWR3I8YpJ80vBRmWOOwOa/nk3xlSQBhDgH7pT60y+eLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd60+GQxyvhmKYZi4bPrcIarWQGf/po4OQzAG7mTv9U=;
 b=lxT1bRk9+4/LII12OwQnOdoTIYae2cptb9tyYXqpN8FGuyJ5+xGpNnGOpRj+j8qwHPLwk6qI1Xqk3xdqqvkw0y1uAR6jh2xw9pj85r4fHRaXaiYaMLqWi4e5UZmzTxk73kJ5EKtnz43z+4oeK4uUI0d9kxXcr2VRpF1SqSEMrCzBCxrdrFTji3JF4mEymFiznoqAa/X+nBsGxKEqQS6zoBPJ0iJAA4SIQAAN76sqsrctbLKrKcgg4+wN/PUPax1fthor57/pEDHoztQOfC8r3tZKUwId8c2kaytX/qNFLkH8Jfv6afRvvf7gfcKvzm8ETBPB9RfMOzdQPX/hXBW+EQ==
Received: from DS7PR03CA0076.namprd03.prod.outlook.com (2603:10b6:5:3bb::21)
 by SJ2PR10MB7013.namprd10.prod.outlook.com (2603:10b6:a03:4c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 03:35:44 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::94) by DS7PR03CA0076.outlook.office365.com
 (2603:10b6:5:3bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 03:35:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 03:35:43 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 21:35:42 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 21:35:42 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 21:35:42 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G3ZgcP535594;
	Thu, 15 Jan 2026 21:35:42 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 58E64136624; Thu, 15 Jan 2026 21:35:42 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601151800
Date: Thu, 15 Jan 2026 21:35:42 -0600
Message-ID: <20260116033542.1562461-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SJ2PR10MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0716b948-d4ec-46bc-4ea7-08de54b053ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/xpxusehrYhhnPGMxbgXBNljoCqaw3mnJx4iM5WV7zdwk10LvF3DwGMedQAc?=
 =?us-ascii?Q?IBAtjPmQ6Xv+AUozJM3I8dJkLhcggTcURXP9EWNljCMTAxcJNjnWvUEG0ai2?=
 =?us-ascii?Q?5hF96/ZEzK3mMWlRfnVGw500aW8ijdS6a0vPuL/Fc2be7Coq+TTl6pWlyjw/?=
 =?us-ascii?Q?3i0AkbF41gDnJz+1QylXlkeevuQ9qM7VbwpuWW2+9NaNY5NvR3Dl62t/l44z?=
 =?us-ascii?Q?985lSqLdGytGeA4zoyxpGQoTkB0IqgLXNVmJzIJCs0DB03Z53nybgOyVv9uZ?=
 =?us-ascii?Q?N/86+B3wlvakuS46G9UI0eoN6sZAa3AGDIp9SqGPm+1KMXQnwIUacnMoHown?=
 =?us-ascii?Q?YrrBYcaOWOQg41B1hRwutXmnCXXE9X6Exzgjy5zNxq+VTlL+9Coy1FYin0ce?=
 =?us-ascii?Q?wo+ESTVCw2mBGJRd4FUnfuHTDWDY7lBqukDSXcVLn8HYdf7HQAexyyCeuYMG?=
 =?us-ascii?Q?KdkWDpDDI/fLps+adM+rzpqYgntZIGbzjbPW5d5pnsa3PVqHlP7wtwjD2xqc?=
 =?us-ascii?Q?dia+qAV6J0h++MoFQ3eMKRFwbtrL5dUqZYxPKi95Ng+O15m+H7Tyj8eqQlYB?=
 =?us-ascii?Q?+Ujy/KmwUnq+JRS80L/Gt2iUvJs9yxzk6aQErYENp+oC8LfiIgkwbQoNe5dd?=
 =?us-ascii?Q?4883VPwyjeZ/EQXrRrmOtbUJBFO/urees/chmngVBrcPbYIWXgoZUpWsRu37?=
 =?us-ascii?Q?amIMZqVgaVBk3wnS7LY2CjQAHeaJgSPQXUW17tx/OKnsSqlK6lkszzQhgK5/?=
 =?us-ascii?Q?RrwKi2jjJFljYnBaCsmkWxHlrTd8hgciUb8d62aKxJ3wIPSAT8sLsM3CakBr?=
 =?us-ascii?Q?vbVb6mV5VfttAct+UXVJKGVlAU3gg3rDZd40Yc46tbZrDJ05rBLx/uuz4HjG?=
 =?us-ascii?Q?VovDnriSq/qlYPMqYNKCOdqDUWwFCB/HfaIifHrcaM403czSrLfUkrcGFtqn?=
 =?us-ascii?Q?K/wD49yZXet2h4LnefS0gdiG9BPsxZrrQcermqu0b1rTLVU7kPmkMqDFOH2/?=
 =?us-ascii?Q?N5R5T4drHs4lEI1BbhGQxgvfoKfngYeQujbd+zfLLXaMX7ndd/FJAdeNS10J?=
 =?us-ascii?Q?dElOjmFCiNzFh57yZOjfsoB5dk+jVTenmxak4SBlrMn0aZbzJAYhoQAcxZXb?=
 =?us-ascii?Q?cVqQJr9vmwSKmfHPkrvmmYegx3qYu7w4Q8plMgejMW6tIF4yOxx+x+mU0GsZ?=
 =?us-ascii?Q?Z0F7KzHWSj8k01yVGyQuVf2s2MU4lFGhJt7C0R49wRsi61WhVgmdmx/+HJn7?=
 =?us-ascii?Q?HDujplzpBKZhJolzNkfdcQM+1axqgPbw8TlZMK7tKVLe9VB9kOQIHwhDixXF?=
 =?us-ascii?Q?ns2uQboshtizLZFB1OBvTM9PI0BdY6UTBwp1XCfm/po1XKQZn6Zo6VsTeaJ+?=
 =?us-ascii?Q?+21HtJpfFcsTmIDJfuh9glegSfQIOcfhKHJi5CX3skwJgHXWa6XZBHfBzmLW?=
 =?us-ascii?Q?G1Mouqew/GoCin0VAHvHAY64VI3uy6h0nSebPH49KEbU5mKXnnqcalnbGvtq?=
 =?us-ascii?Q?QVZB2aS1+YURZAS5deLXPTrMS8G8WB/eimXVKqUjL2MOqO/1jYyzJISHIW7f?=
 =?us-ascii?Q?tCqhDO2026F2cW/F5Im7p8k534XlqaCG1+Qog6wdGcczvdXUHLwH9isdhz4W?=
 =?us-ascii?Q?5WcSN6Q71J2PMywnQ5WM38ixFfweO54BYB87LVvz1MuenfdHBQnexkszmGwx?=
 =?us-ascii?Q?fZGAuQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:35:43.1183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0716b948-d4ec-46bc-4ea7-08de54b053ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7013
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Jan 2026 03:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19424

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Ddf1fe238230433ba3e5b731356156e145aa90917..42cf2abb5f42b4e=
8dca8b9df584b816d8a0da7fa
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D1379a8eb9786e78509f67ff8eac658bde5ddc66d..2bae=
13c52d344e96fce42ab8209c068d1e67c944
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D15b58b1dcd0e0a79d83740b81da1a1367f6f3f68..8843c53=
f444321e22f1eaeec0478ffc0a6191203

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 70eeeea3..060a8c87 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "11e6effa9128d62f7fb085f47adbf01a7c4a1134"
+SRCREV_tfa:am62lxx =3D "2efbddd1caaa8c2126261225fdfe333be03c22f1"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 0abf62cd..b85c5cfb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "df1fe238230433ba3e5b731356156e145aa90917"
+SRCREV_uboot =3D "42cf2abb5f42b4e8dca8b9df584b816d8a0da7fa"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 7d0763dd..b1b10aa7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "1379a8eb9786e78509f67ff8eac658bde5ddc66d"
+SRCREV_ARM32 =3D "2bae13c52d344e96fce42ab8209c068d1e67c944"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 91f6c941..4e0825d1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "15b58b1dcd0e0a79d83740b81da1a1367f6f3f68"
+SRCREV ?=3D "8843c53f444321e22f1eaeec0478ffc0a6191203"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


