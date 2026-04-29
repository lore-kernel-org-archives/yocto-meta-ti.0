Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BC5CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:21:32 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13869.1777476084786751862
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SHRD87Am;
 spf=pass (domain: list.ti.com, ip: 52.101.56.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWXe9CRAfRecooC/On193xsgbOFwl7UC1Tqiw6jm+c0k/UMqjtE8RBthiKbxZlA6BY2jx0+ekrO3alXfUYqe4p0tgH40DerUfCg2oc5ibPK7IIIMEHxC/hrYTJBElcb5a827bOIhPErun7hAfKcLRNsMYOWfkV18VGNmhy+Fv/4VfxFCld5E0yNcBu7OTDM/Zw5FFaFUe+gOmJv3NzAiJAXIR6NrYiJXh26sNn0NU63s02Qx63FrGP9bQ5IqzDdhRzifDq5VduTPM8012Ynm3Fr1HiOYJyo6EPz+ycJXxhVBWHkDfkwGYiKe7U8nL3iAsXywu7d3v4wdlEsiWcHauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+EbjxVeb7YqcF6uXqkMatT54OFsKnzwIneqvGaTe5I=;
 b=VUnsXSWQHrephI5frNUdvB60+AFT0IOXhTEOlNvKf0W/rMqolwmHwxxdNbAqWCVYg5XJxPNH/QnQYV5P0PTZxcJWynBuYfxzC3r2W6cPn5sL7GPkLU8lp5+rmsLseT7Rebwse9ZiGox9yHeOuMCPI8YKmJqlKy18RLiBfHFM1jJlv3NIu+NnnmGCOsLc3iQ9DhfKuST9weMv1rgkrzdTQG3Z5zkbutYd78o/OLVxTZwb/NZInrxK5736NHsA0RWLzgxRqJMxAjUzGsHMVPkXS1QlAp+D5WLrS7NqgWGtRYniE6yBdBqNYspwrPYWwtwb7SDJCuuzoD8XVVmq1dMW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+EbjxVeb7YqcF6uXqkMatT54OFsKnzwIneqvGaTe5I=;
 b=SHRD87AmVDeoH8rwh18CylmpAULBIziNYnHt556Gm7SLaL0Ni0M9mr6IphDnSyJTpc2s6WANJp8Om1TEko7Ef3tnYXivfdEAfK5seAQ/lFOOfBikzuNIAMDH5au3mjE6bCfiy3vG16sO7o7se4tXRvxP7DxSaVDgDkr/yOksb1GsJ+Ab4IWI07fQ3oJUypsqFk99Nd3TO9rD97oq8DwJEMjj+jhfvzbHXoNbhBRfRkwU9A25fGuQn2BOlJy0friD5sFH7sIgbvJFhYd8xscySYj0PiLwEa8SRedFM+HtE9p4fPaD0ujFnXs3ZA1N/LjFSfidsWCck1XSLYef/1L6xQ==
Received: from BL1PR13CA0177.namprd13.prod.outlook.com (2603:10b6:208:2bd::32)
 by CH3PR10MB7679.namprd10.prod.outlook.com (2603:10b6:610:169::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:21:22 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:2bd:cafe::df) by BL1PR13CA0177.outlook.office365.com
 (2603:10b6:208:2bd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 15:21:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:21:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:21:16 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:21:16 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:21:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFLGFU239522;
	Wed, 29 Apr 2026 10:21:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0F7DA9ACF4; Wed, 29 Apr 2026 10:21:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 01/12] meta-ti-test: Create layout for new layer
Date: Wed, 29 Apr 2026 10:21:16 -0500
Message-ID: <20260429152116.1028788-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|CH3PR10MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce5dbc3-6d42-47e2-2440-08dea602f82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oRYPBwRdo8HNDtTn1l9GK38lXUNwebBRUzOwxTu3tE85kyYGalotI6NxT6SHEf3GMnSAaaQoPQA8YlbUeCiJ0rWbAdB5HJGJyzA+3XtxQUonWV1Fcnsg0kOa8EqjpjBUs24FyM6Pdw0Quo/c0rMphfjEpS0zVzxUTd196cO62EW+n5XtBcU8+DWI7hDhLlLCN9slRG2xvddVTGO+5wppDAoBKRFhKovFDVSIe6dnwrRkHEEzpt3FLri5VduqKCvidQScUDZqRcp0ZKKO2jCUe+rOcb6ULQ36Ze9oaXUujK5NoQz3kUtdJrFGojpzYWCvGt18n1E5lq+as1YMnev162nPfwpslvyhxPGkcxMFEgFp0dgxoJmEPiVVK/KmX0hEzc82NqFHhFNvfexBl+rHeE6DWz+qvK+1gU5yR1qX2aVWW5skVMgsk5qj1M5F+ucR/fak5Cr0P4NODcA9pfGMEcy8oWEEfv4R3Ib6tDrtulfcH8Q5vp59mXDgqrz+RZFH7WQW8Npe6jmWzw4vhANpbvC913af0CdNjYrJgKtZyGrgi2r3dbh0Eqb0bFnUdNlrTrvz66w4e9rObkpiW7sSu54dYsPHuIwzJ2nW1B/8JraVjqxFiE9RJa6LqeRtPonGhYD6AjNC4pGBsseCT4aggMleDIZqTVtu3SEE8RMO4+CenOQ00utamcrxgYUZ3yWw
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HdzqiomSotVDl74E5c6TgSJ0d1CKe7fMXQf4qHIh32NEmXG44gau3z2SS5a5nH4rRI3ZWw/JygtjCIqMmGP2Gvw/bG6ahkt2KTM76uW9EhDqLTsCgrPySey+aC0iAJABdJFZNfiL23i3O5wXbAUWop7AWNWp8Y+xTz5C2Vu4INphgAJ3HvQfRGyVyzkd5TglxHpqwRF4mQ7UlpyGsfXUeamPdQHhfHB+yJM4Myz6FLk8BQWRMWi4f+iqHDzH4RLpTB83qUQbeGxFhez1ioo3Z/wo5EWqwUvPMPZOq4iKrQB7b07MKgHIPlGKB7IP4e6yQnsq7/LQsnIuW/trj5IomSPU7FPCi0OlFLlC1QcqqpPnPakkJn0W48khPlFY9LY2o3p0JMxizHH6mWQX8NVLVGX8fKsvba5DD+oM2sa5qiI5BUI5oXQsDS6QswkEu7JA
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:21:21.5611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce5dbc3-6d42-47e2-2440-08dea602f82a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7679
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:21:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19891

meta-ti / na / 20260429150920.978263-1-reatmon

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
WARN - [meta-ti][master][PATCH 01/12] meta-ti-test: Create layout for new l=
ayer
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Create layout for new layer.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 02/12] meta-ti-test: Import the recipes-benc=
hmark recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-benchmark recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 03/12] meta-ti-test: Import the recipes-bsp =
recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-bsp recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 04/12] meta-ti-test: Import the recipes-conn=
ectivity recipes
    WARN: Commit message does not include file/recipe name: meta-ti-test: I=
