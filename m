Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCC5D1267A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:32:22 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1256.1764714740340982432
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 14:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=m3utRwRz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.9, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPW05jP+8V1HIlcKcdBkUEQ5rBoal0N7+5/T+3jEj6lQvqmd4QiT9iz7pNby5lENagwSVYFTY0iOJSJhTURmJdFhdroi87iMtAfHkyEHTmkkE5WtJ9QuaiKpkVpVRdpV55dWjEriafg/SByKJAfDCO/IlEVTiuo5ODG9XSXBfbisLRvbxumYgH+a+2ESGkvfIgodX2bd89Bp3EWDab4ynYQ6Q5sb1XbKN2DvCazcH1OFJ2vpbpEGBGGP9DjUCpFZV6I28mPy2zANRw0SNddZlZyZN9BoyD1iXVtH6s/9Rkv87RbQZ554rlodTHBrpBtCwaZ9yfK07TP4aWi4NZUXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zFGu2tQAOX0kUSVJEY3SY00B6V7FnbKJfLkEEWN8PI=;
 b=G63pMOUHDXPOQij2psEfGup/erMfscUUEQGRgdHZGIBHoukzHjC7jnQ2PI1l3y1WoTc9XwnPt5kM3/WwGzTi5RExzboms+16CLVipVbxEeOt1Qi+pMO1P3LtDUq5H1/2o+StBvfeH4Dw1si7uSYrnEN8alVSMTBmezywtr4jX91D9NNXb6cApN8gR5NwNG7AFisox4Sg/6I6ItiFXLe9FM5a8El6ELob0tFG+M/EAFZr5IAuYs7fbZQCxA8pXD1GJvbyN9yxjqabVz1cHkR8Si2q/mNT3dyvDUFFynS3bptZAXHXvqHCviexrTvoww/Gk98HRz4yvWeHQ4js2nwLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zFGu2tQAOX0kUSVJEY3SY00B6V7FnbKJfLkEEWN8PI=;
 b=m3utRwRzIiAuGjwvRbX/fac++ffcpy02kxwbDkM7Wui8xzenKnvnO/uajCCrU8XMK+XsnLeS1TGRTlCYR8q99lcqH572dLWcoFU0ekw03FsmuvoHsmVk9C4WhZ7MdMp6T6bg/53bZtAHxk2DpKCQ8bYR/kc2G9ODIMsoieYIpeg=
Received: from BN9PR03CA0254.namprd03.prod.outlook.com (2603:10b6:408:ff::19)
 by DS0PR10MB7455.namprd10.prod.outlook.com (2603:10b6:8:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:32:16 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:ff:cafe::86) by BN9PR03CA0254.outlook.office365.com
 (2603:10b6:408:ff::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 22:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:32:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:13 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 16:32:12 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2MWCvT2994337;
	Tue, 2 Dec 2025 16:32:12 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/4] conf: machine: Remove remaining K3 HS machines
Date: Tue, 2 Dec 2025 16:32:07 -0600
Message-ID: <20251202223210.3816583-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DS0PR10MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e1467b-26c9-492b-f285-08de31f2a50c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cgW7quXV9Gca9f+dIr/9GMwq0jh3C91888bbK21N5G7l5WyH3z+LquPvIj7b?=
 =?us-ascii?Q?gJ3nI2Aj3jOpITSxNUfE4nNAnAOCg7Z81WPvnDa7Rq1uG1F22jzaP9Av9I84?=
 =?us-ascii?Q?sC6Au1lZfh7FMYBdae8rYVRfwWR5+UOasUgPFq8S4NRs/jX7yNnsr8FNXxLt?=
 =?us-ascii?Q?TFST+SCDf2FfUenJVtj2m5eVE3hxnsHy1+NGS4QszkCz62AAGDVEg34XwkaT?=
 =?us-ascii?Q?CJA7J80h9bBZ3QBDiUsWSO0yIEIwCEeU2Akl6fdyzOz4o+kmORvUZK/n/1lv?=
 =?us-ascii?Q?SfTW91cgdu1z5AfcB1F3wdwv1pII8aDwmdCfEOTBnZAxq1yTlp5wbUgdN0bm?=
 =?us-ascii?Q?vObjTV+H4rWV1W+G0c7PYcOk+KCpB1Dq4NfJ6KFj4kMD/FBME0OXM0cSKYDO?=
 =?us-ascii?Q?1iksxaHyMYOrTppbtGXXptxrOWfNDS7wuDg42Q80tpH4tSGLk7bHCMhEE7m0?=
 =?us-ascii?Q?vcMCjbi3b7aomIBObOai6aX+rD7Z1tcUY3+9MG4h6vGbIjYrzYONlZKabCvp?=
 =?us-ascii?Q?9vWDduQr+sCfKs9w6Lk4hU9ZS2xlxaguRAlfBbOrHtLcCUJ6VklpnTDzjEtu?=
 =?us-ascii?Q?PhqLlQjV1esb7nhOI3wmFUalbR1Ev11yjo9dgkMfnex0t5QHQsPCWK2xWIAQ?=
 =?us-ascii?Q?CabHasuT3PAXwX04Cwu6lzHJGs24pBpdOgGe+uWWbFRxuhBppyu8p4ROZ1ZU?=
 =?us-ascii?Q?gn4itHiFiGwWpXrNlG+FANrcG8KWzqKJ6frDr/sxgJqIY2RKQ0NFvrBTVntA?=
 =?us-ascii?Q?zemdCRsRXEDDYfl5xhwjduEc/kdFMPCnWgB1WjxbVIs/uk+COFDNn6OeLqy2?=
 =?us-ascii?Q?/dOuMfCPipy9cBt51IxSWHkbPUrRT2eLXxRNgb+ozgmwkwNmcqhETQu8RPEe?=
 =?us-ascii?Q?azaXS6/nEJURLHMuG8cCajB6kwTlD46aknh7H7puVu+qadcveRODp2+ZSAtW?=
 =?us-ascii?Q?audqpaxLedtlcL1RAdYy/T1w6e3xqQSRWgcWjsG+hw4QxFCc2Nj80glh6kpS?=
 =?us-ascii?Q?gYHLkfuzysEK2mu/zLTcfCEBMBF8FP+q9Bja7Htb3ScI9hYAYkBSmagMTZIb?=
 =?us-ascii?Q?16joX59elDFVt6jiPOwBd6+wCE0PxSHPNZB/15jCAUu5IQVS0ztNSRPeay4v?=
 =?us-ascii?Q?5Pi4wzdLZewO/F9qY3f+k+VePEgxwYC1W6Z9UHD11oomBXxd2lQOfrYiNpM7?=
 =?us-ascii?Q?2PRtKMpIhsFLhlcw8y0UrJ0qjBhbXuJnJO91rjBYplLSbzlcYDflK+DngN6t?=
 =?us-ascii?Q?vBJ0ykzQTqGmp+gfZ6wYNazGcFJnZG+map0obHU2CTduniX3hgiIo2ToF0FZ?=
 =?us-ascii?Q?dh+awjxm1z/CANdCwt09gHq3bgpaaBcw1j6o6tv1fTVrw7rhtwg6ORu2H/6b?=
 =?us-ascii?Q?FLfFmR9aBqGl0Dx+Tm2nIVIKNI/fXG9nlTEelgyMaGc8bUnPNaD+unfU4cFK?=
 =?us-ascii?Q?0ES3GjnN/PueLWlU1xFJzGs6ZWYiCf3Ilc9v15kvX1op7wiPq5X5oEiYxZcE?=
 =?us-ascii?Q?qd5fknhpxFW+k5ezTMNC2UsBabkpopThh4gn+CdTux7/6Q+ikPPjRO6qMIXb?=
 =?us-ascii?Q?zBTbVsI2hSAlQVfuP8Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:32:15.3000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e1467b-26c9-492b-f285-08de31f2a50c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7455
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 22:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19318

