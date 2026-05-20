Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA71CD4F5E
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 06:36:58 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6128.1779259007728516908
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 May 2026 23:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=a7JEgo07;
 spf=pass (domain: list.ti.com, ip: 52.101.56.34, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6bimQM1+xUsqposgfBnOcoJBzfJGztBoa9x35KT0FChdzCsU8Hsn+j0xV1VzXLmKGM58k7O8BvfypYICbZsgl3vrdvcFyCFtH+VipFbp3QVDtl/PyQOoCd/atS6egW+H0wEtXcrQddm84hy9hhdv4Wc8Q+NS/wS/CzxQHKfI/A0RIiLp3APRNyury4dp3CwXEmqCfsvHe9ZEKp3lFNI+I4W0e82Y0gBqvF1CKhMerr2tp01/81Gyq4NAGf+y6feMpTibblwtKVK+EC5Wc0AL4p3h42wCvQNyZrZ97YHJH+CClGU8YATGtnIRuhtjecm9tB/5xjuPpIYyTvNSFDzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxf4iuu8iHhYmUb6rG5s59pYKR8OiUwwI99HsVHcWtA=;
 b=pX+puLMMOAJI5q8Vk/bhQtN+L0Ht1SOKify54xnja60GepZf4ysl9YG/kc/yngR2BwpthOVRbJPp5qdepOc90NsTwV6a1/P9LqwlYfRchuqTvoDuFvzOcRz1H3ke+vC875RFm4jJzPp7z3N/yPDvHAOzKn2LkBIik5sKp9RMo2vE8Ywp82mfR/t36ZKw54qBqFuatLRCEvrGbr4xT6BEdmAO3WRPklV7K6X+oKVV2jNEpDigomXXzBgDZDDWRzMXG5/4dPyKjttZqt8HbNTnqEgP4P6xmvQ2X5aW30vaBJnOZx3EV6mb/Qhp/U3tIMxakQtlgiGLLDquCc5Ou7GjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxf4iuu8iHhYmUb6rG5s59pYKR8OiUwwI99HsVHcWtA=;
 b=a7JEgo07rbN2bddxoQ75/sWGbe0U+YfMtb+Lx3c0PDtklaC9mYsm45TsOuvo+o1D1jp7KvCAJj137f7c7SQ3h+aj62lc96YwzN9WdFOExXDElzLDF6K/C7bz0j/j4cYL42B+WpOoYufH1DHcKbTVSRQVjdx/s2m9bB00tuK5QeAhjKdCVfnIuDi4pv+sGynsE7BzFDtWZbVAtZEE77Su05r0m0gkcRK2CNjuVHISoBXreo14X/5QHPrrUAWwJZAii2IemOwYTBXtPT2S4QKiQhvcNW2cOcfD734l6HrqhVTgtMkC01g/cWqJ1BXsaoY90KHFvua0tWK7F+Ms9E2ajA==
Received: from BN8PR04CA0065.namprd04.prod.outlook.com (2603:10b6:408:d4::39)
 by SA1PR10MB997787.namprd10.prod.outlook.com (2603:10b6:806:4c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 06:36:45 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::5a) by BN8PR04CA0065.outlook.office365.com
 (2603:10b6:408:d4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 06:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 06:36:43 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 01:36:42 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 01:36:42 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 01:36:42 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K6aggJ865094;
	Wed, 20 May 2026 01:36:42 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 414729ACF4; Wed, 20 May 2026 01:36:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202605192200
Date: Wed, 20 May 2026 01:36:42 -0500
Message-ID: <20260520063642.3423735-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260520061225.3838604-1-lcpdbld@list.ti.com>
References: <20260520061225.3838604-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SA1PR10MB997787:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b0bf01-45b8-4d05-5bee-08deb63a2856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	4MWB5QCq0GW1DdM63UarSWrUsTqR2HMO0YDl/5pIAB8GDchdxIMPO9mQ1GpcIamq8EmPtcElSFl3UoVEfXxDJ+lkkAGmAilvTt7nt2ZsgaSLxT9ki8BVUvXZD93B3NKg9GTJyDSSb2BJ0ng3hDgC92e8oK9p8gqHvZ/X2nBMWzerfS/MoluqmAM2EECHm81OqodG2V5+yihqDBM21yYDWywUEM8v5L5BDpjQYesR5iPcm9oRCrAuK1Mu2IQ12h4yiPovipXWlW0cZJR1v42LDjAQiE6x1v3YHKOpqwzL0q3R1OAuz3E5GuZlwsoj0z2ynsamFcbVFCx2KdwvLyleq4/js3ARSBN4WYo2fQnetJomHfGvJ++DnjGoUThF6wc79Xdth6gXI+8GvOeZSMUd3Lv9cMHfW99aIEkfigOQdAzSg38rmP5WjwINQaHl5qSgxYC9jLcZYD3wXa8Yp9HtbdlPrAB7tm8dBQhbOnWdXsd9cJEPGLRKRoYoNXTTDeLUbz/dDsUuAyxvc9DSPMDqKV4pOmE4qDiMHbv7G0K0IC8r/xjXZuEICRjtaHxH4zW39TzgM5Rd5b6nCOitXoxFzaqg90b6YH1DPhWybWOy4J5kClneyAvkT6XZAxXKIn0X2e/fyYMK3922R4th5mwk9dq7I/4X5PK/Dg11da8S6ZVE2ZEb+lJwtc2wzPUWuHIgGnmcWmRndgtboXFtzQ4NYaegYyCn7GaRBwPyILhsMR4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pmjccouG86yj9weaJdbXvKAS1K0Al4xY1CUpAfO+DGpXMNuQkxApUX2JSdDKSNVxxnOOt1INay7ixIITtug8bgN82zMpPOEjZ3X/xfPZmjRRyjIZe2vmnKXIZINUd0UX1FeLDRuZF3ouSTtRPfTXSeBtE/m+UMpnaqGTv8Q6CQDQjAPJGjJtQg5n0nUd+Zgd7c3DKYGBk3/R8h0XFaWPtLWpyvkYBGPkPLdivPBJQrkEeYy6b41Eb2yzkQu0UptNwxA/P6siIiSU3acXK+e6ypWHyp/jDmiiSZEoIox5rwafkPWHKiHX0NUxr0HDlKKSNuw8sOQ3jxLMLCBx2ZWimhZTz6S9J16SqcnjdxLc2P0n6/0k4r30HjHzHNMlFp/qG61hZ+Li99GhSFx9yclIzRtiEqRwN2l5NqVt3OIPprRKP3MPwz+ItTRXGRLHcJz5
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:36:43.3186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b0bf01-45b8-4d05-5bee-08deb63a2856
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997787
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 May 2026 06:36:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19940

meta-ti / na / 20260520061225.3838604-1-lcpdbld

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
605192200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 20 May 2026 01:12:25 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: beb47a175a524aff262b4544681ab39a5=
a439d93

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: b093cd36e5524b9c27f964d4cea424914eeb052e

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




