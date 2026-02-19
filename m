Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B975EC531CB
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:55:36 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22769.1771530934026755225
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 11:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=C7tKaO6B;
 spf=pass (domain: list.ti.com, ip: 40.107.208.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fyd9CxQ4tre8NZpLx82p/fN/ndZ2PfpsHKNc8E3lc5C/jvsxL4ejPYgCcNkTg5boZY9FcZkAM9GyWoKDaioBauRYfIDGMs29lcWf9dwF2C8i7zdqftgmh5FfWw+Q5ZpYp+Lo4uFiNFhpuzxFGFaLk6sH6UoDCqCAbfML8mPbjZJ1lHR1zppgLtUY9wxG2yyCZgiOQ3WrPywGvFyK25AhdnKZy+ayCJbbOgnfpmj6BgByK75GXR9D2EuqbeeZPkDWsVQwI6jK9iUVdwyX7qX9DjqBE1PLo+9YiwRPC+9glQ9fNkJUEefx7I5rWRX3WYU7a6KqqbqJtsMbQ8tRWyEZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsUJ8rAUQQXEhOfDHRnpyYMNE+heXjlqsk8XlYTP8cE=;
 b=vOhBj8IAeTHNjaxlgDKgFPtz5KC1/EyEXiGe4J1PqjI5XXHZb/SFgt62dFrT7CBdkG0oT73La/CprhIxjwLN6+r+1/lH9Q7EolzUjO+Jt6XNeQD0lheVjuw07uX/Z3Cd0J+mQNAflcqaPw0XYE+xStOXZYpitkNBrVQVn1KgWewpQwUZHBvvqE0GjIECl5oeu2y/tLxWcubfLZz6n23N3Gyqqf6SC5qIk2AOGmldPspPaeZUBh38T+dFOZnt7bb8uhiOJpaZvpWIBKiATFRPmBLSxilnxCXLnIyUySRIO99ZDJct3nmrn0FbhVN1ALW9jDGA3G89A/f8jkFtLkPOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsUJ8rAUQQXEhOfDHRnpyYMNE+heXjlqsk8XlYTP8cE=;
 b=C7tKaO6Bij+hNwCop5GQFzBnI7x8IKLl0iju0GBDPFgoCRA6XuQdEHOcXQ05+htE6PJufBrljgfF4M6XDJXg0AZwc4/7DXlIv/khl2Czjw8Ju5NDsaFsN7eyt071/iMxSbMmPWmjkDVb9kmFG3Yf18sjqjDfUyLOBfZLSlAoaHGRIM0LnozHAL3pjLRwAUxxWYW1fPiAjGKMBxzhWdqObhDTuJlvso/koWyq23PnmJNzb56ecXKQkj4h0Hk5Ztce6Dm75RQ77LynUuRI3Ah04I1YJtFzXMxVLLHP5b8AaRP5NMzDSvnaMVuLtALHtv4hiGsHiJXXsY7UEoGoMtE+Fg==
Received: from BL1PR13CA0430.namprd13.prod.outlook.com (2603:10b6:208:2c3::15)
 by DS0PR10MB6077.namprd10.prod.outlook.com (2603:10b6:8:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 19:55:31 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::9b) by BL1PR13CA0430.outlook.office365.com
 (2603:10b6:208:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 19:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:55:30 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:55:30 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:55:30 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:55:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJtUi93061357;
	Thu, 19 Feb 2026 13:55:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0DD9F138B5D; Thu, 19 Feb 2026 13:55:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: am64: Add ECDSA key signing
Date: Thu, 19 Feb 2026 13:55:30 -0600
Message-ID: <20260219195530.2958640-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260219195154.4121151-1-reatmon@ti.com>
References: <20260219195154.4121151-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|DS0PR10MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 027be5d7-45fc-457c-f0a2-08de6ff0d61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W7bpyEZ7DycQg7OBrPZSxhrMoe1q+i9pDoAoY+9EHb5Zim8ijecVHVj0PPNS?=
 =?us-ascii?Q?xLH3QSUO7pCJ8mTvJAMxdTraVqqxgqz7TsBje43wAHoWJHjkYNdxxwgmhOfB?=
 =?us-ascii?Q?yu2DIML3kuKUiU3spFqj0oHnqSofRwQ5H/njaS/4rE+ynzilSBacCERzlpFa?=
 =?us-ascii?Q?OLQ0cZhAugBQAQP6kzbceddFaZHh9S9nRH/6JaFkom0xmQTN0lI1XnV4vZN6?=
 =?us-ascii?Q?ZKbQX9MoYHkp8qBd5g3oIYlSpvuLcKYCJHD7/6fkN1udbs4cJXv7Hze4VhGU?=
 =?us-ascii?Q?kc66xArODJxL8Hx412blmkoIJVrcia7vtOjzG64E6i2GRavQmStVvUvYFY7m?=
 =?us-ascii?Q?RsO5EVHBNazTO5sz6CMx99kKsHgv1P+CwGTmV74kXIPC809dNZFFbLIxzm+D?=
 =?us-ascii?Q?xWZCbwhqTC6HnB2Y5I6Ty2xUh78EZdZIi26tiXo87tFypDg/M/2fQXduRvE/?=
 =?us-ascii?Q?tG9PDhvtnhEu+Rql49v2y/zcYnjrgUn8V3++lLtQNgaMJCdQXeAFtLVqsBQQ?=
 =?us-ascii?Q?bnWgnRFz60oZ5WxxwmytdFg95EqKpzCjTgHYeiD2OlOmJ31E46jpCKuJfY2P?=
 =?us-ascii?Q?/Ht3T0igDd1d4NyV68gHMGeHOkM6DUb4WE2INVKUGrUnz9NcES1Tde5BRHxg?=
 =?us-ascii?Q?TPH+xVRGIiFFGcMeOQSzkuWEdqIgN6bm02m9mLx90Cfj0slU1R7BzpUlpKma?=
 =?us-ascii?Q?Blns3t9cxk3CS56DXhe6ZsEfEGcLYZ2HJlBWSC5U931v9dE8j50XCT3AHTah?=
 =?us-ascii?Q?ygYCdtcZ/ADh+pRJexHkFfvqoa0LsjHYdv8seri+dRSi3VRctb8mlFBRtBg4?=
 =?us-ascii?Q?HNGMKTj+94Xe7tKm9zbPWThs1/hXpPwobSP+RT9VErzs5tvTBkp6CdMt3zoc?=
 =?us-ascii?Q?6JztysbWuYC56+n9pnEGkYQjmWZjCUH+ay2LOd7tbSTON+KUHD/fyTat7VXD?=
 =?us-ascii?Q?tPxS1aZLCBmoxe1RDkQM70NPRwag2C3Zz+ts42bENAK26136v/1SfhqBYuie?=
 =?us-ascii?Q?Rqsoq+3OxPiOL36ekArT+5CDmsiU0kCvwhqo0tzrf9E/JUPNzBTfhJnV85Pm?=
 =?us-ascii?Q?4yRzdS6NqMhnteNFZmMkP2Ymm4wNXVGFQH/Mcpnnexykyi4r7mzp8hdzI/jD?=
 =?us-ascii?Q?IBWBmyNTyZv7vpKA4pRRGTZkGKTrS9nDZiLh2TUjJll8gqy51bZ/PFFjPbur?=
 =?us-ascii?Q?YOjfdjLKM5jL1JCy7xeZ9ztRE7JVaSTJKQcbN9+0lqbkMYatlhw+BNkyKZMp?=
 =?us-ascii?Q?/0RU+GejkNtkZIm0x2r8XjWBQQv+Tf+MimDkyXj9awSYWjEWtzK8dh+CRnkt?=
 =?us-ascii?Q?UUKPcj9UQmoQZDXfzrTKKUhPnRVeKnyMLqWUiJXWA4ihwkdmufl3bQMq592y?=
 =?us-ascii?Q?iXiQv+1GDlIt7oUbBM1zw2YYq8MqQEREznEqssQf1Ugy2vZktG/moOF2pDI4?=
 =?us-ascii?Q?aZCMdKageA32jm630HPY/UOwIx7IVIhwQuMel50eHljK1C9bQueP86N9aFGV?=
 =?us-ascii?Q?TxkKGOLg9bxmjVuptf9I0D0+GefPfo4jPtdXpBJ7L0FTwEcPpjDvgaaq8+uY?=
 =?us-ascii?Q?ZxOZ8x3TbyCl8CveCuB+53l2xtQ01bHhw12h5Doy+aSlyEObYxvpIpi1DuQR?=
 =?us-ascii?Q?FA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	z+wvznqyrSVX3DHJJ+3hODJUQ/GsoO53qhTV9nUVmI7oBMB3d/LQPZJRa/GditozV3F8oSbYWpw8pK4ihoADGoA2kMKkyRhxvR28yKw5UGXAu3G4/CJ6wxzG8jAD9WTQZzLO6d9lROBbsNb3Jl/B0oeIcSprk3ZfRwR0gnmGxiRxI40b+HZc6cTPZU3666bzvlWXn/rahPpM8xkA5QNJ8FPW/28HzkoW+HDjO3DIuM1jSwud4WohIh1mhs+DILUsKaLNHXAzb+tIJkLTLO/UkzpFfRvC8H4t5rSzCyQ5DnmsaVhuJpZPBYTi2nGq/SnyBd+QIYUDHb51EsfNL955bERVaEHXjAYDrAxu2onwtXz/72NqTDsfswtUzc10jpASImVWoIX0faC6Ya0lfjTjoRmRxlIunG7G8egcGJ3KmNUkOMvHGPd2Kg+0dZx7smvp
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:55:30.7108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027be5d7-45fc-457c-f0a2-08de6ff0d61c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6077
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 19:55:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19554

meta-ti / na / 20260219195154.4121151-1-reatmon

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
WARN - [meta-ti][master][PATCH] conf: am64: Add ECDSA key signing
    WARN: Commit message does not include file/recipe name: conf: am64: Add=
 ECDSA key signing. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 am64: Add ECDSA key signing.
              conf (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH] conf: am64: Add ECDSA key signing
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 Feb 2026 13:51:54 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b3bfdc736e6981d2463bd3ebba6194834=
0d6309a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602181811
- Commit SHA: ee9f5e1dfe817fc192908d420d840668b7aa7100

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
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        found.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




