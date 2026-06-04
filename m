Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBD8CD6E75
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 16:41:25 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16157.1780591284558158892
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 09:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CbgOOVkQ;
 spf=pass (domain: list.ti.com, ip: 52.101.52.57, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw119LLwgHUh36ksp2PWKdZZnTPxsFks4T/Y+YFKJT0yKnEk3SA//L1W77te0Pxrh85t+k9RoULlpho3CSc09jJzdeInqZIrxsR8338GoNkMEXngEATLN/BSiVqsoiKC6eW9ByPxhwQrMUN2yjNiL9OJkVINCf9XiQNrqmgX++FRugD8efwBZ28FG3xCBofanfERpO5eFtzGZ6LHBeaYoLa4pLJm+EUYbcJ9xC5QOi5l9BZcMgJbBqe7oA2mhaA+s+NdQlK4AnmQHoOIrvSQ0A8Tct54wOw2kZ/KQ7YdtgyrZhr2wpE8RHOSN2g0UUq89PoQCs1i7psGeK/OyygDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FeehmenlHMoLEWn/i17QX5DvtWkALuHe96FNctc/Qw=;
 b=YVZhwaXT569BGVyFix/VpGY9YOjSS7ysOOArKLrEytuFpNe2wkcqXZDxYAl6LPaG2dw6QGMTDi3eW1v9uR93Bviccr0Ek+gk/wDbxTPHqrRrcIXdrG5ESRtL5E7xrlFqHsWajRDopYlwD69AtRKbujtXa+M3yjst3RFdpvs0uMrJRuMDqebj3dR4PlBUvtOMf4erB8cecrxSUMTK3RlrRc1AoNPQtYPSny1RvS0Z0Y8SpKT0lLD0c4wwOZHTo2vauPJFJf6FmHpVHiq9meoGc77WAz4N3h3X4n9AQUp4C9Myq4303bT4Hcj61nWlgKGUB9NTbCNofR+zECu5L64xLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FeehmenlHMoLEWn/i17QX5DvtWkALuHe96FNctc/Qw=;
 b=CbgOOVkQBL6m6tiJwteJeV1Go1YjMZke27vHCCWAslsLgiensww9mk7UFc12wt3cRS+KoOhU8EQiehlyiVIlFul2YIjW+sB6gaN/4L5O57/ZTkt3Yg4knbhvNHIC37TdXpDjJnnzQMlt20d9OhnFawRm8VVSG+PXOdVpWmrqlTgrxmq8Lew0DvJ3QLoOg4IL4zwsrw+8BMGtNOkDRxo3M6GFlgWjsuIY8gzJ1krm0zKKzNak6DKZg8SYrEt17+fp3MUWNPZPlviMN4VmLK4gRpV4G4d6l/0TVUgV47QVHAvLxtW2CSDHJaAZp4pT5eOZYphZNIwMiXo3O6qKjNY9Ng==
Received: from MW4PR04CA0359.namprd04.prod.outlook.com (2603:10b6:303:8a::34)
 by SA2PR10MB4761.namprd10.prod.outlook.com (2603:10b6:806:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 16:41:21 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::65) by MW4PR04CA0359.outlook.office365.com
 (2603:10b6:303:8a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 16:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 16:41:19 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 11:41:19 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 11:41:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 11:41:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654GfIta1871277;
	Thu, 4 Jun 2026 11:41:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B67DE138B64; Thu,  4 Jun 2026 11:41:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202606040916
Date: Thu, 4 Jun 2026 11:41:18 -0500
Message-ID: <20260604164118.1030415-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260604163204.3358962-1-lcpdbld@list.ti.com>
References: <20260604163204.3358962-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SA2PR10MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c35285-0956-4c62-efd4-08dec2581ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	IDzX6xDoB5zAlh5H4dybNkp85Gb0lvL7P6aMggsfbD/N0AP169uIHmEc+QTBPAzacBtfRF5v1ccpcT1ygPY5cjKFkIqr8hSlzH26zX+KIcqBgqsSqCGJ7tF9EbOxSVHhEQ18X+8afdSPx70WYsxF8Xi6HNML39Yzvv7jfQs84S52N5ggtCejZKKy3D7hIp3x93o6Kfm2rNk8HZIAIl1CKg/bbCAMzE6Lb2Yf/VSJFlKr83w6IHqkGwpsr68iY/vkbRi4Ma63VvDao6wlbzTIIX42g9+vX7uVxYBR/0A0V5E57j2hqukXONGcxBDo+qpllWbgsUJ0mxbnBwAqvvczu4f/rHNaA5WzDuefvF229FrEMeKkoThn84EpChtFElDDu7OkQGVNvzGRWrhamA3aq+EvZ1izRuuBq8/j11lDaAYqq3zdSwhT1sJphvMATezWLqOhQZso6TOLPinY/j/SohFQ182l1vvVBz9UwQxcXbYazG5EFc+lvMK2bgaFhlXXSLgviK76TTOE31lkMNq7zN5SG5GowCG41AIVc3tGvojMOG9udqcKd3iS49ARGx0IQchPbeqZ8AlzXZI1R+zpkz3/pVmgSiiCgs+Thsv/Fv7tuKyMytNI1PdHe9xA8PQVU0EUEKdSml3gk93nKLoAPGhCjphCMbta7/wrjxEWj/h3Gw5W3fEHmqKcwo4PBNAxojZUGoquEqfbkJ5CUKEZ1a53GMqaaXIQyKd+8Dftwog=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CIPpYt1AlbKaL4YGCgHsOg6RqoyUTgdUggegucGl31PVZ3kHbY9ZvTKya0mZvRBJlTobOHCBg1PjA7AAtcqYO4IpT9LY1LEc3BJnO+WGt5eyTxnn3v7LEiDVXpzy8jcyAEGTxRaCvcanMVsRGGkoZKLGtb2h2yjtMBI2iptFwcnX2Rn6P7K4BPYbmw4LGAA/sqQqR5R04cZ913EOvH0Tjo/xJovxm3xyi86EeSAAeHPd4oN6W6npzRyfHJ2vV1QgSNeCAB6NbhNiSCYUO9JtUmGfFh/FiNAojC6m7jyIZjTAHpLaHuiGPxkJoQtuKtuclWqaYfeWyEZlC1v2MDofZmq5zcx+VzlVdVA9xSBAZCkDT2poLyhQQRKqjvvuDFZ2+Qvi/0uoIRY4gBDbnudwQkIQlDngrokl2ITfI27xXGBj2QTICRnDSadIsJBpa0X3
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 16:41:19.5258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c35285-0956-4c62-efd4-08dec2581ad9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4761
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Jun 2026 16:41:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19975

meta-ti / na / 20260604163204.3358962-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202606040916
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 4 Jun 2026 11:32:04 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 001c0686cdbf49219dbeb662ef8c19d89=
ce5c1cf

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202606040916
- Commit SHA: cef9dee6d756d57bf1f4506ca30dc8e0ecea6e81

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




