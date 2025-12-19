Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47975D7495A
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 06:14:07 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11615.1766124838747821875
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 22:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=dqj/HLR3;
 spf=pass (domain: list.ti.com, ip: 40.107.208.65, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUHA4taZMOCs60RQ4eXF9A2sWTgx29iuf+GEvabHYMLVcnbXeJLumVNKz1uNpMMXdShTXDBVPNKhbnf/ViZievVg5SB9SSV7rSMXEDnA4sJIzhyVeTok1azO1+Nxd25v3NPjxBLAZj0mELI2We6tlxrzsW4HKdg35gvFg0+XvPPFLrl/ljNTaYVJPnANTYTdphiYWzrdOm8mWmkf4a93B+do7Il2jsydZCwal3vwgAxSIFDN6m/NbJ+gWhl3CO7nTtl5zTax29Dk/cyH3uenxvZalsLY/Z7pmn4BMmKhy0DDvoeLeSAQCWkZbT0POVBJ+Zb8XSisrfF9/ayzZXaIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UX0Orw8I81PRRyS0b5VWSVvK+2d+MHjv0/kHOHjLJKc=;
 b=WKDpf2OF9EBZC9vbXZwO7GxihNLsghqKa31JO3hVM+NKBZx52TA382biT9ylT2p7Jh31RsyBrPzhXgaDKijcclEh7pIq+Lg+ZEp9HMdm/budNpCfdon/tx/Re9xvtfDaAl+lYrmUmyA/Vk3kv4+/CcAeCUjm4JVyv5b0wgD6S5BzUtigJGchjoEVdBoLn5QIUljzwNiTnKWjuVl5UvrOVWTggvl5Mx4Uzs8LLPV43GtFIs3RDxPWQ3MDpMwNT79jfb5B20XB7PzQOjmvIqCRrbSw2HnPCQl/aIVEGfM1Pvl0U5ayUCBZkDdtNEf0P0msYW0vB04rLRGsMLYmqs5EEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UX0Orw8I81PRRyS0b5VWSVvK+2d+MHjv0/kHOHjLJKc=;
 b=dqj/HLR3O3fEM02G7deM9xzR3jPsE/nG870mpYAIgmVxQJzrUo8F7NKtvWIHNnr0Ara0k9CTdSkeAwbckIaFKwcaiLRMcKYaXAE9Oi1IkQarq4IFpwBuAiG9rYMG50hvXOYr4btaKQreF5lScrQj1XbX4oJaEEpHuesLgEDBfIJ88+jJpcqIeFUS8HbbacL7o9dEBsaVLHUu9Dldw18oz+70zOaW6W1mVX7DWLvdaC1/hMSN6TpcwvQac2eeaFeEJRnVuJrB/3LvHmrMTlPJa7uVZfwL8xAZq/oNENY+/oJhPWgIXUuqmNR2KRGLfzya4E6GYKMrKI/UJ6LYD/iwFg==
Received: from SJ0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:a03:33e::31)
 by BN0PR10MB5094.namprd10.prod.outlook.com (2603:10b6:408:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 06:13:56 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::4) by SJ0PR03CA0056.outlook.office365.com
 (2603:10b6:a03:33e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Fri,
 19 Dec 2025 06:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 06:13:54 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:13:50 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:13:49 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 00:13:49 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJ6DnN31832323;
	Fri, 19 Dec 2025 00:13:49 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id B706A2A67; Fri, 19 Dec 2025 00:13:49 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512181848
Date: Fri, 19 Dec 2025 00:13:49 -0600
Message-ID: <20251219061349.1872543-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|BN0PR10MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 179dc19e-352f-400a-a1d8-08de3ec5c997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8s1wS+M9zP0XaF/oiwLKdIEroQkTU4cwkfmUiFVUDYMtT5EeNVF7VhiLxPHu?=
 =?us-ascii?Q?CWBjy6GD1IsCkaXVVlo8KovjneTu1O+aTUsOz3PTstygyxpMrcyExFf7gkL5?=
 =?us-ascii?Q?YOjd7ObrJzwH4QFFDKOY6Hbi8PEBqEK9KlqUHuMEcsc+3QzLOR4sUCycZaCU?=
 =?us-ascii?Q?NI6/L56J+eK7lVSx2hDfalNKtKc+EEpo75wk5Mtt4bdwz/YJpZFCAzh4eBIF?=
 =?us-ascii?Q?gb3CYQ8yPlEwn15ESFmvCXyDNkzHOTeU1rEN9MxvXbleUOfccG1garB5CwuT?=
 =?us-ascii?Q?Wm4UoozqTB9fryW/MI24Rxr5SmCiUJncah9AHDlGsjyR6GBJjuKK64zzwHhm?=
 =?us-ascii?Q?uoKSdC4zXGhVkDzxg40mfgoRrMzwfURkV/1M6jp3Jy03R6Q631bf8tU3t6CT?=
 =?us-ascii?Q?x+Si2wWNEDPTXwR7bUP3OGwkF6jKTW76uSVFLguvZNEx+pC1wBq3Ux5liK/k?=
 =?us-ascii?Q?NPtU/vfISPhR/iz3kq00xVy9hpAGsUv06EPTGlg34UsggqJPivlkIQLdu0NW?=
 =?us-ascii?Q?IF5+VpSUp61Tu1kB0L0QgmLAexAl7ayp3Fyxdoj6I4DEsOFLh6ThdrtYmuWE?=
 =?us-ascii?Q?hFM4Rs5jxZTaVbvTeayu9XcciYzc9Qr4lcllRyAlMd+8IYgwm++pIH5i+i7b?=
 =?us-ascii?Q?wZ5REffe5E4UpcAXh1GnXbDAGWoBqbBdn6G60RVIKbZsSFcm1aKZQDg7vZwK?=
 =?us-ascii?Q?x/1+Nsm06Suit7fvT2sgQAq42EZbgQWxm3NKRxGuhQ86rDqDd6/ypze3Iott?=
 =?us-ascii?Q?pzRmK8HFe+yTP2D5d8DqM8vu1qkK2QwajASua3zPMZj0DA4N3VSqH2w6SZ68?=
 =?us-ascii?Q?ACtReqH2Kk4vJXIQ86UK4ahni+O7Y7iCgF+Etoqx21qm0wUeNUEzfirLatFc?=
 =?us-ascii?Q?s/R2v3ypaWokBQ1lD0GGa8vKHZvwcNIcFCVe1IT+TSxtv6ZrwKFPI4clUJi1?=
 =?us-ascii?Q?Arq6f8rAaPNrlQuGXw85TGY4cwTBRJTDkRFB0xtUC9soIeEhpKxsgR2ludxn?=
 =?us-ascii?Q?zXjNdlMmMzmPYHRMEoJ6MmCM4pmE4qvbe6xq5o6NaCs3RiN9gCgtw8GXHuqZ?=
 =?us-ascii?Q?mhaWYDRfLZ4XmRj2Pgl5xDZcPzNOIJ/CgNi+vL4SeqNUGqDMUB009x8V8g+0?=
 =?us-ascii?Q?52n8wq9YhwJEeMj8JGY2KZ2hois1dBL+ZGwVzsiaUIZB+p0wwL2OoirZEy1z?=
 =?us-ascii?Q?I7SzsrhTArO11Px+tNmlBL5fLlrVa8di0a/63p0QXBzbJ+Hv6dYNj4b44HIu?=
 =?us-ascii?Q?nMcgV6VuTUvX87m9JjMbEEuKmGteMR5QT3ASjYo6OczgL7gukTuHnHin5P+e?=
 =?us-ascii?Q?XmfRmjS/AhHjXLaeae7xXUuiMF5s15p1GhjranaTH96lWkCDxBBMMqVbwdLb?=
 =?us-ascii?Q?RL8EoBhcOTPtvcdvtU9OoTJcZDhijkCPDeVORuELPLLZ74xx0kKw64QgJ2Mn?=
 =?us-ascii?Q?asWbD1StOI0E0re4BvutaNMpGbi99ZmI1CjqtdsFWvf5s6V3NyH7r/zobX6J?=
 =?us-ascii?Q?kIW9z26h4nL6sdd4Oq9kSRbQZMHgpkGLaPB7VzB7vCsJGfEorg6haRtxVUDm?=
 =?us-ascii?Q?NywZLThpcimmQ7z+kVA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:13:54.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179dc19e-352f-400a-a1d8-08de3ec5c997
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5094
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 06:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19374

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D01cecc3207f4702e223316e886d0dcf607be1e5b..afb6e41006ca880=
67397873e015a21adaf31fd06
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D9d4416c67fd3165abe25e4d0d539533a109a90d1..2a44=
0e3d83789c8220b722e077255a89d826e48a
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dbb34876646c9e16fa18d60b76f0dd1c6736fad3e..ee0a0f4=
4964f12d6668a14b4b0b3594ce2ab8871

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 05cc6987..70eeeea3 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "76800058f24e3eb3fcacdb12106a881ae279f8c3"
+SRCREV_tfa:am62lxx =3D "11e6effa9128d62f7fb085f47adbf01a7c4a1134"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 3c78abf2..926f27d7 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "01cecc3207f4702e223316e886d0dcf607be1e5b"
+SRCREV_uboot =3D "afb6e41006ca88067397873e015a21adaf31fd06"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 86d0bbcd..6155e0b4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "9d4416c67fd3165abe25e4d0d539533a109a90d1"
+SRCREV_ARM32 =3D "2a440e3d83789c8220b722e077255a89d826e48a"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f574976b..f249f133 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "bb34876646c9e16fa18d60b76f0dd1c6736fad3e"
+SRCREV ?=3D "ee0a0f44964f12d6668a14b4b0b3594ce2ab8871"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


