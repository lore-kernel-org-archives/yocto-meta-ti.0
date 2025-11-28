Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3593D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 08:58:48 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11942.1764320315010785311
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 00:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aOuaU7T0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.37, mailfrom: m-chawdhry@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxsF0OnSb3CKPN/dmNepWyvItoBwbAcpymQBuNpbRyvjNvcsHUXRNCS35XZeqPwgRZbTIM27/6FA9LgYCvn0wx22JR/nXMEHIOsq/tP4jgzIicMxSraXgOcddQVgVH+4esMVenET6BMOvknyH04aD8+Iy06zwms1IFHWMx+Cz0WiGXxOyh6aNheDyCAg5MdBVq/O+qfMt07dFbhKKi9WPrmS4HZQm9O2SZaY3WlOe31ahGWuLAZqgxNMZ0ryfwCWOASU/pC1W58cmT1ittDrbPzvt+75Dg76rGURPArb7uDJ8yTHNG0dnEpKQ8GF051bG6EHvRMW7hAoFMMAaqqT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BghE4DZi6QTLaVE7rNJD5vPk5Evv/H+1zcB+W/ZXF0s=;
 b=fpaTTtQf/dE7A5/KUyDVDVAXi7vxUNgIkm750hsdn3ePE/ZbM+1WilKM8oA4PS9wMGLQ7IaLQuIbqDpIZ6AfMf70mozVMLjRtFhsTqO/bp/V9JMnqAj077vdyHnaLk5RDrRkiWvFomu7ws5CeANrNDyrb2S8j2AmTe0lLrnva8JgDq3Um2CwOO8NsrtZHk0TYgdwPkPqaep0FjEyhapisypdfqE0oD3lidKOplvkZJfwj3Wv/A5jMUg1HoSXMUjQRm6kpOAe2G7XfKiN0pji1KQU5vnUc22HvkJkAMz5pN6Rtt5BlyvZpDlXjXlhM05fGYIADFR0kEUg9mPh09sukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BghE4DZi6QTLaVE7rNJD5vPk5Evv/H+1zcB+W/ZXF0s=;
 b=aOuaU7T0VSPBVZhP+DDFXKPBMbFaUvhbZQhjk7dWU85l4MMKOnjXjL/VnvuMIhNUSeCT4MmlvTaoNGYkZ5UEKHih4gGOKBMnyWCOKTbvYERRbrT5LpdVx9yESIqVnMkWtv6HJmY5Y3vwZxYMdlIYPeGCUd1vOJpE9GLXKN5zn28=
Received: from MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10) by
 IA4PR10MB8328.namprd10.prod.outlook.com (2603:10b6:208:56c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.15; Fri, 28 Nov 2025 08:58:32 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:23f:cafe::bc) by MN2PR01CA0041.outlook.office365.com
 (2603:10b6:208:23f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Fri,
 28 Nov 2025 08:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 08:58:31 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 02:53:23 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 02:53:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 28 Nov 2025 02:53:23 -0600
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.234.240])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AS8rKNM065337;
	Fri, 28 Nov 2025 02:53:21 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Manorit
 Chawdhry <m-chawdhry@ti.com>, Hari Prasath Gujulan Elango
	<gehariprasath@ti.com>
