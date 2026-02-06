Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6387EB28C7
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:17:29 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5238.1770355048809843357
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OhNd4AZ8;
 spf=pass (domain: list.ti.com, ip: 40.107.209.70, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAZqklkCooTS+41MWvMRKNOI8ipo23JwxQjUVv6+ptip1AMiUWg5tkUytiKQsf+IgoxObFrdLVZXcjuvPhMmx7GV10qWxtARa2N/5A6Yx5OECtmZfTnMrxlTW9W+dt/GsKVG6iMGWb8o2/N7V3pCrTq3RQM6oVLNcB7mUnwFH3/qVJQ084lrxYtRgaC9m7PlMjMTCuKbskAX3k312H4D20Z963rlNReJkhalMHcWu03WlUS8BR14S36BNmNef/5Q9E5HKGfIciVS32yuo8JMeQXfpn6AANorVwzuZpnn7CnkfT/CsfPSOGIeVZ9/J+1GGG+HdixqVXNlmxuqo/Uqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPCUEtYLqe9I3cCpBZ4cOmd447b052857A3uhZz45Ko=;
 b=QC/d1vjFoGqaByIwgzxrgKJbCyOzyGqmP6QIzx7LR8E+EPYwAPS1J9E8XHODGvXVkDwiYfRtaZoB/gEdJqSlcZNkTda9wRhokiGWoGxELcd3F2g+K8oVsCZg+S1lyY7uMGuUXkbiEjVZaZS5IIquz3pHnTgmoCn3oDbHLq+NSUssLBTJ6UNqXpjRPoYYp7P2YGsPrYJpGwwG8g6JpKiru32J+VelQVguwNS9mxSflUQdHpCdAE0hpTksCnFAhYsvP9+OaAAJLgg04sA945auM5vH94U4JRpll1HoTf4CsnBkQLkNkWn/4U7fixkZ93MCAx/h2HEeA2wyQHyM7pHx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPCUEtYLqe9I3cCpBZ4cOmd447b052857A3uhZz45Ko=;
 b=OhNd4AZ8fP5mbOMF41AnIE/t4zORmuEA86ypRj0YmaITmi7YIxu+hFFgBqigFZyueGYWsqCaiMu2k1Pc+qjQHP70betDf2AuQpbmu+IVtOUgn6Tpw75oQ+5vVBsKk9K1XBXee9OwCgp5mG3b6MXTc93Cpd40/DePV4ZTE2mmDNeLpiC4SjZCxsTe4H+L/plj8x7enZd+xhP9A5baJrjD2VLdwzAyz6L4+u1cTXhnBmktivrUe1LNHNGQaLHQCR2l8MkUfDagQuBDeQAYu6QpmdNi+r9eUbg3aQrwDKbm1aJbozEGFFocNs1UhzZmF0kr6ctqL7HLfzK9Qez1LfvRPg==
Received: from BN9PR03CA0221.namprd03.prod.outlook.com (2603:10b6:408:f8::16)
 by DS0PR10MB6917.namprd10.prod.outlook.com (2603:10b6:8:134::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:17:24 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::49) by BN9PR03CA0221.outlook.office365.com
 (2603:10b6:408:f8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 05:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:17:23 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:17:20 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:17:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:17:20 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6165HK9B576140;
	Thu, 5 Feb 2026 23:17:20 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 347E09ACF4; Thu,  5 Feb 2026 23:17:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: Re: [master][PATCH 0/2] Update audio firmware recipes for AM62DX
Date: Thu, 5 Feb 2026 23:17:20 -0600
Message-ID: <20260206051720.665994-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260206050608.1929093-1-p-bhagat@ti.com>
References: <20260206050608.1929093-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|DS0PR10MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: d313bde0-2579-46bd-8702-08de653f0273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VrA6PlgfSMAVNcHfpQ9DRQJLVHNbB7YTnkR0B/v06kYk8wk9Yg1n4lmtpDDl?=
 =?us-ascii?Q?MVoSuDHNd9t7mJRRmHJs192Cp1lD2z179Ea60Jk6j96oyCflbtR2ADGR1s3W?=
 =?us-ascii?Q?2S/w1YsAZ7Yfgl3UStKkqCw4bSDkqifdwkt0XfSXTBh5brhaU2HgITEg4jwg?=
 =?us-ascii?Q?kdrRxGI4F8OFWNK3YpU93Lv93AuWPilFAB2ze5ceZc7ek0hYcHCWN6ENf1Pn?=
 =?us-ascii?Q?RzET+zYhAW8DOShYAcovR3NF/BHslScw6Aa62eCc77lkJPS79w+bcp3rLRsu?=
 =?us-ascii?Q?guelNbI9/VaVEBJL/8Zp+ll6NA9Effl3u+9YzX/jL44MvqB0E2avUu5kWHFV?=
 =?us-ascii?Q?R7al5xtweBBHh5gpiNEl1oCFM/mDPu1zWnxauzb1Mo+dGnTbZjGSF4VMjroR?=
 =?us-ascii?Q?PAu7K9ixwBpCVSAIX+lZKF/9qoZTzXt70xcr6RZqnylBf3zNfxzp3Rx50k13?=
 =?us-ascii?Q?DgyaAMEokLfwtqlJOxvLxofYwqKsJUGkbX//p7gqepNsZ6lp/IlmWFEswNPL?=
 =?us-ascii?Q?WF2rzRE5UfpFabcrjQVjjYBSfeK5PlMYOhm2/888+reM5G1Ft8Dg6w07FG3N?=
 =?us-ascii?Q?3PbIBJ8G5fYnrV40jc5KhWW3DJwRWfI871W1uk2Xb5KPHR8NedXkGfCovvgL?=
 =?us-ascii?Q?o692km72ePZm86z34hbJ3w8565UetVYPD8wkIG6B69TPUrM/TPrO+krMPP0/?=
 =?us-ascii?Q?p9CFqmwCweQhyo3W5rW4TdpJZB2EBeUOrIlZYLhf4UmAZ4gQJPtRlQSselR2?=
 =?us-ascii?Q?TuftR7Nn5CBz5ecIG7zsM5ikfs3Xcb6NUW7hQLpV7+ZllPTk0HKSzzr3uqfc?=
 =?us-ascii?Q?n4KqnH+KPqJjhoK/7u9YdThJKOG2k8piSDF2dwhlRnpgGAiH7pDC8gaic1Fw?=
 =?us-ascii?Q?d/G7re1hlZE/0ouYSoKBfMG9RwOnGLNa3N9NhIcrNteSNez+PNdU5HfmuT1I?=
 =?us-ascii?Q?f4Mft/GuV5hjD/ozTbgIgeNwyi+S8wmsqsxAPmWJo+6VnvxSiNDNK2Yjxua6?=
 =?us-ascii?Q?kWyk9er0IEXj2jmo56+XXsiylpJt7dWSIcRYeNKycqLc1mVc1UAU9YiPefSL?=
 =?us-ascii?Q?7j2eQ2bFiDWw2igpjr1Y7ozzy1DS7caQFjKf5mYr0lbxJzRUTlZMVxowblz1?=
 =?us-ascii?Q?p6s0OHEzIsz6L1dI1oQ/a+25UiR4NmBjqgV5K6Uo2DboA3hMB1YqTiEth1Az?=
 =?us-ascii?Q?yB57FlvlwNXiEIA8fws917MaRAcd+qopsunpG2wrN2/Fq6eKsbVXr5G6h7oG?=
 =?us-ascii?Q?lOeEHdavzoyrt7UWlTXq/O3/bYxx1VSfpMGfOKFg2qsN31XP9x3MkW6ZLf8q?=
 =?us-ascii?Q?b6wmip+WTh3zPRE0iZ/GluscFh8vrfix/+rlRW27xqIJmU3QEVUbDytWVQ0o?=
 =?us-ascii?Q?ydlKhyyONWc4gwn63+eZs+TsMjvCcLxvV3I5pi2tyJ0HH9UymuagR/G7RLo0?=
 =?us-ascii?Q?WXAzFoijIKc2rb7Y/LWjfBtQi5QiiBZURKXAa7Qwp/9bhWLXEq+ChmBIA1nP?=
 =?us-ascii?Q?xsl8zesr5NwRQGXP4ohgq+qcfS9ZWC8aK0XrycrKknhOBmsNCSDlxBtn9o0/?=
 =?us-ascii?Q?PugzYufp9SK6vzic0/dUmFg+Gsealk72Q7KtgGpvBcgoi6pDiXPTvqiK4w+O?=
 =?us-ascii?Q?KlWtzZa9RL4SoO8wuR32Ck9PYpNgeaVl+1AByKE8mr7q71sHoXqqyx4QVHzr?=
 =?us-ascii?Q?GBrrtQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bGQp+ZU3PRaIskqAU+Mp3ZGOR4Aa8J1tKPvV5v037AauAq8BXPJdo4/q3qmTntOnR9gH4xPoRFjzSyBUWKonGNBzUOYCfs9+v0sacb5bcMjY1IxYMK1UfT8c/zER9/HVSu44lp4JKKVigYoYTrjSp6yVBT3PzPRxHnlyF1FXWTOQZrAMJUj2p+nwyTWY7+ngvknU9krLy9pifW1a54MDc4UJpIrLWWgb4cX/Nf8B46EcnSJwh8NtrtY4PwXgMx7qYzopdWhQSqS5XCpS3Iih9k3qqnTJlJ/GNkNaRhPNiEpIHFv78vgc73g4UAxG+zI1jefc/XHOfmKjVUauu1zO+TuN7rQvsbPtQoDyBo6BoetXPwNavTz4ymnb9Oz2vHm3Ftf6lR4f6ptvzKkDXCEHnfrD7Uz3TBXRCU2EHGCXLzgcCaEQyV9c+WYlQOyGm+5K
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:17:23.0427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d313bde0-2579-46bd-8702-08de653f0273
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6917
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:17:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19467

meta-ti / na / 20260206050608.1929093-1-p-bhagat

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
WARN - [master][PATCH 1/2] recipes-bsp: Add TI PCM6240 ADC firmware recipe
    WARN: Commit message does not include file/recipe name: recipes-bsp: Ad=
d TI PCM6240 ADC firmware recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: recip=
es-bsp: Add TI PCM6240 ADC firmware recipe.
              recipes-bsp (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 2/2] recipes-bsp: Remove TI TAD5212 DAC firmware reci=
pe
    WARN: Commit message does not include file/recipe name: recipes-bsp: Re=
move TI TAD5212 DAC firmware recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: recip=
es-bsp: Remove TI TAD5212 DAC firmware recipe.
              recipes-bsp (COMMIT-MESSAGE-3)
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
- Patch Series: [master][PATCH 0/2] Update audio firmware recipes for AM62D=
X
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Fri, 6 Feb 2026 10:36:06 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1be2e5ae159666c95f8cf187198bdd119=
a84b061

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602051800
- Commit SHA: c79f7b833ee92e42f5dcfd6a33a47a9399d1c575

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




