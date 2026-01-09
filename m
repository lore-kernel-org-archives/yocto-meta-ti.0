Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C19D26D8E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:28:21 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16838.1767983294655375151
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=I6qwEfC8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.66, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbKe8bEIAYs0QcPhpB0kvqHB7c+NaIpQUCqRqNOWK3arULLu0iYCO6Xx2VDJvAefceayEDs98n6AE/Me6+TNgs6EsvMhksmowjoBw77vRtMkdM0c9s3At/iP7HtxkQuqF/mrIKbh+7w03Qz4Sr+4YlhtkF6PrvXajVBz6Yr74Eo7LrGVqtrHPAuplTYiP0yuKLdsDX0prLQcHvS3Ej3rpERYqcH4bvBGuBOVGryuLdQZezzNkVo9pzvtmW5QvMDLhl1xuZ5+irEwTcrWswAN5aYANfTwQbCXygNA4TuoH1daLQ7S2gOffZVqc2hjYNT9lvqU7aOHilWnh5Jkkk12Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DqFpeJ6LKt3FwKL+7/LVO7853d9RZ014CH+wcg6xq0=;
 b=bT3wPjCyHWWfvpHNOT2UJx/PmghEmp5JBLi/gLg1QzWG7UCCbkzLIgKgeyDvlKnZEzXeSGdpBFXQakmON284L5EgLFSfvap4hOuaUt6eS3jWbIgztEujpPu2gGDkhVMMr+7I5t4aJXX0UzbUe3cfMV2qxDg+PD3Kwe7aPtvtTo+ztIquPMKm5Infidks1A3f0fF8Pmo1sJAUT7koN245dEl7XPaNgeJGUzFj2nNrKgzlgh95bnnHrpiDHlIMiGlHKtDgxMuLfrfUN3U0BhAeubMLfIntSgEMZe0M3/ds5sz9d4jUn7Zio+19PsQ4A+vdismT/HO/qLQZtNmpQBov7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DqFpeJ6LKt3FwKL+7/LVO7853d9RZ014CH+wcg6xq0=;
 b=I6qwEfC8mKiTNZuHlZ6Rf/QqWiYrg2Wa9jdhHCCOihWA3zqqBKYvtfctueY4puSoCjv6gDY0Be/kHqRw2fp2ugx/KXDLtekW+Wxq4L41Had10Qe+BDTaOUmd2Kqd07aPlnk6B5DXDTOJBx6RdTMFTiHogqmSqu2XLuav+3qMzqk=
