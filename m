Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091DBFD45F7
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 21:29:56 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56066.1772054993836587464
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 13:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iJ1UwZJz;
 spf=pass (domain: list.ti.com, ip: 52.101.201.2, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlVCOiJp9iwLT2Cs8SkKY2Jqoqu9LRgRssd6r/5Be8Em/1XAKMveaQTYi8Q7bY5wt4IcYVzKjUy0XDTbn7Gbf4Fvr+q+RxZUExFHVbiOqh79jZntzUILONx/Vllond7aSoplHvaYcExaiHsby+jIBN+reQY3BUCebjolOugl5nKPFdpARwID0IPwSRelCfvP007LNTOVl/sVzt5lruquZVy8nW50h8MAa4ByW1zRCsH4Ks7zT0mCowRDwhADaWPaKD5OxL2ZzjCRLl1Xj0fQYETpTcv8c02pkBvAxf34nA8Gw2Zqgb1hN3QMB2oxPgarbzjcyqlU7S2W0yhrb61zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AXq2tIE5h0l2XjJy9Gww3kedk+6a3H1rJ8Y0naRz/U=;
 b=H1bCu9DsZDPx+heTWNqL+h6hMLW9a1UzXtq5TD4CXMTrTwIq+emCycxZIg5FfPjOk2ccoHYTrWJ7HPQevsw6yhVVfdDZABJE6vO0aj2UrJXAxn1tzLw6H1UGUe3+36FxzEAiEIp9UHTVOSgEzFNxBvtghSxFAn2W3o5kulcop+p34ChEZloCtOX/HGUsMqGqP9EN2LIFsRDB/pLaGgRuALk0XbvQBPNvhu0beoG6YKyNQf2QuozJqCW4nmnesxp/94wr23FgWzV35u3+B9wevY3gsN8VYDRFX+EjSKXFPplHpB+mg5y21NWXXYz+6ZqVe88+VL4dtFLjH4MjPjWk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AXq2tIE5h0l2XjJy9Gww3kedk+6a3H1rJ8Y0naRz/U=;
 b=iJ1UwZJzfKKU/qqTF0A0OS6zw1pAJlgkrEMh8x9o1PQTNb13w2dG4r57J62wC5mksaD6oMsaqXTC0l5EKRBjfQGj9AoNHDexcTOd/QAOQ/RHBDK3sjr40QWca4avffdD3fBLZvuWphtYIak49dl9kIrbwlmmUn2ELdUIgtIn6r7j5FljF+v4yUlA4t+S7wd/LrVCnsYSTBhAU7AAvzY13Ddl3GYJPVrVh+TD1I1WB1kZxaCAefvrGg9eto2Myzy+QDKX/KmBOe6FX2h03dupA54L//fbZTuZ+ZR7MDtD8EDGcLiMTjuljmTA03Wt/9KDoFsfVxQG73X3Re6njOhNdw==
Received: from BN9PR03CA0283.namprd03.prod.outlook.com (2603:10b6:408:f5::18)
 by CY5PR10MB5987.namprd10.prod.outlook.com (2603:10b6:930:29::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 21:29:51 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::8) by BN9PR03CA0283.outlook.office365.com
 (2603:10b6:408:f5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 21:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 21:29:50 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:29:31 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 15:29:31 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 15:29:31 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PLTVcT1553140;
	Wed, 25 Feb 2026 15:29:31 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 97CDA142E2D; Wed, 25 Feb 2026 15:29:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-driver: Support for unified GPU bindings
Date: Wed, 25 Feb 2026 15:29:31 -0600
Message-ID: <20260225212931.1526674-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225211503.3425398-1-a-christidis@ti.com>
References: <20260225211503.3425398-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CY5PR10MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a9e9a1-64d3-4671-15c4-08de74b50243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	VZiZNKkRB+9gfFfqBZWST8t83dYPRskmXDWy8c5h1j9pqaOtwY0RZXdzxkBoP7vaR9av8iWFL9777vbLs8pHwk3PVCUk9bU+GSCMVg9BaUZspUp/PWAIx44VSkcwitGi2R2u1v8M0mqtveDrT4p7wLWSpA2QFcq0HV2O2kkC0jAsRYN5hf3Q74d9sy427VMFiJ/tN8ZjLxmoO8Pj8s0CIZ/va7vCABg0frpnJbgiN/dEW6h5O7qGhGsBBWIkWzDdEcGpgb1jbbezBHUvjLX37ykk+BtEsSXJ3NV5k7TaOLydypuF8jJnZU35POY9g3sCNKcJRC0oprJ8dtcwikmkY8tf3q92i/7MUhAnnLlFKTO+YsaBxhdf/jYEXWwIBDWMaXcir3CAbSuz2aRu6/8IP4uOl42qI+SiOrKG/rdJDSB/X5mkWzITkbvzJbbLkzqfLsDooIkHWcALvmB7md4+kMM9aYZZRQFIlhtD2BuprPgLUO4JPw5kj+2UtVC/M6RzqAw3DNPlrGuBqysqwvKzO1DOnWc/iyd4Qg9qnRbjhxO3MtlxFgnVbajZIY264t0zniYFS3jJ9GKUp5eRR/27B0UoG0wPvAHV2G3sql1oaabaE5muS1cR7ym66w8WRKaw4FJGvOo04MkPM8CKPJ4aPh8zBDqz41rEoMiO6evlk6J1v5bKRj8unDisuyaPXd9XlxjHpjWHqbOLbAVtPatN2A+nuA8+MrjML+5PLPTXPAVNBS+9DewYGhm5hN5Jbi4grggodCTiJ1iWtnZCy9MrfpysmmJKF9u8lNJGIayKvztyMi+BO0hKqaG/wgWaMBfMEslETEgyy7fwMbAEG3jEsA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pw7XRKVEIF4pPL1bHSDJtvuG/Z+fVn2hjGiJGyBGBXFrYYrqxho4iAzwdDq0+jEiYm+Tk4TErKcAxVhx5JGTdlZHGrnkfhdkt+E5zzl5EICmYjIXu3eQAZVvTy9rq9td9wzjo/jaoJAykla+nwDCEWnF4Gt0JACDZOgAMQubAeZGr23BBHG63MRMlLD9Y5WaXCrM4EMogaV6MZXypmyvS68xSdbeeXreHIO1LJ8OW4JySHyml3e5zIAP+g9gqoFawZNptzkShpxOtziNTLKsiDYatHbcSh9/vHuFbFdGIcq/yj1+C3CgwIojYMo+mfN0L7J/B04Q3c702JXUO2QHdMqZc3elrSutBVpaAjIGMA6+cVSIBTxyS/BnWE6MPruFuKiB5z4tfjodsEJKmpHAMRA2zBvjWCkCFe42R+A4Gc6X1h05ceqi2Pl/4faxUtT0
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:29:50.7814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a9e9a1-64d3-4671-15c4-08de74b50243
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5987
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 21:29:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19612

meta-ti / na / 20260225211503.3425398-1-a-christidis

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
- Patch Series: [meta-ti][master][PATCH] ti-img-rogue-driver: Support for u=
nified GPU bindings
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 25 Feb 2026 15:15:03 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b364087cbacc61cc7cd20af918c1337ca=
3c09b6b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: beagleplay-ti: use the am62xx.inc
- Commit SHA: de3bcac5598074abc3aab258416f1028bb1e338d

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




