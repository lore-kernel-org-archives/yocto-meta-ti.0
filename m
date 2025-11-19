Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EBACF58FA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:57:01 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17631.1763585810140955575
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vTdRxq4k;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.208.58, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO3alDU6kAQ0t0Nkpry79kg7sm6/HKT/U7CM/OROctwXwsOVAfvo4MxsXOOas1p3op+B2CxFbwEigTPrR0rTY0SDDlaegadcoqL4dVE9ciQzMsgtQJ4DVgw685isEfyZl9oS6BATtIkkSsqLq8Nvqh00GW7puq0JvfrBci7j+xmc1wy/aiQHkUCMIXMna1MkZhm0UNxz8rBg1XP4xqwbDcBjt/h8QKvtRlphnXJ/+Ls9943rr6i2yL2cbJIU4vhT4OP5zWhLS89pt4QutiZpqoOyaYmg2K+U3GUflmjiQvMMG9Zw2+/mIiAswMhW68JMxHGt9NfsZcgSCZYnzpiOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fH4w5jfS5/efgutBVDyzD+0fIPaLx2gi4YosPlQQYVU=;
 b=e6N6980vziCa09p4bkOUu4CBVvyOavjX5I1vf+U5d63yVCRyVWLZOeoGPlz/ViQ21qetdg63odL8kXLxQ5h9x21LUpzylV2syB0oDiNU860W2qvXpeAXsOijINOC4ZilvFwJ2K69alKBXPa70LFWfV1bUr54r3xO792dI1xU3MHYYxdfWRMxinQo3EHbjGgMpaSrLv+MZFhuzhgcAbM7kdGl4AsC1tl7o/EQHs6w3leMxAdQXjsBa32qoO1J9XqOck+2NflKVF4N62KZAqMtpisbtT1K8riAfJSVma/yh7n+OY6Qt6VM+SXUVxS1AVrbsnjRKKZT2EG7m3p0se/htA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fH4w5jfS5/efgutBVDyzD+0fIPaLx2gi4YosPlQQYVU=;
 b=vTdRxq4kNgPkVBKkWra1wHp5uJPZd9cdn0AZSAQhaPkVoGu5SXnHEJClL0y5FCCb0x4oV+2j6+ns/CjzPM5pvfkG4Y/Vnd2msFgkDFv7qoBTUbuN6KvfW2wJuLPuCTae5GfH0VAWhacUdVjf1HtJAR+ntfTZxfJKWdlzrvUYqPY=
