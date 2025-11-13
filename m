Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7EFCD8CB1
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 17:16:27 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1420.1763054185440886299
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 09:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=o9zb4ylN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.8, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoF/ixzvCzI9Ds8qtACZb0yJdMpavrSfvNvXYvX7y9AoZdaZ3qeefIB1opu2D57cIS2MQmJHm8t3JKPSKiMV8xna0539+KINGf/+G6zs8GfqF2Pv0MMMSFwZxa2qhNQT0li+9pqyb78Fqzpe31Vp/Ub1MgRNPlrL7+UzM2itXTnRwjS2U+VL1Qamn1jIAZTymDYy4h39eH2BgZ4tBktzv6sEdozehMOni7RCNkUlnxbXLYBixS117/hxWCICm0Ajgi/KsFs6lFNub0mRAxgRepkDvOp7eRacbDYbSXFKyzQZniHU+7tc9pLV0408kAifpjp7hehmOzbAVFabQP6TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thnb0TitNuV9Wj1+vfNit8nJZ8S2Twkl9choMf7ASI4=;
 b=GS3nMW2iP9+YBLRYSluXUDv1lN5dHVl69Nc1QtV5Jtjmx/dk4y5ww0yllG8KmxZhXa3ohbcT+ZRBsK73BEmLxf25y9u+kqwduhV22JPQdsxMf1zW6dJP1AuyXMhYzOvkVhMiMXed3Lruy8ugKhJ8XrT18nXIGwp2qoZZzmvo+FPF16acgOoBGziAMVtVL2fj+FhIPN4mgYkZ8WUXhgt4j4hqjA6/EvdYSbUFnO6uaaUU8nClIQMysjk+B92uRI06fkhDAe6DmMB6mJXi1uA9PrOQf+pd7sIZD5oBBOeZePl3M2mZybtliHxhWgJgzJDMhDJMi8LsJtNPZIqNX/U8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thnb0TitNuV9Wj1+vfNit8nJZ8S2Twkl9choMf7ASI4=;
 b=o9zb4ylNTuUh0B/PYWhTLeL94oxP74AxLnBpQOjG3oyhyjdTBp7No6hP5iAf0f1svtzUHidwgx7dgsqz3ArBIwTPjcbWyov8Zh3KSxg7cvRkK4mEaDSDJiCnVuCVvBtr5CFquko55eyxu5kuFAaiwWhyQvbbw+495U+9a7b66Mw=
