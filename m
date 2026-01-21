Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556D0C44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 20:47:34 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22118.1769028449270503400
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 12:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=r5eG8bGR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.32, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3vfQkykBsobsk+l7auSRjdsUx/NfE35ttrCllvT+l0z56cUWVCGQShf8l7Zy6Gr1dmcgFIaD8w5RJSmta6LQUznXZQOYn3fqCxlP57824qUXPSimPP6oSS6sp0aZqAQE7gMvbpMpOKJfNchyq+iEBuCV2BlRYQVWF01UlvFOcJCfwP88LKGNDWPy7fhxGoTnrGfDQgFkm6BatP7pKc2J5ShmfnGf9zuzI5jYCHUMyaLVu0Jn/sBmoaCUi5QdSyo+SrvwKlC2XYxg76Vo4Cc8MIcjsbMg+xBXvv9Vko9XNnsHpoQUceYoUavq2x48wRhRcW6uIlAX896brqggv7THQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eJQcD+EkbAqzkMJh5X3GZjl7hK76ugBKAmGzjmjwT4=;
 b=Ht6h2mWl6VBeH3Ewssi5pL4xb4EhcUEoF/DlPuJ3q+jizZTbP4SeQWd1RE/3/g9MN42iG/QhMusVYa+ZiDIbkYIz5IQwIpLPyJG6ZQFouB7svbHAOjtScSBzWfHExUUPXhQPwTuUPbAO6pdfyCX/uA2eF/5ux+wBHmtOYygPG4m0SYSw9tPArPvSH2LYv274BmPeKVN79LocyDzthk8wQDU52hxCkTBChFazmA9dWWAdXMxfA8x6hDI2tYeK/Lqs0Aeub5q2WdMdvCARRxQPIO+4yixVHhrstT++UuBjLdwjAs7mCioeYdKndnFj/Iv2E0MvLr4JBYMHyk3LH+/hLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eJQcD+EkbAqzkMJh5X3GZjl7hK76ugBKAmGzjmjwT4=;
 b=r5eG8bGRuZ6gs8k/xv/ZAiF2JtTg6ez2FPeCrjswKicTdvmjkrHcFviiUfmgvN75SnAk7fCPJwNqSG6AdXJPhS49h6C9bJYll+lEKpPrAxUqkdc2WxFSJuc4DilA2WtBmXpWvLUdPROxAdxIl5KNdBESt69dmA/1fDgDyenGX5k=
