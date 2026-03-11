Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D738112583E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:01:46 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23249.1773241302184752385
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 08:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Pos0X34h;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.59, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wosAf+tIQ/hc46stW0dEBsdXmjgDJnLAD0PfJpGRjEX9pEUXTdhlQGmaHrRGQE715lQICdCnlh1giW4SMOv6HgUIJj93phFcoPcp2aVkNm6lQ5dVu9NDaPTtluVInK6S3YbJb/Wf/9TlFbHqGP6ZZiJFJbBnMmlBiX7p2gAU2Yubh8RryWBDL9OmlBqjwFovENb5rBwbZODchqlXY/OjTKc5JulxxXiYvZp3ZYXQRTOH29WAmSr7rqlOjZLTP9twVnoskMKaU3UTJrph6xLTUh2XsfygTWyJWr5qTgw6LtKY6vwq08R2l1Sm8g3UkjbuOyT6p/MiFgYmTvuQ8qBCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuLNvzixuKPnPeXg5CEuzolLd2d1hIWWABrGFBlMPbY=;
 b=xLmEjuNsARDH3mcRD5WHszCGIYGLlXwtcjLVeC4+40XjL0sbLAIsPz/eXt54bEQ2Fqcjy6cpWb2MH4xw5rrQDi/Qd3AlcJrOeZ6GmV0NeNKC4/qH8x1x0VuLowt3afjxLo4T0MIXVwT/tiHNBWYCbbjt5N8b4gJd/SLy3Rc1OyNDEtPKIrIBgaFvoIW2e7zi74o7SGs8yh+SUpEceLfduzDdR9Z3jPKR9qEVFDKaL7NaRonHwYWixzV+U37SAUCBPggDvXRSxbsS24LhSTMSvdGxjxJWwW5cQp3l0++X/5Ry8eSSEX1//dcrnD3ezwTfIEIxeMb3ICIEUxrjHBiafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuLNvzixuKPnPeXg5CEuzolLd2d1hIWWABrGFBlMPbY=;
 b=Pos0X34hT97lmxtQbqFtFywRdHIR+EGwUNuBN4tTM6dNnmi8hPL3ApWMtrCdYg1ixjPMWvd63f9OXTOxlMha3zm7vUKaJgHbvMe8lQmHs/XLjB88Qt6AJygLadWvdP/YRNsgS4qBNNesyH9NuLXAfF8Aiu8YuTG7FjEcOzwKwIk=
Received: from BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9)
 by MW4PR10MB6536.namprd10.prod.outlook.com (2603:10b6:303:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:01:36 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::2) by BN9PR03CA0064.outlook.office365.com
 (2603:10b6:408:fc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 15:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 15:01:34 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:06 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 10:01:06 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BF137h534375;
	Wed, 11 Mar 2026 10:01:04 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v3 0/3] jailhouse: Fix build issues and QA warnings
