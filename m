Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B40CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:51:18 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.957.1777481468538017794
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SnyIw2+Z;
 spf=pass (domain: list.ti.com, ip: 52.101.48.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfln1zv4tuqvqGKQWOxlLwjlYfIQWTZVafcahhVvtpkC+vfgokEUOvDB39DnlFu2o0Yz53MrTCTF3b74tQhgJ+sZD7QL+NnXDkcouMHi4pBwR7Rx6LDVWqQ9u1wrU9Z7FrxK0fp60Iv969CoxWdMkvCKAA7EQBtvxfJtZXP8UhKpVyTNgqdNloOr+MJ5qfVtXS1OB8THkg3Vn2het38QLLHI5//kLZtRZ2sEt/VLsaIeJ5YhcLQt9zIs9VJsI5cZUdx8efEHhJWzpsARR9sJ3WMF15/xgPJ+z25VSk3tWg+Yz7H6gROlhW0xk7v3rL/U8+c6Aqp5jKTKM3mxWyw2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXCQMflScwanfwAkoMdDDmRwogVhD4eYr2sO8E23/Zg=;
 b=hXgOcHLY2ys+F3Ov+xXPyITMs0250+9xC2B1wTn1uDxFsunZJuq7BlYAFM5dbA0yoGtkgAYmRlii9Jwx3excBJ9J+h1LaNNkBXMpxkbn0xT54w6jEb7BGMNkyleW90b+O9gYMKIdeBuj4qSAIFo0zzYLMYNexKp2v1h1hOfwXUByOJWFw7oTlj2IFce9cS8BsswnvybqUfLdeYOu536rZUuqCDrHslEmJqX9x/eVvGTGGKD2AoTAgZTTh4WaWAbpiSCVTNDtkXa2TOe3QPOw2ZKA7nzTEu5ppgalEVZbj/9xShA+7VtjhO+zj0gkszEHw2cjiLI/HDKMMAMZqdQRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXCQMflScwanfwAkoMdDDmRwogVhD4eYr2sO8E23/Zg=;
 b=SnyIw2+Zus+Ve2ZfahoqElO3ugBCyNJ22DzYt/PTtkRZdbAKI1ENDdh5koBBzISgdP8ypMPjgvpOcagf3EKZavJHDDwfzEWeuXZs/gS0UwqVKNFMe9sN8ZaWgqwRD70UOXKliWrr5SBdbkxEki9vvetMd2bfUXNVv8j9X1pqcfr2Vd3ffGQ9Yaf9XsG7Jgz5GMW9K/QZ/gSXcUTuY6y8MympuOcTqp6VEllJLGyZFSadZ+xOwnNPYqe+DZYb7NqgLE0ikB8oVlocOGrFU7BEjkr6qvsK8vVUuk7iBADEjfsjSMnwvo53tIQ3Cae27GvlCtNSg+hsElg1M8qpFFv7iA==
Received: from PH7P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::27)
 by DS0PR10MB6872.namprd10.prod.outlook.com (2603:10b6:8:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:51:00 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::2e) by PH7P220CA0041.outlook.office365.com
 (2603:10b6:510:32b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:50:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:50:59 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:50:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:50:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGoxZj3728925;
	Wed, 29 Apr 2026 11:50:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4776F9ACF4; Wed, 29 Apr 2026 11:50:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v3 01/12] meta-ti-test: Create layout for new layer
