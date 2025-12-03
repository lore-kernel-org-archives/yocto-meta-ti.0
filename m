Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDF2D1BDDC
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 20:42:39 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26184.1764794556664508867
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 12:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=t2pUvdhc;
 spf=pass (domain: list.ti.com, ip: 40.107.201.47, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpKNbDe/YEKKS4tLEaCffY5InGCA5twDqIruGcG62Js6O1rFjNeZNGttcz6yVHyDrIrycNa2VpY14MjGK0i3q1p7HIleN4qUV4x5Ac1m29kLc67scwyNY1WhMzty4zRIbAaqXScyXyc2+aEBQ4yeWT5MRWt1Tqwu3AZ2WyMBjqDg7folwTRlptTn8ow7EGysxYwdK6sP8HCFHDr9x7C/CibZj6eNYSs83sMKYOl2cmnW4CQjZhAzdJrqlh5t8nwDCG3CNFYVB0y1TDpKCVgI1JBE05lqsJKG45zPGCm8jbRPcjvV9UmP+0H8K3S3gN1YF/79YabgBLz4bmEv4XREog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WDsgEAopUAbGpK21YYVDDdyUddw5WyIxq0xOpOvJcU=;
 b=sk+Llm6tAVhyCTrDtzKXDYDjFLCMrhjSRB15quQBlyUnyLDIkP/4+yKP5mKNn+LP44kJpzw0gbd52ceBzhVAS3kxo2f0VnXZ7bSccca65HqLNwE5HnlW1XI2F7tlrSg2pALMgCjLLK4YXA37zw+P8B8rHH2w4qqr55EiWsoTaPHHBo63zePHQ12kNkDSv0ObIc7M47Gf5Hff7qDGd/s/bGGYpPw5Jk20lwc2HNhcxLlVHHGfc7lk0Z4DwyQzhes64sP6hMzC4B2PIVnG5LuC+yIHTZDWOFV6/XWZDtqCxzf+QSqY/sBPLiV2Ko6nYiPngNPLrhg2/A62VgewNo29Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WDsgEAopUAbGpK21YYVDDdyUddw5WyIxq0xOpOvJcU=;
 b=t2pUvdhce8Fi4Rd1dC/Yzao6U7JHc/9MdntL5ejjgI8Xmsk1+QmmvDKXE5l3F1oc9VgFvE7ooAIO0px81OIHmbaGUwI/yYi/jmqaBnnow6qG9zZTyku/xx9FRyhwr31hnNCT4YCWLYDtLbkSKxZcAwP/FyldoItkJt88LduxGPXWRa5q8yTgAOaMa61DHt9viIFCXizIU+al3+dvpfgs/QFeDI2uu8E5IjCzVyMxyE1yl7hwfERwVojx+E3WTz6XrjymSqU395Plsed+iNOhuTCKfiEueyr0Dv8JBXUsdQi3Msvd6U6NRfo4ExyQU1PSigmHH1tcRRCjGou8S0UMog==
Received: from SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::13)
 by CH4PR10MB8052.namprd10.prod.outlook.com (2603:10b6:610:23d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 20:42:32 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:35e:cafe::ea) by SA1P222CA0099.outlook.office365.com
 (2603:10b6:806:35e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 20:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 20:42:32 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 14:42:28 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 14:42:28 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 14:42:28 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3KgSbR3251614;
	Wed, 3 Dec 2025 14:42:28 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0034F142E23; Wed,  3 Dec 2025 14:42:27 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] meta-ti/all: Make DRA7xx support a subset of AM57xx support
