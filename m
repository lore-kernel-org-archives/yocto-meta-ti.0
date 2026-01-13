Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A7AD2F347
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 16:51:33 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63631.1768323087176359985
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 08:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=USSUTH2h;
 spf=pass (domain: list.ti.com, ip: 52.101.46.10, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHuhLHfm25De1zQjcsdH9xTb6fMdZRrm02zk3OfkA6lvR7RJM2xiriCx8SrgWNr13qNGbIMTi+cHSOIAodYnq4Lbti40qhyrzUP4Kx4SLVS4Sj8cHsYxxhttDO4j17MMKvHq6V8haI9wJLMG7q1DSqJv7lImV3euYkX2uknln24rpcJgtLFgbICeUTeqQm9dW/uYi7CpuiqrDM9XdN7Wl7/kTOiVGE9qxdQ0hGn3Vy+RPgwVb0FInxV0b6/npMkEQz4FqzafJqj8UfitumL21V+HASCXUMdsS92Tew26h+k7Brqq0PTx24Fi4GsY6zX/SKthjoA2gRzBhjhflxjh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J00bXKRQvpUB59ZJwJIIempFf6rZ+j4V+fENrMCX0ZI=;
 b=tny1DpW07hkJwekfQiT869qXEtEG06YostUi76BCG8JACisNZMffsRx6I9Yn19mUV+NWpxbFK4DA0aJeOy6ScBfFmaxifOKVPahxYc2s8vvOYixxcn8EJa893SAkIQa1lKqmhnw6LAI4hU/rUUUrTlQgudeUsG9Xvf8vT4Ny1DxchXwvk8QOd78QwTv/ys6IZVrQQuAVNCvsvdAGxMSm+virIfYtX6OvCIwpc8IGwzpUx9NBD9G+mz6SmuBvL5ff5UXfKCSivly6vUM3mLjxQiQCmAIV6kK1+NdR+uJIC++e0Pn5bCi9aU1pOk7nesufrdnrfn2elRvf0sdAQ6lP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J00bXKRQvpUB59ZJwJIIempFf6rZ+j4V+fENrMCX0ZI=;
 b=USSUTH2h8ct45bMv2BdnMpY+fed0Jq0xkiOEPmQ/n/sxQxPXMy9B8WzogVzPz4GRQR6UH2UPGKS2DTFoUZU8xQ+SHLKvNYZrO5pFP7z3063Etbu14vM0238z5Ds8/BgDUC2GFqnYljscuH9Xd+3OyAGlrhtZrbmT+MxPvVV2PZJsBaHgxC97B7qOsUECZOOPVGET7OkSO1JjDES1wG6hVeFX5f67C5iogNQTTkanaE3+JlZTmn0F3+0kus/lcku8t7UDW88/YBi+T3jF0X8vH2aM+uUI4phgjhnrOiFQr8gx7CmynQKRsMPLpHcC+bDnlHEQAmfPDtpkOVtPNhXnEg==
Received: from CH0PR04CA0079.namprd04.prod.outlook.com (2603:10b6:610:74::24)
 by DM3PPF5CC7476E1.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 16:51:23 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::30) by CH0PR04CA0079.outlook.office365.com
 (2603:10b6:610:74::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 16:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:51:21 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:50:53 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:50:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 10:50:53 -0600
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DGor1f2582522;
	Tue, 13 Jan 2026 10:50:53 -0600
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 0DF3612B261; Tue, 13 Jan 2026 10:50:53 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.01
Date: Tue, 13 Jan 2026 10:50:53 -0600
Message-ID: <20260113165053.2457854-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DM3PPF5CC7476E1:EE_
X-MS-Office365-Filtering-Correlation-Id: ede88385-4921-465a-0870-08de52c3fae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q+FkPFMdaPCZUDNZlTrN49P+epbTLS5CGPe/f5ENWBtGjfFSrLv5rRE4ehhg?=
 =?us-ascii?Q?kcLMoC+ZjMJBRIuUlrzY21QuY3vJpJAQAZg/zQtA4rTDU6TdIQgatJ7K6f5r?=
 =?us-ascii?Q?/TltAUw5/NtJb1g83fv++5SllBQLrO385yp4M1jXzJ5403OWt0CYx9I3cLre?=
 =?us-ascii?Q?bR7vvnr/PSyBFJnTB1F9RBMRfFHPjKLcuY2YanyKI02KrpN/qzdXcTR2UKpr?=
 =?us-ascii?Q?+gLiJltg3saioLtJ7rSgnjHDMZWGp4QTyF8rbpsqm6C/90HXmq2+qLoAuAyw?=
 =?us-ascii?Q?iJ19I+Nn8AGATyy3F1wPwgV/YcvP64ZH++RIvC58iZFmAARnoFHuXgAafqJv?=
 =?us-ascii?Q?Nm8v4N0aChXqreRZwiu/YHqSp7u9+LwJeU37UjcUgZfO4qYy+mF20r7giaLj?=
 =?us-ascii?Q?jNJxKhWQWi47RicLfjh3YamU8Ij6fo+XtqWYoGDVVRRd/8Fo2+9j1hRcxqTP?=
 =?us-ascii?Q?p5xqtDXmhGF4HT31fyrULeQ6ip+402JPdZXt5Grww19vwT92b0TiTBBY1tgd?=
 =?us-ascii?Q?yByby87j6GWWoYtpaIk7+8vA2mmCXtRxOGajyyxWeyMh0zcNsxfPp6OHh/9I?=
 =?us-ascii?Q?l2ERbCHmrec6jHmlFav2PCoTDHxPquVxBT4Ex1r00c/ZF/7+jm13hY0/dsXw?=
 =?us-ascii?Q?HkIUVB4mW8yqMEGCsJ6VYX7OAewOTz+EWX6oiLcekmsRP8joVxJjSdILLqY7?=
 =?us-ascii?Q?GH5pyK4reGncY/H2FJfL7omiCWg6TKwB/8wnCwCz2D5x+PReK5QXJcIZ1mmO?=
 =?us-ascii?Q?cuBe5jgAwVo5Xh2XhQi+UlDynW1AUVgZu46X5e2glPPr2m7BO0gDShQUizHF?=
 =?us-ascii?Q?uM9eic7A6rpM3M9SABAXeQrj0uaGarL2uAvFWd+Dm3bqoJ6hx6jGcVtQ1FSQ?=
 =?us-ascii?Q?Y14OTY3/DSQNQ5xx3XiNG2ecxnsoK9jJt6EfFSK+aowlT0y26L05dAl+cYWf?=
 =?us-ascii?Q?yoxWHBPveLkC3boO/XnunbfzvbahwyjPr427UBK0NIrgVKeXnOmlgeNLygsu?=
 =?us-ascii?Q?jBF5lx+rSHfW4MQ3wBh4v0QrIv9FjX6rs3rJfcBqpfXKdvqvBxy31hSPyPgl?=
 =?us-ascii?Q?frALSERBMaEYSU9GtaYZyncFHzvZCAGrguSJh9768q7TjTFW+di44yv4mDxm?=
 =?us-ascii?Q?NUPVzWUeq+vTs5mkjw6jU5gr+RbaF/rPauma0pu0RtocxF+BswfW2AYnw057?=
 =?us-ascii?Q?q5NcdT/CdhXifaga4j5n3MJ8dgZm0g/7ZOWvgL2nzpYjuM6IYVrjK2ZPYPky?=
 =?us-ascii?Q?iMzUbd04XiJr6Wqh7usrefzIN48c9hkdhf0v1vWRy0b6eCTTGhFDKiaV4vLB?=
 =?us-ascii?Q?rbgkG7C/rqQmAPqNETDIAD82C3u+U5uAsvKbfkiPw7+xtuV/D8ppsJk3K5Ka?=
 =?us-ascii?Q?EtWAG9htvQViqwLfgJBcPaB6Y9bwsZ4v6rSlFj4MB9j0t01gNWmZq2hPT6EF?=
 =?us-ascii?Q?DW6gPCfG6q1/VzV3GNazLnJ5NTH4EesxBGjeGgyg/4SP73AmV6dcUjEJg0Gh?=
 =?us-ascii?Q?yBdrGEa9mdwQ1sYPWdt7YfH83fJHx4qRhJbbFJtv8jddHhNFncv2Cf2CHDEH?=
 =?us-ascii?Q?CajZjyHIGbvujO1V2wM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:51:21.3478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ede88385-4921-465a-0870-08de52c3fae3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5CC7476E1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 16:51:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19412

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/met=
a-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index d2b34cd2..be53ce7b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
=20
 SUMMARY =3D "Mainline U-Boot for TI devices"
=20
-PV =3D "2025.10"
+PV =3D "2026.01"
=20
 UBOOT_GIT_URI =3D "git://source.denx.de/u-boot/u-boot.git"
=20
-SRCREV_uboot =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
+SRCREV_uboot =3D "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
--=20
2.43.5


