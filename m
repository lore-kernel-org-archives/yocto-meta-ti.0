Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28898EFCE58
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 02:44:54 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35708.1772678693156659263
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 18:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=N4vASvRu;
 spf=pass (domain: list.ti.com, ip: 52.101.62.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELvTneBjpM3zjjaALhxnpNjs1zQ6yRco+CNM+d/Awsb54f1kmgv7XLJYO88BFDEztz4q+PJdp6wbkG2IGh4M7dm5neY8E3B0ZdTqLNdbMjCIwEoRsJbcKWZgS7NkrduJ4hF+wNJ0OUjGMdqgCJmukr3XxSaoti/s/ojGm/J2rpX4R9TRRRUC21Cce2nlHmqkXPtBB6DV21ptYdHD4XUvT1qlkQw68yCmAguObBTlPGOfEYUpwdS2FJH3C2mhtg7VxJWAn9z1CYUQ9rL0Xbvx2rfyItfdXBk0Tw05evIVG2zsTSvtv7j0MgNdj9mohw4oRXkapSdAZcZTud/LcE62kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+21c8blc1AzoGgkEYyN+mFA2NqtCn4SStXc4BpuU40=;
 b=GAsHze0RtC60AetOECG1qioDJAeUmtxlo1Lxpy78aLCj53q1vNe8fsBsf0rvyd+hEzAxxt4HQhUFbt9mT2fbCGOpyMAwqduFZOcgZsnslR526mJnZ2x3Avi9tQH3o26Q6d1O+EdYwakH+zV2RgFT8vD4GHFh9Qz1atfELE0d2XXKFENZTBrJsiVdyLjE+mTXPx2iNBRi5rru+Je4eeejLsIHr3T7XRbD3V19OsyGDqchtdjWAsPy9cbSHk5vU/HQltmiBaAkGXo65gt44/ZWtrwqpYos1aRzgvXXi5hRGshUmVMWGQ6jDl5hltDLzVR+6cTYfm6k+VENqb6WvrlNwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+21c8blc1AzoGgkEYyN+mFA2NqtCn4SStXc4BpuU40=;
 b=N4vASvRuX5p3DyG5t89n/pk+j+ZJsRqVovsmHWPZxDCBamfItFsTF+ZU9DdJMOHacP13eWWTbsLEr9SM+r8AFU+Vu47mwuLJMZleOASovloadVlgZOl7TKLDuAHrCsw4uYwh1cuzVaRTJSK8LC3tpd+f5ndWBkMcPkgVVILnCFoauRiRkugZgIzz2T3YZswyOXB/z/BNm4mB5CpbFn2hhEHf2L1Pl/qo0Chxd3eGFCHYFrGJk4n/l8l2Kb0JXZOHsG1iFm/NXvb3rS8fjLqWZ6qGw7qwlRpUzpvyqgP8iggnT8NigINHCV2Ftm4VWYlxcfSY6FhFtVOzuSTct2RXwg==
Received: from SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) by DS0PR10MB7510.namprd10.prod.outlook.com
 (2603:10b6:8:166::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 02:44:49 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::f1) by SN6PR2101CA0004.outlook.office365.com
 (2603:10b6:805:106::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.4 via Frontend Transport; Thu, 5
 Mar 2026 02:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 02:44:49 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 20:44:49 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 20:44:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 20:44:48 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6252imuD1528662;
	Wed, 4 Mar 2026 20:44:48 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BAC809ACF4; Wed,  4 Mar 2026 20:44:48 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603041808
Date: Wed, 4 Mar 2026 20:44:48 -0600
Message-ID: <20260305024448.169557-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305023316.1352831-1-lcpdbld@list.ti.com>
References: <20260305023316.1352831-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|DS0PR10MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eae5525-a91d-4e07-0fee-08de7a612b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|376014|1800799024|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	NV+5RoYh/NQor9pQOX7pmMvqOVWbCkBnkX5VinPmGx07WZAn7VOrhz3Fs2Mk6XrysdwDEx58EgBUgbt0M3/gFYjFUMDv5dlWnZzCiS2EOHJMkM19UHl+j0EiD1fNYwy6sPs86l303ykK8W+uxqu0IHnyd1Sk3mGvW9JpAD3fiAiNbY/+xi8F472GcdhbUEfjxftJvDmCtddeCRW075Ro+JhB0axhSTsLhkqtnvfrA+qfsf/i1Mrz7p+wYcxUyr1wKWZLz330OtxRTs20YQMEepYNaGKgjOG2O1xXuhLdlETDCCvTg6chhX9aFVDDX6ywzgPe+WcQgJTZL6iap5sXpoYlov4g8f+fmzZnGZ20pKJ1DhkTK8SUYuIswJWXO1tO2A61kmFfcthBnBTcSE4ZEEBR3taoX5UVi9A2GmnfpmCe2yG963DDRGkvkT3lmbXTFg/kAzcLwn88+s+MnJaJDoabvsTjiGDSUhQwqhsf9rW4VmmjXEbkYHeL7IWw9HLTojnDsC0O50AePZ3hKPl1RX66kjUky8/aBVFIp0XH+ikCbC/VNK3Rn4lWui5rU5T7dH2yiFVc1wtDU9kQfAQ1eabn1hiPBG3QY3OrmT8YvBJrqTsVM0+ekRk+ZmUEA6IrTGMYIBcVg4enBlA6w8s3ABxUMY5Z75nXdaQ19eHd6GdqnSssJ2ogLIk67ZNvukQoAASdmJnFFf5Q+aC8pvGgpUKuDf1aPVOtlzqtZ9Yi8G8JGObinSiDMw3iVH4HQehk72gUja8kmy+S40T0d7xCXw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(1800799024)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1m1kekbMWESMt/qn049KOo1hhXfPOGVc7s84ePEaE000ztY6piMjMdO2cJLFpqXZitbiuZbBWZ89nBcsSlh2axvrGM5f3n31REoPeIkait20jWu0GKJSFW7vZV9NKGivLt+HuozwsPUtQR4a4XyKElz5QanhT/jm1b7sw/Lq52ugtK8lYvG2F/I67CJImwy8S7lO/BgVvAp+ZddJQxgL/6BhRdoF0t7YFkGpSjehBPLEILjybq4c3WaL85ZSTGWuJKqFvOl+VPEvGOqTsQTSc+QlS9G8UIiv16TJx6POS513rACfdGSacmI/EKDWA15nuFZG+MoKeJ91c2cG1+XTX2MePqM6o0GJ0BSv5WiWmhIP9ip0JyJaN6zIGM4R76gnwnAcKMhdGPMYnwgDfYTx12AM8JONQHTTwT2uXnjdfNqsNRs7CXYZ/YHKNePUWydO
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 02:44:49.3903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eae5525-a91d-4e07-0fee-08de7a612b93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7510
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 02:44:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19649

meta-ti / na / 20260305023316.1352831-1-lcpdbld

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
603041808
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 4 Mar 2026 20:33:16 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8c8f08f78e26511e1e819257806f7979f=
e02f430

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Mahammed Sadik Shaik <s-sadik@ti.com>
- Commit Subject: ti-extras: Add Jailhouse support for bsp-ti-6_18
- Commit SHA: c4fd1ddce14d635d5920ab9228130ec01fada824

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




