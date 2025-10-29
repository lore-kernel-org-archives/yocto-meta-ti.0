Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF9FCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 04:50:04 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.39])
 by mx.groups.io with SMTP id smtpd.web10.1007.1761713399670507471
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 21:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=v4fXx/S1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.39, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLKUouFEaw1Kbb2JNtu6N0wh2X66KN37XRH7YHDsnTcY7/IkTBq8YtWrf4p/wBFEgXp4uiAnbHZtHem3m+Kzxmi5KrI3VxVb7pgT7JjGZYV2DO14fOubpxFcP4Ab9Hv7ISMdUiicKIDCw0b2zI5g9a1tzxpFAyOq+vWEDvCUoYpZxj+ekUxUPjSX3KosaVrwKdf+TcZpPyuM/QpQRsFq/PXzcqLC9EBC81u4NATaYkKjJ/FECi5TZUuytuaYplGjvhzOBpukIicKUAXC0YZvrryn25jx6ig72XlkZWrY28pjPD3pFYBKvFAlONBrdTdXGtREA2S+fr5K+pbYug7GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JX9msoyV79kUZFycxlbNX/5Pae/BrnWCv/pKpNNOFY=;
 b=s0c2WDYaR5uImrp6eLUpnByonq5LHIFrsP6MnZSLXVIDH+wxAhM9/OlynRktnVg/24YPauA7Eg+G8mjcku4XbOn9OoLz59m4axU7HXk35OQnreG09eo0jkdVlsh6NMjSr/hysFlaD43OTGmreKh4Hb075/L8XIfRFbX3aOhuB++A6wmTukifmrTEsWro2rZpHxoSHt6c2SsruQlOUgoWQxVJojNJkCAilV+XFa4tuo0RnPu+7A/qmGKtdvAR0OpTSARqcO3L4Iq0oq62f6Tu8xweWTNRmQmzL8fcmB85F9XUnANFt4EoxnYUISvyCZ2JD7OgEKiGVngty47bb6C3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JX9msoyV79kUZFycxlbNX/5Pae/BrnWCv/pKpNNOFY=;
 b=v4fXx/S1qymQpcxBBMfjglBJzg16b/U+Zpmsv+qc/8q4djxfp3H+GicFl+LH6ccepaBOb8Nb7nWO5wu116iEnYM40DLPr+pDjS1jwtob9VlfC0Prv3+rIXO8vrTPlD7nbUTd6zHWt90e5duqX/vlb5WLdPNkeY/pSM0o9AY6OFg=
