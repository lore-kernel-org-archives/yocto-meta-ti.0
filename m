Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BC8D43346
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:22:52 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128.1765484563102698786
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pJpjow2Q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ57+NR3eUBpkh+b/ZbfttMAp2OrHBYLx/t3P4LyK9MauMAUc9DVarDBs3l3I8N/XuQrqN0pGYa69viaUhB3K2ai8QoHTIlos8f5vaqm686RojsQDHOC8TrJh9sBwPYxnywDabj/8qB/48T2mT7/RsVAcCWHWKIQIXHIe4CV4vHJiFTve/tahNazohFYEu5NPD8PHjmLPXDxIAMZKvGIRxLF9V1+J7Pmp1GTkTwL7blF/o28+6E6vLVgL4hN9MEQpuEUKMF/HEJvxTz3xaQQA7QAgxbh3ViCVio9aEdTkpA8ONa82cRrVjEXsHEoM/u4FZhEdLRcz6TKJ7sxjSPpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhFIgxKGs1jJdGgSBDgpmNmVVSZTBJAe+py8QAygcGU=;
 b=iyRFThC1w+bW/Zp++UUzN6TftqO0KjAnViYrpaA2HV9aydW79d85AZMI5Bf2o55MFkkWPSMRhbWNXs6z3UEWvnD6pgB71a5NMKSfgRqVYtcHOF9FgbXOPHQiCpoGluO2rmjShZl3foTWBAqQ2+BXIMj5MM4BO+A4gzjC/WbP0jHj32VltNLR9EfNyhMzA7reRT9nH59IEZwD83y0FARpPGbZ6t6AXIPQ0yAARWC8OFGTfDmOUFgfzW6gDfLBYM221pyO7WOCID2VcKDoL/2W94/coT5EELZc5KfceoIWQ51tmvHNx8vFQ8XAm6LuBcCB3YbWlpN9T2c8wIdu7i0ORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhFIgxKGs1jJdGgSBDgpmNmVVSZTBJAe+py8QAygcGU=;
 b=pJpjow2QuvXjGaBI6Iouwku33eWzlFNZr834IrYZ2aKk7cdkTHcdSGSdKM+aAZcObvDPhQ9TdURUTREClmd1ExhO3KOwT9sEj4i7uFW+xJcVUHREbwKyrRpJm5GED+TH99sZEO5c0S6m8GIc2mloixYoH8397FBwMm2ffT7Wh6k=
Received: from SJ0PR05CA0189.namprd05.prod.outlook.com (2603:10b6:a03:330::14)
 by SJ2PR10MB7653.namprd10.prod.outlook.com (2603:10b6:a03:542::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 20:22:39 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::ba) by SJ0PR05CA0189.outlook.office365.com
 (2603:10b6:a03:330::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 20:22:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:22:38 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:22:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:22:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKMYme1025142;
	Thu, 11 Dec 2025 14:22:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTnBK-0000000H3KX-0coR;
	Thu, 11 Dec 2025 14:22:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/5] u-boot-ti-staging: Add initial 2026.01 recipe for LTS development
