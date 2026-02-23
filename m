Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C97EEC2B3
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:58:06 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9147.1771891076557494386
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 15:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ViIi973D;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.46, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idOiBABei0FF4La/v+Zu5hJ0winrUdbMEFR4B/uVGFbA+nW4bGMh4JkVA+PeJ/v6NZqLuU7NiwC3ot6OHTvTqZMl81fYYuXwJbZmoAmHEo/+xsnsBf+SDbGUZcA6HWDI/MIIRBEb3u0+BpfqOYzkg8NDwDBl/6Jq1PyMcQ4RxLdNNGsU2Zh9hjeLePr2CZqgtA9tS1+wWacRCoeKuEzqVzA5CMS0Nkbd1I5dpkva+AUOOcuBBV2uwsDaWLnrzFz9DoEyixt+/qe4b8r4e5sdCQAaOGn/ucTBtESrSJ2FniNkSP1MB+D0gO/DjdqBNIN3xn5YmQGFnKsyCL22RJB/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJWXLh4ILKJP+vpSE//brxDAX2qW1pt6bsSNFU/ACgY=;
 b=c8FSXuUtAM3PQKNwm26tLMB39PXJ/aYxob1AaktuQjneLZOngHLJ8XTKuD5vAnV2Gfjf4EM+UNhpRTIMznC56oQv28pOf01VEp6ziznfeQOVAMLk9Ri39LLVZljKjHaQXEZMOoOCbIy6CIa/qNf+QNW3FUmCzSCid3+TySfCg4RsOdTW8K+Te8a8fXx93Y3tgccARj93QXmF1FIA55LN/q/iiLG372turGxc7pNYmJ6PDoUb3H5FideZgTIgxABCIlgGytMEFOqnN6qk7yJ/hzsuH1hZRva94VTQPrPDGuEpNVc3mc4Tpg5PnbMXgdQkGXBNT1r6S7eVcq8HHTfnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJWXLh4ILKJP+vpSE//brxDAX2qW1pt6bsSNFU/ACgY=;
 b=ViIi973D9Sv1DqHMJTvak3yRNsewUZa+jA9nhcJzpcpPZrwhK8etHJ/ZmA30OIG1iy1dK/jJBAkbF9nq0ulJ7k/oCf8hvlUqt7Py02qOhizSAjdD2g52w2RxKVQkweMEEJvBypjPVlMcKU862C2RRgDh7FS4kCYF0UPhb1UOUOg=
Received: from CH2PR11CA0015.namprd11.prod.outlook.com (2603:10b6:610:54::25)
 by BY5PR10MB4116.namprd10.prod.outlook.com (2603:10b6:a03:203::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:57:53 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::c8) by CH2PR11CA0015.outlook.office365.com
 (2603:10b6:610:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 23:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 23:57:53 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 17:57:52 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NNvqwb1698885;
	Mon, 23 Feb 2026 17:57:52 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/3] uniform beagle machine definitions