Received: from BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) by
 BY5PR10MB4372.namprd10.prod.outlook.com (2603:10b6:a03:207::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.5; Fri, 9 Jan 2026 18:28:11 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:94:cafe::f9) by BYAPR01CA0060.outlook.office365.com
 (2603:10b6:a03:94::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:27:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:28:10 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:28:10 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:28:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:28:09 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IS9Yl371744;
	Fri, 9 Jan 2026 12:28:09 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veHDV-0000000CTx4-3B7K;
	Fri, 09 Jan 2026 12:28:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-core-initramfs
Date: Fri, 9 Jan 2026 12:28:09 -0600
Message-ID: <20260109182809.2975063-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|BY5PR10MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5f9bf1-14a6-4689-4b3e-08de4facd7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WmgEJQ3l7lmF5DV907UAiLHRISCKy5wRcOmzY+lk6Bh49dFmqIInG8SubUUM?=
 =?us-ascii?Q?NbZDA2SAkEL+Cm/yfVfz/TbWeBvXFrHX2j75KMcAscCcPEZrRDkgoeAx8INo?=
 =?us-ascii?Q?/+ZMokEV4VzzRiKZFnUZxan2xFdSklENcWWC9853EBDSAeKj9Z0Zo69tAjr5?=
 =?us-ascii?Q?877OTjPpX2/IwGwxcGhqtTnOF64nyGIO2dDWc5bCpnOljK4BO47Oha0dnGBB?=
 =?us-ascii?Q?g1FDwdqse9OoAFK9duiPliGxPP4/OyC7XK9ZYqf/arLNXzTIKihUmH2psBhL?=
 =?us-ascii?Q?jQKijzpfKjUMj/NmMAELEJzFdtYPd6AY/j+FVrIn9wR0NGM74zkFaFQ57O74?=
 =?us-ascii?Q?0XdTI2kqnb9y+HIRkk/fzWi8f5ShSBq2u3HgFaxiYHH7OyxCHqi065Xx30xI?=
 =?us-ascii?Q?9NnQdBWKPTz2AEZLWx2Yt4bkyP/G4rjfWhw4v+fXNKK5k3F+chLdcI0UU5Th?=
 =?us-ascii?Q?JNGm18f2syRsI8P4xH0pTaInQRg39EN/0Xkjtzhge+/NZnb1fFTYT7yq0YXE?=
 =?us-ascii?Q?wrhKHC433QGYUzst5gWi8DwxJd7Q5SLm5QDzO73zhaOZ0LI5BoIFyXJ3lwKz?=
 =?us-ascii?Q?Z7x3g2c+/a47alL4UrbMY5ilLKUVOf6y89wH6cueSEoA8W5A4E6MA3CpoioK?=
 =?us-ascii?Q?f7P04fU7HVVfh0XsUhh8wxGAFYTQy3DYHgwPiRH5ckmVy7aNYYb5q6jeB01r?=
 =?us-ascii?Q?7dXvhT360oI7ouCxNmQPM2n0FS+g7x0Ga8gL4TopeR5iUpNTWRpAbjW/4vfa?=
 =?us-ascii?Q?X0vHmfE7bdzPobNiemj+ONMRiIr5yrmvIXIeENzc1sfYJF5vXpIkhcsrPKrP?=
 =?us-ascii?Q?D/pBxIsIv2CSpiGfwjyDzORCmWsuz9ySwSuAUJVQ/dMFxGZNow1EyKGO9vJC?=
 =?us-ascii?Q?VsdTXFlANIDpoNITEHxTUelU7C8ggDEX+vF3DY+m43B4I4YJskWKYxe//Bkx?=
 =?us-ascii?Q?VLIkbRM+k8q4N+dO+4O+aPPgYe2bwxlDsvdKzMtM5+auZRdrqWKxbVAs9hxb?=
 =?us-ascii?Q?0oiq8auCvPHXePTpoKOouWF1GJQygR3XAMgXlSkF2uihFkfQvJqa+UVPB3O8?=
 =?us-ascii?Q?IP0ajETMdlxxnGYLZiNWFMkZPHzcBdW0G+9ScRAdWYosZ6M0XxFki3+yikr4?=
 =?us-ascii?Q?MV+IBscYJE4h5xmVrT5igwvx9uqldOUXaaIqv/+0/iMqqXTqaO13aa3Avw8u?=
 =?us-ascii?Q?ELo7cWsJqxPY8mu+v737/eH2tHW4fTJFKaCLAUy/1Xwi8GcxVAS44f4YyDVH?=
 =?us-ascii?Q?/aJpOLnE4EPSDZPDB2UlLPINM58epM8yQ6eYJo+MnqVoCrvrshNukqquqKAO?=
 =?us-ascii?Q?mQSLGJNsTnTgvWEwF3f+Sgf1lKUJRlXL8Ir8z2ixsPe7OuTss0mR/U65XUY2?=
 =?us-ascii?Q?+QrCZG4HX78psxBSQavFvvTqx1L8YhR9fPQb9d98HVsTCrboZm4a9l7i7Gdc?=
 =?us-ascii?Q?wgQ1gsSiriVWirPDBTF8/cbNyuK32C6hW+6CvLtOEk/TwENArDb0vIGOHEzy?=
 =?us-ascii?Q?qxQofdCirNhJrvPDEQtj9zJrEZJ19hxDkcg2D0g6HB9yJ1HZQ5QHCITcPC91?=
 =?us-ascii?Q?lckRVcdCtzim/tgCi1U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:28:10.5805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5f9bf1-14a6-4689-4b3e-08de4facd7e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4372
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19401

With the 6.18 we are moving to using an initramfs to provide non-default
modules for booting.  So add that override to the machines that need it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc | 5 +++--
 meta-ti-bsp/conf/machine/include/j721e.inc   | 1 +
 meta-ti-bsp/conf/machine/include/j784s4.inc  | 1 +
 meta-ti-bsp/conf/machine/include/ti-soc.inc  | 3 +++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index 08111f82..1fd4a1ac 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,5 +12,6 @@ OPTEEMACHINE =3D "k3-am62x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-tps6594=
-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-tps659=
4-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-tps6594-i2=
c kernel-module-tps6594-regulator kernel-module-tps6594-core"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/=
machine/include/j721e.inc
index 5ec43049..29566dac 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -20,5 +20,6 @@ TI_VXE_VXD_DRIVER:bsp-ti-6_6 =3D ""
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-et=
h-fw-j721e ${TI_VXE_VXD_DRIVER}"
=20
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf=
/machine/include/j784s4.inc
index 6ba427cb..42c95b11 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -14,5 +14,6 @@ OPTEEMACHINE =3D "k3-j784s4"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw ti-e=
th-fw-j784s4"
=20
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf=
/machine/include/ti-soc.inc
index ca182968..74346430 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -33,14 +33,17 @@ BUILD_CORE_INITRAMFS_IMAGE =3D "ti-core-initramfs"
 BUILD_CORE_INITRAMFS_IMAGE_FILE =3D "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz=
"
=20
 BUILD_CORE_INITRAMFS_IMAGE_STEP ?=3D ""
+BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-ti-6_18 =3D "${BUILD_CORE_INITRAMFS_IM=
AGE}:do_image_complete"
 BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline =3D "${BUILD_CORE_INITRAMFS_I=
MAGE}:do_image_complete"
 BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next =3D "${BUILD_CORE_INITRAMFS_IMAGE=
}:do_image_complete"
=20
 do_image_wic[depends] +=3D "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"
=20
 TI_WKS_INITRAMFS ?=3D ""
+TI_WKS_INITRAMFS:bsp-ti-6_18 =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_F=
ILE}"
 TI_WKS_INITRAMFS:bsp-mainline =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_=
FILE}"
 TI_WKS_INITRAMFS:bsp-next =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_FILE=
}"
=20
+IMAGE_BOOT_FILES:append:bsp-ti-6_18 =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FIL=
E}"
 IMAGE_BOOT_FILES:append:bsp-mainline =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FI=
LE}"
 IMAGE_BOOT_FILES:append:bsp-next =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
--=20
2.43.0


