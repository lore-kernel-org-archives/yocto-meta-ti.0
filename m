Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFC3EEC2B0
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:58:06 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9085.1771891076754126139
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 15:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=W1fjQS71;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.56, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJJ2Rl8xqhSzmA2NCnY+6afz1x4kaGKeZhlT31APFuOJUNqz6oVHG+bxeiScljr011BGSiPVxleG+6lGRQVx7wrbA3D63I+w08GFdm/mU2LFQDhFTLKeIFaE9yVBywE61z/38D951B3x4QTEOsFZ9kN1mW59QfHfXwji9Gf7ZP710wxjgS1slXwR2P4BdEJbVnOgB1pF2vpo1XDOkVif4fqReRxaGufZVsrqRDQw+JDx5ekGJxFjwT9mpI6b9/zMAWxVm0CgmKIBzNAadSCJUQeiraf/8FaRFjv2LHSXl4VddwUJImgj55YcR8ENzeX5TQrwvrgZ92ifRmEldd0MCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZlbpmZDWj1fmQ+FbAOqLctwjqqZnuAOuxATKlpvDCA=;
 b=yzNzK6s+5b2QOByUe2vrVSy8sGB5VKprZAKKQRvafFTQGcdyo+ns2sXIJlgcTvda0rYpEtYOlbvEXKq3BwVPPtgDDC1HHyODajZhYD0BQjKv0BYbAMHjMc1uNr6+LUV4CU83SZyQDBwoIMaq+vz1ly76LYcmWpmzYuhUWqYeCPQ7Uro2TId2zKjypEFTcOyy8a5TdxqdH+FwFuN62jJOVJmfiaGQ47RWpGpIlQJAi8urWRUaTBvUeAo+O9ZkVngEnIhMjdLwnOA46p0i6EA3P1vYnDawSJ8/M/ajQ4fkXNBdojFd4ZcdfrmR8oySokAh4qSNhOLXNwxov6PqtxAc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZlbpmZDWj1fmQ+FbAOqLctwjqqZnuAOuxATKlpvDCA=;
 b=W1fjQS71yJ/t+YK0XlaZNRKqD0iukA5uXarjUWla3IV8MyMv1HrKyQMvsCUj2LH0dOZNyT8yyutoM0V0UWF2+oKLRXLo70A7zP0tZx6wMSTlC9NOG6TS8VO5DdfP+wERqei1nGee1C6Qos2vl5jbql8565q7o+v/P25LGWUGb4w=
Received: from CH2PR11CA0023.namprd11.prod.outlook.com (2603:10b6:610:54::33)
 by IA4PR10MB8352.namprd10.prod.outlook.com (2603:10b6:208:568::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 23 Feb
 2026 23:57:54 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::4e) by CH2PR11CA0023.outlook.office365.com
 (2603:10b6:610:54::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 23:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 23:57:54 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 17:57:52 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NNvqwd1698885;
	Mon, 23 Feb 2026 17:57:52 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/3] beagley-ai: add beagley-ai-ti
