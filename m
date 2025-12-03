Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE068D1BDDC
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 20:32:29 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25959.1764793944017032330
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 12:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kiJJhYD3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.28, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yeo5mYtUhX4Vdg4YMuVDAxH3mCUP0HnOlxt7L6FaEnDuJrU8S1Dhsuz00QG0ALqqigHojY7T7wlX3H2ezvdacBdUvioh9B8TypHbj9BAmWhW6kNLpv4WjT3srcJHFLaI5wTOvURKNkctvgayi9xyc44dTd21kUqivPIfWeEzcsSNlTMaHe0UmU6gXgM+GiavfNoh9zN05m4WzCidfFSqYDNFv9214zGhOSBxgsdWg71wlUulS77KBlCsxWEYXEdgUqk25o/siIwVEKaPLqczg53sQCR3wNFkptiLKonjCuVRHStVeXZnr+I0VZYTfOSkbyrqePGI+BjYILdj+l0t6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRD4R7PhoIrhy0jq13n5NfGAqL8vd8LRWOwAUMNzY0A=;
 b=A2no1Mc4x0an+QGz5DBPfRLReDTToaIaPRd9egtW60apy4kOiLQ/4UYjZRBokbjuu4a0gXrLXhESEPWtrDXia4Lc0iRtoZrW5pRT21XQl/jBuGXtoc0xO1Vqk4WmcCFjsjXJEQYbzWXk3JCFw5aNnGxG4qyhAUOakItZ5U+QF2Azo6gAezjVENoF1rzlG4gClyTn11X4GEtH72DeK7v/4D5/KclP+j8aVb5SU8ekLu/yzvWRnkb1A5ehHN5+FuYbDbl0pVVvhwyrgxZB38JcDius1FF4hO4g4RnQuwJJp/UeImgRGio7qnMfAJfoJHQpNCwx7g3nvAGd12ALkeantw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRD4R7PhoIrhy0jq13n5NfGAqL8vd8LRWOwAUMNzY0A=;
 b=kiJJhYD3EnY/+3JHmB8sB0YJIcgK/V1K+HRap6b2ux2qPnabed8JniUycIbSK9gKfBAiaXnRZYevvYttT5p3qGp812CaFUnYLArbMdhqTsiEQ5dACBX9tO/Ddvzt+BBaiHf6TMdltSFnhKKJ7IjtDuMxcbaEFk5bplyaxfj0QHQ=
Received: from CH0PR03CA0310.namprd03.prod.outlook.com (2603:10b6:610:118::33)
 by BY5PR10MB4276.namprd10.prod.outlook.com (2603:10b6:a03:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:32:21 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::6f) by CH0PR03CA0310.outlook.office365.com
 (2603:10b6:610:118::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 20:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 20:32:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 14:32:13 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 14:32:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 14:32:13 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3KWDe6396911;
	Wed, 3 Dec 2025 14:32:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/2] meta-ti/all: Make DRA7xx support a subset of AM57xx support
