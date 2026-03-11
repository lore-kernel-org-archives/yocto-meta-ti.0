Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE70112583B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:01:26 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23778.1773241277303903806
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 08:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fKXHJyQs;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.8, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZCjZxX6aAdx/KTL6zlWmHaZANmIdM7GOlO4HAScpv7HcfzzB0s9OpD7Szyy6YZZqq5Tf7LdbLjNaIRB+e2pCk17MiU96pKJncxu2ExQh3nUg4v1A3ylIJ7U73ogpgt0CJLY6G8+n7aDpWCBfzmw/ydrnc7SVlBHnZZYzTNB7Oe7BLGn4r/K64tAvlYreqA58lqVzbsZW15475jkO5DSY6yjf5Z+W78U/93aQGRWGS0vPwr+cJZXQoK1Vz15VSw5aczRtrJiXEG85GQZj0fV9a3eBKZetyOyFKbRmCTZ45NwU+YHcKFfp1YzcLELsUqU3lr8ZJrGEEdh/5mSVXp2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XldSEPXE0zM2mLx2ujDyY9BeDaskxTm3K+2Zz8mceA0=;
 b=mEqRNA99Q723brBy7BTp/NgYIuN62j1yKRQQspzM/PHXSyoBaoZROv2mbfseb7amw+tneLi9/qINHhuAF6qwH3xvYmT7o/TLrEIWsfXQZtDmkf8mWzrThV+o7gzh7li1wG8g7NKWXeDIEkrj95D+OGcgXSSDF0GTFcDdZF97JTi5Rmil0GOIVhTACZHK5kJiIXfbEnpcemV+JwI/SUzgKYw2TBlD1jnGWsZE955d65mOGCW+W+0jQODfeErHHo6WISOdjsVqeD4PoV/mTcV2zwzn6YGSpjxqBZQZPo9zWyrkIqE3dG/DTTpK14Kdd7ur03YP1vx7HyR3x5jGVB0aKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XldSEPXE0zM2mLx2ujDyY9BeDaskxTm3K+2Zz8mceA0=;
 b=fKXHJyQsNg+lo0+pJKDT+gS4WPO5P9ibO6xMom7uWc4HC7ALz9JNH5Gcmq/3uoW0EfJw9klwgm+GEPvrc4QvKBQBOgW3Nt2418HO22LfAw3le/cMUG/Hf2Fvs8MJwFn4XNIgLEXZhx8GJFRMAXKXShHuMFZFC3MvSlH9cN24MA4=
Received: from SJ0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:a03:33e::28)
 by DS0PR10MB7296.namprd10.prod.outlook.com (2603:10b6:8:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:01:13 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::2d) by SJ0PR03CA0053.outlook.office365.com
 (2603:10b6:a03:33e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 15:00:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 15:01:13 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:13 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 10:01:12 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BF137j534375;
	Wed, 11 Mar 2026 10:01:11 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v3 2/3] jailhouse-inmate: Inhibit debug package split
Date: Wed, 11 Mar 2026 20:30:59 +0530
Message-ID: <20260311150100.3275513-3-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311150100.3275513-1-s-sadik@ti.com>
References: <20260311150100.3275513-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DS0PR10MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4fed45-64e2-4301-b8eb-08de7f7f09db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SRRti1SccFdFKDoUB/MJavmHiwg3zHFoL/YveeWBk67KvkXiPzeDBp1ccZQadBZcbkHz1ZeYAKsGHvE2d8yrVBO/HDLBEKCskBWj3NPG57Umw/ImPURm+AshW8GB9TXLVfICxLNDAA2O7bpGuUmiAw8bt6aYHqX3CWH9gQ/zbUS4Qsbk+pZbL/4qiPML44fHUzgAEdrPGlvMrR/RQcyHPb9BpPZnwysksUYZC5D507ryZx1cHRnTnbuPH1yLw9dyuYNIx2Kb++WO/CYvy4ZeURI/JthnG47bpP0geI59XrocmcmEDaGjjzumOs12JZq1S+DtcxLVnFxy6LQx+I6rZPHPuWuXyyiAZ+spArIzgQ+laIYllfuaaEN8+fq2EFTFzoZF54xql6mGTrMWt9KTZvxWhp7C3zh7qUuS0ZA1NerqigbPmWmzJxVYylqqZxxCnALUErWnv7J6Fx03es9wfr9K+xlt5fruYbJ7xYwzaMrrQGy9/Jf/l1LERA9puDzZI1eFBQiqtdw1D1eB2A7bD7kHBhloUjVd95cjHHfBgm3qJuKByvcWZ1vlO7h7zgYnjVLttLsWOinwrRrBf7WhrGisE5MMryJRJ0oTlgdNjihulrwGgIbmeDgcRzMZ/8+xEJXE6mqUZlOA/8Vsz6j2m7+jJSZqpk6m7EK08mQzINsVuK6WOwJauSA4Mrcrq4SDn9zlkemEoficyWu7kT8tjtE70V2aRbr3jHNNg3uiaeE/DwYu1ay33p53kJBMJr03HTLOxhpww6itKF9FkXRm1g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0b2bXOqniPXyy2LAHXsjaAg6JvRAs21xpWbI9AloJBSSTFWAjqcPnmdPlJXXoAPf24OTgPgsUMYerY9yUP68DDOjyDqwhPtA+L44k1fB00UA1+LdjUA9dKX3lTShcGvSNWJqrsrbwxrPhjVLQg7Kv6W7jtiBT2rDT/2hwHiRn3EjjJNhQkBom4SLoCA6H60JwFCRf/7qFl0i60/8Ar90aDEfXI3SBzQLFXVnhv4rSj/ND0c3Ass1AYfShoYGxvQ58M2oXQ0gzNnZEZwb7J1sdZ/J5UX2949mUQjYVkYeL0HpcjeN0qF4NW5XB+XnAwwG/Wctk6J83WrrXUpe1CHQhVOrDxVc+OKGpc22Z0yJpDv7MlfR0KNELQHqeCxwif8cF00KiKmhNmk3r5kTn0OsNaDMO2P9EK0Q5jqwGBrr822X9COmT/pK+p157wz/IkhT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:01:13.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4fed45-64e2-4301-b8eb-08de7f7f09db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7296
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 15:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19698

Inmate binaries are bare-metal applications without standard debug
symbols that can be meaningfully split. Inhibit debug package
creation to avoid unnecessary packaging overhead and potential
QA warnings.

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb b/meta=
-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
index 39654a53..c6b3b85b 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
@@ -1,5 +1,8 @@
 require ti-jailhouse.inc
=20
+# Inmate binaries are bare-metal; no debug package needed
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+
 do_install() {
=20
 	install -d ${D}${bindir}
--=20
2.34.1


