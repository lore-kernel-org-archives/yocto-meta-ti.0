Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7BDFC5908
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:42:28 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65531.1772091744303633615
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 23:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=g/jAWe5y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.28, mailfrom: m-chawdhry@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRJVd5uP54QA08QPwol6YrQBp8lExdtyR/aRSgNekFFfOJRNa8rWzPfC6Pn2Rgox4xPlShko3UwQSOsMId9OaabceWQ6dqfcsE51JICpuQcxd716LEbkoGI/Rq/mK3nz2se7TpLPLCl+RW1rWAFTCZmdK3xeggWA5UjPmh08g7XquHu+nP4YMCcSgzSpdUIq46X3qKrMuPXL+MdIa8LWzf0m1irvEoGhMJ4SJ2VBUJgnLHDn2PnIL5B0kqw/7gMHqsMRJW0E4HiCszIeTnOfaNQOBpdqKG9oWCsVCiiXtMZB3G9jin8J/FPtXw6kXIrOB+zWjPD4CEjRTnkDqwzkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHcMgp+03njskPPvOEvkMS3iXKhjYohpanFNqjWZz/Y=;
 b=si8cjU/JIDEO320gM4dhrBMYP2CCx2Q81YBqGX4Nw5ZsRhXZ7pTRfxzdLUFD/w1Uc6HCNqv2FIh2rnod02MLY91oqtzCNgOvG4Lut6JPein68mJ+hcuoUrWmfFLMr3AfaXJNIul7vuFXUBoqAJk+v2jc+/+67KPk5KVEBjkq64qaJ+XvO6ge/mjiNlJzvzSlMSJk9EQRQDxbi+oiclO7k0eK8wVKSxEZSA4XjMa0WLGulmK7jg6aClFySBGEgAXbitZ3TwVgSn2k+VtZ0su2VcaTjAhVU1/4SIwDGvDy2yCLUugQ69/YmpYsKvFJHuxHZoD1+RF5EN/g/PL99gZWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHcMgp+03njskPPvOEvkMS3iXKhjYohpanFNqjWZz/Y=;
 b=g/jAWe5yg8jxMGM8csjQUhEv6LT6Atc+TVUkNbyBzQu20opGDQQ0Y9GKsjNa26jCFfJ4r3EpVYSVM+67STa61DCSqgGdWTez5OCDNAIeyPQTOEwH/4DzI0jtwKf9Q2yukbha7c/FmyxVGbXm2A0mPmetltlgd9SfvyS67Dci+OU=
