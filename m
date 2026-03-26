Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF83106F2F9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:50:53 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50208.1774536651868707269
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 07:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Nyz+Wbrq;
 spf=pass (domain: list.ti.com, ip: 40.93.198.51, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BM2zhR13ZOpU+sfTISD+xKKhkiSfM4q2qGc4bbD4RuzjroI9ZPP6ZsqsRuIB9ntkH6SYu1XRFjW1SjRy7N5OodW5kZST+ThLCfU5XgkPynxo+X46vTpcNK3ClyJ4YTxAh0R4K+Wqd7AAT7H4V0NJz+869Hyde//4hV7/brnMMKTPEJuc3lfvOrkmc7Ly/FgxGZKwa0CKMV8uXIwEryp45KefewMkFfuBjymT+87N+huOIKZjmGVM5E6Ru7BTFAFalrnmfgAo3QMtuE9nNEmyuu4737brC5gGEE9k7f420mbJjbHQklV8KL9ydWKVTrJgXZA4KBX7DtGs+owxkWS8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SydXvJGr/XT9o/N3IC5NQm7aBCBd2ZWBZF4BMQY73k=;
 b=SmKwWBshcGC8SiTjFh4jHOQtdsbB5mBjb3LkBONKMTJpmnok3g50a3q1tjttQ3No5r3Mf3OHNBBm5ukBVJjBUVEY/qVliKMno/SaNwSAofnM+yrJKJ00KR/WqZM+g3nDo/4t5RwKqSF6gDjyenmupO7/OvgF9gPRw6xbk/XaZe1q2UhJZcUXhwTcBwGQfPIjQigHnWDABS1tQE4dWjtNYYBoGqKXlhcBqLSBeRXURuhBOfNffrYpW5cVIsB9KG+BjKAFUDm/L7LssJKX8P408Kebx3ZQCj0FBjdc4VrWW1wSEodQHqAap9CwgkMwvbNb3yOB5Di09xn2ojEmHK47Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SydXvJGr/XT9o/N3IC5NQm7aBCBd2ZWBZF4BMQY73k=;
 b=Nyz+Wbrqjx2uujrqchMXs4jQ/IYCWOgciUG3i/0PBiQC6JTvAati7uWscxflabifS0npOWZoc0/v3FMZXjBXGiqk9FHC0QZc1RQoorgK/DKSqY2An+rPgfqVJejsW8IsMl9R7vr15yu+EqLVtBX2w0dLg9JCcSyzVwMPhLEdtFywBkgvnsSLGahNTLrF/o+/KHszqdM8TTSeRRMFRTdnqWNjWAtNTcg+A1+X9Gj9DEbibDxPLA8fBlWFxfQlBL/Kc82awk205KIc0oRLnyA+SFbSuSO1de9TF2kb3wWE39bNRUVwFHTAYOOjnVO91P3KRScJ8GHzY4vvxI/tZXjYFA==
Received: from SN6PR2101CA0016.namprd21.prod.outlook.com
 (2603:10b6:805:106::26) by BLAPR10MB4898.namprd10.prod.outlook.com
 (2603:10b6:208:327::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 14:50:49 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::83) by SN6PR2101CA0016.outlook.office365.com
 (2603:10b6:805:106::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.8 via Frontend Transport; Thu,
 26 Mar 2026 14:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 14:50:49 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 09:50:49 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 09:50:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 09:50:48 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QEomeo2307393;
	Thu, 26 Mar 2026 09:50:48 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id C9FB0142E1F; Thu, 26 Mar 2026 09:50:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <vigneshr@ti.com>,
	<denys@konsulko.com>, <reatmon@ti.com>
Subject: Re: [meta-ti][master][PATCH] conf: machine: am62l: adjust fitImage addresses for 128MiB
Date: Thu, 26 Mar 2026 09:50:48 -0500
Message-ID: <20260326145048.3730258-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260326144126.3675044-1-anshuld@ti.com>
References: <20260326144126.3675044-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|BLAPR10MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 608fae73-9c78-4728-926f-08de8b471210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	q2X7HRrmxI+GW/AHh89j+LlLhJHYp1b/HgBgRhSO5iCV2aEbHCfbrFTsPzJNYMtZgyVjOpgkTo1MrLHTCpMDTzb/NEyRwdbTK7QNLgOnxt46dvVDCW6vWT9X1s7HtAnVwrhwJahFlhpltpBzF0Tg0j3nx4pjs88pGdunqhh7py6CchxS0hh3ACkqr50qQJmvarsoBDCyJ/j7sFj6qis8l4izf5FuTwpVZn2YgOUWAp+SEEU5T6cULpa6SqvxkRItVk/WJMJrx5iyOBJTHUimIpIENWAPC40vaXCkEWc4O3QkW3UjVu8KCblm4eugi81aFo6AcxYLQdIr7b99zvFYjVuz5mQExlqI+f5motnjefii2pHtPCQAY4z3udusfXRnHZy4T2oLgDlf5vcbrKWF8Rz6YWDpfBZKXdArqsnFeFmsRoqdEh8Rv/tyPoAjf8jx7vM5/t6ylHmgwU7pSqnv2V8QaQgWP7Dz3So/W2PwbnS9mTevtOTOkItxjPobVqrtn3GEm6kbgH2F/wEmy31SuOBfvdEayi/bFkOdeQUqZwJU9ZW/Jza+He6kgMTvxhifZVdXLD8a+Y+TiGnPsLMTDuWzqh21VdFXZJBJsTJjRYL41SZ6xSf2ueycDV96HRwmFb2ZKOd5/lkQIGXnuHUxZSe7mV1RDxkwjx1SjHlwXgU1qy8dSjAILYD6BCpAMUOSjZdbRYfMG9b74rKarvmk3zPKaspfroehGPh7L59kXARjhTJBRtxgHi0wukdO2z574oNhZenHeeOqBSzFfOr0Sg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B7lQTQDD4fIrmcsS/qXIv2/tKkgngKIS2RQkL0q20JLh5PHfXgsfrrhm5K5vPSVPxeaf7PwQhFshCXx9xjk//yeA68YcYpW1W9xYqrgCctIolDbCK3dT1z12AomArcj0pWSiK91iq9RIHFaIxLGEM955Qlymy7DWVk1ms4kqpBYXb3eiDU4vYt7pCwAryYn8hW4QBIxpTIzTrpTg4hiyu0jh6Z8DjavlzLAC8i837KYIx09sn1O2MHZJFNfB19xsF4R5if+L+30iKKDcwWwHcsPZqb74m0IdkSjG4C7Ag+rqidn04pk4C2CL3xPBE9q5wCQ6pDtzebI83LBdVXwS7fW2v2/+xolk8kqwbYKa6R0FvVsMdfm0u+MBgoSmJuRXnNJ5dzAWym5/1RtlKWsqOkK6qufbh74Q5W3r3455aGLQmVu6QkZ+brkgQMleTH4c
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:50:49.4416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608fae73-9c78-4728-926f-08de8b471210
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4898
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 14:50:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19826

meta-ti / na / 20260326144126.3675044-1-anshuld

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
WARN - [meta-ti][master][PATCH] conf: machine: am62l: adjust fitImage addre=
sses for 128MiB
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: am62l: adjust fitImage addresses for 128MiB.
              conf (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH] conf: machine: am62l: adjust fitIm=
age addresses for 128MiB
- Submitter: From: Anshul Dalal <anshuld@ti.com>
- Date: Date: Thu, 26 Mar 2026 20:11:24 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a8890d14ecd64f9c35cb2e6c58ab961a2=
179c91d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 361f0c1251514c964c412af69b28d6061119ba56

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
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-i=
nitramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




