Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C1ED2CE14
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 03:05:21 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62074.1764903918464239362
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 19:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pyLhmzdX;
 spf=pass (domain: list.ti.com, ip: 52.101.52.64, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvP42xRgfg7EfXbSnwS801A60iTtTEU9/dqAB6g0/F6tcAUswW+A7xlNPRyoQbEdzvcVkrvyZe61Li+vNUNYKOfNAU99bOo9NFAEueC+Kqt5Dp9BkaT2jVi2UoF4JDqH+QJud+crYpIWEU/tEn7/kHrjxkZgNB8C5cawOoleydIa62Tn4Uo05YTFfybSQrVqkjnjZ6I0dLfthwuH/4B+w37KG/52R9iUQXhx31ZScjWs9u4YKuiRVaFM2K70OlpTrv8wdqCUYi+taK0bYXn62tq1ZlmkZGD+iMNDKcg7UlofsvUpAZF8q+9psarUE9W2rQ8XI01Nixad3ADkBBAzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Fd+5XU258+UGoc5PhtYbhGHH0GajRK5HVqoQkhyRzs=;
 b=aKsLeBwJQy1pPIbmC/PtX6gPFZU9ee0oggjFgPE+RgZ5g8XcFoqIgTFoQWltmvpIGvgVFehmFk5EcFeMCIrbGWp6QEEeQWP4YOTPte8fyoqV320gpn6Xwe9dTsbiKe05LFGpbN0RIJ/znAcNw2yhtVqgvTchcz8hkDZJMhsDI9OyBjiD4gab1+I9oz6AH0UHJJuuDEfjQjtCtW2BfZwHlLbdRb4jMBrN1M6ZaCszTAmgb50ESDzYg+AZBry9N08qCaaTYKRY59suhONlNhMjVaz1pJxdpRanZRs5cB0MxqB2PeSTbNJck/G50ayiPDf46zpIMePapOF5eWbrIdMiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fd+5XU258+UGoc5PhtYbhGHH0GajRK5HVqoQkhyRzs=;
 b=pyLhmzdXYbM8WVWLM33UeAr3RIkwdObGewt3ZPG2h7QHTx0cGpX2k09KUsY8o8MVDfdT4ORENKB+ir5E1YWKyWscHSF8FcW8fyxpHOJu7KCYPfzs0Hl4B4DjZyKP3BgsUvdwlPQvJ3EXpmv8B76MM91+jEU/6+qOvFBbS4pvP/NSQ/SuPb7ZvYHiRX0GocwgurkaSRquCIy8g9xZ3fJ7JMv9N76Qzd/CcObpQX0GPaHWgqHKVTOK5MbOpoeKx7y69hDsWPEr5fkcSAt4XNWirHwSd3tffGW92SBVHqGItkwjFb3CI/0dmQ9lDSSFTYLfz74GLpErcwQxJeehMu+NEQ==
Received: from PH1PEPF000132E5.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::25)
 by PH3PPFE06E70EA4.namprd10.prod.outlook.com (2603:10b6:518:1::7d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 03:05:14 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2a01:111:f403:f912::5) by PH1PEPF000132E5.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.10 via Frontend Transport; Fri,
 5 Dec 2025 03:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 03:05:13 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:05:12 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:05:11 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 21:05:11 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B535B1g334013;
	Thu, 4 Dec 2025 21:05:11 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 723672A67; Thu,  4 Dec 2025 21:05:11 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512041635
