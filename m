Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C023E668A2
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 22:43:13 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28052.1766184188160888509
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 14:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=JsGOOQYK;
 spf=pass (domain: list.ti.com, ip: 52.101.43.10, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vImLuVDnA9pvvuJAu2ax4VwYeqnLtmZ4h/8fYBKMIU2zOzYn+Fagoj1tNxdTljceM0QFzQ1P+qqF+qaKQw1zqGHLW5U8CQzgdJXzVBQ7EfK8k+K55kazAcACC2svfT/oZv0l53s0Wmzf0pflJRYB54uRORun2O8dSlejR7y5Fht4JwVioRhX8yfpv1F4PEf8v/6IMJMvCAQfahRv3+p6+wOdh9ol8j4Tqx+MQfB2ys/ojk2xpGP3MsU49TXK6W9zS8uaT2lUhyT7ZrCAtyHwtosw8EvVmulXFWkbSWQGBV3+lOAaRLZiKhsquO1r4uyExKr0ABe30mMnoRV+axCYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdmTXb0VbWlh7TdJGhYSlvRsmCD81jyZiOaAHH3Vb1M=;
 b=oxM8zA62zQsDO+1Q28K96CBg7Di7UY7KhNCIGDm2BV9k3SZ/mm/O9eDgOrNiRfEU8U42gFS3jUU3ckvdSrosGddDnkvq0wzrBP2zJISgytBh5+hjkxRnffUQIL5q1/nYWvnXb8t+mgCAY5SN3MbeaBhd1q1X1dHx2DLXAXah8c5akoHIgXMJx+nYQXsgI3cm4djkpeJ/FV+BbTq3BJgLlI8ysv9FRU97SYzHaJcWWhZI9ZjrHIofu6GlxhMP0KTDSftKcr0kXFeWK3GNNic9TXSrekmsRMgM+diYUk7y9A4FDlEhNW9zEq5ObRIkeZqrniUaYi6yDPahCyM3G3g8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdmTXb0VbWlh7TdJGhYSlvRsmCD81jyZiOaAHH3Vb1M=;
 b=JsGOOQYKX8nEs2t2h6XKtdnBFbasO25SF3VPZh8Dtx5bX1t0hrHgmsNgjhLdXeXzTfmvVNfmiK2kTBpsSA7vXPbpaoyMIdquSlg3MmPp7mgVBW6I1PVed9ZFwCv3fpfLKAuJSmEAdX/uR+P/2/pUt8zVcNKHYE6EkV4XVKiJfHbxC0Txou86U1GK2/CuVbUnr7IBVBZKsGzIWltpp0nZzDigp57nG9NvcuGE6VZ76/ei7Bkxz1PY12IBTcxswqrBepjjDNYgmEKs3HTU4XG9ajR8qNmRwnsRFRRFLXHJNU2gIC839x4070NeovRgsI0lgMBAPytd45At/CXnRpDPWg==
Received: from BY3PR03CA0025.namprd03.prod.outlook.com (2603:10b6:a03:39a::30)
 by CH2PR10MB4328.namprd10.prod.outlook.com (2603:10b6:610:7e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 22:43:03 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::10) by BY3PR03CA0025.outlook.office365.com
 (2603:10b6:a03:39a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 22:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 22:43:02 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 16:42:58 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 16:42:58 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 16:42:58 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJMgwdU2465646;
	Fri, 19 Dec 2025 16:42:58 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 6B7422A68; Fri, 19 Dec 2025 16:42:58 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202512191404
Date: Fri, 19 Dec 2025 16:42:58 -0600
Message-ID: <20251219224258.3145192-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|CH2PR10MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d095cb6-17a5-408c-9a8b-08de3f4ff7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZXcz3fbGe61EZ93EB7eiscVP6wQ9+K8ReQ7UrGef9PTNeOlvxI+r1gV8D3Ol?=
 =?us-ascii?Q?PtgieziVSw4jAFkLh/pTi43NNUfu2uZX/NNQh/s34MzNQesqXpRaDc1e2Gsn?=
 =?us-ascii?Q?eteV2ZCD+PWBNEQs/A0yHsUWqKF7pLQnOIKAttQswNqsiVJdnvF8KkGUALY9?=
 =?us-ascii?Q?ihX02kS1q5CqSmLltMvDbIcYzEEGxReHmu/mZlaG9Ub42/YRf9LUTFG7/ut9?=
 =?us-ascii?Q?xTM4ocQljmWk46b3i6ymI2gaDAnpeUKtlBB6ndqh+uBrUqHTsl5OxWe9CwKH?=
 =?us-ascii?Q?9xvhRtY1maNReagsOWMi2I03y78h0o/eM5m0yzdnVM9mEHFrIvUPurSBcunH?=
 =?us-ascii?Q?G7RnxgGvvkU/MFUBWN8QutjgfVom6H/tlbnT8zG+cPAZOveNxsfrjtV50eQ5?=
 =?us-ascii?Q?v72F5yXNnBT0HcSpAkjhvXln3kRHAPvjiEio38KYoZRGkZtHoWUCc1+vdHx4?=
 =?us-ascii?Q?ilMSdC/oy7XKRUs9d2oMMh5Ogy4zQ+a905EQT6Edkd0wpU3WOPZMjSf0sKhr?=
 =?us-ascii?Q?II5nc4oG9hpIzm3JwUaKH4FKqR75nBLzIgBzmHlpqh2UlnXi9PbRj02+1zYN?=
 =?us-ascii?Q?4ZyXXRBQ4QRjdzxFm/XvAu75n7MiHVsAL0m7vkr/C+4AdUPyhuzUcxonVDs6?=
 =?us-ascii?Q?uudGlZMC6t4O5/w1VaGbi2pIuK0abVWxYVjyun2ts3dabSXMXmnSrlD8kbNC?=
 =?us-ascii?Q?h15cVLcEPWWqVlC+Ul8JR4RW/vk/udJthjUBxC+gGc7/A+ja2Wj045C4/I8A?=
 =?us-ascii?Q?SANBhpZcu6jsG4tEpQGO5VciRcubwPZFU97rbV8xCSu2fkdEq2BrLzxYoVDA?=
 =?us-ascii?Q?18vCRW0kRU0X+YUWkF4QOaxcoARKvGwPzYj8P1+RqED3bNtVUdJYVS8M7icK?=
 =?us-ascii?Q?gfnjALWFl+BrmTpFRzIhxwlsKU60k8DSbJBBxsP06zdG2OMyomtuUF8B01F1?=
 =?us-ascii?Q?TiqGA/SMx8vKlmoZGItvgvl09vgrD7j5dSlHUi5xb9izGGDvr7/nbyaXuYmU?=
 =?us-ascii?Q?rBCYTs8lcquhoAN0UtxbRi9jAM8oBAyLsMXukZKeOLeS9x4bo7HJ9BR0rqHd?=
 =?us-ascii?Q?AAAMihG8371KxU7gnMnc1TCnAuvkPxJoTKPYJ2EIjLEqPZTo6Koup2cW0+fv?=
 =?us-ascii?Q?bwhkthbjChPMiUdKR5KVv7QHV/1GOlQdY5mGoo9fzgpaWCHuy2VQx/7Cbeir?=
 =?us-ascii?Q?9pvDE+EHPji5P2CsNWPuWkYnj/HS5eaaPPKZrU5yQleloy/Zj0YCOEGtv2kx?=
 =?us-ascii?Q?HeInx7HKfR5oUgAjD2CTrlzoR/cRhkQUlAAX2qpLlS773pPK70UMBdGdhZzP?=
 =?us-ascii?Q?KdX4a5MPxyBevboONp3vJ316oKhyvf4OwP6ij85Ff+N8cMgiG3/rzwHaWptf?=
 =?us-ascii?Q?OySsFZP2nMrM0emqj316zQ0X78V/zvyYYBj47JHoTEfuJqHY9zxU/bJkVv7p?=
 =?us-ascii?Q?J4yfKgxHdYuJftXZc6SEhOsGqbg5VczjaBnUo6e+mIRDaKt6hw3i0828pkpN?=
 =?us-ascii?Q?CXcbjXGuUKA5hBh6NsAjORyKJ9QLEAegV/1jmUcOfT3f+MMhu92bVT1DCLle?=
 =?us-ascii?Q?Sem/xUGZOL3tVlS9oiA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:43:02.4303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d095cb6-17a5-408c-9a8b-08de3f4ff7c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4328
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 22:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19380

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Db5f45f14e23b927f3ab1f4e00c58eacb47b01d31..8ec0c42b8ccf=
2c9e8bebfd7c4e03d93fed555442
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D3f3051bacd384bf331193070c29053d781296ab0..afb6e41006ca880=
67397873e015a21adaf31fd06
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3Dcba7dc1=
3a39191ac18bf64fccbba429faff112b4..4e3a44c4b961831f2de80606942dd0d8eb508eca
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D1db5d0126012c7a0b82eff330f9f8a68b3d10f19..2a44=
0e3d83789c8220b722e077255a89d826e48a
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D2d5f05489a39201c2fcf95d2dc04af57b6f7f356..ee0a0f4=
4964f12d6668a14b4b0b3594ce2ab8871

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f728ca92..df200716 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
=20
-TI_LINUX_FW_SRCREV ?=3D "b5f45f14e23b927f3ab1f4e00c58eacb47b01d31"
+TI_LINUX_FW_SRCREV ?=3D "8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 05cc6987..70eeeea3 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "76800058f24e3eb3fcacdb12106a881ae279f8c3"
+SRCREV_tfa:am62lxx =3D "11e6effa9128d62f7fb085f47adbf01a7c4a1134"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 8c0a523b..926f27d7 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "3f3051bacd384bf331193070c29053d781296ab0"
+SRCREV_uboot =3D "afb6e41006ca88067397873e015a21adaf31fd06"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index cfacaec6..95974a17 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "cba7dc13a39191ac18bf64fccbba429faff112b4"
+SRCREV =3D "4e3a44c4b961831f2de80606942dd0d8eb508eca"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index bbb52786..6155e0b4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "1db5d0126012c7a0b82eff330f9f8a68b3d10f19"
+SRCREV_ARM32 =3D "2a440e3d83789c8220b722e077255a89d826e48a"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index c5563d1e..9eb3780e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "2d5f05489a39201c2fcf95d2dc04af57b6f7f356"
+SRCREV ?=3D "ee0a0f44964f12d6668a14b4b0b3594ce2ab8871"
 PV =3D "6.12.57+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


