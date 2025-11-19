Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7CDCF58F6
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:56:01 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17605.1763585744812740805
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lvXJ7b/2;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.93.195.29, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycsng58yA44WKFO4nmv3i56IPPYD9iP49N+K730p4LGTAcYYNvKju6nKMzaC+asFBx/E0S225pO4Ck2SUseYM/BOsRhblIXmOz6kEV1ipWoVuxf94aEoB4Toro1T69RrJIFXAiEPUINxsrLnlFhxT1zuS4J3iZpdYbcbB4mZ0TxQvOqI/WWaNT5gfw1D95q6N3DjqjmhaD31sJIKAHZiSvrW/OOL8H4BkyoLLwjnVtRiNphYtYOXN8TQBcdg+345Kx6LgSbbJ0fJ1DUziPqa8w0TkA+VxrBaVCQsCWS0ZpeP0hjAmjJd6WMJLnIs/7vXUPNzsf5IOEwAB0i2ZDhH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Nzwn2gu4iKNr7hzYzqteDPpPvf5O1iImxBEJYICyso=;
 b=eDQdA1KBnu55XycdHhtm2w3JTKrkUgRVErWAG6PwpBklDo1FvFbPzwFJctGO6WXBIRisaSHcgmqvwKlrN9/q8ipdQ0Hpa0mGm3p49rwDxAKJv4NQEqC3+yAHMq96CG8CJHSDVRbOB9wi09TTJhhMhu/VwI6aVl/3fz7Dq9cSfTvj8tbVvSW/ELlLPxLTG17SIDyE7JoiW4UUsIkYb81DzPXf69tMkuFyRb2NwDejxYg2Lpav8JV+AS8fNU4SC8XZZAiEfV5G/h8T5cPfz2m1Th1nbx7wRqyhJ4cOucTmKCrKaAOaexv6mpFK5vf4Wj1CEuMwMftJ/rUKOXktQYR7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Nzwn2gu4iKNr7hzYzqteDPpPvf5O1iImxBEJYICyso=;
 b=lvXJ7b/2vdU6FogytjWr2p1wJR1fhiXvzcfMpwtXL58nh3sON8bEJPAvYrrhwgerkl9r50kUhDPHH9MuXX0gqy0IcVqQ2fuRhNpstH4pRe98jgrm1rE8UmoBwprEH6HRTgdDAzFVkSiHnXUJhPCxqkXati48adwhGqLxXH7xZpA=
