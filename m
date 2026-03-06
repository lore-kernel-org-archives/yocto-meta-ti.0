Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF582FCB61C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:55:20 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72410.1772812516976562035
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 07:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XPZbM8ZD;
 spf=pass (domain: list.ti.com, ip: 40.107.209.23, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=si5d66EqSu4z8RPCYU8hnMnAsX9li0PLGxNS9+hQi0xEmJvI2iQ7lsPX5qwNp8HqDVZrMa+/lqncyp52zqH4/e1hbmPbrh+P2aSoB0XLtTkACwX0unPl/70N048Ef0tbNkeiQd86L6QKDBrM5hcOIMAJfhSkV7CLsnix/m2OgE6T8OiNDabTSFM0ytt7R4Gr4Ya8Oews/1+ub3sZDzbYHBIE3WsuRLE+tnNDFs6pERird4/8VXWSAkZa2rYgUiREog8KHeKOGpGsONkFeI/JjesTu+OY1fLVcaBCF7kAoBfhHR248NvKvFI80eyq7R4mxvVqBDd+/hrdQ+ohbHVRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veIsi3ShgQbs/bCNetLVk5sowNGRkJl4I0c9fNaYnno=;
 b=JKJNoAtJVjf8XaLDN8c84DbBX8mos1EvK79OCkT8naVlhYcoFjQM5ZiPvITaFOUPTB1NDvpg+JZdVDnIqOabqB3t2lTNK9hFetxoeAXwRwzasxvBZ4MLhAxNct0vYd66U+uq1DqrmgZEOStCsrd9PefeJ6tmHtRK4wR8lCSCgBwnFFk/C4iwK9LmtVWI8J8dB8z300q8gDhPtwXb1t1Szubw4HtYozMbGHkdDJ0bgYFvuO6mgHmI+ieZRolS/ppkdKrOlO0o0vbZBSvcGYa82GDRlJLj5nGPU7/InE/YQiptWu+RDPgzp+5KEA1cDuAn1yrjbK8gYV4W56qP5Qwytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veIsi3ShgQbs/bCNetLVk5sowNGRkJl4I0c9fNaYnno=;
 b=XPZbM8ZDDt7qLqTwDRP89S43rZ+enOMpBcYt0wUp3fePPBXyp527WSDQ9NuNmsexftGQuudRqtCXAcv4jezVVwtH64lD6pG/cgJvdglWpOiYirdDt+XBSmrerLPT5AS3UZPe2UqRTRpL5adAVasDRbcNHVhUzBOhPkUQjQic/Lh+8T67xjWeAFwcTgsCnlIWGWldgboYPLYsj3TK1/INmPv9sgjeE5c7p7wuWF9YxwbacrsBsKxn7jIGREbvuz2VccficadIyqGhmCiRSNIvPfSB3Zphtak/WE07DRuTkpUIWDTMhEkyHolKzZpn6G3PhhpZHmcuOMDDbc5sUpLnMA==
Received: from SA0PR11CA0158.namprd11.prod.outlook.com (2603:10b6:806:1bb::13)
 by DS0PR10MB6870.namprd10.prod.outlook.com (2603:10b6:8:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 15:55:09 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::c1) by SA0PR11CA0158.outlook.office365.com
 (2603:10b6:806:1bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 15:55:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 15:55:08 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 09:55:03 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 09:55:03 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 09:55:03 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626Ft3P63125426;
	Fri, 6 Mar 2026 09:55:03 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 29FE82A69; Fri,  6 Mar 2026 09:55:03 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603060742
Date: Fri, 6 Mar 2026 09:55:03 -0600
Message-ID: <20260306155503.3089905-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DS0PR10MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: ad810f0a-d707-4b1a-5b8d-08de7b98be24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	MsXErPfXTjsSxHNTKuDnCbu8gmOZIJRVhBbbzY3y/YT5oCN6FmZZWUnj8rKNsXRnKvfFx/eKN6pIY8DOMkU+Vah+s5IjclB+zG6jyC00MUfh0hgG8w9t2jGHmOChczqhm9av8oQRjvQlKhdWEsPhF4FIP3M1JAOqW6wmeeHcb+mff84F6WayQ/8hhosGF9KB37oTNsAWb8sKKKG8bmx61LeGC61SrIvOlPfb63RgfRGU9uE19g536ijktjtJxRTJtAkRHmTUeTbZazr/TyHKcnH3DL9asGEHyrJbUkb9sQa80Hb36M1MgBgd4zAABHKeMLhvuMlgLjs37PSBPrNHpibUD9VBaLSJEdPjc8I1UbAYnNu1Kpgz3uGsyIczFAthWTPQZM6nP8Jsw/YSGEr56Zgo3wTtWJmzQlitazglZelMUrEqY+/NE54gVxlhE+ZGdHxzOflQ4/DKju7HhlRNT+IEOKfaDIqVpX1zxhueGc8XOgMOvwbqFYgZeboLH6OtrOiVmcsjuWChZDqAZ5AXz14GGfZR7cQwl+QYYrknzjRBywax6Mwxr4ivvEw5qnwRJoAmSj/Dig7EkXgMwaskI+K3YOct5jzxdzulfeIW0IGLKum9msJDIvixjtbyZjhVOOGsTx7ygn3WhUCANvZND+n7m0a2GJN3UJ3I1IKVHr6dx/W6R4xBi1CroNgtCYAichRPRVsioonPxRo6rqV5o99Ptxocg3kOP5rXBg8vAdCFKLVUtOPF1exqAGQSzS93/OuzfLor+Tiw9X3XvnaLOg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fV8NWky7DW6fKFK2VNjkbihdmTBmd2A3mcKhWeb44cyvD0Jm1QDTXnMZtuRRHNMGXxGEk25Wd5bgPSJh4peZDI26Y3cbawbAxrr+oUgnwleACyvMbY658vo7Q4/sIvsHYXFXrRtqAn/nkLRzxU3Le27RNHjD6Vg+PeB/GerBntr1a7/TKwW/TFCm2hbTZGsByAtwIxesJx3Y12reu0K4bF72TWUC9WrYTDCNINB9WDMDFAunU910lGkwAp+86pOQzpvFGfnts246N97OKhTeJYDIuSiS/N/7d8ZCp+wYYWiEU++Q4U5UM+a4wrGnH4CMTlv8Vf+3YrKmMY3hCbMxykk8J+rDjn0RjF8m8/e6YDcNObMF5UXKz6kviSCvZzIGBNUCbafVr0+ETy9ZQcNf13TWzmusAsuYz9gdfMKp2VfYn2VMbuZ7+mZg7aIeaTgT
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:55:08.8089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad810f0a-d707-4b1a-5b8d-08de7b98be24
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6870
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 15:55:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19667

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Dcf4a45b898294c96af02a62b7321c35651b3fa67..58a8a47f9063=
cfcd9eebcfb2825b99a34ef19b80
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D90e682a353fe494e4058068a02bd8ee9f7a1bbf2..8dedb46bfd7e7bb=
a52cbedfbab10fe4383317b7b
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D30182cf3ac7db7fd66c36870f3fc5db91a32f36c..1ae61a3=
25571a4b242dac987edcbff0bf11cbd35

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 5ae90637..2a1aba95 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "cf4a45b898294c96af02a62b7321c35651b3fa67"
+TI_LINUX_FW_SRCREV ?=3D "58a8a47f9063cfcd9eebcfb2825b99a34ef19b80"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index cebb5875..9e8caefa 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "6f5afcdd2c5f07aef0fb325ed979d49f63ae9c4b"
+SRCREV_tfa:am62lxx =3D "6cbb606a1de234c08aaf6eae57ae24f6422ec111"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7c466486..7c00623e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "90e682a353fe494e4058068a02bd8ee9f7a1bbf2"
+SRCREV_uboot =3D "8dedb46bfd7e7bba52cbedfbab10fe4383317b7b"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0e5ea5a5..1b05b120 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "30182cf3ac7db7fd66c36870f3fc5db91a32f36c"
+SRCREV ?=3D "1ae61a325571a4b242dac987edcbff0bf11cbd35"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


