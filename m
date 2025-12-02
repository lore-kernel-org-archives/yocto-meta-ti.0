Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD28FD12687
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:42:22 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1509.1764715339344374198
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 14:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=saRct9eu;
 spf=pass (domain: list.ti.com, ip: 40.93.201.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO6H+Ibsme2hiio2et9ica32EBrNyAsdG1NYeJ5VinqRMJWcFcKY5TqGRQOxM6hk2ivG/H+p0OI8XPNLTVSTJSLWMMj56LYY3TFeNvQItww+ahlabmxWX4+kCZ4Ip1LP374mh71YMzHCxrpmIAkqjFGAXgbC+9/nu8FXtJKMs0p7mEbU4HtlADZxYsOBfC8Nz6ZQ+slCdCZB9E7vR1N848hKFOc6zLnaxZeA7eOpEnpKyIdF1eGNaSHBcXF0RE9xHUwwBJLErXjAxP058XRSE+PO1Bw5F0kViR6Gia17IHA8F+4CSKwyOFgGn80QdnpHKcMMYEbyOoyhrFKJZYN/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JR9TKjQjVr4AN9uHvwgwCGuSzHNYQ1ZJ/CMcBrB8zI=;
 b=Ofp8kBvZPT16D+RMv1GEHwf6MMgJOUXYdzHOpX19R8/lU/VCGQvm9LHYFw+aMhsrZbNcYDyjc1fKq1SvZgz2WuJsgW61jP6G6IBPkMLb8+Umr06tyMEH7K66dN2mUQwkPkxidIGySBKrr33TqLlUHRNgqnlnT+Bzonj5WyEVhVK20yR3yLuIPns6XREQbudTe2nuy+VZ1nU48Ha6jKR71L7ibnshCqItg/qAPvtMpYVqIOM2tVK2BH7MJCDolydn58evrysITwpxl83CzaoCQ7KjtpA80mKP3QJEhDC1vN95FiS68VVhKd6H6L8MOUlWhNgnLmhuYhU5pWiFMGoEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JR9TKjQjVr4AN9uHvwgwCGuSzHNYQ1ZJ/CMcBrB8zI=;
 b=saRct9eucfEF6mStp68i6foEQsBqgvEOVzMnHcysheXF2RR4syH7skepVLea4RuRSX0tL5U1Q30cw01GzIc5mCtPTjDGEvjDyIv0ARsoYVLXxwF2u6H6giP35FDNI/RuI9z5+J83Ngnc/fxZqAZJBN8Op0UGpWMwgimxrPlB5G2OyeAI7bkFiuiO/JDg89MzLQ93THJWtKnEwheKGdw4hg6mnuf6uJolNpd/wL8fRxBwBM55Gb4MOejPOob5m+/Ch7sgKFInYR19OHiBMXkqTCSq019H7QZLD1AQ7lARfxv/Iiyjoapj8eFSfvtrLmHg3sjrS5x4BsZu5hxyit0TvA==
Received: from BN9P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::7)
 by SA1PR10MB5686.namprd10.prod.outlook.com (2603:10b6:806:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:42:16 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::22) by BN9P223CA0002.outlook.office365.com
 (2603:10b6:408:10b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 22:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:42:14 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:42:10 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 16:42:10 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 16:42:10 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2MgAHW2336790;
	Tue, 2 Dec 2025 16:42:10 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 535329ACF4; Tue,  2 Dec 2025 16:42:10 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/4] conf: machine: Remove remaining K3 HS machines