Date: Mon, 23 Feb 2026 17:57:43 -0600
Message-ID: <20260223235744.3928753-3-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223235744.3928753-1-rs@ti.com>
References: <20260223235744.3928753-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|IA4PR10MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a1ea50-72c5-465b-9dbf-08de73375c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9PJqJbkh3E4105r9zuI9lPDIWdKR9ySgS+HmtvTD8VCF2189QP2QE9SOg8cc?=
 =?us-ascii?Q?CWIiOXeay9HMTVkqIVYA75BcLvfQsIAgG7r8GSzru9w5K/1WzOUikLSLY7o+?=
 =?us-ascii?Q?NXmSDGfrNT2VQrrdRWmFiU+PHcxvKI3e0b5QjHU+vrbICp0F2hhM6b5PJKed?=
 =?us-ascii?Q?7iTCHfGYNpVGMRKHhXJA5cvvy9oZ+BZUvtaUXWddJLhAHYBgOz28lgsx30e7?=
 =?us-ascii?Q?TFPZvGQnemIP+vRJb9OWBlie5JRLy2ETdv20+CHutt+vzNhT0lm+WsjexzVe?=
 =?us-ascii?Q?IHbol1kXypuCUf7jYx1gunHrglGwLzBkM5uStOySOMt7P2Q1DzYQoZiW6PBp?=
 =?us-ascii?Q?jXbKeoYY8c1+LVqqKHZhmNBzJxaCAzrxyaBiWmykbgO+DiJ55/AOIhwJFijg?=
 =?us-ascii?Q?Hrlru4Bwet/a2ZQEzzboWkhHX8a9igsjFpiAG/OmuoJt/awSzCaUb5UUxRSg?=
 =?us-ascii?Q?2L3py+Xynfu7VJ2w2sEXmHjY6Zqm9q/cJoze2jhezSPwlzdqYqDpN3QDEPe+?=
 =?us-ascii?Q?LQ+WKBK+VFfxRXQdxoGyGcxIRS4/6b5iLwV4hut1ArN037YTd7UseddPrFu6?=
 =?us-ascii?Q?f/Ap4Spr8w25nquHWYPZJf3I/qLmVhrP1w3XKuZMDwg653/55SkgZKmDH7wK?=
 =?us-ascii?Q?70r/0814rHauGQSiXNXkp7iX+q7RtpzDRp22er13MDagXKLsuge/9n/5PR6u?=
 =?us-ascii?Q?yM9uAGLVFYmYjREweCsrwU6aSvYiB38jzsaTGnmvGBl/uJmLVCyeRcyROAcO?=
 =?us-ascii?Q?o2pTFMc6fzHDLSPDaugPawrH4Ec64yKs5uslNuBdTpUZxK3G/xZGZhMRlxJ5?=
 =?us-ascii?Q?2CgMk38KSIB3Hs+Jeaps8U+SrpfmlI3Ku9FEiD4NKINTqp6M7THWUNUdnAT1?=
 =?us-ascii?Q?q/Y/y1PVeGyNl0ugUISPTRnKbsCcyKyzqUTjQ7tGqM2UlxsN+PsFBAXghWwU?=
 =?us-ascii?Q?PY5w4krSdBQs2Esw7INxsSK8pEK9SFWhD2tRIN/K+ar+YSsRwOLagEdxML4m?=
 =?us-ascii?Q?YZfQNmeghu/u3n2QoyHYyu9vapBjMmBi1hMF1/pF+gXpCjdBLOA2d+/edk/y?=
 =?us-ascii?Q?/Qx1LLYuB5W+3k1LB3Zm4+F4oPAjJ1j1g0VPs/BzxSVSW+4FAJlej/wy5zjr?=
 =?us-ascii?Q?eYjRrcLuCZirGBatqAonGNTjcnAaekDeRAlJXXX3EIV4/HH+LoOtVwJpvdiU?=
 =?us-ascii?Q?Vshsm6pNUy5pL4Xykp6bhMNxyvWFPwRqVBYYEpwMOm0uC4RhU6m3HHzXh/fO?=
 =?us-ascii?Q?Me/uwC0iVtfHhjYd46ww1M2o64HCLGiU9tCPdAcdshLBC9jybh2WCu6jkyXL?=
 =?us-ascii?Q?QjHlHmK2feIQ1P35JTCQnLzHD7uksovQOSeLiMxixI3lD45IMcetEDLC7DLk?=
 =?us-ascii?Q?HuS+vv0I8DszBYEZuTdA08ZFCOPPjUgHuL+PmUrnvHRIoFy0W6xCx4FhbdgM?=
 =?us-ascii?Q?Iyr17re7UNykea8Nu61qezTk++HZC8Xs3kySpajoV/2YR6lJc4Lmz32g5Nem?=
 =?us-ascii?Q?qJPk7kEeEopbaTutn2LAJ4sLBn63v8QUh13L4WDr86w5e6lKhVxdirJEtWqk?=
 =?us-ascii?Q?zPs3eQWFcxVEFFRxAit2meC8f6Rbpl0sWB9bql4nAh3It2C9Q2DNagnhIxOh?=
 =?us-ascii?Q?jJPzadnUCSnt/04qyABoCZWe2K6TBovMDhz7t5IlKhJ5IxXJdA++fpdoehas?=
 =?us-ascii?Q?r0X2Ig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qGf4IDJK9fcLawGP9J0fsY+fEhJwWkzt6Tq9aQE2CM0YOMClyaxiGUw8makdjVDYmiSdRj+O7FjKPEuidlN9y+iKSl7Uy+/FWZP2FYmjb0RS3emciMyft/eWOBC2/E2CYzomM98lHSbhdgpg/4CrHRZrB2iN63luNz94DxLeXXhIQMvikWlSnW0jB6c+/Q4GHuyV7VH1urThlwkwtPgYFfZo+Rrol0oIt2TTUyvAELcoxc3EhaSXNUjMfIL1ZIzf5Hyib2SrqMyKlKJn++WwjVgXYBB1JT5oWs5pYlm9728xc/uMiETnZPVfZqYEZQ93+wNhKwUbYFGKEjMfVrJ7TK5Krc4BILeWyRWuH5nYmmC9vaVN79xX4W300r4sy/0/H+uZXKAXsuiCkIHhd84R8yO1rIC3dgegWmKctH4KXJdqGdC+/b8QtBTJe3d3QYQC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:57:54.1447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a1ea50-72c5-465b-9dbf-08de73375c51
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8352
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 23:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19579

