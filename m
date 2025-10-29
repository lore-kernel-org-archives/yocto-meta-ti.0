Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EC9CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 04:59:34 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.63])
 by mx.groups.io with SMTP id smtpd.web10.1066.1761713971661937083
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 21:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Q9IJYaI3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.63, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtkyK1HtpKPMyXfmFGEU6NT/7t1STss8SA7S8IDW20FvDIN1Ko+FxuMbgkV5v2TIb1j8qnLNUSAWeyN6AUxzsVrecUJueB3kb2gXK0cRI54h4apZhpAUzF72BRv2uYCv1zsxCGKKptqoKZpMdHZkWfhlSAXq6h1O51rgVv23xJhtuHWA2tCqRKDlAgVMmy6X7uXug5foVyHjFxMb1jdm9Vn/BDXBJ2ESR4FTCIhcqWaAlKpuhUw8b6RNH3eXLwfA1s4rC1aeW1mUZPs8lCHGcaUe/jN0pZqsE+xfD6UiLZbUnWL+B7prkQrHaW51w47aJo8Vso/WnzqljsLUBMPkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1qgjBdKTQ/CpEWkHRuY7fuxhA0elo/RTMsa/cCvWt0=;
 b=wlWHy9YkIoC43V5flOnOax/OXajqbbDYF1BIveMJROraqlgNmp19VL7MGOgQEVCh4M6dCK47OobwgH+lc++JoDlKc8MINC0HOwPWv7UpQqkmoel9ga9WNhqJfrDNtkgSvGCk2BYWN3/Rs4FU+ggkwEuXJMc1MDEovn9osMHSoXxR1mkk45tAtDKRUwCFwMTyjxosJu/sry1a9AX+wdZUuF1bWAj0R0KXJW3sSOa0jeJz4FaYylULGhNeOVDkiaFqq6oBnEe09lUcvaMCjAyBcKRRlWKcTY+2yqmeNqaw/jfYYybR2XaOe+fG1NtV9Zc/jemPqfmnnst1GI7If/Y9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=fail
 (p=quarantine sp=none pct=100) action=quarantine header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1qgjBdKTQ/CpEWkHRuY7fuxhA0elo/RTMsa/cCvWt0=;
 b=Q9IJYaI3NTh5qgdiNkrd7r6zx0UFCc8+BJ4pauJ1cqHOO4+2OfnCr0bBBu9EEFwN9A0AjDLGvZc53yv6PaQ7iR4NxjUopyaKrTsTET5oCCfoif7enxDMSbDsst0EFQmUrrehG2Z+VYA7mYwRZEHCevY6nNBfWKmoOpWjSTz2WXI=
