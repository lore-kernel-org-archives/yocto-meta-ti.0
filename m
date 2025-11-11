Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B95ACCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:00:37 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13469.1762851631858354213
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 01:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=R2vlJnPn;
 spf=pass (domain: list.ti.com, ip: 40.93.195.54, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugFvxQxO04Ssh++pSJHu7WxT/t7i3bG10Sqh/XyC+Gtzmz2P73QhsHHULIoJY/ZvWHRKEtEt7HbYKEIl671pLnhbQbkYzAJJJNN/j8r8Cbg1AnPWH0lNXEyA4wK5T8YYAqEDTH14rVAz3seMQ2FN0S27E56Ig31pwD7ZjRzqYdO577DyiT94GOEviKrm5MjyTeA1EyedDh+r41sCrQmA+Kf65VrzMJ2nII8Dr4stmm/drNjBWiNmAzoiO9QFV04zLRlVlutwt9Hbsc1w9E0k9jPn/vtyvn/0xjUD4vTxqkryM2cDJDJBaiRhWsmEc49NFSD65EpBkrMFKqt7970Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY1K6VXEvr/uEgb5WNXPxNVxHsPGV4Md2lDfjQizheY=;
 b=gQCzAJMeT1q39cBqabbdwDLaFw+FXsv756kCkZwKvyBbY+2LAfmVzQDqRqZ4I1VBkrjYJzEDeJ6FI3qDtZZgh8IDe8kjC6GZPDtT7mzKmYAPGXBw4dNlYZ0NhS+e5dixstldMeAY/OAzfR77Fm28oWaMmri3acAXtDeVY6BEKZxTTdAiw0zCKUoZe9BeqZa1/hxnboHPaXN3aMz+2zez2fE+QHGpdzsC+XRBDahGepjz7/SA1395HH+kViNSgVhvG7zcYyTUXsxjO8QrY0QXbLB0p8HEHUyWOIl+z3x07/XZm0ydTiLxwXyaE9v3JAGIF9X5BdgrCPYCkuczr0P06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY1K6VXEvr/uEgb5WNXPxNVxHsPGV4Md2lDfjQizheY=;
 b=R2vlJnPnFKr7d6e06y8k4tMKf4Izm356pbukK30fC7CuriQOQsdLIlvC4ijhAXrqZTC5CXNuVslxZ7OTGarvSpJBGuEnbsGvGb7mfyUkzknEO82bIcsNMCWPSOTQ1tAgMUPHEFKooFoOX7Qg0X4m0wK3X/eDsaScNQ+I1NU5Ri3mFy7HOUty/BlUyts8o/D9lz9M4sT1VBBztKWfJJpEqPTPu/ylCYHqDreVZCDRHGf2gdDqT/AQlFeCTbAfuNA1eTb7djy/bp93cSR2L5H8+RfEwWkrkFYMZR8qNS76QvDxbG8R/UzZmC6BX1uGTIg8oD8klqKxpr6lk3fuvf1Zig==
Received: from BN0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:408:e5::25)
 by LV3PR10MB7940.namprd10.prod.outlook.com (2603:10b6:408:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:00:28 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::a3) by BN0PR02CA0050.outlook.office365.com
 (2603:10b6:408:e5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 08:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:00:27 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:00:23 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 03:00:23 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 03:00:23 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AB90NAp1741096;
	Tue, 11 Nov 2025 03:00:23 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 313672A69; Tue, 11 Nov 2025 03:00:23 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511110100
Date: Tue, 11 Nov 2025 03:00:23 -0600
Message-ID: <20251111090023.3949505-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|LV3PR10MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: bca66b1b-ea19-482a-3cd6-08de2100c277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5zED7IgCl2YkpKy2l5kHhdUFtwDJ9oEVZUgGbK9TK3uLC6vsrKiTui7AlAvV?=
 =?us-ascii?Q?fsCY36ZL8L2raRf4BRe4BS3RhE1Qnstb0Z6/M6GaEX37IPQx927OpVfX/2bd?=
 =?us-ascii?Q?b1GA3OnzeIcuU1+24kn8BdaGJsAAHk7hRY+u3BUzpYLXdvjh6yVkbq0mpErM?=
 =?us-ascii?Q?r2p195oF4QS225bhBY+f1pIXQwbgBN+inuQv8RaBWEwkMw4BfvT+0yggqM4L?=
 =?us-ascii?Q?eRjGVcFIwX1PwWvaUKDO8ONzEvco1qbOdJm9phQ64Ldh0jCiNf7jMPaZQymK?=
 =?us-ascii?Q?1NW5WGrsB/NW6ISnYD6UUC0b35JjdVRX75LQUCsJiA9QOmVTqx3hVTIa3cDs?=
 =?us-ascii?Q?iIzHVMzjmKyetu8EixWWI8XUW1t7hRFF5+rkJ68Q1ezs0a48n4ar2eCvzdvy?=
 =?us-ascii?Q?1VeXFNsH9v17wDtCVvABqqC1EgKCIXDxfAWms1gNwxsdO0BS4NQ2XfWppA5A?=
 =?us-ascii?Q?XW/wamr6lBW0J1L/tnOvNqY9CboXr5Xwl8zG/YWp34ZB5pl3rUFu1TzZj+lf?=
 =?us-ascii?Q?LUguRJr8TEK6R9G4Y2gXrMbD3b3Ake0wpdCttGJhsFkxSstqXMKIHTL0mi11?=
 =?us-ascii?Q?h5o/Udj1ITnOupj6WaNpqSdSJa4k9iGlJmB76VcdX+wnH95Yr2y6sVl55EGR?=
 =?us-ascii?Q?SFta+hKsLTdtxVfOR+UIP3MhpiG24lxNO3Poc0MAhGT2SdwIQtB7RUfDpktY?=
 =?us-ascii?Q?YHrehKnYre1Qt20eisVBUrns6cRwiqHI6uhw4/L0sq5/15PM4t70iaYds0YJ?=
 =?us-ascii?Q?rp/uM5tIE7T768rex2HADQxt684Kp6EVURcxa+nOzfe9aXGH6aGw0pukQarL?=
 =?us-ascii?Q?99J0PWPf2RqJyyaap9EBCs6I5uAVH98l7pCqOtIE5Lk9NoP4RN8y8SZnla4/?=
 =?us-ascii?Q?/Lb5nu5rcQ9IYvkLt8SeBmTYRgyOg9O2cg64oDntgaNc2X4zXadbveN7DdWN?=
 =?us-ascii?Q?tL2yxYYHdIUU+ztWN82OITRwuXtCQWVOtlNdq0vXRX8LVmn7tysOt9BLHwt1?=
 =?us-ascii?Q?qT9fID4DStUxP3SoZN2V82WDhYjaTnTBB0voycJiLSKyIl7WZWzlyBPWxwAl?=
 =?us-ascii?Q?UlB/GeMdQhtHL9DGzC1DstFJMxvo1puJcLWvbeGgRq77mb9ZhIjeeGvdbroD?=
 =?us-ascii?Q?v8/pNaEzj5NfmMsQtWGmI70uTE5ZlojYO4vf+khBhzKtFOKivsYaOWkTxEu6?=
 =?us-ascii?Q?zhcbaa92MtkjDh5rht23MqM63Q50zKDfRLOTULSBFKiLRXq6a4KSOUf3pljl?=
 =?us-ascii?Q?u7EbrIiNDvcMJSxuzbLkIE7L+n8ldyR6XZIWkvZV/dk2GFu/ogVKWZhBbmUx?=
 =?us-ascii?Q?MTIhznFD5we3LcNTOKMLYXM8jFhzpxtznZaydgFbu2qRJuwGjhuZU2yrvZpn?=
 =?us-ascii?Q?GUrK54SmQC5TzPg5YWvm1sPSXRt4y7rx5j23aH7LRE+Ib09dupGXL95n8vk4?=
 =?us-ascii?Q?9157FZwKJE08CtU21bjTK9WqS1JBY+2xfTvXthSqirQIz0o8kgqJGt/LrWth?=
 =?us-ascii?Q?tj+Yp3kJitaKX/QmOyor2NZcGe3bLsmNa2ZdPOPqJj8n63yJGWJdQWB62BML?=
 =?us-ascii?Q?/IWYLuNzoILaWcXXuqU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:00:27.8281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca66b1b-ea19-482a-3cd6-08de2100c277
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7940
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Nov 2025 09:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19243

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f..faf2980429e8=
3e502d1a2da907f8be14b131c9fc
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Daa613c2e83299906b121fcf0d6a5824f1d1c3ff9..934cf94788c5050=
68308069903d42f6cdf30c0ae
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Da55efe5b7adbb88ee55b67f4f044c2882978d1b5..9989=
27d273b149e4e03abc087965dbfafdec66a2
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D9b2678be3a92ebdbf376000f06636eab8f7c1dd8..4be12a8=
2ab1650b6313835b4d2fc70848f38dc13

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 3e8f0f10..a986faa4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
 TI_DM_FW_VERSION =3D "11.01.09"
-TI_SYSFW_VERSION =3D "11.02.00"
+TI_SYSFW_VERSION =3D "11.02.03"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
=20
-TI_LINUX_FW_SRCREV ?=3D "3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f"
+TI_LINUX_FW_SRCREV ?=3D "faf2980429e83e502d1a2da907f8be14b131c9fc"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 62f992bf..5367c229 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "075e9d21ef52f85a5b455101b55997fd2efd3298"
+SRCREV_tfa:am62lxx =3D "58bfb476c908d4c220d8f0bae88536f457452f06"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 17359591..2815cde2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "aa613c2e83299906b121fcf0d6a5824f1d1c3ff9"
+SRCREV_uboot =3D "934cf94788c505068308069903d42f6cdf30c0ae"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 88c34431..2c3ebf8d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "a55efe5b7adbb88ee55b67f4f044c2882978d1b5"
+SRCREV_ARM32 =3D "998927d273b149e4e03abc087965dbfafdec66a2"
 PV_ARM32 =3D "6.12.49+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 4cdcd36a..5d789dae 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "9b2678be3a92ebdbf376000f06636eab8f7c1dd8"
+SRCREV ?=3D "4be12a82ab1650b6313835b4d2fc70848f38dc13"
 PV =3D "6.12.49+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


