Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE37D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 10:09:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18406.1764583797095332781
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 02:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bP3syQcg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.23, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8vtzabXHzBB7p0MJSiiNOwg9AmRdVSlXAqZcneEsI8NfCTay3NJb4auAAGOOs2FMlu3vPatIBHXUkCkOrXUmMqOOg+AqZAL9n3RXH2tjvRehCODyMxx3w6m/sr/t83DHUG3zqHQAoZLGJqdoukx1QxwJHlwTBVD5T1ij7U4I0hhAG51gDiIgAexv5TnuDhVvZstFBk7pFdeI7E5Xq97KcEQo6uAfhAp4mKc6C19+vCx6G4XDhLwMbYog82ezrzAfBnUgD4X+Zx4iWpWZXK3NYfGg5FAvEWCT8V/pOAosN5QqHwo1tbxpt077CqEPs9rMBadpqfHyFEZQWlz4eSOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFpIHi0LcVsrDpDoKDGuQnegd9EVzJXRL8zkHjDTf5E=;
 b=WyEC3DiZWA0N2uKqI2utucsGM8dZxAh3+XZ/kEr7Lcf1FevwwAdvNqnP4n8Br8/8dVkykXUL3ISHYcKd6lccWXO9cvoQaLeUB6O9ZdqLS/4Z4fBLn0q9eSIhEc9iSajEIx7K4iuR7b04/JsovK9f2Ys+WAZNDBDZeFCNIZcCx2ClndZ9UcqJZvYH7Y7He8kveK5m1CnHUv/QeMYuJ1yYAToJsCaFMyv9GfhR9rQeegDOlWNpMbxu4WBAWQek46Izp2BhXl1uvz5402TMkcBnsdPgPJ+BSSQPt7ZcVIJqCHD0QZHmUaEVYJoKeKOQ0f5tcAonDs7PDWUDeZ4hEzikrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFpIHi0LcVsrDpDoKDGuQnegd9EVzJXRL8zkHjDTf5E=;
 b=bP3syQcg0PSE0nMI4fHrGT8fUrteyKIVK7i6iwKpo1I9MFUXi7/LjkqSAX6ZkvSs2waG3xnF+zKbynpSRAjVc6GeqdTj3RJIk8LBGFaWIUxrVHQR5GUfj5KwieD2n5YrxY6rrF5S/KSiIWzt3nwigQvZFQCvekstNSpkRhIM3Cs=
