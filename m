Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD02F8D766
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 18:51:36 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22884.1776365486131966570
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 11:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VmogajOz;
 spf=pass (domain: list.ti.com, ip: 40.93.201.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj9x6glKqlAZIpouYjgzOKTtD4vXmlcyCfxmneXrstkyCXeGfCymYRI1rbIuH530isokqZNrkGL6KhxOh2WVHd+X8gqC1suwuFOjQogbgQAAk/6HrrjlN7gJipfrvHghHNA5i6WC2nlNs6W/n21IkYHoyXlhVhfHywSjWZR2N6wly2EAK2jeUrRfA0f2jRHH18eiA/SD1b2sR0mdJEO2Cqd4tV/TZFkmhSnmDvzD4gwK8I3/tVlpW1SO9aCU8c5Igs3XK30IIbELEdlp6sGlbBz2O1fHG0C6x5a2xQXr2Ocm25nO/g2oFlJbrmJFXcdvmtOhn8ioqXeuIHujHfdZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuLeWjfishaK9ahAQSyApw9Ap1QZeAy/KoHJyqi2bHc=;
 b=xl9eeImhm10S4zKsRd8/fSAu8YSIVZP3sZE852QGwvacYBCtOZFtUeHjDnCv6QnGrCZ0lWSFd+aA9RNdVXyOdOM1KEs+H5J4y/VcuNwTFhfjC269n3R2GLJmk/TJOFWXEvRQdWV75i2TaxcGe7E5E6e1YNl9PG0Xms6XrcX3yEaM5ZijSCxXVcPhpo0pN9N7Iu6uU78Srkbne4S6UcSZUFHIbI8F99YEvmaVn5CV+aAarbW7Qz0PnsZ4RfbG+5u2/JzoHoCKH+IbwV6jFQ3NKyUZQ7OkISD0eVG0IJ7pwXRgU0+DMjXIznVh3zdyFcS0wHz7VDHigRLARNS70afvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuLeWjfishaK9ahAQSyApw9Ap1QZeAy/KoHJyqi2bHc=;
 b=VmogajOzfklXRfRLBn729luA43B6+LVkVnojBTrrMOcGmE2Dq6NmGPdfNxfmK6HNIRdzBkWg/GuxbEytIz9vldyIBjv0MdumVprGH5Pxb8/2uRdElWJV2o2geEfeNsxYsfg4mlJFsjT8pRbkx1sIUYPZdDs/ZLxTHsmoyNR3UbfI3FfQka0oZwHO9KKB8XXr86s60aIr83mFWsZhp5Q16qQocJMu+E2h2jOenLv0lHuBenFY96j3hMCy7keZ+oDvzcLua0LvPzE/eR35f1Oama3zKlBnrfTR/U+u/q7e6L+IEAnHorM2G+qz72UqH0nydRMkN2y5x9fyeGFOCYJasA==
Received: from SJ0PR03CA0113.namprd03.prod.outlook.com (2603:10b6:a03:333::28)
 by DS0PR10MB8031.namprd10.prod.outlook.com (2603:10b6:8:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 18:51:22 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::48) by SJ0PR03CA0113.outlook.office365.com
 (2603:10b6:a03:333::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 18:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 18:51:20 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 13:51:20 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 13:51:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 13:51:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GIpJpF539550;
	Thu, 16 Apr 2026 13:51:19 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AEAC69ACF4; Thu, 16 Apr 2026 13:51:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202604160814
Date: Thu, 16 Apr 2026 13:51:19 -0500
Message-ID: <20260416185119.350850-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260416183313.682787-1-lcpdbld@list.ti.com>
References: <20260416183313.682787-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DS0PR10MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b0fa90-bf6b-4880-7290-08de9be9267e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DwttsOx8uhmvsUHppKrFhAn3sN7kgKKlpABVPWU8ExeaFTrHeRx+HpAe+jFPBI/n8GmfpY8HiC2+5Xh3YRdi4lQqb54EAKe60yfrFfWkResqO7lf8ovd6gFhexW8pKjh160DxFn/19CTrlgEcfkz9WMKMocZ/Eg8QiHMAz34MnJbVa5hbgy4p7yAba3akuwqL4cUG79D41g1gjihjtSsjEv5apPu/a35KNuHK3iQiBh/fPzTWsBni0MNr4V3IpyM47Mc/ghQVD1lyeTfUmEGWWxm6kCxIL4omNkJZsyMXd+tfZHHueQvyL4zyeQMW6hBHjZzWE24Jv3RaiuxPrYxF5TAmR2BZ+Xs/wp3T7tKjVIQslxmdZfGfbYemNFa2tS89TCqTRJRJqPtVgpPgO4v8VPppKCxWwYbDOI+m6HdTX1nH46D3cOerrv8DXjdoZUb1QTBeEbcmMcJ6QIN81iW1b9RCYS9bb5HqArVOYh9jDF+Xgss6qy64Pw9hcGHq51lBw87fEUBCIAXkW45nEjJ/2fEeYUpmjZG6G7At3sCsj0pGnLUgUmc1yl2FFCTNLw/ij0IWKFejTdkL0OEAlzedW9zndrf3zIiiI6degIWlpdks/lP0AVnnh2Nluz/ZMgoWYEd6G+KoTMz3+4YvD87v1x5es+nndT8ClNm38HhEWGOtkD5xg8bLYLBKrTrPmAclaNGCasqWL4+4Xn60OjHEwHBTFNdG3xfAve/GhLYeC2wrk9PFwsAdkP+D80vSWgzL8Uol7xoTe30yZZ06+KIaQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Myf//RJigoKBKw4ey5M5Q3f20cmALXzvJfDt7fFZA7M1XUMlGEaOpMVwz9VXOBjll19kuFTYmRiZmuvWtdKwiJDkSfUVretRRUbumJ+T+Ht71w3oMIyZ8+Q7X77Oi+6r8T/LX/1VDXIzq7t45cF684HfgMZ7vuDas+QacPKJY/31lMLYUxhTpqR27a8hBXpIbe3bSlb2lHiJ8Z0orkwjzNTsue4e8+N2qhK/yKISyQSKMLMHl21GeyV/RDxUGo5XWrVLWKNZjBFc9c6A3PhG1SckHYtugyyDNDL9KxXypRepD1M8TCwoXWFbtPUqypb2tTIvqeos1AnMHL3yQqGcWv6hkSqKLFuv0c0HjShE2SgFqOcQtC4jhU1MZ1sSDFPFxFFRXtJZVi4di5fMThwZGfpBQZaWgT531VyQsuyDaS0BGBEqdAbE1sOXi3lsYvjr
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 18:51:20.7337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b0fa90-bf6b-4880-7290-08de9be9267e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 18:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19858

meta-ti / na / 20260416183313.682787-1-lcpdbld

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
ap.202604160814
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 16 Apr 2026 13:33:13 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 51d33017574192113931de45e6dcc43a7=
c0f4031

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202604020811
- Commit SHA: edac88403004bb712bf1711ce83750dc26c7fee3

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




