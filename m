Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9DAD12685
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:32:22 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1201.1764714740988588643
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 14:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hjQLVmaa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.46, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kERBGq6GvVuzbha6LYVveZz/qtXP8X8o/IjW9CBgHfpzDp+dXpeRRrB2dv8RPuIkaJBHKLct8+1l0xdScvttV0our8sa4UEIHneuM2H2VXcxE1wqzYbcaZdUTRsi4upHRPkRle9D2EPB+7s/2XAuKedSpHAJbdyaySzoKXkfsNi/6S53uG6pxXAr66TbUu9YQflLtiuCUCOMuTKtXgipS8Hd1udItoAT0I7JLZO8Hz4zvKoyuYcPNq+Txed2YPm+0mJ4XqbeN3ZiQUhLD91Rpkn86KPw9kJ/shFP1Ewm88R5pXchZveLqqQS/dudccIpkL0THTzgkZKmt/V0kVyK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3IijIlxlixAx5za1bhPAqwJVP28AxXyIIzf+EewpBE=;
 b=ls136tvvE03za0FiJUIxgnOtu5t7y/lHEMfYMcvVwpX7UOcVSz42nlIjCR4UGUszZIMn1lY3wqIbJPObDrHfXETfuTp2mYqVT2endhDT5+d8BT1anwFCl0prEdN2SvYRwV6eTJwbxc3m7TMn4Ukw/TNehfPFdcvPhN1u21Ew3vUfsRmljDKI387qjnZPHtfstZmg1ahaOqAFgvhymC2cAxSrL815my7a2D1EcVIOpalfyglkDtFvgGjDXq+9iL9nRBVpZfPX5US1nsb4zVPeoh1qmZ72Gh6cX4SXk/mfAGk+z05yuGD0xSejpjUj8FKYCY3uILmu5Z2scixnuDe76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3IijIlxlixAx5za1bhPAqwJVP28AxXyIIzf+EewpBE=;
 b=hjQLVmaaV2GVerETFQIqW5sMUj2Fotr4wxORCMZILlG4fNFRvgGADaxKTIGNw6cguiLdY/U75YhdpTNXY257iEq8WM+qUVJlEbcWUhM3/5WgaioBCYeRg+tE3kf7th+DSlqsiSvIzXFUzzJggMXXy2p99dMqh4ejm6wItStrt0E=
Received: from BN9PR03CA0246.namprd03.prod.outlook.com (2603:10b6:408:ff::11)
 by IA4PR10MB8470.namprd10.prod.outlook.com (2603:10b6:208:55f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:32:18 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:ff:cafe::84) by BN9PR03CA0246.outlook.office365.com
 (2603:10b6:408:ff::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 22:32:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:32:17 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:13 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 16:32:13 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2MWCvW2994337;
	Tue, 2 Dec 2025 16:32:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 4/4] k3r5: Remove per-board SYSFW_ variables
