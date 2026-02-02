Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E01E7FDC7
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:50:41 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62373.1770061839811801320
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 11:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=s1ku/QxA;
 spf=pass (domain: list.ti.com, ip: 40.93.194.12, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYsyNwrxFLYsSxM6ETtzfz7oBs8BuZtYa3/bdkA3yJFctO4H/KXP8opx/GvzhXNN+W4gj50QlroQvjPsKzoou1l0iZbTtK4YwfOT6JYEfEjOiH+lXodlkyWdQ/puYhOwbDaT7+PAIBaF+7R0R75XOfCLRHaw1wEO2rh+8x+0bZmxKgkRW6YNJizAxsHOxjgkz1DXDipph4JtMFMKrqTaqFqvoIfpIZLm71kxTODn+HVmEIq6Oa8go5EvcnAOSMlTxB4Pp958eS9iNZ5SouZ9MCh9b9NP4iYi1NHJ0i5wyrLQulseijELpCixfi7lv35+s29wM7GKNFt2cLuxrR8APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04dKWX3/+D7pHAHcLhjNCBgQYaxLRMBB4BCBGElmjAI=;
 b=Zlv4b4VxMQ6l78sZxYZQBCwgXI4s4+kxdxY6DfUdOywAZiz6k3etZ39X4eXHL+S40djNtZH5hhPfC6KaXxJPn5ibd4+TWCAE12DDX71PmmhG7rf33ruRpK6qak2y4dZDcBftRJoEoYMzQye5UZ6Q6pnhnRh2PBjXT1+nSZ0baZcoYCqq+z6HFOBB9Ijtht00IGSf2FXU9IXykxqqUeu8Q2dhtC5QPfMyNot6BFSfD+dDU3DRkTcseF6FkbGVZZjWvU/woF3zg064ZXiFV4ppl8LKRsJO3aPNBKOX6C8kPPdx0bi8PJgGCYhvhBoMiJSzNG0n8gPOUuKKPfKfqODG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04dKWX3/+D7pHAHcLhjNCBgQYaxLRMBB4BCBGElmjAI=;
 b=s1ku/QxAewPkxprme4RQrJavM3U2/WK00WXl5ejNrNcCCbSQRUshI1oXR5UBlUx7za7XDPlC7ymXIXpxt8kQ+GRpl7mj5ajLEwlB6EyI3RKpuDGTkTuLNRCIGdKJTFvCaqa3+wbpb1ySHzgG8LeMKymDtRo8cGOu27D1QhOQ3mNrpEFeQdvRwy0eM4TDi389+7Ilk7mPtdFPISZhuu6/4MK0OwQJUjnxZkFgkjtPfpwDWIdoJekpQYi3vPSSdav7hdWuRqLXcZxz6FlujMtSwb1qt/YjwJSPJIA8BGlFVsfvUFSTNL5Rf5wx5o/dbKTQJkeg8mUzNmEiw4OjMpL4Yw==
Received: from DS7PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:3b7::7) by
 DS7PR10MB5008.namprd10.prod.outlook.com (2603:10b6:5:3b1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 19:50:36 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::a2) by DS7PR03CA0092.outlook.office365.com
 (2603:10b6:5:3b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 19:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:50:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:50:35 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:50:35 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 13:50:35 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612JoZku1744437;
	Mon, 2 Feb 2026 13:50:35 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 45DC89ACF4; Mon,  2 Feb 2026 13:50:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
Date: Mon, 2 Feb 2026 13:50:35 -0600
Message-ID: <20260202195035.3776873-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260202194811.1717470-1-lcpdbld@list.ti.com>
References: <20260202194811.1717470-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|DS7PR10MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e3112e-dd44-415d-332b-08de6294557a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wXO/TNvVbXeafUiGpFe3z7SOLzeB8yPyjZcZVU22zLqpQmgWV9NGJIglflTg?=
 =?us-ascii?Q?zYRdLYbIQXQVjn7j0mt2qPH3UOFX8S3ResenrMtmgd7WwAVLZsAWz/MExD3N?=
 =?us-ascii?Q?7X/SlPDxAr51G6Vi8Zf1thPMqUqMeixEGgn/9g+kypY4X4hzaIGH1fr90U8q?=
 =?us-ascii?Q?g64+ocexCEk6I41h4izhA32jBp6deOjnD2yS47ipqkxYLHoeqleLm3yl+AMV?=
 =?us-ascii?Q?TtUAUQg+3R7os9vjcfbEWNudI5kv8QSUYQcHk5SntXNz4nA5XCMKooGAw24X?=
 =?us-ascii?Q?6PWl4JTnHCYWeiR8JHQ86QNopRJd8foY3R6d3yyRtvAEPcxM1/oN8MEX+0b9?=
 =?us-ascii?Q?k9sLGCp/sQCl5zN0IJP/d5wSvDUptMtF+Cg/MAstyqMeSnSdvDxz1YxB+8w1?=
 =?us-ascii?Q?UcNaIaUFtA9yxwNBUZJ/ZAIeic895ez3Xzw7NK3gNI+gNjJTeetmsTvKa9N1?=
 =?us-ascii?Q?j92nsZYi8Bv5hIZ1XCtBUo2OVbOeWBPKnHmDavI8aGpGV8oQn0CMZUknm6VQ?=
 =?us-ascii?Q?iBydN+eRqjZHNLDCX/Oax5ke5Y+tu5Z58pEnYjkyAjU19DMTPm0pyUGap+T+?=
 =?us-ascii?Q?/wbVMx/25abu3o1FSAK0lsfEWpXJ9SVenQ6tnvBqYsf3ZK57J1qUGNyiyVG/?=
 =?us-ascii?Q?P3KFuNEzzsCPortvWMyMHt8kbYFxo7e8OXlF8vdLZCChoLPvB8m7XTwm/3I/?=
 =?us-ascii?Q?HHHUaj8tmoFUoTT3hFfh7UHBR/SNEzLDVeNEgMrKrcx+K9/ikvmDm29Bvsv+?=
 =?us-ascii?Q?F++yOPeqysu7rNtZ9l7k/iOfQ8HcAo9mfSsPKDAyxey8F3JG++eiTuUJcqA3?=
 =?us-ascii?Q?UxHB2SBx2jc3YELEqh0tL2fabTvH6pGI3iltSvTOtDpAKZ+hEtQIu/xYf1F0?=
 =?us-ascii?Q?vVY8PydONxHK1rOZHOH9D2QvNCsWHiRTwWebI60OB8Ys1Ts0oXHpoBxX/0ao?=
 =?us-ascii?Q?fjxOvTKklvsbvvmM94Yw+WaF0xcsaPuu/kvnAc7zft1zFK/DvSkXv9U3b/q6?=
 =?us-ascii?Q?dXmudsn5aXpBexalXlYLwKRp+XbWjfK4Iq1Uo7Uxtt3vuVcFHk+1th7QydHR?=
 =?us-ascii?Q?FYKjsJxd8jnwcsPsmM/B2v6jsRa6P14qmJkSB+qvUf5Gb8aZd6m/fdb/rKR9?=
 =?us-ascii?Q?QEeJVJwB9+rS3lv+pfWIVeXREYEzcP//3x/2XPJqg8IXa946zSdrGOlxpKx7?=
 =?us-ascii?Q?EMtb8JL2/BIN/hXxT2j+DyelMuSZJ+xtp40EzJMTxup5+WlBGpg6UCwiQDW2?=
 =?us-ascii?Q?b8AMU//PX2obj/W+m23jXnCCvIB/T/Q/w9FeBtDrI2G1+/b7tGWxMo7OytOU?=
 =?us-ascii?Q?3wZ1DE0HVkLyPWOvSfDHNRF21K16UUmHgXpQqBMRI+Ads96Uq+N/QPcsuqLv?=
 =?us-ascii?Q?Dwxo0mm2wi1X9+zmqfet7aTOwzzhhZMwMVx3E6NNq1q3CZYsIrZcTs273xXT?=
 =?us-ascii?Q?XrdZdokbvMQ9K4YyInvhveH7NBiJI0zPPXF8thPWq94ebyUgTDXFFZoTPqDX?=
 =?us-ascii?Q?IRp6dqg2mDAsN7Qv7gGlZhWcaoHd+Mvlu23fR9Q+LV0U2Apglz1SadLTnPVx?=
 =?us-ascii?Q?Ykyij+5lEv9YgG2c6D/x/kfrga+gibuEedaBAYZhS/DX0ooZwQLkz0R8L+ax?=
 =?us-ascii?Q?dEwQl0N4KIQGoIAEVxwPsrMLVjGsuTLvCRA8Vx447ZWwdwzoMR8GF+1DfSvm?=
 =?us-ascii?Q?SCPROQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y7UtTQPlOuddpbjU9MHdoFRsXAJoJapcnkVnDvXkhmOTBvERdy7hQUo5nu3+sEk51ErFrEoUWiuwckcYcNPN8rDpuCsctCUsJB/nQkp+drMe9r/CZntnqukSKPOtMpB4CXYbg3nHcMpYAcriBufVvsm3EFVzXw4LlfBakPXTr2cEjCqa/EzgXF4GSxOBOcGF0HluKs7eTTKWCskH/Tn1cA9nOt8Zj4+fu0+EXp1hcnb9THF6TVIR9QGmDTYGOs4fG/XaBihllFm+iSFSPmQfch2Alrkk66lCgFm7jiI0nhrSUGpbgiNSHmQWLpF7FatcLxPMP+pHSE3ksPzVdL/wwic5Nt2xYoGNMNtyCOT+mSoiCIgaqSoXYy2dPZkrFfzxMhza+aNbFizMbA6gI/+y6BUs2UqeENBVLOLKsklfZd4+RPocBcwC2fgY25Z8CEjm
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:50:36.0869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e3112e-dd44-415d-332b-08de6294557a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 19:50:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19454

meta-ti / na / 20260202194811.1717470-1-lcpdbld

PRC Results: FAIL

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-lts=
prep.202602021018
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 2 Feb 2026 13:48:11 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bd5f0012a46a3d81e174e65b470bd22cd=
ba8029b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
- Commit SHA: 22e889c2057e86800522f69ac4d263b17101b2c8

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.2026=
02021018
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
025.01.bb:4
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
026.01.bb:4
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-=
rt_6.12.bb:10
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb: pa=
tch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.12.bb:21
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch=
 does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.18.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master-ltsprep.20260202101=
8