Received: from CH0PR03CA0407.namprd03.prod.outlook.com (2603:10b6:610:11b::34)
 by CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 04:49:57 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::85) by CH0PR03CA0407.outlook.office365.com
 (2603:10b6:610:11b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 04:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 04:49:55 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 23:49:43 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 23:49:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 23:49:43 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T4nfnm3422901;
	Tue, 28 Oct 2025 23:49:41 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [meta-ti][master][PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 10:19:40 +0530
Message-ID: <20251029044940.1008516-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|CO1PR10MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: a94b405d-6262-4e8b-1fb8-08de16a69b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2d6VMl2Yq3xGby+wR8AIufl7UtKQcsGz4A/PeMplHXkSI6Dvjs0LyexLd93S?=
 =?us-ascii?Q?JCr5xDrDaN4b+CQOZD/pRBcRsHYtCMyJQXuIChBPAMunJvrS+3/hXJz4qtLY?=
 =?us-ascii?Q?gdh7g2XXqoWhXiLKIxfTHAV24vZrLJ88+aEVxUZGogq8xjBuhDqOs4IYzz6X?=
 =?us-ascii?Q?iYvSyPKaKI3Xt58VC1qCWMHgwupPMlPTQpewOIOhv4/bWaz4ipy8IJkhcxkl?=
 =?us-ascii?Q?VtWU/bE/gOVvvtXKJRPzXh1VkreM4CqIun/vpxjUoM0JPgP4B6GNncdLV8IL?=
 =?us-ascii?Q?L7rxyQidPa/RkEBW4RKssNgBFivraVLBySuJWGL4LJXn2vGGs9pa7KwKRBw+?=
 =?us-ascii?Q?jpjarzCeAl5Im0y2+j9E4TM17j0q95db8GmWBKvEBrMChE15iHYkCfCO9Nk6?=
 =?us-ascii?Q?Gg2RMbwgLcLYKXN85qxjX9TFLfL+vk4HaPN+zH1+WKv3dfmLRzk/h9OkeWj3?=
 =?us-ascii?Q?XTtZr+Hi1HBWPZq/NnL0MaucOJlEPkuznpyy4F5EW4HAq6AmtWXl3hm7QJ9c?=
 =?us-ascii?Q?l82fFWTD/GaK98uZXAIUoFMUE3phnCgoGJfaRCC/QpJ5ymi5BT5sireMWtPi?=
 =?us-ascii?Q?6xMziy9FGAaEyBq1jP8dYS30m4wODFW6PUWacmf71NPoQPruoqhu6Naej9p/?=
 =?us-ascii?Q?F75S9hy+AyeuIB6FC7X1Nh/Y7oNh0DNuCd3fNpWcJcWwS84F8OyRv13HRkTp?=
 =?us-ascii?Q?KjJU09zjeMVdx1ROgizBUTedkgkhO/+c2mLA69OTO9pS5ma8nDw5HWcxtBSV?=
 =?us-ascii?Q?rxwGbN+b5u89ohI0+foKPFy6FPUvZa8bI5MT1lxYTi9Uzj5ktaUvs9gtF1Ws?=
 =?us-ascii?Q?/Fv0h/OcdsBbep3l6M3/tlF+hxBMqfVueNt2Ce7/ZPxrTLYSlHm85CbzJeOp?=
 =?us-ascii?Q?Wsb8ksGcSvkr/3H72OUXdG4d4iKy1QTyyuXcFRCw+WBAxvj4sNcuPjzD4BlH?=
 =?us-ascii?Q?C+a/+pzLk5zizoryFr+8pGsI+FLzIicUvLX0/Gd2aYMn9rfXUP2DwZRzYWbV?=
 =?us-ascii?Q?2+5v381kswPb73wWWgvtJ5VkqplElEKYKANP3LiM5Agl4B1yM0oMNrxw2URV?=
 =?us-ascii?Q?HDAQxT7PPZj5hM2Dtf+h4/lsn/VXBv2M4pTO50jPTdEN8Na6ku2Z2yAWtde/?=
 =?us-ascii?Q?PxevPOdFz1TOMypJUeybQJrAI+Z/dCLAGpDc8RJRvc6XeHtKJ5ebevbN7tra?=
 =?us-ascii?Q?+5IpMhNkQ7x+CZyucu6o1P+pPZohqzK3t4x78EefX1l+8wNhtnijfx0mB1vQ?=
 =?us-ascii?Q?8F5sZTbGMxSZWgeQoin2rC//VjwJBGEzb+plj9scEwehdVIPquXMJgmoyWQs?=
 =?us-ascii?Q?pGqxQMGgOdesSnruPF0WhBd1E29pt2R0oEqFROQkAP4eDhC06cA3GbQOStOx?=
 =?us-ascii?Q?15QeIPOCaxjnMYPMN2Y6rJJfCdvXhMfgZXk49a25CFsz1q1/0jjsWyrolcEf?=
 =?us-ascii?Q?opp0/UBC7wgKkTG3xPvTyMLEgAHV6sNn4vYyy02zSHRxuoKrKmQY+8w69BuE?=
 =?us-ascii?Q?xXbhgVNMIo378U7wtPltvCd/2/n7utB0h3y6NEDRl3fUGG6dW+Oi1BsDJbsB?=
 =?us-ascii?Q?lwWrLe7nsyq48i3Ys84=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:49:55.8783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94b405d-6262-4e8b-1fb8-08de16a69b50
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4468
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 04:50:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19191

From: Vishnu Singh <v-singh1@ti.com>

Replace MIT license with TI-TFL to align with TI release policy
and product requirements. Legal approval: SRAS00013045
Update scarthgap srcrev and disable 2dfft example from lib build.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
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


