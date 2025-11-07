Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1669ECCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 19:13:35 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7409.1762542814005407363
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 11:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=h/JE4+xE;
 spf=pass (domain: list.ti.com, ip: 52.101.85.50, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcwQ+MdNv9zmY6Mhgbzpk1SMjUb2GW8XKLppvxy+4D+b2Z3gJTjDyUbxDwlIWKzcwY/6VX7gsvevkGQV5aWtFpJBGIMx3rMcDRX7VqXQr0i1Cvw9Ows0B3+E77oyo4rpDHi+dzsJQnTOOiPi1ZHh+9zIdPl9KKrD8X4LqFNs33auW0vcagUpgA+VJ2vURh3dN9j+JnwEMint55MguHvbScU6f3DaTk71k8XPQIObYoBRvfveC77shKqZTVwwBgvLTopQuGEL/AN0/v55kppbchDX3caE+F6wiMDtw6tquLtG6EZimyVb/mPNDVcTmWmvxJlMnKmou8XjLCi6GU6idA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LnfAM/sDbe3aGT6UWUk0JPGgSnNivgMwFSldsqjf98=;
 b=DJnpCZ5WgAonOTY4PA7qs6e8UEJKwCEhNHlWlMAcxrumCz9zo8EoMJSFGiODPYwWcJ75Gjvk1286TldMwzbGw9jKpdhDEU4ItFZYNU0ga/Y0LKQPoP9cVyb+joaYydU9Jea4MgoQHAxLyrboOqcYJeLs9Ualcp/kxU3xZABLi54e00JzvFz4MdFLsQYIKDVfgQFpdYUeIEfls4VA2djPKOr0eqlIm6AxiWWLXRLQGfbKkGs/p/4EYnMWTB5vvlFMs0rlGj88yhEOos1H+qERsH9Rul48CX3aV1TSvF096BZO/QclPYPxJlu/mvqPC4ONCuQSRMqaM+Thec1v1dDv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LnfAM/sDbe3aGT6UWUk0JPGgSnNivgMwFSldsqjf98=;
 b=h/JE4+xEWzFGwSdDamJ6sDhvJ+CSlnUiyaHFGjy5beEvcm0iZ5u+YTySsk5MY3n5o4SCuWDxExTBenoSKvvT7SljZuHqBZusJ3YIV33NMm76E+eck9HdxZrW7mdLkXWmb3ji3ypxC2twuhXwluDepp3KbbC5zLIwhoGFAXirQyW3xd5OWTEdav6K3PVpuv+g6ls8MgMQjxA1bVs4lk4LA8bGC69Y9y/dHADZ9cO7vG6OhjDm0EtLa5KnuBZhHlYrikuETIUCgAHpvvggC2M3t9bxtd5UerAPEen4mw0nKshrDhJyjHQgyNHIwEeAy6/gms+2vy4xmpZpD6Tva8PIgQ==
Received: from CH0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:610:119::35)
 by DM4PR10MB7528.namprd10.prod.outlook.com (2603:10b6:8:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 19:13:30 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::c1) by CH0PR03CA0382.outlook.office365.com
 (2603:10b6:610:119::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 19:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 19:13:29 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:13:26 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:13:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 13:13:26 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7JDQIZ3498196;
	Fri, 7 Nov 2025 13:13:26 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 5D3072A69; Fri,  7 Nov 2025 13:13:26 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511070802
Date: Fri, 7 Nov 2025 13:13:26 -0600
Message-ID: <20251107191326.481781-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DM4PR10MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 709520db-39a5-43b3-2c4e-08de1e31bc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qIY+xkoyQUFf2m4naR+ppgIm+1B/6qTY4LvnNrKBn0DxMLwNMrjedBocByyh?=
 =?us-ascii?Q?ycLOroLNM0+H5IaStwnIyaqbv+7tHwyJbYPTvyWCuPP3HsN5SkHROoQAAsdQ?=
 =?us-ascii?Q?2243W4ATPaq+JnObP0ZbDWtmJA3SKrh0hujPvXCp7PK0ScYbXiiLApSZSe6K?=
 =?us-ascii?Q?6f/jlM9gF/Yg3uiycBiT4IDjS6VtZvA/hRIccqhaEWJlrDMCav6GFu0P9o6Z?=
 =?us-ascii?Q?e1gEI3unRrMw5Z3LaNz1BFSoAvSst9sCHyhHwKPJSzt1myCVw+p4fn+zrCaE?=
 =?us-ascii?Q?hU7raFmoamP19BY9RPQbegl/bupFGKg4yhAtM007r+qUeIOVVMAWC376celv?=
 =?us-ascii?Q?t/R6A9FU0EywMSWTyol+IbO7PTjAd+Az4Y2t2dDL2y7pIVpHdO3ioarORdZA?=
 =?us-ascii?Q?I7/B6cn/Ip9Eues8Mzow4Ge5f/ip70VUkDWzFSS1erCnkyPCLVP7g3+90hy9?=
 =?us-ascii?Q?pnx490FPgdHJJk0ggCOruTos0wASiZ0kxN0V/JqsyRYRVrar6r/ye6247PqG?=
 =?us-ascii?Q?YYqsqp8HBvz8/eQWvK9Q8mtPRLkPTEFrzPC879IraLwV8G5LKTgpHt4PlJas?=
 =?us-ascii?Q?6jpiNrHLSQA5SMct3SheEZMH/A+tS3Hr14zEKoHZn4oE0NvPydshuUKXkLRO?=
 =?us-ascii?Q?NNP1x3qTfP+SYls8EUcbK/F+SANgc9xuG3R76ZHFyk0eahCSlMZFsX+MZw+c?=
 =?us-ascii?Q?vaIFFVMj3D19sDUgGEsdZpHwmLwla67jPc6qYtqY8sdMrLHoXWR7sjj1yyXt?=
 =?us-ascii?Q?kw5+P9ZIW6aa9U/vcLk9Rsq/pV654uzhPY+tpi01koOjBc3aO7iux6sdyZYp?=
 =?us-ascii?Q?k4M/WGYlNblEKXsBYwGY6una7fgb1uSLRC7WLEFRGXiwai3I8bLUbzuVGVn9?=
 =?us-ascii?Q?nBDqgebl6qo4WJKV39fVEgyF2LQBqbBaX5AWkvFPBTQzmz+kUBHegCJiA+Dk?=
 =?us-ascii?Q?MgBxN57rQSN1jBdhzw5X9wKAffWtfnelxI7vcp5lPzofqM0QKH59M1yG3Ton?=
 =?us-ascii?Q?U3dR/WnMRyZIXP1XFxDMqQMnyRJTr7sL0YFDadQtX+8QfYdE0MWPoRQ81l3K?=
 =?us-ascii?Q?HPqgfiiecPgEuHX943ecLKQKZ1T7reVqQV3xRA+Af/0TcjqdQBS9WBei8kbO?=
 =?us-ascii?Q?2Q39MehmxsXjLlzerXs22mPQxEjTXVhwyz9sMCtuP4SbAWuMnwgxGcmCBy0B?=
 =?us-ascii?Q?vJJ5Do2/zFZGNB2Q3ILZ928oCES8VQ8LUTjczQjGycu2eCj1mnlCuUc37t34?=
 =?us-ascii?Q?5Tw/4rvK56ks+ZxlHxNgRx/ll9pwsWH5BBAK6ixIHbOrv7r9BpSAMusZDJ1R?=
 =?us-ascii?Q?BCbNbY6yUAXw+i5z139gr/dM3evzavJIZcJ9r9wiEV3yJGmKYJTsDImSdHSA?=
 =?us-ascii?Q?JjH/4WS9PFj+ZIKP5QuD/m8CX/XH3819C9sRq2VcVIR+U+IKWZmoUrpbfEqE?=
 =?us-ascii?Q?SvUdT02o+/SQAYbVwxIO4F2aDzULnuOkwWS2/SqwW3wSvXjnBH6k/gj6z+FC?=
 =?us-ascii?Q?P0DUeEWR1x6wxFXlKuZoVTP256AYojnp6sgYC+JyneAWea0Mmg+U5926xaNa?=
 =?us-ascii?Q?vR8nigxeIcJYV+wrtAk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:13:29.3252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 709520db-39a5-43b3-2c4e-08de1e31bc3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7528
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 19:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19241

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f..faf2980429e8=
3e502d1a2da907f8be14b131c9fc
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Daa613c2e83299906b121fcf0d6a5824f1d1c3ff9..934cf94788c5050=
68308069903d42f6cdf30c0ae
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3D4612157=
b45912dfc21ef49e364931c5ce3cb27a0..cba7dc13a39191ac18bf64fccbba429faff112b4
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
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb             | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 94a9b06d..8d153b4e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,14 +15,14 @@ CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
 TI_DM_FW_VERSION =3D "11.01.09"
-TI_SYSFW_VERSION =3D "11.02.00"
+TI_SYSFW_VERSION =3D "11.02.03"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f"
+TI_LINUX_FW_SRCREV ?=3D "faf2980429e83e502d1a2da907f8be14b131c9fc"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 526732b1..5367c229 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "9be79f82555404fc89455fe10d7c1bafc182e833"
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
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index f4da2f1f..48dc3e70 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "4612157b45912dfc21ef49e364931c5ce3cb27a0"
+SRCREV =3D "cba7dc13a39191ac18bf64fccbba429faff112b4"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
=20
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
index 3b099221..8f3915cc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "9b2678be3a92ebdbf376000f06636eab8f7c1dd8"
+SRCREV ?=3D "4be12a82ab1650b6313835b4d2fc70848f38dc13"
 PV =3D "6.12.49+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


