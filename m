Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7274CCCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:45:07 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.803.1777481097322421192
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=aHKOK3G4;
 spf=pass (domain: ti.com, ip: 40.107.209.57, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0Lj1cKvl1jyirTqo0QRaFEeGGbQpjRMD5Sg2ehxlE8PN2VgEdzH3ViekbVg5lySGpTGdFBuyXeXujzYN22TLA0Z605jMUlnaFMOfKqHQ6YjO5KFUV7bLpBeIn8BOEeEt0mqmiIRjLiIDb/UPsc1uNPCDMKc/AAUhhMHhpL4NcgxlpbyAjpRR+hWWbgCgz/jDlw1tysZwuqd6YPfQV1UjmNo2BycbhUUuLKF7xNMHfX3Q/zt6FEqLcb7r04HxXTiJzq30cy+r94qi5pBnMHdhSQYSEFcX62acwjFO31bw826zbuR+V4on3AqxJg5OlJL8mcIPheaV+USP8Y2OdAytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a92nZnaBSN5w077E4tP7IVjNGgi8OmY6qOE0Q88q8c0=;
 b=oLUXdVQs+ykmWH/rpMgs5m7nzQaIFZd5a0ImLt7cbc0qVo0HvrhlDmORlRpsBK+sA2xUUqddKTke4KOe+/WZaxd21bezizxBUxU7SpEfdPWP1zDrpzaLsj2flpI4y5rSbv0JRc/qYDOplwwSNjfkjLyJhLXUDl/fBIYcILTpx6hHXUBfn22MD0sPJh+jMwtky1O7mTZkMPfLP+Qq+dXCy1WvhzGaWGx3jnajGBLcHnH6F8nSsAV1w3QcTAPqjNkSnj+w40B5dlJgnRTCgAvDAmG9OzfVnGvfJHnk4xLssIAfz6nNEXTwpWxtSiNivQO9HVFZWigF6XJ2ra2PdKe+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a92nZnaBSN5w077E4tP7IVjNGgi8OmY6qOE0Q88q8c0=;
 b=aHKOK3G48MrIUvXSwXxU0E5ClCJXldkExj06Be5CY3ZJ/gcpqYwE+vyuMBp9h11IeWd+IiSTifVTVHGe7nedQj+0Z9OnwdWO9DVuv7R6iUZGodpbg5oNjPf1WtNbpsxdNEfueWHG5w9ZnA+LUh8U255pQF7bBF2Cy0aCcJM/yO8=
Received: from BY5PR17CA0064.namprd17.prod.outlook.com (2603:10b6:a03:167::41)
 by DM4PR10MB7527.namprd10.prod.outlook.com (2603:10b6:8:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:44:45 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::44) by BY5PR17CA0064.outlook.office365.com
 (2603:10b6:a03:167::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:39 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:33 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiWGX3719628;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oON-3WIO;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 12/12] check_yocto_rules: Add rules for meta-ti-test
Date: Wed, 29 Apr 2026 11:44:32 -0500
Message-ID: <20260429164432.1623594-12-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|DM4PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7aeb24-d8c9-4c7b-f249-08dea60e9b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	UDK/snWoPKOnYW6zZ9vpXWcBbPlxPGYAmFCZ34hBLx2sn1Mpv+MoT7MNa5zdIPVuRZq0CXY8LnA7crkhH77bIIWaAp8YW7hupKktoTufgyCha3WN+zkUOaf3qIJxyv4inxr260Yb20g22sxG5ioEEDEy+RwfprQAsH9SjJPZ2uOiZebW9gmVE0E7vKvbrQRge205Ni/tmtko6zqmRnA7E6q6tIwjKNkHnjYMjSM/R0QwwmhXTNf58X3MuXodC6IKKAeWUvadumEcF4G1goqeaIXGw8ee9Y7G+0afRbpnWotP1J82dKdSU5+wgxZpLeSklNRbik6Sa4dOCj2nEYb+u4+oXu38EGU9+ShE/IYdmXEvSsBcLVF6swAE6ir9FtcgUFh0JwIPddwsIPXfIBrtKIaP/SB0L5oTS+iU/v9jQ3CHwMJdSxRGMoGi9RhmZErxWRTuvCNQTbRQa7hBJPe6OyhzzpSNioeBAkT6i3mN6g0hgD9S7MVD+HSUnjKZl0RSgQfXubaFDsYT+ddflymwg4aq9Y2NQoUfWNXiXUnzvMdCMJHYDj44nFz7vnaYWgprkVtUglDiuoLD9m9DMGAoUjSoXXHodIQoqnW1ZbkHjGjypS0U9XVBWhEqqQzQSKwFlN6Gs0YrWLR7n6TgH/4V+NYEQDSxt/h2xi4rTL5k3GC6XNgKsiJkv9oYkVCyl5QoRzNPWtWbto7EadIFIqGVZEKa3g4knJws+SBp6HqA8kPEbF0hbMZT0uGnPeixlyoLyXM8KYfQXS1FpZBEA30OoA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aBaZ5ydYiyHUejhTwrN4BBHnXs8rldnufkfJbqM409IqCAj2D5zlTRd/8ZzsYrpWQ23P+3zDJFIao3Nsg0NinssD8FMN5gR7YySgpQepBRzSNJ8ufHmCdg/BL9orRigJPs2bHKWHO7IE5CnOdUjMuYTVYVx2vzm6+jbhsxsrVMXRM7p3kpzG18dXYFlRNArdQkNzZ/QVxXLfsVPQ7ExjmJIILMPkBHgtBz2ScL3Rug8d7AeCwoL29UxvhHfj6/PM4HLV2qhjJ2jFXhrthdZCd1sYUmTkiba+aidVfpWs+i2C+t6rE5DIFJEkJP0H+KkPeYyzq9qUKJ4u+i+4plUKB0+QOiUNqU9fenukr39MzyNFpRlAMe8L2ho6VEeZooq38rFxSFMdcjl4OYa30khKYD1d1qdDvqfq3XBAL46NOAEtWrKz37FeK/YGGYq5L/if
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:39.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7aeb24-d8c9-4c7b-f249-08dea60e9b56
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7527
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19916

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all check_yocto_rules from meta-arago-test.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
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


