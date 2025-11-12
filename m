Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D18CD3436
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 17:49:59 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3604.1762969792461945206
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 09:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZpEWr0cG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.14, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isViTHjCeiEkFidwnKmxIw0ljUEy+xmWoqRTeXQ2R4Hjz6yRXe80Aj+w0jzqViuCx7r6GA9M4VVLCTj7kK0Z0KTn+BSZSOZOXzc5o2A/g4RegFjPoO4hbl9UKt7bPIvv/yTJ1PDEer64Yjbf3dfl+xCQSaSLuslnCihzA1XRuGCZ6GpK8HMXW6UbGbY+MezZV15Ebj1UrtHx+BwMHwxMexxL/SrLGkCU+qB3jKfuK5luiy7z3aACIl6zzTn+YLmWBwwsLgXJLt4kXCpbSGQukWg+qx8mDui90Hk5++pPLUKOh5f58aCsUMKWsWoai1B1P3hODgS7ZU3FQnfMVMGNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0ifXq9uH1XcJzEQo6fFPQQHDXMiXBgtgSf/q0YF940=;
 b=eL/XG9Yf1ZkiIQ3b0MxkgyiAvH7xbgOc0NtirZPK2FFa6akJ/HOVI3yuF0IkAhO7ybSOMTDnGzDOXTkjFT0Fy8vCh60g2SwSEBpyg9DuHLp9nYeJOh7E8ZXyTyeEjpHTc8eNwOmUgR0X72A0OHQcoR33UonsSVD/CX/aE0PaaniKZ+UXYnvoSEw8sB0cp5mgw/CzGynNOfNRTEVwMTZLfXojUURHTH+zNYMZsg/26xwHH5Qop2u7Nd+oUJDvupRVPyH8d7WY1ymzuNglqhh3zDLf9E/sAhc9JRse40I57LLjRi0gV1YtqgnAQ0G7icO0B5nkDzyS7tv5tIE4YmVlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0ifXq9uH1XcJzEQo6fFPQQHDXMiXBgtgSf/q0YF940=;
 b=ZpEWr0cGlzpF/t1NDmP/hBPbFcp0LxWIS/xOnxMBkLJZS2F3yJ2UqTl3gVumytcoMBiE0Cb/cEPyu0kCpIT6jPqfgjzxvc13CsdDz+giN2Wy1V1U0yBx4x2eYXyN8GHLO/wLijX4ECB1aDZJ1uvlCsch//liPjK2/5YWNv7bXuI=
