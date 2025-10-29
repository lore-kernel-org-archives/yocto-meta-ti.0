Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A369CCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 19:25:20 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.4])
 by mx.groups.io with SMTP id smtpd.web01.12774.1761765915429138809
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 12:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=byOEQhzJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.4, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBDoOtw27mqzbcougwadA1mfzk+h0Uw0op5Ti5OJR0mTFGVB5V0uYRxE/10IglOXxk5h8QQnscnquNJLW6X21Kg557UAPM7mz6FE+hV3uJdi8dcKp8jP9eNcpkEIpMXmE/LBjqvg/YDH7REVZR2ahAoR2p2suT9bop4n6aluvXJz50MG2IAIkQdIGqQr+XzfqbaIaGmm3X/VFcwOlghwrFx1Lh+Jl0QumdPOzYuKY73nigbxFsu4WFrHXL+rRscUwCQXbPeaxj7YlBk+ohPmKxRC0O8nuBptldsgw9AAqO1v18cVpwQdjvX+DVUHY+zeKK21GGPMmhV8qpsmYVfXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmACWMRFlvFx1xwIjTjpR4ElXpUV54MS2duwvQ//f1w=;
 b=vs/VJ2o4O/PtomJqheDJCGwUxoox19Za7ixJAgq0s7Zx5ADLGk0eaFDXiA5G7xsQzSCcdW5mWGMCPmRSjFIZg1NfpbHexankT7SS2g8w7Jp2yf7zgBVbL/iM9xRyw9bU5UWdrFz92VmhkFzndgun8F7fkUB3yu05V/KyTp/R01/hBE+HCEPfI0W2zOgQRZ0TOwlVp16KAddbvY9ByDbSI5q5naGNlKkOAQCwKnfSDZhWazS0DHsCr5Z3CqoOMiCC5QqpXGg8xI+DwZb4JITlhYLaqgdCPlTElDrAEZJodT837+uyj8SnLiuwEon0mAJHmklwW8vGAIzlLoQ8ErFBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmACWMRFlvFx1xwIjTjpR4ElXpUV54MS2duwvQ//f1w=;
 b=byOEQhzJYGQG78S3nZPOwALGB5sHj21i2y7hsGryE9f/hdHLfhasfgIlTpIE7knDGj30Kwyn5knAvpvpYP9x+0Nqn0wgeGfXdCWqrKeap77PKM3mYZ0IT1nRCuAKM+8bLRvxRSODfbhWN+tB3lPnNSkRwXymYeq79v7z5cONmt4=
