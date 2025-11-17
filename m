Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D177CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 21:15:43 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1270.1763414128783770114
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 13:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YyPSbW5k;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.61.65, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si73VKZRAF9UKOHwv88qyKBNdWcEdECyPqEUpm/rHOD/5P4WavyJvaBXIpfVvA50Fnoed2drRroPdVzNBfqZndhLj1/3mDi1iil316WvEpJZXxnwhUm0atn23nC/ngAL2U9MAgFlJiOGvyMX5l+KH0eD/PP2IrjpxJHjQz/g2SVnm4QWeEzrlp/9XzzjKsJgW0qCy0IReLhLGLJVKsn+3h7idWt1t3GtbEDAC5KfZVCYpOjOaWU9U3Ny9Ep/b4dpZJYUiMWLO6DRsXelh7Sdh/fAQwIkru+2X9R/8VtMr3M06E4LskgmL+h/Mz2LdnH0RZ+n2q1rsGuaWb4Ayq+KJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbWVgnuGodfy2I3mku8wauZJqBJHqk0J1JuqNgEuF5c=;
 b=x0N9xPYCpdbvm8NGT4SNvHsNTKXZTJ/EHu0PpG3sMKL6V1uz/pJzXPfoQeawPvmVphDJpH+jeBUdJM+XEUUPtolR/v4OqDlt5sYeCtvmHIaaqeMFVXUSHMATlU3LcBDhaNzcP0Fk6bjYfltscfWZSQeIc+6EE6p7Xarzi6pN+DU9arDAJLrxd+J8gUZG9or+EOGZH0QXF2OdhaV4JY1NAuF9n6O+3ROFvIUzLfOVnxoRUXR5YXfqGnu7tmYmmFPQzxE9xcWKNcsMFlD12JtKvoj5i7OEOzKmQT89I1sg98QCbdrh9gSmK92ABy8kGLDMtpVbPrf76iYnm2NtEvlieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbWVgnuGodfy2I3mku8wauZJqBJHqk0J1JuqNgEuF5c=;
 b=YyPSbW5kPwhM5cVyBF75p4erKP/kaZn3keQ32UVZKI1s3w+bDzL2kni7MHv3Ne4EMeAlqZi/n0vCl1Wz3G5E8UUf1STKCq0KlCAbLjOlOz2m9TBDqMmDcZcVbYDiP305NHTEyO0d1kXTmrKJC4cYBuAjf9OHrFL99US1/0lGVGI=
