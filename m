Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153A1D6CFA4
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 20:10:32 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47324.1769112624713639222
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 12:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rIfOWNA6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.51, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYvnxLJpUVswU2DC/Wz1Mvyw/AkAO6IXkNPBA3JdBs3GiPft0tHyXmvT+c7d6LL5YV7aXx0XwQuHZjfeH0NBnrHG4gLbGPuJvesR0F8MCsqvaqpZxMZv4fbNpMeILaL5wkZ335X9sacPPoytmeLFCAxVCf1n02uJnbiFSD20R3VAmY3c+RrwDNaOY/kGIva95Koiq14teNM3urphROTRHRjIaO/RIPUH+v7+n/FB0i01cwSqNrXyd6CLPvmywWXKy92JsppwKoTvXX0PphfnorbuZC5D2VlBPpn470tyUs7QbqtQWb6P6nvf7Zau3sa2u8UPEoeRixkwfJ+xqLoP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlThW0qTas8Dq0Z1vDPyRBY8+dQJmRGu6JMWMI7ojzE=;
 b=hrYidGYbX+YH3u78QM5yvNkk03gl1TsTCB4cnJZVRjt9yzPhtVkhUXJK0wBrAR74DZ/fOBAT51ZVOtEym2IDkv1KdxUASNQaV4e7oQ7oG9NmgEfrWRM0Naq+x5IM+0UqXUES0MMEK/NTcTEaZicRypRjolGEIm+gBJUkVH4x/B7jooQbWUZJ8utfFIu4qN/ckbuXgOod9WQK6cfh04C447GW66LTjBEaQP/hezjESm1wOX0tV1OypyYM8JgOA2SK9Kv+7mCLkCJIziSlgWTm8TK/oRWMUNe19wGX4jtzwDC/HZmfKIVPG0Rx19xqwALShpBaYkb3qFgZ7VdQpX8MHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlThW0qTas8Dq0Z1vDPyRBY8+dQJmRGu6JMWMI7ojzE=;
 b=rIfOWNA6Ut+PaJVCi4fjMceIeFMObGwpKrXIat+tqgGwAuXG6Z5lRS032GgaRDVMYnp9s2idrGpp8pLUGAfEfxDI35gVgShxPGDQtbYZieritg+tZ6/ilSPmqOwPyW6gvl2GjM/jtkCW4FyRMAAU42saQ6OoawIw0FAfqYDyPt4=