Received: from SJ0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:a03:33e::6)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Wed, 29 Oct 2025 19:25:13 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::b6) by SJ0PR03CA0031.outlook.office365.com
 (2603:10b6:a03:33e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 19:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 19:25:12 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 14:25:07 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 14:25:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 14:25:06 -0500
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TJP6dq394669;
	Wed, 29 Oct 2025 14:25:06 -0500
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vEBn8-0002tn-JG; Wed, 29 Oct 2025 14:25:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
Date: Wed, 29 Oct 2025 14:25:06 -0500
Message-ID: <20251029192506.11103-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 037d8c75-9a91-4a42-91a2-08de1720e19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vvLlms7iMvl1zLCG6FDFUim8uhb1PBdbLyG7sUf4pSQn5yBfda/1V07qn06I?=
 =?us-ascii?Q?xZbUUvw8g63r4adyQV8ZDQ8pajfnuBY6OPVu0kH2Q73WusCFFtChDaHWd0R4?=
 =?us-ascii?Q?ZtiQlDHI+sgWxcFK13Y+BpVpn/HW28tTWr/sXBlc8IQsFIMF/BYQhU337tBk?=
 =?us-ascii?Q?aEkiTTBdauZ8FirFG3nhTtyTLd9LikfRGazEtHERe0xhIFMh0f9qZNiWkjHA?=
 =?us-ascii?Q?b06f+u6qHDqw5ebLkBy3RN7uScYl2eNhQf+nBfAw0qRAfD1E4Go+KcmLXcoq?=
 =?us-ascii?Q?Xv5r/0arDXf19/AxQ/vIaOMcZFbvsYYwaIaNqHnHhfTOFK14zxalgA1zdqy3?=
 =?us-ascii?Q?j+oyGpgbW1DITsvAtLv7OlHb+uevTFpVWrhhLaOQBKtnxl/2Axe5LDvYVVwi?=
 =?us-ascii?Q?tjXMk363pvACZ8t2Za7ZGKFkbVGxA6aAObT+6v1s7Q3I4lOvdhZZSJ6cN5P/?=
 =?us-ascii?Q?WZSHrVa9RXDvZrD+B3ogBbqnLc5zc/EiE1gKtdJeebvyYfcBUH8rnWA8KFCT?=
 =?us-ascii?Q?2YaaG3BAFBaCvVedpjrPLoYT6I7PM+QECWV/wpMNe45YgMRCyalG6ZMSmljW?=
 =?us-ascii?Q?UYmLmtjP9+iJoKydoKc7dRrLhGz8UTa4At8DLY3pMNsYbd704VYxdfpFeysM?=
 =?us-ascii?Q?hc/4+omd4Q7WhhvZv7SlSU9eUj9DoxOwDzHIpzq5QWFVOOqW7Q0K0wytZ188?=
 =?us-ascii?Q?CNgQmKBxNkXsS6np3yGNGJU0EtwkCSFsd8roSjk3HGsReyILwrts6tSpYS3C?=
 =?us-ascii?Q?rP0NSB69g+vh9PBtJuX/Wrb7+sZzlla5c/S7gF2VH4d5zL+cUt+f3/dDkxPs?=
 =?us-ascii?Q?nb2NgVjW2bFLDC7rbW5JidS9/Bu0Y1S2jdf+K1t+hcIWyNfWDhraVYxUrh9/?=
 =?us-ascii?Q?UtfyXHIVUo7sZ+XCuTTcTYTyAtThg4h9M+GcW5vCFAvJ2VxhBdHR3C+fnwpg?=
 =?us-ascii?Q?48DPcZb24I5WGIZRVaXOBes3jYohI2K3FesRuyLerLeyxctNNzSYPksmcknI?=
 =?us-ascii?Q?z/iRrwl0xvac9mDCf45G0MVj9U64VNySwvd0EoDr66IanjpsQf/p+M/g/aK+?=
 =?us-ascii?Q?gTIh7xDsTx6Ib9RmNTzt+oG4vqHX7/UWP4GSTP7tb37sOswOM+cFge39d2pJ?=
 =?us-ascii?Q?HIbxChcPplS3jdUIT5ZeYRbIVaqp9z2X3C1p8z2EHAxAoXxz3JaC8O0s0Big?=
 =?us-ascii?Q?QYIpjk6PdTDYvdSx9Cf27JJbqgV33rKtVuuKjhCfUqvVmvswJph95h0BtXab?=
 =?us-ascii?Q?Zx5iMb1To5FDwipkJWIAzzhupfDdq2FUqJ4CeTl0O5/q/0nDx5He92G2mvHC?=
 =?us-ascii?Q?i9qhpGl3QX8hJKr+hvIKF3XrdwBWnBLPZdvdfgESDUXDeFXxwvBCM5c3gqx1?=
 =?us-ascii?Q?jEP5OSClKzAvlC5zpfyHPZlNCIn25GePlDYisLapOFMNcocmSw+8cQ3MBt9b?=
 =?us-ascii?Q?/ZIxtUmIudvSrlzNOvJwBeGZrlppKW9JuJBQ7GwCPRs/lk4mg+PwQe7qQ/41?=
 =?us-ascii?Q?USbvBjqeJLJLdp5xlfAdk/LeUJvFfI9rU8jp4neElkBsvKAjC1PsnM3coOEX?=
 =?us-ascii?Q?64Ps9k1FmzuHa3Vhp30=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:25:12.4222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 037d8c75-9a91-4a42-91a2-08de1720e19f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 19:25:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19205

We are seeing errors when building against linux-next where we run into
the INITRAMFS_MAXSIZE check.  Lower the overhead factor a little to give
us a little more room.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index 236aa756..1a102d82 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -23,6 +23,8 @@ PACKAGE_INSTALL = "packagegroup-ti-core-initramfs"
 
 export IMAGE_BASENAME = "${IMAGE_NAME}"
 
+IMAGE_OVERHEAD_FACTOR = "1.1"
+
 # To further reduce the size of the rootfs, remove the /boot directory from
 # the final image this is usually done by adding RDEPENDS_kernel-base = ""
 # in the configuration file. In our case we can't use this method. Instead we
-- 
2.17.1


