Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC5BCD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:53:12 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15059.1780473189925087012
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 00:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=fSmzJAvD;
 spf=pass (domain: list.ti.com, ip: 52.101.85.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHRVwMinU/T2dMRsrBQK9vcLoEJwmtnEIb2ZYd1R3h/EusO951xJAg3q68BKr+JDUx4+bNPMthjeudaRgyMaFxmG15WRnliWjGiE2L35bLczIDhB0CCGH1GNu83wAN/41eAR+jCaqDzRnceOZIEIt2YjA4M/rLTG+d0Pd5/ph7+H6JemCOqn6bBpR2PKq2dtdbtNK7ZP4SbyY5jolzZ5HIcD4xHTEpeBni5q9p0VHK/pa7DE/V0XymbRxxRa0UdZmLom7JiplAxhaMSFJ9g/9UHOWS4oNknNOt2FiSwRhUgdbU7A0aFa4Eusg1H4go8h3H0c68hIhGgE7h+DN3Tw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+1ZGQ7lTJTdfJdCo4spef/MO8BB5/ZQanCjbNklsqk=;
 b=CkIeg/vKxdrtkItrdVawLTXX4xPcJqnoNbFcVn8UXQjDiXn/nxb9IgizMv0gYj+qR5cqlezncpNru3FNy9biX07TkXiO5/T6MW+GIaHkdR9TjidkIaywjekKEe7szHgMuaT0TB82loVsoZGCB6b47njL/9EGrW2TRbQadvKlOgCQ2PKEAlDPAwr+n+mXwvhnwaBK3c5y8jaITMt+bLT8+USKIKr4v9lUIlKL1lJNpYueevDqfOa9bgM3q4oSZYdQC9tXiomMF10/J6VKegiprxO4t0Cj265lUtu0V+JbwAcO+L6Snnj2lL7AQAO6PXd+edcjbouwEveCtV4KiBZ53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+1ZGQ7lTJTdfJdCo4spef/MO8BB5/ZQanCjbNklsqk=;
 b=fSmzJAvDsGTZM/5XFxyxmXoSGYQrc9Xu4m662djU88O7r6x/ayETYVsEN7PQEYEOx+XAuQZegpKNuucqjTpCQ7ViHVz1g2NffVCYQ5WZR2KINlBGLpvz7MwQA9OroOO0sEy+DPAc9ZfHm/ncc3TX/jlvMDZueByvEW7FQEd2pjoi1a6YWi8rTd24UzBKNo/a6q/zeZ5jUwEEj67uxLJYsiUl7DCW+ZP8zcQit1IsazKSP+0pHE4HZIfdTJrqdl14kub6FNw7ROIF1iYwwQHGe94WgEm/R2WzhgcBfb92AdGJKGGNLEsVmrCzepWskMcfMWS9TocT/3c15Cx9Mg8Feg==
Received: from CH2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:610:57::34)
 by MW4PR10MB6680.namprd10.prod.outlook.com (2603:10b6:303:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:53:07 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::6c) by CH2PR12CA0024.outlook.office365.com
 (2603:10b6:610:57::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 07:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 07:53:04 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:53:03 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:53:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 02:53:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6537r39S4049650;
	Wed, 3 Jun 2026 02:53:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9B11E9ACF4; Wed,  3 Jun 2026 02:53:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <nm@ti.com>,
	<u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v2 0/2] Fix NFS boot on K3 platforms with bsp-next kernel