Date: Mon, 23 Feb 2026 17:57:41 -0600
Message-ID: <20260223235744.3928753-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|BY5PR10MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5de984-bedc-4b9d-a512-08de73375bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tLNUGYh13JyYnhbpUBESWqUhpRxNaa8u68Wv7sKNyjbgHrHKHjGZ6NkcM5PS?=
 =?us-ascii?Q?0DgzS3ssxDsuk1fjSmwLsJQr+KAYMzAUbaOBPcYwEgr+NRJgnc0BJUY/B7ko?=
 =?us-ascii?Q?rowT5M4dtN75opHIzGov2dArCBCEPM317LzxZEWVHtgKIoewQzT/7sprqz0g?=
 =?us-ascii?Q?L06TgkqykFeLn23LbtfDCC8IC2oBx8b6wGhbMHeFjB5EEoWnC6G8CwwCcd3J?=
 =?us-ascii?Q?QgLHH9PQsbLOcoaKmkDDxyBRwOYTNw/AM4jNN1NjH0M4GjvRfwBq7zwRdUjz?=
 =?us-ascii?Q?z3xwaRGLrQbDTv5HNlFDl4AKvHYPOki9AVcze7ZNi4aFz/NrqHzo9YT0ePPf?=
 =?us-ascii?Q?nhc9y9cexGdivTiKXFp+knnJQIS+jpHqjCXbU3ngeISCpwfgm15CKnM5wX31?=
 =?us-ascii?Q?5SM4A5gXAoUyHRtom9z6j61QWelDnHGeS4diXbXnnF4AfEfRRW7G6y4V8gOA?=
 =?us-ascii?Q?JIVGapvJttsPxySquJ6LvjQtygxjm1sJRWP2wHwDdhoMa/LmaR62FTggHCZg?=
 =?us-ascii?Q?t7PyweE1sCEXi0z0IqzpTMQOSGDtS4bTq9GFwl3opONSGl9/AsMKE2Eoo7DG?=
 =?us-ascii?Q?feYJUXwWePGKUISIrCRE+OTX9wJLyR4RavWOB0DBWDS30kTOgHgZI4lWEmqt?=
 =?us-ascii?Q?NKPHauYRCDzGO+LwVXDUVffuuL01Pa9W+pIJtppofmDye67y7YeWZMIJMFoU?=
 =?us-ascii?Q?EnSCy9YVTsCTYrOQeZ3SBoUdSXI12dz3hjVaA8ZPtvkxqqicGh1KbXxh5Qid?=
 =?us-ascii?Q?d5ZBYzatvVZ4pnU/NQ3budpwewpx/ld34orMnbyzf7+HAPHPdXTcW9GUWyry?=
 =?us-ascii?Q?nqD0l78f8bOASsRHJjxI6UUMaLLgKl6IEqeJV0o9Cr8zt+6ndsRfdt5uoOJO?=
 =?us-ascii?Q?hWDf3/QDq/Q1DuIpt6/qsdXae0EV/FOFDmBC9cgyfmXT6GhCMyFTf4rOVvoM?=
 =?us-ascii?Q?3enPpuRVioO67WAnUQIZaX344iG2wJpBsN+o9R1xhPvxu3WVBKWEfHPU0d/j?=
 =?us-ascii?Q?NHeVLivLKM7sIAb17t7rYAFcHycn8t3WNiPPTLl5Xp3zXfYVPD6tAIxijMPt?=
 =?us-ascii?Q?T6r2kBIlF7uXY1yxf7xMvj71tYitOXPJGjz80JWk7tQbqmisBI3i45J0IH7P?=
 =?us-ascii?Q?gMLpya87Osf795ntBkTOpZZcLYNFJ/ggWNexCFdPo2WU9IhnLS3dIi27To5R?=
 =?us-ascii?Q?1N0FXObOEk0h/i1XM3504JHszoChOp8bmgnhDGjDinrYgO46EBAge7J5lbnW?=
 =?us-ascii?Q?85TOurjMns9vRtlZrjlyNp7A7ki5fqbA3bipq+8NIs6LCefkPx/c3mDYDi1A?=
 =?us-ascii?Q?rEpL3/vVVsTxOl0Yl5MwjeSUKCO7VDKtSGILtHlPUwBdUNXxdvyJDTMew3nj?=
 =?us-ascii?Q?wkqLVla9LU0Qge0FMN0/w2yEwR/v8mmWNO8HjaA9l+wiTe6wnDGQs/675yQY?=
 =?us-ascii?Q?Gs+JsBSyxKk6LI8TPMkm/4jIv4SXg+StfvgGVxnoz7H9yo/uZYLM+7Aksibr?=
 =?us-ascii?Q?D9KyTFQsKopqw5FyEdtbhz7tU1AjLyhUrNAN7KhmpS7t9b38imKl9lxJR6cq?=
 =?us-ascii?Q?wR3jCszRIGyRj9E2JJW9NEhwbKP1SPwp5MqUjPMp6OXUr8SQ7KhG4Z/pKrSu?=
 =?us-ascii?Q?oX4hysqHXUzNrqhprxdCcoHhzmpUX8sLhIzowcBPXHGnZSdqTTIqjfhFabi8?=
 =?us-ascii?Q?2okHfQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1XIhqYeYS36GuyIFOAAnH/7NLiJdYzz+PAZYGK3rht6yobdxnC8OEIJsH5Qhp3TzICyA0tVS7GBYzmlaO3B4TDM35cqg12hp2ZBSZu8z5S75GpRvnlHf7pVDWmXDkDDUyhjtnnQG5qBgHA5EW4SRMOqm2lUAYiA+5jl1S9I4gzaCyLbaqTbHC6DyPM+sVJG1jnEzrqMVMsqZxwxi3JWa1m8MELW5rYUfJdg0Wnuia0Ivzq2NbsJTVy2cnAhYdChSnSpDni6YBqv8L/2Lm45ZDGyYLaiX8ux9hmmea7CVFl5LpkWgVU79ma25Kw42nNEwEE6/gfh48UKfUJ64FnIox8zeYWqh/YVVvljrgxMuabLptYfb3VineeGEOZ/hO7YIodn6pkSj/fFawDVaRdM8BTx+utK65A6iucXAf/j2/On9FKcZAr3g1CzecEueCxQr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:57:53.1283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5de984-bedc-4b9d-a512-08de73375bb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4116
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 23:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19578

From: Randolph Sapp <rs@ti.com>

Attempt to make beagle machine definitions uniform. Move all beagle definit=
ions
to meta-beagle. Make the hierarchy clear; if there is a TI specific
configuration for a device, that will contain all common arguments. Only th=
e
beagle machine configuration will include beagle BSP specific arguments.

This is the result of a thread [1] where some people were displeased with t=
he
current organization of the machine configurations. Aside from adding a
beagley-ti configuration, this series basically just glitter to satiate som=
e
opinions.

I'm sure this certainly won't spark other discussion.

[1] https://lists.yoctoproject.org/g/meta-ti/topic/117964418

Randolph Sapp (3):
  meta-beagle: move all beagle board configurations
  beagley-ai: add beagley-ai-ti
  beagleplay-ti: use the am62xx.inc

 .../conf/machine/beaglebadge-ti.conf              |  0
 .../conf/machine/beagleplay-ti-k3r5.conf          |  0
 .../conf/machine/beagleplay-ti.conf               | 15 +--------------
 meta-beagle/conf/machine/beagley-ai-k3r5.conf     |  6 ++----
 ...agley-ai-k3r5.conf =3D> beagley-ai-ti-k3r5.conf} |  3 ---
 meta-beagle/conf/machine/beagley-ai-ti.conf       | 15 +++++++++++++++
 meta-beagle/conf/machine/beagley-ai.conf          | 11 ++---------
 7 files changed, 20 insertions(+), 30 deletions(-)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf (10=
0%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf=
 (100%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf (68%=
)
 copy meta-beagle/conf/machine/{beagley-ai-k3r5.conf =3D> beagley-ai-ti-k3r=
5.conf} (61%)
 create mode 100644 meta-beagle/conf/machine/beagley-ai-ti.conf

--
2.53.0