Date: Wed, 3 Dec 2025 14:42:27 -0600
Message-ID: <20251203204227.295345-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251203203211.1113327-1-afd@ti.com>
References: <20251203203211.1113327-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CH4PR10MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2fe727-095a-4ad2-b6d3-08de32ac7bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jWeVLQrAWj1WghsVBqNZwulzyE1dFPrMIatsg0SMbKW6Qe8lKyvOCpZ+redR?=
 =?us-ascii?Q?oJ2/LHRbwr/af1y1zIAmwEbfj+nxMx6Mx16MBUhv/G3k/AIU6+2agFgntx1Q?=
 =?us-ascii?Q?8utSk/bxrQVmEGlFjyUrvUcrCE+SMtXPRmJvKUlvkdAuLFUhHGuFPmd5q4i1?=
 =?us-ascii?Q?sL3UAshnkRTDyu165ixofFUDj70UPAvGvJzIFRf7uFRtDrLSyA789Sd6Bv/m?=
 =?us-ascii?Q?l1a4ZUIkOrKYnhMPuDq6V0q9m2wuc43oO3Ve7kYUr3Njqfn6vEksZmXcmHSp?=
 =?us-ascii?Q?uAQY6n8CRAEyukYZVExQRS4zr2+dUyf96g1Spq7mQ+oqTkbq4OOdNNVMGosH?=
 =?us-ascii?Q?xPF7PM5Ab07gUz9TkDdQXcQEBpaPNAm+rhQ7tviGf04sXUE8MNjF9/SkAuRB?=
 =?us-ascii?Q?/cbti6E0ejWxfB1dLJ10Ul+zMgtIQ6vesVauloj9RMpxhW2uqRls8Uztwqzg?=
 =?us-ascii?Q?T364WDJer7gySylN0oC/Yai4NfjQgd8jMTJ+bMWZruuPrnktK1WeZTF2NShQ?=
 =?us-ascii?Q?AvQR52zAC3EVukASCOfld23BBGGAEWBd7NKO0ApWkeTSM1FWqa7zg/ebqrcB?=
 =?us-ascii?Q?ve82pVRdX1MgDwM+ZYNxjiFATkZteD7XfhhdXStfmZGXlszSNjK/V/mJl7Lm?=
 =?us-ascii?Q?3tRm2E+VlfJxv8Fi2zhOtZ5oi2YDgpfiQTADO29oWSB5VCiKsfwHj3FAda+r?=
 =?us-ascii?Q?1k+wn0HlVDsegsa8uT5vFsUZNCLITC/vKY/lqrl/Ck8eJfqbwRiKc1widlaR?=
 =?us-ascii?Q?AIg7Hv8vjEWD2Xyx4jEDC20ckWjKSOHl9giQx7GVeTs7se0ZTtG8oXQrjmIW?=
 =?us-ascii?Q?AmicPvuuIy7ZUgEKAP70D3XM+J+AVjCbrQlV31A7FPq4831QMND/qIVkHnF4?=
 =?us-ascii?Q?pELtmbxKxHqAhVziH9tQTL+uMqEwkN3TwnGdLDd4sTLDtdukBk6jAruQSySS?=
 =?us-ascii?Q?MEm0xAglV1AG1qk6fUvirK4ipDskPrsGbbmtMqVrKnbyBN7c5QSwCTNPSQCR?=
 =?us-ascii?Q?zgPI8PBH/EVhw6enS+K+KTc/FXpRczAtaeF/fKxzaK0/xeKtZpHp3FLa2/km?=
 =?us-ascii?Q?PjPaoelTtnuZMcBtEQTxx56u2Z/khC4xbtmW2WrjpyQPjpVRWKPcru43GhOh?=
 =?us-ascii?Q?3eBlGopsyNO8qljgQncVdet4zCQm2X+6FsJD1h9XBju8Cb7wA6ZDQTAGmTg1?=
 =?us-ascii?Q?cy59bpVtT6gVOuf/rZKcycmGHi8QnQ58XnVNSn2rgMmbDqdU26wdtMpLkLbK?=
 =?us-ascii?Q?wegnEjJ/Txh8pqpOT3WVDVo9upG5dqemQ9wQQMX8KLNxCu+pLC0AiVBqSB2X?=
 =?us-ascii?Q?3NVK0aBFmlo/nzkCjQHpauYm4Me2oNq7mnl+CaY5jNh+JHhd0qcCPoZJ3Y0q?=
 =?us-ascii?Q?iR13DICj4v62ZwzGrxbIcHwn4cm+3G4/xkb05RYfmMVuEhUY2tbrBKRnaHhf?=
 =?us-ascii?Q?Uky3X3udOd2dPfxaBJmHTw1/KzhSgzZfNxgXinfXRp1jVc4vt3yS9b1o/uQ8?=
 =?us-ascii?Q?kH3bMDNJSGuuoM3d86ZO92c7cznUZAik6/WSva7pRPl5xxaOTRE7J3lWL3sN?=
 =?us-ascii?Q?yStmbtas04BIYwTqLPU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:42:32.4357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2fe727-095a-4ad2-b6d3-08de32ac7bb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8052
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 20:42:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19329

meta-ti / na / 20251203203211.1113327-1-afd

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
- Patch Series: [meta-ti][master][PATCH 1/2] meta-ti/all: Make DRA7xx suppo=
rt a subset of AM57xx support
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 3 Dec 2025 14:32:10 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 68a91506ab932f0e846b6a42c9087986b=
3999b24

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: am62axx.inc: Add TPS6594 regulator and core modules to in=
itramfs image
- Commit SHA: 98dfd20aad4d065d0fd86750a9765e1535a286f3

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