Date: Wed, 29 Apr 2026 11:50:59 -0500
Message-ID: <20260429165059.2070802-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DS0PR10MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: c3462251-0950-4690-6517-08dea60f7de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rXQJGbzWYXnnE+7KnshV7xnJNxLkHoS/qcWk96+nAvM8a9SJ0NPtK6LvfrFfXtMNypW7Gqybw2k5FFJ5i4Q+3zIv2ekjzsoFiOxEzu/v63zHgTI1XMMmYUaZWjWgAIHOK5KFRlaloP0V0QPQ7htVOrbzlaqAPqTPLdGJsLb1N+pbsIk/YZ1IKBu0TKwSAxmN7Qe1DKhkGbtOmXlXd8iMIo2As4qjEJdD6dVw1vd8YccVLwf6fyuvxturWctJYB4idO+khdOfAVChWzG4Dp9iUCVwkoqloFzqG23V63sXxZoQoRSWENRMVL4ez2S7qqTiLoc3XsEckvJ+2Zf7muDDJLFyZ/2D6fZxMbkiTJgUf7WM0mLuVUoL4z8p+BrSNtfFPCl/Ny/G8Rb0iMwF0xWT703HqMR1p5WHdgJC+hANK3MvtI1OZ7V1asbsxaU/ky9JsDMFCdW5a37XnEWNSKknfVd6UHBFmVuJYRdfBtZvJBQS6R8xJB5pc1wXLFO1zGRKcrZgJ/CCcydQYiltUPg3l4/kznTrj4qt3ERFwAoY3blJJDt4476lfwZRJNld46wqT31AJfPZPoA2dCIhOjYJjtuWKVrXbgo6iJonfEobk3FsEzxaJremR5B43dwRncPx75dxw0lrO7A2itm9fXZMMenSIo08+1KTOMfGrbrDifLA19Mc6Gbr71PBmyPNWDp9GaZ1Vd+OF1GLeLMn5B5Jd/SsuUjF+yJGIHADJSGAMp8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tLo3ex1kHOMCjMrGXEqjrmZA2wOjuXxI/C3bhyk4z2Jdw9cBmAhmB2/7PhmDddu0yD2BG0jZxgV3Bt2HqnsL7WD6Xb6bA1QlgzqI/aHPnRqDaXTrCzbdHt9buEXV2OIfGSBaoQzGaPWXsw+DohU8cpYF/9PAu/jC8+4ewvKJQcc8MEZNOofnJdC8CQgZoLR1dO5nCXAYeb+KXbt3LGs471PLwzj8lIGC1uKjdhuBtx7aSQ4XhzzlXnd2FIbwmj2cl9twws6bllkbrJhOYyx/XxUCKReHcsU9KkmClCIIBZfLftUSxNkGDYHF98DnHS6nU9+0KVh/5meB4CDqhc1paj6yPfmRoLyJfvXt4jatVcHG5NbmDl3h4YtoAKBK5MW8WPatHq4Qmv0yIFpGEWYxOo+lT/u8dMe2pIX6JnWY3wKVXY+gFLUgBnZLIuvpg9PJ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:50:59.9255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3462251-0950-4690-6517-08dea60f7de6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6872
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19917

meta-ti / na / 20260429164432.1623594-1-reatmon

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
WARN - [meta-ti][master][PATCH v3 01/12] meta-ti-test: Create layout for ne=
w layer
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Create layout for new layer.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 02/12] meta-ti-test: Import the recipes-b=
enchmark recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-benchmark recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 03/12] meta-ti-test: Import the recipes-b=
sp recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-bsp recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 04/12] meta-ti-test: Import the recipes-c=
onnectivity recipes
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
WARN - [meta-ti][master][PATCH v3 05/12] meta-ti-test: Import the recipes-d=
evtools recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-devtools recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 06/12] meta-ti-test: Import the recipes-e=
xtended recipes
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
WARN - [meta-ti][master][PATCH v3 07/12] meta-ti-test: Import the recipes-g=
raphics recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-graphics recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 08/12] meta-ti-test: Import the recipes-k=
ernel recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-kernel recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 09/12] meta-ti-test: Import the recipes-s=
upport recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-support recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 10/12] meta-ti-test: Import the dynamic-l=
ayers recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the dynamic-layers recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 11/12] meta-ti-test: Import the ti-test p=
ackagegroup
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
- Patch Series: [meta-ti][master][PATCH v3 01/12] meta-ti-test: Create layo=
ut for new layer
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Apr 2026 11:44:21 -0500
- Num Patches: 12
- Mailing List (public inbox) Commit SHA: 30fe36b715fd73c603c278140d5df4618=
2fe5c7b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: am62lxx: Override serial console to ttyS0 only
- Commit SHA: 860890d476666397112e0728c818263975a6af5d

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-include-mk-Fix-i=
nstalling-subdirs.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




