Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49986CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 01:03:26 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1538.1762477397262184096
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 17:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sYqgdbsU;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.42, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ic+ciJC0fDlO03UhCIVAXBVNnWjuKW/t1oRxBhlkm3ZPK2qxeE+Kto1QcB+BR3JaAZx5SiSPJJ03M6WlCQDJZa8nzUEGoMHmwuDsIRMweJV1YYfSMuanlvymSuZsrNu4PMd3ALrsGAmhhbzvVQ62jLYUY/3JmwZUWMrgKQeMUOQ9XwjRNt0sJHETfGVR2hq/cbjmrwvl5Uc/MbF9rX0S/cUNAN0IK5vsViIuIoNKDKILzHG8x0eaPmm+H8z6spTzBe+7Sp5vdWDJ8H9h74Q4tI8P+XvGZoQfopUxMPE4X4LSptQrqm0HYjFu7uDPUlZeJU/RNHY+eDvGHRrvx68+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Gd16foeL/60pUw555p2Si1+FOpGpTSIUhwX4itJJpw=;
 b=duFwAFKaiRRmkuIOe72VCV3oqVutkCx2/b3u6sDb/Tt8bwlr/SAMaCdgGfyztC+0jNmhfndCqb8iUwTM/X1eUnwf7wnxNmgL3lvr68iOdoXwzXcV5P5OdWojiJlhhdoM21TVOhvaAgsz37s5tcI8fcF53nmt8fb6J79qEqUmt3NA0iw3idW+odmolscqQAX1hPp6v3H47UbPoU9OOgGHP0k3AyVE92BMzF15ZVvU+lc+8SPP1EWiK6FSCb02Mf0oJJgWABqk1F8XOopXf+GqLPJRGY/TBunrrkzxvt+rEQhXIwAEndCU8jE8/3OhYqzsQt6csbsLBRL32AuEDX2aUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Gd16foeL/60pUw555p2Si1+FOpGpTSIUhwX4itJJpw=;
 b=sYqgdbsUOR338Agqv9wgjzx4k5zW804MASA2w6rkr+zKcHPCL89z4dRWVUqep4U87HB30vIQtAi4PLZkKjGDNRLjaktfAAM2CZHj6s14BygiqO6qh4jCc49OMhun7M5Vvf/Z/Tw4kN/IJ6iUbF9ucjv6V4AGjLpHYJx6Hvpdrcw=
