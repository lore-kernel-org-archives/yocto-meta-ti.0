Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EADFF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:25:55 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14169.1777476351686279643
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vM4NWv2d;
 spf=pass (domain: list.ti.com, ip: 52.101.85.11, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAVa3S76PDRnTKp4uZ4HwAxokQ9OJCJdOKsjwJuBdnL/MO3qoWxUeRVq/2zO61Y4YTko0NJbdUmE8ciOIBaSdtb3KReuOW/9PhZwtmW0XU3mvxU6DQeYP9kOnrUReDczyfw6pmpWlZXGXqOwMC5dZnJoVebLZ/uAcnXEcvTSwJvhKCS4M0yHz/K4vhKa7RL0q8v+xSPKgpHUBcTJtjkVwKROryTMHLdZ5RJGfd31SDZk9PbNcg21FDzoDdYAc7lqIdphbhlTOE2Tycqq3dtfExibpC9KWHR8T4B3+sBF83zw8RxPNBXn7Xw9EpA/SGFUifXPQ/NQJBdUA1bERPEvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tovnj7p+U75+gOA8jny/Cl23y2xlcDH6GgE+4Rs8nf0=;
 b=k+FsT8rwFFiPxqxCC05p6BoiNBZwwgBwbpKwnfT5rgf++dYDD5XUEtIiFWKO6sQCULPXbuBVAo36c6Ns1zEoppSn6CcJ4qqnaNyNoD6Gcm8XAoiI5aigYYZKLwMEOytjFswJE0WgBIxaZAE1GxvuOGDd2ShL8r4Jbbwkn4XlOvP/zDY2GSRTKZuwmlxhwq4XNAh73N20hoT+Qs4gt6MmWqkLf5dx9Ct+iRp3NPAd9pSrAXX1VdAt5X/HAwmkb/3WB/7amkeCQv42REhW01iX/YXUq1o939Io9k1yuglIzq5YK2yN7HEbPkIzqFipLLGgu090KLuzyEcZYuzK3iyQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tovnj7p+U75+gOA8jny/Cl23y2xlcDH6GgE+4Rs8nf0=;
 b=vM4NWv2dvaao9uBNH//5bP7R0FugZkaCwHSD/7oTbza/23NLnTmiRugS5T36BINymOV3CUXF+7xAwoJ3oHAj5JCewvzv/9QdBNzCr47cXZrv1Y75fwKjgCxatIxb9hgGUgB8l4ZOffjoH1uw+M34daEkymRopkil3wSxhJXDH5UP21+BsK4ZG6YFI+kI4KPre2AclsdQf4z1wC7QwcR6M7Oo1vzYO9gxU95jN6wyyYj75C+T672f9b/raaakg2YbMafXl51R/E5JuFeN6ghsAD2F2ahoHEy5qwVI84XJVAMYmbwh7EJCMmyYxj+heDhPq9QkwAf3uFTXKNeMdD1LQQ==
Received: from PH8PR02CA0052.namprd02.prod.outlook.com (2603:10b6:510:2da::32)
 by CY5PR10MB6072.namprd10.prod.outlook.com (2603:10b6:930:38::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:25:48 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:2da:cafe::25) by PH8PR02CA0052.outlook.office365.com
 (2603:10b6:510:2da::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:25:46 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:25:45 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:25:45 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:25:45 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFPjIm243104;
	Wed, 29 Apr 2026 10:25:45 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9CB609ACF4; Wed, 29 Apr 2026 10:25:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 01/12] meta-ti-test: Create layout for new layer
Date: Wed, 29 Apr 2026 10:25:45 -0500
Message-ID: <20260429152545.1029757-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CY5PR10MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: b532cff5-30a7-4974-fa51-08dea6039602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	p3v4iyWHKx5TkZFTKmXjAvqys3DpP4elaE9hrxF+gc6knxINBUXDRL6tWqPnKwl6gwwVKli9261jSA3/jkyJZbGda/4syjYi40Eq008T8bh/ytL9pY/sY1CnWU0rDL+INA2ZQXqOFmGxMNpIf2JJ2s/KzoIVZoZDJlSb5cX0meYh+8UuSguMLK837wiujrj1yqiuqSwgc8elUTpUGx9R1i+Axlft4AhpkCyrOs2gRA9uViCmRpG5lzPocaivQ5n8WgYNY5kVyZOk7WsR5vgaVdRbGH3Dy62qN4lL5J+KxMnWlvKw2t/ZXNlujK+A+82wWOpPwqxJS4+pf497JZG7HisAo1uM4nwRupa5rPfRnprudxK+VVyaVvCxwChx0ID3SkES/hUktNFGEwlt8ctOEVPiM7WZ2O5gBjrCmslyIkjib/WVCHELE/kONm+pAnS/wSDkrugadz5Z3+F5cMXZhYKZScRnJA5ky9O/QVn10tFG36wg7RgA86q/mjt91Sw54Zk/9DtauTosbb+bTJrPk6IKpD0yx0aWdLE1vrdiK+nm+tQh7jy2yz8MAb9NRFhXrs1amCtKXn8pf0Pz1kQ0wlHKJfOno2KVqtBJ9Nmsm+2ar0HYME3shAz4bLEw55eUinqIvGYD3QHAeXEpREiBdYQ57q9wDEjta3LA6wJqMYYuw9bNKfOPU9LVcJOO19C0
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tL+CswB4b/rWHcn3MGksQwdvugLdO4nSqtXGo3YhnU+V5GWhkLzNnDTfkI0UtliNKslGrD6l8G40c5/SM3XDBLCF/LIRgXEbEyhBwAmBPTFvQUynSpblxv1DJXBbeBmz51wQkzjWh31arGxarNfidLW+adqozylSCNFEpDylEv2Q1ZpUSsA4jqdF7v51kxXJbo6dLXs1f8ejHv/V+zBErIjt73mv3I9JLEc3ah5SoDV5Nwuo2Rars/7j2OTWeuKEl9wNpz9KdOPv5mblhDNZNbUygQvyaCS1zSngxXPluGt5dtgf6tZDtciPxUI0LRtXjTGhXh9YvAgmYrv4+3B96cnKjFKotKXO0KSF0BV/vHXMTKyRi+iCpUcQ67PkGMQ0VB+JlhYP8kjuqkQ2izDukgGLjBseOpieiRBWy7b8HYt9WRi3bVN/8L0ieO7QxbZn
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:25:46.3761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b532cff5-30a7-4974-fa51-08dea6039602
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6072
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19904

meta-ti / na / 20260429152300.979685-1-reatmon

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
WARN - [meta-ti][master][PATCH v2 01/12] meta-ti-test: Create layout for ne=
w layer
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Create layout for new layer.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 02/12] meta-ti-test: Import the recipes-b=
enchmark recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-benchmark recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 03/12] meta-ti-test: Import the recipes-b=
sp recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-bsp recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 04/12] meta-ti-test: Import the recipes-c=
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
WARN - [meta-ti][master][PATCH v2 05/12] meta-ti-test: Import the recipes-d=
evtools recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-devtools recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 06/12] meta-ti-test: Import the recipes-e=
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
WARN - [meta-ti][master][PATCH v2 07/12] meta-ti-test: Import the recipes-g=
raphics recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-graphics recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 08/12] meta-ti-test: Import the recipes-k=
ernel recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-kernel recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 09/12] meta-ti-test: Import the recipes-s=
upport recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the recipes-support recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 10/12] meta-ti-test: Import the dynamic-l=
ayers recipes
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: Import the dynamic-layers recipes.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 11/12] meta-ti-test: Import the ti-test p=
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
- Patch Series: [meta-ti][master][PATCH v2 01/12] meta-ti-test: Create layo=
ut for new layer
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Apr 2026 10:22:49 -0500
- Num Patches: 12
- Mailing List (public inbox) Commit SHA: 8d7aafe8fdeb9e183f0bc2200227f6947=
ba63f9b

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




