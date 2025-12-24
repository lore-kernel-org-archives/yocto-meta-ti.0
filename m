Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F252E776F8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 17:52:15 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.124579.1766598730637481823
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 09:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=xV0A+z1k;
 spf=pass (domain: list.ti.com, ip: 52.101.193.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoMpC3w45+YtRErYDX+XAO4i64jmCM2UMNLi9jJSHT/qo3t+MB0awfZF8sHIeHZjFBaif2XTCSBqD7m7OJ3vuNu9iLD2c+VWSQ8HBdLvGaUjYpfB4UCR0mRss3nqvF3TcAqGaeFbYzkzRjcJzuT8DFmo9elRUZ42joR84W2nyRO+zoR2qO0xbiNyBcXcnh7jb3IuNxQYvHsEUVcyyJPYaHKtLfX6a2bGWm7mVMS7ci97WEQ6uO/b+hkFoKeD56n+eRmU7cK07rq2ZgSKnbhdaY0EuPObi6SZTNxdRmOPJJGTkNmzYe84uE6MVv0sjcQyPVKIcOZNXqZfjXdDT4RMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIyefFR+m9GJflXR5TI4LkdN/YJDPV7GppDjCTKPhiM=;
 b=KBnD/tDsedjLzFTvYCeU8NEninngRUbUnbetxHLQ5EiwBdm+Cjn+Jbts539xIixIGbRwBddh6U0jWyQ+pVLoyTJxqLB2ng28KH44TFBVFwkWUkcVRXV4qM3asuK6/TML6mZjyu7L3QZCmUFg+7sXdb8gPmBdGr/2AFMkMS4UHKZIG5z/2JdYem2YZhmzN8XWsMnRzHM75DVwlXm7LfQ665c2zpTjyTpOCvTqgJkwBRY+0DtRMFa1G9Y9H1ecZf4yl0TpqPr+rfTwsdrjxNyGVn8Yo2yVeHFn/sih+6pzw6ufoh/1n4ClhUa+WlaqhalgFQUwGmwMdHg51o4ZxAL45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIyefFR+m9GJflXR5TI4LkdN/YJDPV7GppDjCTKPhiM=;
 b=xV0A+z1kFgdYLoy7ci85cpQzzhoUFdNRWI13hd/B2LpgDaHLrffaBFdx/4jGS65ErfrqqfczxhT+HkPP6Ea1mhPSjMyrTg+OvTUywaf041Cts5EsssOhJSIlPbEPlB7CSoBhvWBXLf5zckiCopSe665dJJPS6baEHh+nSYDhsakw3JRWKtWvq9+onpY5L8GBtALBrQiW0oGyUDntsCiLwk9KmfRxqOYKymynjhhMOAgLcfAMNsoMzjmB/xUR7zKqUOlTeTN2nxJ7ergx+TjbZqQbCSVp9QVYDtBIcPfnEDg6KqpxzfKcWa9ss3oEZCLnRLeNrRKnHzALYF9kLIWCig==
Received: from BYAPR05CA0108.namprd05.prod.outlook.com (2603:10b6:a03:e0::49)
 by DS0PR10MB7221.namprd10.prod.outlook.com (2603:10b6:8:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 17:52:07 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:e0:cafe::b2) by BYAPR05CA0108.outlook.office365.com
 (2603:10b6:a03:e0::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Wed,
 24 Dec 2025 17:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 17:52:06 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 11:52:03 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 11:52:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 11:52:02 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BOHq2tH887783;
	Wed, 24 Dec 2025 11:52:02 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BC0489ACF4; Wed, 24 Dec 2025 11:52:02 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512240400
Date: Wed, 24 Dec 2025 11:52:02 -0600
Message-ID: <20251224175202.2737060-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251224174050.506084-1-lcpdbld@list.ti.com>
References: <20251224174050.506084-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|DS0PR10MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d73a187-5a96-4992-a8ad-08de43152723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jWlCfp1S6lUC2cbMvNFkdpLqKvzSlNjJF6w192G5jdur63SHbTkjfCoMxmIc?=
 =?us-ascii?Q?0mOK7sgFrc6wajva6CWSB2FFAhFrjCcut8mAdngZFkhqhYZ53VTMTwzYDwx+?=
 =?us-ascii?Q?D8v+Z52L3UUXEqs836/tOCZT3qweezBBM8VujXzPeNy7yc42l7iszrL/XTfd?=
 =?us-ascii?Q?e8Et9ZCRooN0GAbGfCmfLI8uDxPxkHsQdJoZ2h1SOWwrutklFiZS1gF82wze?=
 =?us-ascii?Q?fBnRkJ/xsf26i5n8GcOb8Kz/Dxw63xlbxEK8pZ/mHhe5OTZ26dZ3HmGl8xUW?=
 =?us-ascii?Q?jfpWFi9NBt/S4QBiLpGhq1EAV/Uak1aYJOP4E+OJWHJGfie6/CeK+6+WsHPU?=
 =?us-ascii?Q?myDf4spUbusm/79Ep0OfHpp+eU1xjYWFi+3N3cjhGNd7smxU49qmo8r64vyk?=
 =?us-ascii?Q?soCkEUFdc7N0QAGS+kQWsqVhPylIMJF+/UboAqvHPT0NNjHOTA3GbAM0SUk0?=
 =?us-ascii?Q?NfNwbRxtxeEoBSnskpz9MsGykcEUXZgQZCyGgS5vGQjr1j9gR9ByrhpwItji?=
 =?us-ascii?Q?T1u/A2prWMPsunQ6eQSxfG4k71+MP/NHwAyYXJVL7wCw4wcJ0HHMfTrA6FfN?=
 =?us-ascii?Q?hXYXO1w3ZmYf2dYlXqmrM/0ggBr7IHDwG41hW0QgZ3YmbRA3KHi8SqjClZLb?=
 =?us-ascii?Q?+D7acs6hh4VLQuUM3SrrUPKq0WC7hTZBXbNalaTVaUcA+TUi6wQfAXSZF9bB?=
 =?us-ascii?Q?n/ufqFqx3cf2TEcL+B7PLsGG8Sj+5D3Q/c+pffSWRF+l9V2jrLmvi7qdtbR/?=
 =?us-ascii?Q?nwrtHSL0Qi32H2wUgHvDZTUEbMkdC0hietyuppUpKmS55xHr8d5iQBnhOcjD?=
 =?us-ascii?Q?TnCKXEfSHLLBgPvYvAkaUkd4zmj2a1taMPR458G41DHfw9U7h1xV+m4j9F8H?=
 =?us-ascii?Q?9Hu5yMa9tig2Q9rdTjN4KQdyMlOYTzkKvdV4vETDTPo1frwj9AgYvcgRKOcf?=
 =?us-ascii?Q?QRmJxkeLOzEx4b2E6lW18t+7gbELi13GQubeMH0SbXh64bMo0GRLNwxcSLQb?=
 =?us-ascii?Q?Ske6kqSa6UHtYH4EjBIZs4BYezr7hdD5Bph0L1SLgh5KJ7g1bB+0ySLu5HLK?=
 =?us-ascii?Q?IKjtIKiExzo44tdN7uzqXQ+PpLyRZlmS8G9pvSZp30Z4zWaspMHjYssk1N4y?=
 =?us-ascii?Q?UYW32O4QptFv83gwqTCjoMlab5NAz56AJrgkExohgXVg36bVE2/bkGhcujyp?=
 =?us-ascii?Q?zXw9CGeUwxKVSCVGETsQekNFRYn/+7dszgv7v+zTaPTXPg0xABUJinA3W0jC?=
 =?us-ascii?Q?kT72ygrYro9Euo8ExfAv6TU3puLb1Sl5e2AAH7FIRCBL/hxUaGkJN1xNaL50?=
 =?us-ascii?Q?6OcFZOzBSfvSfWnkp/kSzXPS9EPg96wQSdMUTIKEgdysCwyMGI7dchtmcKp6?=
 =?us-ascii?Q?ONVSq3PmHrANhWdUfpvCyaQOcVPrWCOBJ3lujOaV5zVdfh8HwuhQrKgF/krF?=
 =?us-ascii?Q?rp2njRY1bID8Sde3zUSE4PBCxsRrGjD837V/MZQsrcV37Vy5YVBH/h+k3JlF?=
 =?us-ascii?Q?XHZIj87WJx18Bh1nQS3RXm0g6qEYJPzzR/Szywlly25PaV4HhqH8lnoVbfIb?=
 =?us-ascii?Q?ofm/XWtLACOCnnXf7aA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 17:52:06.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d73a187-5a96-4992-a8ad-08de43152723
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7221
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Dec 2025 17:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19391

meta-ti / na / 20251224174050.506084-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202512240400
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 24 Dec 2025 11:40:50 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: aa981f4f18d952167d451e92f61b74c73=
80798f5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512181848
- Commit SHA: 221f4e6873a04acfe8308bae177ab786fa47efd7

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




