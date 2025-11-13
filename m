Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390D1CD5BAF
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:50:07 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20166.1763027404139664559
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 01:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NZXokUDA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.55, mailfrom: hnagalla@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A55Fx0J7F3utmQESlrGCR8nhIWnrkwrl1y/pIOHK5phiIyMOkS7Q0a4RvOzPfacLN/fajLjacZRCUYyritdEvoxLT/6eKa70lbhWlkes/JgRlifhLZFf0Nw51dhHawc9oJu86Npm6FrHwYN7xSiKSsEZhDbBpkoaAEWgMzHiIIniSEVgaY4uJ4AFBraR9+V5SvMhAk3WSAdExATnHko2tq24i5DwG+o+7pH6IRjXFe/mkZjR0xWwzzM1DWkiPT1aoYceSDgEzSX6hEnTdYSygnF1ig/BhW9LMLXHO5HQVU4c0Y3C6hf4GbZRzWp0p0zeSM8usPMDdw98QhgaU4rBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz/ZodsPRInRfSUk6mAjmKjY+qsUZbJyv6tFK2q0gmM=;
 b=AWlb2GoGGFA+ayElcYY67kQZBLuhyzbmiSd+GL6PDEX9lqaN2yNDHxrt0U95LCHa0N1ZLSYOncI7b0G4vs9bnK/DyTZwY5mPg4jt96AGxTcNwntfVHT3rwIfmjJjOq3n1b1tl68j2EY4gmyeXfTKUZAzQhp/LXqAAVPnRVrkxVlaG5TuaIPnUWeu+uTXmaJIIXn+9y8Qbv+sJPxuI7Ghncrh7i2WADbKWOKN0XhYsJtaIzHppSIoT0RODJ/u9d+pY5DLrr1wHNTSgvZblaaT2q7RtbA0sXsURPLqgc6Nn8VOfsHxEcgsgGv0gQJiPi3Onh5DZnLQ5hl+mAjXm6koSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz/ZodsPRInRfSUk6mAjmKjY+qsUZbJyv6tFK2q0gmM=;
 b=NZXokUDA6tm0tbI0G1t8acGphTJ71SXXfyan2Xjp6kmuvLxGBP9S6Q65fEbBHtM+QoStK4jHJL54s+nPJkLeGGXOHpfmeybBuaulNOcP3S0XjiKBGRRrt/7Qb/UXFkfcwE/Ml/ZzI1ugxxGZuE4K46jZPuxJWrM+9mgwG3l/JsQ=