Received: from SN6PR05CA0027.namprd05.prod.outlook.com (2603:10b6:805:de::40)
 by MW4PR10MB6510.namprd10.prod.outlook.com (2603:10b6:303:224::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 7 Nov
 2025 01:03:15 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::dd) by SN6PR05CA0027.outlook.office365.com
 (2603:10b6:805:de::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.6 via Frontend Transport; Fri, 7
 Nov 2025 01:03:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 01:03:13 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 19:03:10 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 19:03:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 19:03:09 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7139pl2134306;
	Thu, 6 Nov 2025 19:03:09 -0600
From: <rs@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH] layer: add github MIRRORS definitions
Date: Thu, 6 Nov 2025 19:01:16 -0600
Message-ID: <20251107010115.1974047-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|MW4PR10MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfd22e2-1518-40d7-dd25-08de1d996d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Qd5TtdQwCFZE6WjV3TBXhFWpOkVFOJHb24w/M3MF4AJuzdwe7xVj6882bct2?=
 =?us-ascii?Q?9cqVHrTzceCX91NxuUFcxt8Xuz8ElCwzpHbUQyRpp4xsq013EAdwvspuvb0O?=
 =?us-ascii?Q?wRptsIcJEwYAzSDEpg0DMjxbXdF7HlVsJMkIcsui90SNr9z849gq/cWmz9xY?=
 =?us-ascii?Q?4zr3yn8Dl+vohljtkE3RCcZfHHtiJjWPPetm3aAWJowBeTQlvMLtB4DqwTRH?=
 =?us-ascii?Q?GwB4SAygO1+RLWQzqV/iXHG5paLcQYCzPGXhLmZ6nMoRRNOfWrgUPQZiylAU?=
 =?us-ascii?Q?LWjgfnRf/W2gzqUBkLvvokTbPE/gQl72vXnDt+KB/1yqWIOfRaI8+N00kce3?=
 =?us-ascii?Q?1j4a7UvH6cioPpIK3kiMEXD6oJf2w+GXVMnPzzYGnX7sozgsN8GKqtx4Vh1e?=
 =?us-ascii?Q?oIQoox1HTE5iZoxy3wDJN2Zj96B+96twX3yNiSxkbAAQJhe5JU47zYwPiPPf?=
 =?us-ascii?Q?8fmKD6y7rx0boYIZKRHOgs3jiCslFtQXTI0NKO01Cv+7IRdEZcc9colxi2zW?=
 =?us-ascii?Q?sQlmcNrl9Lvak6MFJ1uCP9uS9fKCKxi6j928lGvSo3fh9eXNJ2iC6mSQl20h?=
 =?us-ascii?Q?0ZLetjeMbDrgXYbXCBcdaulCAADw9VyeCZUyTczZcI22lXu6X+Tsliu+Ng18?=
 =?us-ascii?Q?JemtbaftrY18YfENmGLgfMUpyFkBpdqjhZUjsg0F3LXcX3EYl5rtzloToVyL?=
 =?us-ascii?Q?P6jOIMqHHiAze2qYiQ0Z6jHdWTvAk/eg2+qKtlSiDaVv0VZeJlND2bmGOnl5?=
 =?us-ascii?Q?A2GTaHUhJwpw/9xRio2tIui5D4iKk6+r0/ZVfwMb9/+6EgPHgGel6DjjGV0Z?=
 =?us-ascii?Q?5wBwZBO4IGQJoz8qtzf9gbXgABVJ7VR/bJmesw/WOWr9rdZY2jnjaJWIs6Wp?=
 =?us-ascii?Q?NQkqfqzIyL97M1EhrWv753M3LDVTIn9+jJlB/vgNdsU355F1yG8iAKIhpIFR?=
 =?us-ascii?Q?ZmPjWJKUfuqnrR4Abwg0Pq0PSGK5D5QAriGgSLhY7isp4kUvKe2SQAAaIDMy?=
 =?us-ascii?Q?L5WTzGMW8MSRaqUZ7dm0fE8KxfBn8oRSpQNp63oncy9uldxtRUv8uu78jAOo?=
 =?us-ascii?Q?mDJdv7hh5yCYv2+JOYo6DnZuf5TpJ30RHzllYsCtQ8KSy2vxMmde2aR3rn3e?=
 =?us-ascii?Q?uB7dKHXj4VoN3SiKKWlaKeWXQ+V3G5SZfzWti0FFJnjYSTRqyMYPnS3CLEwJ?=
 =?us-ascii?Q?yOPglPI9MQs19SBB9Y2DMvHn2cEYSYBvNr0bCdI9yqXvmBvjOvFmJGkFKJIT?=
 =?us-ascii?Q?Nfr3KXzFSmTW2F7BQKwD4HA6EtqKt5tdVvC7d3zdYXmeq3UQJR0Mnzs6T4+J?=
 =?us-ascii?Q?0AjWd0fNNvpn/60sObgelLkEjiYsHTxEVGGwpjnFW9vmFWWsEOQK+qsS0OIs?=
 =?us-ascii?Q?NwZpjNFES8uKs68HvqL/H6Hf+PuoWZWU362RqQ1ge8S2MxHBJ0a6kTP8Y0Cc?=
 =?us-ascii?Q?WYvbhwbGQbKSo0UTOykDuAhS0eS/bea54VS8mwgN4FfVcIQJC4mBB0+1a+1z?=
 =?us-ascii?Q?G/o5tOE1Vqq0E6eARL5q7oXpllwA/XQQRJiU5uGPFVBJDl7HlIJdTa8cEHRx?=
 =?us-ascii?Q?byohS1/xVff6BlqeD/8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:03:13.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfd22e2-1518-40d7-dd25-08de1d996d2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6510
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 01:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19233

From: Randolph Sapp <rs@ti.com>

We have some projects mirrored to GitHub currently. It makes sense to
add a MIRRORS entry for git.ti.com sources to fall back on in the event
git.ti.com is unreachable.

Placing this in the main BSP layer configuration file should be all that
is required for this and any other layers that depend this core layer to
fall back to GitHub.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Tested locally by making git.ti.com ns lookups return NXDOMAIN and then
requesting to fetch linux-ti-staging.

 meta-ti-bsp/conf/layer.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index e3a28628..d87d040b 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -36,3 +36,8 @@ TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
 DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
 SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
 PSEUDO_IGNORE_PATHS:append:ti-soc =3D ",${TI_COMMON_DEPLOY}"
+
+MIRRORS +=3D " \
+    git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;protoco=
l=3Dhttps \
+    gitsm://git.ti.com/.* gitsm://github.com/TexasInstruments/BASENAME;pro=
tocol=3Dhttps \
+"
--=20
2.51.1


