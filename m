Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E41CD6E5C
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 13:55:39 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24281.1763042125211648569
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 05:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=mVz5aKNm;
 spf=pass (domain: list.ti.com, ip: 40.107.209.27, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0lUAIzqLtsJlWbfGp6AukFbuj5Pr9/7YHqbCoHrB2Fwv2B0xt5oZAfts+UCdHBukoRsS8oOn2nVldxQWrZTGkXxYiU8l/y1rxjpKzCsDdEU/Jk80w1rQ4LyOE3/o90fTL/TdsZGXysDFHwC3K2Bf7PbA3BPtmux+mqwwziFESwncxCNa/n9fY1i5euBvZeZ4mqK8RPXdnySR/4dQZgI3l3URejfrF6xIi5oZ8skeOHPFp96ydtgp0dK8fQnaheyiztlfQ6jJJkYf7MOYylUrWpxt7p9WxtLkI27CWWTH7FyeVqrd8Lc5n41Q5/iM1H4vzFv7pzol7xtnQtRZyKOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9buitTtAcNzBYda28bac25K7Mpwg8Q4HKEdYd6lc20=;
 b=PU6x7+OxdV/eowO7oSo2/Y6oltsfS8GGdGghaTuM4z4HUSn5fsA+rXMffNq7O67sDWVRcKuPUqEX0rBtk5C2mjeqdNFwDoEb9CBz1q1lAAMAkLVjGzclTBpn1L20yZZQzA/QvZUkMxhv1m9rMsbTtR31h1ZREAcs7p1Q5JX2CsWYLFJIffBMEvWxB4vW9ivPoIJ3naSdHZV3jldUoWaIbRXDf4X7VgOueZgU36/H7vUW/0F7oNRlNcSNReAg7qFMLUw27YKk89egioik27PySyVPOv6dsLXNMJltKSihWwgiv0B9ElE8JpSUkx626rLbNbolpt5YXsoiUWX54wsGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9buitTtAcNzBYda28bac25K7Mpwg8Q4HKEdYd6lc20=;
 b=mVz5aKNmaXR+15dbNGG0VDHnPKyaI5YKvU3qjaJP5FmDKGU4qnuVPo/uZYdDncO4c4IU4f/ilNuSN47MTOkkpNsFheLf9vJ+Mnre8Jq1/aC6NdSOYmU+b5R/sEScs9POihkuXk+vxXZIHL2gcJ9i/lX6akG/oHXVmxM7iCZq2plR9pxk2T+LwQeDl1Mxl5cl4NVE/aYjSbGlKX3E91aUm0VXkff8v3od7BnNFBRYdwyvPA45dBYa4HekcXF/nFsiNzM6U0WUvPSUJzzbnGu4t+Tnn87B0UQUOL1TJxa/B2pBrqRX/m4AyYARVR2crJzDEXuuzEDi/60L3RgYNMyPTw==
Received: from MW4PR04CA0287.namprd04.prod.outlook.com (2603:10b6:303:89::22)
 by DS7PR10MB7189.namprd10.prod.outlook.com (2603:10b6:8:ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 13:55:21 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::f6) by MW4PR04CA0287.outlook.office365.com
 (2603:10b6:303:89::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 13:55:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 13:55:19 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 07:55:15 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 07:55:15 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 07:55:15 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADDtFaC3919949;
	Thu, 13 Nov 2025 07:55:15 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 53C259ACF4; Thu, 13 Nov 2025 07:55:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Hari Nagalla <hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <nsaulnier@ti.com>,
	<b-padhi@ti.com>
Subject: Re: [master/scarthgap v2] ipc: ti-rpmsg-char: Update library to 0.6.10
Date: Thu, 13 Nov 2025 07:55:15 -0600
Message-ID: <20251113135515.1635948-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251113134037.18115-1-hnagalla@ti.com>
References: <20251113134037.18115-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DS7PR10MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b268655-29d4-499d-659c-08de22bc4876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AxckxNIkuoXDpbv5qtDLiJazrhMuBHi56IcrIToPnQHboIGjz1Wmty/ysNzQ?=
 =?us-ascii?Q?Pp6qH3OCVN8uznC5gy6LbW7CRP41CILk7kK25QdlBqnQagDSHYIAILvkRGnG?=
 =?us-ascii?Q?JJxPtO+Pl1dYHgKR7IYI1lNSkwa/tFvW8FFJMqfIH6nCeO/0eb7JdyFR/yb9?=
 =?us-ascii?Q?bq6y9e2eOtOw0kMoonL06hCnc7EtsryG76yhHAxudgIY4lkT6xz0IIAN+g4i?=
 =?us-ascii?Q?ojhY9tX4/F0XzfEh7v6CLpkgfAcGEF7P8jaq+RMJP7zhUAYFp38oqP1ncAjy?=
 =?us-ascii?Q?Xo+XMMwLVPEbnX2mlMZ2114vMpkmsbJWiRyAh7sW5Wwwk6poDbPXVIwjVEju?=
 =?us-ascii?Q?9aTQiMw9S6i5noeBzEUhPv7HqflHOi1BPAV++B14JUxIEjf35PLJ+zbXdr+x?=
 =?us-ascii?Q?fTugrpYvp3u/AzsOQrxNYojvmSfqVtZP0J4wnZA6zq0Q/D1VZ8/8Jl0LX7r9?=
 =?us-ascii?Q?PsqHI/WvcwYFV3oWi5Acr7TsLTV3XbE25E9a9ENFXtw1c8hHODyatyxzQPb2?=
 =?us-ascii?Q?wlmLXKl5Pd9iOwVCnkEQpG02MVbq/0kW7AKXBuo5PIn8NUox5ShgCTIE8ay9?=
 =?us-ascii?Q?g8JFR+7zqO1P1o69W9zvRGabgLjnae7xSWMj7BtO/G7GpFHa3uUl1Sdiy4Qz?=
 =?us-ascii?Q?rshbvjFtWXt+eOrPTxcGM72E0b49CkyoEiviud8icpJeKPW6W2sPkiGzE5Qk?=
 =?us-ascii?Q?CSH7SOeJnq7ZmqVGg70Vge8CyDQNq7HvF0kP8qA/H0v9Cz9QP8Q1wCp4XzXr?=
 =?us-ascii?Q?tg+DKb+W1T3TVo18ES756i0YrqAC+avOLLEPv5eAdp2TvK3p3t0A0MInDo2O?=
 =?us-ascii?Q?3YsnCvu0E6GTwJ0DsKBTGgcSfvXv6icVyV4i0qhkKebZDzhY63zPkTPSUw+y?=
 =?us-ascii?Q?mdq5adzSpeahX9BzUqLA44jVFDLSll7d1lihY9AYsRdvp8iLdKeSZIKR1Ep7?=
 =?us-ascii?Q?Fh+mLOCEL2Z4K78pKWWtfhszHNfFbU8H54cJSbMFmET8Yo5jQK516rAdXy4w?=
 =?us-ascii?Q?G68DOvKTJoO3KKQH8JCScz5iD+YufK7naR1bzfiVQaygCnvbURjHr7kFm564?=
 =?us-ascii?Q?Pahkbwz8jX/ywurN2bTdM2NEt41N/EzgdbjrA2Z2k5CovohXvmR/U0fp6bpo?=
 =?us-ascii?Q?/vSq50s2mezCv5/CYZW50PzMxTMWuQuEA6Dn9GchyWExUftA/QTbTw26m4Lc?=
 =?us-ascii?Q?Baa5o6CczSbPkRg/JUfCHHVDImiZLJm2XhKZl4s3rHGARgRanWb3P9Z5C005?=
 =?us-ascii?Q?EkKnUgtmI1p955p3yArN//ZsB+UAHXWdnNCfCCCrju+aF4NAnTjKEXK9dpFG?=
 =?us-ascii?Q?0eFUweTkcND9+glCURFEDqBC/hlLWgYr6p31sxu7N/kNKw6/l/UmzAm9kTvT?=
 =?us-ascii?Q?I2IvWKpkWgO5YWnELbZvTSmg2/yr/BPs6eEaB3Smpy5vvbQu29FpbdtH7tZr?=
 =?us-ascii?Q?Q9t2TwEUZeN0UMU5v4aS7NK5A92TepDLFYEgHnLXxoQmSC/Sx3DUrxP6rhrU?=
 =?us-ascii?Q?cvYAU4cRSidNxtshnNkmRSIB42q2zqyOHCtNOFTa0LIdMHegO9F/dj824r9X?=
 =?us-ascii?Q?vPPqOQtscYzlzIy98Ao=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:55:19.6768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b268655-29d4-499d-659c-08de22bc4876
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7189
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 13:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19269

meta-ti / na / 20251113134037.18115-1-hnagalla

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
WARN - [master/scarthgap v2] ipc: ti-rpmsg-char: Update library to 0.6.10
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [master/scarthgap v2] ipc: ti-rpmsg-char: Update libra=
ry to 0.6.10
   =20
    WARN: Commit message should not include directory path to recipe: ipc: =
ti-rpmsg-char: Update library to 0.6.10.
              ipc: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [master/scarthgap v2] ipc: ti-rpmsg-char: Update library to=
 0.6.10
- Submitter: From: Hari Nagalla <hnagalla@ti.com>
- Date: Date: Thu, 13 Nov 2025 07:40:37 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0e08d4861db2c5e897302a7be307bea24=
50f976f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Anurag Dutta <a-dutta@ti.com>
- Commit Subject: conf: machine: j722s: Fix overlay name in KERNEL_DEVICETR=
EE_PREFIX
- Commit SHA: 8dbd05aa6098282577208ec7c6766d42d700a2ca

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