Date: Wed, 3 Jun 2026 02:53:03 -0500
Message-ID: <20260603075303.3191683-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260603072932.1273938-1-m-shah@ti.com>
References: <20260603072932.1273938-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|MW4PR10MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 029214a0-e10e-43f5-fa2b-08dec1452500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jx5f1OZAQrCHmmKmlhvVauRwYy/L6Oxv3zsEL3JZ8Z78ESiu8+51ZllMJN9aoqKmlJLYbiWH6VZ1jrHQSxPpdZdiqaouGcwy6RpGQ2FYy+TtKNmCP3HrnM/lz1OjVjI9X0UGu0shiMJwkuZkTG2zJQLdxA+A/8YEhQ3rQjN6WoFNY0zI6UlihYciLShKe0ToXSqntPSzwpV5SzC5fKWIL7mPipaNZPR+kV57bgMM1WKX3vfeRadqHKs9gw6J5TxQrOwAdMmRnKLbSHPD29Zx+tFVVEfPU1yG78/+NihYfoSp++qJi97j5gRWu0rBLFdanYkGeUfdWmmTtSuPJbDg9D+S3uAmOltUMVsDkuZCq+xQSsoj5LJ8ZbeIRtFOtf2Sa0ZjYrSvGkuo5hBIHb/BO6D6NxU+q/O5KO6LHSbxt/Cuh3TKOisrBVg8rhYdlorrgibvtP2UsHsbF6FFKUsPnV93RPsgkNs08+WXrLWfPMluqrlJcePU4gLNG29Q8yaJ8Whuj9zDYhg0cgDXHchzulVQcjIVfjYPnmy6/zNMiGNpZ3tHubpL49zGFxuumUF+8ktc3h77Lpo5LO7do3Av6edZwua8LhHLwbT6miaPSD9ofoHoKEhYmPhIsv4nm4/VdgNlvajuaxxxMym+Ss9DYaNRHV4eYf8IjIX3aO3zDavV3AnWrLwyP+3ZSMKFRxee72oDetUowuOCnGU0IS0SfPmw49vXmyYpZ4KnNNBp6KY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KHdwNZkdFzbEcwSxqx1Z2jkGTzrG9QO6oWdrLwEw7aZ4y9ILFUKvqMh3Lv0nI6pXehdA5N3g05p1QHGrweOrMvHnlj6Pz/Y80R7R7cD7tM0I0iQuHV62By2VySxjGlMaIjewpWrVAv80bJaT4m0Ik5d7ZTCYfGrjhsD0GdsCWYp020K8CenFn2iFJGHoleo7wZLVA9Rb7Cw1H6OZRioZ0KSfo4JszLtFyVQmjiVNgeRMvz7CKgEqDIHwqJFpVNWKbjVh/gGRNzIwlrko1MshNLa63TwGWhdr/vtxfMlVajmblRs0qqNRauqYbksWPADEzBI4iwnFMYoKoSEOKPVrGQczL7qKRGkJ9eS99XwqfiAzqJ037D4eunIHwQEKYbogfNnUm4IvADeu9PtvOAug7519MLjoHXKAQNud0lTII+KCLeQtIcWQNUQh1ZNIU2dU
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:53:04.9978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 029214a0-e10e-43f5-fa2b-08dec1452500
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6680
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:53:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19961

meta-ti / na / 20260603072932.1273938-1-m-shah

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
WARN - [meta-ti][master/wrynose][PATCH v2 1/2] k3.inc: Add CPSW modules to =
initramfs for bsp-next NFS boot
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master/wrynose][PATCH v2 2/2] initramfs: Add initramfs-mod=
ule-netsetup recipe for DHCP network configuration
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-ti][master/wrynose][PATCH v2 0/2] Fix NFS boot on K3 =
platforms with bsp-next kernel
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Wed, 3 Jun 2026 12:59:30 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 84c1ab692b1f6796ca8c613b88e6fde6b=
dab2e6c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605272200
- Commit SHA: efd871d4eb504ec366027fdf6d1f934d2844a04a

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2 0/2] Fix NFS boot on K3 =
platforms with bsp-next kernel
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Wed, 3 Jun 2026 12:59:30 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 84c1ab692b1f6796ca8c613b88e6fde6b=
dab2e6c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: ae9f90cf0baf823a20d10b5e4e3c6af465dabe98

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