Received: from SA0PR11CA0116.namprd11.prod.outlook.com (2603:10b6:806:d1::31)
 by BN0PR10MB4885.namprd10.prod.outlook.com (2603:10b6:408:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:47:26 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::db) by SA0PR11CA0116.outlook.office365.com
 (2603:10b6:806:d1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 20:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 20:47:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 14:47:26 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 14:47:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 14:47:26 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LKlQAA3484742;
	Wed, 21 Jan 2026 14:47:26 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vif6s-00000003P5y-0PaD;
	Wed, 21 Jan 2026 14:47:26 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Move ti-extras.inc into u-boot-ti.inc
Date: Wed, 21 Jan 2026 14:47:26 -0600
Message-ID: <20260121204726.811442-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|BN0PR10MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cba91a1-872d-4ab4-d4b8-08de592e4954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9tKG3HRzT1n+32TbQ7nWw8S10xOK6N7LJ21uDtwAZMbo4KahqWkQX6oFwhU5?=
 =?us-ascii?Q?qta672dIMX9csg7CFRDcMi/4ZF5/SneqvLJetG2Hs6tbJo2UewKGRBRpsxu9?=
 =?us-ascii?Q?ssVCF1nDfZYFFAHzEpSqhh72RDMerNi/v98sfuPheHxpejTdhE4B3R7EkkbS?=
 =?us-ascii?Q?otesva79X7P+2xaQAaCcbif5d+i6AZ2UEfQGByfGVNMDXNaL6t3GKl9dxHnD?=
 =?us-ascii?Q?fJj7F0ilvH1zB3EZJuIccKK/UqERINQvmUFKZ178AjOdBO69g9m852Yf4hTF?=
 =?us-ascii?Q?98AJGzXXJoqERKrrL+3guCSDAcV9B6TFsJ8XaI90Xi+8mWbU8PVlvlyMMdL2?=
 =?us-ascii?Q?bNalo4dc6ky86BezNm0ss1wA1m+XItYeAuDzbjFtqt8BZqTs0lhXfZiwRt2S?=
 =?us-ascii?Q?jzfRAEmYwqrkSWzh7N2fQzbwZJit6g3FxxC6FuOazMEicRyUh1Cj/iuga3t3?=
 =?us-ascii?Q?f1JYcSMooS570q+PRrGGKSxwU5LQlErvL+N/+Bpi5CARlV91rvDF4q4TGAI0?=
 =?us-ascii?Q?sGYuV+EN3eziexKTjyO9hssatJvXreCdgn9GLbe/fmdpJnxGFuZ5MNwOjnrJ?=
 =?us-ascii?Q?aR2+gY6bFWWtfBWS42Eq4qwVD4g0ewYKuHg/WWatjIqnvMkrwYTMjLdcYvIO?=
 =?us-ascii?Q?jEs8VWPR2Laj/Sm3gYGEVioDe9Vojjpjgv8DWdIBYEmOBWPkvF6ugICzlsCb?=
 =?us-ascii?Q?vrLU1qsb5WnEWHGWtNPI56ntva+6nMx29WVeJ4E13iB6Bf92WGjNB4kyi4xT?=
 =?us-ascii?Q?7R1Ibv4z6G34kPWTey2TC9fwvgmCjolKUCKDBAggbdjuN0BINB3OODPt1pZq?=
 =?us-ascii?Q?C2Y31zCPjHWdfAs5frGWZA8cWe1ZzXFwCVTL4DA5hthaYMZ5j5T9LwFTmwN6?=
 =?us-ascii?Q?22eF/NT/XfHbSqVD3wxY9dEWFQl2waYnSgovIOc3KRwyptOTBw8nwX7Lptb/?=
 =?us-ascii?Q?5doksRdAMwxdq85z+udOX7g0tmRsKhxpAUVfMjqRzCUmaiRGCykKCLO+H40B?=
 =?us-ascii?Q?epp4bA2ldPo9nJ4VErwQznkoBO0Bbmo3pSItLzPqGbMSgZCHnLmN52VVTDfL?=
 =?us-ascii?Q?zFN3X2SSaKIxeQXUCOuyrX9yEtEd/TBT+MSEEf3s/Qw85LfjtnwDb4XzYgVr?=
 =?us-ascii?Q?pNE0CGWA6JFMurrbBeLl0NsDMikJwA43pxAzemMjlLOwacEwVD4XpI5AwPeo?=
 =?us-ascii?Q?xxwoh5zJeWMHTRBOLtM+tp1f2Sb+7UQRlVTfj2P7kkoL+jXmtBF3ZQA4vOKR?=
 =?us-ascii?Q?gPqE83LxR3Hdv5yJgZKr/nJYlmm0+JYtoLM1UNiJPpydGBmaG2mYytAXpIaV?=
 =?us-ascii?Q?zXNok2Uuwt1pe28IVo1j4l25Sy9kx+gWbHAIpxcJ9z0d7vOUEBG5wGAFz5Wu?=
 =?us-ascii?Q?ClRda+1PLGwNTzopXR4Fmb8xx7gxAA2mFfyyL6C3tduGlmdFT3S669Kucx6h?=
 =?us-ascii?Q?5rpUcf69Ab5IPhqKNfYi02QwTtQ0QtyUC5V7fd6ehHP28N1QEXY7JuXab9CU?=
 =?us-ascii?Q?lFUqRBB+gRu4dap7NOBnhAVWsCgn8LZsu5WataUDwv3+wisbs5NBFpaGqq6I?=
 =?us-ascii?Q?feb18/6/k2ZU93PDIgdXvhyLBvlkqJbLUSyekXxXO3YL9fL+m4zD6Q2eH+QI?=
 =?us-ascii?Q?A7C6zldd4muy4g098fNgHIWHs4taCDyTpBFXDr4KZ+pGS/e60B+kxus9Mg+y?=
 =?us-ascii?Q?aekmSw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:47:26.6147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cba91a1-872d-4ab4-d4b8-08de592e4954
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4885
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jan 2026 20:47:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19433

Since the extras stuff should "theoretically" apply to all u-boot
versions, move the include out of each recipe and into the central
include file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index 83179aee..d3a78d8b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -1,7 +1,5 @@
 require u-boot-ti.inc
=20
-include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') el=
se ''}
-
 PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2024.04"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index b85c5cfb..4b6e0d03 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -1,7 +1,5 @@
 require u-boot-ti.inc
=20
-include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') el=
se ''}
-
 PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index 97a895b0..773fa1e2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -8,6 +8,8 @@ do_compile:prepend () {
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
=20
+include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') el=
se ''}
+
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
=20
 FILES:${PN}-falcon =3D "boot/tifalcon.bin"
--=20
2.43.0


