Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECCAD43352
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:22:52 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131.1765484565275944556
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lx8QqdIp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtmXCr59VpWQK1m+dHO+3/f4s+HTvCPgNQOJVdv7+wGRyhAZTSoxMbWCXWZPclEa87DFHPzwH4nV+AQyFBnPWrQFN1G5Qi0//z7YM9dAaenukBapHYTELVljCeKCwJc3uMtPsXPapBgDH6WhUm5YmyB2P+Ki4mcQdqsjT0cCBJdTdL2+hw2Z1XJFny+QmYg9P90I+VoWkDLIJhHo3v2OSdIQwdN/qGd7I2T6Dh+2sHNv4XXV6LmVyFe5dNYSisawLEjTIK8nz/mTFY6FeIBfdwoPPgcgAcGBGKpucvXNygRcBcyLf2/y8kLN6yqQhufg4XFQgWSeiZ4sfhYaTs1KvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMixwgq9Y8+i/cWF1EQ8vz1E1kpOY6KXWuSquryVtwc=;
 b=jwRxYdH5WX9oik78Fqg/FeOBgt/uwLnsjsRkt504YMSObkZpHw4JIzBJOAWE1vlbzOIFqeHPl8xHTqCK5TZBn4kuSU8jdERv00BcJMia92ee+KGC5rE76WbKdIlDqXM4P23Epnba87aJkOEHBfN+k9DxcpVwqgSfp7vg3TuPrQ/CiJUzh5NBNuGs2qI6LIffkE8J2f/K0jYYVZw17/JHSWPCpfjeDqLDxLGp0/mJUlAcgR5yKsZiM8FzP45LdYTUbv2mbfqxM0KE1UeQyAl+nCHLtdhoHuxhoeulmGt6sN+x6kpJ8USD2HOLqQsujHufYA6BlnSP5tM3T6DWqMU0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMixwgq9Y8+i/cWF1EQ8vz1E1kpOY6KXWuSquryVtwc=;
 b=lx8QqdIpu44T3i4coCQUpHnCiW7ZAfPogV2uXDs/BOxZdtEkUTTIvdFaPwMpWWF90+No//WGtFfdkppipftHIGQiWxs6Oa9P3p4bSVv6p/o5fV9gTzi+EnzQqshQzCohv7QdRhmwYezsuIMZUXjbOmIO/iLGMoB3TBuMfatsj4A=
Received: from SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 20:22:41 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::ae) by SJ0PR05CA0194.outlook.office365.com
 (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Thu,
 11 Dec 2025 20:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:22:40 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:22:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKMYe11025145;
	Thu, 11 Dec 2025 14:22:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTnBK-0000000H3Kg-0neY;
	Thu, 11 Dec 2025 14:22:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 4/5] am62xxsip-evm: Update for 6.18 and 2026.01
