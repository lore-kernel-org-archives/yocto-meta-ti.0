Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC54CCD4842
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 20:27:12 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7467.1762979223212896453
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 12:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=po9oLaXK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.17, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8kp3wb89LxoiDPBoIobwJHdOYH7Puy63p9nikI7xXtxvHPLe0ACv/75rlxeXcTXWOYK627PoLlFioDrmn2McL81/CDA3EjG0z5jAVWb21CNm5mRNfqnhQOMowdmiyEzmL50NHDIutw/dmKG8UuCHhNxumhVcLv54zwXRxJhjT5s1OsyhBAVg+YYMb1Edp7etboFxKbSMVJ1NvYLzdYBzftSVDqR5lnIstibHpTdmEPlNLDjXFQNf1r8A2G9Bdr82xSDB4oLWwGRcd+zSStTO57TdGsnGhPDc23Vbqk7yO4ILRA1iTmdEFZOifiD/Do88sO1jD4vGfs7dAc/bqBcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL2UCk1ZKSnccIZu04XawHGKSFiZhjTlQkUaR4fen/I=;
 b=YDTKc8Sc5524QQProgbtSwXFR1H41cFma11wn1LdDSTxeOhmGJvtIbUgCBQyP8qP5NJDUizqMDAYVQHlEGfsQk+w3N/FtkGyvYoHfQzHiAblLZN8/iDZ+F0j+tNicdvUibKMVAFeYLiIJcj5h094twP8wgOILa9cfatO/c8MLyIMxtwYusa60GEaSmA9p+xV4mx6h+qarq7UZ25LsxLKPp4IUmm6Nq8UdpoN0h3kR5ToeOJdtE9NEafnmKEQIIJDVPZU4LcIINNIYhrK67faXPlQ1Zf36/0Q7ZffawwIxa6XPK3dOHksIQz/25R2sBHUDkfcVqMJoO5hwLqmIKL36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sL2UCk1ZKSnccIZu04XawHGKSFiZhjTlQkUaR4fen/I=;
 b=po9oLaXKqnl0eQLVB4uhq634MliYShPxtZjR8/iv1wYlwAIJdi68nt4AFzoT4CWcsN5TdG98msPtzE6g00YCQsgBX66NU17wBas4FikNJZw/QrsUyics0bsAB8Kns9G5VitCgkhd206zi8EqXbLz5WoUjq8b7k89NUWxk/1dVVE=
