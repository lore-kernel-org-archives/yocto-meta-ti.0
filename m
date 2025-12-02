Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23AED12687
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:32:22 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1200.1764714740304599040
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 14:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=keJiUTfN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.59, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wd8NDPlQ65ePMA3wzLbQlz3lyumdBBEuWeHtMiuPNu2XwadBNKBQGzHusjjV1hR3IQO5gG0UhaMmwh9tm7A3DfgMAkM+Lz654U5Zk01Ujr6JYqlzOnvdnG/BGpZenLaCPPLKPeL/Yd74Mq9dvcNz0AT1bR4MvK/sSXJFsEBP16wfcNHT5hwfXbPcjuQIo4qjzpcSx0Vz3TE1i2WF5yQVPGOP8VV2qBSeYjZcmsgy2a0Vmhd9uDAb3KJVQKvrtbk88kmXPdRWWSxqE2rYwqrpOpCxCgvFkhVZJhvZPKqOSMLHA6N2hJO4qN4vXV2OYpVGs/zt144gEZfYdlLr9osMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE+6scTl5v9Zt5tY1igoA3etvtjjHDh5AsJiU4NK87Q=;
 b=q0Sg+R8AfkHkjfZofQW54qWg9N4CNIgw4YQmGooVQlDQhZ2G6JMPVYKNTasEimcqEzehWi0VlRhPCDeHhQlnRf2tst5EyJpGF1dLZpISYVxOVJCbKSxODGgV5Hry0+Ky0RftYjqyDzh1VjixeZC0cXmtOLMgP1R+HWCxVHohsSgjTt1RAK4ZRVgZmIi9j1Dw6dWZ1QIkgx6dJNAb1M7oOonm/iPIcYO02G93ihgJEoaPgoCPSdV6yc+JJK2AtDXnOunJiTT61MbZYas6vjXrRg7W4trmObC79GIMS53SyS5JnTUF8AnWB0Lr8F2D/wcdqBQOSiI5aMLam+6SBINdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE+6scTl5v9Zt5tY1igoA3etvtjjHDh5AsJiU4NK87Q=;
 b=keJiUTfNMsWpr4iApwqunjRcqx9xxktubFmtBihd1ALUJ0SqjAWooKhk3noaEfrGs1pEtIzwVTMTgUvInsb8C14WT1J3LxFYzHLX4ILl8kAeWgprbO+6I1in7s/hTHfJvmk1YPdqdtyW0dMUws62V/tyxXX2z6wKjA4lccGdZuc=
Received: from SJ0PR13CA0101.namprd13.prod.outlook.com (2603:10b6:a03:2c5::16)
 by SA1PR10MB7554.namprd10.prod.outlook.com (2603:10b6:806:379::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:32:17 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::7a) by SJ0PR13CA0101.outlook.office365.com
 (2603:10b6:a03:2c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 22:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:32:16 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:13 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:32:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 16:32:13 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2MWCvV2994337;
	Tue, 2 Dec 2025 16:32:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 3/4] k3r5: Use UBOOT_BINARY for R5 U-Boot Image
