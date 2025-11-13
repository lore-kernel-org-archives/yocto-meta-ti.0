Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB10CD6E6C
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 14:02:09 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24565.1763042528626817336
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 06:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=BeiPdmNk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.40, mailfrom: hnagalla@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt6/x8Bujcv53FdCnJhHQV5AA/G1rsmDzFuzgJhpRJ8swwPilR8eUgVvA4n+9AWd+2T42iNXlXkzGKe98TYRfdnXJ72VSSphCxKfdhNUZlAoykLGBFdlvSiilS34lX2okKkg4IMrJ2lEofzZIa/+7DftsRlCL9Mj4rxi/BtngIzYmTpB4LDxhei1+6ttl3tz7R+OkW+kOpw/N3omMtx9sOo0DKYkOVx+9ZGTZYZ/VQGwDRHihBDRqD4IT0gvOapqshoGH3hTRFsgJGc0PDBHr2p72X3Kdllv6X/oerPUU0UTR45s999cFeLE80tA0ZylQ+j9oZx5IcCQi2XboVB59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxMljZFmnK+wYk9qYHiEQtqBtaRtWkTx+u9oRf6z/pY=;
 b=IRfM70cXwyZsJRu4ApjBGwtAlE5mQh3i+YHjk3fheVx86ZvDgQQUKJ7YeyLnsNgatSw0O2VRyRQxQ06s7lFU6+UgmVUyU5yeYrLt/MB4pI1Vb7PbK3Hc/EWb3bzpyHf52MsrMcKPGO5ZpxtbsJIkjPL2r6r/ItdGEvmytW7SfGSzmcAsLJPQLmyg5aHURm2k5dQERfMI4kEdhA4Xq2DI5j5koFjQdwkaRlBIA+9CU1teB125lCSWHJo+9yWGTQaRwiOqOJ+VfpttRR7Q1dWHokcq0B/UUN36lET1OGIYrZocuhhT972UUvhF49V+c9lpByq1lwVF6RrES2fKgBXkGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxMljZFmnK+wYk9qYHiEQtqBtaRtWkTx+u9oRf6z/pY=;
 b=BeiPdmNkgBFp5Yicl8tVbk2D6SOx8nQvTgwqxSFXoLeEy92ils4lRjMA0cYYeIpw3uqtU/LyQE7H9nRXGwwwDbdb/0s2Pmfn9AGN/YXxPWRNJ2JErwhApQe0Jh8m7B2znr4Q9Dg1F87aMSSjvx0iiFCjMjGxxjOjNKSql+Nxgj0=
