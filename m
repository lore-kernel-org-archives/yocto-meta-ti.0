Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAA6103E198
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 15:01:01 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16309.1773846052506096102
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 08:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=LDx05AnV;
 spf=pass (domain: list.ti.com, ip: 40.107.209.23, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbKfgAaMBerh6yheTCSyaYX5gFgwzVeIvS20t5jQTws0aJeZ41r/daTfpS1ttyZDhdfgSAXUqbzxE80zsyQNT5eWopAuMGPjLdHofvdZsYdx943FijRdlKr+1np4InGqTi9BYl/NW/b8lpts42UcpByz6A6Ka4np8HodBjTDeBh+3nI4e6cSGbIOt0Q4mKqRNvhEoUjBMu2HZhGJ+pHG52COi9HTQ0TPjMIfUuAkNVSAmsW8vyDr0KFdjXrQNawxkA8bIZymiZaK6dlo+vDyLWneMicjRkqzEIgv3L2RRFvVeefVEl3cmtkBGqi6I7+yBUU68jhs20h3jOeNLsShNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6Mrb/6ExkXF+F60ceaMyxW8rj7oZ1yAKXGmIw9Zq+0=;
 b=yQVvQQ8bbjex40f7/3OagxtGUPj6e7e6+mQugud1lN4nuL1dPeHjNnc2ocL4InKJtGfduNkR1t5ip7F7j+2riIaCRqDTCXcvze2rYJlyGnjb7D8bFEwifEuqUuQKyainjjV3NG98tdB6hUWXCekqnDRuUSeomXTtyyNz6e2LYSVN72jhrVMDtyPrtHCreDrEVbNG8KWdxXV+hNE3ziIfRCBnYLF6nKM6D3FiHezsWbHkgzBGoPX+6zz8udWqWLRvPJIxuVV+JbtDNKy6Rw8lsQakMQ3UyTKK7C5FPjHni3Y36G/RvE29B7+BZFKhKeebVCA/bhrF1/1t+PMupjsO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6Mrb/6ExkXF+F60ceaMyxW8rj7oZ1yAKXGmIw9Zq+0=;
 b=LDx05AnVH/CdwJ4vg4u8qRTGt0PZS641VEMV91uWruoWV7ykg29fqPlLX97PxiL8xKyUlCxKD6sFi0xZr21UHSA7BuK1isA8pen4JQPGgHcq5o5WMjRA/EfedjKqFtEKGdJbNof7EHD42WmjUxM5SgT/prnzCCbWCqV0uNwBgnH8P6Q55CxQ+Y+NM5aE40n/f90TG+b8RsU0szWeNQu+m8FkyEgZj+nB3HyAhRO7HGc5zQY4sG5LDUx9pLlxBmf1XvXSdygNMWRljJK2XYATyvFXLuLlam/A/9vL2OmDIeYfO6iy+G9e5mg9G926U8lZKldM+QbvQSexLKyjZdGwmQ==
Received: from CH0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:610:11a::14)
 by IA3PR10MB8393.namprd10.prod.outlook.com (2603:10b6:208:57c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 15:00:48 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::f7) by CH0PR03CA0343.outlook.office365.com
 (2603:10b6:610:11a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 15:00:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 15:00:48 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:00:47 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:00:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:00:47 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IF0lEq3673304;
	Wed, 18 Mar 2026 10:00:47 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8B2B09ACF4; Wed, 18 Mar 2026 10:00:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
Subject: Re: [meta-ti][master][PATCH v6 0/3] Add LUKS encryption with fTPM support
Date: Wed, 18 Mar 2026 10:00:47 -0500
Message-ID: <20260318150047.597687-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260318145732.2115521-1-s-tripathi1@ti.com>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|IA3PR10MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: c566eacf-315c-419b-5c41-08de84ff23b6
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	9ncrE7gUNGqWdKmEucboIy1c2EN6uWzA8zD1MmGORuwVOGx1qKhH9A51QwoGc4L8tA3iNiUQ+x3GwOaeG4boXO63IhWwE17o0iM4ALhe6CJZxDLX3xPYCxUSLaoiSVsBzWHWZlhH+hXimMrzPlDshfNt0xi/F2xPrxpq7/3tisJgPUCZQ2jsf82tp15VrJJTnmXHgr03e4l/WYnnQdOl7q7blr2REgKTCKciW+M208PXhg27QQngcPKlGlzGSNPOvNve7fAfCawz5weEfxu0btAbHYNACs1KFAj6dfifdCjpGOt1JCnPs09CCgyy+YEF4DxEm6CA79Ln7euSKSKrigNx7uYnpoki64KIaM8qaMhHNostRosa5unyNETnKALEa/LqxsvPv7MU4ZSoQ6Hhy+caNrj11iE6Hw/ACfvyy0O6FroDlwEgfh4AYpS2hb9MZJ1KOS7tmt1PSj2ZUvvWy9eeqdUIAPsok37I6tgKkmNnOqj3ps1cpmwM5uYJVLfltUwpol5VUaA36HTN2lGInHvjrjGuH+MYspq1lB4NwzjHnd12MJZZRM0PYmU7UeT+Ml1cWAbbI7V5z1++2gB7vxU21uwnL6hpF00tdd1cau++g79Lu+smi+zyD0QaHryo77cO8LPta4Dp166Gig8kdsMjYtpb4hKEn+OmolxgQXgsoDa96LGVB4/JrF045TjvFvTz0Q5XKZfzeiBxqWUuAC6yVkapd8ZiuG8rFYg2wgGtiSb0mKuYWgXxwrGKpAOmzihHFGDOJ2udecC0AKORLA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8YRyrAqz05Znk0cMCBvC6pbImVNWoxDpHmaCrmHj2OnN+rMCFs6MhqKmUqzR+szS42PhQxZXp1/2cygqJq5h1PeWrEZfZ2ile/XtxnE4o15WrvkAJd8rqefwt1djMnM4KE/J+YUaphnC130Ob7d29vH9/MEIcUgst324F443FgY1EkmBOAKsQxdAm9RNcgyHfzBmur7eA7zoVItgXRdmO4QVsH2BbL5HKbiRPSpUpUyWWSPr14TDlfNG46sisi0AF/whVfLzsOZf+AGf0z6vYS8HKt3k2D0zdHRbH4XY9kqPCnO1bVk2JXp7ZHJI3XeDhguLWr6zx8/FV4YXro0msCVL0kWMwtv1sNVVQ0H2obES27NwF22B8cSRKwjogXLoix4SEhaaVBz2mGjga35PugawYUqaBvhvG19yscJtPIXtKmbYTjHMmXNUGh7gqIfM
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 15:00:48.2947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c566eacf-315c-419b-5c41-08de84ff23b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8393
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 15:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19763

meta-ti / na / 20260318145732.2115521-1-s-tripathi1

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
WARN - [meta-ti][master][PATCH v6 1/3] linux-ti-staging: Add LUKS encryptio=
n config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v6 2/3] initramfs-module-luks-ftpm: Add fTPM=
 support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v6 3/3] conf: Enable dynamic security layer =
for LUKS
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
- Patch Series: [meta-ti][master][PATCH v6 0/3] Add LUKS encryption with fT=
PM support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Wed, 18 Mar 2026 20:27:29 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 366224c7d6622670c2bd5e289f7a94113=
5288662

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 1ce070a6b1f8bb797c65b51a7968ffe0348ba053

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/packagegro=
up-ti-core-initramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




