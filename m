Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE33FCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:40:31 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5153.1763368827367184877
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 00:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Bq7RJ7Nk;
 spf=pass (domain: list.ti.com, ip: 40.93.196.30, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNEtbLq4/zONiKXLRfFvMrqbVOt3L+m1hYYh+Gvn4/dPCxo93EGGswccdW+AXb0XChYhwWJbm2Bjc2B75JMeQ7aP/7Ib02nsKnZhvFdh2scvWA4VdTtG7Xr6q2A7Es/hyU6cQE3kQN3ytkGMenu3Vd2e9aiPMJ9q92/w5aREZiCJ3BbckZemSLwM3TZA7EeGMBu1vAzCUeldpehZTFWsseNFtWAmV1sYus8B3p33rY6SdaxudooTV/JcvL9pg7pGKsXzMnovIhPuhPWIy6vTVH9i5bzLmOJSLttSB+4/IAbAL6k6y7P+Wd5x26Tx8gRKvi8n+FfjzDWXHM/rzsFmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jO7gtJX7TQHnR9KL6ZysBlNAYPdkqhGe2KIaw+JQEc=;
 b=KBbj09jvzzvCX7u1yHscNxSfrG5smN9Ke1g5KZpQgqzktFLMK0nyO4LR+K51mR+0tpdZM2Z5GkmgcyGGRIZkiPavjVj5EMxdGZpo4M/jFzN2cavmJe4orFijyHi5ZZbeu7Ddztl78aD8p+0Tp8HCYZLsOQVgHnL6mBXj4YifByAN1+lSWS7cCRv7AlVHJHJMCL5SpAqPnTxQQmtVJObt+ob6cDvMdtv8l90a8uPIrSTQfu/bXrhQu8l+MUqxdEaHPNES4OHkShEGlsIkqMcRQGy+iAmsXyG4fds1k0N7S8j4fWhF1Cw1bXcTfClf0g9YKEOV7ii4yK/I7EYMwDsIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jO7gtJX7TQHnR9KL6ZysBlNAYPdkqhGe2KIaw+JQEc=;
 b=Bq7RJ7NkIGv3jsujBxx8QSgWXPJ06iPmWE/x9cXJRUrZ1ymLUItZ28dt06ggkIuc3N5Wb6LzVnXF4+YYYEV7jR5yavE80NaeFnA6DyJZqNqKUfF+KZ6Qdj4y7O8ZweNiBwbYAEVaDGcFvhIqP6ZqI/T7XjIJoJkyFLp96GWJqT2pwdEvp940FnHvum4LHYKRKqLLXffN85hnnIAAjK0Z0cnM/5rUY/c6t440v5EYp5GVdtnKzLNYgWexQE0EBapbE+Me4m93/QbEtX0KJsmE9unDd3GRpuMrj5oNy+LTzrwFmDx1fxze7tqkLJAS4TVEJrXWbm2MFKMMLZjp2iQ+aQ==
Received: from BYAPR07CA0094.namprd07.prod.outlook.com (2603:10b6:a03:12b::35)
 by PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 08:40:24 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::17) by BYAPR07CA0094.outlook.office365.com
 (2603:10b6:a03:12b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 08:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 08:40:23 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:40:22 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:40:22 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:40:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH8eMT83577659;
	Mon, 17 Nov 2025 02:40:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 55D129ACF4; Mon, 17 Nov 2025 02:40:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure libckteec.so symlink is installed
Date: Mon, 17 Nov 2025 02:40:22 -0600
Message-ID: <20251117084022.3453352-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117083407.3719468-1-s-joshi@ti.com>
References: <20251117083407.3719468-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|PH8PR10MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d405ed4-d907-4cd0-28af-08de25b4f352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ULSbJRrFuA8wLkCmLv2c7EZPjK7gb1Os+obd6rkiAlhqM13dZ0ZNwPBQ0I8x?=
 =?us-ascii?Q?NEL5UaIc8pw3deEgyyDX1Ado76sBCUHXsI8lUqXCkEGWRrnn3bQzCsoTxR56?=
 =?us-ascii?Q?d05hGpSA7GKCxQheInlYTXTLVGmqgkCZfbCQzeFCMJ6KrQK2+xaSoy2v7VvP?=
 =?us-ascii?Q?VK8REcLFVGKaVTw5X5nNoahLDJEj1cDi8R+HgWOi204LOguejTN+tdRfEWFR?=
 =?us-ascii?Q?j/YK0lGmERaaMclrv4lhXujFxmxoUsKcYmrgM/1REi/4lyU0U9o5tbUOheKL?=
 =?us-ascii?Q?0GdtDfBo+v1VyJs/nEUeKCHQVz+fPfsKIWyQY64nEMAw5D+vDyL29xQDvRTO?=
 =?us-ascii?Q?0HcDCtDtgf0bwGZ59xRxDCWRCpWe+h83xVAUL1jERIMJMU3hP9oJdSF9qe0q?=
 =?us-ascii?Q?Db7xZ7uGWYT2eWHo26ILDizspBRQ3Y8BefQlc5NG7t410losY+eSRd9Pc63V?=
 =?us-ascii?Q?YcyLrxc6yyjNkjvdKE5Iwl1OY/K63rSOpKlXYJ2ucoWZbQqfz4pdq0PHoNK7?=
 =?us-ascii?Q?Ny8vrMA7N64JiRGRnlT0Fm+EEWsCQHs3IfpvX0UBtqEPJwRRiUNIPpnfrdM7?=
 =?us-ascii?Q?f4RqAl+XD26n7Q2wmauwMHjfGtANy6afcNQUGO6N5Qld3zVZboNwLz351Sif?=
 =?us-ascii?Q?ipDYhRb/dEnWc6EbbkJ30K2rjb3/lmG+Lm2Ot4g75i65CfpbJG6NIJ8VcbNN?=
 =?us-ascii?Q?I1JR1F2qqwmjf/ZQojSWWvqHaKCcc90XhCPPkPTJjLzuIzkIj4t2ZvDBYz+G?=
 =?us-ascii?Q?29cXfnsGsbG2EAV3GLgPIcZfPwThqzDUpk5cjFGdB0x4X6fdOcWIhH/2fl4s?=
 =?us-ascii?Q?fFO2mXmL7AiAyOV2FiZc1q61vom+DQZOe/FIK66Rmwry9n1dO1or3W5vBjJO?=
 =?us-ascii?Q?rNudNKC4YJrIheY39hhH8LF2r7BuJpIuN/DZ3NmrlryJ0masdEtoJUY1aTF6?=
 =?us-ascii?Q?Y1cuM+cby3QGHPlhzYzLiYKjXPJfLGa5InfyI3n91In+tcFdqHSj3pAPHkqN?=
 =?us-ascii?Q?3AtzAt8uF+HTCjBBdu2Gc/7r70blx6zHgBjNQPSi87l6Rk0GxOVoB5fSGUtE?=
 =?us-ascii?Q?NcX1uaGnmwZWj8/pTumCXv8OUfuLwMybtHAwS7Yh2rgzl1x290IWe6Qz27Ll?=
 =?us-ascii?Q?qZTYIEo/7JYWakQ0RGIuoBdVDTOaII4sP2UO5s46KwjLrKRe5Wl0ENTm3ONr?=
 =?us-ascii?Q?Iyvbb+zI2OF8MYi4BdadHs30u05UWC6QHbdYC/oS9dGW46/i+OiPmepaCgle?=
 =?us-ascii?Q?egkt9AbImBlz6aEgStaLNbwphUYFvei64cSOXxYxKi4QxRGBLx20O1Lv849D?=
 =?us-ascii?Q?/TWgaW9OUdarSHGPzaEZC+18rJ8cyRLQSlvvvfNiSs6t5j6R4d1l7zg2BLMg?=
 =?us-ascii?Q?O75Lzd3H3Z6DVizUhrJG7FJxKYleQjMdIX19UBaUemzG136jh8SqKrdsE8XT?=
 =?us-ascii?Q?1qrnLQ417SycKTK67V2+ltVsFlFGey93d379fIrJbDHxAQxa7SzD9Wx/aAiI?=
 =?us-ascii?Q?xoXwRdrzV945x1oKfSZxr73MT7SZ81Esy2aT9sevr3aGBvONenkuzdBDNi39?=
 =?us-ascii?Q?wx5mDLonbBQXNRTdXuw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:40:23.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d405ed4-d907-4cd0-28af-08de25b4f352
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6597
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:40:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19279

meta-ti / na / 20251117083407.3719468-1-s-joshi

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
WARN - [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure libckteec.=
so symlink is installed
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: op=
tee: Ensure libckteec.so symlink is installed. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: optee: Ensure libckteec.so symlink is installed.
              meta-ti-bsp: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure l=
ibckteec.so symlink is installed
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 17 Nov 2025 14:04:08 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b7db69a9dc1494589c99704730dcecaea=
d2489e7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511140456
- Commit SHA: f483464c72055cdcb81853e06afc89719e73073f

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




