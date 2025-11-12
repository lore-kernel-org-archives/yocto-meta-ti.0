Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D6ECD37B2
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:37:52 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6272.1762976267949610244
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 11:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CCR0Vdll;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.70, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTkEe6+o7jzdzbzuPYOPUh0av0QInndmWyJrfGFkhXAZsIcKHbv2iD9ZgUnRPHiUvKPsDXAQI5mVGAz3lnqo0NNr+kR5cgbXlacrz4kn58wP7QD+zNWz3FcVf7SzFP37RPGafTrwcYRXaGXPBuM4hbR/qh1PV37bTfVqBAGb5RAjn9IAp4X1tdHmXq8C5us+E2mhRAJb71/YdXqN+l6GLFrGFga/NZFQCxjlxpVRS9o03EVcCwwLOHP/shJTtQpzaKhSENBXfFAzCrOqAUCsN1hzvdY2DwFt6kXKTlzZBTvHjVWCndyAuXOyc4T8PdIHUCz8aUsseGGx6iEFjnU7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLtctOBH8NT6cLG8ozPsj/Rl1Y8O74CL0N4RDSC9aRQ=;
 b=OOUoHPJKwLAhXAJfsgCM7yqiTVOG5DOKICBbzCyBwVQykRk8Oubm2W3mfBZsGo0Az5Pxsb35fiebMVJtJ+MeAkTHNM2QtvswvEInqpYm0M6ztz59ua0RcXUCOkOkWg3dWFSr3imcE1TqTO1D7QQ9f8jsJjwXqouqg7QS+e6rOoV2i8Y2cKYcG64EnmED5L82ehxQPJ2FYEPA0JNCBv61SRyR1kMXrxtYVj+rq/hspSCkkUIvgRqF0oKVZfL4pyx9hY/FPMExrD267Mxx89wy7mcDlBWDgHc5H0m9Jk/2O6u0Lbxo3Dv3CMZRxszoeexMoQmVTA5SRf92K2tSrR7IoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLtctOBH8NT6cLG8ozPsj/Rl1Y8O74CL0N4RDSC9aRQ=;
 b=CCR0VdllJUoJZJWABiPiEKwPYp9WWEnEaq22WGr7KS3CKxYF0eSwNFxSezCSRWb1/dHp6r8H3itYdTJunvjrjow0xLsbpW/Vf+DXT1vbnL6zj2f78RKa7vaddiz++RDarUmNvq/U1fbyF4Hy5kfinKNZ4UE2yi1kFmsEr/Cme+E=