Date: Thu, 4 Dec 2025 21:05:11 -0600
Message-ID: <20251205030511.1803904-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|PH3PPFE06E70EA4:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cefe3e-f440-4ca8-70dc-08de33ab1c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vK3jvUemk99J84r5eUWMEPjM1nqzkqZSQH+CaDswWKxGWMt3Tvik+HY3dLYL?=
 =?us-ascii?Q?HqHvwiSOMR55ndTODAPqNl84Xsu+TctYLFfA9AfCA++OKLA246s8GnxQcNPP?=
 =?us-ascii?Q?Fe4UP/NQxSehAIL1vBLxgAqOK/FUu/Ioi822C2Ld+bc7GmYNn700RTzXkd6b?=
 =?us-ascii?Q?oMnkqroIKJLMaLy9bTSFkzQ8w0zSb+ku0FXob9QESOs5MptUghIDSF5BKXkS?=
 =?us-ascii?Q?kyDtiYNWWlCcw9sidqpDp+XF9jNREH/0C0ZZIFnvDf3595gBZIvEzXBIZn8a?=
 =?us-ascii?Q?SOi08W/MDwwT6DSQYfT+BGFtSURNWy/9v1nqrezTUfoLzdAcWokE9xIlL8Bs?=
 =?us-ascii?Q?Q6g6BLlFadLZHqPTR/z3xBGybZOldJ5Ge5HGgxqN0KlpBmOoy69R+paDOQ5T?=
 =?us-ascii?Q?xpM7CNhJPVHHCqdgEtTRn0qcnNaqHJss7zEPDLiXkVi+UaS18XrY3JsvNiMA?=
 =?us-ascii?Q?M+nvjgMBZTQYORSDFKe/PIQnxls+7fohaIOIcp0jxg+wlgmG6cOjBtDsbyeh?=
 =?us-ascii?Q?xJCs0rWr68BhLIf0qDaEePmULzSECQtC/gj0zvV3h6ulTqzEBPRzyBO27Wvg?=
 =?us-ascii?Q?frWQE3oOzwrx+4+RiV7vHjCRgsgYWf2Bu82VRvkcbtgATO1LlSuyerHQFWxy?=
 =?us-ascii?Q?W1rV0XdbthLeh0BPBHTkKoQXGius8obu/ZFQkPN+/xVmdsSaMde5x8okfMBJ?=
 =?us-ascii?Q?wFz1K1DqcvOrLn/DpMsH8/xgYVJ2XppAkz+ns9yray3r/V1Jc1pkRJqoIk51?=
 =?us-ascii?Q?DtX72pi/C6+YhcSNd9WQtAL2TdDLlZxlbRiXULBgMb47Uva1RzmkEktn/Q1N?=
 =?us-ascii?Q?djeitXCYxPV+6MOX3FKiooQLR4ir9t2QR8mKR2gk2cmbyzAh8aGBy6xKIkal?=
 =?us-ascii?Q?t7oaDb1R6x7JkVgzhoVQPMKmjWa59Fc1lOsTQCWWCpyRDivnwRDIduDU264W?=
 =?us-ascii?Q?6h0UKTa1enVKLX4ig5+dcW3HHfDkQoxXxQhJjWeHl7O7yF1TR6S69KmiiI48?=
 =?us-ascii?Q?agbhscMku4sn5QaaB3cEP1tcdD8NlWsNOkRGE8vNFkcfte5z1+tHEOtMFS18?=
 =?us-ascii?Q?wMpwETwuW7NIndDtnXtGNtyH5oTi0xZ6B2rBG+vPWwcEyWEWFwVx1Z8COa4T?=
 =?us-ascii?Q?bhRMLwiDTK0yKPVzdqxfrDUaEDj97mGHMaVg7m5Vxh/ZGyMc4HOWIMknCxV4?=
 =?us-ascii?Q?bNKW2MoUZBMY30Gsf8AHLP5Oo3loBfYiCx4wuNdZ+MPQDe8z3ITNNk+cQDjf?=
 =?us-ascii?Q?Pk36MeVCRszxNlfI5qincqXs/+avF6N3w8JcfXWVfVlaBT9gl9wVkcXPB85O?=
 =?us-ascii?Q?Htmr2J3qHQoApFYsS96tlECN2I5Ys5TQkn7TjIFhOc+Bq6R9trr3RSxvJtvF?=
 =?us-ascii?Q?p2oj3FwjE7gf7vD83m50nL6BoyW/GKW/3OZ6nH0ncL0ig4cZviHsbebVzYZK?=
 =?us-ascii?Q?YETa3SUUPRQui3vT8V1S943meknuV8cWQjE7nAEopg5W00jWXRHkkowHeSTi?=
 =?us-ascii?Q?11XYboI7mdorPYL+UWyijTLsqRcH0+BzA3dpakEPvomL9gPT0N3+QLiDJer+?=
 =?us-ascii?Q?VRRD9At8O7HTPoNbYR0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:05:13.6231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cefe3e-f440-4ca8-70dc-08de33ab1c19
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE06E70EA4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Dec 2025 03:05:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19332

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Db5f45f14e23b927f3ab1f4e00c58eacb47b01d31..d7b3607a76e0=
8b3be8f61ba69d959fa063f44b11
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D3f3051bacd384bf331193070c29053d781296ab0..7493977a537fe3f=
8a45814c6284b942f7f09e035
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3Dcba7dc1=
3a39191ac18bf64fccbba429faff112b4..4e3a44c4b961831f2de80606942dd0d8eb508eca
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D1db5d0126012c7a0b82eff330f9f8a68b3d10f19..b55c=
76863125ca84f6ec11c6b6f57e66a5dbbf9a
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D2d5f05489a39201c2fcf95d2dc04af57b6f7f356..31b07ab=
8dfbcc182da591e9e3703edd9f4ca7633

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index b03956d0..682107be 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "b5f45f14e23b927f3ab1f4e00c58eacb47b01d31"
+TI_LINUX_FW_SRCREV ?=3D "d7b3607a76e08b3be8f61ba69d959fa063f44b11"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 27d69241..72ac1802 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "960816d244c39ac1cfa24c4ea028c4404f9cbb20"
+SRCREV_tfa:am62lxx =3D "5939ceaeb664b8da5499dc4ecfa1caa7f5bcc31a"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 8c0a523b..a87b88c6 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "3f3051bacd384bf331193070c29053d781296ab0"
+SRCREV_uboot =3D "7493977a537fe3f8a45814c6284b942f7f09e035"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index 48dc3e70..63f428c7 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "cba7dc13a39191ac18bf64fccbba429faff112b4"
+SRCREV =3D "4e3a44c4b961831f2de80606942dd0d8eb508eca"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index bbb52786..edc0eee3 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "1db5d0126012c7a0b82eff330f9f8a68b3d10f19"
+SRCREV_ARM32 =3D "b55c76863125ca84f6ec11c6b6f57e66a5dbbf9a"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 256777c6..006f4b1a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "2d5f05489a39201c2fcf95d2dc04af57b6f7f356"
+SRCREV ?=3D "31b07ab8dfbcc182da591e9e3703edd9f4ca7633"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


