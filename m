Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12460CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:25:35 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.11])
 by mx.groups.io with SMTP id smtpd.web01.1252.1761715528609509253
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SDLkoMrD;
 spf=pass (domain: list.ti.com, ip: 40.107.201.11, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go0h9cK3ldVzpJDHGlU9tIFlI7sFcdIqsOiCGh1sonD3Nbrk5opJkZz0SyMrojnpd3huZjFGUm1QWY2uwt0gyARf2CnP3Yck11aLzIh2ytgSAhQvqIWrxb6F1USP3eU5UydJ6LL4OvOZHnYuBkn02Tg/ATj99K3BWFhSjInkrfDNA/lFTVZXvHf3OoiLJW7CVGS659Rl12w3VFv8PJdCjD7BvzCuoa22kwRTtRptcDZHWfcSLsfpm4yAnq8ycZufOSA8bnbw5JhrK7HlXQST3/qhoB3TJV1Ncbqy5nv7s8mCX/Oi1jAgfOsi1fwA8VplwojZTsNLp/rFSgG5N0pP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67tXVris4Ah3lcWmsf3lVGDHX5UlmE/RRw4uFMagxVA=;
 b=mmQFpAf9d43HOfIwS0hQ6Z8v1m4/QedZ/4Olet2o8URjkRjzu2ajLJpX7rbHle8RTds2LX/jrYp4H0YzNhf0XzGhDnRXhHL8576fwRAjMMBBIJooPC2tAHVkcAiJ+nGOTRQWfwCponxqJkWJONL2mtN5DDky3mbX2JVPL2RzjZDsjqFIlc8FwWKHEIUyKKBROcb67EycbMZcdAlljGqMM/Y6T7ynmLGy1zzdnp941CNNHXK+6UBkSUns4qzFRsg7EqeVhgIPlHKiktY/ofPK2+CpERq4R1rn6kGtZaW7gruVtsQro7YdItSi+jLuv1HoUYuD553pwgpZS5344SZrjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67tXVris4Ah3lcWmsf3lVGDHX5UlmE/RRw4uFMagxVA=;
 b=SDLkoMrD4omz391Y8m3mUkwYXAPNSvWz6CniBUBHOKL3H3tVwxJjionG5db/CKwobt0AiSGjU0z5Q226qp9Cs6GtIfYjCza67KGhdJj53OPJAMP0/GKsOYrTLTwhsNaDn84/tVsO0Pz8cfp6s6LwyJziprel+8nXzzlkeWF+4UDnnTfsyafJIoo+QahLLdv5q/uWuELcjZpYds/uxb/siOXxypG3uhTZlqa7qW78GhFfPgunaUKOClCrA2OFEJ47RPD1i3aiF+gsOhjUCZIaY22WWcFQSbTWOKZr/ncUwzvuoBn0m1sKlc7c+ovyw4mID2CPsjdN0EaNnp94QSGy9A==
Received: from DM6PR04CA0010.namprd04.prod.outlook.com (2603:10b6:5:334::15)
 by CO1PR10MB4690.namprd10.prod.outlook.com (2603:10b6:303:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 05:25:25 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::86) by DM6PR04CA0010.outlook.office365.com
 (2603:10b6:5:334::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 05:25:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 05:25:22 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:25:11 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:25:11 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:25:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T5PBiQ1310286;
	Wed, 29 Oct 2025 00:25:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 97F5213F52E; Wed, 29 Oct 2025 00:25:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [meta-ti][master][PATCH v3] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 00:25:11 -0500
Message-ID: <20251029052511.1952945-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029052124.2712052-1-v-singh1@ti.com>
References: <20251029052124.2712052-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CO1PR10MB4690:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e4d61e-e71d-48e0-168c-08de16ab8f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xU3KlP+FxrqMqNgjZuez90hm0qJ3Ca+WKFdjLfRRJ3lcGhRwYf9MkUOIceM2?=
 =?us-ascii?Q?W4soSO7l1TdYfqCSiOP1HtbhWcli5APo4m2skRPUVBAdsTZHteECUlRNS2Re?=
 =?us-ascii?Q?nTUyHXVM5NQEJGYl2t3ZFo/f89+fucLujaBugi8oMFmwIkjF9jeBRgOP7UF7?=
 =?us-ascii?Q?lt3Lgn4rs3wYdFPbAfdy4GncTYKGE3ar2JxkVFfTTsxMHvHCQLDUBym9cZKZ?=
 =?us-ascii?Q?JH9dP7OB/04xwENkh0iOyBFnj2MeOkf5ZUP5ohcc0F0T46+XIiw349LoazRo?=
 =?us-ascii?Q?YdG3eJaKOpK9411FjNHJiR5PRNcZsfyR7n4bH/YT6fo7Eq05nE08McpuWMb1?=
 =?us-ascii?Q?M1sIjbUxzwxDPZQmSsoIt1aALArp9ira75QBFA0drjBq3KYIAs+ZsVGLI/7Y?=
 =?us-ascii?Q?9oRHCmbKGZOhHLRnqfpRwFYVL1QJJ1xpSqqv+n32w/s8Ygx9YodTHUqNZc+W?=
 =?us-ascii?Q?as4jK2pkiFxMVpxIIWsartbKMTkDKeJVcloub6cndoI2vttpFL3lcADCucKM?=
 =?us-ascii?Q?/oYvuS0wpLn69s9qr638sIZcXTnB/tLPxyzvt46kd/DtbGx0pAisQ8NUJbP+?=
 =?us-ascii?Q?nAsP92seaslexWX97gesGYes74zqGmyzyg6BI4vdB84i3zfy5gl5E0Irgky0?=
 =?us-ascii?Q?mtYDFTk5xS0tNhe3XYhcKdKPrIOQ5RTlKg5t5TnNLqdhHfh9Yfnda6jfcGru?=
 =?us-ascii?Q?ofEEGEoCoMhW44dbyyE+Dn+weClHuj58HjhhhXRXH0qCdyI6Yh1ElOAUPWmK?=
 =?us-ascii?Q?su9+x0e/7zwez6dgscB0mLDzGJ6POz9um7ye6l1DAbS60KE3Bjwzx5asZx4F?=
 =?us-ascii?Q?P6RsZAHX4TMbcAwHkGJ0s8L3hZC8eyJwTFel+cAoBLjgwB1w1xFjcGQsN5z7?=
 =?us-ascii?Q?SBLHpqbwqT+x6yAo68Xy7dnsyo1c1NoFWYZqemf/WCToiFwEHYu+uogr5GnR?=
 =?us-ascii?Q?wEFAn21H3RMuWEv/Je4k4kpUOpwYChHeBrK31YOB8Hqn1/E/WUf6stv57Q1d?=
 =?us-ascii?Q?ifftfpSemCEkRHWTiPz2LBeSuSoobPWyq956PNzNwdVfVSpLkM4cISxVB6c7?=
 =?us-ascii?Q?N/+CBze4dx5l0GWr6rBdt1oTsJ9d4hZrfBOETyzk+fxadbM69b5CoUm5//7z?=
 =?us-ascii?Q?m8zEDVQZ7fBHRQLSkwYTjl7cyCMoBaKi+52d863R2rmKA86ZP/K37hhqsaO/?=
 =?us-ascii?Q?mYEe8XjrQcZtoMn35Vq02KBbEeoeaJB3swLxp0aowQFpaD2B48OWoEfk1pGv?=
 =?us-ascii?Q?n6kQ3lPTrqSdjrpxG1UdefmZ0gL+m3GWoHUxs2uWt2cF9gSL4lmSl51XbTcd?=
 =?us-ascii?Q?48nk1XTEZvs0VwNiy8gbjpKNI1gmCQuxJxjxXHvFhW49kVCibGtGyjOh6gkC?=
 =?us-ascii?Q?MzD+j2kxRXdG1MK0eKbHawpnK6Y+vNjiMPLspAmdDBzNX9M2SAG89ojEy8QU?=
 =?us-ascii?Q?rawKbKWRN8gOC1Dk4hwDtuMrJgjaZQtHlahnYC8nVKDxgEp+AFBEf2vC9btM?=
 =?us-ascii?Q?tCsklejadza1wRaAOoY2tURj8JRA7eJFK7sHaQCOMtXZwgU5MbtwW/v5WIet?=
 =?us-ascii?Q?Yf/dtSoq8wAKLIZnDMM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:25:22.7534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e4d61e-e71d-48e0-168c-08de16ab8f0d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4690
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19198

meta-ti / na / 20251029052124.2712052-1-v-singh1

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
- Patch Series: [meta-ti][master][PATCH v3] ti-librpmsg-dma: update ti-libr=
pmsg-dma SRCREV & LICENSE
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 29 Oct 2025 10:51:24 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 503e36dd84bd9958da2445c9773514ab3=
de22179

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 91a018116239c12c5d57da646fbcfd6f4af12c2b

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




