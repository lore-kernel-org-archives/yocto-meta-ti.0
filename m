Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA9BF417EA
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:44:19 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16150.1773067456242456694
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 07:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DcLKZKxE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.12, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB2HNHqvLw16kShEllQVvoQJnfqCsq0cf6vB35esCdZ6ODlFFWUzp3n0QRoCXaD5Q0qZ0toU+8/+wfrWJoAVl6cjn6KgVWsI/XbGGt0KozQVl5ok+UDhnVuRn1NfN3VPMnqu3wzGKIhB5f1nA2B7c68zM/anejB3cLk3m3Uo4dabsnJlTJRegq9sIdY2aM7XlWfWZ3U3Yxk9FQeOnhZ8QM4sXQIEssOljDbduF9FlRb4YEsdTD4Js/VvtzfRaMlk7yHscjdTZAMiwuy6iJT/GiP9UuCNaamobNAqjcBk8OVfr5T6sAfnOMDuEJnHfxWtF0QytRkeZcNLCl4S+aN1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7frFO2vOkLCUXmUQkL5bbiW+j3nXZIbsJJyZdLJejA=;
 b=sw4M2OYxGZvszM/8QPnIDxAMMy4HkJIAteSaO12YzcZ1ZMe3V1avAwk37I/jFYjVPhpcSlec76c5Jetsj3CjR6PRR3831iCagDQZqYG27yFTF5FkThQnNEVGO6LMpKk+2HemOGZEuRII4R90pUyVwcnmQ/9hT58k9YdfGlvkoawWvXRTFUJP84lY6nSKUIQuJYc58j6mE2FP2qsdrzNAPH3lT0QoX9EoeRLaA/AJolqFIZMKP9vi6cpzAf2CXZypxSo2+LphtSGoLtyWebqqA3c1+eKI78RT6wKoTKP99Cg0vlq1wPtSluJ1EF2g5WyTIuLjqm0egAXEsvg+NUr+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7frFO2vOkLCUXmUQkL5bbiW+j3nXZIbsJJyZdLJejA=;
 b=DcLKZKxENRQY9qPQ8SSxBU2WLkeTCNxhfqkU8DNbVXj2qZltrdvF8x/5L7HQsSf/xonfqlKkpZ5pnhAOHRmifIbaI0+TCPJsoqVGn5rwSQSpCI4tS5yHXiQDsmnzrukGHAfgguhhjwbdO6XSFEM3BjYYHh8qA99egs2cR0WQ10w=
Received: from SJ0PR13CA0194.namprd13.prod.outlook.com (2603:10b6:a03:2c3::19)
 by DM4PR10MB6839.namprd10.prod.outlook.com (2603:10b6:8:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 14:44:13 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::7d) by SJ0PR13CA0194.outlook.office365.com
 (2603:10b6:a03:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 14:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:44:11 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:44:05 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:44:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 09:44:05 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629Ei3V4778250;
	Mon, 9 Mar 2026 09:44:04 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH 0/2] jailhouse: Fix build issues and QA warnings
Date: Mon, 9 Mar 2026 20:13:54 +0530
Message-ID: <20260309144356.2709949-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|DM4PR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b34d518-ab54-4953-077f-08de7dea53a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	7Tv0ZXoxC6El13c6Iw3IEysymRh4TylJceGStXlyiKmibkqdW6WiuFPJ07E4q69XDZ+OsA0RkmMsJltBn5F5uV3LSlh4WDSx1kzu87YyScXup09hbks5aY2+M79FFb9Hx5r771RkMcJgs4yNlDHnSy3s68tNPrr5P9XbrsLw3cuV4V4wr08ShgVSEjNfKF+7Q5PJRM9mZxuipeW9cEc+FK9ffIVxQR3EMxfpR/CISyzPEXw6zPGP3SIOOhfIvaG8CILX4K1wGbi6CvBJqf2gy1SBtT54dy/IpSnO9/O0tT30KouFrrE6aFJQ0bFbSCxtBgPPO0VVab0+fqaHaEoTp97aq35vmeiAisqHBiqy9NwDdQwq94l3KM/AJATUKQyLb+7Rq9oLHG6lBVF80Dfvy3VLKo8tl/BmrA+JvW1j4LwyGNmEl2vJ3/F5GJzmUWKMNjkDFgeBZCnvxpcNoCV1zUqLrplSqZzS2tkBo8jwIJhPc9MKrBxTjWRbfudsC0g57uSwAKVXJL/YBrEI7jKXvScVbIhfXdeBIarZPs0bLjyYi9Y2+r8/NEL/so55gDXdbys4gLhMD3MSBi6cuLzJVNsO8CqCGoD49axafUzigLMabzYgBJ8+HTwvus1jRHQMRnGE16CPONR0fDNLCzgK+AgRjFBIDZquKrUahFlCz5SPEXthba4+epsQb2FTejFQMsqMl6zhLOXD8MorYnSxsyXfWQEaQi/VxhFNj4j6GC7Ugqg6BhKt5pABhAHK8h3miBmPjG/iMcPdcsmYXLqDHg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BN2dnX7ixuieH6sKTRNPAnYyAgjKHKJa3JyYH+B+0Z55HQ74lK0I8wwOeJrzbaqVLzhU5ofR1AMx8dwh40H3m+sNLF1oPFqwpohDwi51c8NSTHld7QVW9qChKWStIjsBiYcyU7VTvf08E+pkLa/HT4Q+v7euqTMTQEy2tui5was4XByWBKKbOcNNDX1anQBeFg7TGmJdLx/b29pwcx/85Mt8W3/u0MK9L19UMQqeew9sT6p4v7hHaX1E1m0X3Hr4y4glhlDA9nRxMQSNiZ0ozqfh0RF1CJpmtrZ/XTGecuDC0URIJT45pbRIoAypn9Kcra4NARjm4vV5tskuOqYwLZgzrFVGWf5HQRY2+kLKquFOVEZhjP0laBgJBtzeljv/EMp5PGmkfdVy0j++JrVnFADYfl4etgIdHllrowZSLSomIaBx557e+0EVSL3JkwNH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:44:11.0741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b34d518-ab54-4953-077f-08de7dea53a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6839
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 14:44:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19674

This series fixes build failures and QA warnings in the jailhouse recipes:

1. Fix JH_RAMFS image path to match current naming convention
2. Inhibit debug package split for bare-metal inmate binaries

These changes resolve build failures when searching for initramfs images
and eliminate unnecessary QA warnings.

Mahammed Sadik Shaik (2):
  jailhouse: Fix JH_RAMFS image path and QA warnings
  jailhouse-inmate: Inhibit debug package split

 .../recipes-ti/jailhouse/jailhouse-inmate.bb           |  3 +++
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb   | 10 +++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

--=20
2.34.1


