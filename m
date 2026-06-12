Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E81ACD98CC
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 05:13:31 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63982.1781241201052591520
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 22:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=V/A+dcpM;
 spf=pass (domain: list.ti.com, ip: 52.101.56.1, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOe4lWdKfW1TEJ/7Wo1JgnqBeQ9zeHtZgBqroCOHDOsPPQdHyHVYxz6mEaFm8knH2G9Dpa/GL5W2jD9yu+CxJDb4Fvcghrti1z3WuTMvpTDuZosFTG0M9L4gRqZJ0zxx9sL/vl30Y+U+lNdSIGo6IZ8ZYqvybFgb542nNe+KRnVLfvWqdSyc19BhfPLxot1MKyVfSxa5fmZflnNaO91VdVLL7U/KI810PwecvWlJb7TIowXDNEzxPf0SZmrxgDxAeLQLbqkortpZrJW+VrLt4ubx1MMOqdlUpa2SZDf9bQ72c73PnVF+ZMGkezq1FvN25CXuY+Oh86m4iRlnVUM1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OjqHRK4By1pCR1Vn/qUZ37YEm1e8Q2Ho2zKnAQxDB4=;
 b=HvG8rocDMkiHPPDZ/fDnXqM/EX38o8i0KfYwNqq9wSIdEIh3cUR+0xApn0KAjfITVayRh7x0CAuayGHhSK4TiUjq+whaCULxgpQKw++HNXKPLfLkobw1dAyfQd5sMssmZ8bMWQ+4V24nwnY6j2Dd/9N9qwTYhQ51CkPR4Y5pdiRcAsADfTA77ISfD455oIzQGsXZgOJQmbB+Ab7ouAduM1W4pDMYb5Ik5GKAtUVaQ1yLQlHtvlX3pVMUQDsUU8YrCSdKjqcwHPYMAbmUU8cXkpCsOVzJbhRoJ8YTZgWiLk5+3jF11eW31TZWqTk49C6iDpe/OK4EM/SeBuXPvqC6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OjqHRK4By1pCR1Vn/qUZ37YEm1e8Q2Ho2zKnAQxDB4=;
 b=V/A+dcpM1/gG2lARzIF9WwPX+Dpcbl84FIDg4KcdBDXtd0nCUdxxcA8dGlee1oX/VnVDrBFM3oevsYUt2Fqs1gNS3KFWAPQBxNqO9zHQLSAsfg36e3L35ubxaMpbOPrny1nQtv0Ma9t8c5BEP4D/0WiJ7tAW2heqDNNsPjf4d+cgq7NH9zuYk/CKR5fha1C042MBcAcBliLHJQM+MSs5XWyN54qAXnbErvDN1iGQd6wPOnsRDEnTBpQiT1OFZjnPBupUUH66H3d/OreozsKT8OQup7gXMRQIt71TXSj19UPCUt0E+QuWpYd5mHtHR50HwQ/WZ5174SBzrFiFmsFvCA==
Received: from DS7PR03CA0039.namprd03.prod.outlook.com (2603:10b6:5:3b5::14)
 by DM4PR10MB7475.namprd10.prod.outlook.com (2603:10b6:8:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 05:13:17 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::a) by DS7PR03CA0039.outlook.office365.com
 (2603:10b6:5:3b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Fri,
 12 Jun 2026 05:13:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 05:13:13 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 12 Jun
 2026 00:13:12 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 12 Jun
 2026 00:13:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 12 Jun 2026 00:13:12 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65C5DC0x2793244;
	Fri, 12 Jun 2026 00:13:12 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 7B3B62A61; Fri, 12 Jun 2026 00:13:12 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606112200
Date: Fri, 12 Jun 2026 00:13:12 -0500
Message-ID: <20260612051312.844607-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|DM4PR10MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e78cbc7-f048-4350-5c0e-08dec8414d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	00nxu5xiUhSYofW1BILb5ATfAYgVlc9phqD5T5wl9Tj+A4qoF+jI0HG1GlQcM7Qyiyy6nbjyXibMeUm+5BqoVLkcZxT1hYKSZGArLy081QBJRtp46+UoT2gdqaycmmAKpuqqQ21U9OX4pC1RVUdIykVqy487KE4aQbhQu9l45KKPsz8oLSpxRjQP/xOrwuhjsXPVgVEe47UyciEKE+d6xYfqagWGcvNxylVSKhBQpaJQEQayb6esiff9HpPB6bSWmmDvI3o/HP4KAn7tmVdZE1nkEc8cUb8H86ZXZ6I+4HnXcQurzZUNZi+N7+OwdmM0rREW843qEFoO8P+CrcCDZ+moUdldqa+K84tJYO8oNeYhFX6XhLd8yzAWznJzJ3n8CXqm9kSEe4LjlgjfYM3n8saITm/f2czsyqkY2uxlbgGAsagaHBbRYyuXpk0zj9wJO0GAiE6Z8MNE300P8sFt+YrrRBZEXRJpBQ94lLQDlWEDNfpysKSZojyR+muuqq8KpC0dNJVisDH/iUp2FSO4gaDUX/2y19Zb4cf/sFf+3D7GkvoY1Bl0edsbB1cpC1xDiSK2dptP7QUtnRqnZaD+uEzUCco1O9HDADGWfaAgU+gU7wmPRMjHC4vdoeYTsf3xjrlgmH8ppcU4TXvGd12TjkED76VhrpbVhpU7GMqEzo79g517YMUKayvnOYHOrXYdO4iw+r1+oj9Mkn0dqWrHRqdQ40glPBDe0lauF1FCxPY=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ymabrJph6J2fjnkkU9EhLjmbxalXpWgbXZ39Ng4diragM9mP7XufHbo10MIbJ1HsvTkYJe7RyjnLgZjnY6DpluvJmAgzFGujrq5mIwR2S41vZrTMKMUmm06GHy0SkkjTGZ319dozCOGgEJt7ls1IuAsHg6oOozA+HU1Q1nuJqm4U7IaPKWC/Tf4rmvCfSEfHZqoOAc6AIUo8QHDeFkgL2fZt00kv3QM1rPoUXfeP9fzaxwAr0S/cpBpWfVxlnEECHPY3BmWXo89xZpcvO8upfw5bkJi/GbltIAkZzHrkVfrCDMc72iljuS/p6cQNUsn2erK9l0O1c+7JaWFuhAD3f82IbU2ruHZMsqNKUczXf6Dw/Q9c/qLqA8eO/hHsD6anUJvnulEXZwgUxL8ejCduPvxNzDb9tan2059/KFJHczz51mycx7Ppl0Kr/RLw10UO
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 05:13:13.1441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e78cbc7-f048-4350-5c0e-08dec8414d89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7475
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Jun 2026 05:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20034

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D1f603935204df4b34054fa3bac80158e528e2c36..617c6fa1c50fab2=
acb3955b8888ec71ae7630769
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D0472fbafd7277ece9e1bae4189bc6099e33cdbc4..4c3bfa1=
5a22a5c6729519e730459c483c125d5db
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D44a5a7ecf3eb23614b801d7f5a10f2deed4542ce..b042b729cf573537f68fa3ea5050f=
5d22b07c811

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 1661b35e..10697fa2 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "d87a51fe5eecdfac7503d0e784ef3bbfaba8a4bb"
+SRCREV_tfa:am62lxx =3D "bd4afc7d9dcc492b8894fe88a666c880b2fb1734"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 56afc908..d3a00652 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "1f603935204df4b34054fa3bac80158e528e2c36"
+SRCREV_uboot =3D "617c6fa1c50fab2acb3955b8888ec71ae7630769"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index ed87d378..306ac881 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "0472fbafd7277ece9e1bae4189bc6099e33cdbc4"
+SRCREV ?=3D "4c3bfa15a22a5c6729519e730459c483c125d5db"
 PV =3D "6.18.15+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/me=
ta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index a65c2bba..5514f2e7 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "44a5a7ecf3eb23614b801d7f5a10f2deed4542ce"
+SRCREV =3D "b042b729cf573537f68fa3ea5050f5d22b07c811"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


