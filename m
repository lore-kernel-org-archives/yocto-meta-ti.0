Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE732FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 15:12:22 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17093.1777907535369084985
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 08:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jrOmzZSh;
 spf=pass (domain: list.ti.com, ip: 52.101.85.58, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecvtf0fd96ju9qQz7hJFKPYqSKfpakyvCY72A0QbeEKnqulO0K9Qrqi3AAo4sja98OKZVAre+6+eLVYcPQVaOjGCy2bwmvjk7jeW5xB0JMmXR4eXiz2nGe1O9FbTFLAvsphRNrOO1IBwxk5/MCzH+KGSNqx/Nl2jPMpAG6zppwQsjauEczHpOXcviBaRMcG9dXVAd3BQNDWPptUtThOhx3E86PAuV1gQNBJpxmIxjfNSS61LYaDPX1OZy8ElcOqe+bdLxy0oGBhYNiKrdT2UintI8QqMidFz+cdQFlivnq78gMudmwfMwC2+zAPeMtSkCFAFCKTZ8c5OR1f7h+avVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv1DoW46ZJvcKoSaYAiCRFu3GkX30ndB4yfaW18qKuM=;
 b=UYpMuN3e7C9w0ZIgeS4K4gUqrVf18qJ9XSwGKVkqv9PY0yyJ4RhxWm+ToRMGX0MkfcItkidIXEZ8/pYt0ZR/vX6/5siPy+yZjQuFs5TWqaQlsgLaILTzacORUGv6Ar5QuoLA2OHG9kmteWx8G8u7/A3XGAKpRXkGHv8r2fBMZX+7yxY8gB/YtDDBwWyVh2vyppqWZGUr8nRbmnxecdcNJB1R446L1m9VdGfD3qB+ZFiePmMx0INgS5Fn2uCBLkTzad67xjxnxU4YaBrOyIlcXAA5foIasG1/3CijvV39RU0jUweJW+PZUbloOBze8WEzto/SXUFDU/h3hkN/yGrCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lv1DoW46ZJvcKoSaYAiCRFu3GkX30ndB4yfaW18qKuM=;
 b=jrOmzZShZ9t/IT5O7JoRP8YuAlPImFNbSshOYp0h2b+BFx4l64nEsTGFvKBEY5a4/ofh7mtvd788iLO7jQS46sM00WRZSJpkcWlS1imCgKNHjHhSlxEXrVDmRPepQwrMymwEjXBLGM9uLNnAnUUy9lOuHFZ8+U1848AmQsSSC4mC7k8uNsOOoq8oFhciw25Z4y8CKFFx1iIq49iIDfqnw8SHf9fMjSaVUJRKmJbJ7EbT8xfJI3XU0SqJoLk7mExgzoPhEVmF3o9SZfWSqb9/ETsbWuZ/R6TaVhcFy9Eaw+MfrJDXe4STmUnUBprdC1FpCmLOTNPoDLdmeN2oigduuQ==
Received: from BN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:e4::22)
 by MW4PR10MB6656.namprd10.prod.outlook.com (2603:10b6:303:227::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:12:12 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::d1) by BN0PR02CA0017.outlook.office365.com
 (2603:10b6:408:e4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 15:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 15:12:10 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 10:12:08 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 10:12:08 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 10:12:08 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644FC7fI3411262;
	Mon, 4 May 2026 10:12:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E42DD2A51; Mon,  4 May 2026 10:12:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] weston: make bbappend version-specific, again
Date: Mon, 4 May 2026 10:12:07 -0500
Message-ID: <20260504151207.3844498-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260504145309.731536-1-denis@denix.org>
References: <20260504145309.731536-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MW4PR10MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcbda24-adae-4b08-c5cb-08dea9ef83d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wG1DciSJaV0+e2W217hKKn6tMEnZ5/REVvze1Itg6GdIWG65qctukYJgxMSvoK24v4kPfBr3mpyhE1hh8JI1Q5z0MAdyn85rbHdaAjQKucV0PZc1y9i5ldRBtvumlWhaJ8hv6tsopYpl6+mUZ9mPD+VNDXoBs/YZtGySbT0ns2zCkt+8Sla5hHyEZZFRzAud89KziYaCTtQOTOeNjwy3nkESxCIpu1Jxk4vGNRbiiRXYwfDe88tiP7HxK6A88PuBjvZOvZExkDeRtl6QXPe7KQe0CBmId9WUQI4vBFjB883do7OHR39LD1lwDjz9kH3XsEf6/W/Zb3uXxLTwjlTCW51ta7SW8AoCbIbRqV/e2yI97ycZtUdUkcSTRGmlDZX5V0UPTGSlBXWt2YAO4gp6k6ljge/ZCc5G6JibriR6QDjp/Tol6n4v976W2qtfLmXvrlsEONfWO5tdGllLu6+yP2qHpYls8QUH+kx/XNp6LjuuPjPyondexjBjlaZ64JQzcTzEVmBAUTFlueNXV07bezRLzWqXRG1EM5pPdBkX9eCG+K3UrffbzcdpPxy+QSL15CtrBqgQDRmofWdi5E7n545TS25zhu7WSIMqg/vxMDfVjtWULvlu/qjLiqi5Gf1seGjp/AjgWULrYFpA643VjXLqj4B471iVjUluyUn0qvHJR2H2JGl3wOemhICm0MR+crzrfsHehqhbwXOVnrMXxmLeXGpjLttCKm5RjPOasiE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RtO9JPZIAWPMhGKSieSyGy41CssL7TpbTxFob+JJAzrMYVTk+58sqJtQPLpeOWJinBvnVAPCJGpjPLmZWE87AtaispdQmIJtD32kOvUCzA8WlL8fQYRqZFfQ7kuLogr5nIqpe51jbYvBShzHz/oFOWUcChwp3cn85AjYJnHM315LOsHiEfvICzg/Jloba7jc0ZzaLC65OO85al/Xbod1HZuJ678GyQdERg4xOQ0PkN/RQRnMCzOmymvrquAke3gWLaL3ykJ8aHpVLlndcvyWqaUG1umgkjjf997cG+IBx2Q8H1Exk4nRsxSt5XLKIz/rmZICqenVqCv/5r2W51/TM0+fCQDO/jh0cHxk0ZayJJP/9pCwEus3qmsO5FB3Gvk11IVkxYRPaidMDoN6bwbGLut3x50ow/1cAR5F/8fcIulqM5PGPrGraYYCTl5MVHx/
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:12:10.6388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcbda24-adae-4b08-c5cb-08dea9ef83d8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6656
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 15:12:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19924

meta-ti / na / 20260504145309.731536-1-denis

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
WARN - [master][PATCH] weston: make bbappend version-specific, again
    WARN: Commit message does not include file/recipe name: weston: make bb=
append version-specific, again. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master][PATCH] weston: make bbappend version-specific, aga=
in
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Mon,  4 May 2026 10:53:09 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 68f1c1e056041c86232231aa01fd07e2f=
cd9c9e6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 82ae4b828b3c5adcf725f73d2a91de05e4da81ec

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