Received: from DM6PR06CA0077.namprd06.prod.outlook.com (2603:10b6:5:336::10)
 by SA1PR10MB6519.namprd10.prod.outlook.com (2603:10b6:806:2b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 1 Dec
 2025 10:09:50 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::34) by DM6PR06CA0077.outlook.office365.com
 (2603:10b6:5:336::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:09:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:09:49 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:09:44 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:09:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 04:09:44 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1A9fXU239392;
	Mon, 1 Dec 2025 04:09:42 -0600
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>, <m-shah@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <denys@konsulko.com>
Subject: [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add TPS6594 regulator and core modules to initramfs image
Date: Mon, 1 Dec 2025 15:39:41 +0530
Message-ID: <20251201100941.95152-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SA1PR10MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f515253-121d-443d-41c2-08de30c1c30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a8xfDanxAEulcAOTImkrlpJefFcxmflR5VQJ241SoyXHbdXEVI6x6/vUd8pf?=
 =?us-ascii?Q?54jXFrjdcPONf65po9Sm3XS018HEWBkCvGYtBjcm5V9+afPJ4rfF6g0GhU0B?=
 =?us-ascii?Q?C1nzU7zj6KcuxWzhRAd8aeVB+4DVduWvcfOqRBlFRcktO85WpMyY5upnZliU?=
 =?us-ascii?Q?bxkglNblgrd1kPsVv69n/frgCgui8EjhbqPXCj66KO8X2jBnvwb0OVtsb6/s?=
 =?us-ascii?Q?bNdAbJA9e2eg2gs1bdBHQZeaXKk6ptfLE1az8j5AhzGgMJ0iA34WyBZIPgNu?=
 =?us-ascii?Q?lwJOiei5m9ybAeYFV7OG/T5vUxHbQFH+erXMrrtYTPmpm0g/vbQ0y+q143Dq?=
 =?us-ascii?Q?VE6V7Ko4LKXZh9Q2U4mNRyGByee/UZLrRZ+7LsYjgl/5K9uH2HqEC4sLhHWj?=
 =?us-ascii?Q?ZA7qN/c5ZIxPgRvsE2ZCmPA/rtgCVDnWmP8WYBzMjat345W8Orb7VJtwEooz?=
 =?us-ascii?Q?9pnPGug01tQ3O1xx2/+fIi0H0jUxEmbHvqPaVGQfJg3Yg7hKCyfhEOLVS0Ut?=
 =?us-ascii?Q?umzi3j22+OQDw1VhVtVP7JSS4cMChX9pkijOaa6OmaacqK0/Ku+wMb75oXUD?=
 =?us-ascii?Q?btPakSGAfZpEATEaTnE0MsoLN47sm5Cogh0VSf3SctvxX+y5173PSWFNGEXR?=
 =?us-ascii?Q?w1hhEr/Fm3WPqJWA859M2XrUWYeCe1BuZxoibZ+CbeVcwvBtg3Xo1CPwhXLh?=
 =?us-ascii?Q?LeFKzHVOQlXPd7tOgDkj2VnZUBfNf41OwN7VCfHVjPNsOZVM/9PqURNED3yJ?=
 =?us-ascii?Q?ZZCma91q1jIZlWc4Nu2JXsFMyCR5TgNYUOxHI2AFK/9vqbQ67JVkjuUmD91z?=
 =?us-ascii?Q?wHBYXGwpudqmJcmjEwwGqITnPa945BCDMTHlVw0PSmnpZhVdotv1XKRLcfVQ?=
 =?us-ascii?Q?YoY6q0F4l9Ewe/TD3gY3qheUyNwkNgS0+Yv+D/xC2TQS9qSt1+ORQ9L66AOZ?=
 =?us-ascii?Q?duN+KGK4U5d45CH6x+PKZRYS+p70x4tW6aIEkxfY4kNRa6YO7XwALXOtoyrC?=
 =?us-ascii?Q?t2hveVdjaJ6NTlBR41p5pMhLuYDB2ZiRDF7ZOo3mv/oV2swYJY4pC3HWCMzy?=
 =?us-ascii?Q?4I6q9MgB02SWAjFh4SlqXJXBEIqg5AoqboWuQGTox9YCkXKu2IMwJ1L6044s?=
 =?us-ascii?Q?vlA1KtZ4NTcE0g/fr7iYq/FNkCxQ/2MF8WZK54BqLDAj3p7o2KFO3jXSXhM6?=
 =?us-ascii?Q?8Sm30n3llmWzDxjmDOl5vdgNLJGEl/CICCFEJnfQ0n8MEO4Fmb8HKmldFloz?=
 =?us-ascii?Q?GNIvwUY/zGqxVy1vbTXienemUieikRvrhzW8+CtxanLouTRaFFG5qylVmPJ1?=
 =?us-ascii?Q?M2M9+AYXKvwN2zACal17Zv3X51o07P4YGgoAa+pEDyADhRBtosaWVoCkP+W+?=
 =?us-ascii?Q?HnN6plBWAffR0wEaktit2JVALtv1+m/hd/KiB7Czr+2xJxmHAMKEbvnFG1kS?=
 =?us-ascii?Q?FZfiBoRTiJIl3c0cnyrazROWsmn+QmVwnhKfbpttnuvv3w/HvTTH6IwmOEmd?=
 =?us-ascii?Q?BlDWj9GiV+M9f6lHhXqdi06gmSk5ZMHIO9Aw?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:09:49.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f515253-121d-443d-41c2-08de30c1c30d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6519
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Dec 2025 10:09:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19308

Add TPS6594 core and regulator driver modules in the initramfs image so
that the SD card can be probed for am62axx as it is dependent on regulator
to get the SD card probing and eventually boot from it.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Bootlogs with this patch applied: http://serenity.dal.design.ti.com:7777/ec=
agupigod.yaml
Bootlogs without this patch applied: http://serenity.dal.design.ti.com:7777=
/kiweziviha.yaml

 meta-ti-bsp/conf/machine/include/am62axx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index b66a2227..08111f82 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,5 +12,5 @@ OPTEEMACHINE =3D "k3-am62x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
--=20
2.34.1


