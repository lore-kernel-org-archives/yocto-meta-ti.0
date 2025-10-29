Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC16CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 06:05:35 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.15])
 by mx.groups.io with SMTP id smtpd.web10.1498.1761717927852661669
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 23:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eNyPvJH2;
 spf=pass (domain: list.ti.com, ip: 40.93.194.15, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAywS5DiqhtA9CxdLIUVrh6NVDDguQRGNwrQdHnPO002XGFIJKODnq0j7UOeiAv380LeZll3N+TSnsu/4WOgQofTWesYpdzhOmpZjPt4TZDwI+SvZM5zVY90zSl5LpazQYg8qNtcASqssWaoDUnMt7akdrnKbQob7i0nd1cilDKfXMrrPPjE9idCl9RP2nl2kC1B7CbGYNGpe0vZd0ywmP3DtWzXmIS3vPmNvCKY342ulSN/dHEJiamVpcs6u8qfpHwp72MP5QQ3DJh4Zjh9EQzRUjBAmHV9FP8osLnrW3zFQ1KJTsJhMrhwWIx6aEFCGtNomNYGYoYVe+20AYSZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFCfTtNw3EhIoeprDcBLAnAR2QgepuKzxeBQhhLESps=;
 b=YBbG+rAjaNmAKtYRjdlMkeVdCLMhoC6eHLL+CBKQkEPHfKFdYQVmKkYx9VknWw2CLhSnbHckg/vM8KRKJPhUUC1nwJdb1emTF1xZzFZsCIqYiko9up3R7WI82d6qi5LEPO7k9ZgMOOCyf9r6GaAGXQjcnz6wvh2CKZgn9U7CDOTtxEGyF/cpUYMsDl4AFtj/5lq9cBMMTyUhvioLpZ2q89imtB2BjsFjl7O9XFX2zUYleyJXOmTCOzU2DYzz/aBOvvvt2BPhgG5AI5/C0vfkZElFXG7GRqr+6ybmoNg4U+BCT5vlSvi2beSoVa0l6wEIferHlRsG6+qa3EcyXfAXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFCfTtNw3EhIoeprDcBLAnAR2QgepuKzxeBQhhLESps=;
 b=eNyPvJH2/zvwEyvwIiMxOPgizyvZ0sYcwnsSSdd9PLeHBabCfcH+g+BeWUUOurolZzNY4JudtZuyaNXKHBynCg/vkoieOBFvKy2wNyf+pctuQUhkK+OPu1r9a3a74WYsdp0cmIp1kLpt46duqdH8J5tCEQaE9nFdG8pDLQzv3uE3AOzd5YNUTkUmA6iHmMFNGRDVMtKrn6L2mqJ4Ejsy7UJqnCEKfMFRBcdhaEgZpxgzObZncXGno4TSUX18QKQiInR1Y4Pdcvns0gEQeaGpulYkgBz2RuuUWzS7oRe3QRbvA0OKPrv2yb0oZR976dp/jSTx1lX1wn7ZbACDzMfGFQ==
Received: from PH3PEPF0000409B.namprd05.prod.outlook.com (2603:10b6:518:1::47)
 by SJ5PPFE1CCE93FE.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:05:24 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH3PEPF0000409B.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Wed,
 29 Oct 2025 06:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 06:05:22 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:05:12 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:05:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 01:05:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T65CxT3543283;
	Wed, 29 Oct 2025 01:05:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2AABE13F52E; Wed, 29 Oct 2025 01:05:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [meta-ti][scarthgap][PATCH v5] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 01:05:12 -0500
Message-ID: <20251029060512.1961474-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029060209.707510-1-v-singh1@ti.com>
References: <20251029060209.707510-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SJ5PPFE1CCE93FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 061acbe8-dabd-45a1-9e37-08de16b125ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z3ZBV08WbIcg18MBvmfmzDTGaWUldcJQGNE/c5UpUaTFvHK5nrYqnSb736iY?=
 =?us-ascii?Q?6fhHpb3sLo7YUAVz5T2igN0hWm+6QgdVYW/bqXthYv85rew0TXiT6LQ/csS4?=
 =?us-ascii?Q?CFDSgYByc2eKkh67HMaywezLHMm0ELPUlnQ1chGv01z7EEl6S/MWuEzJdpkm?=
 =?us-ascii?Q?iLZgxF+syDR+l7pd/EFIE6DUdnYaSTteaAfjMRixY1QDbhsIkqtlglbNkaKJ?=
 =?us-ascii?Q?f7lI/OPT/Ee3MNYX8MGNeJz/qpAeTJtZaYBLXz27qBCf0/Lfh90iYh1UkY45?=
 =?us-ascii?Q?GQDPMMQs5wFcUzT7TSEUWfago9ZbUo3zFNCg05TJwOZ5Uh3YTq87OTPbeO60?=
 =?us-ascii?Q?9S8gle1Vpa19nHoBDlN96WD7qlwW2X+vSMbOY8+/cle6cZ/cFf1/RL/eNgSa?=
 =?us-ascii?Q?qrLPXTS5OX4axiFC8bnX/IwpcRw1yo+Ge4gyW10q9jnxO8exh4uu4yP6eSDU?=
 =?us-ascii?Q?vXMK22JnCAwl+4U1k07wiGXs9hNWAso4J8tzdqQeHhLZKeRTNc3WfZYajQsD?=
 =?us-ascii?Q?hUdFgxT958g2QVPN6U0f+R03Gyb+djJ3ld/jHbF1Bx+U0AmRL2md/skg16jv?=
 =?us-ascii?Q?uzQAsUnmTzXBC2m7DkRFZBgNoslSlRU8oQYjnFFwW02v61n/KkQvCiPfMuu/?=
 =?us-ascii?Q?hOkLYsKQX3m0NsvmvSdc08F5f2T3Q25uD2FhK5Dob8yDyvGA905HYvumtMVE?=
 =?us-ascii?Q?K3AMb85XLGZdPWG2w06oH7WujFGd6+7KDcOv6h9PiZfEtKq12cqNtmgKMT3Q?=
 =?us-ascii?Q?axICuQ1zpWdeFgHFNUofLYDiAYMhQjOA6vzLgzhG6KwjVqar5FhWpAcR0ClO?=
 =?us-ascii?Q?LadEeg3s/4txaF11xRhFXRnY02hGDs3m32fyrquT7x7HpfgxRVY9vWqyvGo0?=
 =?us-ascii?Q?mhWqajrqncLlnHm7gu+LY42OqPZhmTxKA7ITAommpOCvAF1vxwjDxKFBURsD?=
 =?us-ascii?Q?xIS5+L9NM4vnmIokVS1emXIO5a07+1/hGrHTMMEMdVFwFHKy74LrPHcj/ltZ?=
 =?us-ascii?Q?5io/fTJEKKPvJhzSSY/5FrNn6gcYxCQqo/vcAEgggee5Sm4sHBsJF/OpgO76?=
 =?us-ascii?Q?E9et9LSBg7uP8JJpHlqaOOnj+riWla0+5+wcHj3wKCAm793/C1hhHdMnV3hV?=
 =?us-ascii?Q?43tPE/M7JxTeX34x9VDnjYGr7G2srayTkFSnU210lLVuTK7G0Dojd/E3XZJy?=
 =?us-ascii?Q?NlUkuY7yAL7rWRoqyzxtSqE88PYpjx4vfCIP5IbRDdA9Audnx2u2d4Kooru3?=
 =?us-ascii?Q?laUjv1oc2U0FKsY8tpLO5c7B/wGJa+YVLuXCDVtggXBx+anszwFiuUpZAhKA?=
 =?us-ascii?Q?EyJ2OS9Wg0VHEn/pe6qW1KqPA3lsSyUzhCi+jNimOYWrWdT7LWPBWJn1N+6f?=
 =?us-ascii?Q?kIi8EYaGD758aLQf54by5DqAF3X5loBPRGjMxn6U8NuokEwFW3UOrANOMw/C?=
 =?us-ascii?Q?vUpBjCyy9cr/+CCN91WPDNB/L/5NMU3p0LemfQ/8yoRL7MpXp/ztFx+ot/nP?=
 =?us-ascii?Q?/akd0XqS9P0vC4TDH9ZWQonCtOGC0SFv7ujcB3A9pa1I6xsWsaGGiq9Y+Dls?=
 =?us-ascii?Q?RltdkgPOyKwp0GEjn4g=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:05:22.9438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 061acbe8-dabd-45a1-9e37-08de16b125ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE1CCE93FE
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 06:05:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19203

meta-ti / na / 20251029060209.707510-1-v-singh1

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v5] ti-librpmsg-dma: update ti-l=
ibrpmsg-dma SRCREV & LICENSE
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 29 Oct 2025 11:32:09 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0a29db882d61f3bb5afcd05ffcc3a6c0c=
b4e804e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Sabeeh Khan <sabeeh-khan@ti.com>
- Commit Subject: meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.=
0.323
- Commit SHA: 6245469825ca824c83b2796553bcb9163c6daf66

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