Received: from BL1PR13CA0290.namprd13.prod.outlook.com (2603:10b6:208:2bc::25)
 by PH7PR10MB7766.namprd10.prod.outlook.com (2603:10b6:510:30c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 04:59:27 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::4f) by BL1PR13CA0290.outlook.office365.com
 (2603:10b6:208:2bc::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 04:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=fail
 action=quarantine header.from=ti.com;
Received-SPF: Fail (protection.outlook.com: domain of ti.com does not
 designate 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com;
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 04:59:25 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 23:59:24 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 23:59:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 23:59:24 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T4xMqj3431913;
	Tue, 28 Oct 2025 23:59:23 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 10:29:22 +0530
Message-ID: <20251029045922.1528945-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|PH7PR10MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec85729-6844-4618-a1b9-08de16a7eec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zNIUVKUJ4jP9Pj4yN6mYhOxqBodhhmATvDxKxI28doXFXnZxGHmQUvreAS5n?=
 =?us-ascii?Q?joRTug9hoswWvWG6eMnjNIT/CTd+ox7vTaL1ksWtF7GcjGXwlVIXgJuddvzK?=
 =?us-ascii?Q?cvc7m+MVY33TKN9ojg/iCZrMrkSmMw9SV1kcxHVFp3H+ye4mBsl9tPEYhF/x?=
 =?us-ascii?Q?Sc6NhFQOxb+QsFi7k05nTvLd1EpSn0wchYThq3s4LJTN9NyKzDhc06kVYhOy?=
 =?us-ascii?Q?hbtfmjSrTq4VSB2y3OaUvT5MoFmQJD9uljwYDlFRlei0jd2BRMk+meA9PM4+?=
 =?us-ascii?Q?se3/5WEhLplQ9Mxu8L2wJU3i8kRs5JXefMMt/FEAxesB2SpdpyQakL4hv/xF?=
 =?us-ascii?Q?sAwbDtEWc2G58pB4vmv9Od6kop5ntjitDGEomSYf0ZobwMaRMMY5iRG9uivY?=
 =?us-ascii?Q?EgObFt+hKZWHPltQcJVkKVvhVfHMuZ35d5v1BcgJjmgQ7flLAVbQ635vWxzh?=
 =?us-ascii?Q?CZ+uT3KC2cPtMpTjbJpOdB4kYIUMCO+U4s0NLuoOPzoK9xI1w/HJDN8bl7St?=
 =?us-ascii?Q?1U622Gfwe1dl9/URV6S6dSZJw7N6R9rCj09Vx9NwJAF2odUpTezaK3Bp7jDF?=
 =?us-ascii?Q?dPAFf/5uvfx6OEk3Td3vW8RJMqJb4TEiyYgyduQGI1vAq34F5aMQcYtualr0?=
 =?us-ascii?Q?OVpl62ZsKZu+Fb+ftB63ieG/FnB5PS66EhpS+YW5BIP2sjSO0z3f7jO+FNHJ?=
 =?us-ascii?Q?cxRlh++b3+LN/BOdcb/NVRs0ezuxUid9ncQzxl1pcuKsD5BP4LxOf3yacE8F?=
 =?us-ascii?Q?a/+rBTyNLi+rDcoZApdqZ3gCZtMAb/RhsKz7x0LW0+kl1D6UZu/O+jnx6NOr?=
 =?us-ascii?Q?npyD+u5k+GhYBUdngyhH9Ns/z4Z/aGhHYu6wq5G1BIVw7RCDYPGVljQjRvOA?=
 =?us-ascii?Q?ZduVQ86WmLFx01FvkKRlFX3Um5e/gTbEW5uYoP/L8EB6rrmnqT9ed+Y+ETB3?=
 =?us-ascii?Q?seIGaftpQ/woJQXc7RQxlQM1v3boDImHr5f28TZTnl2e/jVeZELxYzFYrikh?=
 =?us-ascii?Q?ptig0PGOJver+s2GluK7Hg/KASQqLKTrhaHfy3trTnZ7lhndMMiloQdl9sAs?=
 =?us-ascii?Q?91Q48fO/OFTccxSBS7ZGIefxs2jlsDq+NVIV5IkfihpZpRw70UCSLVnZyt+/?=
 =?us-ascii?Q?XBNPx/wwVbhAfB371+Aj4JAq5US9rvpcnmZe7aD8WCHQMHpr28oAVwAT5NnT?=
 =?us-ascii?Q?70M02gXvO/UtKtQDRkTUKIJ8fOumnxzZz8czVWVBnRtXOxEYcSLs2gmxn2Il?=
 =?us-ascii?Q?SdV/oJG4AEBdccR9eYlKTIIYo/Cw2dakrYQnAu2muqAOeOfV8CbTx1XgiLzO?=
 =?us-ascii?Q?P9sw6H1xFacBc694NyI4bGYAbZBEsxyUl8qmALZ5YrvFlEcxkFhEw5phYx3V?=
 =?us-ascii?Q?9ZOOyHipeZAbkt2K95ad/U20wDtcFu71NwZiHVgD3pd7Ft08xo7wXavkqsJz?=
 =?us-ascii?Q?V2BovtRgX2PiLlziZDCMmxMxkdc+7Q3IyuhlkTpBaTkyoIB20M3NZRJtIqxc?=
 =?us-ascii?Q?BjcY1W9fazMo3vIzczCCAXtB84na+Cj/2LTxF4s3771j248hL/ehgN9x350m?=
 =?us-ascii?Q?xYJlcNqAweWIY4n44y8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:59:25.3578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec85729-6844-4618-a1b9-08de16a7eec9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7766
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 04:59:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19193

From: Vishnu Singh <v-singh1@ti.com>

Replace MIT license with TI-TFL to align with TI release policy
and product requirements. Legal approval: SRAS00013045
Update scarthgap srcrev and disable 2dfft example from lib build.

License-Update: Replace MIT to TI-TFL license

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
Change log:
       v1->v2:
              - Update commit message with license-update

 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bs=
p/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index 165ce8fb..cf816d9c 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,14 +1,14 @@
 SUMMARY =3D "RPMsg DMA shared library"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c5=
3"
+LICENSE =3D "TI-TFL"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50ed=
3"
=20
-SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dmain"
-SRCREV =3D "609fd72f458ba56f80d06810509ef88d010d2c03"
+SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dscarthgap"
+SRCREV =3D "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
=20
 inherit cmake
=20
 DEPENDS =3D "ti-rpmsg-char"
=20
-EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
+EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOFF -=
DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
=20
 COMPATIBLE_MACHINE =3D "^(k3)$"
--=20
2.50.1


