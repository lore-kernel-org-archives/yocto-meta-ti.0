Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B5CC44508
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 20:49:04 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22155.1769028539562543129
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 12:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Xmi6/d+2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.64, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+FnoiTjfaRxv91TkEr7RwPtyqllwAV1f7ttsONfMmx5BHNrHR/CwS3qmgHzy9L7Si/oydO3YoPs49RBiEKKspn7XGjshlIz/fpsrMlY/AJ9TIWtBu08XcZhr+exmXGWPhnHBoOLmKCDE+mM9raP8ddu/vDl8i1xPVP1fR7gHl06q9ze3VJ8Oi8qOJQV/4r6ZnmpddJkd/9EVsqmyW8admNetQ2WWkpHh5HzbrGbWv86rtDNaMV6ViKXA911dtgO5tPa8C6m7VWwVojM+ul+w+opKItaOHPdtAjdFGH9++zleVxDqpfGpWvX5OLVCC97P41BKfJ2wl8YrGpU0kX/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnt4gusVXs+QpqkIqEi7gVXeHFyN4fdeTyNx68nU8oU=;
 b=TUWkIEHanE8lQqlNKDWzUPlWqaY25e180fLKHsCiFVvefCzsykNSi27u12ACAGZJYGIDmf7Y4vvUgXFIr3em2AJdqIVCwUISLyMmqnPaoZNJHMn0sltieUobY9xPHdrS6R/tpF1zLplYkJvRlh2INop/STji28WLniVms2GFuzxedL7L8Duz9tKeWsFI5mqWkSRSwmmRuWPfxqx2p5c+iSjNrTHC7lJu+V9Vle0IBN9z7RK45p53JJ0CsludS0dFWN5DWSWN825KHLML6gf2nC9zeLKj0aNmfxvjXOR02Etzd8SgxuOuAUg75DXosHiyNtaKA8BNqPOJw2Rnv0+HXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnt4gusVXs+QpqkIqEi7gVXeHFyN4fdeTyNx68nU8oU=;
 b=Xmi6/d+2wLLf1jYEq6BnnUVqNrBY8Zy99P40qUzdjkFxXfCv7FizFT82dplAfOVw2bKj8T3+4Z28zN8P/GBEEbO1D8CiQNx6yMJLiHkiwuKwLWYOU0pe2qfEDyVs3JDy3Lbjlid5C9BcmgIMMxVOXJ0HcrAfyunWvqY4CsDc5Iw=
Received: from BN9PR03CA0709.namprd03.prod.outlook.com (2603:10b6:408:ef::24)
 by DM3PPFE9EDA11A0.namprd10.prod.outlook.com (2603:10b6:f:fc00::c52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:48:57 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:ef:cafe::26) by BN9PR03CA0709.outlook.office365.com
 (2603:10b6:408:ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 20:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 20:48:56 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 14:48:56 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 14:48:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 14:48:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LKmtZe3485846;
	Wed, 21 Jan 2026 14:48:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vif8J-00000003Pp1-3wwl;
	Wed, 21 Jan 2026 14:48:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] conf: am65: Add usbdfu tie-test-builds config
