Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B708AD14899
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:28:36 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6688.1767950912569484797
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=LPPB5xUq;
 spf=pass (domain: list.ti.com, ip: 52.101.201.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzCiIkkXrAxjPC42lrHsUtBOB/aKR8qhrQP/RsZiaQZfu8FNrXZGsE25iwHGcKybrKcgpJDwtTOwpn8jEWmLQKbxm6AVKk0g7rbg2pW6/qS1o1spi+l0KjKrPlm7rnJMhJ7k8kulFaDTUOi3seQqBg/M3LbcZOKRO5H40lXa+1hhpIQLEHDcdNz2mITTWXYaW3sJ+/ngy02xiIy42j1m75iRKPAPR9eWfDfK4rWFHtpSzY6rx+SuFI/NQxH/TDTLlcw2t2x9b59fI0l+bldbVU1GLpmAFpkoObUwcGUfyf+UIn1RtdbKSy75ONiCEs0+oUc77GgixUWVNfEzX7LBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMyrRo7WZk1hE9lDVtKO6UgjGFgY+B/5dMwqsASXpY8=;
 b=aeleiQvWZkHT21vhFKR3XNq04VFCj3pYqw7rzAATkcIq2o1FqnEiRIRBaMzzAcxpFjSh3EAkw/wsxoEdzQ54HCAiOM6kx0VzZppoz5pf+3OOOea2rx2ALX6jPMxPP64nyLuy7IOzFBwXv2SaYO4KhzR90oBxMYTtb8CzVYkPcHaZh04bRzimSMTy86bmqq7iGiW/BOnxcs5R0D2CZ2cRGqGKIFv9ZN8JsNIc5iJbNlErv4lEbjHpLDHdvVAnzagS0CIyBObTwyJ9Mu+UJpASsggwA4dESUSWDPQIdFCgpJEbluqRdGtP1dBawZoj/4GyQyRrJNW+QJzQ32WFslutCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMyrRo7WZk1hE9lDVtKO6UgjGFgY+B/5dMwqsASXpY8=;
 b=LPPB5xUqislNdO5sl2OjXUk7RwW8VtB06F0ch6YMZIfVb7W/r2F79wlhFoGN6QwfiR29eqCj++sqlZX3TY+CqH5Me/ANyeytrF9SNdJOJb18NjJOP6S8rTBt0q+XAuRlY00kLjpD2gT26ePf9Bq+8825nO1ob25m4xY+0dyuuH3Dfp3b1u/hGlM6iEklQl9teBRzVMxf1xH2CNWo0n8UaOkIMsJJyFVvKzJHUjNF+42/ZpRV/Gs+/S8A7ewVJoXZb4tH/tM7CFIKjd9+ucOGMMzsRAUj5FG5h/r4GUyv5XUTfpvHUsJ280aIEdBmTew79HnvLT+kc0TScpVGrFqf3Q==
Received: from CH3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::26)
 by BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 09:28:30 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::2d) by CH3P220CA0011.outlook.office365.com
 (2603:10b6:610:1e8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 09:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 09:28:29 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 03:28:29 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 03:28:28 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 03:28:28 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6099SS2V1996765;
	Fri, 9 Jan 2026 03:28:28 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A2353138B5A; Fri,  9 Jan 2026 03:28:28 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202601090100
Date: Fri, 9 Jan 2026 03:28:28 -0600
Message-ID: <20260109092828.1587180-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109091625.1379754-1-lcpdbld@list.ti.com>
References: <20260109091625.1379754-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|BLAPR10MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd86f9b-8bfc-4d0c-c247-08de4f617361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HBNKHt9oMaws9izqMoKGsaviP70WDBmU8PXeCYkTQ3wAHFI+HmFUNaa+xKN7?=
 =?us-ascii?Q?ChIzt61KokuZhV+RkzjlpNNkaMHbuVL46tvApArJ8GKXrZTAInBeOLnQ6Byn?=
 =?us-ascii?Q?ydvRjSJYLPQcKU6KLkeUTjCsWxTVtLHYP+RveNztfwwe1kvqh+Knj36aw7ui?=
 =?us-ascii?Q?WgM1ET7BgUpBoZFlif+3tcx3RLOz3NuOJ5VFqU3cmPQjqR/YOMMDzrOHn6Td?=
 =?us-ascii?Q?imoaKmTUBDc51NyYLIMBNGraHy8lr46t1DFHzTVpt1F36wQ5traO//xcg28g?=
 =?us-ascii?Q?J5Ud/pj7tdAz0Avdq2/f85xv/dJjM0UYr2PUvOYZQlRpU6PQ9c1OnNPpmnTb?=
 =?us-ascii?Q?lb21bDNCmCTIrYx9Wx4KH+1NsjkEpZn2oORdsyE+4ZcaD0B55GMp+naR/6zX?=
 =?us-ascii?Q?6itM6mDys6BcHJiPKe8t1wzwzmWH1Fu0QWB1pJp7DRRf4W9JiPL7P4icJNwC?=
 =?us-ascii?Q?uJGYoamFEKL2cDmufLvtqV9c8O5fluKZB0JHp3eYNLcxVNcErbFn86bGi7Qk?=
 =?us-ascii?Q?gkTyeijLnq3B5OhEPA8w4RbAwUPj2x0Ip16RaQX226Rp265ZVs55Yb+4HTrY?=
 =?us-ascii?Q?d66NxQjYYg8lR+LDQh5A/NzQqS3z9lTqQlrUbNM/7uMmvqW91qnVuZdqavk9?=
 =?us-ascii?Q?kAGkqvjH/eC3Qfe4IGEOa2EsXjODL/KWPbNSseRTMLxEgKo5ZfgkiAJ/JD81?=
 =?us-ascii?Q?Pwo7BjogNOOWu5jvRVr/s0PZ+oS7NyI1lEMlg5Mha38u52sDree5VQgPKmGJ?=
 =?us-ascii?Q?KJe4y8XPnmd7sswGmPYSy9YmuOV59QXC0RWUa5uJJ6MVbfwETyueo0WYIvOJ?=
 =?us-ascii?Q?puJqfGYy9gkrqPsEwTukquKdQJJcJ/kAvYZOrSY7iM2zuGGcQrThzzerRbGu?=
 =?us-ascii?Q?mwbnFeTg+0vxlq/HWYV2gt5YBAg4EQDstVgoE12OeVp+fGKQ22fZtMeN07FY?=
 =?us-ascii?Q?2N8j/Wex+rcdaxIOw8KqUW6gFWGxvlGGDKTV/yb6QYY2nc6z9zs0Ukv7ayip?=
 =?us-ascii?Q?LVmNokxbSbk87qbsykNs/gvPZ3xmcmAYqtgjCNZlJi90GUeoPSm37uhDKm8z?=
 =?us-ascii?Q?VParaKbklQZpANkztgUpl2m9V+S5p+U9lQ+EBoZsGL5b4+ULWWQk5pCzPL3R?=
 =?us-ascii?Q?csRha8/o2eKhTFfZxrmaf9zOpwYRcPibviikHf3WsTyEmmqTlRA3aPeHg89c?=
 =?us-ascii?Q?7ynchY75FV624FutnQls40fJo0IKYvUFajOYwZ+eyA7iaRJcoAJAMsbsjZRb?=
 =?us-ascii?Q?4YGG7np48pyLjzq2TCWrJP9ES0wqDUmjuocGDMEwGKRz487TtbYxlO+Q2Z8k?=
 =?us-ascii?Q?XL9ZQw2Tn5Kthj8yKqJnGq6fEwIwTOjxyYSvxM1GmGc8imG/TqyPRnkczSWt?=
 =?us-ascii?Q?gC8FaJp90LxHSUmLygMD40qBSJOUMwJx+GAcGmfXeC5x6gjbm9nBaKiZTXbx?=
 =?us-ascii?Q?jVKV+wzdxcsB0Bae6vD8AAdXR4zzLn31msfB7sqPrXWe/sx2FZQuc0ZftBfq?=
 =?us-ascii?Q?/1Gf4dDcAYf4IhWl4fqn+rV8/XObdl9GUUMa+IReoXlNcRVZ2kTi8R2uloh0?=
 =?us-ascii?Q?KnSYaUiEOVES4UlAEAM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:28:29.8454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd86f9b-8bfc-4d0c-c247-08de4f617361
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19396

meta-ti / na / 20260109091625.1379754-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
601090100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 9 Jan 2026 03:16:25 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d698272c18cafd1145be9a2dba7add1ea=
66d00d2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: am62xx-evm-k3r5-falcon: Disable test builds for falcon
- Commit SHA: 5d8af78ab033c2ddbb79909e3a160e1f8dcd1a6a

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