Date: Wed, 3 Dec 2025 14:32:10 -0600
Message-ID: <20251203203211.1113327-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|BY5PR10MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf68ff8-ac61-44ed-d802-08de32ab0c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?td3gTz1TCR+bCh7uzzUq7uvSDwCRlNUu6b74wZpgDEzQPUdDghY7josmRDro?=
 =?us-ascii?Q?AU/mNuuZOMrEH6HPYtuqzZh7z3rXtCI/ksYweuHDLr21sNjJsy4xZi1Kb8fn?=
 =?us-ascii?Q?h0xNEf2AXfMWymTZOuNqyIqGGKU6bE/rPuy4vOtzjRr/6p9wvyWsq2KNGMI4?=
 =?us-ascii?Q?yc5cXFo0om4MTOXcd38U25DKIfI2KhiWIcKFQytoHkcJ280DhyUl4CsTAhu0?=
 =?us-ascii?Q?5A41kaC/w9xLItQBBXCuqkA4bHHHvYahsjSEU75nyEZCgiBcQJFQHqZY9a/u?=
 =?us-ascii?Q?2NqjMfwuLQYQMz52PQxga4mDh+Al0QmjCN/lcvFTj4HnJyOJkFBfF8VsFuj1?=
 =?us-ascii?Q?q30efEZ3Bk9YZQYQWBUlh6hLSaGv5MrO0Fau2mWP624ISPKCcOkA1OJyzivd?=
 =?us-ascii?Q?BpooltK7jJOUcYcROK9cfaBoHV53hyleYL4QjHhKPdDQMLD+NYxw4JuKqli/?=
 =?us-ascii?Q?ehglV7T9wOx+Ab24JPol5vcUkpEL+ZFpBlJ4LI7dQLS6RQ4zHk8IMMnEsy1A?=
 =?us-ascii?Q?3Lo3VHsO1QU0yNhn4ZNYAbhKXCqozzTG2r+ujF22y3on/8h7n14wLbE1NeTV?=
 =?us-ascii?Q?aofk9RSCgQX/UhdNZv2fBeVp2Du4zLA8LooICN/nY3UHNQGLCIssJlHGi7Bq?=
 =?us-ascii?Q?j+IPc8+WihH1IVXlB7s4IS4uMX6wjnK2xS/yqUtXt3GhnCqZ8V+/4xly/PJA?=
 =?us-ascii?Q?SIbjOqvM6iFGwoA8RpLp/6+12uipAAWS2EUu6fzAsKNdv2nYaFajm3GtrbxV?=
 =?us-ascii?Q?qcvd9KxbpBaoTzAG6Zv3DTixuNaCA1504It/g3VVGs/xIYZazKZqz0LmeG9T?=
 =?us-ascii?Q?hUFwP7YYXaJknrJ16McgIciPnEEk7VOofaDXCd0xdFHLcVu60GTBjCmurIKw?=
 =?us-ascii?Q?YC4530E20sLPY+xUvBtxlImLzfH9+B050wVB+alvvgnNWLsiW3nYo/B1GudS?=
 =?us-ascii?Q?9SHY4Qk4khesI4NID2eS5WZH6QLQoNqMItOFHrZY/OUwSYX23X8WDqlfVG+V?=
 =?us-ascii?Q?AXTCwErZ5quagVg+oTfi5+TdmMT3KyuuCnp/yed7D3RQbysfd3TCE3aKJXfG?=
 =?us-ascii?Q?LNG1PPQ0Zl85EmoKmgEuW26T8eI2xqk6KYAxvRFCpFBwry8U+6WTauuv0LjY?=
 =?us-ascii?Q?mQgA7OCv4FARLWoXXa26rnvUT4FyDROKn5jFaA1rnoiUUvpT1DIiessYHk4t?=
 =?us-ascii?Q?89tdvRokHtZe51vgYQfX96chwicbJDKiJ3lJ9QOAqI3FedIHrlBD5gjKEces?=
 =?us-ascii?Q?NrQhMrzDMNMJ8AqfX+eSlShyJh2GKWl7Oj7Wup7PWfLQnVZspYgE/3Yg5UIV?=
 =?us-ascii?Q?IENlFZcjQ9Z5ca6ldqCO3/irkiHwuHeKZfyPWHSJJcLCJl9Hg8DK8fLGZPsj?=
 =?us-ascii?Q?86fKUu3T+IFWJlaxLN0FQY8eq41mwLuX9uSjTS3Y7ZmI13PiaidKwGKEHDPc?=
 =?us-ascii?Q?LdjbpZ9qV60p7wNpvkS0er+zsFJitRtDtEWCMN8R55dOn1OKiCe43i6gXMI5?=
 =?us-ascii?Q?PiKzbPUvyyKj0NboDU+zZpigtYIpxVuCVHRHOi4lMDhs+STYU46sZTAGQAQf?=
 =?us-ascii?Q?c1JhIC9vk7//GHzqdSo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:32:15.4926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf68ff8-ac61-44ed-d802-08de32ab0c04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4276
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 20:32:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19328

As AM57xx already defined both "dra7xx" and "am57xx" as SOC_FAMILY the
AM57xx was effectively a superset MACHINE. Although not all features of
AM57xx are needed for DRA7xx, make DRA7xx-EVM use the AM57xx definition.
This allows us to still support DRA7xx as the only differences that
impact device function are the selection of U-Boot defconfig, DTBs, and
OPTEE, all handled by the MACHINE conf file which is left unchanged.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/classes/ti-secdev.bbclass                        | 1 -
 meta-ti-bsp/conf/machine/dra7xx-evm.conf                     | 2 +-
 meta-ti-bsp/conf/machine/include/am57xx.inc                  | 1 -
 meta-ti-bsp/conf/machine/include/dra7xx.inc                  | 4 ----
 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb           | 2 +-
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb            | 2 +-
 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb         | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 4 ++--
 meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc                 | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb                     | 4 ++--
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb          | 2 +-
 11 files changed, 10 insertions(+), 16 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/dra7xx.inc

diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp/classes/ti=
-secdev.bbclass
index b3d70e5c..226e154d 100644
--- a/meta-ti-bsp/classes/ti-secdev.bbclass
+++ b/meta-ti-bsp/classes/ti-secdev.bbclass
@@ -15,7 +15,6 @@ TI_SECURE_DEV_PKG:k3r5 =3D "${@ d.getVar('TI_SECURE_DEV_P=
KG_K3') or d.getVar('TI_K
 TI_SECURE_DEV_PKG:ti33x =3D "${TI_SECURE_DEV_PKG_CAT}/am3x"
 TI_SECURE_DEV_PKG:ti43x =3D "${TI_SECURE_DEV_PKG_CAT}/am4x"
 TI_SECURE_DEV_PKG:am57xx =3D "${TI_SECURE_DEV_PKG_AUTO}/am5x"
-TI_SECURE_DEV_PKG:dra7xx =3D "${TI_SECURE_DEV_PKG_AUTO}/dra7"
=20
 # The SECDEV scripts may need their own location provided through the envi=
ronment
 export TI_SECURE_DEV_PKG
diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/ma=
chine/dra7xx-evm.conf
index f9a3dd0b..237f27b9 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: DRA7xx EVM
 #@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
=20
-require conf/machine/include/dra7xx.inc
+require conf/machine/include/am57xx.inc
=20
 MACHINE_FEATURES +=3D "touchscreen"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf=
/machine/include/am57xx.inc
index 85290924..c7c8029f 100644
--- a/meta-ti-bsp/conf/machine/include/am57xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
@@ -1,5 +1,4 @@
 require conf/machine/include/omap-a15.inc
-SOC_FAMILY:append =3D ":dra7xx"
 SOC_FAMILY:append =3D ":am57xx"
=20
 MACHINE_FEATURES +=3D "pci"
diff --git a/meta-ti-bsp/conf/machine/include/dra7xx.inc b/meta-ti-bsp/conf=
/machine/include/dra7xx.inc
deleted file mode 100644
index a02421d9..00000000
--- a/meta-ti-bsp/conf/machine/include/dra7xx.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-require conf/machine/include/omap-a15.inc
-SOC_FAMILY:append =3D ":dra7xx"
-
-MACHINE_FEATURES +=3D "pci"
diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-b=
sp/recipes-bsp/goodix-fw/goodix-fw_git.bb
index c43afb5b..11d877a6 100644
--- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Spectrum-GT9271;md5=3D=
2a6de6be7af1fe46370c684da
 PV =3D "${GOODIX_FW_VERSION}"
 PR =3D "${INC_PR}.0"
=20
-COMPATIBLE_MACHINE =3D "dra7xx"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 ORIGIN =3D "DRA71x-RevA-GT9271_SpecDig_Config.bin"
 TARGET =3D "goodix_9271_cfg.bin"
diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bs=
p/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index ba320f5f..1b1cff6b 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Radio Application Firmware"
 LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Man=
ifest.html;md5=3Da59aa54b9470f555cf086b91dca0afa3"
=20
-COMPATIBLE_MACHINE =3D "dra7xx"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 PR =3D "r1"
=20
diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti=
-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
index f147b234..4c2ea375 100644
--- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "VPDMA firmware for Video Input Port and Video =
Processing Engine"
 LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfd463c9500441ed91d07a0331baa635=
c"
=20
-COMPATIBLE_MACHINE =3D "dra7xx"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03=
-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=3Dhttp;name=3Ddra7xx-evm"
 SRC_URI[dra7xx-evm.md5sum] =3D "80176df1350c21d9efa90171789c546e"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b=
/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 61a74a06..83d0d128 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -41,7 +41,7 @@ do_compile:append:ti43x() {
     optee_sign_legacyhs
 }
=20
-do_compile:append:dra7xx() {
+do_compile:append:am57xx() {
     optee_sign_legacyhs
 }
=20
@@ -62,7 +62,7 @@ do_deploy:append:ti43x() {
     optee_deploy_legacyhs
 }
=20
-do_deploy:append:dra7xx() {
+do_deploy:append:am57xx() {
     optee_deploy_legacyhs
 }
=20
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc b/meta-ti-bsp/rec=
ipes-ti/ipc/ti-ipc-common.inc
index da7e4733..7006a9b6 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
@@ -6,7 +6,7 @@ COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST:ti-soc =3D ".*-linux"
=20
 PLATFORM =3D "UNKNOWN"
-PLATFORM:dra7xx =3D "DRA7XX"
+PLATFORM:am57xx =3D "DRA7XX"
 PLATFORM:omapl138 =3D "OMAPL138"
=20
 ALT_PLATFORM:am57xx =3D "AM572X AM571X"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes=
-ti/ipc/ti-ipc_git.bb
index 539a83f9..3e4be816 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -22,7 +22,7 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
 CFLAGS +=3D "-I${UNPACKDIR} -fdebug-prefix-map=3D${UNPACKDIR}=3D${TARGET_D=
BGSRC_DIR}"
=20
 DAEMON =3D "UNKNOWN"
-DAEMON:dra7xx =3D "lad_dra7xx"
+DAEMON:am57xx =3D "lad_dra7xx"
 DAEMON:omapl138 =3D "lad_omapl138"
=20
 inherit autotools-brokensep pkgconfig update-rc.d systemd
@@ -55,7 +55,7 @@ do_install:append() {
     install -c -m 755 ${UNPACKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/in=
it.d/${INITSCRIPT_NAME}
 }
=20
-do_install:append:dra7xx() {
+do_install:append:am57xx() {
     install -d ${D}${sysconfdir}/modprobe.d/
     install -c -m 644 ${UNPACKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/=
modprobe.d/
 }
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-=
extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index bfdf1ac5..bca91df8 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -3,7 +3,7 @@ LICENSE =3D "TI-TSPA"
=20
 LIC_FILES_CHKSUM =3D "file://Texas_Instruments_ipumm_Manifest.pdf;md5=3D5c=
c572579f07af266ab57fc17d762c7f"
=20
-COMPATIBLE_MACHINE =3D "dra7xx"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 inherit features_check
=20
--=20
2.39.2


