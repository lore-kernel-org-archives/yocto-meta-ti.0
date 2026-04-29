Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3BECD13D9
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:30 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13569.1777475364471243603
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EgnSmwhZ;
 spf=pass (domain: ti.com, ip: 40.107.208.45, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALijppA9gUwXhRia0iOJPA31LUajPnPxrVGwypmeO6EincUkYEFfR/7RnNadL5QuXreNSRHuhI6V9tEKOS2gxb+LPqyG34khXLGJoDsEqU9ShnRHG2qE0L9xfl/qc6lJXraYCes5hTiHRj9iwQEuJr1Ab2zjtmeR0DNqYySaGmND5Wvmc3jpAOJgxLfSceCfAS3db/4m+eftj8RliTl3ONjYuh2EKX1+EPzMuts3t/bjJrkgn9mAoYhZva0t6NGDp2RddLJM+/aQYVTanybRBpM5U4PjTwjOSxoGTB1BWjYOIPkbsf2mK6omsm29SMLxOW2dmcMdOmGRiS02jHKXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJtMdVhx7Li7BoP/r6nvVc9ybf7qXue4orYboW5Y69c=;
 b=Hzd9wXG5obz9YIqQUswZov1aIzdGkgcdD9+DvJ2VfOOiJeR4pdNbVvzlbyER/+ACg1GJAjaOIWRFdKYfKpNsuKbTgerr9JpbxTxgxZr+PjkJZ+EdYCiBy6KWtUgkfifdtaYodI+Ym1r75Ulf1p3At/shwrQ9gVah1Hu4r+aokNHrQwPHPjX4AscH7S5aqLOjb5rXe5FEsH/8FXiCJTylOSQh8Xfz3qjcnyNSaMPyeS/BETzAqgYgaqmxWU/Ed0bHFLSAktL8dHvPNAmRoZ8xRDmyDNaQi1xDb1QKh2DrE47pWUmWsMaUnkhSkIfE4PtT3+RXhWWvEPBjBXfAICO6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJtMdVhx7Li7BoP/r6nvVc9ybf7qXue4orYboW5Y69c=;
 b=EgnSmwhZdYHXlJdeS1U+HoJ/TJT8Dq0MY3DMna98z3KiTGXJGOF4n21DW6Oy4AejxCpCR/MXk7c3mOa0GnraZsq83mqrE86jlqsRRKVQJhYWzyhHfzmM0fgWUkPB/POCNRF4We4hwi9mS+NCfu9cwR9cDQCRH29agBNtUN553as=
Received: from CH2PR19CA0028.namprd19.prod.outlook.com (2603:10b6:610:4d::38)
 by BN0PR10MB5174.namprd10.prod.outlook.com (2603:10b6:408:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 15:09:22 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:610:4d:cafe::83) by CH2PR19CA0028.outlook.office365.com
 (2603:10b6:610:4d::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:22 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9KE73565173;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046Vm-25Kz;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 12/12] check_yocto_rules: Add rules for meta-ti-test
Date: Wed, 29 Apr 2026 10:09:20 -0500
Message-ID: <20260429150920.978263-12-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|BN0PR10MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5c448d-5cc3-463d-d209-08dea6014b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	SMGEqGn10vQN+tHlKDDNxIwIdAKRTqElMO3jBWJTNTVn/f14IzhPWjRwou0jUTBO1s/yqXU1duK4Q6tq7iAbUrwKZDn4BkD4PEg1ZOCTlhViWh3TehLU64l0L9MjL4oEjmzebRdj8oEM9NbqYtQqhF2yQodzv9I0toE0tsFP69b5wW/CEfa16/Q0ZKcLQMrbl4Y2n+6qW9Q0BOcPh0LaBZggzFubbP0LLIXZQRrgyhFcF2jHaksFRXIR7CpLGRBGGATdQ9HjeVGS2SF0HLWQpnrJY2L/vug3leiNjtRjzzrOMfOPwws9r/Uaj09wz9JnO0A5gF3e5z7F44Kr44L3VZB0F6lMOsxxWBUzD/gwplwlMioaxsRQdzMItwdI1NY/NSSGBfKYio9sjdGVpgjCIRJRHuiG7foxGU6+2nbdj8ZPlJrn46XdFLINLH7AMv04h34CVQgaZxCZobnI8ZkjvlloNFq5QNY3sHACJQ9o2TjXjmvhR9YKqNTHpQCaQ0xn977qXtXd3axCfPHwflujorI1LsiJuK8Z1up1/vbRXTzdTQrfxMd/5gUVrSSDG1O7aR16NMQxKvgPhoHyCGUjdaXb8d+PTHKiHPA6cQIWXhNWpxT0FSxcKM6w90MfNtvDIvtxyaNIXToTuDRVDsnuI3QDIZ7AZqYKGkE48OWirFrRI91Obyd7yR3CHUND1LaZoiU2vMrq0id025nOFadSFmGS5B6h8WgM7Diy+983xc1xmYGkn1xrGfFCPW1tGNjivuPxD/mS61WCrgjap5j5Kw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eH+spMdQWGDvEs4Z3Bkd89FtkLf0Y2t+arYgvc/I5J42RqIfqPz+GHvV2iVpDQgWeAhK+6J/PccLuERA6HvQcufGMn3SCpPDUAghHQDvjOxiZgKTwEPbAfYzraWJEUjKresygJ2HJI/an1iZ5U0/a92Xuj+OyIqNO61m8EfaXbR6DRApyQItEn9F7rEctnUsw+akotfUwZolrUSNuY3TGr28V+8VaLnj18NfyOWWlyZCAm7VlcBxy5IIz1sum5xU0P4dZW2Tp9YuGbDhaa4dg6BF5/yiAwk/D5LdUJ30cQzCzry6HAIifhKYdoKT4iklxI13iid7cVxy/vRK4Q59s+7g1VRKBYyfR5DG8OYbqPrTj48BGNiRDjoAxQPLVCDi/dKnkRfXi6RgGxRIdKI+WEsTXS4kYKXezwmzpjvyzMeDShSOltOQWKCy96Tk+p6t
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:22.3354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5c448d-5cc3-463d-d209-08dea6014b75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5174
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19879

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all check_yocto_rules from meta-arago-test.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


