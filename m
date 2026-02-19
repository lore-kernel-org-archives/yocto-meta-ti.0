Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9DAE9A02C
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 02:43:51 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6074.1771469030796273238
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 18:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=e7RKS8NU;
 spf=pass (domain: list.ti.com, ip: 40.107.208.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc+Z3FiyWEP7EREMaoG/gHSuxVqUAlvfRBwSwHENI5ImbY5wNGBtG208LfsBDEbNdJ30lmeJpQNz4zOoueSAnv4DDLfXvxda8FBM+iECVHGJpC/wLgOEG3P2iu2oBp2UhWl5YupFkn3nM+ZpSY+v3d0O4pDPwSc3tvrLcah49I6OhtdcgZ4r+LaOe7FeFe6hIa4Gy8ljJK1R2KSQTDdqZWtJubPBGWBiIPsBpL0Q6Cg/DjhzqlJsrMtYjAM4g5xddggdAiSx+43RL2mpnW5gJ86reedw3KooYq1jO8LmM/oWcxNZpR7rpnxr8nXlNhgQbxD82Q+3N8/IZzfCUC76nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi43tuKMPfvjtNEnA+0CyRLlXJp9SmyEvHGiA7Te01Q=;
 b=JU8TZNnorDsUMQSIGxDeWLuVf+gPnSFa9wUEnYDDL+WaaBCHmKrIrJVA7UwfP9uOT55aJ44w2eU3xpD9CU6wY2kivTm6yFT8iNPAxPbtfKCWx52Meaiunyw6AtgMfHQMU1rOr0ECyZWpdgTA6WXZnDBPFutEQmpPTvijTZNP+79w0L4oJ86W435TllC5N+wqVkTpB1EEbbhKXx83Sd9aCvho158oB5gChGo+zlMa5XBlsTNIlbBpdSL28fmxGwWO2gsoB9fjJ16pbYzcdeVOrSbxcQxdqgB/J1tcWzVYPhuvpxziekw9fN4PnW3VNMrHadRg+Hc/+1DxnCYdiSonzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi43tuKMPfvjtNEnA+0CyRLlXJp9SmyEvHGiA7Te01Q=;
 b=e7RKS8NURqxWLCgAB6Siu0KzlMaxMfRPr6Mg0y9YH08ImHEEGTX1BtA2t7DXPaVhuusnwP+pPq17RxOmwyyi3xS2MbSB+gegkZbcKp2qgcplgndxF95il1pGsK8M+5esIqFPDOX4dTwohoL2VWpiWxCQQ2Dz4pG2tW78WBRYzUQ9NepcL09R//rrHFHE2Cl+37jNfCqlvrYuoIo8J0mCskXMUKhcwNxCZDBh3L7LYqCecUd3wVM4HzhAl54NlhQLuoLQ+RDjM93OfSFgiZZVCozQi+lQE9lJu15ONeqof588/k7M+hz2YpjGlmSbOmzQ0blws26ImfRDvEu7YtnF/A==
Received: from SA1PR02CA0006.namprd02.prod.outlook.com (2603:10b6:806:2cf::15)
 by MW4PR10MB6584.namprd10.prod.outlook.com (2603:10b6:303:226::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 02:43:47 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::89) by SA1PR02CA0006.outlook.office365.com
 (2603:10b6:806:2cf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 02:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 02:43:47 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 20:43:46 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 20:43:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 20:43:46 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61J2hk9a1864689;
	Wed, 18 Feb 2026 20:43:46 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 65F009ACF4; Wed, 18 Feb 2026 20:43:46 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602181811
Date: Wed, 18 Feb 2026 20:43:46 -0600
Message-ID: <20260219024346.2266974-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260219023227.2282583-1-lcpdbld@list.ti.com>
References: <20260219023227.2282583-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|MW4PR10MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: d97f5b62-01eb-445a-8bad-08de6f60b4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mRFQdB1FZx0kAgnCnvLr6RUPEjh4Q3htTZVi8TdSOmjaqYtju3bYqZpf5KlM?=
 =?us-ascii?Q?OxYCCRZHAbGN+XAUBOA1ULMBdN+6ia/Z+7OEX8GOIc0/fxNmF4Q0OuQWXSso?=
 =?us-ascii?Q?WnrgN8ZOMbyCaXSxPIYt3uMJIQMK91lADbsUjZs52vi1e/C+y1CsRC9PvaF9?=
 =?us-ascii?Q?nsdXQYZSHZav0S9bG/Z9sNdgc6IgT9rTu9LhUas2AMgQxe1NPDuMn0kwidf7?=
 =?us-ascii?Q?Ae83Fdo8p16slCouYbAeirpK9ibJi4/73BVjiVce8RQneYW2UCqRSLYT6I4H?=
 =?us-ascii?Q?EYns8linOBT0tr9Ns5C/aiqWZL9bhPrvYDsU/1O+bUe9EM93yeA84eS+8+TI?=
 =?us-ascii?Q?4bjGlw1DrXOLtZeSv4Sx4vpbvdtha6EWk7h6u7t/S6ulMPaurmgUplXI2Emj?=
 =?us-ascii?Q?gIzC/kKkQP+vAwZ1JUnn3kjSy74rZ0pk3auUqkvLm5Zmdg1vTA7ITa9a03AZ?=
 =?us-ascii?Q?vyECvAtUqVCLnLnr9dpvr3eooLZSK8g14XRFh9Vj2JtcPyuEVukK74GnUu2D?=
 =?us-ascii?Q?is2/SVzWrG4YHaZx8OHXA1vX0bbGByQdV68UbRaBy2a8qRxDoPbGDBbw62vH?=
 =?us-ascii?Q?bRPNBLk5BwtiM/q6ObJztdqbMC8ck83L2hO13odZq1XmhyZu0S9RKsrs/t9w?=
 =?us-ascii?Q?BQfcWL+BZdYfwUsAApspSJsPlKCu2iVjgpINnFj3ZyKq+CwKO4psp/EHB2/u?=
 =?us-ascii?Q?FsO/ACjR9hSL/9V52YJI5gn1/nd8i8Us+D7XK83z/xO2/maxQMGHmpfrYIoD?=
 =?us-ascii?Q?Fse0Au/cJTNwdQa/RunkRzs6eLDuuXhLRwz+J+AZqHnZhKJ5XlRyC3CDuvra?=
 =?us-ascii?Q?eGQqX5wvKQlqGXyjLOjgY6VxfD5PGK33ef2kVgUkLmfCXDbXeSoLKSld65Jl?=
 =?us-ascii?Q?ht2ZAWJLcmYOJFeSbeJ+IKX1iFVh6q9XXQ6mDpB0c1VHUnxtoLT3jF9zyPSG?=
 =?us-ascii?Q?3AE0VbhqUnBLJXly3Pf3TNL++FnWj9mwL4Pgax61nNeNGSXYMuYhC+a1fHJi?=
 =?us-ascii?Q?puMayUXhE/DYEkv+NCxtCsZxrOlce36ONHfrPOZBVHXa1WOJl45XfK5tQy+b?=
 =?us-ascii?Q?suXwz9L4KdJdtLOi/iBF8UwIlh+57jVMLWc10gqAi6+aidtBgdfgEQmv+ybt?=
 =?us-ascii?Q?JVg/Ic//OSW9j/WHlNXHvLoAJLqgCuPpj25Bjfib0INGOeTUqGJWaoZtei84?=
 =?us-ascii?Q?Ac4VXy8BS0bO/PIM7c/J7L9cnkB7OusrMiqy6kiWvvu1K7HIb/9Rik1JnAc/?=
 =?us-ascii?Q?DdocS//a3CW/deHOnsWFWMGCDeUlpJxNPV6z5c1Tp23yAfg7Au+/Nb4KfISo?=
 =?us-ascii?Q?KMrsKWizHO8n77yWtqJZygLUtUkDEc4qtKwU2A5Qd2Gt0+SNZ1Eno/0lvuQb?=
 =?us-ascii?Q?5gDZZbVxebjk6jQ5Cznp3ed/+Xp2KHFo9vpyOKrqi0nougpuKDrm5K6pSb7c?=
 =?us-ascii?Q?ylp4sbIwMqV9BPu1Q4UrHbHQ910w/9uBAU7no2x6KSr56lcThIoZnqFKE/a0?=
 =?us-ascii?Q?6i7JOqUBPYf871fRG6hud+kZ92OWAM9WbS0TvYn/IWBklwyncxbMIzYwXHn+?=
 =?us-ascii?Q?1vU/a2vFJq4xqG61Ni9j/DGHu2MIM4dbWv3VJbtiYSV6RpSzdNm/6c49nUC7?=
 =?us-ascii?Q?AINKbYHGTytb7jmTO00qYs3fGkrSQUpBEImQkf12IoX6?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4ZHcKn6UK/hhYcI6gY/r/OeGoF9wY+FX5K9369mB8NelLMoPByydfQGylB0vGsPl7e1monZz+OH8VGKzpeCyPzZomMc06mmlJyzHEhmsfU/v3SUaI66cOzCkXFn9GYWGsghHoNsJie5WqOyGtP2Wr6p64Gb39nExAZe7SWMVx+v19pacsy8bB/6O8QOPX0zUrccmiCm1W5+S+16q7kx/y8VmHgenHy92nE6bSvjeE1ZFS2HwqoAJ+65oaIYpe7lgNMIq8YhtsZEEX+F6K6uHMhZ5wpOp0ZkBRxsefY/oVdrj3qebvxtuz4eiS62khOatFCXVlaef3BiO/snesXUM4e5T2PbfQpbMwJbdQLJ9TI+H9cfL3VN7MaWEZn+ZWGMUSUfET5p3X7AQ8sExihJyoHzqukIYfTBl1fYFpiJuFh6tVA/KHt6Yxr9M8v5Li7WO
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 02:43:47.5304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d97f5b62-01eb-445a-8bad-08de6f60b4ea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6584
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 02:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19549

meta-ti / na / 20260219023227.2282583-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-lts=
prep.202602181811
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 18 Feb 2026 20:32:27 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cc24a0ded02c51616048f65590014fdbc=
f0ef9b2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-img-rogue-*: Migrate GPU driver version 25.2 -> 25.3
- Commit SHA: ddab5ba2b87051e71527407a3b7fcdb05bb72209

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




