Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3443F5544C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:57:58 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37773.1771988269992076855
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=JG5mmGgd;
 spf=pass (domain: list.ti.com, ip: 40.93.196.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcdVEkIcDvUJ9uejBTFUIguTVAq10yYdbe0NRQXsiOaASmUQ7th+FbwIHa6CUeyKUmaoQkExp440PRPD3gl6LdgA3kavDTP6v0XQcf4y7XTWQ8W2g0nNbgSWeK2zW9fc3KMrT2QGGEe8cGrch0M/u2V8XslKLQ+DaRrKRUuX1/aVz/tfb/peYpId2E3+YVCTmwGJTD6DwiI3+m/HXE4gBKuJ33KqAtoW0lakQPDOuMUosEX92iR8FlgFugT4xZy2lhySu+7VyijbN+o345dHbPMgDcIWwoMxxtYQM/qeHc5yrhpBmdr4tV/QHyokvKzWJNFQ78ryFaRbjcIrWbn1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1B/ieF2OIoCgde4Iv90zOAK+gpQRbJhRlRXAPy9Yh8=;
 b=qW+4g5MovpaUiFBOU2NFIVEb13ZSXnguqvv4PdTU8yMH4z1DYLRKUU4IOBdSSKSrX2r5hPoEAYK8CSd3SVVxZt6GaHHVrWvw0ACJHsRKg1khMI7ycjSJ/58dpax9fayXabha9v76WY6ePAYHFFCOlsLSkesjTAQPK0W+TaRmNWCeuljsYAP2iX+hgX6nKKbzw42t/0cVJAHOh+mhRfNs/OEuXM8jxmoMm5aSWARa2HCAmEDjL7Dzh45VG0rsJoIjk6pE76LtNNBXyNTI+xy8zkLfVcqCS8TZ3Codmw9qxjm4G6hPJeyL+KtEjdFY5c0sVMbe/TzknGkVALhEhouaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1B/ieF2OIoCgde4Iv90zOAK+gpQRbJhRlRXAPy9Yh8=;
 b=JG5mmGgdNsW+Ofx5+6F0Jj4FvanQ2PAZmBSzqXhF7zd5Z98G8Rv0u7r2MrSCGY1MBLH5gQYJi3iLDmBg7hW89H8pedeMg7OdTDC4RhOcyMtC4fe0SdpPnOQ5PUEdlgu1W0JC+88cVRH6Wf0I6HkLal5hnif+kJK+rwK4/TCc3/hOuSiSEYptCOqSa6fqChNAyKcFm2dgjcv/IBW9A+hutGwjINIJwVVg0oVR+zNT7cVJOEoMm4BFSBprnSPB5iRdNhl3G+EKm75NbML/T+YU5SUnxJg6Gn1HVeu/7AgHbsjMYQbY+/r2ZMFs3C0ZjwjJNULGnt5nFhUKrfhCfZwRVw==
Received: from BL1P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::10)
 by IA1PR10MB7515.namprd10.prod.outlook.com (2603:10b6:208:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 02:57:45 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::fb) by BL1P223CA0005.outlook.office365.com
 (2603:10b6:208:2c4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Wed,
 25 Feb 2026 02:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:57:44 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:57:40 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:57:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:57:40 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2veql3355951;
	Tue, 24 Feb 2026 20:57:40 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3A6132A5C; Tue, 24 Feb 2026 20:57:40 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 20:57:40 -0600
Message-ID: <20260225025740.2220388-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225024907.2908365-1-reatmon@ti.com>
References: <20260225024907.2908365-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA1PR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 27104714-56db-4074-cbc5-08de7419a634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|34070700014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5KelkgSxi0VsUFf8J9/Z8mqMhrU4I0+ZHA4KdudW/kYBSgJvaRYqGnQJyQKD?=
 =?us-ascii?Q?UIAQO9tGXLhSMnYH0DxCQ+xAAPbWTHIW1TK7G3lX8ZtrYQJ7r6/0vYjCqz9/?=
 =?us-ascii?Q?pXEKKbNKz/4EpN2uzeEEol2DvxmxIexz/z0A556tSVoX89Wej7fTCFhUOnTM?=
 =?us-ascii?Q?ItOB4HG2YCmyEc0ktg/1yj3ajsJKArr0EJoco6c3DWez/NcpF+a+A1fcX8bg?=
 =?us-ascii?Q?BW52gSGlxXXLytfPk61Gvq5N4qlhg2iJZYUy0itRmDVDh/dEf0Wmno/5Aebc?=
 =?us-ascii?Q?3oQkfThoK1KArP1hp1dm22Xxj6DEnjOGExVPQ6ZjiDVGav6smok9KPjwBRFZ?=
 =?us-ascii?Q?f9ZKj6WXkBLoF32eXWburKJsg0DFhe/ebmE9qNOMm5hYPL10I3lTtX+2ofcG?=
 =?us-ascii?Q?tP0w7CSZRARwXU/yP0SotNTSz8panblptBIkeBNVV+qF3X+H1BhU988rUtca?=
 =?us-ascii?Q?D4LhwQmyBkwsWb0rajElkFGBt+zVl06LMIP/13Te3b18WlPhA0e6Mp1jKk6X?=
 =?us-ascii?Q?7yEE7lgJCcxClA8LRsgCKE7KAYzcnr2ASOVFT5BpXVP309X6KQfT51BXi7nG?=
 =?us-ascii?Q?CqI6JA6qKyIGyCOmzxE9IgN5WQIkUV8+2Y5UZrLhGR2yi3KNJ8pHt7GAL+3L?=
 =?us-ascii?Q?miO74UKj6C2+pLZfJ+ib3VCjcWTlbOdNrh+KTuDzcicGkBSsRoK0L0wIAI7Z?=
 =?us-ascii?Q?gRWriCLAwMtdoxvgXp5KA3Nts7MYxtHvx3VrW55LdFNWxeukkjP3c/T5edjI?=
 =?us-ascii?Q?4j/+nyH+n0iPkEXQO4uVlNDLlzssm2NT/j6KthSUdLU7N+NWLAkS34PgpC6d?=
 =?us-ascii?Q?I8qs+rnGoqUnPKw++6DMw+KWKkMKg9CG5TXQpzTRtY+gV6PKl3XL/jHU3giG?=
 =?us-ascii?Q?3BwYHHjfHsctFxN0gVgdZoD+7FPQr/D3i42Q3h5KZY1YksxK8xy+y4Hsj76m?=
 =?us-ascii?Q?nWkE0AjHqCSknhjVDfS2aofjCjJ78Nuz2gVs5YwSr4R2POBoRNri69bQTRhJ?=
 =?us-ascii?Q?gN3QQa2ONRGwmdKP8HDoXw24NerssqCwhI8JO3UsdRkOYtn2Yf8XfXnRhthA?=
 =?us-ascii?Q?EHXsxzyD4zy0frHIjZCJrQ31dqGbX7nx7d21NrlXoNX/nWGqaHt9sDlFrQxr?=
 =?us-ascii?Q?IhVnZlD6nrh+06+kr0tinjxqrYPlx0bo6MfKjx8LKqHo2LlPcYW+FkI6ZZIz?=
 =?us-ascii?Q?9jfQSJXDlx5scFZkawibJTn85iXQvagTbaoGenzJmquQjjZWXnrFVw+zR5hV?=
 =?us-ascii?Q?OHH9d4uNN034KTuLnv3K1sCMkiQY2LhTU1qxETL65Q1MNIwYEUUSXT2ug9JU?=
 =?us-ascii?Q?waFtAo/oTewQBqnsfhJQGeQ9XG9kilLdPEJfBIvUtpjF6Sd7rQ/fMuNNbDyd?=
 =?us-ascii?Q?LIbdz2owacoz/PtaE59M35ajJ+C8THtorPRbU9WjJ6lhRyiBzqg7aJ1PQCkO?=
 =?us-ascii?Q?7n/AZIQuUGyTtadZxIo8F3/TWTfYP14EOZBfm/CkV7Zj73u2VQbdzLUio/6Q?=
 =?us-ascii?Q?tO9kzKpOBBgdq0SwBacAn9pYA3DZdWZvT7ggSVa1YdN2MnLe2dHoeHSoItCH?=
 =?us-ascii?Q?miH4NRi09nQAVV2E7IqkHY9TJrbvPfi08S9nq7a2zL1HHxwpGsqiOItlInuN?=
 =?us-ascii?Q?pUamyga//PTaSJxMd7pJeEUfu3LqZBxhwajUGF83uMPB?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34070700014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gsg3J0BqljDP6kYGGENTVV9FyJqjlNSxZ0axqBCpbr4eRcHnlbBcfMmzHCK2WllMvCO6wcbyt4ltXuue1arrs2/Iw09f58qmoRdkAodzg3EKWO+vITsjiWPXCwY2SLIcaARPXFeox34HArHBWc4XV1U+hIYct4kd47VoW1ejqgj2Z1TRpB8HkIzslsRR3BJMUwKckgs1dpNB1906fJrLs625gMZR4AR6AQKXZUYkdagX9yTYkE8s2btZt2g/6WA54w9e9Q2g6JvC2Us0hUJGO+Bd62FHUcpHq2Lp/yMp7jUAnLQVO9f7SCcmMFDOyapmjhTFQdgSpIrtfKjBQg72EN6CiDjbthQotm11OzbAWZnGlknX4SVDTeeb0jkRCvCbZJBpiXbLriQ/A+gJiad/6Pl8TgjC4HOOEU9kR+BsfCkqoiVk+YQVo+heHvquqvMx
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:57:44.3508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27104714-56db-4074-cbc5-08de7419a634
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7515
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:57:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19604

meta-ti / na / 20260225024907.2908365-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_=
STATIC =3D ""
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 24 Feb 2026 20:49:04 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bdf70ff0b4766c52a85760527631d29c0=
ef03a61

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602241800
- Commit SHA: 4cce297bca77323fbc8ba600e7290a9759397ad2

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