Received: from BYAPR06CA0034.namprd06.prod.outlook.com (2603:10b6:a03:d4::47)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 09:50:01 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::60) by BYAPR06CA0034.outlook.office365.com
 (2603:10b6:a03:d4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 09:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 09:49:59 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 03:44:45 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 03:44:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 03:44:45 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AD9ijiU022078;
	Thu, 13 Nov 2025 03:44:45 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <nsaulnier@ti.com>, <b-padhi@ti.com>, Hari Nagalla
	<hnagalla@ti.com>
Subject: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.10
Date: Thu, 13 Nov 2025 03:44:40 -0600
Message-ID: <20251113094440.19249-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d4d95b-94ad-49b0-4b77-08de229a02d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pHWpP5CkrAz1X77XnwWPIBDoi2lxN/jggwf0pbc1fmcUmWo8QtWLDIh8edaV?=
 =?us-ascii?Q?C2fnFMPmUV4Fof4eodzHQrVaXC9SQuEzjKcH4OQAWULj4tnbJc4FFb9eA+uA?=
 =?us-ascii?Q?338lTAqFtMH74/Bv+NicLqeN57MwkdkGVAQfJDdGOGaQ5xd5+eHs/CTj4mf3?=
 =?us-ascii?Q?qTIuccyWoGYDrSDdy/GPpNASXoAuXaI+PBpsJjiRUl2M10HqFCnp5jmph3+h?=
 =?us-ascii?Q?HSb3B2M26Y1K5qnEC5IsORvRd46OOmwDrD2BpVS3HNgSI7LtYDf2cpxXpX4z?=
 =?us-ascii?Q?HnYgaDyzWq3/35Jz0XXJYfoRyHRBww+riVWqcNwBWn7PAS8ojMtMYDzzJhVm?=
 =?us-ascii?Q?OnYIiRegWndcYxMDIkgxM/OQROE+FDqf49mFJDayPrrJLPEK4abm20n5zZwA?=
 =?us-ascii?Q?BLrC9dEOEdR2hcyRnw5VT11nOy5tV6Dg6ZIbXZHayhf9TH1jcKvUC7Evzzuz?=
 =?us-ascii?Q?y7cDDUiXytekCpgppDFZkqqTRBB0SEV6sSjH4xhUJifexxuCuTYnbYis6SAe?=
 =?us-ascii?Q?lotaH7NlPrhPrF3t/wpLnfBTAhO3ARmi0ERFueTKQd7ZyPvN/OeB1UazNgW1?=
 =?us-ascii?Q?D8YTmOhy5lqLElXKqGQkktlWXSEPQbn2032IugZLJ+bdqRMwlwUe1Gew2xnf?=
 =?us-ascii?Q?tOodmUgnnzao+zJD/jdYhFS7SzGHdAbl2ag/AAKmSKR7MEVpGl6DgKY0nOff?=
 =?us-ascii?Q?AOIti6XKah1WglYKi47M2u0gKsICfuMQnhsdUzHQw/STGtWiTaTZ8aFmf8D4?=
 =?us-ascii?Q?OgjGTLBI2HajjPHhqm+vZYBgZgp0HTJ96QTap187lC9MJY+LWzDkFtLwTDWQ?=
 =?us-ascii?Q?Ci+LM8X+w2/F9GaPQ176dMEYeMbC0GE7pAIJ/soqiR3TAl1yashsuHhSjKP+?=
 =?us-ascii?Q?AWxjj4FNHLAwimVPM95UTLCEck83dZSkKk1NMV+4VJyWbLtAO3WNHAPquSNg?=
 =?us-ascii?Q?dv4MbhajPajJm3XX08rn00rdmHHJUU2IO0tBzR+XhnU7JfhZBeGpODBlui3A?=
 =?us-ascii?Q?kd1XMoFSxCq0lOfk/NF9U/sRlIrAUx41VbnQtPrtL8udBvWTrBLq0kkR7Il2?=
 =?us-ascii?Q?NDlSa1aHGVqm87gMRHPX8eH+nn/vdvznRH2vX6VHDVCrxuVEIbZM1GldzNP1?=
 =?us-ascii?Q?4lqojRhP9YJGst1VIvQGR68N88FTruEJrp2Jv2QMA0kE37WQSm78bMzouRQg?=
 =?us-ascii?Q?B3lY5K+7s2mBykbSfu8uZSMJSCMJdgTkkYDFkEh4SN1a3TvTV6QVMEdE5y1A?=
 =?us-ascii?Q?S5lGXcwQfGXcAU7xmGMBbSGY+WQbapzPWk9M3EdgMo2KthQOU8LyT9H9bmIx?=
 =?us-ascii?Q?ycYOtYU70Ovk6QgiDldHBA0UAdQ2W3FHQa9eLCy6sbnHuId2Fu9yC/6WCA/5?=
 =?us-ascii?Q?JRkxK/OR5vKHFw10hWBpigqq5/tBuzQ8naB9qJ3L5Skts8cIVP0+nH7B+iTh?=
 =?us-ascii?Q?93Y+4PyP4umRA82a6JkK0UStIBeZhDVo0CCrUSuKE6qqMPG8XXJG11FbIoI3?=
 =?us-ascii?Q?kPYSADXtxiNQn6oIpQn7HPc4JnVXYBr0wf6REdXhMbepxrM3KA1lsxdQcRV+?=
 =?us-ascii?Q?84ou4W5qoElDRLxqAYw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:49:59.9660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d4d95b-94ad-49b0-4b77-08de229a02d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:50:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19264

update rpmsg library tp 0.6.10
It brings the following fixes from ti-rpmsg-char repo:

d4cf638 (origin/master, origin/HEAD) src: fix bug in file_read_string()
3e72722 src: add api to fetch kernel allocated remote proc id
5061690 benchmark: update max runs = 1 trillion, max latency = 9sec
4aa2a84 examples: clean up tabs, delay metering
07660dd example: add rpmsg_char_benchmark
b40845f Replace read bytes from 256 --> 496
b2e9e2f Update max message size to 496

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 0350152d..e8f0f8ba 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,9 +7,9 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.9 release
-SRCREV = "09b064c6663ed46e4a402291dd87c8fe96135bd7"
+# 0.6.10 release
+SRCREV = "057b1a249261e26d00c501b59646957160ec815b"
 
-PV = "0.6.9+git"
+PV = "0.6.10+git"
 
 COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.34.1