Date: Thu, 11 Dec 2025 14:22:31 -0600
Message-ID: <20251211202234.4064350-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211202234.4064350-1-reatmon@ti.com>
References: <20251211202234.4064350-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|SJ2PR10MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6100c299-89df-424e-bf8a-08de38f30747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ihM6p81n36YddXcJq2QuNpnA26569NLolqwS9LPq7LfZkIMf9qpEk2GvmBRW?=
 =?us-ascii?Q?Gtlugo2QVn6XHwS9ZYxFQbZ7A4xmJsjg7kgDZnsXZQBwE+6gQCZxI9ydf+Wl?=
 =?us-ascii?Q?g98bIcP4mITL35XpWuOgi2OgQQxeJgRO6cmUKsJdqbnsqw/QEXzciuNoMsa2?=
 =?us-ascii?Q?Vf1vnkD/qU//JpyoMrfeS9SKJi4lPo0FatrI328+kGaTHnUc0fctPtSwL/1W?=
 =?us-ascii?Q?mFMRKyEIlgN1zB+/1o4I+Zr8ElhU/45BumcPfOsCvP/F+v74WvRevmvyfHlY?=
 =?us-ascii?Q?VGbnaCjzJp/T3+jfJLuq25bTvI9kzxk3j36RGxGaOj2IyKJBvU4svnnaqu3J?=
 =?us-ascii?Q?DwWygUCUcBJbcYyjzPGqysNt8BrdlJDSy/R28zuJerah+grCirIe39Ki+ayU?=
 =?us-ascii?Q?VNGqwDnMjH+6rUodFvwV7u9RPXg6Gv7UoIQjCdgWSr9KexwiSrutcR5A8QT9?=
 =?us-ascii?Q?ClSeR9I7hX7Im7S3HITayKw5qF/ExI+Rlbs8g4qiyMxmZduN+XYUjux5U+BY?=
 =?us-ascii?Q?LKnCGICjeglJSAadpwHdlHzER0Ckm7Kg0Y/lxN7hd2Nu3i+H39QpUUBSbxtZ?=
 =?us-ascii?Q?Rv9mzpJwZ3SGYKE/iO1+4zqA2m49OhDIU1EButZGJ2846pYOXPcQxlnPAH9c?=
 =?us-ascii?Q?Mi5IKSuu+D9M9XvXM/5DUlOyUgyV4vhD2rbpyiVHqwANEelcgS/wqT0BPmC/?=
 =?us-ascii?Q?YiMTU0yaJGtovWLFMkG5kEhApGO30I/r6D6nZgF+mImLKp4JUD8U2P/+ZH52?=
 =?us-ascii?Q?N29Tk49sydKPU7lUHo5vFFDdpTQYOJS8kSEoOaIv+q/dpHRBiCW6joShbcVQ?=
 =?us-ascii?Q?P5JYfG2A2hRiZL4H+ScxPeNUr26xcHsd8BYD2mx1NRixAHKHP7UgN9R9ksKr?=
 =?us-ascii?Q?mfqS60P9HFXPTHmaqo08A8MmnEns6bumCDRWV3cBjWlfZeKj7R0NjqNvDgDG?=
 =?us-ascii?Q?w1jJTpw8tF/rW4lHdoV1Xw8fzNhi3DDo19rBlP9TO5Z0AAo8NJIT9LmmUZUg?=
 =?us-ascii?Q?h1Cn9hfWdTOcQTXIU1xzxKDgFMPR2/a5Hpcy5Fm33Cz/7t/gyMcpxLAbwDw0?=
 =?us-ascii?Q?OZx3kqV4z9FuTDFCy2QAW+Q8zTdmJJEmR5DNgMr9yobsK/xM6hQQ/oiRHVF4?=
 =?us-ascii?Q?JisLDPszoDIgW3JYrvLrUQy0jiZ66/qofNlfuaEyX0sCTctVy/PR+cCwEIO+?=
 =?us-ascii?Q?492ZRKLjYuWA2XJxRr38MGuCzISwj9jXzHho6OnNgsXMsq4KIram1zgE7kU9?=
 =?us-ascii?Q?sQS1f56V7YzwdY+fmSwnObUQVO50qzeLaVQfIsJZcMMD1D1qnK5gIDk+rawM?=
 =?us-ascii?Q?aRfuUi/7NLaN0E2SiNVC/Q+JjRaJiSdtKsncDbv6eiOXd37eTfpGOYUkGxKh?=
 =?us-ascii?Q?uuHqs2Ixj1geI/9BFUP5JcfBrKiCgnDBApfrZ4Qv1QblUzF6HBQL89cZc736?=
 =?us-ascii?Q?GmAbnS1/TAzQB6Js8c9Lvcy+7SdlzrEh4zWdkwRmOj4OregJVho5fvnPG5C9?=
 =?us-ascii?Q?3zjbkHIOEV11cUv5rFME9quIK0CfkHhsqVaIYEu6wWzqiH0jc8qigRWRbXxE?=
 =?us-ascii?Q?F7PxtGCogL6gXkpgmsc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:22:38.2797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6100c299-89df-424e-bf8a-08de38f30747
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7653
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19349

Add then initial recipe needed for 6.18 development.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No change.

 .../recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.0=
1.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
new file mode 100644
index 00000000..41adcb2b
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -0,0 +1,9 @@
+require u-boot-ti.inc
+
+PR =3D "r0"
+
+BRANCH =3D "ti-u-boot-2026.01"
+
+SRCREV_uboot =3D "c5e6d2ab7eba68cbfb600cdc131c0c375ced2ec9"
+
+DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