Date: Tue, 2 Dec 2025 16:32:10 -0600
Message-ID: <20251202223210.3816583-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251202223210.3816583-1-afd@ti.com>
References: <20251202223210.3816583-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|IA4PR10MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: ac262b24-73d0-4909-c13a-08de31f2a679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BdrexMBMAuwRyd4ACnbpEZSW3L1A1gPqCESU6YI+bxu/D3JL1aHbWrBFWAXq?=
 =?us-ascii?Q?4GOr9Wmuf3/VWTZHAienlvQV7viZUTnVtonCWQzgQ4U1vk/BUZFfqE0TnDgU?=
 =?us-ascii?Q?ZFajMXeIZxlpI6PlUPIPdTxdrVIune6DFFzXSNljGwTybXMLYbE4eT7Vy/JW?=
 =?us-ascii?Q?QNoIRxMVJP/HT3LXkgr/yWWBjjr2jwWQXZ8V6OfSjLsK5HAe11G3sengj5ZP?=
 =?us-ascii?Q?hzMP7ohF3wgDeDmqerMoHTxWczHRiWKfQY3i+Ru2Ny9AbMTNtiby+KWmFva4?=
 =?us-ascii?Q?K/P5eJ3Pkcq/BScBTzQzihXFAfJo2++u0V6js/8PghX3DCLDRzNey1p7ibz1?=
 =?us-ascii?Q?HHd0w5KSLuRpII/5TisAh95CpP7WGLODiFXACmgAgcYW/zPYMwYIFG7UVkr2?=
 =?us-ascii?Q?EASfCO/Mj9rrLHjQ38KQdec2igMocekHIxkYalBgGuY/QJwQ2MlfMgRWA6Mp?=
 =?us-ascii?Q?REScpZzau5pmIS1YHGr8U7p65ZYlJcYmyPSSx2IO+Phz6KwQI6ziYC3KV773?=
 =?us-ascii?Q?1R/wA0facejk3okpIp8pekJqKQrx12nRPC7ojD+75r5PzGq8qonjsXQA7vMp?=
 =?us-ascii?Q?SoScMVQwxKLJ6kLIW7gSl6zfQ5BqGQreNZtYZoQNUy8ER5rGXkOhENiUqZI2?=
 =?us-ascii?Q?p5F/8SZovoRpj6OH24crgR/jOcDM5KmxBlLS79FvzKq3YQ91XqFjpxbFe49A?=
 =?us-ascii?Q?QJEt2J9fxKAD1YrArCwhCdWzsdyrLB1eL6mXMBIEueHOv+ZOrXYk7PGEjWmC?=
 =?us-ascii?Q?R6/yqwHjos2C/VNVxtwSaEQmZVdKLBwKnokEhhl4zK6tzW/YDwZ5LvQnCvC0?=
 =?us-ascii?Q?95o7L4T2ZboTUJvsNIJ8orkbji1LB3JxYYsqR+UAsxNgbYrr9myjZ2yVTQGm?=
 =?us-ascii?Q?dOk4T1zApLX4O2HXQqoN99EjtECUErJiAzDCpozAR5TJIV1DNAZhnd+7G1Ah?=
 =?us-ascii?Q?04ll3NCFaGYZ1YPOvsG0NhNb+Dqo4t5K5p8OIP9O8gkcC3FalqVvY+tEjosW?=
 =?us-ascii?Q?WSOm9YireHBaWqdBmsYRXkTY3HxqrzWjFvYLnZebfTtA77vlGZXyGlZpUhE2?=
 =?us-ascii?Q?tpPR2iDxIR+EYwLObL1tYMVaZixdtbw58NO+qC1xS+rKxv3i8nnvPWfH2jkR?=
 =?us-ascii?Q?dQCjVCeJzIWOs+Yu/u1038m6rYqfTXhDI1OIRZIHE9HQQNNgCMjuAjsQ1N0d?=
 =?us-ascii?Q?Drxab1jOMY0WpLElxHl0gE3l8jOFSXuz1Pn0vWgd3LImZhcusFAZDaNb/HBP?=
 =?us-ascii?Q?IJj25DE9KOBoMutkZjIvit74ppXaUboxIYOyJX45zLes7BzJBdstfp1twWSY?=
 =?us-ascii?Q?bjpz42QtFDZuHikNby/5S4dOV52RSIe8ApeWIKSw+I8nQg9J1UDHH4p7V8oc?=
 =?us-ascii?Q?QKIj8PmIJuWF4eBMRU6CdqKeRdq6Lb1lH7ci35ffJunZ2bGfix2wmot88gZb?=
 =?us-ascii?Q?jvAiBPKWWmXMDa15V40bl7Rm+Q3FEQWGyn4/rLKKCLs64IBvC8t1qaBmmbEP?=
 =?us-ascii?Q?Zj6GPRrfaaJ2y+oFwZWZZm8YMKBqoXydQX4rN42Qvoxu7yj772vOsrDJ0H1J?=
 =?us-ascii?Q?5Z5a1enK8yuL/E+VabA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:32:17.6808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac262b24-73d0-4909-c13a-08de31f2a679
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8470
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 22:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19319

These were used back when each board had to select the correct tiboot3.bin
to become the default for that board's image. Two things have changed since
then, first we deploy all options for tiboot3.bin generated by U-Boot. And
second, U-Boot's binman tool now symlinks the most appropriate version of
this file for us for the selected U-Boot defconfig file.

These are no longer needed so drop them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf | 4 ----
 meta-beagle/conf/machine/beagley-ai-k3r5.conf      | 4 ----
 meta-beagle/conf/machine/pocketbeagle2-k3r5.conf   | 4 ----
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf     | 4 ----
 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf     | 4 ----
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf     | 4 ----
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf      | 4 ----
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf   | 4 ----
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf   | 4 ----
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf      | 4 ----
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf      | 4 ----
 meta-ti-bsp/conf/machine/am68-sk-k3r5.conf         | 4 ----
 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf         | 4 ----
 meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf   | 4 ----
 meta-ti-bsp/conf/machine/include/k3r5.inc          | 3 +--
 meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf       | 4 ----
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf       | 4 ----
 meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf        | 4 ----
 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf      | 4 ----
 meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf       | 4 ----
 meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf      | 4 ----
 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf      | 4 ----
 22 files changed, 1 insertion(+), 86 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beag=