Received: from CH0PR03CA0308.namprd03.prod.outlook.com (2603:10b6:610:118::10)
 by CYYPR10MB7628.namprd10.prod.outlook.com (2603:10b6:930:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 17:16:22 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::11) by CH0PR03CA0308.outlook.office365.com
 (2603:10b6:610:118::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 17:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 17:16:20 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 11:16:20 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 11:16:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 11:16:20 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADHGKq1583752;
	Thu, 13 Nov 2025 11:16:20 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vJavj-0001tu-Vf; Thu, 13 Nov 2025 11:16:20 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-rpmsg-char-examples: Fix patch
Date: Thu, 13 Nov 2025 11:16:19 -0600
Message-ID: <20251113171619.7266-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CYYPR10MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da9922d-a46b-42f3-aa88-08de22d85d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XN/OujtYyIpi0gDKx6fsvzy62Df1uqWl78eQQnjK0R8eIjEd0KvH4Gd2RIk/?=
 =?us-ascii?Q?QN51BTAC2pq6l9aaY1Csx0wM8E58vWUNo4INh1jZLXfKFFI+xKetPy5aT9Cu?=
 =?us-ascii?Q?i6IDXPl2pljsdXCuO4omLjO8O6n9EqssBH3W+gVfyOfW7Q0kVABNYc0xtOhT?=
 =?us-ascii?Q?dKvUCCj9sANswNCMXPCon3uyFLYSxl/HN4p2IlZCocbc0eVOPr54z5JNqpMu?=
 =?us-ascii?Q?qOgMPEuDO5vaqGvI880pCL0c1Fk6vkSTr8/hHXk3J+mOJylZPmXKOYcEHL7V?=
 =?us-ascii?Q?zIbcJF9HUj2I4AaCo2pkcmYfMr3gw3JpuPnhhZ/zSRX8OSKxCLkfvUN1i8aT?=
 =?us-ascii?Q?vzYE33iW/qfTv5hFos6/SnQYC/srK8J1fLhiEgfIGX/NsbYLzeMaEvSSrhUm?=
 =?us-ascii?Q?G7ETTAcBksJtJu8757TECyrtcHIV+fW4Oghz52icSVxA43TYAm/dQWqUbFMS?=
 =?us-ascii?Q?CfZMw6aWPDWCjGL3NIuEXADi6Jj4YzusbLlTE5fZHAfAGFpBNdRcxMEjAZWK?=
 =?us-ascii?Q?kJRfOCthgl1GH1XsIIphQYbjhmFWoyNRbzKc59NZ1cKqCmNMCs3ZLxNTJPIE?=
 =?us-ascii?Q?bpQ4gU9UPsOXiwYhrwDz7BHETGTMNu4fOw337AxFX1890XSLETCjipjDvslO?=
 =?us-ascii?Q?9yL14im1nfatst1c4sYK0Qx/lZQiyCijZ1nGK1ZwVyxhKDf5mEbq2/+WD/PG?=
 =?us-ascii?Q?p33ahwwG/v+xgYuvyh+vye0+DsnhjYrJFpXrllLvA8Izimft+f8U++1WFGUc?=
 =?us-ascii?Q?TL4lf3twKoSmTGm6IWTn48Inmk6Y5TX6SXGvwNKcukHjLzuhZnu1hvcCMcmr?=
 =?us-ascii?Q?aMxcOxZceVTN8LTEeP5b4Y0bBZn4f3AUx9Gdq6szkVo7Ab+G+fkXLmeK/x8E?=
 =?us-ascii?Q?4TuKMHLPv/TRZ3XuwVBPN0ZqJzFfrB1fgIkhpE6ILrYejoq1bIj0Ilc+yfnA?=
 =?us-ascii?Q?Nsw7WPB2BVyz5OWE48Adfok5muX2ccF0y8+pXe2BWIvEIQjS+Ozl4PHfM+m8?=
 =?us-ascii?Q?5i4pqRKyPsiZfMz+N1Wa5wNUlT8p98akvoEU/HsuqShdk2zCAzcvINBJ0GbG?=
 =?us-ascii?Q?PfkaJ3BX6FJghFmrUFLIuBkz0I9u56puzkNQ7JNPwKfmwaD0Ft4OaKi1XeTG?=
 =?us-ascii?Q?PvoUkh99r3KJpwJc2Tm0+jkevgXcbc++T+KJYvo0ung6afxptUQWSEGWgO6H?=
 =?us-ascii?Q?NoPPThnaJLEMt6ydGh3Pxy4DKz6uBNfsj/E8Bnjs9iUZMR6/JgsBWp5H1VOr?=
 =?us-ascii?Q?kRni+IlIe6qSOidy+kGhhegv3O0e4B//h/ObMD0Dr34WBOhf4PxUUUcUvoxZ?=
 =?us-ascii?Q?6I+m4R0Eu1IcckO+7n5Ra/rNI0fn5Fe11RETNP0+LWg0pB0HSYAbAoZXxoLE?=
 =?us-ascii?Q?QAzeb7tCInBN0K8MhRrkTJHTvS6j7ZamO1gkDEap5G4Z0vDTgsKcQsxQPJCH?=
 =?us-ascii?Q?WtqM43fEsYcBX18tdKx2e0NHir1n8LNjYGPl1Qym1RbYi7xR+FUD2M1UjoRB?=
 =?us-ascii?Q?jRgsiUuBpASMYjbh3OnML0nBfjv5klNxAleRZ71fXLLf6CdcCMl9Skbt8ZaW?=
 =?us-ascii?Q?gU48Fz1Qt9PNh5VFpoU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:16:20.8656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da9922d-a46b-42f3-aa88-08de22d85d78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7628
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 17:16:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19274

The recent SRCREV bump to ti-rpmsg-char makes this patch not apply.
Update the patch to match the new changes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...les-Remove-use-of-includedir-and-libdir.patch | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
index 71fca1b0..00ddd731 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char-examples/0001-examples-Remove-use-of-includedir-and-libdir.patch
@@ -13,11 +13,11 @@ paths to linker/compiler commandline
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- examples/Makefile.am | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
+ examples/Makefile.am | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/examples/Makefile.am b/examples/Makefile.am
-index 5a9bedb..d547e41 100644
+index da34204..34ac7a8 100644
 --- a/examples/Makefile.am
 +++ b/examples/Makefile.am
 @@ -1,6 +1,4 @@
@@ -26,13 +26,19 @@ index 5a9bedb..d547e41 100644
 -AM_CFLAGS = -Wall -g -O2 $(INCLUDE)
 +AM_CFLAGS = -Wall -g -O2
  
- bin_PROGRAMS = rpmsg_char_simple
+ bin_PROGRAMS = rpmsg_char_simple rpmsg_char_benchmark
  
-@@ -8,4 +6,3 @@ bin_PROGRAMS = rpmsg_char_simple
+@@ -8,10 +6,8 @@ bin_PROGRAMS = rpmsg_char_simple rpmsg_char_benchmark
  rpmsg_char_simple_SOURCES = rpmsg_char_simple.c
  rpmsg_char_simple_CPPFLAGS = $(AM_CFLAGS)
  rpmsg_char_simple_LDADD = -lpthread -lti_rpmsg_char
 -rpmsg_char_simple_LDFLAGS = -L${libdir}
+ 
+ # rpmsg_char_benchmark program
+ rpmsg_char_benchmark_SOURCES = rpmsg_char_benchmark.c
+ rpmsg_char_benchmark_CPPFLAGS = $(AM_CFLAGS)
+ rpmsg_char_benchmark_LDADD = -lpthread -lti_rpmsg_char
+-rpmsg_char_benchmark_LDFLAGS = -L${libdir}
 -- 
 2.29.1
 
-- 
2.17.1