Date: Tue, 2 Dec 2025 16:42:10 -0600
Message-ID: <20251202224210.4176041-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251202223210.3816583-1-afd@ti.com>
References: <20251202223210.3816583-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|SA1PR10MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d6b6f5-4cb2-4731-f311-08de31f40a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1XiwQxg0bhk9lSbHHVe9pNYzvU8GFfN7EvNCiG/2kBFjehFrLKjBMw6WeeNk?=
 =?us-ascii?Q?BnkYCmOpkkVBvxcolz+cukRZEEaVGYIazCUoLi9DP6rf9J1ddgV/QPu+fRZ+?=
 =?us-ascii?Q?FZZTdOM485Li3dnHvwho8xlOaV483M8zRrqaNNnmp05WLrZRsDwHb/nr8cu+?=
 =?us-ascii?Q?bHB2mLmjHgXaRr8GXnLdAau6IVYx5FnRYJf0dQdB/FQRtgPxfdBTWnSsV2md?=
 =?us-ascii?Q?PJrxa2luFEQRZ20c/m+daOsUBVmLZ0+PuBZKRgyfJkMxWYfaOzVUw5B/BpFZ?=
 =?us-ascii?Q?smmB8EA0F4ksf0c0Xl4Kno4dkEM7RYzYfYahoLN5Nu4IUvDhFkCFPjMH4ICT?=
 =?us-ascii?Q?J/Idwcf55KHYYyKpq2qBBQvx9auvYdgfskq6T+AzF+T03gVBXYSxf8bvd26T?=
 =?us-ascii?Q?8sY5jhEhFR/vqIEdZ9Bww5OllxrFVhk9AmbUKdnXdp8mlwxtrJnmHgQGczrX?=
 =?us-ascii?Q?K7InHQ9P7RrFov1viAupjnjFv5QIsPAlI3hQwvieBLjApX4DYPDR+8AAM14J?=
 =?us-ascii?Q?Xj09a7uIugadnqAlXgrAUntoVuNf/dNgo/CmCjNV7N2Rr90LzAFAKJ+EzY6U?=
 =?us-ascii?Q?JpTS7897mxGsFWCu18dbyyOkW2YWvatQwRoGlcScqFoePjFCn/e7HnFPkK4r?=
 =?us-ascii?Q?QtIDpzhqSrw2iK0SXxKJQnq6uKg0BWD8nUBL5op7D/bmGCZD9rLlkVz0Yci8?=
 =?us-ascii?Q?7SnKXgcOjdorX6AJGAC9uYrIV8boftnkDBJjII3kOwG4AMJzKWHAjnr114qg?=
 =?us-ascii?Q?9sHtiL70vYnccmh3VoBD0qTTZHk/WbMtEuqp++WQjiMYYoHPWmcRaXN2LGqd?=
 =?us-ascii?Q?Ck6JHOAXueFqID2T52o7akaHlthb6qW2ImkcxspE1DRtIWWfF2/sY+7jlV4p?=
 =?us-ascii?Q?/kyGE/hvtyeKqtfwK9c6Xzmg8vQim8YtWLoAqlZ1gl2zuw9pDhiGbDzCGihQ?=
 =?us-ascii?Q?gMycBqwU3LnVUxAjoOqtP73ZtiP8BgLIqFTvBpONNHkBXXILLKNTDtBn9QFR?=
 =?us-ascii?Q?nwdEmd9wQJ8jB1eU73JI5E3J+qt9wyZpWuHqGrHzqg7+bVBn1+J8k9gEBxCJ?=
 =?us-ascii?Q?uUVnWZRm0yptaycLzUr+C9KpWOLmBY6Ar9wp+Igb8DwvEhmtzAVUoSWOgew+?=
 =?us-ascii?Q?CG+MAHluYTCbh5l0FPjbesK8nYBiIbyrw+phns977Avc01kXI/Ph9rQzWFNW?=
 =?us-ascii?Q?vV8ptqlTrgLx5WkUOEG+lnKz91ijO14Fq3dgiyvfb1JyPCmxnsUci0c4Bc2s?=
 =?us-ascii?Q?dCkgYWXFHnqbZabtULKB9Uiu2oN08X/aoG9y4vofFoCEApjh+f8ZmTqK7j8S?=
 =?us-ascii?Q?YPhAWhUeRid98PUfJYPOmrenxEF3h0ChMCJrVu41D2maQP400zR8Ci7LGVBP?=
 =?us-ascii?Q?ur72738lujoaWBcom6EwERTkhwkYmh91Esx0cFbXR7kn6kxUglerJjSLgqRH?=
 =?us-ascii?Q?1aXgyKoFLxaSGK220OHvuPJyibE2puQVUnK8ufZb/1eHnxNzZmxzN3+xC0Wx?=
 =?us-ascii?Q?jlhdYuPQWlg7efcWCTzvjUpkzvlGHRYNcaiy8tdn4GlBaE9Dr+5QdMgrA+Y6?=
 =?us-ascii?Q?iyyPJLSOJ6sa5wMPuNE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:42:14.6175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d6b6f5-4cb2-4731-f311-08de31f40a46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5686
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 22:42:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19321

meta-ti / na / 20251202223210.3816583-1-afd

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
WARN - [meta-ti][master][PATCH 1/4] conf: machine: Remove remaining K3 HS m=
achines
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: Remove remaining K3 HS machines.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 2/4] u-boot: Remove defaults for UBOOT_SUFFI=
X and SPL_BINARY
    WARN: Commit message does not include file/recipe name: u-boot: Remove =
defaults for UBOOT_SUFFIX and SPL_BINARY. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-ti][master][PATCH 1/4] conf: machine: Remove remainin=
g K3 HS machines
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Tue, 2 Dec 2025 16:32:07 -0600
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 637fd47f9e6fb8a210272210a92e341d3=
28a416f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512020100
- Commit SHA: 5845cf70a07893d396ed0d516ad5580c2bf0e201

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




