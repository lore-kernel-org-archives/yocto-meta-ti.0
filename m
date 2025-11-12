Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE92CD3447
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:30:21 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6141.1762975820257260592
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 11:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rM6IUn4l;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.47, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoFQWXVjpPhcjMTk0Dx5pey6uE3B7FXC8J5qhZGsz7LiwzjfGbxyEOToXcYac6Km/rr9l9lA4kMoCJ+/OIj0o4SXyw6WcwLSf3oMaQ14dxQLcx4logAuPz5NQFS9UB7uSEnQ9yQStU0f8TJ5FjsLd1X3MrrkYzXFiChRStZyV3Rg0ehZAvHnjdU5HiYe6uPh9oreTSfJcic2bzByOuC/LsW1+IFDq23ID6vDKbsRyXXpxPS9EpnfcuCfdMVbeuFFgN9T9ZtpPv6lmJD2C3tActnrpsVienEORMNwfsYr4p5RMgB+AkOYuHO/AGoKw1H9VTaD2j8DIU4LmKHm0U2BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3Lv9PWASufapkK74s99mMH0cdytfgXzTABOre4kH6E=;
 b=MtlXGdKFBbMY90cuLDxQ3+1hYxsPXuofwXhXloqLlIG7rozXq+HblwabSF1UoELMgeiCdXsr85FkHpGJUm2ahAOkk/KDsmfJsvftksUyyr8u0hvArqFDtsPfiir1VUa2UwGVh8go2z5NrTArU9PEZhP+x8NGcuQs34UIrBmbkTiysW1VFg0UBNrt++vPGk7mCNq2UZlmdH/BxtQpoWxW8Gam6aPPZM3BlKreekin2X7OMXRz7Z/QBcrXWSDsNPrZqJiIVfCZMONgJ1mWvqLFxZ1nEcJ+2j8hWT3vJlPSgaNyrtZTFzL8CDAnxdk3eAqfy3gGu6XtNhwiV4JruiGF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3Lv9PWASufapkK74s99mMH0cdytfgXzTABOre4kH6E=;
 b=rM6IUn4lw4H4DZZgAmXAAlc+49LvmmohEBxkJXDHGY7NFP3C6xXX0aZLHXolF23t5HL1ZXmSTNW5RCXIo99KjnFfPsy35xhHaZLGCDiM8WKArC9ApcDNeMoTwSYCjqxmaPphFbCD0rljMsChcMLyS/UmDAWNJXtbn1ChcgMWp/E=
