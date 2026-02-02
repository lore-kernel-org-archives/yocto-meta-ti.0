Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D49E7FDC5
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:48:21 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61936.1770061697247260115
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 11:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vtNQkXge;
 spf=pass (domain: list.ti.com, ip: 52.101.193.70, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kr39Y//FHdwOb7JGxwaR9f5CoHwFO2Zgh0rdDaZuQVKLU4kbKIz44tIMBSurgTLLz8ZYH6fTLUmfGsY9NidaM6nI+is3v6Pm7z+lzT4gY4v+dPTC5G1Sn6XCugJrR1TXAlYGyqCCthaf2rMbLrorYhH9dfGKUhCzn4dxpfL9u/+GCQxE8hzEY47SfFE150oaGdTw7irkHbZsfvVm62z/a4h5mqCIMoCPgef7d8PpwFycvcBjQZXJQ/BEsxJMriAVXN5KPUuwRbx25P2CLENIk8FL/aJbePeBehPRQ8IFsNLfJMpHwv6PnlDaAlG2fZOHBn5+eDNb872riD+GnjSjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYx+PEuFU30XtZPjuyjN2f8+LpUi/SaIdgIW0cwO5Ts=;
 b=P5jc3Q2AGeipJzfyPXAj14huOlRbRAKqv2xPHzkG/IWBp0oF0YhTiKL7PMVcGJsTgUNgk/NYrXBaqDlzACp3o4hgwoKrqdWG7FCwVo7PSzI8mZO9DVEIWCO2Z7raQMEcAwzgWfCjDkCgTfOUH3Fq8Q/M4p+jBRMjW0Se3k3q78RoC8czUjoffS/CFVKHzurcDSsthRzUufJFE9liuIthnj2qLUMyD9gJvkxnjrODkDr957HTI7tSAPspFSNOyq846RJH2xFTycMWWZScRHfKWqDg7ittwjKTj81ibth017uLlKgK1qZIYUShn/LGQWMVzFz9+P9is5WVxNmn8pLzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYx+PEuFU30XtZPjuyjN2f8+LpUi/SaIdgIW0cwO5Ts=;
 b=vtNQkXgerubCfOMlt54cENRNqRvbM+7hUyfWrW7bTu7xeT6OksqxZYlgDGFTEoiCtoYl3/4g/VNNh/i34XIgBU7Q5q+IpzeEfeAmneWL02otnAN6mpFK6Mb8rdeB+okc3asGTYfxkUWXmUcavNQMlvNoJ8QpqGehV8q3zszx6IzR3gGomQ9s2tA3sSDvu0KABb0xdYJIyhm0iuPDg5VlCfzKTd91gklqPFoCRLUPQfOi4CA+1X6bbYu1V8HXB5J38Zblj+X1ik1ul6OgrQoM4TJ+gSnX2N76stoBQFhmMlxMOS4GtGBYUJ8uLoakGg7dCkWkqHsJ68KPgXoLGDNgvQ==
Received: from DS7PR03CA0146.namprd03.prod.outlook.com (2603:10b6:5:3b4::31)
 by PH8PR10MB6504.namprd10.prod.outlook.com (2603:10b6:510:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:48:13 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::bf) by DS7PR03CA0146.outlook.office365.com
 (2603:10b6:5:3b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 19:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:48:12 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:48:11 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:48:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 13:48:11 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612JmBON2288466;
	Mon, 2 Feb 2026 13:48:11 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 9975F136632; Mon,  2 Feb 2026 13:48:11 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
Date: Mon, 2 Feb 2026 13:48:11 -0600
Message-ID: <20260202194811.1717470-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH8PR10MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 861a7a5d-a84e-4621-d299-08de6293fff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5wMtqASHqI/tZLWYjYMT2hgStLFeUI7ETZUi5F+KYGKinL/EoZO8gRDfWjEd?=
 =?us-ascii?Q?1YrCm+C2hYdGyDyXLTVUV6YA43bjo/laREyxw/rOIKlau6jv6bKP4Uo1svG2?=
 =?us-ascii?Q?WSxHqREL1dz/Tac/y+FCNOVN6bGHCKvhZ3fBzugWyry4GhtsIZZXnSj+BgX7?=
 =?us-ascii?Q?xlqVzHbSQXu3iuubdi7MdcYdw+G8yl+InmJTjs8IsErE2XvMtg8r/ACPCHzy?=
 =?us-ascii?Q?UVNitlmWdLuJj1oDc/d8K/9xzlKtU4/qFCe+fHwZX54QaAESppaEOBiwMpKe?=
 =?us-ascii?Q?ITpAQjoiHBEXMBne75kzrXiFmGGaF7OeSLcLv5FTBaFOSsne1LAo22ePqHX3?=
 =?us-ascii?Q?oaZMPUT6w+OZi3oBboBvRvjCwSfFi5njSb1xgkc2cB6uOLhpjIbZmAmNNWri?=
 =?us-ascii?Q?NryVe8qH052caZhvlz2P0/yR8miIFmdROLVYrgUlwuiIf3s6REz3ex7f1C7h?=
 =?us-ascii?Q?YMebuUSK9qKaNZcg2Ra4sy9ZF6CtNw0PHSvjgJDQAPVGEDHqNc0/Gh5Tc0oj?=
 =?us-ascii?Q?FWQKxoapaC3dFSkBHDkn7yWBN1nWUrzBuD/Ez7g6c7oTLIgiju2H3yjoe47d?=
 =?us-ascii?Q?SwUI/i+O7En5jU62QE+cFXNgm/DUWpwrEkTRVtBHfp26x8o6h4XBNC/8w8sJ?=
 =?us-ascii?Q?X2ZMUEW6pHlvh4ipd1Z/UrvkVLcZkz/3uK7GfVAN2eLLGkwooqH2a6FD4xEr?=
 =?us-ascii?Q?hfCHigMnVNcfd8pJbEJX33pLMKJBnOUm6OD6lMgmuRt/DqjF/b1cUbHr1k2x?=
 =?us-ascii?Q?JX9yxk9hyEloYn2xRa8C1lbfe5oTGMprxXJoGt24tLcaIo3EBXUj7HgMxpxm?=
 =?us-ascii?Q?AIZjszyy9GTuuL6cg+HbEc0TgsZHwvLEj8f7HJ/RX+7fhKEMnobavq1OIKVj?=
 =?us-ascii?Q?NqiG4XAqt+tYQXde9UFigF0QSCQtXUv7jAIjAT4QsvVKMxShjZ/KPi9FDK1T?=
 =?us-ascii?Q?f7lhMMQq0nrBg6yu29E9ElhVRzltSYLgKa3XXrJJDjwkcOH2aJ/GFYcjB9Rq?=
 =?us-ascii?Q?RH48pePLZob+mFXw2ju483M8IfY8bLw/lgJEi3Pf5JvxjepKnl7jDiK5tawv?=
 =?us-ascii?Q?pjPyNzxnQ34z9sviq7ODXQ2GNiYySU7YRR7VQXl8uFnwCHnqnRiqBMQroViB?=
 =?us-ascii?Q?y0tyNMkycJ5Q5TOZVuEyWO4d2QhmPJ9BoSb5MjOmGwWF9fmUOLZVjfDHRcp3?=
 =?us-ascii?Q?yZ6Nyh3UTVVUxWmrcF8rdUqZBlWKuIG224MgBDmjJmFk76UJwq938Fc8BX09?=
 =?us-ascii?Q?8S+cfXhUprC9Pxor2OPm3R0G+WYJHEgMwQnLAM6PQzPcCSPgM3NlLyOzYd3K?=
 =?us-ascii?Q?376hjBi+MzONU+eWJ+q84Ac2FsOk+2xHAOPHN69O4DgGzEgtMYTxtv1jd+O1?=
 =?us-ascii?Q?l+LmO4PTU1BpXPo/7NWeyHk/Zixl5enaZ3m9s7Qb4FfffnASDVEGa260X3Kb?=
 =?us-ascii?Q?PneNClUM3AQ3jOuUec6AO5mSRJg/OkzraoMi65TfGjlsvhHhlXIFY+5MVTAA?=
 =?us-ascii?Q?VGckOQ0zYgw+c7w6TKBuHf1q07LVepumgz4vARt5vCwZHOBfb+s94EZNwwbz?=
 =?us-ascii?Q?TMKHksW05W6hsmXZXHA65SbiXgt+GhEwhrAX2WsFvHlPCBjOEuC+UtRGQ/tl?=
 =?us-ascii?Q?ji+tWRvG76DysX5PaHWNjEdD9fMN50PZXUZ4gZ+YqYCAdBVkrdjWdLGBl54Q?=
 =?us-ascii?Q?YoeT4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1PMu5wDLu+AKq0SINvAKRvvAxVZjKpYL6baDR3UioKcD77Y9s0+VbiOlQ2BCapZTJFTknO25PPI2qKD6XmtkzqyriR+rfqNrvXqJ+7GgjfqO6W7rHkfzBsCZIe1gUYs9b2wbgHtv5HUilS3ZYtywJKkmKHB/FaB4zGw+pyXAihRGCZP5Gczd1BTPtrtc82T75KvgzsAw+PsRm/6GsQP56aHxfL476evqzqk/pLnDt/6tL5HfVCgYmmAOk+DQBw4XShZFxSb/j5I8bjELuJFSwVXSV7K9t4X5LoKC90kLU/pyUQWawB3HPSBZuLLLPRSnhRulOH4lgGwzndRlOPEPBaxg5ny2qrkPvH6fBjDRjIDZQTyEI94QPWXomkj+zn1h9BRZwlzQURTHxePwJfvYd6YsDKMs5358mhucdtbeaEdpSKrgGRClthWWfQr3tF3t
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:48:12.6040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 861a7a5d-a84e-4621-d299-08de6293fff2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6504
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 19:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19453

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D42cf2abb5f42b4e8dca8b9df584b816d8a0da7fa..ef2eb76b6504156=
37bd93b0eddfb1e31489117f9
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3..0456d31970eeef8=
678fd20a6683d1acd9fc8da4a
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D2bae13c52d344e96fce42ab8209c068d1e67c944..a3bc=
6dc973a99822f0707b1c9ba06b56bf142076
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D8843c53f444321e22f1eaeec0478ffc0a6191203..da3c0f0=
a33ac00f7138c695a16d90301cf7ec02b
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D2d64b9f10d1d9e7cbd041d613b40222c11291f14..33b7bd3=
6f11719837307a92818393608faafbc10

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 4b6e0d03..08bba71b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "42cf2abb5f42b4e8dca8b9df584b816d8a0da7fa"
+SRCREV_uboot =3D "ef2eb76b650415637bd93b0eddfb1e31489117f9"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 296a5238..ee36a50a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
+SRCREV_uboot =3D "0456d31970eeef8678fd20a6683d1acd9fc8da4a"
=20
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index b1b10aa7..5957194c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "2bae13c52d344e96fce42ab8209c068d1e67c944"
+SRCREV_ARM32 =3D "a3bc6dc973a99822f0707b1c9ba06b56bf142076"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 166f2eac..a02b90e7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "8843c53f444321e22f1eaeec0478ffc0a6191203"
+SRCREV ?=3D "da3c0f0a33ac00f7138c695a16d90301cf7ec02b"
 PV =3D "6.12.57+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index ac71bee6..0565b03e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "2d64b9f10d1d9e7cbd041d613b40222c11291f14"
-PV =3D "6.18.4+git"
+SRCREV ?=3D "33b7bd36f11719837307a92818393608faafbc10"
+PV =3D "6.18.7+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
--=20
2.43.5


