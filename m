Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A2BD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 18:56:10 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1945.1764356165730551100
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 10:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=N1dtkVzk;
 spf=pass (domain: list.ti.com, ip: 40.93.201.55, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRyxLQ89NpfxGt1q59ngVYrKKFgZNe6emopAhn8fzNaagNjrAVvEPXd07fZuqe3IP/fM190tXdUYw96KCOUFbBxUTWkUuFVuCPpruCqJNmjpca6+lbmFSMYXwyXu/ndUzp/yThbBGV7SSOpFEnI+u7qjYzDUGEy5Bo8ak71Gpk7y3rzdOEX7nectzMc4+kCPgnKPNoAcs4//0ee6VsbH6zb0kTyr1nKXhNU+6cpAlioxlOVxzobisklWngbUmeCRBSPTnIbhc6+qHWqNAz5WYQME6jQj/UgwVIMmRjim7r3Apwo6/0Uc3q3RaeE5IN0uU4zeRyjN3a0wcAcg0qZ5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnBtnQYxtwScy1CDue17rBbIA2vJvqod9A3c/WoY2J4=;
 b=HXXDGEFH/GXzrNl+bxc/u/iMAhjKDRRKsq513smHgT/qXjOJuNZsQidFC7PAuAIu43yZFWotwYOj8zaP5fj1HiPTH1r2IV8A8JQh6lkvjd70uWqBN8gl0mPIFVVln0iGBPGj3+iH0VHOhQ0mNiOk3Qgzd1MKEQSG7WHYuapsh7+paoPlg6bHNqImKi0pytiYjPwYypu2QlXvHTd86A4JMp7ZsEqNmuOii7RPmKRFF1Y6CGer5MaVlj4Sp9TPvtxANmpYPwlbpH2jzlMThQAeeIWYqBZPN6AXyEgoBsnGBO95Xhxjk5QpB9gKXkfoiv4p2feP5LcmigQ7KL3wedDhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnBtnQYxtwScy1CDue17rBbIA2vJvqod9A3c/WoY2J4=;
 b=N1dtkVzkxM4eVirn29BkQjiQLQNle/TOrFuDwOC1F3SkOi51g0fDVhCVBhILqTbLviDP8q+vXWJ89ui63OIKi5QK71ZCpUIs/F/mj7IFVAtgiwyoThuiS/Z17f8OMydCeLZw8B/d+ww19n33K/ySdJ4MGESiU12cvvBv72DJfFVAPOwCEVwrG8rO9ClCivKWQerJpzgO34UifarRaG4NMSPI8cvAh+l8eJV2rUwBbCWfy2QmSw1eycVXPIdAADiVRaUA7nYLH9YZPJiAhUeKmCdfpVz0Tm7wZ2CD9ZMUN9gHJddNrqKcjQbQcyfISW9NNmg2KKrIRtaiH9LAXrQ2vw==
Received: from SA1P222CA0173.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::16)
 by SN4PR10MB5591.namprd10.prod.outlook.com (2603:10b6:806:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 18:56:02 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::dd) by SA1P222CA0173.outlook.office365.com
 (2603:10b6:806:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 18:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 28 Nov 2025 18:56:02 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 12:50:58 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 12:50:58 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 28 Nov 2025 12:50:58 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ASIowOg2647638;
	Fri, 28 Nov 2025 12:50:58 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 500709ACF4; Fri, 28 Nov 2025 12:50:58 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Aniket
 Limaye" <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, "Hari Prasath
 Gujulan Elango" <gehariprasath@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] trusted-firmware-a/optee-os: Add LPM support on few platforms
Date: Fri, 28 Nov 2025 12:50:58 -0600
Message-ID: <20251128185058.4131726-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251128184125.3220124-1-m-chawdhry@ti.com>
References: <20251128184125.3220124-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SN4PR10MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: e041f762-2526-4145-310f-08de2eafc706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H8tPGyK5SCCRdfzMd4q5Qb+Y5ZCtEuOMj9QdIpWc8uDGmcvTlw+SBvYb/Kud?=
 =?us-ascii?Q?swkcWpe1ECBSHz3Ns6zdCkYOqsiZQyymfMS6g22cnXKH1v/AM7pA1DK+axBS?=
 =?us-ascii?Q?6Jdtr4RU2vR5hW+8DmzMvoQKURCU/aI33Foie0OY0CT2Gox4I1WJTJ/t2KUP?=
 =?us-ascii?Q?YVy6BHeg06r6S7VTr6BQp+uurwQddjAMA/QFcmRsm90fhBbLIrzhaWDT7CS/?=
 =?us-ascii?Q?jseaxR5ow/3hSQ4WMwKmo0mKqmNyiYJhKLJgyAi3TR9FOjy085KTzKU5lKZQ?=
 =?us-ascii?Q?G5ativrvPwnUz+VkPgHG2InTx8M7mOdEZRxSXtCCt46qeXgG8jbb4LLTI25y?=
 =?us-ascii?Q?cd3fCuCmAKHNzYERE+KigTzwTFfWllYWXVP2DRdO1c0idGdmlAzDYEbxNrk+?=
 =?us-ascii?Q?OtAOljxe1tFagRZdfS7RCviPF/4AxVnZmNkx2LD9KY0s3fHGRnssAFS7mWWx?=
 =?us-ascii?Q?WHU/O/MF1UlobxsLA4dbb1KFsRjnkNVpN+uYnXxR5iIJ24em1LM5Z1HqOMzE?=
 =?us-ascii?Q?TWMvQsy0KDRHcsJ3DW6+nNXmAzbfDjns26UfpUi7Z2xdvqxkiZ+mTn6f3T5e?=
 =?us-ascii?Q?HNmWydjyp4De+hbiazzq5BXCGYybeEWQKyKY6nSM7fnWbSCuuluP1WtKzK7y?=
 =?us-ascii?Q?sS2KcGVIOVlWBz4r0iFFtFcGkHpxDP5KlXYfHP/iFYvNxNVACuptwG8qqDHs?=
 =?us-ascii?Q?EPXbGU0euAlZDPgCKgHuVSbGU7AxZ9RN+5ulTZkoC2FdNfbA6PEEWb7Lx6qE?=
 =?us-ascii?Q?4eahispOZIwCUWfu1kJEyy2gb4E8XqMpaGY2lmxctEpi1wqpyLrQRf62wGEz?=
 =?us-ascii?Q?KX53iysoPcZV4H1/3ZXvBZvfa1sZh/wis9HV2SdEt1ORmTjQsLCZLzXbM/KA?=
 =?us-ascii?Q?wpH1qv2w2dOlm3fzTDNP1xzbIG9hgH+sUlrVWNqPk3aTsoUVD4Q83S29aUVN?=
 =?us-ascii?Q?bMQJA624QUnrh6HKKEkdyoH8VgV5bhIYZBg65MLytKSaU/IyJBtFs/404KoT?=
 =?us-ascii?Q?xt3hHsqQXQMysM7edIAjSf3xccRlLuvMSrpEH7YqxlYv7HFa45yfeUsXwinZ?=
 =?us-ascii?Q?9THc4QMEU6E6lR0r/3UXqEhz+87rBFzcj/jzdqNRt4X5zwHz12oJ8VZ5HIqY?=
 =?us-ascii?Q?o1MmEq14aPiUsJeBscCOo+6lsFDxgUOtayy4X6388RO4+9KHO7/lMCjZGa5E?=
 =?us-ascii?Q?44oZBgdH/Q8eb1iLKaH+8HRWNi84K1OI3bWpFgDH5pEVB47C3DHqVYU8U3xA?=
 =?us-ascii?Q?gDYmOrcxrSAo87bntXepMUjkeTbcHtcgy/esCerbxrkOED+lHZOdWG9tTHH7?=
 =?us-ascii?Q?UNQkpdialmTsxCUDb66ZIx7xfdO/Agz/F0W6O/DT1miTFZEtvKtDcLNAyRyU?=
 =?us-ascii?Q?m8eZhlQYjJUV/16+hMzgCDSHE2lfC282U7TYzmXWFGHV7J0FAnS5YCFE5pPm?=
 =?us-ascii?Q?uS2qeXT+S2pxplD2p38WEE8qJK/2Vx1VvD1lwZa01nEJO2Xu+6pnYwQVY6ZD?=
 =?us-ascii?Q?ScyzWe0k/JAvB8qSgmz+7D/j+FlhmYiKaa3in/KiyzZehKWjqaRjzovCyFEw?=
 =?us-ascii?Q?u+CqVqQmx6NTQTQ3xzE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 18:56:02.6063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e041f762-2526-4145-310f-08de2eafc706
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5591
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Nov 2025 18:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19307

meta-ti / na / 20251128184125.3220124-1-m-chawdhry

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
- Patch Series: [meta-ti][scarthgap][PATCH v2] trusted-firmware-a/optee-os:=
 Add LPM support on few platforms
- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
+From: Abhash Kumar Jha <a-kumar2@ti.com>
+From: Richard Genoud <richard.genoud@bootlin.com>
+From: Abhash Kumar Jha <a-kumar2@ti.com>
+From: Prasanth Babu Mantena <p-mantena@ti.com>
- Date: Date: Sat, 29 Nov 2025 00:11:25 +0530
+Date: Mon, 20 Oct 2025 11:26:17 +0530
+Date: Tue, 11 Feb 2025 18:20:17 +0100
+Date: Tue, 28 Oct 2025 23:24:22 +0530
+Date: Mon, 3 Nov 2025 12:42:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 05b2c0da811d5bfe41469fe96455cdc64=
b5d9f11

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: layer: add github MIRRORS definitions
- Commit SHA: ea43ed2a3963a6073097711476caa0530745a8e6

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