Received: from BY5PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:1e0::33)
 by MN6PR10MB8189.namprd10.prod.outlook.com (2603:10b6:208:4f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 19:30:16 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::88) by BY5PR03CA0023.outlook.office365.com
 (2603:10b6:a03:1e0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 19:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:30:14 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:30:05 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:30:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:30:05 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJU5n83189571;
	Wed, 12 Nov 2025 13:30:05 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <rs@ti.com>
Subject: [meta-ti][scarthgap][PATCH v2] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 13:30:05 -0600
Message-ID: <20251112193005.3655764-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|MN6PR10MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a044813-0785-4fa8-a5f1-08de2221e74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qe8ftFqEzY9Cbmb+xrBcPjfBLvv44YszKEgF2fjba+wPB/11/nhoVO8yKjOm?=
 =?us-ascii?Q?L2tF8HyzzR7bWUlSJoyo1rm5e6ahokXKeh0escigxulycBVIRtOIP1wo7cNQ?=
 =?us-ascii?Q?O7MZDTkp3HxhGf62JUm/6SZN+AkQm5t+qn8vwOZbMGqwALYwpxHtZEVot88F?=
 =?us-ascii?Q?7Yv9FwpevTbi74OYO/e0kpmLtEuU0ydH46d3zSjdT9yPZC/YVkSEJF1XB4A3?=
 =?us-ascii?Q?obvoUVLe3RmlF3RYac8WP9WlKz8D/SVIGXLURsmyf8GaRLzx2FubdV+L5Aqq?=
 =?us-ascii?Q?cV5DGiZyh5UcGUUK78edRBeD175FapbysqyGJ1d6/4NCMzVa/PsV9kwsnD8w?=
 =?us-ascii?Q?9sTGF5XIALWV0BKMLqUcnwjvg/pVuSjUZSx44C6VXfRHInF5aJJe6FShDEC1?=
 =?us-ascii?Q?lrh9xsM4vHV3GQCbd04F6EyHpejM6czjxtSK/1F7vo6mskE6k4ytuEwsRWIf?=
 =?us-ascii?Q?5aCot8YQ8yMT2YCYJy/twER2bDA1wmfkgfqZ7Q2IxChCR2YdPv+W5010HhwB?=
 =?us-ascii?Q?xUZCSdwFr8mWbTd8ESBRZytTUPPzZjSmZeidNH4yQhytQ7lVSLvPnNDEnyuT?=
 =?us-ascii?Q?TKBM/yV+x8tVh5lgScFg8zr/CODI1imzIFAyi/LnUpvuhfyi+XFhQo2AwCrE?=
 =?us-ascii?Q?OW6t9/kEE0IOxRuTdOU/2KBVOr/2/b0C9rF9ZA0dpvxlYd2BtxLiQH3Msis7?=
 =?us-ascii?Q?ZJYSGMFl9OjYCls6BpSmcx7ieiXTyaLuyjnmaXqOecYX/t2+a4IcpsgH3ka7?=
 =?us-ascii?Q?4F+mERUz90PpMEOLvn5ER5NkunpNMl1WozVbZe2y7DKazIp7c1SvtSfJELKP?=
 =?us-ascii?Q?Eppx0qxJb+fWCckiXYjcvqc/ojx10gdXWx8VDeg8BYurr+FAkGx3xDqCbu7K?=
 =?us-ascii?Q?nEDP0Nwj0dOXCnOzrBQfadRYQYotbZOqpx8Yz/I9IrkApFqU1IJvJba4WU4Y?=
 =?us-ascii?Q?DaZcF0+GM9Rj7pa07Iot0pwYzZqM5UhUWhB425SKC4g0q3iKVS9yhDMJKrwC?=
 =?us-ascii?Q?hUf6iPE4Qn2VAOkWWySneyhyjCa9A913GI1T1ZYqVZKaK2CIWThK/2Av/hfu?=
 =?us-ascii?Q?ZNXs5sjpTLhBurs8lZQp2g6Qv8b4/bf7KnvNuo2+Nl1YHxG+2/OqVqnESCsZ?=
 =?us-ascii?Q?v1jTk6mw+FXE6I/fW28OpfDFsfqR/pXQYc8XNE7jEFQ/BYs8lLDiJXbmcXMj?=
 =?us-ascii?Q?w69bE5YMbrV9f1Kv2kqYhljd0ulzxFLyETAVIlvECkPqEEBZ2xCA+9EfY+6J?=
 =?us-ascii?Q?050BTP47n7+XkilCTFhn+i5i9h+nXX3E0fmElCUfJHjQmnSle8oOSJZfursl?=
 =?us-ascii?Q?jB65W2gpwZ4VSvzv+yeLmgxfjV/qSGw2VZe8S5NKaTVNEY7r34s1i3mEQ6fj?=
 =?us-ascii?Q?adLHV98hdzcePSozqdFM8CGUIk/pX3omTaaR3zHuYlPnHJ9iT7I98eJFaXO+?=
 =?us-ascii?Q?chr5YjcyM+2p+DvMQhdM1tgPAr9oQCtrauOIUqdGsbXGOdpzTReX2vKPdkq9?=
 =?us-ascii?Q?fsMmk/HTucWpg9Ah6H9qbQNJe86ZYrxruCTLRX3fl1SqiSR5funJuynio9Px?=
 =?us-ascii?Q?+d2YgJqkpU7cd3E7dc4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:30:14.2299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a044813-0785-4fa8-a5f1-08de2221e74b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8189
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 19:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19253

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 25.2. Update DSP configuration files with new
preferred recipe versions.

Recipes regarding DDK 24.2 will still stay present, as scarthgap
supports kernel 6.6 and DDK 24.2 is the latest support.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Removed recipes for 24.2
- Update ti/beagle dsp config files to build 25.2 for kenrel 6.6=20

 meta-beagle/conf/machine/include/beagle-bsp.inc               | 4 ++--
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++--
 ...er_24.2.6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} | 2 +-
 ...bs_24.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6=
643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} (96%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24=
.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} (98%)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/=
conf/machine/include/beagle-bsp.inc
index 448e2086..5060e286 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "25%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
=20
 # GC320 support requires out-of-tree drivers not yet available in bb.org 6=
.12
@@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 =3D ""
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "25%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "24%"
=20
 # GC320 support requires out-of-tree drivers not yet available in bb.org 6=
.6
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index dc0473de..5dc2e19e 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2025.01%"
 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 =3D "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "24%"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "25%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_12 =3D "24%"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 =3D "2024.04%"
 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 =3D "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "25%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "24%"
=20
 # GC320 support requires out-of-tree drivers not yet available in 6.6
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24=
.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_25.2.6850647.bb
similarity index 96%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.=
2.6643903.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.=
6850647.bb
index 513429bd..0f50026a 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643=
903.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850=
647.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-d=
river.git;protocol=3Dhttps;
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "8eaff654a8871118c08cfafe53795f57e3b6b396"
+SRCREV =3D "a838ac0074db640ebd1b64be6364417b1bbca3cd"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_25.2.6850647.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_24.2.6643903.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.2.6850647.bb
index 57f48fec..6dba5d7e 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.=
6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.=
6850647.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=
=3D7232b98c1c58f99e3baa03de52
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
=20
-PR =3D "r4"
+PR =3D "r0"
=20
 BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
+SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
 S =3D "${WORKDIR}/git"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
--=20
2.34.1