Received: from SJ0PR03CA0184.namprd03.prod.outlook.com (2603:10b6:a03:2ef::9)
 by CY5PR10MB5985.namprd10.prod.outlook.com (2603:10b6:930:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 19:37:45 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::fc) by SJ0PR03CA0184.outlook.office365.com
 (2603:10b6:a03:2ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 19:37:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:37:45 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:37:39 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:37:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:37:39 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJbdL13240412;
	Wed, 12 Nov 2025 13:37:39 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <rs@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 13:37:39 -0600
Message-ID: <20251112193739.3664379-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|CY5PR10MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd743a0-dad7-4770-4e40-08de2222f410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GjzeRjsvBq9xflDR8B6nA/1fCZtLsqKc6bjSi/8upEoR1QwQaVGxpYip8GCD?=
 =?us-ascii?Q?VujoE4iT6CczaRFaMwgL7yplqGsglNULEFGQpg2jv1xrgyHCqocMu1v8OtUm?=
 =?us-ascii?Q?lbIzgsrDOXDjeAuVdcgyDG3ODpte2MlQx6xrtiui/DnjKxADhwqVjFvZm9A7?=
 =?us-ascii?Q?Qo9mbSzKw/NE9Vfo90rd6cnAUCs6axF/CXihBb/T0skqzdG8kI2AQzcqghEE?=
 =?us-ascii?Q?bzuOrogNbIjtCptEAe+JquyXmQNnc22ndK/AfbiEAgYnsHkyno/WrJLBgMct?=
 =?us-ascii?Q?dVLlXYnmpEl7qDpfbe/vd5Xj+hKxR+pWWZXCXx0jHQH94gnD1PtSa8kYJ9+Q?=
 =?us-ascii?Q?/pKnTRnm4E5TnAtVqQ1GvIWP92w5SJVbblRd1kkInlu/lia5EBsTuLS4AzPx?=
 =?us-ascii?Q?fUx9NUho0X/rT2HdtnyK1AA0EkZXh8mq5MQARRsQrWKqJxjWHz0ZdOeT/r5u?=
 =?us-ascii?Q?MneMWycLcZUi9nBZeqGvli3p9GUiVoBexZPrdIZ3ZDT+IMcnexgeqrrXRYNw?=
 =?us-ascii?Q?TTydLDISd+eLeovZ1JdUmGxwliMJOb9UGzCLA02msjunzf3YHkMBW7cE6Am0?=
 =?us-ascii?Q?7ayT72uWVSbnHsg7PbRt2J6ghXfISIEnpxHsxSwBk7XibxOvc0KGuS+Wu3xK?=
 =?us-ascii?Q?qfqqLob6o53yRbWKSCYnGzWRcAytVIkCeZlyN+h+PkQ6LtbGm6fIsep0aopT?=
 =?us-ascii?Q?cha0xFZImzjeXqVeAvpR9S3nsEBiTPF470xbyejflvJviwy+fVZkCszOVdAY?=
 =?us-ascii?Q?kCFJFAWgH/li19Zhay/Gw9Vu+PONoRO+oKSMQKbPjYvJQUsqJ0g77A9n53Sz?=
 =?us-ascii?Q?9VuyzQORNRRJSgwkDMe1jTgevgPoEfnVb20PuIL+YcY9aC+Czg4n8bV5cp+1?=
 =?us-ascii?Q?9Hadaefwlo6/WrP1DuneqDZRSEPTtk1e/ncvDNtmu4UdyHkLMZKo/29BcyGR?=
 =?us-ascii?Q?EuZ1xG7BnqJXyTmkCL805IL3WwoacujQibF/Ju/GFx7pmTNQzzgKqENEpDsA?=
 =?us-ascii?Q?JFBfpJCGWqU0qLvJZ9MyFmZtjk1JQiyrciKUkO27v8H2iASnRC6/v8cZ3zzx?=
 =?us-ascii?Q?9/Qib07hOqhLrNkGfySwtoHgF0/l67OZ2NBwYIPIq0JwoT9SjMeMWFvY4K+W?=
 =?us-ascii?Q?ZniEs7nMW/6bABF0lKq0Qg6yhPMryQluE8Sf7AoJ1jIzmJlsdM3D7BDlZLPK?=
 =?us-ascii?Q?kW3ezvz/N0S9Rv354M8LSWBtQ/uZhraRQ8DEUiVG/W4q+50aqXuRy2ZlYWp7?=
 =?us-ascii?Q?tkblw+Xb5YyYcSQ1VIW8pFpGzTNkY7sDrir78WuMPeObcz2nzDIiCS6YQCrT?=
 =?us-ascii?Q?/Nj/mHb8nfB5IM4OD15xpuXMP36COBDb9l4sbqxTf5w8/xmNJ1Ob5259WGqg?=
 =?us-ascii?Q?sPeAndwdm+nlCSCEFPDRT2Gsf/k+m322qOwRCCxJjJKwckZT6YRxz5q49yqC?=
 =?us-ascii?Q?rlhihtXFGP23SVWsaXdBbILogmEHrvBQ+5OWh1fn/DYNdZRe1TkPydfRxgSV?=
 =?us-ascii?Q?8Bp+8OfAqBP9lQkpZkqykEexYWTLjK1bfKgBJkGWGwQZlKGl0hez9sG0MxfU?=
 =?us-ascii?Q?wqHRtrW0jC437dQpBMo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:37:45.1497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd743a0-dad7-4770-4e40-08de2222f410
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5985
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 19:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19255

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

v3:
- Forgot to update commit message. DDK 24.2 recipes will no longer
  be present. DDK 25.2 also supports Linux kernel 6.6 .=20


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