mport the recipes-connectivity recipes. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-connectivity recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 05/12] meta-ti-test: Import the recipes-devt=
ools recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-devtools recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 06/12] meta-ti-test: Import the recipes-exte=
nded recipes
    WARN: Commit message does not include file/recipe name: meta-ti-test: I=
mport the recipes-extended recipes. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-extended recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 07/12] meta-ti-test: Import the recipes-grap=
hics recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-graphics recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 08/12] meta-ti-test: Import the recipes-kern=
el recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-kernel recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 09/12] meta-ti-test: Import the recipes-supp=
ort recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-support recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 10/12] meta-ti-test: Import the dynamic-laye=
rs recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the dynamic-layers recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 11/12] meta-ti-test: Import the ti-test pack=
agegroup
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the ti-test packagegroup.
              meta-ti-test (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH 01/12] meta-ti-test: Create layout =
for new layer
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Apr 2026 10:09:09 -0500
- Num Patches: 12
- Mailing List (public inbox) Commit SHA: 188697a9a955e0293119f18c23ed3128a=
54afeea

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: am62lxx: Override serial console to ttyS0 only
- Commit SHA: 860890d476666397112e0728c818263975a6af5d

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Layer meta-ti-test depends on filesystems-layer and isn't found.
ERROR: Layer meta-ti-test depends on meta-python and isn't found.
ERROR: Layer meta-ti-test depends on networking-layer and isn't found.
ERROR: Layer meta-ti-test depends on openembedded-layer and isn't found.




