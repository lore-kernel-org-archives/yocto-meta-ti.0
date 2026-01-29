Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC59D61020
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 14:42:27 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16030.1769697739086342267
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 06:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=j5V1rcu9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.13, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COEndeB2cdro3DpQelssbBYpU/S1F9uyAgOAY6LSO/S1Ku5igK/6Wd3hN3YyXaeRBl8weJThiFW7jQ8HY24T6Y/3YFZU2FHTxIHbCVUFfM5nlhR002BF7JQbJNEkIF+URKFmboJFHEBdEDzc2QcNFAH+jCvmlpBS+hu36HbGQia0BN8KK2nikN7C/c5CFZj8M3pAVstYL9Z94dtcmbIxTuBrcNV1niyiUpamNb5X0cY8uBHNlCgcUQFtBPYsT/TdMhdrxR04REZGDUtQxTQSdm8Ht/Dzm4Ye6nYPPhmj2a7KEQ69XZ0BIA0oDLI8NOeRvXxOTaHCrVtGjZH8RLNYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPUBr1t0fvZ0C+27NrSb9oK8iQVmXRl3WWHK9pzyvlM=;
 b=ZQtGLH/8ZDVmnHuV6sI9mGFYB10obAbZjsYXp7QeAYUynBJt4ndPLlQQ6JEIqqaWEHe4kmoK6+QEVATGgRf5BL9S0YYsU7/0wGc4d5Jzi5xGz8OjLR1+AlOvnbDdTlGYQSF2exFDCqsqiSCmmk0UNptKj/lOwiC3UqDWHq8kzOCe0NGudWPYQbsMqcWBim+AGyR2Y/BqOeckB35A59CrRTsf5dtlheEZX8hkDe0XkfZ59KgwQR9R9ApiLeleVmrDt+c7R4eYmFTBd5pMPWRLiSW2OLcBdlaAInOW8VzA9Ane1/nEV6l2gXwOSX1oXmmgU+P0ML1VCUWvO+nulpZDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPUBr1t0fvZ0C+27NrSb9oK8iQVmXRl3WWHK9pzyvlM=;
 b=j5V1rcu9O7LcNBKP2WqJcWKTM3abeMJGzVQ0JqIcM2TwCzuQRjdTCjFmDqJAbJhmqgytn8dnB/Dz29VzK8Prx0zHAF17Pl0rCfwhO4iaBXpHIuOD7AZa818QPRjzl5ybh4s3c3/jun6lNU7re6ZbXQMWjQD0G+JyqBqaG7asRsA=