Date: Thu, 11 Dec 2025 14:22:33 -0600
Message-ID: <20251211202234.4064350-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211202234.4064350-1-reatmon@ti.com>
References: <20251211202234.4064350-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH0PR10MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: aff4c8dd-4c3b-438d-e8a7-08de38f308e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OvkpatN5exca75/m5a7dSC7x7XlzX02mdIeCsCFX71CoVw/PBhtcHREx8nYb?=
 =?us-ascii?Q?7NPBB7HzJO2JvbQQjHFCUoqrxPnF23MxFcHnwLhGZ1VeDmrGxciaAPhI8WiV?=
 =?us-ascii?Q?y+2FFCwsQL3p3vxg9zxIVpFnTLFFPMD9PT2DoeZWqEjpz2cC9PzBuMrPUdW5?=
 =?us-ascii?Q?wsOw3MTJ6vAObI+Msh5o4hifFo6koWIgxeTUgyK8gBf5Pg/cbkWSowSr+aKE?=
 =?us-ascii?Q?V6zsSyRrmielIi9iIKd4WSFjaNcLsAl0Jz6UWkCGvG8zwg8dgy4phWF/2xTF?=
 =?us-ascii?Q?IxsRFWe+utFcC8OvuppwMODwnqMKAGtXS6vCIyOLvN/z65Jb0x9QXYniKQPV?=
 =?us-ascii?Q?bBu3BMShKC4XLucLngJa4wKRZCiyN+c0rmIKkw0d59HqrsTp5c68RbEQg8DC?=
 =?us-ascii?Q?111QDZkZzOGHNT7tpAjV+1TrSsljMRsgofUKzAXN4rJU8nyF0nVi7emk1xCw?=
 =?us-ascii?Q?fSMPDkRlt+M4jxrxuvBInEXN7Vond1G1vWKW7LR8l+AVyFqJ1XPRkvZD+Xov?=
 =?us-ascii?Q?NaXbXan2JfCQecarMKeZFxn178NirbhJIRgo+uQ6l5pbBafv6mj5g+EXT2Lz?=
 =?us-ascii?Q?srSYa1xjii1NJjJ9tUgkvvrgHKzQ7T7LO6FnCtqjgfIJrqek60GhBgxiHiLw?=
 =?us-ascii?Q?DmxYxRtOrXq3AC0dMfmJ/R6IE6dV/4dJ/YVtwJVjAif/xOKcAg+wEENMfKZt?=
 =?us-ascii?Q?LL3JKqDDyo0sh+UWLsxW1QfjiTIcCZijPvNb3M6IvR36im4O3+MR0LdqrrkJ?=
 =?us-ascii?Q?R6dYth5pDTCBqrv3DE5MBQopzdh8HFriNEpQI30MK9YbNiY9bl6WGtS7YwV2?=
 =?us-ascii?Q?swgbwEcK14oVmRQ5a+7vIU/zrnlReCCeyIBfG4tip5QiLozYo64Na+IYM2PI?=
 =?us-ascii?Q?ShVot8X47/4wp2yCkImEiHYPACs5q7sq7XN9GUr28F7U3Ym8grQ4JiE3SSj1?=
 =?us-ascii?Q?Qs7EEwB7Spc8EHWLmG9k568Bz5D28mPCKhXLXLHAJRsdurav1bA8rRTZPtQG?=
 =?us-ascii?Q?QGUF1Z5NuqyL4I3bnBi8CYDlVdZSnPOn9VgNHhufb5aC1G8KEmGH7rNtW+EQ?=
 =?us-ascii?Q?sIg4SQ2G26nBEDLPOA2bokDaJNtfSad+k3SWTvoZAGoyw3rgkLmRdhzoA4UR?=
 =?us-ascii?Q?CgtC7GASyZFjbBew/K0JCG3Q1h9XF7qSKIOA2bUoI9ixToKQSzNGC79erYrr?=
 =?us-ascii?Q?ruVk/hGzLCiLZC3my//hYjGk+c7mZeY4jQ1euF+vaNPDf/wKN0Y9nYH1cP/a?=
 =?us-ascii?Q?d+bzxcAHbVAOF2A+ceB5kbJl+UybIiMQJId01CBbSCdKO+J31CGziHTt3Mi1?=
 =?us-ascii?Q?BhkcM8Ps8lB3yQNmLVETIxalxtHlQjRvoJYcHl0wSPUPXLCUpuzoazkz7TnJ?=
 =?us-ascii?Q?KpQEfSWOI6zyBu6DS+HaDuTs574X/JtKu3+QAfeJEceqRx8SvSzH6915zkZb?=
 =?us-ascii?Q?rd2//Tu5nL95ukYMPVqFcdeXElApCYhSINHjpoQyv96wEy20jgfxVQpNSas0?=
 =?us-ascii?Q?3Y97KPmw+HKRBoBCAxMc/aGEtoG1ZVzas38bJfg594mszH6yZPsTSYDsuDBj?=
 =?us-ascii?Q?g6iycyEvG2VHy1gGRSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:22:40.9672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aff4c8dd-4c3b-438d-e8a7-08de38f308e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19350

The name of the u-boot defconfig changed when it was upstreamed into
2026.01, and the name of the dtb changed to k3-am6254atl-sk.dtb in the
kernel.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: New commit.

 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 1 +
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62xxsip-evm-k3r5.conf
index c20b9619..39d63817 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -6,3 +6,4 @@ require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am6254xxl_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "am62xsip_evm_r5_defconfig"
+UBOOT_MACHINE:bsp-ti-6_18 =3D "am6254atl_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf=
/machine/am62xxsip-evm.conf
index c5a3a92d..252a0380 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -24,6 +24,8 @@ KERNEL_DEVICETREE =3D " \
=20
 FIT_CONF_DEFAULT_DTB =3D "k3-am6254xxl-sk.dtb"
 FIT_CONF_DEFAULT_DTB:bsp-ti-6_6 =3D "k3-am625-sk.dtb"
+FIT_CONF_DEFAULT_DTB:bsp-ti-6_18 =3D "k3-am6254atl-sk.dtb"
=20
 UBOOT_MACHINE =3D "am6254xxl_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "am62xsip_evm_a53_defconfig"
+UBOOT_MACHINE:bsp-ti-6_18 =3D "am6254atl_evm_a53_defconfig"
--=20
2.43.0


