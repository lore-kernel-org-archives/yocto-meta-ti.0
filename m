Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA3DD6CFA6
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 20:31:32 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47451.1769113883231055135
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 12:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NJ1ojang;
 spf=pass (domain: list.ti.com, ip: 40.93.195.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5LuyJ0FIlYhr3TaNEAkEwTtkzsUQRecAzdXFYyOch8NbzFwQE8JHGRmsQrHM6RTTeOXV2iyelOU7p2T9NlFjPMNs9yMdjiblfULn/Dqy0QuiiRsjO+fV5sxDiOLdwzR8fLJIFmzayrMhPQRF3wQXV/jR/l5U20DNcyXeiTCbiKLwOyRo436JPSnog+s8MsSh/n4VCa1ndkDzlfKbaNxFczD+5fASaQc6dvyOkyoJBndaN70UpOy0NVxe1ltMy2ARjDdGAfqz/vhcdhuV7dzmr1g3+HP0/LNkVpHiRqSr223DNcQkfvo6u/FDRx5QTKZfOHexr0KFIgeRRoOXCAyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVvyoYgMs45/f+RriNwZL4c7hvTlyUXMWsiUjtP5bgU=;
 b=wRCgH8O4qNvD+5ygLzbApvoQ9t2w11+sWxaAFOVDKAkyYXgcxBFoeb+33PwJPqa/bEk6eAusoPrETmJm4aHUZDn9gBaQy07JKZViYsclndiIbqjj9wT38E0XvstI5rfXj0uK3E0yhs5qIZwZfM1t/xcil71UT8BhMgf/xIQyinsqQUgu8z2yMw3BCuCDc20eg5jQyxx6wv1yMchMO3OXl1eMxshOAL/Ri/ty7N9wh++TJs5JeOfGVVOspJqi7okUIpX9r7EUYkv5Dg1u2pLBZgnhVt9kf5eV7icW9Q1ZC2J+HSv5OCXAtVsQlb0fen2q7q8ADoNffeZBL2NAxTTA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVvyoYgMs45/f+RriNwZL4c7hvTlyUXMWsiUjtP5bgU=;
 b=NJ1ojangq9B9/Eg4NnzF/yxSgDjDXYAX/0UKxluz83QGLqqVM+zNdRRwX1P173D3uh+f6K5Egdp8k938zrt2VRVy48mI5LkhMO/XNu7+sIzOAABRvhZQoG8eNsfW20k0mdoYItPRqe1SJxolstc68c8DYIusoHO4pVr7fINg5p2Pb56Zih2cz8F3/YDhMkHGF+xDbkLDwVR7NHGxNpGIQoPPF+26sFU6y/CdKrGV1g7i9GkP6ykjP6TWC9qwjyXE3v33QgBplCPa4uduXWTl26ZQCOY/2wTG4a7aUk5ekOdkhzmB1qJbhqjxd2o19fHX7GpH1VYXgij1kQXPEo0eOQ==
Received: from DS7PR05CA0085.namprd05.prod.outlook.com (2603:10b6:8:56::15) by
 SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 20:31:19 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:8:56:cafe::5c) by DS7PR05CA0085.outlook.office365.com
 (2603:10b6:8:56::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 20:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 20:31:18 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:30:56 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:30:55 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 14:30:55 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MKUt3E3239021;
	Thu, 22 Jan 2026 14:30:55 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9CF2D9ACF4; Thu, 22 Jan 2026 14:30:55 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-gc320-driver: Port module for kernel 6.18
Date: Thu, 22 Jan 2026 14:30:55 -0600
Message-ID: <20260122203055.3227842-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260122193522.302216-1-a-christidis@ti.com>
References: <20260122193522.302216-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SA1PR10MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: c70fed4c-fda7-4644-98c3-08de59f532b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f0LQIVfiZODwEuHJe5e4owtoFjXc5q5c6RBFj5VrE2tM/Cmx5FFnx6iwXFS0?=
 =?us-ascii?Q?2UQfcv4T4S2VFki0eIQUajnnFeZZ4l+7LTvu8WvcijS2q5RmLh6YOFBupQc3?=
 =?us-ascii?Q?XIsLXX/AVmmJ/dOg8FbrJdoMmcVaqczWDa9O+PxUunJatOcUry7G68ARiXrj?=
 =?us-ascii?Q?DIn70bb5XnYJxOxP9O2/qrMTD2GHb4zDf6l3T28mFxignvULlUrLUWTCXSYP?=
 =?us-ascii?Q?Adg40biXRp7hrjwnNOmWibjW3Uo+sdFG9toI7Wn+nvmwB208Dx0XFfcH/NLX?=
 =?us-ascii?Q?wQIb4TxohVwRs8yhYYtZlzAWtKI27X79Scx/odP249Ozb8Uvp+Zi1E8OARni?=
 =?us-ascii?Q?VRcax4UiwMJmwB8ggZIpk8ll/qHCGj7b/B8C42rKB7AGunjXVWRwJaSX2ZJO?=
 =?us-ascii?Q?AKU6tbl6NdAmnkyXmfZkk5KgXmxdlNMnGSVe8g4qwuWZYE2d7EbiTyOfaHO+?=
 =?us-ascii?Q?PQBdtFuAdekpmNpdkXYIlLPa7LPWYR+jCQgaeCEgPCJeAGRN/51rttH+SWPO?=
 =?us-ascii?Q?bQ7eVlUN0r8jNIUpE8VScwVzmR5fBYgbWsZ/gEYGPRgZA+QTYnvRM/M17zZo?=
 =?us-ascii?Q?19gMu/1TTqouvec87TV7nJ9KByI2o+c3ivZQV5CNKfihSrP+NJw1tLREfk0+?=
 =?us-ascii?Q?yPUNY6ITFWWV8Pnz9otRT1i0hHNjRo/FUgT6qZGSqawz1vEZmmsihkdLgcUB?=
 =?us-ascii?Q?xw0YvHQ7vMK/C07ERrI+E95JhIGGNLKz2lu/WJvWIFjevefegUhhwKxYEjR1?=
 =?us-ascii?Q?imj7XXve6l4qXFhJJ9o7El3E2si02VvvWSFK45d9uAmnF5ovDUiBNbncyYVs?=
 =?us-ascii?Q?5YR7/q1ex/4XYuA4awBzkT1BOEqxZsJF/p5m43aqEbvw1s969kkLrNTV2Fxr?=
 =?us-ascii?Q?IxI/fZIIHSaMFPPlp4vbC/XPJK7L487h872lwiNsJ7Q4tK0Cbaid26TNXSQA?=
 =?us-ascii?Q?RA0xVuZhvDZgf+tB4fFR35I+1gU7bR5NgzLBWuEcF9QG1EcmJEsLtmcTN4WX?=
 =?us-ascii?Q?TwKh3yrvn/ZBCp649w8oy5efQn9gZk/MI38EHrVEPOJWS1Cs0T0Q6AhCsG8J?=
 =?us-ascii?Q?Zelc4SpFOgALv00wavy7CxBIT7rjHq9zy16Dlq3W1sF5EVvfa06UmzdrxbxS?=
 =?us-ascii?Q?UXCrzhG/xtj46wGfAS05TPh1eVZoKfouQu7YpoQLWcqNcWNCWlGfT9RebCiQ?=
 =?us-ascii?Q?ZXymEgh9UfFswFmVEBm3ODEqkNerN8aJw57g9S7Lvv9E68XeOFlmthVRRJk+?=
 =?us-ascii?Q?eOvLsDGjvQo+qeeGdwcVXbrTBPEqeFWxSw7HqJqtTrYlgYU7/Msmu8M+8DBs?=
 =?us-ascii?Q?ymwEmaUxMq0TOSlhFCsoKVTgq/73J+bYGh1cHGUE/r2g2LgzGgdfqoe9kNuX?=
 =?us-ascii?Q?GZtlCHBNNjANbY3kIrlJjM6hlVO/NbyAjYKabf7g70C9NbzRryD8H+HDt++C?=
 =?us-ascii?Q?cqSmE+VCQ47mji57jt38G2zURi9YKrCaM6bC8wcpbyOUbA4kZlNoAd2Frc8P?=
 =?us-ascii?Q?7zDqt80EAHYFO1bD9OboH+ir18lKZNSv8ug/GBC0F+hCizBJAhygOWsJtIXs?=
 =?us-ascii?Q?HWp5ZWeHY/YiPKCZRqlkTGdkmCCpIvvZFgjb+/DMdWpdeusL36OsaVX74jQV?=
 =?us-ascii?Q?0feqbOcy0CWIBF6RlUW3kKLKQQdFDqQVo2NNVwf4h2uI?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 20:31:18.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70fed4c-fda7-4644-98c3-08de59f532b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6365
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jan 2026 20:31:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19439

meta-ti / na / 20260122193522.302216-1-a-christidis

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-gc320-driver: Port module for k=
ernel 6.18
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 22 Jan 2026 13:35:22 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 16c8d42781f9f3caa9287ae067d357863=
bb0d352

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 2c4d2311be9cb2e74876b60781ecd41932b58374

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




