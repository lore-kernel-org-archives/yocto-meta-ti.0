Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAC9C982E5
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:58:26 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3434.1768586300541299404
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 09:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=m9JkMqth;
 spf=pass (domain: list.ti.com, ip: 52.101.193.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec65GNOkyDKHzaqR/glrfQE5pRoYJj5YgtxIeqmMxvs/VB8DL1n/v5tTyO7GPSvpxKALHA8oqI6VnIVS3blkI9bjxZvf1Vid+okifVLsXX74V9zj4X4qWvKwBwJfriFYI7Ph95tCuSgkKNscSZqZvX7R07EEDyRo/MaI+rbzJKRGiQE0i5OJIlueaBH4K9oDJ+RjTrMaTW+Sw3hbGk7bGtR9Ddby/znMCVDYsEKb2E52/p3zPUMVksEHUZKfaTFFzBky0WjN6QuQO+lZueNeJBeM3ZwV6T8CNBfIU+EGA7z0P0wmCv3wGobHqHdd+7Xp1PMXWhz8ZajZCD4QanKtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIKG+cVAXo4YJg4oaY1vovUMd5ovO34il8HK3SgF5H0=;
 b=Vfc4alNYdvn/0jjyDW2iOvi3GVJq8WLPTstiXBh92cNa6xXXCeU2MpnAV+3igf+jU4l5H4p519+9y9Er9FzlJkXlbtCglXcEZfT7nIDQNNzQOEiS3FJbsoDnSaQRkRc5Tg1QOJBpyxX0vmAO34Fs4xf/lGdhjjVSNezilY+MZnOMNOs/dipbmCJrqrmR6Mn/YvqLxp7RVO0xpbDtUTbRLXOHIMzYeVklPZ4u7PrhFiOs/ixlSuKoFELe1Z5hB1fPBdLac6Hxjx7LiFWK+13eB+5EBNLgAR17rasqI9Ja+1e7d5Qvwmd43Y7cC4wOpyc2opvEluRsAb69Z5NrxsGaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIKG+cVAXo4YJg4oaY1vovUMd5ovO34il8HK3SgF5H0=;
 b=m9JkMqthK+4gL3v9zDdn24BPpPczB7mm3lZQTc0WUBFhX3BUC7p5wWPO35dt/TSvHgRINTEmebEyQbXavaESlq9d/v3qWiQIngwg2sFQvOBVFlFcmYLybAujXEXo8Jz7DX8AP1e9bUK5szbmRzi3gwvLen4kmb04ngh4mxJJMQHfiEvGG/HJ+RRwzu2O8QYS6mKCvISWP7NAIIw7eUoK5H/vN1lA811igvjC+4WWt9iJ+fmypaIXgWjb65Bm0UOzbuXWkodpQzyQEML20yVlWOjw0lXx7fQbci2pMUmoqvA0pdS5PKj2boxxD7bME4qRKxqwBdFgfcD8lRvqsiN2Ng==
Received: from CH0PR08CA0007.namprd08.prod.outlook.com (2603:10b6:610:33::12)
 by CY8PR10MB7265.namprd10.prod.outlook.com (2603:10b6:930:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 17:58:16 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::3a) by CH0PR08CA0007.outlook.office365.com
 (2603:10b6:610:33::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 17:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 17:58:14 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 11:58:14 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 11:58:13 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 11:58:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GHwDu61039179;
	Fri, 16 Jan 2026 11:58:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AE5329ACF4; Fri, 16 Jan 2026 11:58:13 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] j721e: Disable ti-vxe-vde-driver for 6.18
Date: Fri, 16 Jan 2026 11:58:13 -0600
Message-ID: <20260116175813.54294-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116174309.1579692-1-reatmon@ti.com>
References: <20260116174309.1579692-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CY8PR10MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: d49b247e-bee1-400d-23fe-08de5528d26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HL2C+1JZCfSuSgb8dYWwHn6qrnGBpFqhd5GzeyoJVDz89SXOOqhQW1rq28pP?=
 =?us-ascii?Q?BK++EAKTfbVDhe8DSdXbNZkzqID+aK5EBjqWgETBouPZIEcSNWu/hiROn/Hc?=
 =?us-ascii?Q?4+uPBqtspsIHp8r8XhD9p8xfyaT5xSpW2zt4ua1OQc5h5RmRl9t0gmtGpo4K?=
 =?us-ascii?Q?pMOI3E/SaRyYq2s0EsB2N/EkHIJPHZhAeHDcVpCf1j1E0SEnZQQJf7D3TK28?=
 =?us-ascii?Q?k+wEp1/eP0SkOgZCeyGziz9aHDAH4D9L2s5nkKdKNjRFA49VtwxKfZixeI+i?=
 =?us-ascii?Q?YuUDJWwA64WKsxj5ehJQl67gXoPyBErgjw0YrhuZ1sr+tLoVBZm5YLSjgBgq?=
 =?us-ascii?Q?5UvNESfpnTIzmtdLNc0lx1zsp28DymgxLTlg/ZKzUwtD7HqhpG3FG9E8dMXn?=
 =?us-ascii?Q?8/2Bxi52uksurr8KUE2zA7adB5vH9QmqfF9qNhB2LL6H1FejOfsdDT1qC+hU?=
 =?us-ascii?Q?SfnYu68iZFMqH20mFe9eukFS8FHC+qwRfsmdA+3PZ3dUYXpHE9GFfJ/s7xZq?=
 =?us-ascii?Q?Xh6Npm7OxnxLK6TctfApQeiykst4CTPkoQUvVkYF4h2FBJMhX8XIpr2Jl17o?=
 =?us-ascii?Q?u6PW0VSs4qT4BCaJpyT+qzX/wHc5o/lTTQUj4hKBJhF7/uq60qC+42Jtu+/V?=
 =?us-ascii?Q?hcI4Zm41OQt+1G69qqZ+7wgYJUlbJg2sRXgdBpgh5AftNoDedfqCUMCZJADZ?=
 =?us-ascii?Q?1nIYoVPY71AQLAf1u6GNMi0mQbfQDv7izuyuCAHAippE6AIGEgpFgLgHaFp8?=
 =?us-ascii?Q?8olG8G6K+4ktjaRVSgRdmDkexEENRBuBlJfqXaPbVi+/AyknPFCbb3zLqxJm?=
 =?us-ascii?Q?bP3hmSPXKSYiuFpT6jFufxEIdUPKE1TxKUTb7LajX8oxqvBn5s6FayTmgsoE?=
 =?us-ascii?Q?LadmQYl/XwKjRICpVMD0I9iHKHZNGxXUrYBauBgAn/hF9w0HTdqsgH3+N6H9?=
 =?us-ascii?Q?eIFtSwYNRlzjMhd+uU5KWyYlJKpnVcDa5uxTTJAmtbOEpFuem2og/1TtDzk5?=
 =?us-ascii?Q?O7krOK5tUlNpi45ag2uG33IHUN1V+1XXyhE5NfgDXZvedAWcJVQ9qsE3nFjg?=
 =?us-ascii?Q?FVL8JDmA9qhf7ZHYQfei1TgHPbHj2PSHT5l2Y4ugyB1WWwIAMQ1Dn44AOnar?=
 =?us-ascii?Q?ixeNra6Wl+gLBWWDNwBzMlAEwAQUS1PTZFmh2RjGdOHOsR/8Mo8cuWi7asK/?=
 =?us-ascii?Q?Upw5bW4Bxa5s7Ety1ChBKraPdKCHy5NxgWNOK0sYrorK5HfOWJKGu/Yco0XY?=
 =?us-ascii?Q?B4Pob10bkUpwND5n9Hq/2lXIiizfiivR5Zo8Q91kX2hukBiTmQoGz54qOCUY?=
 =?us-ascii?Q?yvLAWHLb3dCxc8pLnEkR6FoCfj0nSbr6hDm2l98hnDlNlyhC38IqehonhaJ4?=
 =?us-ascii?Q?ZrsIpr7/obzQT1FdAlDrsiRHwPYSWub9VCtst5Wwfje7PAhvKtbERPUKUOaJ?=
 =?us-ascii?Q?+HEhTfLRYZoxbfCcqSplAxblDw1p+SE+uL2wH0ngd4S9NwZ20yt9Zt93HRhh?=
 =?us-ascii?Q?qviPpqWLGb7q7IL7cSziqPCv+YRm6uthU9MbbgYh4NifM7WYCgViSVnm3O6n?=
 =?us-ascii?Q?Vdfx5adr9YTW7PKBU0VhOzAINX3r/9GD+Y3odyhzHPUQkL32XSZ5s2V3pRd/?=
 =?us-ascii?Q?QXKzoWPYhanmJ8y7zN4TLZ2EHT6/f25QXLJsykYwE8Sj?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:58:14.9474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b247e-bee1-400d-23fe-08de5528d26c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7265
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Jan 2026 17:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19427

meta-ti / na / 20260116174309.1579692-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] j721e: Disable ti-vxe-vde-driver f=
or 6.18
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 16 Jan 2026 11:43:09 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f901e1c9fa049a495047084b7062ee713=
55db91c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202601090100
- Commit SHA: 3b7aad2f154511d2472eb5b646d15eb0d50d56c6

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