Date: Wed, 11 Mar 2026 20:30:57 +0530
Message-ID: <20260311150100.3275513-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|MW4PR10MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 197caa18-1a37-4f05-74a5-08de7f7f1677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	N2U69C9xdQHUhWn9+mNT3WGScibKTqqUQY8URExYCQgWCUJfPYPfVpGFxKWmxZ0P89z7jOl9NIuJa0Do3vKug7nnG+0q+2q0biyzKdPb84ePv2A1KbbNQxxl7kcMGFN3CgfsssHD45g/36MgX7idLwzJA/vXwDC9NapxuknO1If9X5vkFzwyAYhrTxa/3CGIHfeTgqKqOrKzjTcjpHu+vvZwqPJKaXK4jijTQEgv6M8r3gy5MSarng2qmO3aiGrao5PCQspquejVx/HDO7kMl9ZyoZ0NwaS5BVpnd84IrI4HYC+6JJI7M4hzDJyerMtNIEtX5fkxDmjssoH408Aqm7xHaGK/QjnIyVRcLQOATGfHzM1BaQnjojDnm7WJ8L8hFLhV45rnCZx1e4Ro755n6EajhYo5aLDKzn3NjB+kEVRZsZXB7kN33o8iN3TPNLvxoQx1s3UDSYWH6hJlS/gOhzLNV/Xa8x753KFJCYLswqIo59O5sSQpWMYs4Z1caUgk4tEJyw4iOFCXOD4za7PDpEqlpuNKC23CAMlpoUkED/e3AnB77vfddxaRxjiU6nPvfgLpR3kQF2cT8Ios9kDG++woiewMUh8Jv353WlDLHVB3xO+ibhPfhlmGqLBdngSWhMQR9dDiitEpN8Cne7P4BrH3QhtXu7/z7WVpnW8nZNeWng2IWNdBvCReDpcdjdcYvNGGfF7QzXwnuAPZ8BvU61x+f1tRcQLLaXOKh7Tej7YkEugOtYOT4tHBShQaDHpi9fQndrAPAGsPuXCilN/ULQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UVx01tqI1fZPSMJzr/Ty9BogaZSlE24yqk2j3SnDu3Jez4qkGP84UgHPHntcUM3f7gjyn7JdVKQ3taB99kFv5fYbMHTtvZpRMyDFeIY2pjLwafRFsTDK56+GQFz4PRpCUihQzISk4bRJKHSmaEvilsvaWljK49eYU/xdvuBEGSB7shddUf6Iw5J0fwlMuKj6mtq0oPjgut/Xf5tRRUGXG7rIlZh9JH+y+OyFDGNTjg3pXQiPBv/JY124QPWJFGcy6dGaM3odxO7ZGUfzrHhZ8jLrgU7ukiZIx1iW9+z0MVU9hPDmu9QHMWQwEc2Eo+itdWy5ls6ft9AfXq1qqlY3zVcxWtl2d1U3J++EVZJjGUryOvjJmE9ZJzis1CNKBn+WTXdTdd3EougxLZPy+/goA0+QobwUFgJco8U9ypOHWOOJVLbGMyH8/Jh4vRLawme3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:01:34.6584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197caa18-1a37-4f05-74a5-08de7f7f1677
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6536
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 15:01:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19701

This series fixes build failures and QA warnings in the jailhouse recipes:

1. Fix JH_RAMFS image path to match current naming convention
2. Fix buildpaths QA warning and remove do_compile override
3. Inhibit debug package split for bare-metal inmate binaries

These changes resolve build failures when searching for initramfs images
and eliminate QA warnings related to buildpaths and debug packages.

v2 <-> v3:
  - Move V=3D1 into EXTRA_OEMAKE as suggested by Denys
  - Switch from 'module' to 'module-base' + 'kernel-module-split' inheritan=
ce
  - Remove setuptools3 inherit (not needed)
  - Remove do_compile() override as suggested by Denys

Link to V2-:https://lists.yoctoproject.org/g/meta-ti/message/19680

v1 <-> v2:
  - Split buildpaths fix into separate commit
  - Improved commit message descriptions
  - Added KCFLAGS with -ffile-prefix-map for reproducible builds

Link to V1-:Link to v1:https://lists.yoctoproject.org/g/meta-ti/message/196=
74

Mahammed Sadik Shaik (3):
  jailhouse: Fix JH_RAMFS image path
  jailhouse-inmate: Inhibit debug package split
  ti-jailhouse: Fix buildpaths QA warning and cleanup

 .../recipes-ti/jailhouse/jailhouse-inmate.bb  |  3 ++
 .../recipes-ti/jailhouse/jailhouse_git.bb     |  8 ++---
 .../recipes-ti/jailhouse/ti-jailhouse.inc     | 32 ++++++++++---------
 3 files changed, 24 insertions(+), 19 deletions(-)

--=20
2.34.1


