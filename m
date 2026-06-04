Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB48FCD6E77
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 16:32:15 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15851.1780590727862464105
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 09:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FJijSXXJ;
 spf=pass (domain: list.ti.com, ip: 52.101.52.18, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svV9Br6oG2+jO4M4HSLTRMvucMgrHyEAgH/KIumQ/BfFXnXVX6qBdeOJPpRUgrcOWkPoz1grKDDFVJviuNipPoUuY2wVrHeAwQDiK/hmXBEPtbUq88QQbssJ6Dxg2hJQYRzXXm5LLW1lq5FFqMv+nKuEdri67QqZwMfaYSughtnX1b2IX08SUjxNmQuHDOG1U2o77/uORvkLcRcItyOghmKYKNdrCFEUP9vE3f6UkIpRqUMF/IcLR0svV9HFQwCoGWr7/S9/dbJJA5bR8ro7nKlF51Y4zFEGKNYVSUdQrw/ouqCFm2vHz1JrqgqNGhmBWKLKP8A5f0855Nw3PWp2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo5/CoIpNh+AcR9k+RmpKruTsT4hnyY4rlYJsrRMdYk=;
 b=JwaG+qjOh9RjfsjwTtIXi+9ZX4RppNZeH1lzTenjvwomO8KubN3VIFDHGfOp//3twbpvoqRwMi0c6J8aOESTyWLPb8siLVppDuU8DVy9qU/kWbNquE7iVvTtS/ewlVXD2GS9FoPdGWfpJmSIul1IwxbtkDzMpHfAh87yh6Jue0+isVMI0Ojuynme9IyuCFBGfh2/qfgNnuhXU5YeMAm5CWOf3GMAplagz9NUp3p3s63QaRImvrJxjCXdAh0fu6LL3cFj9p6H+y2aWX5L6Nuj2sAgxNjugiznfsqNtfygA1s8UoUs//P5wzxhu6P7vPF9zAnH7qRP1ArNNj2fkZ4EMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo5/CoIpNh+AcR9k+RmpKruTsT4hnyY4rlYJsrRMdYk=;
 b=FJijSXXJeO4ucfpnk9uNtr/eAbiV3yIZTTbq90Ji14KL6jgOf+Etw+VEzhZIHF2YeYpeKdRi1pEhmheFUQaryyUE7xNbWiFLJsbXVGwJHlwT5H0IkyVCeqgUU5E5CRes+YfuM8KO2pxzZTpLkgb69glj73qTjYMO7a0ZJi9qLkC5gsFG87NccTnbnO6QcpEv/OtiUA22sKrbIs005X2F5mjrrWg9QXHKlWbKDbPWgm3L2KKGUUNKWIVC1aPciHBKzKygj/J3dO8qeLtJj1TjHeogZAsPxwUSlgGThmDpUAjmQgtuxSm+gTbT+H2beIx6BjC873NjQ9KDQDMjV/T5tA==
Received: from SJ0PR13CA0227.namprd13.prod.outlook.com (2603:10b6:a03:2c1::22)
 by DSWPR10MB997933.namprd10.prod.outlook.com (2603:10b6:8:369::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 16:32:05 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::9c) by SJ0PR13CA0227.outlook.office365.com
 (2603:10b6:a03:2c1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 16:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 16:32:05 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 11:32:04 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 11:32:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 11:32:04 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654GW4Hl083285;
	Thu, 4 Jun 2026 11:32:04 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 357792A61; Thu,  4 Jun 2026 11:32:04 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202606040916
Date: Thu, 4 Jun 2026 11:32:04 -0500
Message-ID: <20260604163204.3358962-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DSWPR10MB997933:EE_
X-MS-Office365-Filtering-Correlation-Id: fc428782-952b-41cd-4eed-08dec256d0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	X2vewmIPJFCT6brIHtxWyzZxBUo3/EBgXGntk4OhmM6aOiPWDIx8r5+vQhfhR0rTFa61CgMQv1nxVZYUfQ3LAANmh/V9BqgmXaoXpf85p2euN31buPZ2PGncEI0J1ZCk/2q7FRqSEpBGHeA+U3ak5c2+ck0zx9eqnPOiBuWgvw/WebVvNzlPDfSj1sjEBhDqEjIaKq85RfPz/c7C8HkLLWEqbERRgwu+C4pTlbu09TPpIebiZzeQx1mzBFjjjhqo12jxaplVxxGYT/MCRDyFd3A8zGcGlvOtZFKGRfd5aL3taprem3jR+sC7r/TacG2lzlW1/p3fNx5t0ADdgE9W+y8X834MVZXVUYcSLH6RXavaRmHh4euTasSyh0qoB0VgKSqKGPC96y+VeyNL9mBlPOSnf2L12H4ahE6oQLlq6LnSVRbr9Mzo4fHwBVQQoEg4U1qWVN2e9HBK8hjR4srPC0D2V/+iwsKgK98GmtNRBpp4j52r0jacyFud6VTPK/krGGgOYvhHWeIomqjG2epbL7/MNlJu4CXHq3lnBuJBYOnKoBKPIPdi3Rk4jC71QYfufVrqX/GG6DvAeS2PRRnVYHCOukedkRit+aBsOANvBw6GTlcr+owfIp7hmMSv258X978HrCEihXDrTAP3vGvZ3GGZK4PAw74kTZeRDhRCpKswlJJWhYSR59qwcgmpMLh0oObZGkPHihwn2j23fPo+gbWjR3o7co3m/62lMoqPfkM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pRA1dUgk/qs1Fm1Z8LYw1BvBCAOQZITYLbDWYvpStSb+4lWsPA7GKCDkceUMRYjQDn2H0wCKtG623Pd3fN43VJ2yEIgDGb3Nqvpz5r++t3j4u/P3nidcxv30X78BC7krolDH2TKg2tQ82C+wVI7vUqhmE99TUj/p4vTFjaWlFiUcmsko8XePGCMTN+3PtBpF8JPqWoSKFfHiIxxGngT4eIra3yvtKUlj+spj+Xf0U00rfAcqKTtiLbj3DkQyKJOuE4WXEO5k2wEZzYLxogk3xMYjGrIflpvM58bQJ12yhTYLMP8nk2Z+Ehg6RWra+/77mERjFPAfpIcWqn52v+GjlvqLSvDNrmyBEbdeZMapmaVYFOmiBM0NTESe0mezjeaXDIDALaF1ZGzKJIsX7RWnv5t1kzFe7k/kmsulDfm+ttZaLzg33NuJxAY0zVAov2Ts
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 16:32:05.5122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc428782-952b-41cd-4eed-08dec256d0a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR10MB997933
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Jun 2026 16:32:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19974

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D946606d906c6a07ff844c1e6f5451cbace08b96b..8fe6c3d6cab7=
3545d14e8c0969d19c8d434843fe
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D19795f63be7ee27e38b6e800ff6c88a2feaae13f..f6338e22d2ac077=
7a68fb0f295f4cf1e3e63f659
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3Dc50875c=
7c4ad112d5e632bea3301e06a0aa8669f..eaa148f9640a047511be89f7652f8b1e93a4249c
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D62fdc7890cde3197051743120ff44162b7356cc5..d7f2=
b5b19f14fb51ad279f76fbeedd0dfd40b69c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dc52c5589aab8c376f975b1feb7b8746b7b6624bd..4e3bcc1=
0a5d1e9822e0ed2dad5cdd16f7cf30fe6

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb            | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 44c0ddab..57c31696 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "946606d906c6a07ff844c1e6f5451cbace08b96b"
+TI_LINUX_FW_SRCREV ?=3D "8fe6c3d6cab73545d14e8c0969d19c8d434843fe"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 0b49e559..a8197c66 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "19795f63be7ee27e38b6e800ff6c88a2feaae13f"
+SRCREV_uboot =3D "f6338e22d2ac0777a68fb0f295f4cf1e3e63f659"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index cbb5792d..75050d16 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "c50875c7c4ad112d5e632bea3301e06a0aa8669f"
+SRCREV =3D "eaa148f9640a047511be89f7652f8b1e93a4249c"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 0d974c0b..21baed23 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "62fdc7890cde3197051743120ff44162b7356cc5"
+SRCREV_ARM32 =3D "d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index d0d76d74..ba02bc13 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "c52c5589aab8c376f975b1feb7b8746b7b6624bd"
+SRCREV ?=3D "4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