Received: from SN7PR04CA0109.namprd04.prod.outlook.com (2603:10b6:806:122::24)
 by MN0PR10MB5910.namprd10.prod.outlook.com (2603:10b6:208:3d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 20:55:40 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:122:cafe::1) by SN7PR04CA0109.outlook.office365.com
 (2603:10b6:806:122::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:55:39 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:55:38 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:55:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:55:38 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKtcNb2465142;
	Wed, 19 Nov 2025 14:55:38 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vLpDG-00000000Kx4-0MQ9;
	Wed, 19 Nov 2025 14:55:38 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 14:55:38 -0600
Message-ID: <20251119205538.80531-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|MN0PR10MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a48780-8d7f-498c-2b48-08de27adff37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?etbU02N8PZvEw6MRNA1kQEiKgWbilHGxskVKAejsL6ET4G2nFsqjInBHIkL0?=
 =?us-ascii?Q?wVPLdfP9W7l1XI6I5ozH/JUCk3szR4TYg13Tu4rJzrlSN353ciBTrvXbKlSU?=
 =?us-ascii?Q?6op4khRRcEwZt83M3qUp+8KsEek7/HZ5Uo6XgPNRH0iXiVlRhDtpYU+aqWP5?=
 =?us-ascii?Q?rhXvRAt7ftsX/hvtULdt1Br97wLwYJBv7pNA9Cgt1KjiSXzQXy6xXsoYIwJQ?=
 =?us-ascii?Q?qq+P/pJevuwk4Wf9pBjI2GFmb36R0fPUOxeWrJoctsJUZdKKT7kfSmIRwcN3?=
 =?us-ascii?Q?4F7V6DuMHZItG6kalqAZcKpvGdCbEFCUrZu+v7Ci+2Mf4kB4p9Og9t0YFk6s?=
 =?us-ascii?Q?EiTWBdsBGkQZZT3KDYg0N7Ge4EX64uSEIlpzVSW8rIFD/XehKEklE4g0zSzs?=
 =?us-ascii?Q?sP0L0RjsGYod3sLDd2V0pMHVKAJArDKHsPomK+LoGYIws+Zyn1HzvcjyQH6b?=
 =?us-ascii?Q?wwbdrqQZiI516ESF/sxHLrSb6miaiWvXD2PL+IFwtVy766Rda8MGpqq1e71o?=
 =?us-ascii?Q?AVJRz2d15CKqgdNxzKCdaHq83ANzd/GyJE6WRGLvBbwlIJf7IV8N4clpXuYa?=
 =?us-ascii?Q?W853i8zjzNoqwRgraSWHFBuWpGZb2IlqwbmN3KGxTxePxNfZFaHNNc+nXtsS?=
 =?us-ascii?Q?2IAhSJowhTp2wNTzeYjDVweaXP3I78Fa44rv22QsruggSbBfknmfz3x6fjjD?=
 =?us-ascii?Q?cC+T6bhvXlKIhOLOxLgPT6KQX57qSk0TM3EoEhllfY/9/KVxRbme20OiWGZQ?=
 =?us-ascii?Q?LNnOny6st1a6lOYiAidtF0H4oHoczQcWfBeN2lii5MMzi+ZvuJ9T57Ej+y2Q?=
 =?us-ascii?Q?6YHET0fomcrdaGC6ym2K9bkwK6g2p1DW5lLoxwaNtxN+KG0lugXbtPF7Bujt?=
 =?us-ascii?Q?jSRY0RC0ER6wizSngolotjq8RrWQVI3OiJR5OUXTSe2DtH4zYMqiE23104ZC?=
 =?us-ascii?Q?rRYVZRmtuAGRgj7/RzgJlGxdmeDFqeTL1fXSi09eD4+aHAkFZ18xMed6TdCw?=
 =?us-ascii?Q?/OvCDS4OxOmlZygKcUkhZxP/PdjbsUfmNCT5J0MoOyGtm8FDOSUEakoI+Tei?=
 =?us-ascii?Q?OsmZuy2n3qiDWJZX4mpf8iyU3CYewqB/giecqLgWccj4FdnYofAaI4Z2+8s5?=
 =?us-ascii?Q?Th/sYOe3ROi2W+JOKEVeRV+O3r9ks5WB3aoJ4zYa6Z4F64l+A9Cm66ny4hjQ?=
 =?us-ascii?Q?lT+TexAC0SImTuCNSjSTwtj2ksmAeXdAiUP2i4wV14SYuoeTV56C/W15Fa97?=
 =?us-ascii?Q?7ah4sBFtb5Legd5wXRq2DmNYWrXCBL7CRvVyy5suoja7nYSxyyrnqDedkqWp?=
 =?us-ascii?Q?p3cvZCFjqMWx/HHag5GzQjuARwW/V7B0kysJaoY4cu1Tur9P2ij0ASx+vK8+?=
 =?us-ascii?Q?zKAT3IdP54XrdBe2YEjbP6TvMIvJ7oXaxtTTzcuizmWki0ciJ6qY/zSdzjzq?=
 =?us-ascii?Q?2WB57Dn67wBDWPqQgoiPzXvLaqGpfva5lL32nlcwWQ8PUASItGu5V2jk1YIj?=
 =?us-ascii?Q?aPo6In1nosbjVYRod5mG0eTlDLzcgBWJ5+moa/oSpwYR2JyksNc7lsAkv1Yx?=
 =?us-ascii?Q?qIMAuk7D3MkSSaHU6gs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:55:39.7320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a48780-8d7f-498c-2b48-08de27adff37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5910
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:56:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19294

We have added a new PV check to the check_repo script that checks to
make sure that PV is set either in the filename or via the PV variable
in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index e4b5ed35..46a6c6d6 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -29,6 +29,18 @@
             "meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappe=
nd"
         ]
     },
+    "PV-1" : {
+        "skip_files": [
+            "meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimed=
ia-udev.bb",
+            "meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb",
+            "meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc3=
3xx-target-scripts_git.bb",
+            "meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb",
+            "meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-star=
ted.bb",
+            "meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb",
+            "meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb",
+            "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
+        ]
+    },
     "SUMMARY-1" : {
         "skip_files" : [
             "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
--=20
2.43.0