Subject: [meta-ti][scarthgap][PATCH] meta-ti-bsp: trusted-firmware-a/optee-os: Add LPM support on few platforms
Date: Fri, 28 Nov 2025 14:23:14 +0530
Message-ID: <20251128085314.2671804-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|IA4PR10MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cc1b5c-e65b-49a9-574a-08de2e5c4e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YI/tELdVVZVyZFDRNFHqgtwHQu6OWScXbZvgErL2hpjnQHLwVaBUVUm4nuP/?=
 =?us-ascii?Q?tSObUPWnmzitgNE3dn/LUArZ2mGo+YB0q/k0v/QwAv/Z3pWzPRgcL1zLM3Bf?=
 =?us-ascii?Q?O277RXPQ8WGgHx+cJQceJNgD7IhG6M9un+cNJMiyuQ7y5O2BBSqXUvkF9nKy?=
 =?us-ascii?Q?HSywG2Xc3KiP31OBJeMl/q5PcWjzZiD2Dg3YAOdLVdcN/87ka86h++SiAIXA?=
 =?us-ascii?Q?b0AkyqdUWH79pMILGY4qv5ng003OkXLIfxkFskU6qLPtgYwoSqj4mOUe/9WN?=
 =?us-ascii?Q?nanN0vGtK5Z7FdIwxs8GBBXyJ7POJiit20JLoAA44xRVJfFKT5VgVPlGKAok?=
 =?us-ascii?Q?zfHSlgHwGNnMfJKP9ZHw+cRI1B3r5I8ND5AfhStSA+fterqyy6XXeA/4bsbA?=
 =?us-ascii?Q?Vsco51wjoqiJz6MFF+mecGh8NeEzyHKMcD55Sxs/9Su7rSJcZV127d42wChH?=
 =?us-ascii?Q?XgEcstGoDhSzFQlu1/hiMS3M149Buzx2hNum4oImdOoWilwxzUf1DQIyKXw/?=
 =?us-ascii?Q?g7QqjSh0sjCJyogjBnTA7xnibifh/wA7ggFp6VGYx4vnVxkBhAy1rRysWZme?=
 =?us-ascii?Q?XIrt/m1EyAOA3qmSwdZ9GEBuE5IYXjP47KIgQR/gh1QieoPH70UANl6bjGcN?=
 =?us-ascii?Q?D9RJl/jcGL0dA13mzbybFDWesBdsb5UsbE4vcFp85a5Q1zF6aBSdccQqUpyk?=
 =?us-ascii?Q?tpT9iKyhSvvc0/v5+Vp7/JVtru+zxLWH3efogtqp+Y86yLhE69q7SOLZu7nh?=
 =?us-ascii?Q?OIJXqNbJfI2Lq9Z0l+QNEWcACgYzkoH4ZnavL9LLdReFdm/LgS+WBIn5D5gF?=
 =?us-ascii?Q?y7dem3hDxsSdvSDQ854C1mQsn2ZPrQS4Jkip83rNMJrVIp36a9eD/UsI5Wm4?=
 =?us-ascii?Q?dylq/QnTRk9nDGth3ZgGBRDlpjsEkOitf/aSKELMNW58XcW3/YVJNvccfRD/?=
 =?us-ascii?Q?LngDXRyLfTTHtQ86lfIQFFRBDV9tMi0eNOTy7cja/A2n2zV1p8jl/CGSnRSh?=
 =?us-ascii?Q?4G/vBbbfMyqsIBaQK/aJQCtL+hTYgTntLEaavUND9J0mzjMe65HPLiUkzNkW?=
 =?us-ascii?Q?+H2+z7EH4T+gPhCk+3oHI96CWTxWw5/zQuM67EB9JLGE62jHpJ4UJIzc6Lza?=
 =?us-ascii?Q?r44dITLiGyk+TTq+augd7Jj2C5cFGo3Hql/Mj12ARjZKDx55qo1cgrjLYniE?=
 =?us-ascii?Q?ef/aKPIaqXgy6N0nJ/OBy2PTnTxRFH/36yYCGqNVC0QIFo4+QgscbsxsFJIj?=
 =?us-ascii?Q?BbUs6flAWN0aFuJzQPvLbE8Ljc5QROj4VH5u8zWHtLveIXmKVHyZehS1/FBJ?=
 =?us-ascii?Q?3Pu7DPOn7m95qVrwoct7nEi+PVs72FHlgzDePRkyW2DwwXoZvmcRNKwu0oVj?=
 =?us-ascii?Q?Zhc2bVqqaC4Bdz7In0U5e8Kq5dxSd2wAXBXkDAD84eiXRmy6ltabiyfqNhtV?=
 =?us-ascii?Q?h7xBP8DZyDZ8O8lnzMchwx3nC2wUvMn+/jvErQeTzzGhd2cZnp67Xh0DuaBh?=
 =?us-ascii?Q?jdqtrpLnTZ4DeBcXmupErf2/kFUOP2KohdirZXGAZ792wGbcL+V9/7ngTfKq?=
 =?us-ascii?Q?dDULFmH8l/2bhawtm2A=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 08:58:31.8489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cc1b5c-e65b-49a9-574a-08de2e5c4e5b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8328
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Nov 2025 08:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19303

