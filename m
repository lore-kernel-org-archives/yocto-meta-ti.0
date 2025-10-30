Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659D1CCF9EB
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 00:35:32 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.6])
 by mx.groups.io with SMTP id smtpd.web11.17426.1761784527655318825
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 17:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=v+QyOmvi;
 spf=pass (domain: list.ti.com, ip: 52.101.52.6, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQjGYcv/2zbvObkDh9/fQX7p6uctke/fhSlFfTqP8yX7gKjN8XvCwuQSpQ3WyS0w3N5EQhX7wIl+frzUbHMH0aPp6Vub62nrHaFBUQuBo7QS2nE2CoHgTwy0QCxOdrIa4HTmpCjQ5S8oblywSRPNZuV8wWC+Wyfv3CF5YOtvC8qywaCvzoLzTNW+qRUYo3P1DicOsJLT2e+yd4ufQhG/TRuwZUTrBocvZXUA+xXXqWkk006AZSpgyaafEAhxhZcBstgaFoAgENiTV8//SmgsFhLMCLE5cw0KTinDtksjYwg1G42rvFP4uqzrtcAu/z9Ay2SLdn0FDj3XPhQPIKHkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkhavnOWNu+MN93zWhLJqPpXAqFC18KBL4wKPzenKUk=;
 b=WsyJWlTQUIKjIxKvvmAtvd+mkBn+uu8nigYB5jqmUYEKF8ojquh17cxc/v3vlhqmTai9Bx3y0Y5aAUYWOJabY8WGL9a35kYtgBljFvPPHy7XDAejBcTvZLeHb7ZluGmKR3dZwW18v2mXIzual6zuFBT04xtOHbPkTpen+3qbTmKjOqGsyj9GMwSwZlfguZDFwnpO2hPoahiUMMH9aedS03qVF+AAURPfF47Xolvm850bRh42wuBknvYMY22t5OqQHk8tLNRlYtrRx+dYzCTPtVTROHVAboHRDlRfkN01CnHVYEHzf/e+AeD4R9o+ZNLiHArrKJCRZdAAZOO56WJ3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkhavnOWNu+MN93zWhLJqPpXAqFC18KBL4wKPzenKUk=;
 b=v+QyOmvi5LZ28vyENaOKG3AGFWQOp+ltBuQWIgh53jz5Pbo5/DfgPES1weHeC4fMnE2hPTYFBpIiLc+DSEvmyXQFnEECLnBUETeY+jsVEX8KqdJJFjhsCkrIeMjpSoIFwwZbwGsw8MjUe/zSQsmecwudgKE6Y9d5EOHxgrJ2Nrw6dknele0MQM5bRT41b3P4R9wleh353q+SNlZrAQ8uoJ+PJQN3fsyYE9GA3DmUZrCsdOpOCfHzmM2RTfyPpKdchDw4GHM30+52jafEr6XMXraulJRjw96o5s6pQGRzy4LDF3+qG5TR4FkUtAK+Fuwvf6OZGMnI6bWxliW7bHwtjQ==
Received: from DM6PR07CA0071.namprd07.prod.outlook.com (2603:10b6:5:74::48) by
 CH0PR10MB5081.namprd10.prod.outlook.com (2603:10b6:610:c2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.17; Thu, 30 Oct 2025 00:35:24 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::d5) by DM6PR07CA0071.outlook.office365.com
 (2603:10b6:5:74::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 00:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 00:35:24 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 19:35:13 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 19:35:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 19:35:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59U0ZDtq950858;
	Wed, 29 Oct 2025 19:35:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7304B13F532; Wed, 29 Oct 2025 19:35:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510291355
Date: Wed, 29 Oct 2025 19:35:13 -0500
Message-ID: <20251030003513.1930286-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251030003121.2151419-1-lcpdbld@list.ti.com>
References: <20251030003121.2151419-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CH0PR10MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 39874e0b-2b51-4dc4-a0a5-08de174c3754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eokT7A3ZhidCC/XQHPDnVo5A1PNTuYG62em5qjVYHU10vAo14RBsmEKEU19l?=
 =?us-ascii?Q?+PNThPrHfDBNac2Z2eMCsSxnrB7pSGxiQH3hu1sRd8h40nMkmejyOSg0wqQb?=
 =?us-ascii?Q?SPM+pOfgOkbJnx/e/5MHPF4RSd+4IU5QTnU1Ijo/vMjVowGma90z2hZFbuTX?=
 =?us-ascii?Q?BOjqs7zHI86ZD1A79RiomoGYdveXepMtdqK28aNiaBBIXrJFqwBimdDHLSlV?=
 =?us-ascii?Q?LN0iUcuukDLRKtto5nEe2u0F5xriG/COIft9qhoipVxxUdYx9z5brDI53T/V?=
 =?us-ascii?Q?0JTNjei6HKFZy34YJktMlB1JMKzwxV35HZXgEfr0HxYzCT1qCRv0usv0nrrW?=
 =?us-ascii?Q?HZM6+u+e0U0Js5QRbJp3ZcKZn3Wj7I0rTWNWe0sVUlDwKaizc6lcBxSpst/h?=
 =?us-ascii?Q?NP9g2OcfbCm2T7Z3d/aE8ElCzkd1QAupX5IJMiUC5j3OFHtib2hqboT/uA1w?=
 =?us-ascii?Q?1DqJKPx9RAv/pU4cqLDVH3EoHBsu134UXMgZ6mHlyWiV3O0MywsBPp1bEwFq?=
 =?us-ascii?Q?hJFusU0jtQxUKSrjG5tp2R7Gg1pMtDyjYx1XqZk9tl7glOIVeR22QRhWzfir?=
 =?us-ascii?Q?3imOsLd+zOjd2i1bjW895NrrgN2M/pzxHOGuekXMdO4GvGyuqYKKfNEh+uFe?=
 =?us-ascii?Q?YvpYzqWIcMJJgb0HByh6OYJPNs+9b7YDYnntS4nSsC09+wxksVcWPf0W/526?=
 =?us-ascii?Q?XXWlB1NqhWwRx8l7JqisnyYC+LcmEJmFZfky9n4iKfmXjilYrRKo6H/39NdS?=
 =?us-ascii?Q?u0TWB4v0Qow1h3+Q2py7kPD+Xx9W+7xd34Z7VV1t6Qk3bNQCpz8NioaMArql?=
 =?us-ascii?Q?DnBu98/SkBSudZR74ZPr598nUnczkfus8NOXhKzT+bfWKUv5HtPfF1mL33JF?=
 =?us-ascii?Q?Z46swE7dFdoedcW29y/P4n0uPMWojPmbcd3Q08LsHmyM+sVJ2Cs/u78PxkJk?=
 =?us-ascii?Q?RTllkCWVCexmbQIfeYMz5cGs7KNVAPoxjBGv+Lu01JnRJ56LgkzYjTMJeYgk?=
 =?us-ascii?Q?yVsZ28BJj03dTMWqwZVkDVFxh7UClXNlHYo6tJ/JeJt4KYBlSi1v8rmhVxbE?=
 =?us-ascii?Q?PzAGrDkB7FKOQtfFAOSrw53oJ9p4h6kofFLR850MbaXEQrixMY1P0V8orGmR?=
 =?us-ascii?Q?bBLoGUDrQNri6RXM1AEVV4aUUvh5D/g7LCT53Fejj0EkBSMERG1P47C+2UlZ?=
 =?us-ascii?Q?bOnkWTbvIgfwNfFJ7+UBFR50GjEhCNdAE3dpQLXLRXVXT9sfNj4SiJzmzfBP?=
 =?us-ascii?Q?Krlb1WQjekolDYk3IVySIsN59U8UL9ZCuFFIMP2CVjNBEBmJloSTP7Tr73SG?=
 =?us-ascii?Q?R+PXfG+E26gl+DSIjX+YVEOsrc2YyflZqgz760NFTm4vwHJcHsQEe4xKTHaD?=
 =?us-ascii?Q?POOrohGd0EWao2piqnv/GpOeVkRWjRNm+N18kUONSLjDj70vidW7ibq/w9Pw?=
 =?us-ascii?Q?4QfLYSpGubL5GPdLLUI6ia96jzJj1G82lEjE81hx3k60XatZDql/4lmQBHRt?=
 =?us-ascii?Q?5MHe3FzQf9uiPSSekmyVxL9jWYP7QkzPCf/JpXM/Jpbt+ZffRY+Q/n8UqmbV?=
 =?us-ascii?Q?4NWnzEn40d4tjTChjbQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:35:24.5480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39874e0b-2b51-4dc4-a0a5-08de174c3754
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5081
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Oct 2025 00:35:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19210

meta-ti / na / 20251030003121.2151419-1-lcpdbld

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
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510=
291355
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202510291355. (COMMIT-MESSAGE-2)
        patch



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
ap.202510291355
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 29 Oct 2025 19:31:21 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4dc91d3e69101394ddd092c3cd32eb133=
0631e96

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
- Commit SHA: e05967cdb02bd584265513d28d4fe0b583a828f5

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




