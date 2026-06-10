Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C6CCD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 17:24:23 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26338.1781112253993087303
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 10:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hGRmDxOo;
 spf=pass (domain: list.ti.com, ip: 52.101.56.5, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bytub2HRa8mVXCBMuOS8/PxqTc+8lEqtEalbmyiQ6EBXjgGCL+smuHs2pUNhquGyl7FPbS84XcL/Qs/kEkn125Nczho0WTQk/v/FXWnZA15CbbL8AUaU/KVCkxX93w3EPANuA0OsrfGfbA0MLmORdz1JWFYafPKRUo0KXAv52tfUzP7f3SDWbtxum2KcNs3y8HOyK0CPW0xZ+Vv56lF6iy3DcRwKQUdt3ByAt8sQCXib4HVSwa3boAqooE80IuStq4dRMfJfh+kiCWZrGP/P66ogiy2lbKctcewrwD2cCEbhLgxFNUBS94soaXCtO66TjL1SSlhMu9wNzMbHNpQegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zeH3supybk2R0Xo38SMrKjuukpYJlTcWEkOsrhEW2U=;
 b=gvUO81Gazt5kpVZ84Un9BAQN8F6Mswgpg8bN3aCkQxkbnaEDdEAVXermTPOGrve0Ad5DXr6HoKLwc6nCRVi+TrUqPkm3698hxdtlJac7s84q9bVvx+xXzXr3MBWmuNFLQclvZQtnZiLueLz65RbHZgncq/Py0asWljya2ilY+DjAw7OquSA1ksYW3n2FoTt8DjQivJBcTnfBW5E92F9ogieEmWZo3HFOXTDtVfsGmvkK0WmRa0mTX1qdhxVpkk1zCYGG4eDQRACF45Fi5p5RJCZ8pGLCv7DtImvzvHFfu7xhjl6Lk81ZNFaoyKvmNyhRvMIQlvioySAjePNkrVeHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zeH3supybk2R0Xo38SMrKjuukpYJlTcWEkOsrhEW2U=;
 b=hGRmDxOo4tHxc4ZQKzZAL6rnIWE3CziPv0YV4hMFGeo67jBkuJiAdogj6VQBDfhf4LB97nbgPe2XHFIndi90NOkuYZBcbiam3qb8DHr/+3Th/ui5FhO+7hRGRLklq1ny7sDxisaWW28c1L2tZlqwlc2PGkRFk1j4CS9AzAE1FdjATMX6XXD+IW04D9ItPyGzSRA0q6PYsCl0oofDM3skOCK4dsJhhN7yHzUCPAq+j0x8aH+xl/R6BaolDWyxyz75xNmPbfQ+LlM+Q8xgQK7yOfV3cI03nTJKW4xamE2Qf+an7ZMA7942s69citrpG9zOGhJ5nGbTRs9WzxHGbusICQ==
Received: from DS7P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::13) by
 SJ0PR10MB4768.namprd10.prod.outlook.com (2603:10b6:a03:2d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 17:24:09 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::99) by DS7P220CA0021.outlook.office365.com
 (2603:10b6:8:223::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 17:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:24:01 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 12:23:41 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 12:23:40 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 12:23:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AHNeHf3272150;
	Wed, 10 Jun 2026 12:23:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D97579ACF4; Wed, 10 Jun 2026 12:23:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>, Andrew Davis
	<afd@ti.com>
Subject: Re: [meta-ti]][master/wrynose][PATCH v3] conf: am62dxx-evm: Fixup packaged overlay list
Date: Wed, 10 Jun 2026 12:23:40 -0500
Message-ID: <20260610172340.2994040-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260610170308.19989-1-jm@ti.com>
References: <20260610170308.19989-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SJ0PR10MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: b08b1b33-3b05-4c34-7394-08dec7151077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	rbqqaxMsoOGTHDj/7r3MkSki+iiORVQDZtKJpCjevCRt4l0ob96BbQtI3cP7uF8lQ0hUqXH0kndiWaZKsYudr2fJXYnbqh0XJfSTYdBWBRv9qNj6ngWry3CUIJO5aQ5vmzMkA69OuqiVwMtq2iGEjQD4oNYRYh3gunTzGflDrD3lUCM+LlbPQbaEsL6Hh36RcT6nsDlsXLgn+6uYE6lwyxijjnZ0wHKX7MawyT6ISYxuNpD2HNMqj4Frtz59ckVTfGp9aQ5Fqli2sX8kbj+tEW1dTTTDJIQ9SED6ldl0y59VYKfwkblr9pOFdIR7RXTsTpuKqe/KM4uNnorU5tCGsRJghnO+V4ahNreioO1aQ0ba6T/pmWXHtpS1prRiIPXxP92cumoX0ME9YPJ/ok/WEt25n1i/hfraO9wjuxzCO8LL+XbcKDTc4b1zxpfKIeqkFjjVlUhyvFrlpU6xmFC/IzLndv6YYLxlIEqa37S+6a2pjXlP8FfKJZmLCODndxmDCkfuekBYXxSoMGTnOuBHRj2z0NHYGH/nqpfVS/Amgnhkm0T4AMmebYQ8T5K1HnsCuq3Tr9vbS10+CR0nxic6C23mCk39Q80bZAMZteOkcII+H6U0VvEsJxyqX2AXmJO7RMUGFkFoEeiUHcNEVg8mF6KSlhE9O3DsRLSFZgqolSBFhxLW7cfHx4QLnrSAPxIsB54gPC/euFK9bPi4KmnjNdT5GcTTgPIS4hUORTMok0o=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bPeFB4dw8zDf5SnUNYOZjOZeh/9Tc1Q4YUGTmgGnA+cFEBjMiFzoaSp4sb/oSkxQEanRbXAqrIizrpZq2NQjUV5ixLZRXdDccKhYSvSdq4QqxpnCHwa6qNYqFf5UAaaSKTUUm683g9eHIR81QsCYFH2KpKae8fa8Dz82Na2wL2NVmH98JjNF8u4dEkwBdaLSGu6HvNdxAJoiEWEJeM30ePWGfang8e5fUeurS6s5RKpVQNQxJEyzBKwmjYP924TwXtnhDD3Bq3PEKLSX2dOuNK8NZ7Rr6y2l9rmjB0Io5pu5Tyf+PO5JfeF/t7MRp2qtMO2fVOKGDyrGyhvmqyYKlXoCnMFJKzFSprplnPC6KAayPotCf8o8U6T6bSbR3xoFLp0oYfUCgU2vSR7vFu4gNwOa8evPlOHAhD2Fv6AFzEcIZGCUvPH4TMR0ZbHSXKgc
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:24:01.6944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b08b1b33-3b05-4c34-7394-08dec7151077
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4768
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 17:24:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20008

meta-ti / na / 20260610170308.19989-1-jm

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
WARN - [meta-ti]][master/wrynose][PATCH v3] conf: am62dxx-evm: Fixup packag=
ed overlay list
    WARN: Commit message should not include directory path to recipe: ][mas=
ter/wrynose][PATCH v3] conf: am62dxx-evm: Fixup packaged overlay list.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-ti]][master/wrynose][PATCH v3] conf: am62dxx-evm: Fix=
up packaged overlay list
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Wed, 10 Jun 2026 12:03:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2c16a1c118d19fa6955c9853258c317a9=
9690b25

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: d942c6acc0cc38d9c0abff27dabe40e68d41f584

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti]][master/wrynose][PATCH v3] conf: am62dxx-evm: Fix=
up packaged overlay list
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Wed, 10 Jun 2026 12:03:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2c16a1c118d19fa6955c9853258c317a9=
9690b25

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: b72044c3a4b75360ad7b44c7da9847650efd65be

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




