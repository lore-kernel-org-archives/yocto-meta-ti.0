Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E02EF3717
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:18:37 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20135.1773076710760700408
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 10:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Hq2QBx8E;
 spf=pass (domain: list.ti.com, ip: 52.101.193.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au02hKUTI9RVFUD1LJbat/d9VEdOe0p4ov21Fxvxtxndn7Vrnhy8sv34mIfxgyTSZrBuyy1XXPuEQ2HfrFyiGn6c9dPi4hBCAMk733st/xqouPQLHxDu48fjAjbQsjuf3Lm2BYM+kxanAOlYrg35ajfLv9mR5GgNjefkm9lrcaaqhht7eUn1RVYzMvKGxDLZxnJ0s2erxGQ69Es7KauzICHglm1jLYloqwOlepI5GHW/wbR6td+6z1LGxYxZAx1q/A9D7XjClx9rcoeLlQDM2UHa2VsKsadRojHE3ZVVKWrHPLj/LfZREoDqSgK4WqERVPcnEOsx8lu3cVjQIoq4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvmuHZJJrQXBvswCYFwKmYzQxlFARHBcfv2TY9VZ6uY=;
 b=ATPonMpnSr6f4YnHnoo+bvkyfU6OlwRJfz+agehC4CtPcG5NjRTPIH6V84VrT+wZQKZAg2Q39/e4GIz12NZTuy4meprM/bUUNH9iKMV/v7gG/Nb0SyaUj1b4ohoyUVp1axXiseGvX+SDUb1yYc78Pey5eOx/lAUDk+M9KKIaMxI6noLjRKc3o3HAbryvYB0KOgP1a6pN8D7RahIRt6cc607Du+sEezvbKk9oHK163eMZ0dWXgvy8kJau4eIYZwV2nH5tbc4ni/+ardEt1gT2erQZ6BPoA1o6me+tzFIoky9fnFqjLCRK/+yl2IbOMQXVB8VVRxJDj6A8U6aGzwXzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvmuHZJJrQXBvswCYFwKmYzQxlFARHBcfv2TY9VZ6uY=;
 b=Hq2QBx8EcsQ8kcOXanBqjjvq7t8ELAW8RCczkK37pxvz96ac3oUPXVQs5CZKvLYyWUt5vINOwgOv3rzHKUx5bQB6LAHMTvgj3Jd1A9YcbwbMzE6HH/xcLog+kcdjSsn9obpro+ZEDqKRBCrhSM1Jzf9fAw43K0uSZaLXyXMigrd+MgtN9Y3oAoni3QuXPvhGCFDkQeYOv9lkNW1xVQhPQ9ksyCpKlIFbvWMgPeo83CZAHd1pPLVWgbiFObnRX0PgAq/4oGO+AJsbYs3TQC109X/QChWAK3KvnpHny3bdZUB8U/syjkObhKgmgJA0IGej7qlZjSUYcH17QX7Au2eqiA==
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by CO6PR10MB5540.namprd10.prod.outlook.com (2603:10b6:303:137::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:18:27 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::70) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 17:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:18:25 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:18:23 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:18:23 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 12:18:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629HINv32409380;
	Mon, 9 Mar 2026 12:18:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A3B809ACF4; Mon,  9 Mar 2026 12:18:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Prudhvi
 Veeramachaneni" <prudhvi@ti.com>
Subject: Re: [master][PATCH v2 0/3] jailhouse: Fix build issues and QA warnings
Date: Mon, 9 Mar 2026 12:18:23 -0500
Message-ID: <20260309171823.515550-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260309170134.2779295-1-s-sadik@ti.com>
References: <20260309170134.2779295-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CO6PR10MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e5081b-1db1-4870-cdd1-08de7dffdfbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	oGtvCLQ8DfguzaW9lU1DHOC71he4s0x5Ado71P0hnlCqGbCmR4GPjxSmAyMNjFKIXJWbQ0i7vqkE9uOOGk3FHM8ayr7yCgOGlUKWl+gNQKwJXcWE/ncPTn7E6LoobiZPwcZdPwx0fRcdj9XvQOleI8Bb8C5McTftuv/1pOxcvQv9ZzWVLXv7RgJZcF5VxdLIwddqwBljgGk9oNBqwoTA/O+BoFkMFJLxo/y4HCnMH5tyE3bz9FmxDXxBOUFP2CnoGx0JW4+0T38vQ1mxYDTkPyyOh6bV2QxFs6kIJRGf2V5h4oWooUiwjYCRtOApm08UsUeziul+ZtIjQafq9JQUw3GB65GvWRdAjDhL3YABunA1kE460GSknYEldbsF4RiadUI0KjBJ3HxfW4tXSFPeiDgIA50e0r0RpFFDg+fSIfqp9ASVyHDdsMDhkUtXDjaY39c6Ket2/oxfl/yuicpI9MxFSqVh+7yyWMa9PbQ1MyXvOfV3xL0ar/nU/4AY0a+kVVo0MgrdPAbqlykdxpMzf4v4o2e79NXtMwOPQY4eR0DhjsesPKPuiItW8notsPeMsjQgXai4W8rmnt+0D+9SsVrCOOrZ2Dj+gtGWFQkf6lxkfz3/CHdgUc9V/HIYUPc2GibwNPC81R7xNFtvcRbRzUqTOzYnVLS38WtEj8cfg0kN6z3rRXxIPjs9GupBxD8QIa9UBxo1Nv9IwdV7wQpM9TlKlOQbdoP7JdTpuU3LkGEASuNGfHrb59sHMU80leK0e+84EkxDGaYJw5mZO5j16g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HXYhRF8M3RLEhcyxAtyxcuGx8RRFaq50jUcVdMZxDvhr3mrjk/0nr8Qtarl7y2Eew99WC+o3D5L4/Pga7wskXilMEJKxLSJZESlqveuaWujTzaNZgN9QayqPbmaczyRLLIt3kgC7sKUQOqijCpWGaZjSvtvaTRhGQ+qJKXjsjoBRdf5YsLJ1rLLtX7VuMK/kAXKZieQNn/xSuCLBDeCVGoCpLVEcoZwLvLuRxgV9k47IjdKHsTAXTUXR2ngJYGV3kcA3inQ93Gv4Cjy+8Xr94+nkh1gRQxBrDQ/Vjx60Qs8dghq4tmSw0zTOXuxQFrMRfEzJbgnhcuIsnN2kTdctVa24h15NFanXtUggxSJ7CISv7Tg2asW9bhWzDe8NyadIN+XW7MBOuhNkdXduxbd/vMlzNuJ1t4oC5Kf7/dsQDrMRzeIxuxwNHacbmJaS1JqA
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:18:25.5868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5081b-1db1-4870-cdd1-08de7dffdfbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5540
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 17:18:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19683

meta-ti / na / 20260309170134.2779295-1-s-sadik

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
WARN - [master][PATCH v2 1/3] jailhouse: Fix JH_RAMFS image path
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH v2 2/3] jailhouse-inmate: Inhibit debug package split
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA warning
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
- Patch Series: [master][PATCH v2 0/3] jailhouse: Fix build issues and QA w=
arnings
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Mon, 9 Mar 2026 22:31:31 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 32b3f4c540fc6ca3a8dd2d7c370cbf433=
aeb7953

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: deced73fc1a79071913faddb857ca79c2f6c7b72

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