Received: from MN2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:208:120::30)
 by SJ2PR10MB6989.namprd10.prod.outlook.com (2603:10b6:a03:4cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 21:15:26 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:120:cafe::b9) by MN2PR10CA0017.outlook.office365.com
 (2603:10b6:208:120::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 21:15:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 21:15:24 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:15:18 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:15:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 15:15:17 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHLFHqs3118303;
	Mon, 17 Nov 2025 15:15:17 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <rs@ti.com>
Subject: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Mon, 17 Nov 2025 15:15:17 -0600
Message-ID: <20251117211517.785176-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SJ2PR10MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f1d836-bddc-47b2-2be9-08de261e6c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SRzvo+Cc8DiXiEsXL9UjBvspZM2n/ZaLEObAscqKtZE5RNc+841fhUKNyKxH?=
 =?us-ascii?Q?DTCzedn1imcySBBdwVCWzB0Wqh73sgAcZBGhxLduWYbIOS/md1dRbZMBDk0Y?=
 =?us-ascii?Q?5LQG0FJ52vMxcOcDJOsQk66epYgzUNoQtcI7IL28XMyhh0eeY5ikH19U6+vD?=
 =?us-ascii?Q?6FlOsqpxuFuZcJM+6htlu46SO0cEsJh+3lL7mlbhgw+3vxUXPyHpgtA2tJ+j?=
 =?us-ascii?Q?A+RDC1EJtcD7wHOb1wZzd52O0gCcauA59ZSy63nf2jYDQdHU+dCLIU9tEDm8?=
 =?us-ascii?Q?xqYaWK/RGiQEGKOJCMmYWZhsG/rA8TikcO/i3il3BILO1LVncD9zOlrNxard?=
 =?us-ascii?Q?rtVzKWcr+1/HEj2kXUOtF8Ab925WOmULUsyzDvSePH5NGsdrhXJkGZ/HVtgM?=
 =?us-ascii?Q?Pevgy+5rZk5seyIX80rba1z16/v/OjqHLFb8sTyGhR8ORaZkT5/1870JKrsD?=
 =?us-ascii?Q?JKZXdmKoDvm8rJMoAR+trx5Lv8QizLvLnumrS9/9qMI/N9Gxkz/LcE3Tns8z?=
 =?us-ascii?Q?m5/OD9/j0vxq36EhxWPOiTsAePVbjJyaLU2FflLbAfMECTpNEYreZeJYCbuK?=
 =?us-ascii?Q?Taz0VbqSnvRZwPesthVOoS5JCrvUbLmrKMeTYUctbqMlEBYAPaPqJtNX81sw?=
 =?us-ascii?Q?GGUuo894crDPVOrDkcBivDAdXSke47fVSiZ/qLS9U60IzN3dLAbZZ1ka16zz?=
 =?us-ascii?Q?h3r2J7FiiId5On3pydzkEHFrAGhzYghK95Opy0u9cwcwY6G4tL1FSg+leKFu?=
 =?us-ascii?Q?7x4HPl6f65nKOU1kQxvbmF9orLY2uB/nsiZ3vECRoVAn9Q9yhPp8+6rx944L?=
 =?us-ascii?Q?Ws8MFH0Mj1QNDy9iN2EFhG2wrsGqBHeJMhu75U/CCEjla+VeabkoqDLucHDS?=
 =?us-ascii?Q?VJEsc4WgK1TsA0NrxoU46FEI8WzNWbZdc2H4f+Rix59g6duU1Q7HRIBhNAhG?=
 =?us-ascii?Q?d/Bsh19ix9zBTIMsOoqR0SMI7FcusXU1NNCCa3loSsBa94PJllMmX3Vugt6m?=
 =?us-ascii?Q?eR1Lu9CqKcSdoUiAIiKI6b2V2L/eEezO5pfddQlH5ZO1Sd3QcIqnrRmBjWjY?=
 =?us-ascii?Q?qnfUxA+49uYDJXp1wBYYYA+YQvPFngqlHPTOWZ1Fp19EP+pCXZhf/FpiXjOA?=
 =?us-ascii?Q?PHmTpNjocC3v5roK4+a7xQQKCKCZ0NMpfhHAGaC1DaI+N4C1LWFsw2ZuKOUr?=
 =?us-ascii?Q?E+cf/U8VwOZ8fOcbdNO5FkgoUDyST/Bmb3YYqc8kpK9HUpVL3h9r/2wrMFOv?=
 =?us-ascii?Q?KB1Ur5aVqA5pRHGuqIoLX8dXk41jn7gnl8VUks/kI4wcCxEv7CzcguVE6wYn?=
 =?us-ascii?Q?tsiIhQjCBzYkK/iduXBmPtvKkIpBoWhnBe3P/avNs174SVwjPcyo6OCNRV9p?=
 =?us-ascii?Q?DLH5gkRmTnXGUcmbpjHdB6RTqE2qdZsFwWPuthKpwPRXMfqfkqSHn12a88LH?=
 =?us-ascii?Q?ucYb+6NQl/WAzQYwmsmJkaruZkTfhzvgonApNcZwPgjx2OVYrMlFpNmXkwVc?=
 =?us-ascii?Q?d6zj8leVUxdDNzgwYAAmhegNWL8zUIDlAEeJ+yxZ4vITXkZ0riW6w72zizsc?=
 =?us-ascii?Q?ClWT37MOYf7nhspBz78=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 21:15:24.4838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f1d836-bddc-47b2-2be9-08de261e6c98
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6989
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 21:15:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19282

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 25.2. Update BSP configuration files with new
preferred recipe versions.

For the driver recipe, specifically unset the CC variable due to yocto
appending CROSS_COMPILE and CC, resulting in a warning for the
do_compile task:

make[1]: aarch64-oe-linux-aarch64-oe-linux-gcc: No such file or directory

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-beagle/conf/machine/include/beagle-bsp.inc        |  4 ++--
 meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 ++--
 ....6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} | 10 ++++++++--
 ....6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} |  4 +---
 4 files changed, 13 insertions(+), 9 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6=
643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} (83%)
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
index 0ea7bd7b..eaa501c3 100644
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
similarity index 83%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.=
2.6643903.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.=
6850647.bb
index ddb401a5..b2f5e4ea 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643=
903.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850=
647.bb
@@ -17,7 +17,8 @@ BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
=20
-SRCREV =3D "8eaff654a8871118c08cfafe53795f57e3b6b396"
+SRCREV =3D "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
+
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
@@ -29,7 +30,12 @@ TARGET_PRODUCT:j722s =3D "j722s_linux"
 PVR_BUILD =3D "release"
 PVR_WS =3D "lws-generic"
=20
-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUILD=
} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${KBUILD_OUTPUT}" BUILD=3D${PVR_BUILD} PVR=
_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
+
+do_compile(){
+    unset CC
+    oe_runmake
+}
=20
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PVR_=
WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_prefix=
} PREFIX=3D${STAGING_DIR_HOST} modules_install
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_25.2.6850647.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_24.2.6643903.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.2.6850647.bb
index 949c2d5d..e4b95f8e 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.=
6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.=
6850647.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99=
e3baa03de5207e76f"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
=20
-PR =3D "r4"
-
 BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "1ed9ee185cd876200e6747192854015b8e94a7b0"
+SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
--=20
2.34.1


