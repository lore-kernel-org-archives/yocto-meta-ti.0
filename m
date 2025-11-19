Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5A0CF58FC
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:07:01 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17766.1763586411672813215
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XPoVLkA/;
 spf=pass (domain: list.ti.com, ip: 40.107.209.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro8kzKmduZPbRvh64a4o3kDrvWohbFpNFj4l0Tm3aj9nlpePs7eQ1XmJAXGdIlEc4/HjIy5frZAoWkiMYvqAmr/iDFDJSFU9O510tq5VLEN2ssd3KEdN5SeTwBe1jpmmlZBDeDOGXiCjaUNDDIH0zt6+u6LSFD93zvKYgqD8uX03dnaEw91ePsUD7AZYjzPuYDtV+HRq4RClBTyVs7bdhd3Bgu60OXLlek9v9nZtm30IwnystDKOwkpL0B/wI5TPBd7+FiX7s35Bwq1ueUPmLDKdBzNejho6YVhQ6X5LBYbfwUPuxZajX6eT+lykPzCj5D7OD8+AWXAb6zzLXpbtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+i4EdlAIlT3SAm8qmGk0plgwNoI+BfqLDdX4uefaPM=;
 b=AGpZS0R4nUWI0RXwnfQZHRxPI8swK2Zw3L6nZqN3oTnEWzum0XQsT9oYbwSWuW8RhB8gbMUbBYZWzNS5QJaI5MAA7sYR9fLesWqSf0lQKbK2yBe4ShF7vdYotwJO3NMOR6T8I2kejpfb/fmPhey/yVTI+jx71eBWuQ9EvDcjFuZqzi35gU5g97LnG1YjV3vTYY73++Jf6BJ3bBFqNm14Q9aOc3I+nNoJTzDHLe/mDApOWNH5qKuB0n347zhhWDWaIx9BqLbNLm8fI19MjwVJbtF9Wkq4qAbTvBaBHD7ZjpofFUIpgqyGLkbfqjpbbaRTYAGyUSxodMhSSX20tdYXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+i4EdlAIlT3SAm8qmGk0plgwNoI+BfqLDdX4uefaPM=;
 b=XPoVLkA/I59mrZrGqYHOfjB+rVpRyuxaxfaplcAKRMqbX+ctSxyStqOF+0rILeHvtRfvu7yyDtngWfASxfw8Zg1/DkS0bNtNv6PMD6nNXhv3EuaEZ1fOxwWdPDYIdq0mNu+VoIy+mnxq0k/WNN3EICeYfhB0MNOvFXQfjQCK5YrUyBxduGQfanrg/7fQ17Pl2ZZsnuikrrC0HZ2wJMDcoYyBXpqePJWMlMw9fhOTH63vic87gkryMtjvigoNIUgtNbe1r5lQ/sEACfyY9rN/GbTgo8D/I/6n5hunrH2BAIoDoV/2morfefZ7UjDN1CipeOiMkCVOxwNRtOiiZHY+jQ==
Received: from CH2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:610:20::33)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 21:06:47 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::66) by CH2PR07CA0020.outlook.office365.com
 (2603:10b6:610:20::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:06:44 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:06:39 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:06:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:06:39 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJL6ddb2480583;
	Wed, 19 Nov 2025 15:06:39 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id E6635142E21; Wed, 19 Nov 2025 15:06:38 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 15:06:38 -0600
Message-ID: <20251119210638.2346272-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119205538.80531-1-reatmon@ti.com>
References: <20251119205538.80531-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 650e0cff-1181-41eb-43da-08de27af8b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HZjXHpyVcDX8RvU0Mxu1h7mYW7alKPYp4foR8epn7UoxU+l9+yvNTbwNTXvG?=
 =?us-ascii?Q?byLHXwY/Uff+F4TwvoHkiDWWO31cUvDUnn2XGDJ8NmMMr5isQGlN9niVpamT?=
 =?us-ascii?Q?ZQ1pqRMCwmwM/2KrOoyiSL1IuRaGXcWIXmozNM42wz/Qz/fna46sFEJRve+D?=
 =?us-ascii?Q?knfWuhe7k8/411V6U+C/XLoIKrgE6Y9fVHRYmxQUQYdojv13p7IQ3m9IaS25?=
 =?us-ascii?Q?1khnNJfqUwD4ObHYeoue8YHvHutx1T74Di+hv4WLVn7L8JhxlHDM8eRj2j1f?=
 =?us-ascii?Q?9THl3XQWUDHWglFkdE3SWqqa99il7FP0NQx9a3rkb+YwePk6BP13w9ly9/SA?=
 =?us-ascii?Q?VR9gst8rVXM6NUzxohKLnj7CaaEQ/a8e4wBjbP7FxxfVGDEdFauufmvlrwfV?=
 =?us-ascii?Q?7sRsbkUJKaIK4eIDuhDYHqFtvJUTqd9gyRTGQGhI1fFudn6JvxrjeTbKkzVI?=
 =?us-ascii?Q?5i7bRiQLb8FakpKsnagV8m3zDgZRS8olnHqlivhOJhD4cQIyALpkRcu811qT?=
 =?us-ascii?Q?wsoofYeIKwxDaV/CpH4EFIFhh5fcXgQZzShXI8v/J0ak0cN/L0JYLZPXB79w?=
 =?us-ascii?Q?fEZnnuPg8v7ooreXtVy9bUpwx7bGjme258DjD/XTOh9jS4/l5UyJPSYjzH+S?=
 =?us-ascii?Q?c8O7VlY3nRmR/Lm5mx4rc6N5R+v5lowW5xHqScmRKXCs7BYMnukhwGd8aOOX?=
 =?us-ascii?Q?IYDaQ5kQfTSa5Y1wNtOpf/MuULYzvUouLif4+wubrJO4I3tfs5Pg5DoY2GRz?=
 =?us-ascii?Q?SlhHNG8wZPo+CU5caxC/KSfIR8QucVkxPT5US3n4bzjjLQ3JTX7/Fp96k3za?=
 =?us-ascii?Q?6AJtz6GnSK+gSPNzCkC25yTyPpQJ8veMyMys9zMUyRgSrjjxqvgKS4bTfPxA?=
 =?us-ascii?Q?YmsX1/xWZuv+ns1S0A+gjPLsCqT46/OHcN4KbDcB1Du6MHCiasDFq2vczA3q?=
 =?us-ascii?Q?F3EctYm3TlU8fHrR4Ke3QKZwCZapCV/LdgKacO8HTrHKspBYZ+IXa0OO5r58?=
 =?us-ascii?Q?ssjZqVx9l+hvpStFS7FuTZnSWSfUSlWQz/opfOB/ESvpH8JVTJezG6jyN6VQ?=
 =?us-ascii?Q?f+O1iOsIuHHJ+U0lgq58aOVCpp67qhgXuOzR/ZBIBfz0rb/CWV21PVDcI4qN?=
 =?us-ascii?Q?5/uCNplcXK+ND8v+YP/oxAYNqWsyET4b+EU8JsaqIfec4VTdvYKnsYvP/VKk?=
 =?us-ascii?Q?9TzM1rxZO+SOhRj+LdgS3cddDNobSmIQqXiLrVpLaJ0c/B3es3AnxDjoUVeU?=
 =?us-ascii?Q?wz2+WScRDL5p6uVyHk5tFidx5V2Ds+me0t8s6lXFysno8K5G4LUDwQu1LEh+?=
 =?us-ascii?Q?9brTRq69RZwGYk6ZOeQL8YHpkFTVvTtb9+kmVuBcn+4uFwsT5dy5687GprwN?=
 =?us-ascii?Q?Imr+1jswNgTi/+4ptNcmQ/nR08MzX2irZRInZOUN/XxRblzhOf6aCraHngFk?=
 =?us-ascii?Q?fWQi02fA9yB+nRjGL9Ih0hHW1mmg2uN1+Pppkro46rGcIDA+EzvEYPsbnUKh?=
 =?us-ascii?Q?g3ZIIpX39e0Dcogx3j1DyMKG0B+deCT41ZVnLfx/Kj6h5/OXfTGB2iOdUA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:06:44.3131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 650e0cff-1181-41eb-43da-08de27af8b55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:07:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19296

meta-ti / na / 20251119205538.80531-1-reatmon

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
- Patch Series: [meta-ti][scarthgap][PATCH] check_yocto_rules: Add new PV-1=
 entries
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 19 Nov 2025 14:55:38 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4904f869e2db4f09cd65f2a4e3f4bbc96=
85dd2c0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511190400
- Commit SHA: a4ff24e46b4c6a608ae47f74ec84e0ce860ab595

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