Received: from IA4P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::9)
 by DM4PR10MB6109.namprd10.prod.outlook.com (2603:10b6:8:b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 17:49:49 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::cf) by IA4P220CA0005.outlook.office365.com
 (2603:10b6:208:558::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 17:49:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 17:49:47 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 11:49:43 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 11:49:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 11:49:43 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACHngZ53111431;
	Wed, 12 Nov 2025 11:49:43 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <rs@ti.com>
Subject: [meta-ti][scarthgap][PATCH] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 11:49:42 -0600
Message-ID: <20251112174942.3548570-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DM4PR10MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 690c8bc7-5190-4d92-8038-08de2213df0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NydyhMd33W2685wQf7OPVfCfisWJ3mqmcrLuLklQEOHei5CYnU7fP60n8q03?=
 =?us-ascii?Q?xOBXjhBPXjGvqmBJ/rMYWj17s3K2Rf+9rfHWl7BXW0HUV1V3iz8z/TuBxfy3?=
 =?us-ascii?Q?LymF/EhNsA5lFEz3qyMMMz4f4ZIwQs3+asAqOcE8LPabuKCRzRnxhYZDya9a?=
 =?us-ascii?Q?9PT5d4h3nGSfErEt1HZjFQnWAB0KNxayRNd73LJlOuZJtQlpaC+M9XwnPVzL?=
 =?us-ascii?Q?zvst8rYKL8s5uJVIaHs9nZ0fC9UEBb5WTM/K06HHpjlPmRe7Zzv7XVMtpiHq?=
 =?us-ascii?Q?b/cPYGOWXqkEE1QUSzAUAkqgToeX03ylC+g7a+JWuMciN6o+7kCvJbuWBnaU?=
 =?us-ascii?Q?dlluJpZM5OYWw82fPPaiP8AaRD1bqK4j/fYLk+WxAUr4cQwP9HjApqG3YMG/?=
 =?us-ascii?Q?grr1c7OzGDqqE/ClYuWBMNSdfk2DgNycuATP97AVjpkUUsyjEklNyEiZL/0C?=
 =?us-ascii?Q?Vio4ZGILuP273ulwdJ4uWZXcqukF36zAlPgE9nAT24GTtlV90Nu1eOjXkczz?=
 =?us-ascii?Q?+1FP3mHLTB94k4mduS4ahynqfajfH0zJADMs2SsZ+m78jlTzXjtK2ThaIP4O?=
 =?us-ascii?Q?93aVOL42vooGCXmJFWMP/qm+OEQqkUgqzZordCjWtRCqnurp4G1yRN4+W+qx?=
 =?us-ascii?Q?+F1dUjMoyJ8GX1zXtgWARY8oMk4yS85BsipmcQcowpX31NjIdlhoxVwpeMrG?=
 =?us-ascii?Q?2AIBecwhRNU4e6UDHrN+XlISO6+w93IGubBv2P5FUESUmc3GRNXrnyX1I3Ag?=
 =?us-ascii?Q?euMhsd0NvBf3LLt8nyP8gcu8kyCR28vMXnDvXwcj3BSJwF5Ag2sq4i8ggHjB?=
 =?us-ascii?Q?6loO1NegfzL5HOYlOBTdE+xBuKaZS7yaun+ekVjMvc4pDu7joP4evYcsbUGq?=
 =?us-ascii?Q?cAVoU1skL9slgWHAMxgWDkjMSoqdgHHC5b76wTQS5mBkj/C+LWVW7GE9cWqp?=
 =?us-ascii?Q?gyFsuECvismWR3CZ7UUW15Zo9Ed6qlRzzMfxTPzRSu16KYBmp/+abPlarwMc?=
 =?us-ascii?Q?YZQt5i8e4Jm3YP/rTOwNIZYLO1qGNehoSLIAr4xL7w8JdeU5xeOEI7NCV4yh?=
 =?us-ascii?Q?827MhGDK2TGmpLJBNT0N7KrSPHMLia9ceGAt7MJ0GT3dXIQwh6ioZ73OK2q+?=
 =?us-ascii?Q?gtWNX+/ZA56A3M9wMoWoMvVeMQW0YpE4Vr3gT7yMcYe0Ho+Wip0ePOJ1ceQN?=
 =?us-ascii?Q?u3Phe4UT/putvsn2cgdjTPswB+8ZurzxtZ+rQq3Ittu/Jhb6dVLmRDlxwOWl?=
 =?us-ascii?Q?IYNVPvh1w616NEedb7kIBqx/Op1uLqNIev+oBBQkXVqHE43qRsflk6hFT55/?=
 =?us-ascii?Q?MminGAkn87KgeKd3lyImgnKBVHpYUL30RZEaEbZbudvDtXnsPRXpQdcDq+W4?=
 =?us-ascii?Q?DjBXk8i7UJYdVD7KLlbDme0upTa4lduy2GqIxPiGfXFn+PyKPM35Sbzmwy+O?=
 =?us-ascii?Q?f5KI2zZsf6dNYmkhbXcaG/9dadr8+V18e9GuWGDswCttaZ46oTyeyuKoxkii?=
 =?us-ascii?Q?49zEVTkUpA2zilO0ulN4p1Ab+PFRaPovcEFCOsV1kLvzdexmQ9HGxSjuqwv5?=
 =?us-ascii?Q?/TfZxdxUIKwr69Tb+4Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:49:47.3861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690c8bc7-5190-4d92-8038-08de2213df0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6109
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 17:49:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19249

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 25.2. Update DSP configuration files with new
preferred recipe versions.

Recipes regarding DDK 24.2 will still stay present, as scarthgap
supports kernel 6.6 and DDK 24.2 is the latest support.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../conf/machine/include/beagle-bsp.inc       |   2 +-
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
 .../ti-img-rogue-driver_25.2.6850647.bb       |  40 +++++
 .../ti-img-rogue-umlibs_25.2.6850647.bb       | 155 ++++++++++++++++++
 4 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_25.2.6850647.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_25.2.6850647.bb

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/=
conf/machine/include/beagle-bsp.inc
index 448e2086..e7788bd5 100644
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
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index dc0473de..fb36cbea 100644
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
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25=
.2.6850647.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_25.2.6850647.bb
new file mode 100644
index 00000000..0f50026a
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850=
647.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoC=
s"
+HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
+LICENSE =3D "MIT | GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D0403=
c7dea01a2b8232261e805325fac2"
+
+inherit module
+
+PROVIDES =3D "virtual/gpudriver"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
+
+DEPENDS =3D "virtual/kernel"
+
+BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
+
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
+
+S =3D "${WORKDIR}/git"
+
+SRCREV =3D "a838ac0074db640ebd1b64be6364417b1bbca3cd"
+
+TARGET_PRODUCT:j721e =3D "j721e_linux"
+TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
+TARGET_PRODUCT:j742s2 =3D "j784s4_linux"
+TARGET_PRODUCT:am62xx =3D "am62_linux"
+TARGET_PRODUCT:am62pxx =3D "am62p_linux"
+TARGET_PRODUCT:j722s =3D "j722s_linux"
+PVR_BUILD =3D "release"
+PVR_WS =3D "lws-generic"
+
+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUILD=
} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PVR_=
WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_prefix=
} PREFIX=3D${STAGING_DIR_HOST} modules_install
+}
+
+RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_25.2.6850647.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_25.2.6850647.bb
new file mode 100644
index 00000000..6dba5d7e
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.=
6850647.bb
@@ -0,0 +1,155 @@
+SUMMARY =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
+HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
+LICENSE =3D "TI-TFL"
+LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58f99e=
3baa03de5207e76f"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
+
+PR =3D "r0"
+
+BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
+SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
+S =3D "${WORKDIR}/git"
+
+TARGET_PRODUCT:j721e =3D "j721e_linux"
+TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
+TARGET_PRODUCT:j742s2 =3D "j784s4_linux"
+TARGET_PRODUCT:am62xx =3D "am62_linux"
+TARGET_PRODUCT:am62pxx =3D "am62p_linux"
+TARGET_PRODUCT:j722s =3D "j722s_linux"
+PVR_BUILD =3D "release"
+PVR_WS =3D "lws-generic"
+
+RDEPENDS:${PN} =3D " \
+    libdrm \
+    ti-img-rogue-driver \
+    ${PN}-firmware \
+"
+
+PACKAGECONFIG ?=3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', ''=
, d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
+"
+
+PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
+PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
+PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
+
+def get_file_list(package_list_var, d):
+    file_list =3D []
+    package_list =3D d.getVar(package_list_var)
+    prefix =3D f"{d.getVar('D')}/"
+    if package_list:
+        for package in package_list.split():
+            package_file_string =3D d.getVar(f"FILES:{package}")
+            if package_file_string:
+                for package_file in package_file_string.split():
+                    file_list.append(f"{prefix}{package_file}")
+    return " ".join(file_list)
+
+EXTRA_OEMAKE +=3D 'BUILD=3D${PVR_BUILD} TARGET_PRODUCT=3D${TARGET_PRODUCT}=
 WINDOW_SYSTEM=3D${PVR_WS}'
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)=
}; then
+        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)=
}; then
+        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)=
}; then
+        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
+            rm -rf ${file}
+        done
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false'=
, d)}; then
+        if [ -e ${D}/lib/firmware ]; then
+            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
+        fi
+    fi
+
+    # clean up any empty directories
+    find "${D}" -empty -type d -delete
+
+    # fix permissions
+    chown -R root:root "${D}"
+}
+
+GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
+VULKAN_PACKAGES =3D "libvk-rogue"
+OPENCL_PACKAGES =3D "libopencl-rogue libopencl-rogue-tools"
+
+PACKAGES =3D " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGE=
S'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKA=
GES'), '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKA=
GES'), '', d)} \
+    ${PN}-tools \
+    ${PN}-firmware \
+    ${PN} \
+"
+
+# Inject variables so that packages don't get Debian-renamed (which would
+# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the generic
+# libgl name to prevent colliding with swrast libs
+python __anonymous() {
+    suffix =3D ""
+    if "-native" in d.getVar("PN"):
+        suffix =3D "-native"
+    for p in (("vulkan", "libvk",),
+              ("gles", "libgles1", "libglesv1-cm1"),
+              ("gles", "libgles2", "libglesv2-2"),
+              ("gles", "libgles3",),
+              ("opencl", "libopencl",)):
+        mlprefix =3D d.getVar("MLPREFIX")
+        fullp =3D mlprefix + p[1] + "-rogue" + suffix
+        mlprefix =3D d.getVar("MLPREFIX")
+        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umli=
bs" + suffix)
+}
+
+# gles specific shared objects
+FILES:libgles1-rogue =3D "${libdir}/libGLESv1*.so*"
+FILES:libgles2-rogue =3D "${libdir}/libGLESv2*.so*"
+RDEPENDS:libgles1-rogue +=3D "mesa-megadriver"
+RDEPENDS:libgles2-rogue +=3D "mesa-megadriver"
+
+# vulkan specific shared objects and configs
+FILES:libvk-rogue =3D "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
+RDEPENDS:libvk-rogue +=3D "vulkan-loader wayland libdrm"
+
+# opencl specific shared objects and configs
+FILES:libopencl-rogue =3D "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
+RDEPENDS:libopencl-rogue +=3D "opencl-icd-loader"
+RRECOMMENDS:libopencl-rogue +=3D "libopencl-rogue-tools"
+FILES:libopencl-rogue-tools +=3D "${bindir}/ocl*"
+DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
+INSANE_SKIP:libopencl-rogue-tools =3D "ldflags"
+
+# optional tools and tests
+FILES:${PN}-tools =3D "${bindir}/"
+RDEPENDS:${PN}-tools =3D "python3-core libdrm ${PN}"
+INSANE_SKIP:${PN}-tools =3D "ldflags"
+
+# required firmware
+FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
+INSANE_SKIP:${PN}-firmware +=3D "arch"
+
+# common libraries
+FILES:${PN} =3D "${libdir}"
+
+RRECOMMENDS:${PN} +=3D " \
+    ${PN}-tools \
+"
+
+INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
--=20
2.34.1


