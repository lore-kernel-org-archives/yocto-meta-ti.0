Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CC0CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 16:29:24 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3146.1762532954811518288
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 08:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HK+abZsw;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCXhm9AZdXnSxmwzu0RDAB86fIQUpODRPsOOZLQmGklFZBRbo0DvrccRgUTBKw57/QWI3Pi1b0Eev4kvpzrTY84GMrvdkqPV+5cJj1m7W884v9uUAyb559dk6OyG5lTSXJGSLfmW+c1pHca/6t5/e77UeWYWhjq45e7liykD7qXjCZafOEbyJRfwSTyMKhatAH3i833qDNe+YWxZosVKeCUNyDzJ7WgQVoSXVDxGGdAKgZZnh/Bc3l/DhyAG6I2KdvPpH0SVW7bQQzg3P/BcLZPQW22C3GWwhVxq6Xt+Ads7wU/LsTphDTd5rtaLo1OtYRPGP91bJiHUtcPAJ6naPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC1P8JyvZH0aqFMYoKScvWUJ/6/av75H2xOF+XzG50M=;
 b=uQuS0BbJDoOsjdhhb7KhcUddNGZccrvIFUqeylS+5Ga3WhdUkA/irZiJYVmmhCW9DEk2BIjhuERt/PQtjRaMRhrSYpMnKYP81tKherXDiwWfTzbZ6KQnsFBj8AOL14Ib7vb0LAuH9SjJ0AMTv/jg8kKHwUgBirOKmEAYFWg6ekAt/wWY7D8lIaf62ZaRZXZnda6a97oMby3oXtYppVxuIDPgLK01wnRNjDNTxK+dIcOgWtUgexaVix0yb3XW4+VEVhU84LxevZkpcThos30pH/mCUk+pqgOqKJPF2yUsmSaoKmASdVGJbsbpjtJI9vA0W5qHj4V1wgw4YN/jUND+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC1P8JyvZH0aqFMYoKScvWUJ/6/av75H2xOF+XzG50M=;
 b=HK+abZswGFNOBZz8VizL9JdSEfQP00iEYd22t/ceSsVyN3+nbI3zaLZe/ad6jexufsSk5L5X2Xj5s87YVU0P+XwSHzVxlzbtz/GYDd6MrgHVTUkRZih3BZSMM8+IkaNoXDm8DdL33ry6jkK5vdmsh6zWcybtai9OqMje8g6jPSs=
