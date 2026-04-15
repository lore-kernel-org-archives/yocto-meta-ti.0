Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85024FA0C2D
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 05:41:35 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12323.1776231692820308109
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Apr 2026 22:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Pq6038+z;
 spf=pass (domain: list.ti.com, ip: 52.101.85.29, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEAWEJPds72n+gQ4Iaiw2iDCuIh+cGfZ8KBfSfQQEDT8auUe9RfpyZMxdA+K4O+/oYjDX6TR+tr4BDGLwTm9g3tD1B3KfqIkJXyR55RxtdBeMuBboKWc2Gk0OxjDKM7ABUjRCitKWyDh6VRVvbV6ObBQ6RJFZIvfJsYketiU7KmiZ8hLG1D7uukAe61i8DwRGNatWFnFYJ2g6gMzTFZqCXYBlePiSYI3AdulC0RfARvzrFQMx7GsH9hp0TfZu7ZwP1w3e6CWJ+7bF7ZepzOt9ofwJetwBgtZSMuWaE0U4X7cncZvaGdhq0zk0pSM4ZLC7tVlBBa1GJkkjWuxaQ+MkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21S0uTWnqHTKDWUvkwW2TdgDIWccOCXhdvPR6jiD6Iw=;
 b=pPnK1WG1BqHdfTvQZOCrhFS6u7ZhIPhGQh2GadtKsh6nXxE+QDabR0Hef6Y0SBnIdD0lwhA+PVpIDIwQSoiiyTs46kusmCOiRP77tNQgunN5cKTYiULq54wehlSvS8l4lo0UPzz/zq5qUgpJkTEkzGoBvKYQ6E7epY26veGJBrRY3rmKmLXPQmf73WCVHxKJgJhh86eJsHUlQZMfgeg82F3qv0UgrvYQYWduucBYTXWIrGZOhaKqvhdFs6I7W4od4yDgwYN5xYLqI+quLBAnG12AdTiilior5KjOnPe/kUY6pZiLorOHe/fivLzfR+pmfc7SfT5yT05cVuyzfNr8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21S0uTWnqHTKDWUvkwW2TdgDIWccOCXhdvPR6jiD6Iw=;
 b=Pq6038+z9vgzIvIS5BD52F0QIAqckyBHoxUqvVqfn6RgrRDENlMi+wVOMU3XEzKfBrvW+24mO9NMQU5dTmeZ6VAxx05WaUUuGwr7Jwb32ZsEQhahIIsFX1ou5P0BACqlRSxpyU4PAzA1R4S2CCvNyrvKQkrPAf+MaVH/K4iEyNgMsKqrXQNo2I+RzvrRI8fWngvTUA8YzcTkmILGH0AGvwEnFIQ7/7VWVljdWamRnNUeCMy8i49zizJxST9EAqaVvrTsxmGLLh8h4rVDLm1AXJ9vpyxPiwFJDkfUb8C6FXK60pXSf7Ry3lAgAZdmp+9IuQrPjrXQm1SkTWmvYn+hOA==
Received: from MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40)
 by SJ2PR10MB7039.namprd10.prod.outlook.com (2603:10b6:a03:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 05:41:30 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::dd) by MN2PR07CA0030.outlook.office365.com
 (2603:10b6:208:1a0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 05:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 05:41:28 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 00:41:24 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 00:41:24 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 00:41:24 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63F5fOtM822242;
	Wed, 15 Apr 2026 00:41:24 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 754F312B25D; Wed, 15 Apr 2026 00:41:24 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.04
Date: Wed, 15 Apr 2026 00:41:24 -0500
Message-ID: <20260415054124.2434086-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|SJ2PR10MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: e02636f6-c8ad-4773-44db-08de9ab1a3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eD7endvZ3R5u52KQ6hZMUzJthTMyh7jy2oI5u6sj30A5X6EkIyLmWW/ExhWgT3pkB4IqlbpTzH5H0bV2+6n8qM17FeMLD3SkOzOajilormSw4FuyvFte1kfmSWQIWbEB5xxLbLma7CcZePMCiJ6ErjMGTTCwAmpYOT1uXl+uaAZhzyN3B52OmtutcBH4oJH6/DWAhF/Y5tvFirmoX9xlS8iRpBJPYQUBEClD5RUSHgprlGG6IPwUgZimWaJEjRjsONdl6dVYMA3kWFleF59kKUaPk8Yr1T+TgleG1uY5dI7xcxtYzdigdXe648mZ3GCdMKZDBBaEkqqL9gQ+7pgiUR0C4vnboep7pr2PLRdTbT43+43e9xQFnrC2eYMaIJhtY/JUyjThZlydXW1z9/mZZpxmlBivWz8CVFArLlZD3PtuX1SoRuvz0Chh9A513xZ8fdxRwCe4+7vhUBbVZ46/qCakyZsZ58qIbg32HNzWzynCWfdEBrphPU3J+gwnS8yuXk+Wqjod5ODE7NcEzWexdB+jhiV7eTX9SYZgMo4SN6DPODN7x6W/mrE3iNhjUtf1XVSSSajzYVCFFT6sSJLaBWx8XndEIFk2b+QN0BC+3mL5FP8pbTshdhqcfVIkdkPtPh4Vcvl59x21wGHrQUFXiLTRsueJJ+fJmNfmYNakwTj5I/XKjWQtcC8u9QoGQFN41KmoUhz33npWXN4XAqYQAMhBNu7m2mtSmdMliHdvT4nIgTATrn4CGpqLOScrhKHEfgBVErhPjRhSuQbo2lJNWQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bmW8CLyb1u5746ugHkCGoDPDMoUt8+tWz2S+fAsdIwhgbxKEwnG667uTKaf5P+NXS6zhNqB/5NouZ2f7ImXL81CKdOnOojs9ZkjKiDdo0NjKkT/3CsuLeG1uH2o1SmBTxyMn81a+zHS0acAT27CQ82NmOI0PQBmTeDNDBMNBoh53g+xeCfsSKxROzCVmANfWQNUau2xk4dMlrs6Qn7rjkb1IDksSX/Y5HQHu06f9f0H8Ep585YEGaO0c2GJaSubyGhbTMZ0/n951//p57z0mvfLC/o4YvRXSwb7DwwI56w1MW/aDS7T6FqMiS0cqiENqGSLJZxrwZ7ubfAztDw6uS6VK8KWusKKsPEl/qEIV81wof/Io4SMIuH28ick+TVkes2D8HspMIinwxNqOkl4FMNPGk5wbwS0M2PObsRR+WfRahLds9Uw/x36YZE7VCC4r
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 05:41:28.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e02636f6-c8ad-4773-44db-08de9ab1a3f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7039
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 05:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19843

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/met=
a-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index be53ce7b..03fd6193 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
=20
 SUMMARY =3D "Mainline U-Boot for TI devices"
=20
-PV =3D "2026.01"
+PV =3D "2026.04"
=20
 UBOOT_GIT_URI =3D "git://source.denx.de/u-boot/u-boot.git"
=20
-SRCREV_uboot =3D "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
+SRCREV_uboot =3D "88dc2788777babfd6322fa655df549a019aa1e69"
--=20
2.43.5