Received: from CH0PR03CA0431.namprd03.prod.outlook.com (2603:10b6:610:10e::22)
 by LV0PR10MB997564.namprd10.prod.outlook.com (2603:10b6:408:344::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 14:02:05 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::d3) by CH0PR03CA0431.outlook.office365.com
 (2603:10b6:610:10e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 14:02:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 14:02:05 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 08:02:04 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 08:02:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 08:02:03 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADE23we378826;
	Thu, 13 Nov 2025 08:02:03 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <nsaulnier@ti.com>, <b-padhi@ti.com>, Hari Nagalla
	<hnagalla@ti.com>
Subject: [master/scarthgap v3] ipc: ti-rpmsg-char: Update library to 0.6.10
Date: Thu, 13 Nov 2025 08:01:55 -0600
Message-ID: <20251113140155.20419-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|LV0PR10MB997564:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3b35c3-90a1-4d16-1690-08de22bd3a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JSDP1jvtGxxqkpDV9B/SMz/PiGUJg/25wcZMX6+cB1yhJpqf5x1p6wH+V5lL?=
 =?us-ascii?Q?Alu2TEaYYgnW3lJEhI9w0qsT00hbDLGn1NDsavb6Nkty7G1EWNthm9p14fpU?=
 =?us-ascii?Q?6rd2caC4bf5HYgC7wvf8pxZeX0PUBbqzvXJiaIVQCcVO8Y1AZw3mZlSx7IfA?=
 =?us-ascii?Q?nQqrJUcAhPL2D4lTSc0V9EDGIQY+HXlGi1gDydxfwJvdhqYuMD1AQ0+R70NM?=
 =?us-ascii?Q?T70wY8Jkm1/Ww2FZx9w3s+JlPvWj94q0qTVAIPce2NJIYSXZxH47MeSWy2zU?=
 =?us-ascii?Q?SSHgpdfGZe/0WfEf8YJattDrlO+2nK3Zhu671ZA5NCT10Zmp3G0dMd3AfdYu?=
 =?us-ascii?Q?q542Pd2ri/57WtNknuDD7qEVZUM+9BxITctorNvveEqPowaIuj5HyWghV+Jp?=
 =?us-ascii?Q?ttnD2/3CXaONXQA2ZAJDlepsBt+gfv4sYde0A+zSOjKWY6IeyIDl9h4u6DG6?=
 =?us-ascii?Q?WlNhCC43eqWIQD0TEizPwIv3onMODBkjNSY1hDztbv2jHTJlGbh+lMTaZbo/?=
 =?us-ascii?Q?7jFH7tkYb55dr7gsUyVXrSSR19OfbZ28pDvjHNniKtO3O+9q3fKs7/Tyzl44?=
 =?us-ascii?Q?88sxhQMw2mOYsTxhNmO8K+8dU5B1ZRUOlcZHNLCDfWvji/OmnKoxhvp1Bwv5?=
 =?us-ascii?Q?sxSIhsNoqn9dKuC8RpJW/sLQFKRjIhJ+qwqXSqPBWgp9utQWD5QNU20EKbyk?=
 =?us-ascii?Q?hq4aP/WJq02M9Nix6qJEAXeYUyLWsL66pS/iDe2kliOPju0XTyX+tfJDhLsU?=
 =?us-ascii?Q?6MGTB8JTW76IoB1Jsv17z9o4Tpz2b+pAqxct8UV5udTme2CUVEKLu5a/kaCP?=
 =?us-ascii?Q?n5OsbzRTPAiySuMF1vsjpE2ORbggCf8+hudN0q7M3Ki5K1YzNVLUifznk6/K?=
 =?us-ascii?Q?GlqmaGrARme3O3v+CMQXH6VXY+k+Lb4dbq8+8+5yIWFzvRuPxgCvHYbQtrEi?=
 =?us-ascii?Q?6ef2QoK+blVuJQA4SIDq1SsW5eG3D8Cff4R/E2utfoibWY5oedk7CuhmABWs?=
 =?us-ascii?Q?B1HYCxYDQhH3qR+vmtyg62PYCWXTxdqr6mCmb5bvo4EyP1y3JFu/1fAuJMqc?=
 =?us-ascii?Q?gBBSlzdUtvl5GEzueoERSMig9yPVtCp5nkda2HnWxO5XAl7KrO35Sr3elzzc?=
 =?us-ascii?Q?2DEINBNoFcNJuEKjb8arPzJil3LWXHWO/eO2lJTpR9IKKIpKPXSiLPsbjzeP?=
 =?us-ascii?Q?pCz0HJAFs785MDJGQiKgCWgdT3/adV1CRZF1h+Wncp28LKmTRJqXFBgCt1bg?=
 =?us-ascii?Q?hOR3CIs8m6B++Z1d2JlSmu23pUlcv4LM3jJZDXPneM0cvOoZKRUoyz+IZpJE?=
 =?us-ascii?Q?qxWE1FgNBHSnrPJ1b6H7JmUl+CDe7WqvOZebK36EttP7LpLQrdm6n3sMBZBu?=
 =?us-ascii?Q?gMzWsnTtdKIX5A2XL0dnBUF0Qgpf9tggAAg7+uzoYofnxAgFSIDhNb2ry+8J?=
 =?us-ascii?Q?Sxn9D3qUpYaSA3H0jCIH+ds348DdhHlKSh5oD8aO7o7ofRYERQ6q1BMgQuKI?=
 =?us-ascii?Q?mgdxj9fBSWIM5D1q16zQc7ksXRvLSqe0zoH0benJHW6qd6kMo0+QG1nOzCmm?=
 =?us-ascii?Q?NdlUV2/LagO7X1ZLjDU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:02:05.5724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3b35c3-90a1-4d16-1690-08de22bd3a59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997564
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 14:02:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19270

update rpmsg library to 0.6.10
It brings the following fixes from ti-rpmsg-char repo:

d4cf638 src: fix bug in file_read_string()
3e72722 src: add api to fetch kernel allocated remote proc id
5061690 benchmark: update max runs = 1 trillion, max latency = 9sec
4aa2a84 examples: clean up tabs, delay metering
07660dd example: add rpmsg_char_benchmark
b40845f Replace read bytes from 256 --> 496
b2e9e2f Update max message size to 496

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
changes in v3:
 - Fixed commit message typo
Changes in v2:
 - Fixed commit message typo

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


