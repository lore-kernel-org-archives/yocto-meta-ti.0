Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580DEECD6F5
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 22:13:00 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31085.1770847971440606296
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 14:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=P5DylON5;
 spf=pass (domain: list.ti.com, ip: 40.107.200.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx+F9y3vEeLoY8KKsJbQ3Kx9osIGBcQhq83pBFOoNmzx0x8Ls81gInXFtwpFkobnqqUbJiPnmMz6ZNB1vu0UcoApFA9+L9s3Fwyi+U71x4Fan266B/dMGRiIIX48GHG5RSGC+C9z8vx6Fvpb5lYqo0eUHyTQfW+y8I6ggu2Ih0breC5YofjYDI1BSu3FGamuZPesg8PzBKFB9y+VPCjcfa2BxJtyrA8Xnhz4T3DUoSQguaUFWaOPzaMWzbfhd8MSRbQcq6p1GTH8scxkN4CzLYPl5bZWEaGadI8cH8REJ9aCujT4tN/5YjbUB1xikxis2ePhFvDOCKPEH6VTbtjhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFbAUf/QflaufpTJs4TVQIOfCcxwYIBKfh7r3oT7Id0=;
 b=KtLmPjZpZqkJZpVL8bzdfC+4d7twkeuYFA6HMJhqB/xIPhJTZfDUQ+HPPh0e3XH2S8TYroJd08qu6sOSCedoRj5Bk/GN6QIc6lqRCQnnuVBHS0EjqSw1+TXQWW2qrI1wAKIEBEaurh1Ei4UDKTOZo/1X7bhx/ZwIryqxs2pxB/+LWMveYiVikWeVQrJhfxT/fwS9REJR52iSB6HPEmFdrisNyS/D86OHwSyZkO51f9rogQ56pc0XDlwziqSt12+Aeao4iObJ9fBT0tjRU/Ji3Wasv5LPrBB7hpa3zdQ8GZKaYRbyBxiwYAi2uw4tfCXYTy2neOxYrRrUoL0QuHp1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFbAUf/QflaufpTJs4TVQIOfCcxwYIBKfh7r3oT7Id0=;
 b=P5DylON5OAwKHcspj6BwKD9LomEO4AeO1RjjiEUsv7dVV6hA0OUIU3P3n1hmiGKsbE9TMnYbywJGA5ruleB6t1735ZyJe6VtnaPBmGnKTbQfb31PZY7QorXfEujSK3ysftjFJMBf+gX9RaNr2KTdhRcSzEmkI+kV5OGK2txlZPtZ2sYOJ7407jFTrNuonDa8jU2DwIVl1P4xwlHD684D2oWdtftn697XQMaYsUzm0/cFho4KQ7qPcf6UyKeZ7xhTfNPpVslXhxynZOyabuC4Ndr+iQxoip45fiSwharcHhXRNQjKnv4U+JMM+rko2yCf+1nXnz/jj3Nzsig0ygJ1Ig==
Received: from CH0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:610:b3::17)
 by PH0PR10MB5896.namprd10.prod.outlook.com (2603:10b6:510:146::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 22:12:43 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::8f) by CH0PR03CA0042.outlook.office365.com
 (2603:10b6:610:b3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 22:12:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 22:12:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 16:12:42 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 16:12:41 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 16:12:41 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BMCfk03328547;
	Wed, 11 Feb 2026 16:12:41 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CFED19ACF4; Wed, 11 Feb 2026 16:12:41 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Rework logic
Date: Wed, 11 Feb 2026 16:12:41 -0600
Message-ID: <20260211221241.120667-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260211220333.1979383-1-reatmon@ti.com>
References: <20260211220333.1979383-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|PH0PR10MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf9922e-c752-48cc-1d4b-08de69baad5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Es8MBfPNw7y2Qd2/xRsRO5tSxItGFN/852JjT9rUhpugpwihc4z99fOAeyqK?=
 =?us-ascii?Q?amV3gperB8Ey2RHyhTYRcTBv/ba7NlWtQrtOVBoNz2CoG8aEgD75VzZDemf9?=
 =?us-ascii?Q?BEwVPE4OcvsDeEY7wlbglz51KmyLXV9y4UhjQtnAYg3GNrEE/JLPr5+wY+Ay?=
 =?us-ascii?Q?RzcDb9MI51q91WaNOzX2tcCejBsLACPpDki+hLfiE+mZUSA2bF4L/OdUCs/4?=
 =?us-ascii?Q?0eDNVZRHbv8k4ht38JO6f8FR8LN6ZXeUkdkfh1OFxJJUN5lI0goWYxl7/r/3?=
 =?us-ascii?Q?kVUwLLahp2pE0AYP2HYM8xo9UD+Jj1Xuhb/1VTqEg1jX2huYGdDg9RPEpz5Z?=
 =?us-ascii?Q?BzhkJ0KQhRneF0ES7m3z0EpNWKBIqiBI+MBFbUgvkuXInODMEuTMNnQ0cEyV?=
 =?us-ascii?Q?IARocLTfdeLixyoXNZ+ZFlNF12vg2F7ayZvfjlWY4b9UdrB68E9enVvgPan2?=
 =?us-ascii?Q?6+sf9x/KbuSpLvRQJk2YwNpikdSY2axg5jM0eoG3hOZx5YJXQCrwIjynjP/f?=
 =?us-ascii?Q?4fl/M5DPUsqXICf+zIs0n/D7+i+wihMxYLS+gtp55G1wJQ92qgdujyG+x+Ph?=
 =?us-ascii?Q?/9l3EhPt1/CzYcGkWyA828cVBikipNc1g9FXXuolZpEvs/QLTs41IXqEgrx1?=
 =?us-ascii?Q?Ywh//gPdtQBbtOzUg6/Al6VWLY7mSD5EjTKNWmTur/Hp6TzOtFS4aZ3Ny+2c?=
 =?us-ascii?Q?bEY7D/FBS/s8HFgji3aMwfBoaqlRbn/tR3P/OkOAC51Z6mYGownJKQlf1nj4?=
 =?us-ascii?Q?6+5JervC4oGh/3fD5md0ELP0NGqCLKkyqodULlzexTLv/4Rm8dGA8WB1EhOy?=
 =?us-ascii?Q?pyACOwIDmCa0HZIi36evYD9IpIe2dB8ioGmqFJXHPH5H2XihBAn7eV+6JqnF?=
 =?us-ascii?Q?NcAOWHzBDs4VaTCylef/nVKWvLsU67SIftmvq4wZp1uF7Bd5BGffTqgWss6e?=
 =?us-ascii?Q?7L6soRmnU/579SrTHwUKaYoUpmoCb4tH+TbJpB2iSyISSp4lZgtcg8tzV7+s?=
 =?us-ascii?Q?en9IO+nuiraTIa9lGuwzohphCr43tveeB5cykUDdDP7GeJCzxu5tzMXUMQXD?=
 =?us-ascii?Q?PE0BYPVgNHsh1W96H8CzwppaTfua9Sn8H+9zNZcAZqxkAIEIpFAgkkWB+hXq?=
 =?us-ascii?Q?lHwH83/QYzEK+y/gXqe0UaZwU2hs1M47Z1XyxSnNgSKC/qbl/mi+tVF2uXo5?=
 =?us-ascii?Q?4LuXi+Vgp6THU3yG+F0eNtPiFG1tNAfjDz4lxPLCZpTeTt/OL3iiiFdUsrD9?=
 =?us-ascii?Q?r/OCePsb6jtSL4dUxwM32HvA+/STuzO1wEBX26CCnjFhnGw+SK/LilSKxRMc?=
 =?us-ascii?Q?2lX7LqNrw05YB/INIY6z6PJdtlXKeaprwe/N3ryH9BoqFiNujus4ESCb4p8m?=
 =?us-ascii?Q?zjnu5I8Q4JNLeOdXEw9ZrzxZTlUrd7fbTVPVCoDOTB1VMWrxOMBE/mwF3JDE?=
 =?us-ascii?Q?0nZ+MJXosC45TGulwi9k0PKX4Y0Jz9s/Ef0peRvkpyM1y0HLTERQjjYtQzbq?=
 =?us-ascii?Q?mJC1hHmwcw6DgzDBtGJD1BA+bbuh6MS44mPQDcHDm4eSXxYCEzfrcz1CAzo+?=
 =?us-ascii?Q?9awlo7mFfHb5vua/c7J32VkPCQrkJmJcJhtzkt6cq9ZkjrkwBCv2o3SnJlxL?=
 =?us-ascii?Q?8hdPI3SAm96QUSDWgYJK9WYL+YDgt2Pts8z3/e8jjKP+?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7fPiLgRbdtJQawu4i6rnUY4py5janODLyqis2odvuzgoURqnB8aPnL6TTXPPiBQz9jp833K/YFw/21u6hgwtcyqORHu5QVN/1Qy/rsfHEUnNCuFJndkKI45GKo9PvU7n529G+fR8rodYZXOREo+dEpzNWthOsxFb9SIiSKLsbXrGMKhGgLDpDN5S690fldMzKgtF4lTjtlVJNlQLnKq75EWp9KJ7mlxurovgAvqPAlEjtTSpJYekI8MJFJG8gZ0bjxmQqF0z7WrQGkMPfqW8gPElFIiD1sDAQOZn4efKAT/oXV+8k53+6I/IVblyAIW8hdp67orvRrVMUK1cO64MRbbf7kd9popfeXGKSsO4ZkqD69Ll6hyCEnxkhPHNYCVIk5PHodA7jmPAdQ0u/jb2F6Ot1m1Z3QG3cSZJnttQVR3pUyaZLSVkgeEfMedfagAH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 22:12:42.5490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf9922e-c752-48cc-1d4b-08de69baad5c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5896
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 22:13:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19492

meta-ti / na / 20260211220333.1979383-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH v2] ti-core-initramfs: Rework logic
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 11 Feb 2026 16:03:33 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ec077e88353f93918738afcc23f88a7d2=
f8ef77b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Update ECDSA signing make option
- Commit SHA: c0e80f86dec421d7518f47617c970eec6630640e

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