Received: from PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::17)
 by CH0PR10MB4953.namprd10.prod.outlook.com (2603:10b6:610:de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 07:42:19 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::38) by PH5P220CA0002.outlook.office365.com
 (2603:10b6:510:34a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 07:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 07:42:18 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:42:11 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:42:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 01:42:11 -0600
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [10.24.50.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61Q7g8NW1482194;
	Thu, 26 Feb 2026 01:42:08 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Manorit
 Chawdhry <m-chawdhry@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>, Suhaas
 Joshi <s-joshi@ti.com>
Subject: [meta-ti][master][PATCH] trusted-firmware-a: Update to 2.14+
Date: Thu, 26 Feb 2026 13:11:39 +0530
Message-ID: <20260226074139.183140-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|CH0PR10MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: d0542934-52d0-40ea-b4a8-08de750a91c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	QZO0aKlzRyNK4qKJd6ijkQcbtZ7kQDfn+ccCNnYwPAerXWkg4gg2ogR7uO4Mmq0yCOROhF1/lwGNyofNvcb9/I0N4tkJTDC1jQy11TU10WzIazJ+zcnJJ8XRNT0KIzKnsJo/DsAcm73Z/F6SFRsw6AubBDLkyBjrjh8l2UT86sMr/fzcsVJLyC6SyyQjBwa4w8+e/cjnbtymV+c4H907hiCNg1Crrt0/Me90hhWkojZ3EtT7tJOItBxc6yt8/HMgJRdYo1WngNNouBwI3sJ+dYQC+pkhnYdutXHwC06lLPAh8HphhKcWfUACitRbKzIZiQBsPQVuKUW/A0T7B9P6/gxySKcQhGr18GjYgGwFdIPL3RUnwtCa7lZFNnXMfsJN2r4GRXjgVlY+E35bg4kvL5/kiclnLrCQIllDDg5PuK0CJUj0C6ozy1Vch7JDs7l74gZwFAsvgAftKrVIWY/W5U5UsEAoY1bJ0YJNhjfY7PKnwNGsP061v/Soj8l2sq9siqT5C2Y7DEzKCrH8hnI/a9UGG3/zlb/PMLFGZEf+pbVt7IJYfCp9G5X1s822l4Joo0B10zONLdwzjGibPT1zhB8GazUkuYh5KhMOAmdA/tHH1i8IzP81/uEjfcyqlaQMUxOghL/Ncr5gfiplDbDuW7NiX+oYD46X9Z+clnXx73kistlGWyDiJmkdq+woxR+aToQWoEgj4IiRXUJr3S9VYwLRpBIu20X1tA6pIyHfbuG51ifA5xb6/3CXEGt4N1/p3UUB56h96WTLrUbXefmBQlvISkWpOjleVVZQZIE1iQ7n/K9l2MgBp2j45xIdjuegtCedFHyS+J2QDnrWQq/U8Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	g6IXaUUApYyKvrWeXWUb1qkHt/JiWHuCi+OUpb9HKnHHMON8X0QE2DuxhZceoprB5l0EsKiFbvFeKUbBv8S8K+AwCy39WHRpQCnzKzqilbo6aK0xpwpbJRmJRV8FwfL3cz1NoMkjf7vP/eHqWvtpaf42sAhwNkWyfCM1MyxFhr9FNLralIMPzbc+ra1eI2zavXsTljufYV2bE7VnJXnBmVj8Aksa7noo0LsYZJyUZilfUqZbHxaB7DKz+RvKNcuHbKNiIdC0hs1+7WovJpA3DOSzFAVoGxwc1+YhmriZhNaKGCe9XTW0Ymrx+XTSWGlHDJhHfaLzbaPsoqaeVRmpweIM+igMWW4ySYuM+FvbMk7fsZ4+0RlWknshl94S5bn02RIFGDNUFdejg+npRszpkdUbfkm9sfOc3yjmq+3BZ98zNAGg3L8QroNDSpD+/wJ8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:42:18.7953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0542934-52d0-40ea-b4a8-08de750a91c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4953
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Feb 2026 07:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19613

Updates trusted-firmware-a to a commit with the LPM patches and removes
them from yocto.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 .../trusted-firmware-a-ti.inc                 |  15 +-
 ...luster_start_id-depending-on-the-soc.patch | 115 -----------
 ...essage-to-encrypt-tfa-during-suspend.patch | 194 ------------------
 ...uspend-in-case-of-LPM_BOARDCFG_MANAG.patch |  68 ------
 4 files changed, 2 insertions(+), 390 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch
 delete mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch
 delete mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a/0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index f1a6eec17d41..f830e1815ab0 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -2,10 +2,10 @@
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/trusted-firmware-a:"
=20
-PV =3D "2.13+git"
+PV =3D "2.14+git"
=20
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6eb=
a7b524039e"
-SRCREV_tfa =3D "e0c4d3903b382bf34f552af53e6d955fae5283ab"
+SRCREV_tfa =3D "76500ceaeefcda967d8a1f4e30bb04f9fe0425a2"
 SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.org/TF-A/trusted=
-firmware-a.git;protocol=3Dhttps"
 SRCBRANCH =3D "master"
=20
@@ -30,14 +30,3 @@ EXTRA_OEMAKE +=3D "${@ 'BL32_BASE=3D' + d.getVar('TFA_K3=
_BL32_BASE') if d.getVar('TF
 EXTRA_OEMAKE +=3D "${@ 'PRELOADED_BL33_BASE=3D' + d.getVar('TFA_K3_PRELOAD=
ED_BL33') if d.getVar('TFA_K3_PRELOADED_BL33') else ''}"
 EXTRA_OEMAKE +=3D "${@ 'K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('TFA_K3_SYSTEM=
_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 EXTRA_OEMAKE:append:ti-falcon =3D " PRELOADED_BL33_BASE=3D0x82000000 K3_HW=
_CONFIG_BASE=3D0x88000000"
-
-# LPM support patches for Jacinto platforms (J7200, J742S2, J784S4)
-TFA_JACINTO_LPM_PATCHES =3D " \
-    file://0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch=
 \
-    file://0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch \
-    file://0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch=
 \
-"
-
-SRC_URI:append:j7200 =3D " ${TFA_JACINTO_LPM_PATCHES}"
-SRC_URI:append:j742s2 =3D " ${TFA_JACINTO_LPM_PATCHES}"
-SRC_URI:append:j784s4 =3D " ${TFA_JACINTO_LPM_PATCHES}"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/=
0001-feat-k3-choose-cluster_start_id-depending-on-the-soc.patch b/meta-ti-b=
sp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-feat-k3-choose-cl=
uster_start_id-depending-on-the-soc.patch
deleted file mode 100644
index ad3b8fbf1358..000000000000
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0001-fe=
at-k3-choose-cluster_start_id-depending-on-the-soc.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 3de4f871d9bfe29c3862860e494bfa70ba72af3e Mon Sep 17 00:00:00 2001
-From: Abhash Kumar Jha <a-kumar2@ti.com>
-Date: Mon, 20 Oct 2025 11:26:17 +0530
-Subject: [PATCH 1/3] feat(k3): choose cluster_start_id depending on the so=
c
-
-The CLUSTER_DEVICE_START_ID denotes the device id of the A-core cluster.
-It is utilized when powering off the entire cluster.
-
-J7200, J721E and J721S2 have a different cluster_start_id than their
-"generic" counterparts.
-
-Query the JTAG_ID register to get the part id and choose the
-cluster_start_id depending on that.
-
-Upstream-Status: Pending
-
-Change-Id: I44d3ac0ec646c39019e4c0167d34f410015a147a
-Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
----
- plat/ti/k3/common/k3_bl31_setup.c |  1 +
- plat/ti/k3/common/k3_psci.c       | 25 ++++++++++++++++++++++++-
- plat/ti/k3/include/platform_def.h | 16 ++++++++++++++++
- 3 files changed, 41 insertions(+), 1 deletion(-)
-
-diff --git a/plat/ti/k3/common/k3_bl31_setup.c b/plat/ti/k3/common/k3_bl31=
_setup.c
-index 1b93dc860..79a9c924c 100644
---- a/plat/ti/k3/common/k3_bl31_setup.c
-+++ b/plat/ti/k3/common/k3_bl31_setup.c
-@@ -20,6 +20,7 @@ const mmap_region_t plat_k3_mmap[] =3D {
-	K3_MAP_REGION_FLAT(SEC_PROXY_RT_BASE,   SEC_PROXY_RT_SIZE,   MT_DEVICE | =
MT_RW | MT_SECURE),
-	K3_MAP_REGION_FLAT(SEC_PROXY_SCFG_BASE, SEC_PROXY_SCFG_SIZE, MT_DEVICE | =
MT_RW | MT_SECURE),
-	K3_MAP_REGION_FLAT(SEC_PROXY_DATA_BASE, SEC_PROXY_DATA_SIZE, MT_DEVICE | =
MT_RW | MT_SECURE),
-+	K3_MAP_REGION_FLAT(WKUP_CTRL_MMR0_BASE, WKUP_CTRL_MMR0_SIZE, MT_DEVICE |=
 MT_RW | MT_SECURE),
-	{ /* sentinel */ }
- };
-
-diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
-index ec37d9f4c..a443dd851 100644
---- a/plat/ti/k3/common/k3_psci.c
-+++ b/plat/ti/k3/common/k3_psci.c
-@@ -11,6 +11,8 @@
- #include <common/debug.h>
- #include <lib/el3_runtime/cpu_data.h>
- #include <lib/psci/psci.h>
-+#include <lib/mmio.h>
-+#include <lib/utils_def.h>
- #include <plat/common/platform.h>
-
- #include <ti_sci_protocol.h>
-@@ -83,6 +85,27 @@ static int k3_pwr_domain_on(u_register_t mpidr)
-	return PSCI_E_SUCCESS;
- }
-
-+uint32_t get_plat_cluster_start_id()
-+{
-+	static uint32_t cluster_id;
-+	uint32_t part_id, jtag_id_reg;
-+
-+	if (cluster_id) {
-+		return cluster_id;
-+	}
-+
-+	jtag_id_reg =3D mmio_read_32(WKUP_CTRL_MMR0_BASE + JTAG_ID);
-+	part_id =3D EXTRACT(JTAG_PART_ID, jtag_id_reg);
-+
-+	if ((part_id =3D=3D J7200_PART_ID) || (part_id =3D=3D J721E_PART_ID) || =
(part_id =3D=3D J721S2_PART_ID)) {
-+		cluster_id =3D J7_PLAT_CLUSTER_DEVICE_START_ID;
-+	} else {
-+		cluster_id =3D PLAT_CLUSTER_DEVICE_START_ID;
-+	}
-+
-+	return cluster_id;
-+}
-+
- void k3_pwr_domain_off(const psci_power_state_t *target_state)
- {
-	int core, cluster, proc_id, device_id, cluster_id, ret;
-@@ -97,7 +120,7 @@ void k3_pwr_domain_off(const psci_power_state_t *target=
_state)
-	cluster =3D MPIDR_AFFLVL1_VAL(read_mpidr_el1());
-	proc_id =3D PLAT_PROC_START_ID + core;
-	device_id =3D PLAT_PROC_DEVICE_START_ID + core;
--	cluster_id =3D PLAT_CLUSTER_DEVICE_START_ID + (cluster * 2);
-+	cluster_id =3D get_plat_cluster_start_id() + (cluster * 2);
-
-	/*
-	 * If we are the last core in the cluster then we take a reference to
-diff --git a/plat/ti/k3/include/platform_def.h b/plat/ti/k3/include/platfo=
rm_def.h
-index db5e31d95..d191781a6 100644
---- a/plat/ti/k3/include/platform_def.h
-+++ b/plat/ti/k3/include/platform_def.h
-@@ -25,6 +25,22 @@
- #define SEC_PROXY_RT_SIZE	0x80000
- #endif /* K3_SEC_PROXY_LITE */
-
-+#define WKUP_CTRL_MMR0_BASE		UL(0x43000000)
-+#define WKUP_CTRL_MMR0_SIZE		UL(0x20000)
-+#define JTAG_ID			U(0x14)
-+#define JTAG_PART_ID_MASK		GENMASK(27, 12)
-+
-+#define J721E_PART_ID			U(0xBB64)
-+#define J7200_PART_ID			U(0xBB6D)
-+#define J721S2_PART_ID			U(0xBB75)
-+#define J784S4_J742S2_PART_ID		U(0xBB80)
-+
-+#define JTAG_PART_ID_WIDTH		U(0x10)
-+#define JTAG_PART_ID_SHIFT		U(0xC)
-+
-+/* A-core Cluster Device ID for j721e, j7200 and j721s2 */
-+#define J7_PLAT_CLUSTER_DEVICE_START_ID 	U(0x4)
-+
- #define SEC_PROXY_TIMEOUT_US		1000000
- #define SEC_PROXY_MAX_MESSAGE_SIZE	56
-
---
-2.34.1
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/=
0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch b/meta-ti-bsp/=
recipes-bsp/trusted-firmware-a/trusted-firmware-a/0002-feat-ti-add-message-=
to-encrypt-tfa-during-suspend.patch
deleted file mode 100644
index 09e699996035..000000000000
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0002-fe=
at-ti-add-message-to-encrypt-tfa-during-suspend.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From c79ff3679a4360bb848b01d4036c365533fcf791 Mon Sep 17 00:00:00 2001
-From: Richard Genoud <richard.genoud@bootlin.com>
-Date: Tue, 11 Feb 2025 18:20:17 +0100
-Subject: [PATCH 2/3] feat(ti): add message to encrypt tfa during suspend
-
-At suspend, BL31 with its context will be encrypted by TIFS in DDR.
-Encryption is needed for security matters, so that the BL31 is not
-modified before entering suspend or early at resume.
-
-We only need the encryption function here because the decryption message
-will be send by the R5 SPL at resume.
-
-Also introduce the LPM_ENCRYPT_IMAGE cap signals that FW has the support
-to encrypt the image using the TISCI_MSG_LPM_ENCRYPT tisci message.
-
-This is useful in suspend to ram cases where we would like to
-store the encrypted image of a secure fw instead of the original image
-itself in the DDR.
-
-Check for LPM_ENCRYPT_IMAGE flag in the FW capabilities, and only then
-call encrypt.
-
-Upstream-Status: Pending
-
-Change-Id: I266472da87dd0821493019b2d9853f8886f33811
-Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
-Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
----
- drivers/ti/ti_sci/ti_sci.c          | 36 +++++++++++++++++++++++++++++
- drivers/ti/ti_sci/ti_sci.h          |  7 ++++++
- drivers/ti/ti_sci/ti_sci_protocol.h | 32 +++++++++++++++++++++++++
- plat/ti/k3/common/k3_psci.c         | 10 ++++++++
- 4 files changed, 85 insertions(+)
-
-diff --git a/drivers/ti/ti_sci/ti_sci.c b/drivers/ti/ti_sci/ti_sci.c
-index f0813e5b0..ee5f7166f 100644
---- a/drivers/ti/ti_sci/ti_sci.c
-+++ b/drivers/ti/ti_sci/ti_sci.c
-@@ -1784,3 +1784,39 @@ int ti_sci_lpm_get_next_sys_mode(uint8_t *next_mode=
)
-
-	return 0;
- }
-+/*
-+ * ti_sci_encrypt_tfa - Ask TIFS to encrypt TFA at a specific address
-+ *
-+ * @src_tfa_addr: Address where the TFA lies unencrypted
-+ * @src_tfa_len: Size of the TFA unencrypted
-+ *
-+ * Return: 0 if all goes well, else appropriate error message
-+ */
-+int ti_sci_encrypt_tfa(uint64_t src_tfa_addr,
-+		       uint32_t src_tfa_len)
-+{
-+	struct ti_sci_msg_req_encrypt_tfa req =3D { 0 };
-+	struct ti_sci_msg_resp_encrypt_tfa resp =3D { 0 };
-+	struct ti_sci_xfer xfer;
-+	int ret;
-+
-+	ret =3D ti_sci_setup_one_xfer(TISCI_MSG_LPM_ENCRYPT_TFA, 0,
-+				    &req, sizeof(req),
-+				    &resp, sizeof(resp),
-+				    &xfer);
-+	if (ret !=3D 0U) {
-+		ERROR("Message alloc failed (%d)\n", ret);
-+		return ret;
-+	}
-+
-+	req.src_tfa_addr =3D src_tfa_addr;
-+	req.src_tfa_len =3D src_tfa_len;
-+
-+	ret =3D ti_sci_do_xfer(&xfer);
-+	if (ret !=3D 0U) {
-+		ERROR("Transfer send failed (%d)\n", ret);
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-diff --git a/drivers/ti/ti_sci/ti_sci.h b/drivers/ti/ti_sci/ti_sci.h
-index 1f1963274..2afa11317 100644
---- a/drivers/ti/ti_sci/ti_sci.h
-+++ b/drivers/ti/ti_sci/ti_sci.h
-@@ -258,6 +258,11 @@ int ti_sci_proc_wait_boot_status_no_wait(uint8_t proc=
_id,
-  *
-  * Return: 0 if all goes well, else appropriate error message
-  *
-+ * - ti_sci_encrypt_tfa - Ask TIFS to encrypt TFA at a specific address
-+ *
-+ *		@src_tfa_addr: Address where the TFA lies unencrypted
-+ *		@src_tfa_len: Size of the TFA unencrypted
-+ *
-  * NOTE: for all these functions, the following are generic in nature:
-  * Returns 0 for successful request, else returns corresponding error mes=
sage.
-  */
-@@ -265,5 +270,7 @@ int ti_sci_enter_sleep(uint8_t proc_id,
-		       uint8_t mode,
-		       uint64_t core_resume_addr);
- int ti_sci_lpm_get_next_sys_mode(uint8_t *next_mode);
-+int ti_sci_encrypt_tfa(uint64_t src_tfa_addr,
-+		       uint32_t src_tfa_len);
-
- #endif /* TI_SCI_H */
-diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h b/drivers/ti/ti_sci/ti_sc=
i_protocol.h
-index bdd24622a..a165cda99 100644
---- a/drivers/ti/ti_sci/ti_sci_protocol.h
-+++ b/drivers/ti/ti_sci/ti_sci_protocol.h
-@@ -53,6 +53,9 @@
- #define TISCI_MSG_GET_PROC_BOOT_STATUS	0xc400
- #define TISCI_MSG_WAIT_PROC_BOOT_STATUS	0xc401
-
-+/* TFA encrypt/decrypt messages */
-+#define TISCI_MSG_LPM_ENCRYPT_TFA	0x030F
-+
- /**
-  * struct ti_sci_secure_msg_hdr - Header that prefixes all TISCI messages=
 sent
-  *				  via secure transport.
-@@ -160,6 +163,7 @@ struct ti_sci_msg_resp_query_fw_caps {
- #define MSG_FLAG_CAPS_LPM_STANDBY	TI_SCI_MSG_FLAG(3)
- #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
- #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
-+#define MSG_FLAG_CAPS_LPM_ENCRYPT_IMAGE	TI_SCI_MSG_FLAG(11)
-	uint64_t fw_caps;
- } __packed;
-
-@@ -810,4 +814,32 @@ struct ti_sci_msg_resp_lpm_get_next_sys_mode {
-	uint8_t mode;
- } __packed;
-
-+/*
-+ * struct ti_sci_msg_req_encrypt_tfa - Request for TISCI_MSG_LPM_ENCRYPT_=
TFA.
-+ *
-+ * @hdr			Generic Header
-+ * @src_tfa_addr:  Address where the TFA lies unencrypted
-+ * @src_tfa_len:   Size of the TFA unencrypted
-+ *
-+ * This message is to be sent when the system is going in suspend, just b=
efore
-+ * TI_SCI_MSG_ENTER_SLEEP.
-+ * The TIFS will then encrypt the TFA and store it in RAM, along with a p=
rivate
-+ * header.
-+ * Upon resume, the SPL will ask TIFS to decrypt it back.
-+ */
-+struct ti_sci_msg_req_encrypt_tfa {
-+	struct ti_sci_msg_hdr hdr;
-+	uint64_t src_tfa_addr;
-+	uint32_t src_tfa_len;
-+} __packed;
-+
-+/*
-+ * struct ti_sci_msg_req_encrypt_tfa - Request for TISCI_MSG_LPM_ENCRYPT_=
TFA.
-+ *
-+ * @hdr			Generic Header
-+ */
-+struct ti_sci_msg_resp_encrypt_tfa {
-+	struct ti_sci_msg_hdr hdr;
-+} __packed;
-+
- #endif /* TI_SCI_PROTOCOL_H */
-diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
-index a443dd851..c2017666b 100644
---- a/plat/ti/k3/common/k3_psci.c
-+++ b/plat/ti/k3/common/k3_psci.c
-@@ -24,6 +24,7 @@
- #define SYSTEM_PWR_STATE(state) ((state)->pwr_domain_state[PLAT_MAX_PWR_L=
VL])
-
- uintptr_t k3_sec_entrypoint;
-+bool encrypt_image;
-
- static void k3_cpu_standby(plat_local_state_t cpu_state)
- {
-@@ -282,6 +283,11 @@ static void k3_pwr_domain_suspend_to_mode(const psci_=
power_state_t *target_state
-	k3_gic_cpuif_disable();
-	k3_gic_save_context();
-
-+	if (encrypt_image)
-+	{
-+		ti_sci_encrypt_tfa((uint64_t)__TEXT_START__, BL31_SIZE);
-+	}
-+
-	k3_pwr_domain_off(target_state);
-
-	ti_sci_enter_sleep(proc_id, mode, k3_sec_entrypoint);
-@@ -347,6 +353,10 @@ int plat_setup_psci_ops(uintptr_t sec_entrypoint,
-		ERROR("Unable to query firmware capabilities (%d)\n", ret);
-	}
-
-+	if (fw_caps & MSG_FLAG_CAPS_LPM_ENCRYPT_IMAGE) {
-+		encrypt_image =3D true;
-+	}
-+
-	/* If firmware does not support any known suspend mode */
-	if (!(fw_caps & (MSG_FLAG_CAPS_LPM_DEEP_SLEEP |
-			 MSG_FLAG_CAPS_LPM_MCU_ONLY |
---
-2.34.1
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/=
0003-feat-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch b/meta-ti-b=
sp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0003-feat-k3-handle-su=
spend-in-case-of-LPM_BOARDCFG_MANAG.patch
deleted file mode 100644
index a1209fe1feca..000000000000
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a/0003-fe=
at-k3-handle-suspend-in-case-of-LPM_BOARDCFG_MANAG.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 470cf022d03e350beab36605d4250944d2c92ffe Mon Sep 17 00:00:00 2001
-From: Abhash Kumar Jha <a-kumar2@ti.com>
-Date: Tue, 28 Oct 2025 23:24:22 +0530
-Subject: [PATCH 3/3] feat(k3): handle suspend in case of LPM_BOARDCFG_MANA=
GED
-
-The J7 platforms support LPM_BOARDCFG_MANAGED capability where the
-low power mode configuration is done statically for the DM via the
-pm-boardcfg.
-
-This is entirely opposite to the case of DM_MANAGED, where the DM fw
-decides the low power mode to enter into.
-
-Introduce LPM_BOARDCFG_MANAGED cap to handle suspend for those
-platforms as well.
-
-Upstream-Status: Pending
-
-Change-Id: Iaa0ab478cbe0db6652f61e9d733c0fddb4bab234
-Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
----
- drivers/ti/ti_sci/ti_sci_protocol.h |  1 +
- plat/ti/k3/common/k3_psci.c         | 13 ++++++++-----
- 2 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h b/drivers/ti/ti_sci/ti_sc=
i_protocol.h
-index a165cda99..b83174b0d 100644
---- a/drivers/ti/ti_sci/ti_sci_protocol.h
-+++ b/drivers/ti/ti_sci/ti_sci_protocol.h
-@@ -164,6 +164,7 @@ struct ti_sci_msg_resp_query_fw_caps {
- #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
- #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
- #define MSG_FLAG_CAPS_LPM_ENCRYPT_IMAGE	TI_SCI_MSG_FLAG(11)
-+#define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
-	uint64_t fw_caps;
- } __packed;
-
-diff --git a/plat/ti/k3/common/k3_psci.c b/plat/ti/k3/common/k3_psci.c
-index c2017666b..9cf41b4cb 100644
---- a/plat/ti/k3/common/k3_psci.c
-+++ b/plat/ti/k3/common/k3_psci.c
-@@ -357,17 +357,20 @@ int plat_setup_psci_ops(uintptr_t sec_entrypoint,
-		encrypt_image =3D true;
-	}
-
--	/* If firmware does not support any known suspend mode */
--	if (!(fw_caps & (MSG_FLAG_CAPS_LPM_DEEP_SLEEP |
-+	/* If firmware is capabale of low power modes */
-+	if (fw_caps & (MSG_FLAG_CAPS_LPM_DM_MANAGED |
-+			MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED)) {
-+		k3_plat_psci_ops.pwr_domain_suspend =3D k3_pwr_domain_suspend_dm_manage=
d;
-+	} else if (!(fw_caps & (MSG_FLAG_CAPS_LPM_DEEP_SLEEP |
-			 MSG_FLAG_CAPS_LPM_MCU_ONLY |
-			 MSG_FLAG_CAPS_LPM_STANDBY |
-			 MSG_FLAG_CAPS_LPM_PARTIAL_IO))) {
--		/* Disable PSCI suspend support */
-+		/* If firmware does not support any known suspend mode
-+		 * disable PSCI suspend support
-+		 */
-		k3_plat_psci_ops.pwr_domain_suspend =3D NULL;
-		k3_plat_psci_ops.pwr_domain_suspend_finish =3D NULL;
-		k3_plat_psci_ops.get_sys_suspend_power_state =3D NULL;
--	} else if (fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
--		k3_plat_psci_ops.pwr_domain_suspend =3D k3_pwr_domain_suspend_dm_manage=
d;
-	}
-
-	*psci_ops =3D &k3_plat_psci_ops;
---
-2.34.1
--=20
2.52.0