Every MACHINE build deploys a tiboot3.bin file for all three K3 security
types (GP, HS-FS, HS-SE). These extra MACHINE configs existed to select
a different default. As U-Boot now selects a default for us this logic
does not need to exist here. Instead if one wants to use a non-default
security type for an EVM then can simply rename the tiboot3.bin file in
the boot partition. Testing automation already handles this and Sitara-
family devices have dropped the dedicated MACHINE configs, do the same
for Jacinto-family devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 11 -----------
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf      |  7 -------
 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf  | 11 -----------
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf       |  7 -------
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf  | 11 -----------
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf       |  7 -------
 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 11 -----------
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      |  5 -----
 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf | 11 -----------
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf      |  5 -----
 10 files changed, 86 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf

diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am65xx-hs-evm-k3r5.conf
deleted file mode 100644
index 337c8413..00000000
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "am65x_sr2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-
-UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf=
/machine/am65xx-hs-evm.conf
deleted file mode 100644
index f8221f31..00000000
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ /dev/null
@@ -1,7 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx HS EVM
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
-
-require conf/machine/include/am65xx.inc
-
-UBOOT_MACHINE =3D "am65x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/j7200-hs-evm-k3r5.conf
deleted file mode 100644
index 1922d5c8..00000000
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J7200 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "j7200_sr2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-
-UBOOT_MACHINE =3D "j7200_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/conf/=
machine/j7200-hs-evm.conf
deleted file mode 100644
index 54fd2b4a..00000000
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
+++ /dev/null
@@ -1,7 +0,0 @@
-#@TYPE: Machine
-#@NAME: J7200 HS EVM
-#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
-
-require conf/machine/j7200-evm.conf
-
-UBOOT_MACHINE =3D "j7200_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/j721e-hs-evm-k3r5.conf
deleted file mode 100644
index 7904c660..00000000
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721e HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "j721e_sr1_1"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-
-UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/=
machine/j721e-hs-evm.conf
deleted file mode 100644
index 441ca169..00000000
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ /dev/null
@@ -1,7 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721e HS EVM
-#@DESCRIPTION: Machine configuration for the TI J721e HS EVM
-
-require conf/machine/j721e-evm.conf
-
-UBOOT_MACHINE =3D "j721e_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/j721s2-hs-evm-k3r5.conf
deleted file mode 100644
index 58cd92c4..00000000
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721S2 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "j721s2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-
-UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf=
/machine/j721s2-hs-evm.conf
deleted file mode 100644
index 4cf32a28..00000000
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721S2 HS EVM
-#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
-
-require conf/machine/j721s2-evm.conf
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/j784s4-hs-evm-k3r5.conf
deleted file mode 100644
index 80a228a0..00000000
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J784S4 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC =3D "j784s4"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs"
-
-UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf=
/machine/j784s4-hs-evm.conf
deleted file mode 100644
index 8fa1c1fd..00000000
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-#@TYPE: Machine
-#@NAME: J784S4 HS EVM
-#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
-
-require conf/machine/j784s4-evm.conf
--=20
2.39.2