Adds the required TF-A and OP-TEE patches to enable LPM support on
J7200, J784s4, J742s2.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 .../trusted-firmware-a-ti.inc                 |  20 ++
 ...luster_start_id-depending-on-the-soc.patch | 116 +++++++++++
 ...essage-to-encrypt-tfa-during-suspend.patch | 195 ++++++++++++++++++
 ...uspend-in-case-of-LPM_BOARDCFG_MANAG.patch |  69 +++++++
 .../optee/optee-os-ti-overrides.inc           |  14 ++
 ...Open-TRNG-firewall-for-TIFS-on-all-k.patch |  46 +++++
 6 files changed, 460 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a/0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k=
3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index f188f35ee740..6058c000e865 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platf=
orms
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/trusted-firmware-a:"
+
 PV =3D "2.13+git"
=20
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6eb=
a7b524039e"
@@ -28,3 +30,21 @@ EXTRA_OEMAKE +=3D "${@ 'BL32_BASE=3D' + d.getVar('TFA_K3=
_BL32_BASE') if d.getVar('TF
 EXTRA_OEMAKE +=3D "${@ 'PRELOADED_BL33_BASE=3D' + d.getVar('TFA_K3_PRELOAD=
ED_BL33') if d.getVar('TFA_K3_PRELOADED_BL33') else ''}"
 EXTRA_OEMAKE +=3D "${@ 'K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('TFA_K3_SYSTEM=
_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 EXTRA_OEMAKE:append:ti-falcon =3D " PRELOADED_BL33_BASE=3D0x82000000 K3_HW=
_CONFIG_BASE=3D0x88000000"
+
+SRC_URI:append:j7200 =3D " \
+    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch=
 \
+    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
+    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch=
 \
+"
+
+SRC_URI:append:j742s2 =3D " \
+    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch=
 \
+    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
+    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch=
 \
+"
+
+SRC_URI:append:j784s4 =3D " \
+    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch=
 \
+    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
+    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch=
 \
