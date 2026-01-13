Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421CAD30CF1
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 23:46:26 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73057.1768347978630402983
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 15:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=G30FypNG;
 spf=pass (domain: list.ti.com, ip: 40.107.200.14, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5YsYxVc0tlrdaYjOcLhcXM1m9p33WfnH1lPLxgwxCsOwz6ghxSdHDFajNuOZWYLLZzKrJ/tdhRwqF+ej6a/ViTogvUiBXPH96RGOztzm6k1uB6cEGsu3ciA68FgjrsWWWBSrhziookQaxNSkul5LWPPLB4EdSy0jyNFewgkhvYfC7ej6NdWI0cKIQH3j5wImQIcVzY5115a9jNt9oZ7vG5e9iYjWRHUhnBnx5tufZ93/5oRgTetc74sOKdjFu+h5dImFbotow4d7ix4fkTGov71MHBl7zNKzzd5eOS9hhH3nOmmxQfxpU9Xs1lGtzi1CmV9lgWgzUB5C4M6t0Kphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J00bXKRQvpUB59ZJwJIIempFf6rZ+j4V+fENrMCX0ZI=;
 b=NuChJJpN2Nqi0cbwlDTCeUceJk7hsxggJN9i2mn0P7KzWQOq/HsLK7nb00d5L3yyapoc61uBdONEwPqpp1O+rb16WLwgEBxHCxc7PziUnfR3cq+wjEjPZwbQVXFu9chsYumU9LRaio0MHzqEIab9IguLOXIxneSXuR7haX/CyNfwVee98DC0dL6VaCHb+JaxvZl3uoPTabK3lANSED2ZQx8Qs+phknkfTPPBXoMlTxuxsiRMO8xd16PKobeKP7TSY9RyEN1ZO0vBe/tltxuhosMZ23ueeq3l2Whn0kCr0HfbrKdHHg+YMyoRnfWxeB6ZAJvg3MzIGopUZ6ZPY0liiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J00bXKRQvpUB59ZJwJIIempFf6rZ+j4V+fENrMCX0ZI=;
 b=G30FypNGz74h3GifcbEMvevnh0mv+k0hiDM+OnPXxqk4yczdvqzFVXlvwSUhpf6Aa3qei06QspffKP3E8tMzLv8pqmNosZoWuADdKiMnGbm45MqzHbrc+GHCN1AXTCtXO6rdm0xmbHtBwPbAK2ei3U7Smqyea0H0Ax2V/1VOuBcgtn8qWDcY713KuwZpKIELFeDEMXH9eRbvAW9MFeO48QfVPrtl5T5Hmw44SSzME32gLHxUlGGhjL+H0kq8cK4x6XpmIZSV8oVcRVU3ALFlJU9GNHKmgcCBxv1YstCm66jyxrMnPoRdMOQe5TMVzIoryVx/DEibZCogH3fhwz0wSA==
Received: from SJ0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:a03:3a1::22)
 by CH3PR10MB7807.namprd10.prod.outlook.com (2603:10b6:610:1bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 23:46:16 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::e0) by SJ0PR03CA0377.outlook.office365.com
 (2603:10b6:a03:3a1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.8 via Frontend Transport; Tue,
 13 Jan 2026 23:45:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 23:46:15 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 17:46:14 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 17:46:14 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 17:46:14 -0600
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DNkEXo2516150;
	Tue, 13 Jan 2026 17:46:14 -0600
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 44C5012B26D; Tue, 13 Jan 2026 17:46:14 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.01
Date: Tue, 13 Jan 2026 17:46:14 -0600
Message-ID: <20260113234614.549696-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CH3PR10MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1b7be6-dbfe-4b67-cfa3-08de52fdf0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1iZRYh7a0xKLMzzqZQsuEgEYO4S+70GACscRk8ntsVjCysqWsNoboCm45U5K?=
 =?us-ascii?Q?bdKkjUYsLfT0/8paLmNx/AZJupUgRC38I8sMhGgr/naQsgVRcvp2nsWGp9i5?=
 =?us-ascii?Q?D3E9LomS+IUd0t5wsiG1h4QjZWg+zUSkSCLtGkfFaiLmEJ2WQxuxihExVFsU?=
 =?us-ascii?Q?zbWDqy8QSEI50PQfctlfC4kwzG1Q4Y0UALSFg1Mmj6EFBI1yAIMLkWP/jF8G?=
 =?us-ascii?Q?YeuLNPvlUCSSX3FxCuBaQ+hToxMaUaMR7QeA0Pph3epU+gZJGXJScbwLpDrP?=
 =?us-ascii?Q?VzoCY9bjQJIjWyVP1FDH161ZZimFYOFa3VkBXPTeYdRb3nyUCaTYc54IE6X1?=
 =?us-ascii?Q?RjDqS/JF8UP+kIMv4tobLp6K+MHaagpzcpSouWNBUprFM/S/z3ZgYsig9lRM?=
 =?us-ascii?Q?3teX3Vz/OCQFKXM6GLLey1p7i8/gTmbFCGlUvHlOvlaVp3jCcGQAuPPFJEWF?=
 =?us-ascii?Q?ujwQCmlUIyINQRJd6XQhJVCJl8BNsjJpCqIwkRBZhR40ZOML4+Ojk11UG7IO?=
 =?us-ascii?Q?Xduk1Vd81nUyoz73uMNJE1ejs5LwhLaDjlXEaJWQQGck0GO2hDp5tHHnto93?=
 =?us-ascii?Q?hlX1Uo8ThD35Rj/p2Khxaicuq058JIRCniM7HVYW4AWPv/oCa2xBzbULe3Xb?=
 =?us-ascii?Q?5y2QJzaZX97U0Wi3uVWgG6H9+q9wdzn4yENq8bP0fW5jcKI32ah2coyywwSb?=
 =?us-ascii?Q?pPAAo5hGnAPSA19APrt9S8mp3yYUs/Opbbnf4Z4fUgrlAwLBcQSXhPDZy8gR?=
 =?us-ascii?Q?nFh8HAFJCbAy1/4ggTdjoAhAGS3CEMSOfYrV1bia2ssARNYSaPQfjaNl7bBz?=
 =?us-ascii?Q?3Qr2AVuJjvhrhffvbOTTrr6+PE8Lqnx/FCVZcvRMsDxj1K1Wg+AY5u+w1BBY?=
 =?us-ascii?Q?cdeA4k5ncvsw+LQ9+1WlK/goNkEUC+Pw2Nfqn+DuYqAjouJsfmqFsXXdoyRX?=
 =?us-ascii?Q?k5oi/hnD0Y9iKY6x/5F8yLziAulgSP4xStAvZmPELIY42fM0QCeun2W9tb1S?=
 =?us-ascii?Q?nGWEj4coMfVjwxVdOx/SgTUfBaoOPcFzOHr9d/4pCHYaMDV80mGltkgnu+f6?=
 =?us-ascii?Q?vT63UKWeixbZ5eASH2AokjbilxdcXrfoeFDd8US2bO2zoZVuqivFFhu8FmCh?=
 =?us-ascii?Q?AnBEeso3/3w2TWFYZiC7ftjt3CZKqMbL66MVgHwOdKmtvA10tiyLYaExwmlB?=
 =?us-ascii?Q?r3mBqeXV05NNc3r8KlQQk+5RofhHaoj6IEAVIWCR+tFM59dbbrYClRNbYUNn?=
 =?us-ascii?Q?ZtM7EUac+DnSg1s3kXJOKJvGdChpi0s9WosaxYcqXiPId/muhzK0a3HbW5sJ?=
 =?us-ascii?Q?m5BcbJj24zk1mdbuRIFP84Ob8X7n5vJRhAyAROakSRio0NJOOC1d5VQe7tdR?=
 =?us-ascii?Q?nc4nYEweSHCbk7Oi5z3bVlBhQCqyMV2M3US7PQb+REXBOfuBVaDC1cdVzSUx?=
 =?us-ascii?Q?vV9Uvv+C8l+rTqCp2Owe1JIB1gMbhQ/Vla1b0A1EVZLlXqU3inrKAAXTSk2+?=
 =?us-ascii?Q?HXJSANzJaRF5yp6Ce/pvgoQIHf9aujsQ9U1cf85GZbehjhuHM7cBzTjBL/Qi?=
 =?us-ascii?Q?/3k0DlbdXTIMIhQlveU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 23:46:15.0782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1b7be6-dbfe-4b67-cfa3-08de52fdf0b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7807
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 23:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19414

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/met=
a-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index d2b34cd2..be53ce7b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
=20
 SUMMARY =3D "Mainline U-Boot for TI devices"
=20
-PV =3D "2025.10"
+PV =3D "2026.01"
=20
 UBOOT_GIT_URI =3D "git://source.denx.de/u-boot/u-boot.git"
=20
-SRCREV_uboot =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
+SRCREV_uboot =3D "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
--=20
2.43.5


