Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF96D65C63
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 23:53:30 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29047.1766015606797286264
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 15:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ONKAQpjE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.5, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5Vj6IoWS+dJcKoYObQqpBBt3nMzRQrU+ejNhpTUEI9MrWNOjvjR4+S6LNe48HfgcsnHM1y9S/mmAbNP1vgyIGXj/vb5Uhl1cbSiKmDEe6M/+JybzFiz6UxJcJQi3wruRw8eTltsHrV966d0+VKn/S7TYKNduEmVZjzSVa86POFS3F0deL9EXJwkTNQkLtESOUwcF3LGldj6UwU9bdit6WmSMzVwDfOIa3MB/H99SpKHDNsfolvR1lsKI/1PEGucLrZrlqSKMv83tuC1AwbAyDXwKmB0h7Rgll0I7qt7TA+F7hZxi/mPUMS2L3enDnW1tW5/JLgwvJaCG3rIwbsfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZdRPtbwbA0s/XZ1up1gs279Ef5JJBJe+Au4Nw9QHGw=;
 b=i41FJLDHwThVw6Z/LRMJNySM+YprS7VsbDPitbouDnTywoywY2qWBSfkjKqWuucWX4B2X7fwRnsYbOsv1kN2M7LBa02i4TC39bOaFk1e7SQWKKJaifi0qPTl7RiCYBwuXKPa77hkApOzZR+EllTRyCWatAAI5AScTO3dlTOI0IDtzClo6PdJRb/v/FV/nSiBEvf7MrgRXFHJPxUr1KhZbXKh9RtHx/sMOE3oI90FD5cwWdCpGHqwEpCE915O2TqIlnVMj9fe9p4Tz/kahye4nML93YXH2aa5SzuPuKBUk8vAIuLAxILUIUEt8cV/AZJEYvvaC/lfn7GP6tUBcqa8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZdRPtbwbA0s/XZ1up1gs279Ef5JJBJe+Au4Nw9QHGw=;
 b=ONKAQpjEUv/S6mXgkEaToBL+o6f83IAXt2M09GUsIoYoSRLIG7DWdo2luRsnA37KWNwLB4O5yOEeDPmWpz5KASJLs9CLys4MBXWs5PB4KzYWDYnPK73epArd8PoMsPqxI7U4oqcSkdLd8R0W6R130eufeBlwOkFgihee9QAI04s=
Received: from SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27)
 by IA0PR10MB7206.namprd10.prod.outlook.com (2603:10b6:208:402::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 23:53:24 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::c9) by SJ0PR03CA0382.outlook.office365.com
 (2603:10b6:a03:3a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 23:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 23:53:22 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:53:15 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:53:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 17:53:15 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BHNrFMn2432696;
	Wed, 17 Dec 2025 17:53:15 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3 1/2] beaglebadge-ti: Add support for BeagleBadge