Received: from DS7PR03CA0070.namprd03.prod.outlook.com (2603:10b6:5:3bb::15)
 by DS7PR10MB4911.namprd10.prod.outlook.com (2603:10b6:5:3a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:56:47 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::a0) by DS7PR03CA0070.outlook.office365.com
 (2603:10b6:5:3bb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Wed,
 19 Nov 2025 20:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:56:46 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:56:41 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:56:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:56:41 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKufrj2513227;
	Wed, 19 Nov 2025 14:56:41 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vLpEH-00000000LWA-1lCi;
	Wed, 19 Nov 2025 14:56:41 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 14:56:41 -0600
Message-ID: <20251119205641.82707-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DS7PR10MB4911:EE_
X-MS-Office365-Filtering-Correlation-Id: bde5a630-0f6f-4560-b200-08de27ae272f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OC3xLR6CNNW9kEwOT56tkA7iXShlTsrndFueFHsS/ee4rRZB8ru3mESk5m9+?=
 =?us-ascii?Q?Dul2jq7jAkSQZ3Vc5hGTriU0c+EkKBrSTD/hrAaXTTjd7JyO9wWBWd5cJ+hy?=
 =?us-ascii?Q?tUsm8luS1YtrMIQCjl3rgS6VvbyJELyuUiCme32Xm9iEn8XjneG5ngYg6J/7?=
 =?us-ascii?Q?pOxbz4IaQ2lVhZg+dW7rzZQ/4ZDaN/wQfD7BzhmS/rENY4s8AI/F5pUt8V8B?=
 =?us-ascii?Q?SePwJxDbZg2bVdJmMcvPkgxFBPHWsuJ1oZgUa97ZNKF8qw7krSuWCwtn+BpV?=
 =?us-ascii?Q?LEc+Wvv8inFnuloy63nKLQWD1ZwDy5RWOGthYTBzSdJU9PLS+4uYcIvKfWhu?=
 =?us-ascii?Q?OhvgozMQk8fFGCHHT2OLdYbiGhtqQV54MU9btak3uNbczxyEr2R/TZj/CpzV?=
 =?us-ascii?Q?rc4jBwcEKRvfrqjm2zcdNQ9ajeSGMtNbm42GMymIsTzvoZqgoVFxw0bSR9u2?=
 =?us-ascii?Q?PRF56nsBxF1MpPtSNff/cyCxQNnXqwXxYwbi5KjeacTUSe/9VUFn9iS/0CfW?=
 =?us-ascii?Q?9nfxRX7GZs16uMB+Hjr9Blzv5kUAK2KWh74X/5QHkkcTxgKJic7Y364/yRM0?=
 =?us-ascii?Q?VNKKgaEZD6gyYB/Nw8KrF7IyiSIipQ+p8MnFrNHqYmi0BbI4dnMuNiNkO5ro?=
 =?us-ascii?Q?S6r6zRCN0BgSfCXsKfFScHPmCxQtgNL+BTK4WsrYpTTOcYNALy0Pnw3XUtzW?=
 =?us-ascii?Q?D1xZeMULSVPET2ku1LCOzlyUj8YG6X84rNz34Kyzg0RkKUr4x7gks/kFHGXh?=
 =?us-ascii?Q?6nXC9CfOr7o9KgU0RAuGtFWs0dcD6QgsgMEHeKAHLwOIvbCNhKoD0cKUxuOi?=
 =?us-ascii?Q?ENemCqcxdM/0h9M+INMn/QYJj631IaWKPqXkSqWDajMm4WspAZn+JTKf3Fw7?=
 =?us-ascii?Q?pZrB25+M+FNxf27fOwwY7TDgGZdzG0n3rgvjJhdafGu9gjxRya9Sz9avSyRX?=
 =?us-ascii?Q?yi4IMDufxvJcESC/Th7+Mwx+KxW1F5NdZ5tznz6ldVwdxK826NTPxhsd+L+B?=
 =?us-ascii?Q?YSo09Jm8/CnlvyntzV4Q5owQpubWeFzj4/g3txbmycm8IgHdS5iXhnzbcq+E?=
 =?us-ascii?Q?sHMyjOoUWxUY7VpQRxvYgav3HngT+BrZhWfQOo5SbZ61I7+N4bHSGDOxMr5k?=
 =?us-ascii?Q?tdNFj8saX0TRx6ZDJO7Bkt8dAFSJZ+/dctk0XOvQyx1nMorymEtsQkovrP9b?=
 =?us-ascii?Q?u5RKeEOct57zOKZFprcdGtuEbsBRwNVj/CZ7zPJDCwdGsZ7+RLHUu8LW7duh?=
 =?us-ascii?Q?NMJT97D5czirJCjUm0QttwMONuVNYuQZmLtr2DvAI+PxTXMRjCMbHlwCoqt3?=
 =?us-ascii?Q?R6jjxxJUZpe1WrP83gzRvWqfOY9tlg9yliNRuk6FNF9H5Y/ToJ29S5O9zQlf?=
 =?us-ascii?Q?XL1iBe2hyS/P01HGWUTXTNCoE3Iar/kBoMz6Y8eUScAY4euhBg+yK/cSITrV?=
 =?us-ascii?Q?JRW0Q1lfTVtdT7Nrzb7v0ZGTE578yR3co5dkH3OugSBepHXUDP0rOdcv5sp1?=
 =?us-ascii?Q?uS/4p4awXhYNVI7o7lZlomm/C6EaHUx08BnF4cf7GxkGMjjEsxiC9pwtkWZb?=
 =?us-ascii?Q?xL4uZzL0spptQmsScRA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:56:46.7778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bde5a630-0f6f-4560-b200-08de27ae272f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4911
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19295

We have added a new PV check to the check_repo script that checks to
make sure that PV is set either in the filename or via the PV variable
in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index fc516a51..038d665a 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -30,6 +30,20 @@
             "meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappe=
nd"
         ]
     },
+    "PV-1" :{
+        "skip_files" : [
+            "meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb",
+            "meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimed=
ia-udev.bb",
+            "meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initram=
fs.bb",
+            "meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb",
+            "meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb",
+            "meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc3=
3xx-target-scripts_git.bb",
+            "meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb",
+            "meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-star=
ted.bb",
+            "meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb",
+            "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
+        ]
+    },
     "SUMMARY-1" : {
         "skip_files" : [
             "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
--=20
2.43.0