From: Randolph Sapp <rs@ti.com>

Split the existing config into a beagley-ai-ti and beagley-ai that
includes it, like the existing beagleplay machine.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-beagle/conf/machine/beagley-ai-k3r5.conf     |  6 ++----
 ...agley-ai-k3r5.conf =3D> beagley-ai-ti-k3r5.conf} |  3 ---
 meta-beagle/conf/machine/beagley-ai-ti.conf       | 15 +++++++++++++++
 meta-beagle/conf/machine/beagley-ai.conf          | 11 ++---------
 4 files changed, 19 insertions(+), 16 deletions(-)
 copy meta-beagle/conf/machine/{beagley-ai-k3r5.conf =3D> beagley-ai-ti-k3r=
5.conf} (61%)
 create mode 100644 meta-beagle/conf/machine/beagley-ai-ti.conf

diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/co=
nf/machine/beagley-ai-k3r5.conf
index 06c74cf9..2d6948d5 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -2,10 +2,8 @@
 #@NAME: BeagleY AI (R5F)
 #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
=20
-require conf/machine/include/k3r5.inc
+require conf/machine/beagley-ai-ti-k3r5.conf
+
 require conf/machine/include/beagle-bsp.inc
=20
-UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
 UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_12 =3D "j722s_evm_r5_defconfig"
diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/co=
nf/machine/beagley-ai-ti-k3r5.conf
similarity index 61%
copy from meta-beagle/conf/machine/beagley-ai-k3r5.conf
copy to meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
index 06c74cf9..eaab2d57 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-ti-k3r5.conf
@@ -3,9 +3,6 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
=20
 require conf/machine/include/k3r5.inc
-require conf/machine/include/beagle-bsp.inc
=20
 UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
-UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_r5_defconfig"
-UBOOT_MACHINE:bsp-ti-6_12 =3D "j722s_evm_r5_defconfig"
diff --git a/meta-beagle/conf/machine/beagley-ai-ti.conf b/meta-beagle/conf=
/machine/beagley-ai-ti.conf
new file mode 100644
index 00000000..d6d05264
--- /dev/null
+++ b/meta-beagle/conf/machine/beagley-ai-ti.conf
@@ -0,0 +1,15 @@
+#@TYPE: Machine
+#@NAME: BeagleY AI (A53)
+#@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
+
+require conf/machine/include/j722s.inc
+
+UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
+UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_a53_config"
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am67a \
+    ti/k3-j722s \
+"
+
+MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/ma=
chine/beagley-ai.conf
index d73d0506..d2c68201 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -2,18 +2,11 @@
 #@NAME: BeagleY AI (A53)
 #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
=20
-require conf/machine/include/j722s.inc
+require conf/machine/beagley-ai-ti.conf
+
 require conf/machine/include/beagle-bsp.inc
=20
-UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
 UBOOT_MACHINE:bsp-bb_org-6_6 =3D "j722s_evm_a53_config"
-UBOOT_MACHINE:bsp-ti-6_6 =3D "j722s_evm_a53_config"
-UBOOT_MACHINE:bsp-ti-6_12 =3D "j722s_evm_a53_config"
-
-KERNEL_DEVICETREE_PREFIX =3D " \
-    ti/k3-am67a \
-    ti/k3-j722s \
-"
=20
 KERNEL_DEVICETREE:bsp-bb_org-6_6 =3D " \
 ti/k3-am67a-beagley-ai.dtb \
--=20
2.53.0


