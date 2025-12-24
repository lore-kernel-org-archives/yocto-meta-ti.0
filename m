Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0046EE776F0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 17:41:04 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.124404.1766598058843858705
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 09:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GcqEmRja;
 spf=pass (domain: list.ti.com, ip: 52.101.43.11, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqcPt/OGlFrVLMmxvKWCDkAVLdVRuef8a7vOWFImnhWQbYFGavLQ3fvTOddwBRiVxSOYE0k33hyNWRYirim08crRZuDZfUGVZ+u/PrK+qniKxEnzoBxK9pDXz4W4FHSS3NR1stthMwDYSS6ZfS5HgTKXaUDOHs2EaWvRNfbd1qYd2Os0VNBHYSa0C37FqhpeCYM/X3fdxqmpgQ2eVnDj7aulSRMFsd92vV44qFEC+9T4qgpmb2D2u0401LGcdBQP9yqHuZO5NNqOepDRHBQAAmM50ATsaR4NOxip2kzHjP66NoDoFvMhLX9LcM7pMAqM4FmTClHLJyW0jIl+H7uv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y877Hok5ddwjjC5Y/VSW1dyU5LHal//B2L06ikV8z6g=;
 b=XRBRWaXAEFAoO4MevkUziMhfcjlw9gcwItYUEHAr5GOgmFZcQSnNYmpdyDj3znvpgBWA3ah44sFyMYNNEtyAStM/XE+GpXiNapGASt0pRd06Hf4e/Grgs3hXmRT7tt3tJWmDoCymYN+5ZZ4BfTc7D+H4Y6GB3ZfXlsEcLSOeJyZC+rOk7/PsRt1R6ifR6oz/+3MTVQQB3DPnQGShkHCDp5B2En3PCImnH4SVBm4Vng+iFdER2s6k8qVfbYuAo6SG0e61rcxej+LVielou0I04c7c428rQwKkVzX6lI6/48AT3VCPMpYCnjIfWPcTcB1NEF8xzaPQBsXRWMB2V6o5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y877Hok5ddwjjC5Y/VSW1dyU5LHal//B2L06ikV8z6g=;
 b=GcqEmRjaRwv+TSrlJRuFbIoZfTRpURtOMvZqNL4Bch7QvFFz1JZwh/dE6i2TV4jZ13MVxl4jHaq9menmc+VChz72TktvvH2E3AmmCowrN0iq/laMhlSM7IwmY4PZ8Y0uWJOnbihqKUOUgLCohxViAuC3Ayj/oQFmh4G9Yxgps2Ec0gTCfnRyDtkeFOJNNQxD09EqVVtOkEExSGgYQ7mhJKjU0N1bxF/c4JVMCcJxw1KAg5p8+67j1KnoAQYAgPFw0XLbi+Fdnk9OwA32ogH2EwZTPJxKqlwpq4SdrH2PTQWcGJwV4mXE35ofPI32Y/GHZo3Y8puPP5uQQLgmDs6FgA==
Received: from MN0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:52c::20)
 by SN7PR10MB6665.namprd10.prod.outlook.com (2603:10b6:806:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 17:40:56 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::a0) by MN0PR05CA0005.outlook.office365.com
 (2603:10b6:208:52c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Wed,
 24 Dec 2025 17:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 17:40:55 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 11:40:51 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 11:40:50 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 11:40:50 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BOHeo363184387;
	Wed, 24 Dec 2025 11:40:50 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id AFC9F2A61; Wed, 24 Dec 2025 11:40:50 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512240400
Date: Wed, 24 Dec 2025 11:40:50 -0600
Message-ID: <20251224174050.506084-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|SN7PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1a3d64-a2f5-45e6-f867-08de43139750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yMQmo+adq/caqpIy0imkI8+xv1y4ZgascwEi59Ly+j2+IOVsfmQIKJUBNCOJ?=
 =?us-ascii?Q?VomOO2m5JhPSMOxoxPEPxBr4jFLxvuIJcCXzjwb1Uce0b3RMEpu9G2aYHHCO?=
 =?us-ascii?Q?QasXapOnmcow3Ir8rS/IIpVYBFQNn2bzZzQpQg35xtbtQX5YJNw9kbqYqlNQ?=
 =?us-ascii?Q?gtOvCUU6OWuYoHqFwk57m10KALsX/CPkzal2vLnZwUZmqj2nMkV9CwtEpFsl?=
 =?us-ascii?Q?tADDJ/X9eAFRii/HbFWi5a1r61DxRYG48x5dd1Th9c6G0Ea5WQgA3DdImmVB?=
 =?us-ascii?Q?zKJtUWJ1f0NGMmpCwi301wMYepRjbazti/FGHXDANy1JhZujddmpyEjIiy+3?=
 =?us-ascii?Q?OtbCbvqaiHtF7D6pyTXMiS/e+nzNgclY225vhs2MkK25gIjk5JdWGe3SFQYz?=
 =?us-ascii?Q?QlOLdpFGC9FvIGLm+9PmBL1ZIhcOa0Er3nFQ/LqalRpyPTdw1IPXXj3a1i2o?=
 =?us-ascii?Q?dx9gycUBOwxjjpSeTTLOA+MFHF+/JVXZf4XUwmmXKzcjgpU5WSkCCIbCAq87?=
 =?us-ascii?Q?qq0IzMJ6IAxkKGAZfEl9GzAiWd682VtjY6y9GOgQKJVWoR2Lam2DTn4Z0ga6?=
 =?us-ascii?Q?Jppu4kXibOONMxb/I047mLPzPCbnn4wJrU3WbE9C0uitgK0xacaE5XenGJdc?=
 =?us-ascii?Q?zcwy9ikmMTrcrEs0Wr0kbiyxThCLI6dWZShbQ/Ja/nJc6kR4vg0fOY8HJEcQ?=
 =?us-ascii?Q?BPwivbK6GaPk4kAOap2ebWAbpFbIR9MU1kNMkp/CuL0xnpf+ELCX3nGPbWWw?=
 =?us-ascii?Q?Ykj9rfGbrTO+P6/9dzoSWeJ1c+q8KggAZOrsc4NoOpKeN96skZaYO0IY1luz?=
 =?us-ascii?Q?xF91APtSCk4bd3IX15MIPiB8FLOCBaPDRje2LiSeoBUah4eY+gFx04oLSJDC?=
 =?us-ascii?Q?pHfcgbIXNFaFmYFCILiypuRXrW8Q6qOLDlYDuwIDV2QYVkv80wjx/vfAkJdD?=
 =?us-ascii?Q?rSRzpPZy4WPKk/KFiTthdvV7LyXFLhnHzdt1UkdUPRU3nycepfEK4LMrZOs9?=
 =?us-ascii?Q?oZvclQzQ6A94YFjbZZHgBTtQehlKf9XlqPV5Cnj8dXL5siGH7T3Gz0E8nCGF?=
 =?us-ascii?Q?2nCYp6gBa7mQMkIUmKdsJhSFNPCTx52EL77q286zyL/9pV2l1sJEUZjPszQX?=
 =?us-ascii?Q?zA12p9Sm4gKFRffcTTM/TISYoKoTL0ealLGd57YZUQhxrgSQH3tIK7ncwYcA?=
 =?us-ascii?Q?7rnenbNnBVrdwrUd4UXEanNTPrCKPvqjWDqLtNNTvmUYMnlcnDntraE7F+V2?=
 =?us-ascii?Q?uMEfvKbVoOPm90tNE68K7gmwWlarIOMnYTKV0VyASE2y3uGwvVafl/ASfDH0?=
 =?us-ascii?Q?K0GH76PGEGpMtJvrX1vtRcyS4L6bwG5F8exEdXt3vhAkJlXbpUjsiQj2v3wj?=
 =?us-ascii?Q?vh60r65am5J8FQTpArhRb16kjLEN6ADFqvbbfUdP/dJexwMkZmJOgLA/vnGx?=
 =?us-ascii?Q?9U1lJbhGejaYKgjGZQglbiIMcJEmo1fwZODCWu1A1ce2A9tc3Spt5f1NAnbP?=
 =?us-ascii?Q?3xbQRU63Vt2pBuXsUOosvrxC3YnQXcsTLu+1GPsbF9NmwVvaHwlsRUlADOHA?=
 =?us-ascii?Q?2jTm+/ajup6RPIm3Zr8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 17:40:55.3030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1a3d64-a2f5-45e6-f867-08de43139750
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6665
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Dec 2025 17:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19390

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dafb6e41006ca88067397873e015a21adaf31fd06..df1fe238230433b=
a3e5b731356156e145aa90917
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D2a440e3d83789c8220b722e077255a89d826e48a..1379=
a8eb9786e78509f67ff8eac658bde5ddc66d
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dee0a0f44964f12d6668a14b4b0b3594ce2ab8871..15b58b1=
dcd0e0a79d83740b81da1a1367f6f3f68

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 926f27d7..0abf62cd 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "afb6e41006ca88067397873e015a21adaf31fd06"
+SRCREV_uboot =3D "df1fe238230433ba3e5b731356156e145aa90917"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 6155e0b4..7d0763dd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "2a440e3d83789c8220b722e077255a89d826e48a"
+SRCREV_ARM32 =3D "1379a8eb9786e78509f67ff8eac658bde5ddc66d"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f249f133..91f6c941 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "ee0a0f44964f12d6668a14b4b0b3594ce2ab8871"
+SRCREV ?=3D "15b58b1dcd0e0a79d83740b81da1a1367f6f3f68"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