Date: Tue, 2 Dec 2025 16:32:09 -0600
Message-ID: <20251202223210.3816583-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251202223210.3816583-1-afd@ti.com>
References: <20251202223210.3816583-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA1PR10MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d8ec1f-ab90-44d0-abcc-08de31f2a5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hUlT9pmQZdwPmx7uztGhehpbafC5hG0hslePxUcg+IA7PqkWgpwoB2ITy89P?=
 =?us-ascii?Q?HLTDrLrpnM05eWoZmHhU5Oh7cNpkJO2Mf3TRBjxZ909Pi652xk67dm+tzSW/?=
 =?us-ascii?Q?C/5K1SQiKQcWlwAuBaHEm3oYXi600pLoOJ52xkT5JVv5XWcqvbtI3agek2oK?=
 =?us-ascii?Q?ZLSYcLGTrE1Mc5TUzkuwo9Gm9VMbLNCdgW31EHujOBipuoGwyy0fEYvo9Tm/?=
 =?us-ascii?Q?yrChnlFVSvWDuJXguPW4oPOubduGJTnuhHvzAPHeGJ3BenT8YVQljjGjgaxy?=
 =?us-ascii?Q?OK29ND7qH2rZAon0+9XQguIkOf7VtGLd6c4EzHbFZOsj6T1TqG4rPlVKcxYn?=
 =?us-ascii?Q?Bg9FW3eCFBaDnLMQwRXyeyun5Zdn1zd3QMHNdT96fgiWyDsmXU74rv5M4KFf?=
 =?us-ascii?Q?KmNea9Si1ekN/6Rc5CS3MmZAFSq45HAW+nF1ECXXMLyF/anrOz0Spvm0ZcWk?=
 =?us-ascii?Q?01wK9qMB9yC3zZVxf0DP/IA8v8Y/I9jLBkKG4iFv4pGDwSm4Li36QFD03szt?=
 =?us-ascii?Q?TnZdZSQEvKDxL6zaX8C6pYLFY8G/pFYLpe3BXHsVMlOt4EALFb+shMlOllAP?=
 =?us-ascii?Q?8Pucui94KgkAIqZfcabvLXIxsGQSz3idrciaiDAQwhBb8XqCOHI+FciMDyrc?=
 =?us-ascii?Q?AArEBy/s+iNxrSQoUTOfUimcmkvueJO84IgMTdHbLKITMx8aJn9CXbCJL3BK?=
 =?us-ascii?Q?lJlh6atlTTF8YCza7KWI1E7MZeN9NZSlWwjpWxtN33mUaA/cel0OyQu+wdiZ?=
 =?us-ascii?Q?DBbmBLa5egpshIo98bVuN7sER+qkZJmOalwFdB7AQT8ATpF+WZ7+jG51rBSb?=
 =?us-ascii?Q?pOioyjktV8mKwgp66Iao5Om/Ct0ymXqI59tG49mMftwU8DOfA7vf5wC6w2hX?=
 =?us-ascii?Q?xkP4xB65Nc2MPyDKFNVWvBfBF16AvvBYc+7Y33mvouoLb7XqB7TEzRWKaIXh?=
 =?us-ascii?Q?ScosyfRMtgDFh0I/qWgr0PLGQFCfdT4lB9AXxyc9p/2OZ34FHQPLkkx0b7LV?=
 =?us-ascii?Q?0i3NjrrjcW7HW4eq1HY/6ibQ5bU9c9LuNZ64ZqRU4GV4InKqe2zZK1sF+Bm7?=
 =?us-ascii?Q?V6w4VtheGlR4MeFToo0Op7uAkjNMEcKHqZhgyjnzKr0ql3tdvsDcovZfRXkO?=
 =?us-ascii?Q?yl8PnFAXq0rsJXJJawnNzW5gApkCu6tXYpAxIRs0jXSqRbU+sjyeMx4Q6HMC?=
 =?us-ascii?Q?MOHgxkiLKTnUI8g94qMwX/BKXYZw7LoWzNvbYOxQoohR5XusipczxKEYZoGN?=
 =?us-ascii?Q?UOw0jpz36mFeUYxxJJavifXA1FWOurGlk5J3VJv8RkUTsIODs9mjYoSTPPEK?=
 =?us-ascii?Q?Exp+6alL7Ha65kyYfXrUVH+l3EuypNbXMmORgWVNhJmQQDqo0I4jZdr9oAck?=
 =?us-ascii?Q?KcOQRLmjpbHC/gPOlTrvScRz+zhucH70qy80mNr+CCUJFujjJwseO2/B22Bl?=
 =?us-ascii?Q?Re3yk7WgHn8arO6qGnbkO0GDW/uKiQzMP1V92wysmoQ9mRWYDKufPxBRuqrX?=
 =?us-ascii?Q?lwKhFYg2Aet/W4Gg3FOsNslhx9p/AR9UCqKf/kZfYLt0dLQ0V/NgBlg1tkd9?=
 =?us-ascii?Q?chYIdUTX4+NlbATvoOY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:32:16.8812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d8ec1f-ab90-44d0-abcc-08de31f2a5f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7554
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 22:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19317

As R5 only builds one working image (tiboot3.bin), define this as the
"UBOOT_BINARY", even though it was technically build using the SPL build
pass in U-Boot. This allows some simplification and removes deploying of
a dummy file (u-boot-spl.bin) which is not a usable boot file. It was only
deployed as UBOOT_BINARY is not optional and so something needed to be set
here.

BeagleBone-AI64 already did something similar to this so the overrides
in that MACHINE conf can now be removed.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf | 6 ------
 meta-ti-bsp/conf/machine/include/k3r5.inc          | 8 ++------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beag=
le/conf/machine/beaglebone-ai64-k3r5.conf
index 1bdfd7a1..65616b67 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -9,10 +9,4 @@ SYSFW_SOC =3D "j721e"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
-SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
-
 UBOOT_MACHINE =3D "j721e_beagleboneai64_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/m=
achine/include/k3r5.inc
index fcd54254..0408c09c 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -15,13 +15,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.in=
c
 require conf/machine/include/ti-bsp.inc
 PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
=20
-SPL_SUFFIX =3D "bin"
-SPL_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL=
_SUFFIX}"
-SPL_SYMLINK =3D "tiboot3.${SPL_SUFFIX}"
 UBOOT_SUFFIX =3D "bin"
-UBOOT_BINARY =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK =3D "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${U=
BOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3.${UBOOT_SUFFIX}"
=20
 PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
 PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
--=20
2.39.2


