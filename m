Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429DAC2A07C
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 09:24:39 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60646.1767605073862393814
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 01:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ko8UCacT;
 spf=pass (domain: list.ti.com, ip: 52.101.53.55, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzZ3ylCmEkiJiY1dISpDqhKemQ1fn/kGHYvdbfIMwM2kk65Kb6+0dvXXDecCqBt5kHH4MkSXkQO7T95IPB2y8d066IVCPQqYMNdYUdoeUgtmeEH20kDn/XAFuBUxYAAfT+r6mZtVC9r4/ED+AojY9slr0DNHfIqSU/zlf6Syz3oXzn/VTuMZh1h5YHJL1QlNTd09RWUr8xGiE/oIHGplozY1R4jczaheuSEYDBHpw/ou6AIxLKyjHhQVRRygozezp+bC8ER52/cCABtKdiBVOk9/t49Np2t8vNP/7MRAGUA9TCCMZa4WdaIcpq9mGtbCWfMDKuuUz0YareMUPtt33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZD8llhA8ZnN6JjWf1+wK7XwiAZBJ+7hL79XG50rk6g=;
 b=iXP74wLwX9SbecY6Y2mgAQwI9DUG+kAUHkHsI3+qOCaN9R/uJ7dA047TLpRy27MBv8/ohXbz32JxCE2lFSpUC8OO8KMQ9lbOn44T/jDCxtOBXqPj/n5UWmlONDkIyLfMKVycJ8w8koVXzfIKc59diz/w5edqEhdVbK2SXU64VcffS8vUkvg1dgGt1UAm7nEKxl++8Wq6Guanm1y9xSfyh3V96MWt629iCwKRf1polH9nnfj9GAKa5OFRc/l3Sj7IS95YYgQyKqKYdc/dI2lwLcujFjfinM+KGRlk220g48qLWivaBKc7XUAfTa6HFc1qfnZv2YxIZTFf9pbdFV4OOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZD8llhA8ZnN6JjWf1+wK7XwiAZBJ+7hL79XG50rk6g=;
 b=Ko8UCacTyG4OUxUq6sLpKGh6UAZc65wqU7VzKPhIS8nU7BuuVU8kczVkuaFw+yJeYTV+A9LNrUcIhyvyisqKB4T9wXNftH0zWEDVMNsIPhs+sSBSXCbnHLzAwKdNi9ra+b0gkFOzWoyEJYsoGxdIvdcl5cbCgeFQ581ym+2tybbiifwrg4IeFU19bbyh2LtiVIrB8WpbvQFADxvoIInUyZsRsF15qnP+HW/44fXXAj5ykJppnprs9tRJfYvImQO5DokkDWZqkL1v9dZRk4vu+OJx8tLIZ90JzKaQyUooHJluAFL+B4VGXt0GtJZjI9U6lCGrF159SVdxcoc4kUKAkg==
Received: from SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15)
 by BLAPR10MB5107.namprd10.prod.outlook.com (2603:10b6:208:324::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:24:19 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::3b) by SJ0PR05CA0160.outlook.office365.com
 (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 09:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 09:24:17 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 03:24:12 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 03:24:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 03:24:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6059OCGs1048400;
	Mon, 5 Jan 2026 03:24:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 586DC9ACF4; Mon,  5 Jan 2026 03:24:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202601050100
Date: Mon, 5 Jan 2026 03:24:12 -0600
Message-ID: <20260105092412.2006484-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105091310.1068862-1-lcpdbld@list.ti.com>
References: <20260105091310.1068862-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|BLAPR10MB5107:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6f9210-35f5-4fe8-daff-08de4c3c3395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AG42H5e6e05bR+fQ5ZDgIML5W5zAL5PhwBE/sT/wmeK6H6B+K5XVRLq4bas9?=
 =?us-ascii?Q?qBCrJX5yOHr5d+k9HdFh5TyzGRUBBkOeAFXvQNYuK+UrfFny3xZZ9KXiDrZk?=
 =?us-ascii?Q?VTGISw/5InwPhKCA/zJhjWIJmyBJWKO1MfkJmWH/crSixhHRfuissuELo6lH?=
 =?us-ascii?Q?S+FMSyZU+QAKnlyKT4nHbdxF69E59p6nLRa2bSGDZDC2NMqWWdI6pnyRVwv+?=
 =?us-ascii?Q?naNmP8KRAuF0IP9n1deCIm6P6xtYEG/JYFqtQvAcVc2nfmROKh4a6iUS8DkF?=
 =?us-ascii?Q?KiYHc8kQP3fvWza2CWBdlxwYHZ88yGQt4kndRYZ7e+WL/OEBzEdP1+et7NSl?=
 =?us-ascii?Q?XXs2Psjwe8zuULaEOeUM34U9WW2nGmacUvWpVA9Y1jrOrpRIeWiBWkkdoS5N?=
 =?us-ascii?Q?m2cG70QIyPHNE8Ut3ZRTfiBk4KUPEzaHHKjjXp686GPyt4JH0+0hU4V1G9dv?=
 =?us-ascii?Q?P10PsKECaKdd4W9WHqgdU+ySZdY4MdQ1plY1vvTiVurjSsKK5O4Ljc8No3hm?=
 =?us-ascii?Q?8JzWw+GwCuHJUkUAzFKEYLd7Ta7ayu8CQvzYi1YKlqYdi/PHMqs4A4Qal/AI?=
 =?us-ascii?Q?cY876rHoUIZkL7DXRODu5sYHC4EOxOpEZRDE7NtcusLUALoFqPXmhbALuldZ?=
 =?us-ascii?Q?iOwcCn7enD6IjeaalfmsDt7wZOXC85agl/0/jaYx/FtEReW4khr9CenXBjzR?=
 =?us-ascii?Q?RR28QVoiAkSr3C/WMozu5qGbSOhQ5ozxAyyYssWmrrIBaJPqSvwwHbq6E1Z+?=
 =?us-ascii?Q?3oG5ETtslzcs0JJLT0tXX/6HElzP/cVnZ8v19AKFIMEb5dQ2T+1t9qyLbxGJ?=
 =?us-ascii?Q?ZJFRjv+yYZOxn7/AZtbiQkLta6gRzJpEzp5NYZh6+pITPgYi4KlW4fxWFp0W?=
 =?us-ascii?Q?vLaRzgtMUES08XKxlfUhon3aUJPvvnT9HLCGuCoP5DfeDeeZBqyjhXiIeqX/?=
 =?us-ascii?Q?oYepSbJKatGSTDQl797RcWOHQODTmIhJgEtJBub/DPsqTZa+/W7v/fbB8Img?=
 =?us-ascii?Q?vZQrdT/W71CcQoDErV+krYzT7P0wUcS2QfEFJZjwf3/cp8UNKcDDfHGU7w2e?=
 =?us-ascii?Q?4QkWnLZzKSD9ORIcwYuNtqOn9G72J/OYR4CctSV/KcNOAbBteBDQ6FUd76lY?=
 =?us-ascii?Q?hyq3ATxlPnmBJFqaysqsHudZwOPSkhFOSWMZt5ugBD45l+zngoaSicsZaGFk?=
 =?us-ascii?Q?KOibr18AQUCacLnc/v+2NV4V23k38fC97ldg4kEmxQWeaE3pE886ZhTLCiSA?=
 =?us-ascii?Q?gFAtVKt1aoiahTikfxDqAo6P/LFT/R592evapqfZH5GWhOFeUnpYrDsjDJLe?=
 =?us-ascii?Q?CppmKubwXCRk3Aktk29qyKr/drfFNQ5EvyKyVGy8agp9E6Y28vvc0OnspASj?=
 =?us-ascii?Q?vDlgZ/21MVJFIbef9vCC5eQV3Vdbdzahi+Z/tnomwCdPh1qC8NjJ1TxEBh25?=
 =?us-ascii?Q?V6pMxF2C9VHOjuhzQsYnWnnu8sZUfLvl7ntDZZCAkl/5FQIpLpN1Li6xoy1q?=
 =?us-ascii?Q?qNCkpQfFmgFg+s9WV7IuP+0ux87hZ8GYOpvUyCcHMZlqxkMQksyZF8Pgv9t1?=
 =?us-ascii?Q?if+ZvSt1GFWPiWA4JzI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:24:17.9663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6f9210-35f5-4fe8-daff-08de4c3c3395
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5107
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jan 2026 09:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19393

meta-ti / na / 20260105091310.1068862-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
601050100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 5 Jan 2026 03:13:10 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3283139d13b5d74178461b15bc8b7ed9d=
d58ae3c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: am62xx-evm-k3r5-falcon: Disable test builds for falcon
- Commit SHA: 95c15f1901ad95828b0d001cee12c75d35f7b90e

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




