Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3F1CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 06:10:25 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.47])
 by mx.groups.io with SMTP id smtpd.web10.1534.1761718224114246527
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 23:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=llgc30D2;
 spf=pass (domain: list.ti.com, ip: 52.101.52.47, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbjWTNteq7eUq+Y+CvahnNKxsRmdDMXF4SVmvG83H1+APuhmeLhnbfFuIh0mIBVtcHB0Hje/4zcdT+0pvjFaV3mYfXlK3E7JfFPcB1yV0+anxiFCGdo7/Ljo8/tsUtT/Zqy9gkSBXGLyZUuoe1gklP6GzoZ0uoLcKUXxuvyMSOeald1Ef3vbAe+5i6bJn1TP3wNspmYcawbsWpGizMVcmT2kIHQtGSpR93mtKt+MHNKq/SzsEHsSrwBmufI7bPR3gpWMDpvJ0KP92rCD/HpxDAettW1N296cn606EOW3iWl7HWRBeg0dcltG2H6yCp6QVQRoqQ5GKev+OM+hJENzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJu7M+fdyT+cM035bKWhOMgAYQcBhz6l731+ssb92yM=;
 b=ljR2axywbqbshJjgokUFWZvj55acvI66xH28Sxl0j/2jO0JE/Wtk/6zTI2JwtQkSbe5PMArZr1bbs0fliYhHfOBb+LK5EmI5NXy8mmIh5q+yxF+88e8R96UCRzaZx8VINh7hz84lD+3ACikg5ghWcrBwUxWMmBToI4buZtpBegtBSnJCqVCwSprEdVFhAWlNf2eQiEoTzgmrCO+OFhIokuffMtMjBaFOarWBBp4/W0BJcsPbvM2DHYCXmwCmopWOSitF+lipIFXFVRjakCEapBLKaw/W+SfRkBfRcpI5SjrEz3S/CsJkczrFWhvVn7totx7ydwXwKHKwQUex9IFJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJu7M+fdyT+cM035bKWhOMgAYQcBhz6l731+ssb92yM=;
 b=llgc30D2I4fQKmVXaw4t6jV88WTuDUojpL7rEQsr2Cw9Ea27XZOoJhdr3Ujk+cQ7uQE5+c4CtKaBPbD84zLf6MSlKrNxou4dzLn6sl6a05PMQmpqu9K8jxea8+Cl9FtwdyOFmwpm4/OOGpE7S+inBegdMMZcHdeXb53MrLf0O7hOMbVE/DTFkk8XCWwTw0Az3zP+QKvgLlnuaD/m7FUPT/ZFEt7hYu+zUqJ6rEqCaXCPTU+jS7d934/2DkHc9NgNCjQJCwD7n+0EvS4HEXkFCD+dyhqC2Y+xGNqBhH4Cu8hLSZ6YD443j4UHOH3IOvMsUVmwxs2ua95cWTtB06ejUQ==
Received: from SJ0PR13CA0179.namprd13.prod.outlook.com (2603:10b6:a03:2c7::34)
 by SJ0PR10MB5802.namprd10.prod.outlook.com (2603:10b6:a03:426::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:10:21 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::f5) by SJ0PR13CA0179.outlook.office365.com
 (2603:10b6:a03:2c7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 06:10:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 29 Oct 2025 06:10:21 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:10:15 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:10:15 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 01:10:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T6AFqU1320115;
	Wed, 29 Oct 2025 01:10:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7A5BF181226; Wed, 29 Oct 2025 01:10:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [meta-ti][master][PATCH v4] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 01:10:15 -0500
Message-ID: <20251029061015.2100046-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029060456.857646-1-v-singh1@ti.com>
References: <20251029060456.857646-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SJ0PR10MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: c018e1c6-2b68-473c-d5cf-08de16b1d75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zsRMSw+3V4WZx3PXJQtZGXJ7bf0YLpbtd+qf3iU9CdWjYMt9XhxXVnHYZbA8?=
 =?us-ascii?Q?lYQIsicSXrOuGdOSiYjFokhTbOHrlF444eF9bLZVNDMFEayQBKY39UBaXH3N?=
 =?us-ascii?Q?mrl680ctOxew/R7D3Ht96gmsKbIUVd+iETyrHJ5dM1GDH2wRArBVL/qKMGGg?=
 =?us-ascii?Q?UAcUOMFp79tJ65gsqdLpG/237xQX/7HO1z2RWUsOGPWJiC4RGduld4BxeMMS?=
 =?us-ascii?Q?vP782MH41MwM4qV7Gl3P6zD5AmOUAAlUGAeBZuv2TZShLV4fcl2OtoOf84sD?=
 =?us-ascii?Q?xCqMKt5ggJdpOHaFxVMZ6pXEQL1EYtpRC4prrEf+oRmeDAKefz/Eg+vpL/+A?=
 =?us-ascii?Q?7SVQywkujpT2oFjxqggv4wLgC3Q8L2w5jObTs9YbKXVLn8AURvOmUKg70PHt?=
 =?us-ascii?Q?prmHUft4PCE104jxP8tPSOb21UJSFTjPecRPzsAC/ZrXyJDpEFuvC3QdbwGO?=
 =?us-ascii?Q?tDTB2B8IzdNjQ7rsXZ0Xc3q0Z5toWw11uaWpYnWGt4W+99QVCYbOL2ocrrDY?=
 =?us-ascii?Q?3PSAViuOwSJ7a07E549cHXMVDk55MwZT2UXMuSrJYGGvjK95K5gDqdLLEd9k?=
 =?us-ascii?Q?n1PusXRPCgjgxt50d7J2DD8qU4iViIF/WSljSm+mjtmOWGTIxJKuCDk2T5MA?=
 =?us-ascii?Q?0LfYAVYdP3Ea2aQbaSqvGRYP8xiGWnoih3JBUes45tWCAwOGyMaOzOlfQ8iT?=
 =?us-ascii?Q?7a2g2oNtGv5WZgY35LWjHJrjqpXTTRF7bd/C76k5TmM2G9WQ0qtfv3VRbrh7?=
 =?us-ascii?Q?bBFLIXZi75P5QYB4bNe+8ARDnIJziCpNFqLOwCsnlXZSEiM+35M6k3nqdUvc?=
 =?us-ascii?Q?RtvthlmMmPhE5hHySdK+GzdH8mwoUUlkrQLWI5lSGF+gSUKckrhhHhGq/i00?=
 =?us-ascii?Q?WR7WZ+nNEtGRi3TCea0YPz//re1648tf/1/e3gOAxmoPhjhvYA3unIKacJol?=
 =?us-ascii?Q?PACwNlyAju5ubIzTCC7xgTrWBdgzPGMbhOmy2Q9bKokl4uQf069uWtWEsSf1?=
 =?us-ascii?Q?FKkASZUhO4LmG1RoO1j+CSYp6L0TiQ1g7L45J/yvacYlaiB/QxMEsU2WjLTy?=
 =?us-ascii?Q?/R0l2L1eWrZWrCMStIN2XED+/fdOnIqP4Fs8WNcw7HZsiCJWoh7BdbSJLI8Y?=
 =?us-ascii?Q?lZsNj24RDknJ05YV/AcokBftdUCaByUfsckG3MKZNIGQ0t89k9RqG1Nquw2Z?=
 =?us-ascii?Q?xT6K8h7GgbO4SZo5S/e4HoQ98qjZKvTvQquof+CMb8gAkXYVSd90fcbykP4d?=
 =?us-ascii?Q?1vnElgqFiMtZ4b82iwUkVCkqARMIfwZMUqI4DaFJmmxsXxapoSiwUU8BRuuj?=
 =?us-ascii?Q?8aXDHICkJMOFRmhbkpwxMnce6Cr5n9z7xtSzo6bqeYxGbX4VHc6n3CgijXDr?=
 =?us-ascii?Q?ByrJihdvsGDXWD6XX+RzochEE0lH3uDS9Kwt19IP/DMGepwUJ/bQNMZ52JgQ?=
 =?us-ascii?Q?1528tb6+eBE5g/iAJRipYMTdjUS/l2rZNykWr0wnleYajtdTSxoj3a5ALo0K?=
 =?us-ascii?Q?rDf0Lno93xyC/CUnHKW80f4wIBb+EYpCHAaCUvIJRv59BOjoe3SvCeSCeYB5?=
 =?us-ascii?Q?+YM+CwC1rmmyHhgvxjI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:10:21.0893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c018e1c6-2b68-473c-d5cf-08de16b1d75f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5802
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 06:10:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19204

meta-ti / na / 20251029060456.857646-1-v-singh1

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
- Patch Series: [meta-ti][master][PATCH v4] ti-librpmsg-dma: update ti-libr=
pmsg-dma SRCREV & LICENSE
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 29 Oct 2025 11:34:56 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8d704d7f3948d3c631a34e3be2df0cf72=
a471422

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




