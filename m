Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F44CCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 06:02:35 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.51])
 by mx.groups.io with SMTP id smtpd.web10.1471.1761717745055265223
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 23:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=blldjyri;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.51, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePvGYYF0dFG6dQIzP7hqJgo713f65crvDO5kptneIy7eTjAK4S/QN5LRhENMtM96gdTuNA6914zRAJgnawOi2iWJcklQwlbTiiLQwtjzTRC6mrffmwuUZccM/NJv1n+wI9KDxhRcZrcd4dTbSZwUM/1E6FfOrVLMr1E8eCR/+8Vdt7592vbCRGgjoTtRC7DweuHVOA0c84qSjruuFChbq/a1v+FAitzbeOqqLlZPWS57ypwNC59QDAzNGTBkkmYoRIpViO4TXbtYkKzAcT6Esoaez5V1ZQtUCfMpitF2nWQU54Vj+XHX5cFRFuKoaK5FS+J4dEODuSBxW8haROju2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr0urO6WpNkroPwvRKDW6Q+BdMFku1GwC0KdZcomIDE=;
 b=ejgS7qAmJiMBsdKZvEKC5mccnBj9jEnwvDI8fLQ5rvW8x2kICW5BpHHi7tt122nxNpqkSxQ88+/kjGHOrPPu8XIfSNrSp118ANk2D+C8D0ijNRQhaDWfgUBKhYg/1hCV24W9zglvEAseWCQ7yYSHtpFmwA9SIyqPIFZaHMs+lDDt7cOf6Hf1N1Utm9aH1JxzlEV1RyPJFfRwhdXLe6Zcq0+PQhjWYAQRMSuIsc5q+ugxgWBgvYj0BF93Jbs6qEptLegYEAQUx5JC9OvPLY0SQhHnQyoCDa41jZZTLqtVRvaN911QGPSVMA7Ln1H8oZdSE+GQoqInrGswU07QnsdK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr0urO6WpNkroPwvRKDW6Q+BdMFku1GwC0KdZcomIDE=;
 b=blldjyriVwllBVT6pbNY0PiZw0NGoXIBZuPhTqtZ121a6GWDv8XMMB2SgeF6W3f9T/qch7pDwpC58cQ6O8T/gWb58/oVl2wS3ouIVH8Fi4YB7arHhGzxJmkbF+KWITD+KbJf1BrQ9dqJtJTbAEhb+kAjG5bqLrFpWKx1mvtjJzU=
