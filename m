Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD40E6BF36
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 19:25:16 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.316.1769801112220814042
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 11:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=QnxYXJqh;
 spf=pass (domain: list.ti.com, ip: 52.101.85.56, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvB6Mh5B6lnEO/HPs7giyM0V7Qb5Got2eRFAK04X91ls7gWl8UW8YbLgz8/HVO7wM6THtwNpWmCW+LnfJXRFzt4/i3+7mEQpAoia3qBMP8sWJCsx50w7UqxWsa7zFrcCOFl9vzfoAWJoDRoXJrqOF7RyLLzneJCVHXRTrwQ5oQhRLu5jl5Rkhhtei8brOpdqjEZ3nMZUkZJierNJ6n+4fDSuE2Y0MWKAeUZxYnzzklzSlls9IFDa8JYDZhymuUkOMyJnAOoUlJtKsBqDozJuwuW7Tchch64P3mqcjRWrX61zhqej907w3aH5GRXBdDKQg/FAY6lRfTGO5JNgPYQuxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7izM1xeH/bYYPCiyw53iW7eLfanncqzEzsMx83nVbc=;
 b=w6UwtQx1Btk5J48tyUWshajjhMrpefhn2HO+Y78TDjZMSoVvRtLKB/kKiCgOYVVjuM31hsM05W/KgPHrUOIf69lp64BkyF0II0IA8Kt5S2euvSPo2lIvROVXctQPmoRx6uxXML7YLoFI+kIfiHNKOzvMYLX5G7k7Yc/sFkXOqnrqBpNnzmwGL4NFTezyOMtWd67ZOHXl/WmIKppavv2WQxnXlAw7rSYLrJBAQgU6WAj9G35XsOTs7WoC6ivHBf2/7U/j0x9D8QtlITLSzGbEFN++oz4OQj7kGoP1h8QfvIwoqW3e38PbU4cdyTtTaIJR75utxTHOQGG+72x1IseNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7izM1xeH/bYYPCiyw53iW7eLfanncqzEzsMx83nVbc=;
 b=QnxYXJqhd3Jc/7ABpNuqL1KVm3SGXm3E6JdKPnTTXrspZWEemPcUYw3tB07jtMBJipKKaAafQgti3JzSerYozI5dS5uhHSJOjHd+7NF5fBrkVGfyzahhN7Biv4MEh+GxJp/hL3eXB2D26FNS0ziyJRUFC0BeEkexjG4J5mopMO8VoboNSiA9pAllUB26TkIGSKa66XYB/im2TgJjys3/GQ8zYb8x5SKBQzLSanLDpsOEtVmW6JVgL2ETuKUwyBCo4DdWa0+rQUdamnULDxG4ln0SDzNBVVciGKjbTPNU/e7P7tUAxY+6NRaxY77wtgPOHMtoOhF4MQa/ohlpM3M7iw==
Received: from SJ0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:a03:333::22)
 by MN6PR10MB7421.namprd10.prod.outlook.com (2603:10b6:208:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Fri, 30 Jan
 2026 19:25:08 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::9a) by SJ0PR03CA0107.outlook.office365.com
 (2603:10b6:a03:333::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 19:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 19:25:05 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:25:02 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:25:02 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 13:25:02 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UJP2HQ2961068;
	Fri, 30 Jan 2026 13:25:02 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id D09A413662F; Fri, 30 Jan 2026 13:25:01 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601300920
Date: Fri, 30 Jan 2026 13:25:01 -0600
Message-ID: <20260130192501.1648188-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb3f9e7-e7d9-43ff-8c77-08de60354622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yh+Sbsg+MA0Hby/TnLLZI/3CZurGTJ8E0tGaDt5JZDvFv+CalkioR+PqvU+Q?=
 =?us-ascii?Q?aEVR+hTNJdaE7lCkymflvLC2mUVe0IfZk1f0LlzzWNIuc8lKjeWCzNh+kPP6?=
 =?us-ascii?Q?GRVykXXcD0sPg3C1f2n6r9DYdgANTSganC3KqD40nU1eqX7ZvCNbz9hM5TkA?=
 =?us-ascii?Q?KIB8kE7IyicAYCx56lfuQ2Ys5Sj87dUhwcw95Z4h8NWhpsswl3ubW86cJO7I?=
 =?us-ascii?Q?vSWfaFUnuSZ2UMA00+wflPBl0ZvKEWIlF/nCAEpkYu1kfM5YQc/VfKQAsjSZ?=
 =?us-ascii?Q?Y9DFXJKHLxVkmg7eWFJdPIfSgDKfCGf4QaKQv/h1kWMlqClUAYuhCmABPz1i?=
 =?us-ascii?Q?4nJDSG8erU3ZGHOa1V26BAxBMKzqa+Do6045DhvR0antZtQA0oVp+1Ne1U/U?=
 =?us-ascii?Q?o/G3iDJlNz5HKL/g6lQJYZGdtwK9DF82+bqyvscKGT49bhZqvvN41Bvl1Kil?=
 =?us-ascii?Q?3ESHcVGHPKy8hSLfeVs2log67RCNwqzW5j1zCy7c3dl4L8I50ucYkvXlS5A7?=
 =?us-ascii?Q?hQ0TA/rEuEKsKDlZM9dNKVJtpTDHoVZbz5fZSEEVg9NJobjOZVFwTbBB4Mge?=
 =?us-ascii?Q?KNGSWz5wF7DDnr6zQJ914xDP6TNGj4PjR76DXWqfJAMjhgqXxkfIYC4CSYh9?=
 =?us-ascii?Q?gqrqXBAiyew+sRacddGy/twJQyWjGx9/uDECDKfLhdZYYMab2r8xyZF3xjjL?=
 =?us-ascii?Q?Pupuo9aO8m20V1TqPJttzduMz+v9BShz2lS95L9fCL5GxGaCbThxtYnPS/MG?=
 =?us-ascii?Q?sNvPFqql/jYPs6ABUYglfGqHpbsu9yN6xbDDusia39YNTHMMiTcVPX/nhqJ3?=
 =?us-ascii?Q?6XIjVhVrNfWujzbdbKD7ajnG8FlpQqtR9LWFRllMk615Ni4k9hGyKKXCEKMW?=
 =?us-ascii?Q?iYHPxj5saJBbHfU2JfNke0yK+5DxZZjJboysgTW68TBbt87mPDVAacn34KtW?=
 =?us-ascii?Q?1jt/ma5+VHPnyHde3zt/9lRHjJkr6ukQQZOEZwg3wB+5RPGXrVhRD2jLP6TN?=
 =?us-ascii?Q?DMuWbMyPcO3UqXycdpTALM/xa5wGlqp6mhpIO1AvXedtItlWqRzELFSIXZYp?=
 =?us-ascii?Q?hUafNHA0LazWHgZ1o31ktoQLI6ykhZs0daJYR4dNOeB6oL2bnUrrbsX+CT78?=
 =?us-ascii?Q?fxJthGsG6n7kqJamssc8zKGofVmDaWyi6gCD8wfVdyhqfu/KcYBvopV4SN/p?=
 =?us-ascii?Q?Gr3MoWM4OSFiDXzqtwpA8Y34uT4L6QEFENcdxS1VLbkS5WGxvWGGU4ijGwLm?=
 =?us-ascii?Q?8qJCaTertjPiEjVW8I95pCNexw1dgHp5h4snNEzf6YftVMEq43iXjFyjg06v?=
 =?us-ascii?Q?meCAM7eAQu/nbQBYB0Sr8Wcg9LymDbZFA7Xn5NcqBvpjLd3t7mqaK16uvYwX?=
 =?us-ascii?Q?Wbl8bCzzQMpwtOWmeMePqSaMKO/VoYdgKBy+RO71zbwP5ENmPcDinj12frlU?=
 =?us-ascii?Q?6w3/OI180qEk+GJ/OCQ5Q3K7xVkAo+0Ku/y+pMwBBOHd8IIgjbFjEz3aTAu2?=
 =?us-ascii?Q?bldKScB7ff7DCWboimMwcAkVowlC9Z4CYiSl1ZdiTVDnRXSfb/lhTanHr63e?=
 =?us-ascii?Q?ZZzBA8eNIzRVz4ICT6qMgrOopuOFVDpDdhN3lvUZbAsx1Nhi/vMNk+ZkJUP7?=
 =?us-ascii?Q?y5uEQvhwLSb+cGNO7bvOU1fvIPompaEjKhsV4subij3rAM0C79yzZWpNI3R/?=
 =?us-ascii?Q?JgwA1w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yNCMawda81FtG1LZijndEo5wsHpBNUlIpZUSM9VhkxSa8oJZnlYMwD/HF5CIDJRluyBnoYOTTxcarxU+xQFhkkd7H8joahrA5x9pHsNcLZ0q7kxGOvQ40C944gsZoKf6d5M+aCE3JxuW0X9EPCywh75iaKwoZYkKQ5G/ER4Ect3AKo19nujkNZ2JQq+LFbNYmmbubUVFKNdzjFTDC8iB/HX5fKs8ZYrhUpesdNCFUkbY6GwRfoqCTP8h2nHegPtaNUF6M00M4a31Bij5w0WQmBhHlAKIL12JE7eBoIAp+thruWGKIMbxefTT0rQzipea2PeGxv1BMrCNMQaf+rW+OseUVPOqe625PtKBLSRYdn8RlYD4EQE6ncD0EfNrFruowOm8VCKSa5Cu9ab4aDsnWZ8nxGvWriNBw75NqX0VfGNnRomFCKd3oBYrzS0aQNd6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:25:05.8011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb3f9e7-e7d9-43ff-8c77-08de60354622
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 Jan 2026 19:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19449

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D42cf2abb5f42b4e8dca8b9df584b816d8a0da7fa..ef2eb76b6504156=
37bd93b0eddfb1e31489117f9
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D2bae13c52d344e96fce42ab8209c068d1e67c944..a3bc=
6dc973a99822f0707b1c9ba06b56bf142076
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D8843c53f444321e22f1eaeec0478ffc0a6191203..da3c0f0=
a33ac00f7138c695a16d90301cf7ec02b

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
index 060a8c87..510940f6 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "2efbddd1caaa8c2126261225fdfe333be03c22f1"
+SRCREV_tfa:am62lxx =3D "b1237f2794c47501d2d5e7d533720ec48c8af20f"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index b85c5cfb..b7fec9e2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "42cf2abb5f42b4e8dca8b9df584b816d8a0da7fa"
+SRCREV_uboot =3D "ef2eb76b650415637bd93b0eddfb1e31489117f9"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index b1b10aa7..5957194c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "2bae13c52d344e96fce42ab8209c068d1e67c944"
+SRCREV_ARM32 =3D "a3bc6dc973a99822f0707b1c9ba06b56bf142076"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 4e0825d1..45db13fc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "8843c53f444321e22f1eaeec0478ffc0a6191203"
+SRCREV ?=3D "da3c0f0a33ac00f7138c695a16d90301cf7ec02b"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