Received: from SJ0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:33b::24)
 by MN2PR10MB4255.namprd10.prod.outlook.com (2603:10b6:208:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 16:29:11 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::2c) by SJ0PR05CA0019.outlook.office365.com
 (2603:10b6:a03:33b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.8 via Frontend Transport; Fri, 7
 Nov 2025 16:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 16:29:10 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 10:29:07 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 10:29:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 10:29:07 -0600
Received: from sneezy (sneezy.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7GT7vw3321758;
	Fri, 7 Nov 2025 10:29:07 -0600
Received: from reatmon by sneezy with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vHPKl-0000L5-DU; Fri, 07 Nov 2025 10:29:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add new exception for packagegroup-ti-core-initramfs.bbappend
Date: Fri, 7 Nov 2025 10:29:07 -0600
Message-ID: <20251107162907.31733-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|MN2PR10MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce600c2-391b-4f66-7d31-08de1e1ac7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vLjUPxYzuhY3yrs5iJH4stteVDzP5nUp0l3s4tswRev4Lm+re31qGvcfTUHz?=
 =?us-ascii?Q?7cS/pdkcKOqXtGBu1IzM9Ud618KetItOHnQO6+lpQBi6nFKbIr/jdTnRvhng?=
 =?us-ascii?Q?650Ja8ot6rvDQO6q/oQaSodfURvcg/Nl3dcitKwfls1m4A1Mw6JAkMotY90F?=
 =?us-ascii?Q?KR4g5+wc9zkaquBvcnNbGNcWCK9m2XemZS4dSz9DbsqLe3YA0DXVT1Rwmmgo?=
 =?us-ascii?Q?OQMd63aULe201EV/MajPyX8m+Dpi/6EMZeZAKYVDFqqc+pQNecGHx0JdKTg6?=
 =?us-ascii?Q?Nf7GkmrmLmHVf/vzJ55vvf1SqJ+NwUk0DJ/bU0PhcdOClerrXykKfalY7S98?=
 =?us-ascii?Q?FSgCMT9XWNxks3evmugfJ4z1xCwx1Dj84Tl0CTbO3ANqquJLr4cmYLN8pLlL?=
 =?us-ascii?Q?GAQD9s+NoEXeq4CrQD/fk8PNNk6bkqAi3obL7TOKg7waV/S1K9+GyAfa8RUU?=
 =?us-ascii?Q?+Qn8w57pakxjELagHbtehBhz1kG7j73eNKwRbyAty26+o6wHPvpOnFj7Udzj?=
 =?us-ascii?Q?uJrKhcbaRakpmdiMRCRxrAEM0biXCm1lheS99QqZO9A8ak29OkWfAWFfQRIC?=
 =?us-ascii?Q?QL/IMquxIXR/vFvvLo0JBITLlpQSNM23dT5MDwLaBbES7dEYGkD4fdhnwV0u?=
 =?us-ascii?Q?eYhTV8I98jjhgiR3M5GA0e0HR6e+V6v0IHKCGBRFuE5JJMgN2OO8TIVP+DSM?=
 =?us-ascii?Q?i7EL327qCoGzIY1Vu3W+0Xp3uNVkL8ma4If9uL/sFdXNNGNm+oxcG/I0o/K4?=
 =?us-ascii?Q?eiG0oAGFbJkcbJAWjC2mR3SvhOKGb8Fq4yU2COwBQfuu0FZSC0XUiD6eh6r7?=
 =?us-ascii?Q?iNeAiF6NajT7nz3cpwPn6yQt1A52hwjkuYIsTt6WEdDTqJkQNBivhFzLCQ6N?=
 =?us-ascii?Q?I6RigBhBLanIDkJm4QpDI/OV94BCeQ3aA+M5Wtfui5G6PITIYJSCbAYSu2MV?=
 =?us-ascii?Q?z9dv9jLdfj1eCgTZdubCVp9PPdSvVw0q3o43vVM5ZrmlkLQ9pxNHfKUlyg6e?=
 =?us-ascii?Q?4J5+TzkwqCO+Pd/uhel9mIFEwe2dsz6VrGPnGb4G2vTjB+kqCn5tYaI1gVIU?=
 =?us-ascii?Q?7T4sCbyD1w0x4x4XSZn5d/yr2lVB6ldodD4DLncq2dxIu5iUmWo1LYwoLcaw?=
 =?us-ascii?Q?4ecE71GZKDBGf6tNcZbgP4IY8mVmGXhKdobYuE9zmB+YiQpV5PyodAAp7KCO?=
 =?us-ascii?Q?PTBQcj8AS7srp8jds/xkFYmwczjAxtSA8QDSG3ireOXIVLXg1fNXmaO+PqVn?=
 =?us-ascii?Q?dpv13f4Du80W5zCFBQoU2fPHeCjEQxU40N+mrZgOfFE58TuoaC/ezcw3sTxt?=
 =?us-ascii?Q?3LL3gdr5HEAn1GxUeJQcO2OC6qsV4e0U++DrdorHcapFMCPo/IL0zz7u+fkr?=
 =?us-ascii?Q?UQKiiNzpOdkz66xRxmKCyWGJs3QlCeV3LfMCRs/tsbZjmjViIIdFmInPIWTU?=
 =?us-ascii?Q?PF1wGEOHIy2POr4PUzLigZky7/SGlYF3J7dMJZVU+g7u7BjkIFpOLhUTGDM3?=
 =?us-ascii?Q?olJaTRH+73maJheB9P83uVl0M/z6gLbAFBsXNRgmgr5AiYI01eFrOtk76uPr?=
 =?us-ascii?Q?rdNjJW1qgBQlsbgvirY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:29:10.2949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce600c2-391b-4f66-7d31-08de1e1ac7d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4255
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 16:29:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19239

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 56e8c771..fc516a51 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -18,7 +18,8 @@
             "meta-ti-bsp/recipes-core/udev/eudev_%.bbappend",
             "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bbappend",
             "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
-            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend"
+            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend",
+            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend"
         ]
     },
     "GUARD-2" : {
-- 
2.17.1


