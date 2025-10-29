Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE439CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 19:30:40 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.14])
 by mx.groups.io with SMTP id smtpd.web10.12746.1761766232334470347
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 12:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=afYZjmDt;
 spf=pass (domain: list.ti.com, ip: 52.101.46.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFfh3qAUiGZiN80EvlEaoDyxno0y1cm0T7TeKYQHfnUy1/M67IW5ELUULP2x/VFoWT2Ty48eeho66UCbKSngG3//9N45HU4a2ve/T9WLkzKoHTmNazBgBoBihsB3yWyZfLsLH+styN94IEjL9p5SzBKfC9EL7wJkFdl3yOWZf726ji8n4sKB0sUF/OHuWHS5/fhlnDcgbpavy9IYVPUcRqZodoGYOEF0CFe3NctuFEFkIRdpT2vUvCJYLd0nXSHTEzHCdd205yPT+2hraIeRnLWNjycA+VF2xZmiwnB7RoLZv0OH6/s3sjZciUY1U6iTF3KbZmiZ08iqMHhbaOgI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX2HnBixjGmX41aEWT08tKKPQIrzw7+5cC+F6FVdSpo=;
 b=ry2Ga2lSzMzWkdRZsHX49APlQHlaVje9RGSWjMMUPUTNo/SiB7iHPZLFZtHcuNtpvw8vxMqITdBjtp8Fy+e7SWhbnrd6/cQSwH1CTikRcaZINqUgl0r88tx24jOUpcSdXp39DT2c/1NuF31JNmPrbwpaQOEmoTCCF3NxwPr3dad8DTyY6jFIs/NAB/fRsOkHMcXzr6TOUZVoNtGH8I6XTLmlJZBiP+kL+7D5TDsA5Iv2DUgfYTWpEVvgndgzh8goqupgRiJUUIfQIieTcD5FQBIocG6nhgS7I1l3wHoyt72d+G6XwmJLEuMeC/oE978HJl70EMW+0n/T0QcU62ICDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX2HnBixjGmX41aEWT08tKKPQIrzw7+5cC+F6FVdSpo=;
 b=afYZjmDtT9UQZf5lmFJ95XRAWbibk+HoOs+pvkjY2h9+DopQctXzAB+JgN7b4afG0s5kg6i5TOlYlm5l1KLCeUiZ/Xl53r4CsvxHYKCQy1OnG6jb8q3xYD2bwtpMB650yrkSuuGsbr5PXjSc4dktoM9vn6KDbFg3nisjCQJ6Le0G0hBXvcCBkI+vDZvlr4+0QTWss66iUPx3KEA78oLk2awiWt2VFh/cqu3p/X7PyxqTt/ip2odo3o3tb8vmij1vSvvyS0uofJSKmg4IS745oLErOI6XAJ5AoPPwxDdvEMFzEfR9+KOhp/HNUaOsP+6WcPADi0DSn/XK2bsyTlWx7A==
Received: from BN9PR03CA0886.namprd03.prod.outlook.com (2603:10b6:408:13c::21)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 19:30:29 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::48) by BN9PR03CA0886.outlook.office365.com
 (2603:10b6:408:13c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Wed,
 29 Oct 2025 19:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 19:30:28 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 14:30:25 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 14:30:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 14:30:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TJUPE3402933;
	Wed, 29 Oct 2025 14:30:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 254B3180193; Wed, 29 Oct 2025 14:30:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
Date: Wed, 29 Oct 2025 14:30:25 -0500
Message-ID: <20251029193025.1776910-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029192506.11103-1-reatmon@ti.com>
References: <20251029192506.11103-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: be6efa0c-b9c4-45a5-cf22-08de17219e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9VOVR7Pl+q9Mzsg+4oy/0bK5TQyWtZidMaaYnzPV3Nbywkl56vNehxLmbT5v?=
 =?us-ascii?Q?7fMLYELIJgO153n0h9r7l2wOu8kPA4V4YaWjk0Roz0chQgsAwndbZPO0Wbii?=
 =?us-ascii?Q?wCf5s038Wo7i6+7WSLErPJOxQ9bRD96kCVFHKpWfSAtwt6dPwir5Ia7uMEnu?=
 =?us-ascii?Q?zK9m5IHtc+tWEkng5yjbGwArGNVZEKzyKnBDwG1Rhe5wbqxS00ZXbYg89bPw?=
 =?us-ascii?Q?xBJ2TgBstHTBCcK7j2VfiA1eDEY1bwiwozjcMemsKdN7sMolJpNQsFg4gq1n?=
 =?us-ascii?Q?itWhgh7IObQMRGqRYenCjwm1JoAbFXKK9DH8stokqvzBhD/q+quKbw/5xgo5?=
 =?us-ascii?Q?hJE/4UKTZQgVuDEMFyuE7E2A8bsfdgPefv5VKK3m+q/0U8WrFfeLOyo1CxIm?=
 =?us-ascii?Q?7PPjDZMHk6TVP7FHBS9DxGFKpIOG0x0h6B+BQh3S1ma8sJdiLgSer6l/M5GS?=
 =?us-ascii?Q?7XanPIaHtIG2unAvNezZIoXlH2X/KSMdX3NndI5cuTUuKvJzE+tkpQqFaWyJ?=
 =?us-ascii?Q?w7/6RU4UhnQbZyMdOQJmV4RA+0P+SCyPY2PtuVvP4gx/89IgCyYzc8c6D6/v?=
 =?us-ascii?Q?dz1GrIwm/YV8fi5FK+LwHuehd/OT9ajx7lFeh8AsMdyvqS1QQX1lYtGkDGL2?=
 =?us-ascii?Q?PxIjPf076zI960zHfikrp7mNbauny76KaEOaUpTXkS/UIGuPvcQf/THhCNg/?=
 =?us-ascii?Q?05MGJOPNt0oDqZzcXOuVZJxwfoZuzQlX/mvw4Gx1qR3VCIfRgD+C9rHXFF2J?=
 =?us-ascii?Q?/CuFzlIhQMmJDliqDzsSISy3LmaNALZo9XcueBfWY8T1aPcDq2pgqf0rFULK?=
 =?us-ascii?Q?R6xOuCGUx5boMDF36VDYNPuf5FTEPpHPa3AmOuNQWGR4QRaquEGEkWdBsBKQ?=
 =?us-ascii?Q?tiPjRfAYIStNFvZWwrolUnjozxVreaBxc1sRzXBNh6q2u/gqAaYu8KaoB1/+?=
 =?us-ascii?Q?3Q6kXDFIO+VBhGnaeHu2wYdynkDdlg6j6LJYYI1206H8SYdnt7lrCEHzVoGz?=
 =?us-ascii?Q?dInY+E7M+4+1bdd/TUNNMRLSFDsqx1JBQbsROGYiAiF79lwXwzd2X+JA/2yf?=
 =?us-ascii?Q?xWTNeOze7wPBcZBMMrxH2EdWNII4yBTo8HUCNUiOLBLGVflSvwAmbntPQ6z7?=
 =?us-ascii?Q?qjZZYMJBIdEY/aA2gkBdsvJMecSumyupaN0QFx8zLcGFE3wa9LVRwe1tUQIU?=
 =?us-ascii?Q?dSBhI8tOWUsoN9Fwx1XM46anhKRFf5hRLV2LFAuQMbkjPmptxpj7a6zdDJwv?=
 =?us-ascii?Q?+zPRFbERR9a8LHJHVxmN4mkkhNJ7WL6OxW5ByQLCHC6Gn+kSeDlPF3jVlMCP?=
 =?us-ascii?Q?nwauHiP9RonQdQe82E0dWyiG7U0/bRXNhll6RIIyl9o8gxkyyAgtVW6ycdC8?=
 =?us-ascii?Q?23DSGH0ZXXiVa6Yrr4grcx6Uoe65G9D22JAGZmqHCtQukF8D40xfOodgjRsk?=
 =?us-ascii?Q?lljmii5IhonYHNhhHSjhIMSc5+QTCT4ZNTajlM0882fxbV+NwBtYCieAVLef?=
 =?us-ascii?Q?y81Nf6ZN2gYEmOzDX3MLOijktJ4yAkqhypFzeFOTwb1Y2AYEIChHhSjy6yJi?=
 =?us-ascii?Q?GoNrFy1crglNxK2vsjs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:30:28.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be6efa0c-b9c4-45a5-cf22-08de17219e34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 19:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19206

meta-ti / na / 20251029192506.11103-1-reatmon

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
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-core-initramfs: Set I=
MAGE_OVERHEAD_FACTOR
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Oct 2025 14:25:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b440b0abbde07420bffe7eafb6cf35edf=
0ee1b3e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510281158
- Commit SHA: 6c0e4d3ca68d23245c9003748cb76b2359d0a6f1

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-core-initramfs: Set I=
MAGE_OVERHEAD_FACTOR
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Oct 2025 14:25:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b440b0abbde07420bffe7eafb6cf35edf=
0ee1b3e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202510231214
- Commit SHA: cd2b3b89819ea58115e6be9213795fab0848298e

Patches
----------------------------------------
FAIL - [meta-ti][master/scarthgap][PATCH] ti-core-initramfs: Set IMAGE_OVER=
HEAD_FACTOR
    Applying: ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
    Patch failed at 0001 ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
    error: meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb: does not =
exist in index




