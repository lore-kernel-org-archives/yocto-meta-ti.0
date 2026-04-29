Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C78CCD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:13 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14111.1777476185576566442
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Lj5eicSs;
 spf=pass (domain: ti.com, ip: 40.93.195.64, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbWPHLDh8778c6H8UvDdL4MILcrqMOtCQQXEj/zMD+Upwuz3S6nuK7/NcsDjurBHAX2ybxCU2svSkWz/SGNtzVifLNh6wSWBvlcdKmxAEFx7dPZuQKgTWh5s+hhKUStm6Rbk4pOlWR9tCj2NyMtoq5Jnihie5hlTsnh9LC/gcQA4sSRBCZVck7B2i7VZ4qbh5f568w7Jff9kMy6kM41DO0FyJXjclymxwzfFIr6rIWxcrHji1mgmCtiR7LQ6VbnlOBj8oQXXeIYnB1Wy4fajtao86f7+EFCuHjqyLgWPVy3S/U7VcxDaW4QAQB+GOUaRZ3Ok4FyRET+1MnwCSMcU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaJC9m3VDsr7+SxcfhCOcRkH7ENWVLZqHcLIDqEsWlU=;
 b=T+g9KzQhGrb6ERiHS/xr3n6P2mkjHpuj8d3MeK284TiiI1Upj/GjLJqsNZJPN6SGV9MTtUOVUAgm+yPr3NtnaDguGBDk122e60IFoZHCw4AZRMg1D/qVpG6qZ8J0CrPQL8UfXUwqKiqOM2fJNQDxqT6ZefC6WcX6M1ZyUn/CovO+hsFrnpLcp+jKtBjsvSmVIrEyghu6s0P+FdOJVenUMCANdZLZmHVlj7q4xMauuUfF62zgvWNzLTlz6Vz/Dj/KHFJmcgoO0fo2A9yE+5phq3iyCsd+OmcHuu0vjU1DYHyvMtrGY6OqOD/3FwkRb2OX/yIEDlcfw/u4NNzH0EJ5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaJC9m3VDsr7+SxcfhCOcRkH7ENWVLZqHcLIDqEsWlU=;
 b=Lj5eicSsHkH6VbRpud6oNFhGARUW1Iq8jzpuVA34Qs/LP31vma6jT8Cv4r+BnymUdm+xZs1VS9ilwmtLE7JEn3MreJ95je/I4qMkCpzffHYWLOFoNfRnQXDscEFcrPHk5JQ557KbnEJ4bQg7qlWt2mJDHzhq/3cROJdKMQhGU5E=
Received: from SJ0PR13CA0211.namprd13.prod.outlook.com (2603:10b6:a03:2c1::6)
 by IA1PR10MB6832.namprd10.prod.outlook.com (2603:10b6:208:424::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:23:03 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::26) by SJ0PR13CA0211.outlook.office365.com
 (2603:10b6:a03:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Wed,
 29 Apr 2026 15:23:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:02 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0AG3353835;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046sj-387c;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 12/12] check_yocto_rules: Add rules for meta-ti-test
Date: Wed, 29 Apr 2026 10:23:00 -0500
Message-ID: <20260429152300.979685-12-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA1PR10MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: e67f73a1-f6ff-4661-ee6e-08dea6033473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	DsVeWNxQH2aPfWGjbonJTIJzqNu3ovPWHq3CZesow5XDK0DeW8XzYB4GTA0PBMetT0VfAs37qRCcJM6j/uXpvQzL1UgSCM/iRyEqDUykIZwVOrgNtha9gfEWono0Z3dtrP6uJKscub2tJXHRq5hlGEeCk+rsykuOpI05UNZfhUBy+O7OAycUwFAxH1ZmNsgNJbZlf6dcBOZFfPR/RTfFnfWFpFRfNftDrrK74qgpgUMzsj+nxXAOLGDJlZs2oVpvmXClvQ4akoKVj+7FUNJtTn0W3udr0wu+awzUl48p+rxMczj/XPlJkoTdUBHhQojV1JYaF2J5vgE4zHa2pKk//4WsV7EzDWMZGpMJix+FT6hYokP4taiinnJuoe8i5Yu9hljbGS7+YU1X7GtQiZa8/Je68Iu8cDd0YycVkgQDEv73Qg5xHVF/HM6Htp1xgVUjcd1pdx7Cy6q+ehDgCSRFPvcCfkjDEgf/zwNswuemEGtAcxQqEL0UuPEmlpbU28EmHun0dhxWmojJGK2qqAH9p8lJNtPL1za9VQlGSbzXY+djGlc1dvlVfIidL+WV3qGJf9LU276GCbgLwanYz/8Mlk4i9gAcailZRkD3Gftl9Egur8J+rPTMSQm0bc5VSHgNbXDUw7yVaQz4sRGMTmDPep9ThoCinzoVpz1CuXncH/B6oFe1pnhuGuVZsB5YZZpTDoy48bohennrw9n06g/NxtaaM3p1lwMMDEOk/8r212k9kO2a6PBb7zd+qAxqYewD8rrh/UcSvIY29nj0a8MKwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JG2P9a3OvYRf0QwJA66i6RAUO0PocTEajsi9cL93BTeHls7oe17aIT7n3fUpM2tEuHAiHbYOYWwZKn/fKLbyNFC9ZEYcJb9m9ESijazyMC1NVwvIxzewQCGqernn8v2WFUiN/vCnMN6T1+Tgf5tQeaZCH9u2EEhHGQw8nxPu94pS44vLuNMtFjCuMLFqUIXtQgsMe1ImX1oS7zhblEQSzpP5xWxEI5BThTrietsOLMdWup1Z956slB//9dWC6c7m/yS8fMLQFms2HbDztZB1CIBjg56Rv1CQQ5bGxw7JkeBSYgWdjRHFr/MTFc1VpfojViZV5a088RUWIv3PES+7crmhKvdU7/4JtuYxYte5tkGv0j9O7VRSp40qBuv01CFrF5RkM0QHFrojiCKAae8ix0qTF/qzi4yNeqXOuXJkxHj0DEt8DV61D6Vbragysk1J
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:02.7086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e67f73a1-f6ff-4661-ee6e-08dea6033473
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6832
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19893

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all check_yocto_rules from meta-arago-test.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

 check_yocto_rules.json | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 2eda8066..9dbf6c50 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -21,7 +21,12 @@
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-b=
oot/u-boot-ti-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/init=
ramfs/packagegroup-ti-core-initramfs.bbappend",
             "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/pac=
kagegroup-ti-core-initramfs.bbappend",
-            "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-=
core-initramfs.bbappend"
+            "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-=
core-initramfs.bbappend",
+            "meta-ti-test/dynamic-layers/qt6-layer/recipes-core/packagegro=
ups/ti-test.bbappend",
+            "meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/fl=
utter/flutter-wayland-client_%.bbappend",
+            "meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/fl=
utter/flutter-samples-material-3-demo_%.bbappend",
+            "meta-ti-test/recipes-benchmark/stream/stream_%.bbappend",
+            "meta-ti-test/recipes-extended/bc/bc_%.bbappend"
         ]
     },
     "GUARD-2" : {
--=20
2.43.0


