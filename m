Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F393DCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:26:34 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.12])
 by mx.groups.io with SMTP id smtpd.web10.1267.1761715593129421931
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=X8XNzLV3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.12, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWByRe2HDgCUQwqQ4vixu9ec3+RaYsa1WSyjU2acZfFgSwrkMADybgGwHSURQ6TWvm+22uRqiWeG8UgBvkObbgCUA6y0SQMffkmuu5bAoyPl6P6tVg80qe0b3R7d/CQrBOgPBweeSiA/IXzwjyVAGEk10rA01AmoBNtFvoz1i+6/xFwN4empKikOyrwIZ/WSaPFdKVVdQzb+3V5wLeILT984aM6pdTpT7KYS0bK9aa92zqyeF5MENMOmiKLhb9pnf1KjV9D4wHYEQOE9XfVaho7MI/C5OzTYwJqtkk6T8nzFI+6RhPb6Ulfqj+F94MzPr7goVKOZ2feoqnCIYHdbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sxy+hS7GxgEruISnlf106kduXX+UB6FDWsLnOJTndA=;
 b=anudjklNXwF1dERT7HlQDkVOBCFSJMdPZAfHEDnVY0HwFQnoNx5tbAj1FRL/KtgWAZaGfYs+0shXV8/k8EyVPONWEpKF9xVjphA0sF4fdj70AMJrt21WsACluru0T56f+t6D/Vlc7MqKGxE8KMZuC2yY/DzoE1w8IJaMoRWGzEBW5MfCXlywbG9U7CAwDvpzO8cUjyG3K55twlW9FCgA4IWkeUE/OFOuThVOvVIiM1e+1XWwFqNwu4T8dFAxkUbj491pgurJR2UNL4eFHmzcY2kGegcOJ23zN98MxLTj1cbOb6OjeVfPwLDgytT7lcic+9wVsNQHOAQ9zZPxOMEDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sxy+hS7GxgEruISnlf106kduXX+UB6FDWsLnOJTndA=;
 b=X8XNzLV3t5i2i6ZSG5E5mvZ8SCIwioWBu+fGWBGLu3abvs2EpMflfTAmiUjH5HyqGjnSZgYGJJZVRF6ZeLJu0ihgMut9zkFGz1XQqzvhC9thHz5XF+7nSX/fAZ6vCFWa7W4uvUF90YYNJLviHlPPkqEyLnMCjVds+xKNztUpdTY=