Received: from BN9PR03CA0555.namprd03.prod.outlook.com (2603:10b6:408:138::20)
 by MW6PR10MB7640.namprd10.prod.outlook.com (2603:10b6:303:245::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 20:26:59 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::48) by BN9PR03CA0555.outlook.office365.com
 (2603:10b6:408:138::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 20:26:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Wed, 12 Nov 2025 20:26:58 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 14:26:52 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 14:26:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 14:26:52 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACKQqJN3259228;
	Wed, 12 Nov 2025 14:26:52 -0600
From: <a-christidis@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <rs@ti.com>
Subject: [meta-ti][scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 14:26:52 -0600
Message-ID: <20251112202652.3718660-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|MW6PR10MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d6fab5-d210-4a3f-c047-08de2229d44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FLJ3xPuk3c4yDQFGK5opqB8ZwMUBB3MnaYafUCxYlCl/mh+OAmd3qN/Qatr/?=
 =?us-ascii?Q?uSbBufsSmf4OrPytDeHtNnN/Il8WN1f3VR6XD5qCISPJFMl/EfbO5niXvLgY?=
 =?us-ascii?Q?DfM93bDRxhwzmZdHFZ53BOZ2ZnaSpFseyD9SrECy/RyZpzbc9us/uvXdwqUa?=
 =?us-ascii?Q?q1GQZESOy9s3RXGYHO1ICPqLm2amZB3Uor1Li2KrdTE+XMZGMFKdTXdtgzzB?=
 =?us-ascii?Q?8eOVXZMg65iJonqo1UNQwQ1DxK7V/APUWPgO5gpQJ1VDRjqVaFz4XegI2GSC?=
 =?us-ascii?Q?1r1Ld2GsY3DmL73SkOPm9IFLm105t52Im4ekn5AFLCggkkgynVZIrs57+Ecy?=
 =?us-ascii?Q?X2GubaaxGP9q3wmZfJHfCvFduh5dR1aXmnHk/fs/nG7vPQCDs3XkqiQltZHV?=
 =?us-ascii?Q?TXk/CJTLXyEs0qvCYog5RsiUxRXtp1oOt8yTpU4GVpsdLRsOphboifvkq2IB?=
 =?us-ascii?Q?cn/tBj+pWVdq6vWzR0A/bbG2GPBhMekHi+wHr7Po4PYTDKB7VNnsKIdZLXWJ?=
 =?us-ascii?Q?DsqSeNQ4UurqOzO7J39Hxd9/5hyxrxlDhEbmY9JUycfE5jFAXivFl7CA6Y86?=
 =?us-ascii?Q?Mdt1pULof1JFfv8JxBXVFkH0yxYrCEj1MP9WB0ZzWNbJ6VgMofwWsedt1Wii?=
 =?us-ascii?Q?OIxMNKxx4qoGcHo04C0s9milRP4mh7TTG3Pbht0b0a05rA7AtNL6UEOxV/kO?=
 =?us-ascii?Q?FzymPvDDruXifsjViB8i+KDKNTIBt9oauYPWZHi4SU1Y1xznHzedfNx/Y9A5?=
 =?us-ascii?Q?/HVlSVfepeNrmXJR89IQi+HNj3G/rsRuCHKCmoB1U1pT+1csPrMNubcwvfAI?=
 =?us-ascii?Q?s1mAGkkzgzdocnF2YSShUdUcZ0se1LAdKddfg2u4qtH4a0MMtMpygs70Bdww?=
 =?us-ascii?Q?0QjR3YQWgoYmZyhBmYk779dLWXQUgj8dPM15+b+77Hsis/F5FUMnllaACNeb?=
 =?us-ascii?Q?5V06cdpWvwuw4r/R3BQeP15LfA3sRyabI1AtqaLEFFMhKQdFqocLM1ur6rMD?=
 =?us-ascii?Q?MFiRk8jiV8HppsoDoQS4JIROveYDNpSIazeVamjJbMTmD0R20sCp/Gotb6sL?=
 =?us-ascii?Q?xFGEbLcibISnWGLzpfC5tbZnUZGavdwwCHcCOGX6qCsezZGO6J6N1DRHyaQY?=
 =?us-ascii?Q?CdaDcdjxRap61DWe5O3bDKm4sOKiTv8BsikDWdW3EzMN5HE/5CDuzK3s6q1P?=
 =?us-ascii?Q?2fHEk3Ndp4FE2yVH6Z7KOfMlJGNYS3LgSGXQh1CZSq0vYwpVQbGJUfe8Pi2f?=
 =?us-ascii?Q?5HBdMe+751t/mclYo6CrDfYs8JwZ/1osCpzwj+Oqoe4HnPiE3N5mNmzjRhfI?=
 =?us-ascii?Q?zrULNS+smoDEGFx21kMe6Ky11l3k6tOKmKBCD9pdoywjBTypHbhsL8Urp8Co?=
 =?us-ascii?Q?Lk0Kwe3+l9ddbyY3S0cren7jcUkCZ9GIV+aEiYtRyaQZToUlI/Aomg904xIo?=
 =?us-ascii?Q?1yfqwMze+OfrNaYt3bhpGrdoSULtN0wduZP++kKPfSLxEd4hwbuTQkiaKL6I?=
 =?us-ascii?Q?KPwTLIOgz+UViHYtkW5sK7gQVXYKqmdUa/uaXGwscIAKcMugJHq2PPWNNGhN?=
 =?us-ascii?Q?IjXRpBRZYm/bDtWSbXM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:26:58.2765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d6fab5-d210-4a3f-c047-08de2229d44c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7640
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 20:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19260

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 25.2. Update BSP configuration files with new
preferred recipe versions.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2:
- Removed recipes for 24.2
- Update ti/beagle bsp config files to build 25.2 for kenrel 6.6
=20
v3:
- Forgot to update commit message. DDK 24.2 recipes will no longer
  be present. DDK 25.2 also supports Linux kernel 6.6

v4:
- Remove explicitly setting of PR variable, as it defaults to 0
- Fix spelling mistake (DSP & dsp -> BSP & bsp) =20

 meta-beagle/conf/machine/include/beagle-bsp.inc               | 4 ++--
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++--
 ...er_24.2.6643903.bb =3D> ti-img-rogue-driver_25.2.6850647.bb} | 2 +-
 ...bs_24.2.6643903.bb =3D> ti-img-rogue-umlibs_25.2.6850647.bb} | 4 +---
 4 files changed, 6 insertions(+), 8 deletions(-)
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
index 57f48fec..38a8e68a 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.=
6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.=
6850647.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D=
7232b98c1c58f99e3baa03de52
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
 S =3D "${WORKDIR}/git"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
--=20
2.34.1