le/conf/machine/beaglebone-ai64-k3r5.conf
index 65616b67..6366174f 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -5,8 +5,4 @@
 require conf/machine/include/k3r5.inc
 require conf/machine/include/beagle-bsp.inc
=20
-SYSFW_SOC =3D "j721e"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "j721e_beagleboneai64_r5_defconfig"
diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/co=
nf/machine/beagley-ai-k3r5.conf
index c00c14d1..06c74cf9 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -5,10 +5,6 @@
 require conf/machine/include/k3r5.inc
 require conf/machine/include/beagle-bsp.inc
=20
-SYSFW_SOC =3D "j722s"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
 UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_r5_defconfig"
diff --git a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf b/meta-beagle=
/conf/machine/pocketbeagle2-k3r5.conf
index b506cf7d..22535996 100644
--- a/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2-k3r5.conf
@@ -5,8 +5,4 @@
 require conf/machine/include/k3r5.inc
 require conf/machine/include/beagle-bsp.inc
=20
-SYSFW_SOC =3D "am62x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am62_pocketbeagle2_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62axx-evm-k3r5.conf
index 7abe706e..e02e10ed 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -4,10 +4,6 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62ax"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62dxx-evm-k3r5.conf
index 00906420..7533eb5b 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62dx"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am62dx_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62pxx-evm-k3r5.conf
index a4b1005b..44744c46 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -4,10 +4,6 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62px"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am62px_evm_r5_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am62xx-evm-k3r5.conf
index cd95a45e..1665f586 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -4,10 +4,6 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62xx-lp-evm-k3r5.conf
index 29638d1d..8319ae19 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -4,10 +4,6 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62xxsip-evm-k3r5.conf
index e846c0da..c20b9619 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -4,9 +4,5 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am6254xxl_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "am62xsip_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am64xx-evm-k3r5.conf
index e932928a..4b97adaf 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am64x_sr2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am65xx-evm-k3r5.conf
index 8744ac3e..23e302a8 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am65x_sr2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf b/meta-ti-bsp/conf/=
machine/am68-sk-k3r5.conf
index f8ce3688..4637f7a5 100644
--- a/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j721s2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am68_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/=
machine/am69-sk-k3r5.conf
index 9d2b4cd6..b989cf98 100644
--- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j784s4"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "am69_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-bsp=
/conf/machine/beagleplay-ti-k3r5.conf
index b597c702..6996cc2b 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "am62x"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "am62x_beagleplay_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/m=
achine/include/k3r5.inc
index 0408c09c..95dfd0c3 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -16,8 +16,7 @@ require conf/machine/include/ti-bsp.inc
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
=20
 UBOOT_SUFFIX =3D "bin"
-UBOOT_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${U=
BOOT_SUFFIX}"
-UBOOT_SYMLINK =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
=20
 PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
 PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bsp/con=
f/machine/j7200-evm-k3r5.conf
index 68061883..a35607ad 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j7200"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "j7200_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/con=
f/machine/j721e-evm-k3r5.conf
index 070bf7aa..6f904c58 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j721e"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf b/meta-ti-bsp/conf=
/machine/j721e-sk-k3r5.conf
index 45eaabb6..a5c10824 100644
--- a/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-sk-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j721e"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "j721e_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/j721s2-evm-k3r5.conf
index 508e96e5..40d10f13 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j721s2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf b/meta-ti-bsp/con=
f/machine/j722s-evm-k3r5.conf
index 2c884ffd..fcdf3e8a 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j722s"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/j742s2-evm-k3r5.conf
index 41bf401e..9adeb306 100644
--- a/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j742s2"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "hs-fs"
-
 UBOOT_MACHINE =3D "j742s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/j784s4-evm-k3r5.conf
index 04feebc6..754eb5f6 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
@@ -4,8 +4,4 @@
=20
 require conf/machine/include/k3r5.inc
=20
-SYSFW_SOC =3D "j784s4"
-SYSFW_CONFIG =3D "evm"
-SYSFW_SUFFIX =3D "gp"
-
 UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
--=20
2.39.2


