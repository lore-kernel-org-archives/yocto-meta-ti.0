Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B5AC531ED
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 23:50:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27700.1771545038847136454
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 15:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vPrjVg7m;
 spf=pass (domain: list.ti.com, ip: 52.101.52.18, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8S3CagA1VzW/NaZR9oENnJ1KuZjCOfjcpVJArhVEMpnuzNjQJetbqCEL0LsH8jIblnYB5fuXTJcjtxdD9cPdBggNys/B3jmFSSSzVUTT/M8Q3mnm4A2aSKOllJvzqAtI7hCa2qyFfolYJLMMw2wEDejCeeXwfRz9I5i4hSB34/RLGvDpCRfWK7KxXSNOdOLcSn1gbaRgKKicOxPrZrh/M8itMLH12ZQU2TsxM/TAj38b88clpmtCHTY7ByzK5mUyMo98AMhjOAAvWBHxOEJ0kWwNBS5yxFMn1BLW5Tx3qx0ReLROkITmeWiDz7OUq9WCpmqmQaRFH7EAWNFAnlRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPTSBozCk+fBnVQRytao9Sg8uacAZXhkPdT4naiPgCs=;
 b=Ex6yt+EY1GdwQSXJTE3eOeFTOTN/JVlqrNQYyiyTrEBzIKUZHAmF33Yrzo7tmQE0waI2W+fJaCxHvGdCNbPLVExLLCTu9MUZIziOlKbwZrcpVFFm0Uu6UMVqfr2/5VmcKowSAd8ATzSj9X72AOQAR7mT6CgXNi0PU7F5y3XJYNnmU5t/9aWJCtqsjt9fjeM5/4fyLpsbLEMLm0FSzs8NtlCoD1NAFKtcKjjLQ8VNFH9m/1IUQwzmXj4CqFAcu606gbBBI3U0SvieIlBtvyN0uW0GUeOJVNqg47R4JufPtQYoph9QQNXw7y/1plti+ITjhu04jYVNVkAI4yszajEmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPTSBozCk+fBnVQRytao9Sg8uacAZXhkPdT4naiPgCs=;
 b=vPrjVg7m07xiUPGoLsJf+gTiojS+9c59cK8gsDN7vMgnEywdQhqQ9TnXDFfQYXcOYqJaWYaze4QwZveiHe+zhmgQ0SuM7ulpqIinT6mUtjv5hUrs95pvz9cG/jcDHud20Ei96nyN0Lw53TiZaAKE1T2BLiCUfV5LhQt+S3xkJhKyzU98tFydSZegcVZVnfwwdUnfgZYJ87+cb4jrOAn0d1QmsduwuG9RBJm8mXFJI8aNP4dJLk/r+LIrJCElm/tZIVIx+S8mDqX9IfIXE9Skt5JcH5rw0OCyuijc9PrhC85/yadob1tcleEKgoe2a86QaenEflV64FF02UJ8I8VoXg==
Received: from BYAPR03CA0007.namprd03.prod.outlook.com (2603:10b6:a02:a8::20)
 by DM4PR10MB7526.namprd10.prod.outlook.com (2603:10b6:8:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 23:50:35 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a02:a8:cafe::43) by BYAPR03CA0007.outlook.office365.com
 (2603:10b6:a02:a8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 23:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 23:50:34 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 17:50:33 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 17:50:33 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 17:50:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JNoXIX3358343;
	Thu, 19 Feb 2026 17:50:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9FD339ACF4; Thu, 19 Feb 2026 17:50:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602191451
Date: Thu, 19 Feb 2026 17:50:33 -0600
Message-ID: <20260219235033.18669-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260219234859.2476751-1-lcpdbld@list.ti.com>
References: <20260219234859.2476751-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|DM4PR10MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ecc48b-9160-41ad-e125-08de7011ac9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eCQq5Rgmh8EX6qZWjxCA5WFXxTKw6wi0scw98rXZBUomjWFE/SIOfHj7IUMI?=
 =?us-ascii?Q?JidUo/zxs1X1kJG3eyo/A2EYE8N/szaRCjXIDW3Hu7c3ML4LhhD2vy6vL2W9?=
 =?us-ascii?Q?1G3XqWi7LqYmSajsp0OyaxEgq4KISJHAcdFFWnpfxwZDudMI7WFjMZ0GJUNI?=
 =?us-ascii?Q?LArScJcJAmgoqKBG6Zof9krmhWpUlgFDtxtjVqcoF+aRK2I98NwMlGamfrFt?=
 =?us-ascii?Q?pWFzWfNVswqUSksrIrjjihl3L3kJNtUYpBvgNf+TyMnmou2LgEXXBOD/W4tr?=
 =?us-ascii?Q?WduZ/OV2PDJYSxiPuhBcqY7MDiDgYKw1dOO59D+dIXjbsEotZJvwu7Hsw9dD?=
 =?us-ascii?Q?030MxOLiD/otDFcPyAz7U4Bgk/BOar1n2kg41Oa9a87+L4MPlmfe5DgZWZoQ?=
 =?us-ascii?Q?izUkq//bPRYfCiCixm6AFKJ6t7PCtndRhS5+4CXmPUxkbCujMUyRyfATl0vY?=
 =?us-ascii?Q?7tn5uyJ+VpEWOP1i0yMEnSNRp7H6rIUCZFR0XR2oabLLTP13/IE3ve8+ngfe?=
 =?us-ascii?Q?ABiBPE5Q7mOvDS1Lk++T05vFt87/4aU4CkqF8reIt1Apg8EjbeVEmcFMDhks?=
 =?us-ascii?Q?kOwwQShIYBJzu4pGCr64ArbtGVMS+CDeWCK1lQsgXLAo2TWpBMm+G81GJiuR?=
 =?us-ascii?Q?JAHv/CyjZE5BbPpJw2+Zk2cTrMii07x5I5qECDy++5AJxhdkwUb9ut4Iehqx?=
 =?us-ascii?Q?SbLxmEpn/kUHZDeXfEDYbuDQV23D9BsLELw+DJN2yzuBjbS6x8QnzAjlWhQy?=
 =?us-ascii?Q?GVX+XQ7PuXKeau8naK4+5437mFPmmjocQJ70Q1Erfc4+s4kWiqbe9Jv+Sskr?=
 =?us-ascii?Q?G3j4p/YuQQ5dQS4983bcMDAdcihDQGSFubSvSCiP4HK9be4F/YKbZYfgGIXe?=
 =?us-ascii?Q?A9/ng1oTuWacwzcJb/seSMbww3lvxPsrUu2X/5zLYUbW0vf7b/CBL6xKB9wt?=
 =?us-ascii?Q?X/oX9+xBaMo4Nayt0gRS7d64lAsJjZrwqfPus6c2Q84S8w6xYE6OY639Dbf8?=
 =?us-ascii?Q?sHnal482GdJ02aM1yPTWfH95LsvYEuKON52rMLubmKJ3vflRPQNaPx0h2IGG?=
 =?us-ascii?Q?Qzc3K+HxBe5b+721TlGiY2DTViqEP1JR9TOix77IwZZITzAGkPgGV6G8Lv14?=
 =?us-ascii?Q?NbIph4pHtyiFZ3Ig59oICOGpKd/B3ZqUCJKpgDvMAkLIjV8YJ/4JrvqSAdcq?=
 =?us-ascii?Q?yeuWFog8iMvXvr4v93BAVy7qS6htBgAmImhxgZFbnyDjG8dfvst+GJo+cMYq?=
 =?us-ascii?Q?9l9C3iCNUy/oTFzPnUjznxLBfDpOY9sbZUw+X47eRMPkTPiC//uabXhEJt3l?=
 =?us-ascii?Q?L3q95u3DawaFy9IvtM9wvBWFZ1kx36e8krJ7w/pRVBfnxc9kxou2iev2o74A?=
 =?us-ascii?Q?L9xrjrxtN/E9O8di9bPImTo2HDaEe/3duBtce4+0uW1YC9UnankjwvDMzKtt?=
 =?us-ascii?Q?d/b6nVqSoP82qqSeq1E4zcVdrQJYSlVL4f4jXO9LW1DGWJxsoLNy9nq/j/bB?=
 =?us-ascii?Q?j/ZqO9zkTdUaCknANfFnT9fk7NZXbIW6aKcNNeu0/bdTJJPGGAlRciXtNduw?=
 =?us-ascii?Q?9oy1Y/KlkCTNGX+lGZ1aEZpJdv7jVRPcjR6fkthp7iRNwJCxwf+3jfF5tDbj?=
 =?us-ascii?Q?He0EWjekn8G5gHY0F5vc7FNBb1x6UUOa6IHGdKJxYLwM0g+phzjIKo923+vP?=
 =?us-ascii?Q?hwqS2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	R3fzEXSRjJidEqvuVaOP9M6IwY6+lUUHgJUG32uFwLoHkebluvwk1L8mnH77UzwPZhg4KDmNtzMMSZjSetryK/Kz1AOhmz8TfW350PK+UEy7XADr3BOpwvZK9T7t+J6lXLAiYEpzGkKrzBQVxZGnE7zeFF3TiGULYwNhOxNmrwQXcQdHehJC5VIy2KF2Ec6LrFb8NblIA+MXuCZLgYkN3CU/1FZtlotNGqGiWyXmrlHpTPtsfy1BsiD+rjx4Zv9ZiqGVJfUTcEFuwlAWCGcPFi7prA4RAmaYmVpv1q4a+BmiKZ30LyTqqEYxyHVp2tOmgGlc+YX2noeM7UuDjZ2gxNBP0sjgJD973p/NAOOxzRo8OWFVnmgOY73vbAcCDjsFo9Gjhyf5E1oniAMagPXzB1rraEmSFXaXYUn2zsmVO9qb4UQbU65jPvtHZ1u1He9v
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:50:34.4618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ecc48b-9160-41ad-e125-08de7011ac9d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7526
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 23:50:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19557

meta-ti / na / 20260219234859.2476751-1-lcpdbld

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
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-lts=
prep.202602191451
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 19 Feb 2026 17:48:59 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f63f4d030885a5e383b66e173870b2b2e=
b95ba8d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602191451
- Commit SHA: fdca2e3472893c7f21188327805b83c6a0b32850

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.2026=
02191451
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.in=
c:21
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does =
not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
026.01.bb:4
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.18.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master-ltsprep.202602191451
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master-ltsprep.20260219145=
1