Received: from CH0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:33::23)
 by CY8PR10MB7313.namprd10.prod.outlook.com (2603:10b6:930:7d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 05:26:30 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::5b) by CH0PR08CA0018.outlook.office365.com
 (2603:10b6:610:33::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 05:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 05:26:27 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:26:25 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:26:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:26:25 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T5QNdM3489546;
	Wed, 29 Oct 2025 00:26:24 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [meta-ti][scarthgap][PATCH v4] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 10:56:23 +0530
Message-ID: <20251029052623.2979655-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CY8PR10MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c0c81c-3603-4ab2-3f51-08de16abb5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xoIq1kwX93t1z7pVIGFdFnX8F09ABxdZWIx2ew3Hwgb+iGHFqay3IfIDHwkS?=
 =?us-ascii?Q?71H0tH920hXt3TiaU/ViOWxNJI/vT1GFyzfIGJ/dIZaN1HXWf+Fiv099Navx?=
 =?us-ascii?Q?wg8WRXO2M0LZizpLrN9vE5XJqPCmV6w8WiXsd3AnOEPTvL43F7we5P7tRWV0?=
 =?us-ascii?Q?ADYVHTjHv0JJ6FWdEDzof7dzUsO8TSkJH45vrm5+vYvXVGNqnzzQBuURo96x?=
 =?us-ascii?Q?Y5cA5po10O+WeaS+if6KgY19M/FjQTxk+EdeY8fBYimlE3lltv3kvGJFcg7B?=
 =?us-ascii?Q?sf+nTtsDloX2HmoT755TWdmbWXvLPWXDjt/iJaCql4wulP6n0e9KQiih/BhI?=
 =?us-ascii?Q?lgY5ZcjnIwq385maAqlnO1n/8ObKHe8kKFR9byuu9/JaQI+6+xH5i6hvqFI5?=
 =?us-ascii?Q?i1btcTP6F90XMvd2FwhZbet20jTg9dTXQdEWpYU/+DIbENNboqP7M/eKzErk?=
 =?us-ascii?Q?A4jRvE/Hc3C6nrO/Vqpv8a8P2DTa+z/75ObCz5mpRg7zKuoGAz2eubXhbYwW?=
 =?us-ascii?Q?FS2TTaquGZM6C6ec+7bUAqVPb7vBVB7WkDfTwC6kxQ2fYISY/E2wggWc5oUY?=
 =?us-ascii?Q?ofwnetdqMneJpa48nlF51/tuTP/sTZGrADFX6USrhfFyKHbxo31okhpHKajD?=
 =?us-ascii?Q?uOzz9OBOp1LVIEfZr4kMX0H0/pPiy4vCvkukdVBA4jfc5Wg5E50Nmg+CVM5e?=
 =?us-ascii?Q?+sbLCapKigfg6BmMjsTT7C5TOeAc7PBv3ZiNBky6S3S/xfF3Vcq5+pAvBnVT?=
 =?us-ascii?Q?bd/jcxtzoHFu47H7CGZzJizEiIQZnE9f2I6e49rQK0AO4bf/xWnqtCNnVsGv?=
 =?us-ascii?Q?sNjP17104b4iI+iWsjB/buTmFkG1wA8uPYeiWxNJeTBmhwgmZGmhXlCxWa+K?=
 =?us-ascii?Q?oQ1k/IBOifEu6TngBRkZxunauIK0RzfenbfXjKhjQpkQKkg7ZBEnVzY+BSKw?=
 =?us-ascii?Q?xZJVIdK+Jxw3JLlV7nOjT571snVn2zeYQAT3eBGExUZUDFl7BPcubJMIh7V0?=
 =?us-ascii?Q?t9NN+5mZkdZK1bkljPiw+QqcYEA1UwxHvotikgwFL5JxTlN7rR1BhWKSdR4L?=
 =?us-ascii?Q?of7TD4+PvhLrk5BKpFbMCi/7qYDTww/HPpSNJiPuoWENNcbV0R7CQnJn3SsB?=
 =?us-ascii?Q?3bIf95KCGU6eNAiEnkh3XhPD58z4A2t5FPQiQkD1A+Vv6SFWOW0oKxWDbubH?=
 =?us-ascii?Q?UilLt11ZfKTZhPRDRk2mYnJ0AkzB8wJITol5zwGOdblz58GUswL93Xq8xdXw?=
 =?us-ascii?Q?rMhClVWxz27ecMp9RoEqxP91K5v/Dp3vad2p3Ri2Q3IgLQN9pNOQ2cQwRHbU?=
 =?us-ascii?Q?xwYieouqkdayOyGSIfomIng9ZH4JE36gZR+t2azlhWfTJU4jTvsfDjKHbrBL?=
 =?us-ascii?Q?+e7zg76+yWWp6qbmxaxqGm5N0DbHPppyLzCUwlGq2yX+eLRAHqFqhQNmzWby?=
 =?us-ascii?Q?ER1K+JO0QcEXA113fWcX7ik1oWLiMjj0t28Xygyt+8cpO/ffSDyEheOoltYW?=
 =?us-ascii?Q?9XkcLiwdrFWGrOiRF7xc/hSCdp+GlsOI8wemxmE800SeoWddrnPTH29ElH5d?=
 =?us-ascii?Q?fewUuer3+LupxETm8l4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:26:27.4797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c0c81c-3603-4ab2-3f51-08de16abb5a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7313
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:26:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19199

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
+SRCREV =3D "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
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


