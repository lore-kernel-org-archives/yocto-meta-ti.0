Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B460FF8DFCD
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:02:04 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27860.1776376920788651401
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 15:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fGQUZxiV;
 spf=pass (domain: ti.com, ip: 52.101.52.59, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8RRTY2DCTy6ckA+e0vkA2IyBUCE+z+pcjO0rcn7koWhuYNo0xWLr5KMJFm9kYMfwffTLsp9m4MTJSO2IGCNZg5B1N6LuhA8qque8j6o3AzPV5yt7J0p/K7OZaQ5xH4OaJYOdkfOM9IUETRAJzo2He/+8prl+0EgGb0LcLFrk7y5TLf4JQOYf8B92ia71wB9ccWLxOV0uRU0qoZJh6aNaQ3jkveusW8U7DQ51j8DZNwUSkQP4zQe7bbPr2xRQT9AHwEMbdFzOK6Tk0nOvG2sIy9N6Elw1MGXRLg2MchqvmhdGbwOJbi5BPskZPxhJHfHrpTT9V0Sblg8NknhAP/yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBjtEOyKd3p2HVfFf3qSppVQEI5C+a2gNe3qZXcupsM=;
 b=gUn6RelqU/oyi65VYZVLxCcAMo/qUaGQL7dCnKKp5zOxXcynwnKN+WNLerafhzabG1jkd+H2eJ2YxdZRh2stjzDSC/L+/AljLXEOVE8UhoU9IaZ7+hLFiILQH60ESXbPIwhLZwQC96BpIDV+v8lp/X1kW/STkFozBo268wVsU/UYV/XtrZ7ofqx8kzU+QVsLrCxIGYTdsgV+Tdi04I6MZdeEb/27kH+jcUor9PSHrCIndwStuywuYSWEA6PBeHPC8546Mp+qxOV8xnLRnUxvpDH2w+rwGiG9bAkKWat/3hv2vIWvxKAdzVXM5cTEi2+Pdb7Q5Ioa0TAkwpxGwn2IVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBjtEOyKd3p2HVfFf3qSppVQEI5C+a2gNe3qZXcupsM=;
 b=fGQUZxiVYHGTwHq4ewO0J/o3E0F2Cvl2RDZtYoMVAUF7fnal9ksoncWOIlzl5KRbar2kSLr02bJ0iaOnSzqpWeE6Cm3OaNhyBOpjt+61V9QMiRyKymMYcj3x34EoH1C3++nStJwuvcHENS/mPiAGVXu7c5hkymAe0KjEmXxc5R4=
Received: from DM6PR01CA0006.prod.exchangelabs.com (2603:10b6:5:296::11) by
 LV8PR10MB7872.namprd10.prod.outlook.com (2603:10b6:408:1e7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.21; Thu, 16 Apr 2026 22:01:58 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::35) by DM6PR01CA0006.outlook.office365.com
 (2603:10b6:5:296::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 22:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 22:01:56 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 17:01:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 17:01:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 17:01:52 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GM1qXV766715;
	Thu, 16 Apr 2026 17:01:52 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] k3: use ttyS2 as the primary console
Date: Thu, 16 Apr 2026 17:01:12 -0500
Message-ID: <20260416220111.3933721-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|LV8PR10MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 652a16c1-ebe1-45b6-f069-08de9c03c6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	E81rMaqrXwypeCf/79fZVgbZy60a2EX1+qN35Ki/HREx2Npw5lnzvRzxomDEXT1U+yOPfUxerF6y8RIq7U6WarYSuLn9v07oZIrmOPHbfxajLJblkgwJ64flCoUOFYj/+NSLpJ/qNCcEGbEgKO2n/LBjKf7HMLhMOFECizRdIM87nDTTT/NPf1pWu5O5hRiY9YmwtWKCYhlzeYGwV7S5pUiGGqxN7tIpzj14mVEJU1DzIL28LzBrAys1QPmPIlFUCoGHlxCc8vxmzBCCVfaUCK5Q8HocNLtL4DU8+ieitahshNfyhgZ5rFP/aspEM1aDjvkox5YCWMTX1V2i3KloncO5qY2D1b7KGESU7j0k7Td8+dUvOfS8RCjMu5sMLMGObPvr6o87YIZCd0WAXvAM345Lv98paRraaZQXM3QuSlvYwN19Tc0+WDKu2nWn8cA8Vofm/bVi+bl3DJePUfzJ2+g4YOQyjFLwJjS0kpqx+hmePvdalrMcGV945G4cm73bFmwIoGTa7gQhEF8sC0+4XBeimUrYVBM16XGEQRSTMdp+268IddyxcZyOGhBmW7Ctp4qk6vdBErlPkFyhr1X1oZdZxHAe579VWik2U9BqAONBZYdNK2LAMNW1T/DGQh4uzu4GsK/P7DPCphDJrWqmIDYyL+zDAYR86agL+yJzdQEiBBh1qwjcoljx+Rv+K2g5qBwlbuPAhLSiO+CbsvMSogov8gypl+iQP5gKGJ81XGb5qZFj3Kmp0qG4HNWJT+Uj9YQcyZY2UtOJgxPCdIorwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U94RJHdEuVL/Xcj9jgrkSVQUZN0e46nl/gwepU3VsYDfil2gf2d8ZbXNf97swks1RI3G+eKwMW8NxXd5TFIWUb4VlCziPj+MorFWywiYEA7lQCIyANo79Ms38rVm7nevItK0lViqOlldhX+TFbT0s96UGLAnAg0RG64Y/mWo/rQbooP7IKoCROP+QTNQZQ5F68saVgS/RYwjFrIzxnRh4MaiaypAD7VO+uWnKLUoJ2NzvMfddN5IyrXfJL6kl7y5aVUBVAeRz4zV7RjyXN8Sa6itW4QOmfab1a5SPdFcmdaEaf4wjE3r7cIcxYte2yS19sb/JJvekCb6NpQ71qFb/Kf//HQowrSf02gNhd80SMpFEp9eE0/ljvLqjMZFCMeqMhVltJF010uFKAjh6l668mbo3tXTGHNYpFpUCHdXyi2K4pWqW7NaboXfYQ2ZTZLe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 22:01:56.4374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 652a16c1-ebe1-45b6-f069-08de9c03c6ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7872
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 22:02:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19859

From: Randolph Sapp <rs@ti.com>

The ordering of parameters in SERIAL_CONSOLES matters. The first value
is picked as the KERNEL_CONSOLE and used as the console definition for
grub as of:

9dc647e5 (k3: set console parameter to KERNEL_CONSOLE, 2026-03-18)

Ideally this will be split out into a separate board configuration
parameter in the future, as there are already some board specific
overrides right now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 3138cf08..6833789c 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -55,7 +55,7 @@ TI_WKS_BOOTLOADER_APPEND ?=3D "console=3D${KERNEL_CONSOLE=
}"
=20
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
=20
-SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
+SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS0"
=20
 FALCON_INCLUDE =3D ""
 FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
--=20
2.53.0