Date: Wed, 17 Dec 2025 17:53:14 -0600
Message-ID: <20251217235315.1333746-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217235315.1333746-1-jm@ti.com>
References: <20251217235315.1333746-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|IA0PR10MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 190833de-f4ac-4e91-c105-08de3dc77652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Wn3CpbTJ9N5md5bQfcqCBNI06acW/nvOrrWttX6U576VD7UXEu0PgPTSRH3?=
 =?us-ascii?Q?Dn+mVcGsxCKYAPRz1Hq85aFQhPUuu3xxPYfXd4NLsyyg/HVzue6sl07hX6Gj?=
 =?us-ascii?Q?eBxYgSMH0sNqf54/bH+gAws41lmFoNW+zd7mlhwbpyRc5zMSLi5Nh2Wpk6DY?=
 =?us-ascii?Q?2GCW9H2cEypHlyq4fdvqu2MVzxgTMY6tguIQZI/gIwGVoCYHHAlTK5FEX43B?=
 =?us-ascii?Q?Ou3rHIszZXDAnlWL2GG9ahyTRvQHop0juYb2Nws6BVa/65Gql7hrZ+m0bq2O?=
 =?us-ascii?Q?vGeY6tguqCIYj3aWZLyydLF8jSqYPZ3dRev2cmnOEo+o6DRmZzf5krkOTeKY?=
 =?us-ascii?Q?mtJPVpuQ0vCB1owK3cc07VTkfPDffTq4ahRA1968IzG/BU8zQKosnTVygbUu?=
 =?us-ascii?Q?xysC3cifXhVA0Zm4KcwRqjpxt8pCkGCjDpUf1ja2z0q2EgGV5xby/zC37deg?=
 =?us-ascii?Q?zNqF6AJ8ek4SBIS1JUTmnN/bTbO+lVzuQiw4ReP+rcs1HUoY7gW0FdZsqydV?=
 =?us-ascii?Q?hJxm9gkx7jO8yjPSG28LQusZh00hJVBaoai2pjDRFdSbRpCH+BUcoaaal7F2?=
 =?us-ascii?Q?xAMK4MGrQ+H0lTW6n6NERBzpeIXxC3B7rFf8i5m2l2H+uKo327ksIVCk3z2f?=
 =?us-ascii?Q?bgg3/YkOLkP/sVTga0T5HbxUSj5iSEEABnXbDpV3qio5RGM/hYIUuplAezfn?=
 =?us-ascii?Q?bfWS+1ZQqQE5WbRLVY/ppkIkdc8sll1sBgJApzuxzZAb2aWi1bh72pH5U6hX?=
 =?us-ascii?Q?zQIiP5MdNrHHcipYJPwMGbnjXITJ85DXD9PfJxOIdq/FIbMvxKFNkVMPr5bS?=
 =?us-ascii?Q?a0a7SuJFrPQMZJ/5cHLabWWYaLDN/yS9P03NQyqA0yyUmjeGjzAIrEw/gkpY?=
 =?us-ascii?Q?gmSghnYXLZ7WhVsh/3CNVNPfj/tb4qSi3laY7k0hbFPdGSo3xjEAhLAyNbUr?=
 =?us-ascii?Q?wIRvgu7J4MfUc2Ln333jhcSgAN83sYgEbveV+R4noajIfZ4jpHU95PUnw0go?=
 =?us-ascii?Q?9JJzL0bSg3z397XNqaNvevL4XeU801l3bKDi6qlv8v0jSIqHt79/9NGSCQnr?=
 =?us-ascii?Q?MAA9DLsE3PvEjtN7WfJRshGIw363pLnKVnF8OmDgJxvCPoT5kLcbRmnOfL01?=
 =?us-ascii?Q?r9xuU8j0TFqtwxFnvvv0WmcXv+WUZ0KBD6WLlYZyYA7QKzltx3tlvjGFZtKt?=
 =?us-ascii?Q?jaDADR3+a4Wwj0KXgt1kcFdwVnEqwRacc2zk09eLX4CC7L3MP0exkYSVvN3L?=
 =?us-ascii?Q?9iE2un1/HOBy4/SKjICgtzg67icgbuVsmuy7k4q/YYYmWnE3AD7Una2ZhX6k?=
 =?us-ascii?Q?dXUZLsWaZX+98J5tzI4rETu8UH/ij8EUJoRlwJ9EHzACox8IdpMsCa6Sudx6?=
 =?us-ascii?Q?AR/c9Ue62HOKLUimfrOw6TjLeE098rv30m2AJ8LhUC3/KDZCLNqpWzfPNNzh?=
 =?us-ascii?Q?ULG0Oz6EL592nUuXzfVDowHRknMw3tvYo6/+i+UzhoQBL/K5H8+qO31Fqzy5?=
 =?us-ascii?Q?dDETJI3NbxRuX/Zmh2hKZ0SO2Ay31UjftK1KgJYFh91/NGwIq+kd6NAbwxel?=
 =?us-ascii?Q?5HO7FVpLzSahaigJjvc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:53:22.4847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 190833de-f4ac-4e91-c105-08de3dc77652
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7206
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Dec 2025 23:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19371

Add support for the BeagleBadge which is an AM62L
based device that requires new build configuration
for U-Boot and TF-A sources.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- Fix commit header
---
 meta-ti-bsp/conf/machine/beaglebadge-ti.conf | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf

diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-bsp/con=
f/machine/beaglebadge-ti.conf
new file mode 100644
index 00000000..ff870c92
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: AM62L Badge
+#@DESCRIPTION: Machine configuration for the TI AM62L Badge
+
+require conf/machine/include/am62lxx.inc
+
+IMAGE_FSTYPES +=3D "ubifs ubi"
+
+MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
+
+UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am62l3-badge \
+"
+
+KERNEL_DEVICETREE =3D ""
+
+UBOOT_MACHINE =3D "am62lx_badge_defconfig"
+
+TFA_BOARD =3D "am62l-badge"
+
--=20
2.34.1


