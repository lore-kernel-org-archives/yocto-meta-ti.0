Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE94EF99C5
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 19:03:45 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79420.1771009417782206881
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 11:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fJjCOcKe;
 spf=pass (domain: list.ti.com, ip: 52.101.56.29, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXQNAbOOwkWirQRsMZlGeFjRDygF3j+OhatQWBzmh1g1DJ/qwgGiE9FBt/qxWUr3eUfifVIQFRHb5XDd4qbT06Epw1XCi4oI/5TWXQ4Dkg+C9qdqrvGx6dskMh7jnrYDoutBLDjiC7AkfdiL/cNAq6shFIKqK33eIj1Q4JjNM8kNIBgNnIFwCGqRSsIrU5nXM54D4Prr7IbvUptN6nT0f0qX4pyP0Tabu9vx0pFIjzvpMqoCOOrkBpHGHPJ00YZWNJMfevG+MV+DGL3z9WIjgXATU08FjgADpD95wPDjQV789oyDui77cHFiQvL0UmAe4946eRHL6BXWbzYFFn/f4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX4Q2UPoo0wG8geO0b+l53rm31gE/ahgKTSCfFfRjrM=;
 b=yJW8s5mtME0D/jVNpeW7FY+hpI3KdoXhmjV1HhpRovGbo3LcxFSI5v6hbYmgeHcXDI5pROjFtIyxYi8g3/9iBJNmVGGyhiFta3zdh0aNtUsVY2o97O9A7DTKKiGKJp6M6HUBt64AkeTJrTNTIjkXylqZZxTrToPt1ckifz44TjpkM+NCsVmx4JHVfGbu3hZGon9iw7pCnyRoC/W2glPJ0Vgk/x+bs2Mc6Y5DYATeVWDRsK0DngxzRbaU143AfYLCRwuWWi3Ofd7fnkSHLGY+8YJdUMhDg0yjaO5c766KWVP/uy9MMNT51b3pVShrB/cAe3bHX0qhIB41fyhbczZKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX4Q2UPoo0wG8geO0b+l53rm31gE/ahgKTSCfFfRjrM=;
 b=fJjCOcKe2Z+vt47/bOSIf8G+76X8n6fRmTTHKiFkDJvbvc284nFi+iYVQqiN+txblpJTC9GCu0JSEoCAnFOHvhZA4BRpSp53+vbEc/MhNL/N/ace+NTH/Po++cMAKFTb/1vrnbF3atjNddFiA1it4YD1NFKBO455WwozAxK0PfvFkVhNiEiS9LBhnlwtLJzEgeLqm8c1x6dDpan1CPfTI1PiPqsWGur0maUi+t5zC/E/ARaqRqzaqD1eEjHBI6noaFUMPSOe8bhjq1duV9afHFTc61v8v0FqjOJxj7dM68ZcAOZiJ523rnc9GoFefPA+zQc5V8sQQCL4BKw4sP4yvQ==
Received: from PH2PEPF00003857.namprd17.prod.outlook.com (2603:10b6:518:1::79)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 19:03:30 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH2PEPF00003857.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Fri,
 13 Feb 2026 19:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 19:03:29 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:03:29 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:03:29 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 13:03:29 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DJ3T1v1239534;
	Fri, 13 Feb 2026 13:03:29 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 608002A6D; Fri, 13 Feb 2026 13:03:29 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
Date: Fri, 13 Feb 2026 13:03:29 -0600
Message-ID: <20260213190329.2150673-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SJ0PR10MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: d294faa6-8134-4e18-2d1e-08de6b32937f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dvg0BgJPymGafpT6n+j8fP1LGX993UfXvp7neb2LO3xGg2DulrwjYuzbPYia?=
 =?us-ascii?Q?P0U4URyEOMTv6hC8+rq0XRx1ta3O7BuULLhveybY9gQtOByTTc0o8WACvDlX?=
 =?us-ascii?Q?uG6SGrWm4gw+IumIPHNPndC3zbPlOCIqCFBC8ILe1p4udFlc+j+1h2hcRP8y?=
 =?us-ascii?Q?PL7H7MMqC8Uz7JwChsbzglxTn8CjWs4uZWujuvriN0LTE1A3PaKaevzE6smM?=
 =?us-ascii?Q?HEfF38Jjq+Mt7j3yS4UGCpVjrU5ZloAgCkgjgxPAQagAxR/za0P+fSWw26xC?=
 =?us-ascii?Q?GoIXRPiNzwM+tznRXI///X1GUU4jgCTpYttPyyUt6fXJ+qs/MgZA//Jkb5NG?=
 =?us-ascii?Q?TgBmZxwB4ZKDSYP6CkWud0XIVxh/K7MM8gZg3hyXGryjPQFC4wO8U3dtYVKg?=
 =?us-ascii?Q?uqp/Gm2ybPulWbE3P1CerNt2Hq/PAh6vKqDkL3Mt+5AFaqawwnUF5dWzGaZ+?=
 =?us-ascii?Q?BEL+OFIqzWOS7WqWFhuFJp7ooNsXkTT4FOW1Ja+wBeO4k3AlhVXQVLfNM6W6?=
 =?us-ascii?Q?9WeN8HrfUVMpl0V1u6yZO1KbFeh/i8Mx4Qfg0iCKqIaTs8+IHwm/iqoG4rBz?=
 =?us-ascii?Q?Lqu9pWfq82tdErhEnLDe6jUAjX4u8ZzEerczG/aovsrfegKKmiXoGUxP8jl4?=
 =?us-ascii?Q?RVZEkj99eUlRlmiLjZp9oq6PpE++GJ2EOTCNmZnrE728vFmxLeX8Q/AAtsHA?=
 =?us-ascii?Q?11ClD/UpwfwP/dLAz2iASJQwAsV3u/uJx5QCWmgzJQB/vuOZJqGZk1wHsc32?=
 =?us-ascii?Q?bI/UWL1pfBO/WH0roEi+UctDCd5jpkXsRfFSRvtVa7uxnkC9S3Ctjb3Cu7ci?=
 =?us-ascii?Q?d9lBp9uZMuHyF6H7lepQvWRU4k2aVoqcvoydWHKBYGIJZYMvwLTthtJ7EbGJ?=
 =?us-ascii?Q?hbu6R2+nnmkGIUXDgpOV97rdFDgclVXV5cE52Dhh2T0iySo+uYeeNSBedxnP?=
 =?us-ascii?Q?OJ0yyuQNy8r1NEuUt8ghFMNPIEVr1efQOFiXDOAQ88CCi+svRdbl4NJYRGLn?=
 =?us-ascii?Q?FBn6r3EIOqhPDGaHgEYG5n/l3vy2J0+fbeVfJJNJeOBBDJMV28jCJRzzlM2q?=
 =?us-ascii?Q?N7gv7KeNZvrCFwE7JiQSr8vz0O8cltOMH2/cMcj2jBRfsF/IRNAJlHZOo4uc?=
 =?us-ascii?Q?TVx3OY+QdIbAE5Z9W8phnTazPqc/hJxAU7mOKV5RKBA+N14hA6CPyY9invbt?=
 =?us-ascii?Q?hnzj7Ea/efJ4Gub+bSpIK4qNdE/ENqmLWgNWX14Z1694TPl5mjeIKJH0t/WJ?=
 =?us-ascii?Q?W1mh4pck9CysvdyS51bg2AjdB06X/vHJr0g2kBqc9l87FsGZvGMimpBUmgVi?=
 =?us-ascii?Q?hR/0zTe2mHX5Sa3Mq6du5S0mYATHSHlXhhZ0noMAY/dej+7NGTPTbdBj4IWU?=
 =?us-ascii?Q?bkuk7e7xl+gRKEtN1uWSp1HMXHW9AQBDfkmw6hQKfMHMe/xwM1vTsXnxdqIx?=
 =?us-ascii?Q?PBXUHoHGRb4SjUiVPRWCQmcWxwLNQ53In9wG+mGhk+tmK9iLBdlnkkq9RyVk?=
 =?us-ascii?Q?tuITrLp7EgVQsGcinz4hb8HSG+6D7tMNrU2pshNvH6JRNAwlL74qLT9c3YLM?=
 =?us-ascii?Q?LIJZnbgxf5hI9h2HXq9QCU1L/PcNnrmzW7Ierk6zFo1CJJ0I00SQTs37X3s6?=
 =?us-ascii?Q?+e4sp01BBQWBuS81a9U9xNcydnMxMUWnYIJuv9iYOyUtMdSwlGEHd6sQfPIM?=
 =?us-ascii?Q?IGRD/w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BGazqI2PCdBWQbu/W7F2Gao5z5L4DaSa5t48qfUy1E9d6CFzqPZrKJcVItiB1zVvD6pXg/hRedRDIDjvSwppf1C7m4oEl3zc4iwNneGGLciUto8PBmevgNB9nE2f+77ZTaUUKLE5ypdIdSmeF2yxh9Jnl9R7NJxSdd/u1IjBK5XJTzx1HC9Zz6YtnMbQxbq85/2D1w/0jNIQIzWNuSDYHRuHVW1HZjapccGqtUlasbmEbll2OsIJ6ZSJ0HzyIP2ysEmla+7AsBWSxtdHUP0jb6lu8ZaYOJxCfSMvi5v0mJqtZV3P7mbL3+NyubZDwvTq/wQXPER77+RlqxIzT0fbSFVFlPkg5iXkCKMeiIhpN8gxsG7WxNKJA9oQQchVubRRoMV3hCYbZDZkyR39D/U52k1Ou1CprYS2f/Sia7d/9TVdciAlIw/sy57hFNbJ/Jve
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:03:29.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d294faa6-8134-4e18-2d1e-08de6b32937f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Feb 2026 19:03:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19512

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Ddfa62d2a6b9de71dc6fb682882834c9390324c42..3c35ffe92dd8=
5b5acfcbf350cd1a6cc829994b20
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D41842a7ccad599b3b5aa4500de859a0f01583a8c..65c7cac7324df20=
db0cfec1377fc3728018d5808
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D8210918c3b8678d9781cf982c86757705405bfb3..abdf4e7=
f1d6d22a2162c91baa1f2a32f8e7adf88

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 6cea728f..83a11378 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "dfa62d2a6b9de71dc6fb682882834c9390324c42"
+TI_LINUX_FW_SRCREV ?=3D "3c35ffe92dd85b5acfcbf350cd1a6cc829994b20"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index de315160..92530669 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "41842a7ccad599b3b5aa4500de859a0f01583a8c"
+SRCREV_uboot =3D "65c7cac7324df20db0cfec1377fc3728018d5808"
=20
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index aca5f102..0afde29d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "8210918c3b8678d9781cf982c86757705405bfb3"
+SRCREV ?=3D "abdf4e7f1d6d22a2162c91baa1f2a32f8e7adf88"
 PV =3D "6.18.9+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