Received: from CH0PR03CA0274.namprd03.prod.outlook.com (2603:10b6:610:e6::9)
 by MN6PR10MB7424.namprd10.prod.outlook.com (2603:10b6:208:473::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:02:22 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::cc) by CH0PR03CA0274.outlook.office365.com
 (2603:10b6:610:e6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 06:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 06:02:21 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:02:11 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:02:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 01:02:11 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T6291e3516169;
	Wed, 29 Oct 2025 01:02:10 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [meta-ti][scarthgap][PATCH v5] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 11:32:09 +0530
Message-ID: <20251029060209.707510-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|MN6PR10MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: abf7d268-b3bd-47df-57f6-08de16b0b961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P27NiT1I95Q/pNAMWHiFDJhVji6AagCy0M4lmVz0yHVQc/Imh4a39jPbHaQF?=
 =?us-ascii?Q?qU7f3I72j9xpMJF7CW4QZfXaj8HyC9zPI1LrNX+thVnYND2pK2iSSerw4iQV?=
 =?us-ascii?Q?1nWtkNmB1rb0+lKUJKh/jUwmjq9mzCADF2mobyyhU5a7yCZ9xHYFpymr1CBA?=
 =?us-ascii?Q?hUEUbbBakiNrCUmbKH5ClSFGBH2Ymxkru/46kzMt5hwPjWmljXVkej6Wz4Xn?=
 =?us-ascii?Q?7TroAt3oTLQOefPx5ZJFnT5iZ741mv6hASh4Xc+Q1eluqJUBT/FVr2msESK0?=
 =?us-ascii?Q?aovnIZQPBSUctaOLoypP8r64wSbNGuNDFIoOQDI/5dvu3+hUlrYi/CLW+n4q?=
 =?us-ascii?Q?pT/XQFQHGmIMCS3zrbYP0iZKtuWJRVdFoSqFk67Hk8IAEYRrHb30zME5a9ha?=
 =?us-ascii?Q?iJsHiOiczxI7e7RUZxEZuHdXYWoJF5cRDaDBpQOTCMkqq/57zGnuINZcoTAS?=
 =?us-ascii?Q?qX2LXA+uwAbwbvaAfu1IIzdgNxZUcD3X+2JL88cePk+kF/AGlNlZ6sgrh2yK?=
 =?us-ascii?Q?fizYdOliz5eH8H++MvrKpxCl2/rBt556MVRRq+Gfb6H+cqXiWLce+AadQYdE?=
 =?us-ascii?Q?vT9wGkLoGsbbHKiYdGdZuhmSOw869wDkERJOfyR70IVLSk/Fpypb5vAzu+S7?=
 =?us-ascii?Q?+fioQS40PRMZZTV19QNScVjUNuCIVk9v8j0PViDqibkMxzPN+qwyeArh7uj8?=
 =?us-ascii?Q?9FY5i7C7+5FzlpowY2R2I4Ex+O/gdKbSlAyhN8K7jH33pXUl/oNqQWEuqAIz?=
 =?us-ascii?Q?4n7Et73FZBGcop4Di/zHbMTDicI0YRf6SUjYI7TaGNERSkc2WKFZxn86DeER?=
 =?us-ascii?Q?xHv8HfRJ8SuDTvr7+dawaWDLOKIDnkFtuKKSOOSaaQYnh4nhEC7Ifyl/9iqk?=
 =?us-ascii?Q?jc6JKEtONznUAx15fy4SIpw3rj1YHKSam+R6CrQ1a7Ms1WNwN8aursiyreSS?=
 =?us-ascii?Q?LchX5Le25PR3egv+W4Uyr+uFfLcWif+txqNzpob2JovTZua3zooQ+DC18fAY?=
 =?us-ascii?Q?M3KfCdRI0IeJwKOU/kxYSVoI+jyg4wCkfGkeNbFwsr0cgdeBdCy0j+MaG5GL?=
 =?us-ascii?Q?6fRjg5mkRtQ+87CNSljuYf8K2Q8L1i/AiYgmSf2N+O97FgjALFlqxx8P8R/A?=
 =?us-ascii?Q?lMfN4UuuzVWthoTZs6xDCdT4PNVNwmYzNPHGKIuHHaR5BAO1TiX5xMk5Lms+?=
 =?us-ascii?Q?U5jJROd3DaNSLuFMFmbSlf7l2o5Af1Be9pQfqxbbVjWYE3vMQWo/OZc4EMwl?=
 =?us-ascii?Q?7tu2nareqkG5p8EzbivZihm+6RsAEOR7784dzGFzEsXiSddtT+NU33RshSCw?=
 =?us-ascii?Q?pm7NaHWo11Elkwzb3BgP4CWY2DeYH3EZP/0NeVIBtR4PriK4+iNfaAVFz6A/?=
 =?us-ascii?Q?+ibvCEzz5v5RwdbuEmvm1A11zb03/nwajXunIQB+p8l+7pLu07q2pkyvH3Zy?=
 =?us-ascii?Q?HSGvJ7RfEMYXQB5c1bXtqonfZGSC3fwFH49xIVDMlVC7fb9GoXSykXFvmLRD?=
 =?us-ascii?Q?prJ1sTmy0weTQzsaRzhPOFjfFGnU4DFfZ9zVEnzWDe5cKjH3mqZnOCKcZAR4?=
 =?us-ascii?Q?xCZLIdHmnPJk3ybf+RU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:02:21.2781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf7d268-b3bd-47df-57f6-08de16b0b961
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7424
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 06:02:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19201

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
       v2->v3:
              - Update SRCREV (license updated in README)=20
       v3->v4:
              - Add branch name in patch subject=20
       v4->v5:
              - Update latest SRCREV=20

 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bs=
p/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index b624871d..7600f867 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,9 +1,9 @@
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
+SRCREV =3D "153951932925a72346b76d98b2774952c48a82fc"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -11,6 +11,6 @@ inherit cmake
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