Date: Wed, 21 Jan 2026 14:48:55 -0600
Message-ID: <20260121204855.814231-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121204855.814231-1-reatmon@ti.com>
References: <20260121204855.814231-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|DM3PPFE9EDA11A0:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa7246d-e0b1-4536-a600-08de592e7f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mdj3sfrW2fLu4PgmZv5YVnXfdkgQJB6jw8s9bD51qiAo3tc60iJ70oeAALwF?=
 =?us-ascii?Q?kgWqZsIGzr0IVx2IUjXZ3jJtJD5xA4r7exZqaBP5UYS9ej0sghFNPnNv2JxQ?=
 =?us-ascii?Q?h66EDzByWA1FhczW1qdczK+oRspnmAomYofZowzMwe0V/iw8tdcEP+IbsoK0?=
 =?us-ascii?Q?3k7sSbn9FjANYFS0/FWWcY4nPfgCfw7iGWfNOomNzPxPStocKElSLPG7+hun?=
 =?us-ascii?Q?kygs0RAmye7c/NlzX84Bp9nSbwlC6BAJnu5ZJEH0XvRP19J96HPZw90Z88Bc?=
 =?us-ascii?Q?yckj/g1YpV4xRZUJf0kfMPOUDVNvKIli8ZnAieJuXV/j6JNoYZ4ejP+G9xru?=
 =?us-ascii?Q?Z1crRMkcthdfYWtIHMuqXh7GWXtU7lnpvxLKezEgzEAAubVw4LEsO+1goyPH?=
 =?us-ascii?Q?NnLNcE5Gn//NJ4s0MZYU0iP26zoIRQcT+DcVpdiEPx88e+2x9NxUt/hDXeDc?=
 =?us-ascii?Q?W7sbEQ9ayhaCOy3EUZA9VMUuoi+uDeDGjK+/P8MIE7F4SrAR9mpuhcMFfFBm?=
 =?us-ascii?Q?Snwln1OJTH+6uZjFZBydlI9ZkSfY+Qpdhl1xNYMv/UBeGPjCDaeCh8X5jxOO?=
 =?us-ascii?Q?l+gaIcJA2pndF61p4Qv2mYNHL0h2/AYLjdk8ME547mih0FYu8AUgMk8pb17y?=
 =?us-ascii?Q?aB0aW1tCTErulMnJaMBvGVtt85+ko8LAv5MYmOoG96HSz/XIFaBEYsK3m4vW?=
 =?us-ascii?Q?z8h2pjmAgx6E0rylIv9OZak62r8P0j+xsApx/mqLtkPFLC2VZsuwYvmSTbsj?=
 =?us-ascii?Q?Fua+mwwjE5ukJWrFWy9rcUht+skz6eVM8L+5mN5p3cultP9BFVz6dzFSV2Iz?=
 =?us-ascii?Q?ANAJ/pLolF4EdPQPDrmt83bQOH/i0/Te1ynXjlT2sHqpjlAEijiTusX6WBuW?=
 =?us-ascii?Q?VSs5haLnewjm6h29GYd5NB8KmRAgUoCDoYxLTqkR9ZuyZdscSvd/6o+S7HIl?=
 =?us-ascii?Q?TnFX9/Tuj3+CRO6K5U6SWUuKl/FXIHRDtMa+hWjLzHLyjhRgYdy+HPimuqLP?=
 =?us-ascii?Q?m6Hu6LAziFPlwoZtt9rOREIYHDaTzdGvwk20kMPedjiy3ppESZAOl4rh0AnK?=
 =?us-ascii?Q?reaAd5wLp80I92TgJrEdQEemirZQJyflfGYODQiwzPez/Ex+1C5q10+oluDR?=
 =?us-ascii?Q?q9hSLtjYMriyVznlfanckcx346/B2jClmw4fd4Xq+c0GdJogjwsycLtXihHj?=
 =?us-ascii?Q?K6g+ft8CWvvPKrx2pFMqeePiZM7Y4SxZZsUANUkGbydphnZB6UnVqNGPanGU?=
 =?us-ascii?Q?+RNdS1PID97koqLnzDhxaePYhs7Gu3CstevRfFLPgMgx3cVy9iZFNiewT7Tl?=
 =?us-ascii?Q?pyuoNC1fyZdVc6X9qNw10Pv87zEtzxZJh/kSJxMKdohUEC7KuHrgkYbVLhFx?=
 =?us-ascii?Q?9tCIBDOVJR3DskFFn3sntXYCiA6WM0yUJ7462nV0YX23JRgMvGelhHdpa5S0?=
 =?us-ascii?Q?+2jDo6i0L9mOO8i1v5vPsBZhFljzQ6BHLNg5H+l4HxJmI9cSVUh1pqdhEqwg?=
 =?us-ascii?Q?imK4XfhH6Yhuz7+hBEy6QsuLxxRfWMEqovA0BKB/eKDneDea2NqmNjx4uo43?=
 =?us-ascii?Q?6gqMWONOqe+tytAWQ4/ef0xwQHioH1xsMZs4VC6xwdQAr7C9nkUGFr/atYha?=
 =?us-ascii?Q?XDjaUjdHQGeSzWUTR3UZyUppw/f/8tBP54snldAtK5dd/8SLQONJNJTq2c/L?=
 =?us-ascii?Q?7RE5mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:48:56.7052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa7246d-e0b1-4536-a600-08de592e7f0f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9EDA11A0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jan 2026 20:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19434

Using the new UBOOT_CONFIG flow, enable a mode where additional uboot
configurations can be built along side the main config.  In this case,
turning on USBDFU for a board for testing purposes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am65xx-evm-k3r5.conf
index 23e302a8..4450ef57 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -5,3 +5,9 @@
 require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
+UBOOT_MACHINE:tie-test-builds =3D ""
+
+UBOOT_CONFIG =3D ""
+UBOOT_CONFIG:prepend:tie-test-builds =3D "usbdfu main"
+UBOOT_CONFIG[main] =3D "am62x_evm_r5_defconfig"
+UBOOT_CONFIG[usbdfu] =3D "am65x_evm_r5_usbdfu_defconfig"
--=20
2.43.0


