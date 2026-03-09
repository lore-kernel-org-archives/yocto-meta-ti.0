Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AE8F4181B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:02:37 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19757.1773075748030698223
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 10:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bdQKfWw4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.38, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzeq1FBKl1MVko035y4xq6vv5xFxiyS57crGh1J2/aayT4Dd8oL2k4pFuOAbuBpDJ7mqyiRi9r1ok3B8o9u6Fjg58nMeb+NkzgZ3CEulyG+sehXykLDQ5yV5g4lPDxGfPtVLPdHHxqsRwGQj2iIQPb2wznigeyQRKjqpLHANBZMfsEq06qBuJrGoi5enpYbtOGlKFZwXALx4ggmaWTSFqEULTLM/53uWSulqAEqwzHySHZPhRyfdQtBO9CkpIfiTK395Fbcp6fc6AoCxdwf+QsTAfKgU8n7p70SiHPu3PNBpIzZWbNMskCnNWkABmphqKV7612fZN3IwLiV02sXgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6+E6/J+L5pYfG6SBWgtuRDYvX7wKe1SMmyFCKna/ro=;
 b=o1gmo0LVCvABfjTOIWFX3S+FrTHA+LfNnh29SAlP2Un/OHAVf3FhbGMGg8IzBkWb03YIYv29DAX2Gn6ChhwLoTcZ+aLp5BN7XvI8Mwop5E0ruDo7Eu36sq+boZ+j90ULiQwxM02nrv2sBbK4o4Hk4z8zceZApeoii9LLMF3TlfKTKBbvCDtx7cecMp4O+n0C6IyhzJ0IPSbmaNdYulRAIY5ekTnhkKmxwUjvkovXeszLC0C+9m1Yh8pPwyIZkNyUfjbWc27Xj9O+k99E5WWQWUX3pXoe0TBpvu2hnEpSgfYO6Rw90j7J+0/SACIcpYT2tFhTVYIlFiDtbwHE7slVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6+E6/J+L5pYfG6SBWgtuRDYvX7wKe1SMmyFCKna/ro=;
 b=bdQKfWw4KG8xdmwTsrz3m0Hh+5/8VRXMFsoXRoUNW5S6jWSdIghMKtMB32KeIh5ki25tviHfh3E5g72yUDWAaa/BwOV8NMz+wp8YdDQk9h+iXeK7ETxqHtgV8vsxrNONOOi1/dB0ZkJFsEYBpYCOo6oqG1v/tBuSOv3G8OjPVrY=
Received: from PH8PR07CA0043.namprd07.prod.outlook.com (2603:10b6:510:2cf::28)
 by SA2PR10MB4489.namprd10.prod.outlook.com (2603:10b6:806:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 17:02:24 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::38) by PH8PR07CA0043.outlook.office365.com
 (2603:10b6:510:2cf::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 17:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:02:23 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:42 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 12:01:42 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629H1egA977422;
	Mon, 9 Mar 2026 12:01:41 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v2 0/3] jailhouse: Fix build issues and QA warnings
Date: Mon, 9 Mar 2026 22:31:31 +0530
Message-ID: <20260309170134.2779295-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SA2PR10MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: dc126fc5-c56e-4d4d-07ca-08de7dfda25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	ySAoYMzyMWtSwkgl0FTefvauWD+tz8hFKYZ95Mq3I0HYqvc4cbfsDGyVLkmkHox9GtoTBvlF1CiCNbJjCyv21uYK+xNE4FH/0ErcWiAR2pOGOl4FsLklwf7JN8pSOGVYUotsW4mOLoTWYnaJITKSvDaVYyPHkGRl/ziXqym3E1KsLuOmXtBHvWEoDC2l7XnQFL0jzT0VWm/4ETcJdCwGGUrgDlBI0NAunVL4cTHX7Y3bttRtkyiwat8gmdnyVpEDiikZIAYcM+G1T8VOz+yEwC0FYLctLNB8ZybzbSyXIqX1DnYSG7avjoPzyHn5BU3q7zyywIxDuM8CWlOyfNH0DVFqeh3iWE6oPULTIimnWHf6PGu7MbBnbPbjfPy19efnKh7FrjBpvPSTAwNMQYt8ZS55XKYSNmVVVM4P/Ysiy/zbEpo+gOEwiEl87nimeCRrkQ20AfezDqRpMhpxr3qRrKa3lZC9ZM2lWuWEZYoHy6sYNV/rTgnQw4PqtYlZn1ywregfuROmF5kAf0YY8hf+0VSruGZ1wSU/6gfyJQDWuMf5fJm9CJX6VhRkXC1Q0n8EPeKOGOk9LSDiB5CUhBlLZcAve7oAO/2UdZK8YKRhi2xxfk0MoZ5+uMBwPJsKgUbtmbADCzKA7hbMV6r3vzvryHSNjmx3LScpUNfU/On7dpXZlGzrSyYKtRuQw3SiLOmTlMVDNVw8TYXZZW2LLi/qD4L6VSMuQpGTS0M7/Y8cU1lSUhcsU8NvT5YetR/Zgg0/d+vF1G8s2dGWBV17mG1I+g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zQixOEsC6Z1sLVRhmkRUezan7uZ9s2EyZQh1EBp1yvuzQ6Le6MMPkFZ5niOBlyc4/MfMsCe4JCv93uuv+BclAkeBc/wBgE/37LRGueww2uDyTrE/fg7ESJsJE2erSRqzazLPv83/pLp2Uth5Umwa/pj7O2+al/DtHh4ylg2h2swDjlb+orvDTpGyZej7HBGR2A46G9TTEum2dPzzafr/RJM5pqh8kFxsg0XneEpfqHgdLGr9P8eFIorMO7vcLkcGNvJ7HHZP16KVFpj6CVY3GO8IqYbnROqo0qHF5CFX9Nnhx/GC4eA1gRErZTBkpMlVe4juS7rA5UcKxLaGajS/ZTCp7zGuAxCdm4qxxd45YFUDH3D16H12uF3SR6Acm/+mnxvEmmSqdoLkfR0CQBoR07g5vqfmmH9f1nczESkplvQRaUahvcdh2e1gI6g9zJb6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:02:23.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc126fc5-c56e-4d4d-07ca-08de7dfda25a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4489
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 17:02:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19680

This series fixes build failures and QA warnings in the jailhouse recipes:

1. Fix JH_RAMFS image path to match current naming convention
2. Add buildpaths fix for kernel module compilation
3. Inhibit debug package split for bare-metal inmate binaries

These changes resolve build failures when searching for initramfs images
and eliminate QA warnings related to buildpaths and debug packages.

Changes in v2:
  - Split buildpaths fix into separate commit
  - Improved commit message descriptions
  - Added KCFLAGS with -ffile-prefix-map for reproducible builds

Link to v1:https://lists.yoctoproject.org/g/meta-ti/message/19674

Mahammed Sadik Shaik (3):
  jailhouse: Fix JH_RAMFS image path
  jailhouse-inmate: Inhibit debug package split
  ti-jailhouse: Fix buildpaths QA warning

 meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb | 3 +++
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb    | 8 ++++----
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc    | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)

--=20
2.34.1