Received: from BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::31)
 by PH5PR10MB997735.namprd10.prod.outlook.com (2603:10b6:510:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 20:10:21 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::de) by BN9P221CA0011.outlook.office365.com
 (2603:10b6:408:10a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 20:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Thu, 22 Jan 2026 20:10:19 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 13:35:23 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 13:35:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 13:35:22 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MJZM5i946869;
	Thu, 22 Jan 2026 13:35:22 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-gc320-driver: Port module for kernel 6.18
Date: Thu, 22 Jan 2026 13:35:22 -0600
Message-ID: <20260122193522.302216-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|PH5PR10MB997735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d014c74-f322-475f-3ff1-08de59f2444b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ihHBOc2BX/PcP1dPsFr8A7FtjgyU8aR7Nwv7PizghkzvKnBcxoXkzSGX2Le0?=
 =?us-ascii?Q?0Aag2ZCRowrR0zKCJn3Ofk1Y6TK+5/rCLJ/BsY4Hd/P+FXDT99EyTyZZRre2?=
 =?us-ascii?Q?WVdRa3Pcd0ThRZB4ZEogdoTEwn44GFQNViIWzRDD4bl8/Uv/4X56EdZysGaK?=
 =?us-ascii?Q?AYVQLhD7Kx63ea9DpeWAHbL1vQeFidSfZwWQD1kVnaMlmLjQnW0AYC5GXdD+?=
 =?us-ascii?Q?VU6hh3gRxVgJQaUhf24/d2Zq47mEfDEV/SF47wbdrykPYxgGrHPLX2U6fSVP?=
 =?us-ascii?Q?oUV3Fd/WXDwi+O4eyFN+UefZzFzR0CEroACb65rsBsijblJw/KDtNW8w7jyR?=
 =?us-ascii?Q?4vjXPiO2B0B7tnZyS1jINzH1e1wDlNq51E2BEZO3mlfTHKRDBsH3UzC8BeFu?=
 =?us-ascii?Q?is5hJscxy4WfGb26voGw5zmlnRtlonHvzz1sGdAyXKrpfKaYa9zdbm2kJ9MF?=
 =?us-ascii?Q?nqTOu3/c0PBUmJ3U4/gePcmVpZYHXlyPx8Iq9LsIN/Riz50Ji/oIiNK8j0eO?=
 =?us-ascii?Q?7y+Yh6GPYdO2CjZOJ+YpJaWmHewS/IAXSR3dQGk7Xcx/9TObf21wBWTpQhfY?=
 =?us-ascii?Q?udJsYGP7Rtko0TqIo97T73j5fjvGZKlifFS3HGOgdBPKaGbIsfloZAo3MHfw?=
 =?us-ascii?Q?4NQyFUrjeSolrvrYZ/GyVluhS8SlM+oXjEpBwgSCm2wgm3aX62otHT0lFz5e?=
 =?us-ascii?Q?dNtu/W6Y36e2NRh7TZM0Ik4oJX1NXxv848JqpvBzdWcn1nQ+WPvMADJVio8G?=
 =?us-ascii?Q?4OqHcWhyfKSWitosT9BXunBXGIDE4AG5PIP7q6hlZYU289tH+pHW6OelJ5zz?=
 =?us-ascii?Q?/ScP7okZChUVLCoiGqMkV+BuUsvvhasnmWXFkawtr2lRbOa7aVFrxWOvZN6/?=
 =?us-ascii?Q?MahXE4+x3t3KwaJWq3Zg6ZQb/Qk+nYo9Ako5ndWel2ccBXdFVSHWq6FTWDd/?=
 =?us-ascii?Q?yHLTrq1WR8vj+qFxUj7kmElEmNeCtDi0+vZZ2wpV5Kicjq1MPjI7F5uem3Fm?=
 =?us-ascii?Q?zIOj3obKlfruPZRmPDY5qwQeYrc5vOjaVn5JlG9GOMwX0GLE35rX3ZTxQIIo?=
 =?us-ascii?Q?YJo3JFxmPeE/JNoT11bD5H8UVN9d9alTNSw79syfB45I40frWeg5xR07EJ/I?=
 =?us-ascii?Q?zfqve3H3EJJsXHYHSEVy9XOiYR5SCNBZlQcfhCOYnYj6V2rh772wKWo9xesp?=
 =?us-ascii?Q?gmFjZk2hdG6MQhpxpO9NxI1w2g0R3YJxENiu3hTQBIlSL2aSJpXLi25Q3289?=
 =?us-ascii?Q?KbhUSL7CVfCqiYYBgDPwFGkKuD0GcxFmmtXFGMa+bpeMNvwtwnYGUZFwxpZe?=
 =?us-ascii?Q?TAj8FEs33rPn0w8jw8fi/heC1+rYwh3wldSBChakjc7MoTCnp2Zx9OUbnLjd?=
 =?us-ascii?Q?XxO3CoHpgDUQM+CegYJ+Ax4x7axlpk4D7vFsg9cdM2omYABhRJXHvaRt2G4p?=
 =?us-ascii?Q?d/znpqgGmPcY1kdkWrT/J9iYHdFq5Qte21hy0qb3mZVi/WwiddCdbTsNBGf6?=
 =?us-ascii?Q?vSNT1nRscCh/xPzLzWBVAgrEA82jfsQSPuPuy5dtOv+zctlvrN210XjCo9ku?=
 =?us-ascii?Q?QA3G09JtLM9uVbu8v4fZ7iN8BlCwTFD1NBsjuc5Pl25Sc8botjCp4rH5jkOt?=
 =?us-ascii?Q?KIO/Gxo2yI2K3b0Pp0/kh61JnXA6PTJALwC/5KgGebOp7j48JZB3BlHujyQA?=
 =?us-ascii?Q?6ozNFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 20:10:19.4694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d014c74-f322-475f-3ff1-08de59f2444b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997735
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jan 2026 20:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19438

From: Antonios Christidis <a-christidis@ti.com>

Port the kernel module for gc320 driver to build on linux kernel 6.18.

The overall version of the driver remains the same.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p=
7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 3acdd130..336f4ce4 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -8,9 +8,9 @@ inherit module features_check
 REQUIRED_MACHINE_FEATURES =3D "gc320"
=20
 # Need to branch out with ${PV} var
-BRANCH =3D "ti-${PV}-k6.12"
+BRANCH =3D "ti-${PV}-k6.18"
=20
-SRCREV =3D "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
+SRCREV =3D "a7e9a51e89c97fbea974c7d674aa0a95d7c96403"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3D=
https;branch=3D${BRANCH}"
=20
--=20
2.34.1


