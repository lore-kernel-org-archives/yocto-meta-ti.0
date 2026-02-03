Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71B2E8785B
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:07:20 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1440.1770145639409922703
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 11:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jdNEMEbK;
 spf=pass (domain: list.ti.com, ip: 40.107.201.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpxiX4g8xUUf+uvFPk68pONrjGseO4+lWr45YnRubCV5CLvUYEDnRTyAQ1urgM3KqCRtGH5qMzUaZn/VwTn9eIIS6tUw8ZQ9ymgbyqvK/0iqIp3X8wiZzRDCPqY5YBwwyP72yKdGtFM5mEa7T0xRI0njFk70rW/W4pnguMXDnLgPrQQJ8qZYG9V2bJrVgLy3cELYVGkl+BhT870GtoPVPee0dIfmZ1S3jOi0O8oOWW10wOmUZDUZf8pCNCAfrFnZ13txX0oJgh+/ZYJjeTyGWUhKhF39X4K0dOsjOKH+O2MKxWtuCcN5IirHacA7Oi3eyKD4VYWffakNUPX1lhN0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJnN0aSZiL0d4m1ioK+SnD9FHMNXWk/4egsYBikLFCI=;
 b=seGgF5KGZkqOSsT2BnbcYYr8e8QqpIHwTL51wD1PfOQa0LACovhLH1SGY4AGibpa5LkqsCNW67WdiOcBQzVM5wh4fZClciN8YXvWu6zB4BK285nyPI3YDNQIo3CahgKjQYmS87aU0C7yAqTCR+vLWbme1RV49VOMoFwL26vkMMqwIiAuQ866JDjbBJRLDKZKmdgWBuqyYUABQ6FVmD9hXQPWsJ4Jc3Hp1SZKJapL95T93KtCkrCSmWPjUInDB2Mwv9/RLVtvNDS+mQdr3mzXnurRf4J18dCbYO6p5KeqvnR2HCnOGxMOK/0YAui9ClxlC6mdhhkCfcDxqwniacchag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJnN0aSZiL0d4m1ioK+SnD9FHMNXWk/4egsYBikLFCI=;
 b=jdNEMEbKMBpJbbUGvCpuePqW8QaffJu+EuPPxiW+J8tnNqWGLNE1yhZQFPHYVqPfM6VbAKrqP/Sai3zvaKjLoxoT+oGuLyg6dwLT9JAo+LL1QItDz06He+GH07hI06XaK1Wt/VT0YQpQfRYKRxx1qpS9OlgHY6BcPiS/dJ4uAeWeCsqoOkKRI6Z4dMjL7IPZ/4Dv+4RoSKSXq6be9Vxpyuu94oDNVYPcRgaSTRFLpy1qQgzXbpCTUd9Ug4T/PbGCu/54QzDbR+kWb5C+0ckjnuL8o/KyHos3uivx4+ab6CNn0m8OxL8PZPyy13jzxvWXhxCXQyqeefnuzPmDyzxUbA==
Received: from BY3PR10CA0007.namprd10.prod.outlook.com (2603:10b6:a03:255::12)
 by BN0PR10MB5031.namprd10.prod.outlook.com (2603:10b6:408:117::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:07:17 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::86) by BY3PR10CA0007.outlook.office365.com
 (2603:10b6:a03:255::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:07:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 19:07:16 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 13:07:15 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 13:07:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 13:07:15 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613J7FqD238920;
	Tue, 3 Feb 2026 13:07:15 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A056C61B; Tue,  3 Feb 2026 13:07:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202602031100
Date: Tue, 3 Feb 2026 13:07:15 -0600
Message-ID: <20260203190715.1804338-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260203185753.3259517-1-lcpdbld@list.ti.com>
References: <20260203185753.3259517-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|BN0PR10MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4f1b17-0114-4eec-e156-08de6357726d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JyPteK+inaWYa+6chbiwvHyKF6/27/2gsDCJyR31045G02IE4JXRC4TYlHvr?=
 =?us-ascii?Q?NkHZEl2YPvwhmixaE8ZDYmnqKLn4k+sF9ntjsZ2kBPtAa62pyL+5uS07FEIU?=
 =?us-ascii?Q?4D7J/ZpbWdhNiWw1uHPNXaJga7eK8biMnsxY69w9gI+aZuq5gB4Hd9swEZfG?=
 =?us-ascii?Q?4VMNe+D4Um+YOSl8ptDuRPbJKml8g37QPsUuhJfz0R2UVRrhVOFgGoAQ18TB?=
 =?us-ascii?Q?m1hp2TJx27EugB2wSW9ifaGfRvasKdkdJKUUOMC2ZFuE5zqb/uOVLCXy/E4C?=
 =?us-ascii?Q?LlLgYw+CzFz267MZZYS8nyoMTSb/t4qX943Zazu+XG/FZr3lU8dr5R+VIkNo?=
 =?us-ascii?Q?2ubuikVPrxcQnctWrrcYhi4VgvNA0hqwvIyS4L5TLpjroe+DJubIvHXPskP9?=
 =?us-ascii?Q?jS982xd2pLT7wowGZuJ7BaoMSfNk+75hApCZG29wjFUgbzKBNTOK/Ozla/Tv?=
 =?us-ascii?Q?NTay4/lLIw75+fdcbi7iPefnHqfj+VpUO0YEa92hAiO0x43/m3XOVXAEUIb9?=
 =?us-ascii?Q?bZdS3Jx+mq3GbocrNS9TkqXyLzKIM8mThYKHRmBls8slA6S8UhtBI+3b1nBX?=
 =?us-ascii?Q?lIc7JM9vIgqVdDTUgLBUUFIq4c7dwsGX5NFJOVRMvAUwN33JzoFiD/rl7HBo?=
 =?us-ascii?Q?iuRk0oEcTkfvEKrJLd0k6pXVaylpk6CeLWQQx0wzOzdF769uhDmcb9QunEFy?=
 =?us-ascii?Q?yUyGnhCG0xPalhdlyFvOv1XDUz3wS64L/moZM6ta8qukkAxQINJtPgPPo+6W?=
 =?us-ascii?Q?C29n8lBC/dP9GPB3tN5a8+4oJ18ErPKvWgBaBWob1ryc5wlfkM9kd9qXrVO1?=
 =?us-ascii?Q?KhZwuQS+5nYtq4TA+10QxHSaTZNxjfchv2HlKxZIkRylHYS+CCdpCyM3RlOJ?=
 =?us-ascii?Q?pYMCY695Yx18URHV+495NG6zpfU6M7Uy1Q7Naoq8VxjFENR70IpnNKPPJGxw?=
 =?us-ascii?Q?1u2efi0InBPPPme8LEqLPX4V+S6ETJvF0M0GtAkcJDV7/CJlUm/kMQKhuy0h?=
 =?us-ascii?Q?4abd66sCUflWKWwRlFidrHhKMPrzClKxfFp5sCc67GdrjTDOhVLhURfpvZtn?=
 =?us-ascii?Q?8A3EkOAhLNc1XFs8sVwghVeucVtRemY5s2KUf7YVH5/nvP8QJSq0hHbrlBtU?=
 =?us-ascii?Q?NFE8U3BILM31n4AeTjvwxIUvDNeKHxscSHHkAMo7/XxviR1d2nqR9g0MK0at?=
 =?us-ascii?Q?7o+T1O07vEEUcJaEecvfd30IYf2kAT8Z/AQcQ4JXs0eqr0BqLpAI0snCDNVD?=
 =?us-ascii?Q?SCb6iFsk/kHkoqdVW3GXbcRMVpHk0rPo+Jx0k5TRv02qxIZCuQddQomOREUx?=
 =?us-ascii?Q?QsWIRvmda6byv6Dldm6J52n5K6QZSl05SpCIvR0m3we5WjaAB/H9tp+M9eI9?=
 =?us-ascii?Q?b5EUqXTTgZ77gs9y5ICpxGQ2OsYu3RHSgZ7HCjpTm8K7aznqMtOgAdur4a5q?=
 =?us-ascii?Q?muluPgZZ6ox3Lrr+UK/3QVpHVDGTOL49cpmS0ijs9WOR2P+UBaXvL/Xu2vK6?=
 =?us-ascii?Q?neD5w665rrc1WmmSqJpaqyMX+VqosREXBfP5c+xChmQbHj/0FUsb8/jbgT/6?=
 =?us-ascii?Q?0z1tLYPwmGYU+QJo//4rTg4JoCwk3LpI/0G/yX6jSZ+AERc7SX9/BrEF168c?=
 =?us-ascii?Q?u8L82+NIwI/x1ZulZxRqoSNF5ZEhTJaUcghT3pE0WMg8?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MnkcGI9R09W90PJCmJ0N98Csm3AoMVP4KXKBibpuOWvWU1thzVqmWbAGPxYeASpDHZLQhu/jog6lGkGoG+gzsfa9IDHvHuZvrqL5d8sZKfxJhVhAvd3Cdqrpb3Xt2pliPuYn/uOXXnzEZZGVik9x9dELAASeWt9VcvBFHDVznL7Mw/Ut9Vr1YNnVUQpON7le8WCTYWX2Xav/dblA0yolpWy0gyT6DKMXDw26wCrfJ0E6h9U/NlnN30x7UPLaEcqOgUxRMtlbTqMwVdvBZ//OW4Tr7r5HBv8A1hhqPU3+t5/NR+26NcKI9Dg88vCTG3ivpev16vznxNEv+CQMuLI9haIdrju+UIwNCyk0HiHwvbFuBOEtFp/AsGr0iBJQUpoBpbH/masOr2RehHYw2me25D8M+AWtUshi024X9wnF6HP0DaLjVITm7Z/mJqvJMHf1
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:07:16.4931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4f1b17-0114-4eec-e156-08de6357726d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Feb 2026 19:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19461

meta-ti / na / 20260203185753.3259517-1-lcpdbld

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
602031100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 3 Feb 2026 12:57:53 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 82085ce5de7a3140424fc5c8315f9d66e=
1ead30f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: am62p: Add ECDSA key signing
- Commit SHA: 634a30e2c13a408cb36d9526c70aebaf7a73f48c

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