+"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/=
0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch b/meta-ti-b=
sp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-k3-choose-cl=
uster_start_id-depending-on-the-soc.patch
new file mode 100644
index 000000000000..05d930dd3d38
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-fe=
at-k3-choose-cluster_start_id-depending-on-the-soc.patch
@@ -0,0 +1,116 @@
+From 3de4f871d9bfe29c3862860e494bfa70ba72af3e Mon Sep 17 00:00:00 2001
+From: Abhash Kumar Jha <a-kumar2@ti.com>
+Date: Mon, 20 Oct 2025 11:26:17 +0530
+Subject: [PATCH 1/3] feat(k3): choose cluster_start_id depending on the so=
c
+
+The CLUSTER_DEVICE_START_ID denotes the device id of the A-core cluster.
+It is utilized when powering off the entire cluster.
+
+J7200, J721E and J721S2 have a different cluster_start_id than their
+"generic" counterparts.
+
+Query the JTAG_ID register to get the part id and choose the
+cluster_start_id depending on that.
+
+Upstream-Status: Pending
+
+Change-Id: I44d3ac0ec646c39019e4c0167d34f410015a147a
+Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
+---
+ plat/ti/k3/common/k3_bl31_setup.c |  1 +
+ plat/ti/k3/common/k3_psci.c       | 25 ++++++++++++++++++++++++-
+ plat/ti/k3/include/platform_def.h | 16 ++++++++++++++++
+ 3 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/plat/ti/k3/common/k3_bl31_setup.c b/plat/ti/k3/common/k3_bl31=
_setup.c
+index 1b93dc860..79a9c924c 100644
+--- a/plat/ti/k3/common/k3_bl31_setup.c
++++ b/plat/ti/k3/common/k3_bl31_setup.c
+@@ -20,6 +20,7 @@ const mmap_region_t plat_k3_mmap[] =3D {
+ 	K3_MAP_REGION_FLAT(SEC_PROXY_RT_BASE,   SEC_PROXY_RT_SIZE,   MT_DEVICE |=
 MT_RW | MT_SECURE),
+ 	K3_MAP_REGION_FLAT(SEC_PROXY_SCFG_BASE, SEC_PROXY_SCFG_SIZE, MT_DEVICE |=
 MT_RW | MT_SECURE),
+ 	K3_MAP_REGION_FLAT(SEC_PROXY_DATA_BASE, SEC_PROXY_DATA_SIZE, MT_DEVICE |=
 MT_RW | MT_SECURE),
++	K3_MAP_REGION_FLAT(WKUP_CTRL_MMR0_BASE, WKUP_CTRL_MMR0_SIZE, MT_DEVICE |=
 MT_RW | MT_SECURE),
+ 	{ /* sentinel */ }
+ };
+=20
+diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
+index ec37d9f4c..a443dd851 100644
+--- a/plat/ti/k3/common/k3_psci.c
++++ b/plat/ti/k3/common/k3_psci.c
+@@ -11,6 +11,8 @@
+ #include <common/debug.h>
+ #include <lib/el3_runtime/cpu_data.h>
+ #include <lib/psci/psci.h>
++#include <lib/mmio.h>
++#include <lib/utils_def.h>
+ #include <plat/common/platform.h>
+=20
+ #include <ti_sci_protocol.h>
+@@ -83,6 +85,27 @@ static int k3_pwr_domain_on(u_register_t mpidr)
+ 	return PSCI_E_SUCCESS;
+ }
+=20
++uint32_t get_plat_cluster_start_id()
++{
++	static uint32_t cluster_id;
++	uint32_t part_id, jtag_id_reg;
++
++	if (cluster_id) {
++		return cluster_id;
++	}
++
++	jtag_id_reg =3D mmio_read_32(WKUP_CTRL_MMR0_BASE + JTAG_ID);
++	part_id =3D EXTRACT(JTAG_PART_ID, jtag_id_reg);
++
++	if ((part_id =3D=3D J7200_PART_ID) || (part_id =3D=3D J721E_PART_ID) || =
(part_id =3D=3D J721S2_PART_ID)) {
++		cluster_id =3D J7_PLAT_CLUSTER_DEVICE_START_ID;
++	} else {
++		cluster_id =3D PLAT_CLUSTER_DEVICE_START_ID;
++	}
++
++	return cluster_id;
++}
++
+ void k3_pwr_domain_off(const psci_power_state_t *target_state)
+ {
+ 	int core, cluster, proc_id, device_id, cluster_id, ret;
+@@ -97,7 +120,7 @@ void k3_pwr_domain_off(const psci_power_state_t *target=
_state)
+ 	cluster =3D MPIDR_AFFLVL1_VAL(read_mpidr_el1());
+ 	proc_id =3D PLAT_PROC_START_ID + core;
+ 	device_id =3D PLAT_PROC_DEVICE_START_ID + core;
+-	cluster_id =3D PLAT_CLUSTER_DEVICE_START_ID + (cluster * 2);
++	cluster_id =3D get_plat_cluster_start_id() + (cluster * 2);
+=20
+ 	/*
+ 	 * If we are the last core in the cluster then we take a reference to
+diff --git a/plat/ti/k3/include/platform_def.h b/plat/ti/k3/include/platfo=
rm_def.h
+index db5e31d95..d191781a6 100644
+--- a/plat/ti/k3/include/platform_def.h
++++ b/plat/ti/k3/include/platform_def.h
+@@ -25,6 +25,22 @@
+ #define SEC_PROXY_RT_SIZE	0x80000
+ #endif /* K3_SEC_PROXY_LITE */
+=20
++#define WKUP_CTRL_MMR0_BASE		UL(0x43000000)
++#define WKUP_CTRL_MMR0_SIZE		UL(0x20000)
++#define JTAG_ID			U(0x14)
++#define JTAG_PART_ID_MASK		GENMASK(27, 12)
++
++#define J721E_PART_ID			U(0xBB64)
++#define J7200_PART_ID			U(0xBB6D)
++#define J721S2_PART_ID			U(0xBB75)
++#define J784S4_J742S2_PART_ID		U(0xBB80)
++
++#define JTAG_PART_ID_WIDTH		U(0x10)
++#define JTAG_PART_ID_SHIFT		U(0xC)
++
++/* A-core Cluster Device ID for j721e, j7200 and j721s2 */
++#define J7_PLAT_CLUSTER_DEVICE_START_ID 	U(0x4)
++
+ #define SEC_PROXY_TIMEOUT_US		1000000
+ #define SEC_PROXY_MAX_MESSAGE_SIZE	56
+=20
+--=20
+2.34.1
+
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/=
0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch b/meta-ti-bsp/=
recipes-bsp/trusted-firmware-a/trusted-firmware-a/0002-feat-ti-add-message-=
to-encrypt-tfa-during-suspend.patch
new file mode 100644
index 000000000000..1a0cf0334715
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0002-fe=
at-ti-add-message-to-encrypt-tfa-during-suspend.patch
@@ -0,0 +1,195 @@
+From c79ff3679a4360bb848b01d4036c365533fcf791 Mon Sep 17 00:00:00 2001
+From: Richard Genoud <richard.genoud@bootlin.com>
+Date: Tue, 11 Feb 2025 18:20:17 +0100
+Subject: [PATCH 2/3] feat(ti): add message to encrypt tfa during suspend
+
+At suspend, BL31 with its context will be encrypted by TIFS in DDR.
+Encryption is needed for security matters, so that the BL31 is not
+modified before entering suspend or early at resume.
+
+We only need the encryption function here because the decryption message
+will be send by the R5 SPL at resume.
+
+Also introduce the LPM_ENCRYPT_IMAGE cap signals that FW has the support
+to encrypt the image using the TISCI_MSG_LPM_ENCRYPT tisci message.
+
+This is useful in suspend to ram cases where we would like to
+store the encrypted image of a secure fw instead of the original image
+itself in the DDR.
+
+Check for LPM_ENCRYPT_IMAGE flag in the FW capabilities, and only then
+call encrypt.
+
+Upstream-Status: Pending
+
+Change-Id: I266472da87dd0821493019b2d9853f8886f33811
+Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
+Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
+---
+ drivers/ti/ti_sci/ti_sci.c          | 36 +++++++++++++++++++++++++++++
+ drivers/ti/ti_sci/ti_sci.h          |  7 ++++++
+ drivers/ti/ti_sci/ti_sci_protocol.h | 32 +++++++++++++++++++++++++
+ plat/ti/k3/common/k3_psci.c         | 10 ++++++++
+ 4 files changed, 85 insertions(+)
+
+diff --git a/drivers/ti/ti_sci/ti_sci.c b/drivers/ti/ti_sci/ti_sci.c
+index f0813e5b0..ee5f7166f 100644
+--- a/drivers/ti/ti_sci/ti_sci.c
++++ b/drivers/ti/ti_sci/ti_sci.c
+@@ -1784,3 +1784,39 @@ int ti_sci_lpm_get_next_sys_mode(uint8_t *next_mode=
)
+=20
+ 	return 0;
+ }
++/*
++ * ti_sci_encrypt_tfa - Ask TIFS to encrypt TFA at a specific address
++ *
++ * @src_tfa_addr: Address where the TFA lies unencrypted
++ * @src_tfa_len: Size of the TFA unencrypted
++ *
++ * Return: 0 if all goes well, else appropriate error message
++ */
++int ti_sci_encrypt_tfa(uint64_t src_tfa_addr,
++		       uint32_t src_tfa_len)
++{
++	struct ti_sci_msg_req_encrypt_tfa req =3D { 0 };
++	struct ti_sci_msg_resp_encrypt_tfa resp =3D { 0 };
++	struct ti_sci_xfer xfer;
++	int ret;
++
++	ret =3D ti_sci_setup_one_xfer(TISCI_MSG_LPM_ENCRYPT_TFA, 0,
++				    &req, sizeof(req),
++				    &resp, sizeof(resp),
++				    &xfer);
++	if (ret !=3D 0U) {
++		ERROR("Message alloc failed (%d)\n", ret);
++		return ret;
++	}
++
++	req.src_tfa_addr =3D src_tfa_addr;
++	req.src_tfa_len =3D src_tfa_len;
++
++	ret =3D ti_sci_do_xfer(&xfer);
++	if (ret !=3D 0U) {
++		ERROR("Transfer send failed (%d)\n", ret);
++		return ret;
++	}
++
++	return 0;
++}
+diff --git a/drivers/ti/ti_sci/ti_sci.h b/drivers/ti/ti_sci/ti_sci.h
+index 1f1963274..2afa11317 100644
+--- a/drivers/ti/ti_sci/ti_sci.h
++++ b/drivers/ti/ti_sci/ti_sci.h
+@@ -258,6 +258,11 @@ int ti_sci_proc_wait_boot_status_no_wait(uint8_t proc=
_id,
+  *
+  * Return: 0 if all goes well, else appropriate error message
+  *
++ * - ti_sci_encrypt_tfa - Ask TIFS to encrypt TFA at a specific address
++ *
++ *		@src_tfa_addr: Address where the TFA lies unencrypted
++ *		@src_tfa_len: Size of the TFA unencrypted
++ *
+  * NOTE: for all these functions, the following are generic in nature:
+  * Returns 0 for successful request, else returns corresponding error mes=
sage.
+  */
+@@ -265,5 +270,7 @@ int ti_sci_enter_sleep(uint8_t proc_id,
+ 		       uint8_t mode,
+ 		       uint64_t core_resume_addr);
+ int ti_sci_lpm_get_next_sys_mode(uint8_t *next_mode);
++int ti_sci_encrypt_tfa(uint64_t src_tfa_addr,
++		       uint32_t src_tfa_len);
+=20
+ #endif /* TI_SCI_H */
+diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h b/drivers/ti/ti_sci/ti_sc=
i_protocol.h
+index bdd24622a..a165cda99 100644
+--- a/drivers/ti/ti_sci/ti_sci_protocol.h
++++ b/drivers/ti/ti_sci/ti_sci_protocol.h
+@@ -53,6 +53,9 @@
+ #define TISCI_MSG_GET_PROC_BOOT_STATUS	0xc400
+ #define TISCI_MSG_WAIT_PROC_BOOT_STATUS	0xc401
+=20
++/* TFA encrypt/decrypt messages */
++#define TISCI_MSG_LPM_ENCRYPT_TFA	0x030F
++
+ /**
+  * struct ti_sci_secure_msg_hdr - Header that prefixes all TISCI messages=
 sent
+  *				  via secure transport.
+@@ -160,6 +163,7 @@ struct ti_sci_msg_resp_query_fw_caps {
+ #define MSG_FLAG_CAPS_LPM_STANDBY	TI_SCI_MSG_FLAG(3)
+ #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
+ #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
++#define MSG_FLAG_CAPS_LPM_ENCRYPT_IMAGE	TI_SCI_MSG_FLAG(11)
+ 	uint64_t fw_caps;
+ } __packed;
+=20
+@@ -810,4 +814,32 @@ struct ti_sci_msg_resp_lpm_get_next_sys_mode {
+ 	uint8_t mode;
+ } __packed;
+=20
++/*
++ * struct ti_sci_msg_req_encrypt_tfa - Request for TISCI_MSG_LPM_ENCRYPT_=
TFA.
++ *
++ * @hdr			Generic Header
++ * @src_tfa_addr:  Address where the TFA lies unencrypted
++ * @src_tfa_len:   Size of the TFA unencrypted
++ *
++ * This message is to be sent when the system is going in suspend, just b=
efore
++ * TI_SCI_MSG_ENTER_SLEEP.
++ * The TIFS will then encrypt the TFA and store it in RAM, along with a p=
rivate
++ * header.
++ * Upon resume, the SPL will ask TIFS to decrypt it back.
++ */
++struct ti_sci_msg_req_encrypt_tfa {
++	struct ti_sci_msg_hdr hdr;
++	uint64_t src_tfa_addr;
++	uint32_t src_tfa_len;
++} __packed;
++
++/*
++ * struct ti_sci_msg_req_encrypt_tfa - Request for TISCI_MSG_LPM_ENCRYPT_=
TFA.
++ *
++ * @hdr			Generic Header
++ */
++struct ti_sci_msg_resp_encrypt_tfa {
++	struct ti_sci_msg_hdr hdr;
++} __packed;
++
+ #endif /* TI_SCI_PROTOCOL_H */
+diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
+index a443dd851..c2017666b 100644
+--- a/plat/ti/k3/common/k3_psci.c
++++ b/plat/ti/k3/common/k3_psci.c
+@@ -24,6 +24,7 @@
+ #define SYSTEM_PWR_STATE(state) ((state)->pwr_domain_state[PLAT_MAX_PWR_L=
VL])
+=20
+ uintptr_t k3_sec_entrypoint;
++bool encrypt_image;
+=20
+ static void k3_cpu_standby(plat_local_state_t cpu_state)
+ {
+@@ -282,6 +283,11 @@ static void k3_pwr_domain_suspend_to_mode(const psci_=
power_state_t *target_state
+ 	k3_gic_cpuif_disable();
+ 	k3_gic_save_context();
+=20
++	if (encrypt_image)
++	{
++		ti_sci_encrypt_tfa((uint64_t)__TEXT_START__, BL31_SIZE);
++	}
++
+ 	k3_pwr_domain_off(target_state);
+=20
+ 	ti_sci_enter_sleep(proc_id, mode, k3_sec_entrypoint);
+@@ -347,6 +353,10 @@ int plat_setup_psci_ops(uintptr_t sec_entrypoint,
+ 		ERROR("Unable to query firmware capabilities (%d)\n", ret);
+ 	}
+=20
++	if (fw_caps & MSG_FLAG_CAPS_LPM_ENCRYPT_IMAGE) {
++		encrypt_image =3D true;
++	}
++
+ 	/* If firmware does not support any known suspend mode */
+ 	if (!(fw_caps & (MSG_FLAG_CAPS_LPM_DEEP_SLEEP |
+ 			 MSG_FLAG_CAPS_LPM_MCU_ONLY |
+--=20
+2.34.1
+
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/=
0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch b/meta-ti-b=
sp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0003-feat-k3-handle-su=
spend-in-case-of-LPM_BOARDCFG_MANAG.patch
new file mode 100644
index 000000000000..b91b336e0778
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0003-fe=
at-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch
@@ -0,0 +1,69 @@
+From 470cf022d03e350beab36605d4250944d2c92ffe Mon Sep 17 00:00:00 2001
+From: Abhash Kumar Jha <a-kumar2@ti.com>
+Date: Tue, 28 Oct 2025 23:24:22 +0530
+Subject: [PATCH 3/3] feat(k3): handle suspend in case of LPM_BOARDCFG_MANA=
GED
+
+The J7 platforms support LPM_BOARDCFG_MANAGED capability where the
+low power mode configuration is done statically for the DM via the
+pm-boardcfg.
+
+This is entirely opposite to the case of DM_MANAGED, where the DM fw
+decides the low power mode to enter into.
+
+Introduce LPM_BOARDCFG_MANAGED cap to handle suspend for those
+platforms as well.
+
+Upstream-Status: Pending
+
+Change-Id: Iaa0ab478cbe0db6652f61e9d733c0fddb4bab234
+Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
+---
+ drivers/ti/ti_sci/ti_sci_protocol.h |  1 +
+ plat/ti/k3/common/k3_psci.c         | 13 ++++++++-----
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h b/drivers/ti/ti_sci/ti_sc=
i_protocol.h
+index a165cda99..b83174b0d 100644
+--- a/drivers/ti/ti_sci/ti_sci_protocol.h
++++ b/drivers/ti/ti_sci/ti_sci_protocol.h
+@@ -164,6 +164,7 @@ struct ti_sci_msg_resp_query_fw_caps {
+ #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
+ #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
+ #define MSG_FLAG_CAPS_LPM_ENCRYPT_IMAGE	TI_SCI_MSG_FLAG(11)
++#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
+ 	uint64_t fw_caps;
+ } __packed;
+=20
+diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
+index c2017666b..9cf41b4cb 100644
+--- a/plat/ti/k3/common/k3_psci.c
++++ b/plat/ti/k3/common/k3_psci.c
+@@ -357,17 +357,20 @@ int plat_setup_psci_ops(uintptr_t sec_entrypoint,
+ 		encrypt_image =3D true;
+ 	}
+=20
+-	/* If firmware does not support any known suspend mode */
+-	if (!(fw_caps & (MSG_FLAG_CAPS_LPM_DEEP_SLEEP |
++	/* If firmware is capabale of low power modes */
++	if (fw_caps & (MSG_FLAG_CAPS_LPM_DM_MANAGED |
++			MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED)) {
++		k3_plat_psci_ops.pwr_domain_suspend =3D k3_pwr_domain_suspend_dm_manage=
d;
++	} else if (!(fw_caps & (MSG_FLAG_CAPS_LPM_DEEP_SLEEP |
+ 			 MSG_FLAG_CAPS_LPM_MCU_ONLY |
+ 			 MSG_FLAG_CAPS_LPM_STANDBY |
+ 			 MSG_FLAG_CAPS_LPM_PARTIAL_IO))) {
+-		/* Disable PSCI suspend support */
++		/* If firmware does not support any known suspend mode
++		 * disable PSCI suspend support
++		 */
+ 		k3_plat_psci_ops.pwr_domain_suspend =3D NULL;
+ 		k3_plat_psci_ops.pwr_domain_suspend_finish =3D NULL;
+ 		k3_plat_psci_ops.get_sys_suspend_power_state =3D NULL;
+-	} else if (fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
+-		k3_plat_psci_ops.pwr_domain_suspend =3D k3_pwr_domain_suspend_dm_manage=
d;
+ 	}
+=20
+ 	*psci_ops =3D &k3_plat_psci_ops;
+--=20
+2.34.1
+
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b=
/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 61a74a069886..52aad8a72599 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -1,6 +1,8 @@
 # Use TI SECDEV for signing
 inherit ti-secdev
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
+
 EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
=20
 EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_K3=
_USART') if d.getVar('OPTEE_K3_USART') else ''}"
@@ -76,3 +78,15 @@ RDEPENDS:${PN} +=3D "${PN}-ta"
=20
 # This is needed for bl32.elf
 INSANE_SKIP:${PN}:append:k3 =3D " textrel"
+
+SRC_URI:append:j7200 =3D " \
+    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch=
 \
+"
+
+SRC_URI:append:j784s4 =3D " \
+    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch=
 \
+"
+
+SRC_URI:append:j742s2 =3D " \
+    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch=
 \
+"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drive=
rs-Open-TRNG-firewall-for-TIFS-on-all-k.patch b/meta-ti-bsp/recipes-securit=
y/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.=
patch
new file mode 100644
index 000000000000..a19fe1036470
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open=
-TRNG-firewall-for-TIFS-on-all-k.patch
@@ -0,0 +1,46 @@
+From 00f74ba2ab00088d51e6da3c0eefe50599ef5c82 Mon Sep 17 00:00:00 2001
+From: Prasanth Babu Mantena <p-mantena@ti.com>
+Date: Mon, 3 Nov 2025 12:42:57 +0530
+Subject: [PATCH] plat-k3: drivers: Open TRNG firewall for TIFS on all k3 d=
evs
+
+On k3 devices, TRNG is firewalled to be accessed only by OPTEE.
+
+TIFS needs this for the encryption and decryption services to support
+different low power modes. So, open firewall to TIFS as well.
+
+There is no concurrent usage of TRNG, as TIFS uses TRNG only at suspend
+when OPTEE is down and resume, when firewalls are restored but OPTEE is
+not up yet.
+
+As this is a firewall that required to be shared along with TIFS on all
+devices, making this a common change and open on all devs.
+
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7582]
+
+Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
+Reviewed-by: Manorit Chawdhry <m-chawdhry@ti.com>
+Reviewed-by: Andrew Davis <afd@ti.com>
+---
+ core/arch/arm/plat-k3/drivers/sa2ul.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/core/arch/arm/plat-k3/drivers/sa2ul.c b/core/arch/arm/plat-k3=
/drivers/sa2ul.c
+index c50757b2c..e10bde131 100644
+--- a/core/arch/arm/plat-k3/drivers/sa2ul.c
++++ b/core/arch/arm/plat-k3/drivers/sa2ul.c
+@@ -121,12 +121,7 @@ static TEE_Result sa2ul_init(void)
+ 	start_address =3D RNG_BASE;
+ 	end_address =3D RNG_BASE + RNG_REG_SIZE - 1;
+ 	permissions[num_perm++] =3D (FW_BIG_ARM_PRIVID << 16) | FW_SECURE_ONLY;
+-#if defined(PLATFORM_FLAVOR_am62x) || \
+-	defined(PLATFORM_FLAVOR_am62ax) || \
+-	defined(PLATFORM_FLAVOR_am62px)
+-
+ 	permissions[num_perm++] =3D (FW_TIFS_PRIVID << 16) | FW_NON_SECURE;
+-#endif
+ 	ret =3D ti_sci_set_fwl_region(fwl_id, rng_region, num_perm,
+ 				    control, permissions,
+ 				    start_address, end_address);
+--=20
+2.34.1
+
--=20
2.34.1