Received: from PH7P221CA0051.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::21)
 by SJ0PR10MB4606.namprd10.prod.outlook.com (2603:10b6:a03:2da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:42:15 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:33c:cafe::37) by PH7P221CA0051.outlook.office365.com
 (2603:10b6:510:33c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 14:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 14:42:14 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 08:42:14 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 08:42:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 08:42:14 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TEgEwH3882630;
	Thu, 29 Jan 2026 08:42:14 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vlTDq-00000007swF-0tHd;
	Thu, 29 Jan 2026 08:42:14 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee-ftpm: Adapt to meta-arm change
Date: Thu, 29 Jan 2026 08:42:14 -0600
Message-ID: <20260129144214.1879472-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|SJ0PR10MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0484b8e8-b362-4738-b9e3-08de5f44982b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sOLD8/BJTOEcCZiOdXycLlKtUKqRwqcgawTxgt15RMq2UG8He5PAfOSQotx3?=
 =?us-ascii?Q?M8WclgyedwZ06GslvaGI2eNyL9gua2hIgQuztrM+zR0AX6MOnpdT3kxTdrC8?=
 =?us-ascii?Q?xvxy6BWV+TCx8nruA64Y+FB3yhx6aiYfTLaM+2jHeLq1w5kwbfeesb+9Vaxx?=
 =?us-ascii?Q?+IpEjs0QXk7ih2kfqghsKyfCwTDzQAIr673MUk6Q/OKBaMXQtNtEI2bUYsVP?=
 =?us-ascii?Q?F6hR7gNTLmdp+YyfOxpZs90Q/Ml3Wf4/s3kREgXA5fqbqdS7+jtRGNpIV0qm?=
 =?us-ascii?Q?uGQTWA9rz1tuVx7kmDHs8XpKeVVbnDiZEdqhaQva1uQefd4Rt7fAIaCz7ZmE?=
 =?us-ascii?Q?4npY720KAMvaKBcbnousgZdztvyqNnFCklxjmG344uOFre9xhsy6xDhnbsWV?=
 =?us-ascii?Q?F5ZnCQrCYLdnG0WGnAIpT5BPEzR3jCLOmbEheBz3p5BtGVaseGO4Qzi+9cf2?=
 =?us-ascii?Q?TQSLCPp5e1QtbiMAlDIh909yi3iJqqbKZ/oVir+OSDfS4qyqYVRJXcjGVBD9?=
 =?us-ascii?Q?T6pYhgbaE/CnCbcZRj23HwNesTBfsIfirHcg8kM8a+B5LB3/nxb1zhEwTKTh?=
 =?us-ascii?Q?1IXNPUQva5NjWsITDhcn+xTTe7gZDXK1Gtr1wD2vmroSxYJ2s7lRDlQ1ipin?=
 =?us-ascii?Q?NQW9Rzy/dLgC8wtOTLXEc4BsqZsGJVHlLu2brGhzHCMiRZtNoMS17l/kJ7s8?=
 =?us-ascii?Q?7aOfcrjF+CkmmaT9BVawdye3cIdyo6Dd49lhIdKdppyG1MW2eRSfEtpHvRGb?=
 =?us-ascii?Q?M22TSjn0zr43mtsQICSSYsj96hVQTPWQ+VEEBXQAZZFlfiX2zihY6KE1WKxR?=
 =?us-ascii?Q?FBGblRuZ+p9SiQ99dVFiYBZKkHo65gIy/5hI4UHQhtfQEVdj2p00rceDVhX7?=
 =?us-ascii?Q?YbKAT+iRBPLpaeo0JnQfGUvGV/O56bIxFcNE8pOtLjK0uxMt0CcvSbWuE8AN?=
 =?us-ascii?Q?6x/AqayuzKfZURLC/PHZyZEd8bMe20gD6ysazyPbFfHNqbPPyWa29NpVsTnD?=
 =?us-ascii?Q?Njh/axgTkuw2REe1LthDjqt8K7eyFyKcfVeh5w3ylfwCrkD8CWsDfTj9LYpl?=
 =?us-ascii?Q?K7fVv9TZN8ez5vs2PPWgeIM8Img82RvLqnel3IY6nlEJGsCdTHLvq7DQQqM1?=
 =?us-ascii?Q?jTZEZQPk6AB1gO5FKgP13IN9B3Zpo18Isk61D+T8kj1hnVlqa/rkxJD4SrIV?=
 =?us-ascii?Q?8zDZce/yaPZmjJxRdjabpl9Jlp2RSrAYRttfr8zL5E2orgfgK3NbrYWgJYMS?=
 =?us-ascii?Q?r9pig2baO8LUBX9iU1GDI2ImUAVwuzBKPEL3DnkHn1QfgamPEWiEKKp9Aj6j?=
 =?us-ascii?Q?/GtuSnZ00Ltj6Mx5PHNh1wlmvLr3HJJCLMCcG4ROMt6KhsiO/CeH9D6lY9hQ?=
 =?us-ascii?Q?T+V1xnVacC/ZgWfQA9IAEDrpdGUaIyeTEEzGfk10HFYN0YvGcQAD+I+d90oI?=
 =?us-ascii?Q?zk+pnUP7cJ/bC08kfDZguic92SO9tN3V9ENU0h7bA+E9/t1pp3/ZzauSnbwT?=
 =?us-ascii?Q?T+BTkZposrQHC/8GcxHmbaaGY98ZcUPe6kJizIsl7/ldyp61rW+xNrbltZev?=
 =?us-ascii?Q?IZdSq91VHP8JBAIwJqS9PniO21q7lkfvTGD0/j+T8z3XisUnSyUmC5TqjvPr?=
 =?us-ascii?Q?bPfnCUqjS9Jia+HY4+95MJyGeAHQch3s9H4k4n+ID2MLM/nWzsu4A/b/i0QY?=
 =?us-ascii?Q?tWmxkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:42:14.7721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0484b8e8-b362-4738-b9e3-08de5f44982b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4606
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Jan 2026 14:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19445

meta-arm updated optee to 4.9.0 and added logic manage the
tag=3Dxx;nobranch=3D1 vs branch=3Dmaster in the SRC_URI for all of the opte=
e
recipes except for optee-ftpm.  Set the new variable to the same logic
as the other optee recipes to fix an unpack error.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
index 55ca0e34..edc9d68e 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -1,2 +1,3 @@
 PV =3D "4.7.0+git"
+OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=3D 'git' =
or d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' % d.getVar(=
'PV')}"
 SRCREV_optee-ta =3D "ce33372ab772e879826361a1ca91126260bd9be1"
--=20
2.43.0


