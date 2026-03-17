Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E6F33817
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:40:59 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71240.1773736852491406542
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 01:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tnLVDPVK;
 spf=pass (domain: list.ti.com, ip: 52.101.56.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9xr46MEip0Lb/J3Mf0tWC0IwzEFCK6RkQghiuIrWvQFsbwwOnwmGsfB0wphyFyX0Kpb7+1YRVW0jAM5ipjhWOfwXBMgD/jdYR7ro6jwB2f0SD+IlWajCWXyaBOiDCqMUfKtvKDL3Ixo29YgglhlapTyjUgiry9+2w7sw3datvUNX/y4WBNRD++RRJ+KYn25eGfN0p+jDvycR+VEWWx7rPtdeLpE6/3v6933fl3kDur1PO3opS63v8ddjgLvzVzS66tpX1RWEP8S5GrD35OOMR3NG/oIzgZKbcL7zGHVZL7514tdflkrjkhSakqS7Wuj9Er8OUJ7faAoBN51s5nyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37pEDMK9oWfBvgJRPzeYfhyV6nLNQlLJS7kCTMKvL5s=;
 b=qgBhkHeH2X5WLfuGT0cUO14MHmObQUvDnI+wWo3YIqDli0oVoU1rIo5AGs6dqtgjt49PGcqSIurdx4NMX/Tlc+r+0KJEeqev23Bzr2xDbfze2nqIohUhlzPWxFes/8SUkdrCZfkxK/Co1yYkl1oiMEbAqhwo1BFha3m7TNF3+uMsy6OEYOaO1uaQAdbMBCu4zSMV4O/e7gBwb5gRBH+cpCj44m6RRUSFOuJYNwb3VIn3auc9r9QLVecupoppgE0VvFgijBkbjxRDoTKulaRrPzW41y7HDqx7TCElR9wuMOFV8l7ItrKaEgptvF6KoU4L2HED4Qta+aJw1aYSXQ1/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37pEDMK9oWfBvgJRPzeYfhyV6nLNQlLJS7kCTMKvL5s=;
 b=tnLVDPVKZMHPqAnCZpOhQFU9vw5W2W8QVdY3UL5NzFN9OxNhx6IjIhUFF0HWGV6RaOIM+XIdcrHHPF225H5M60poMbNULpoq9qsnTCYQNHYkGcqukXqgQZovYL8O0Mxb1H1zcXXJHUA2VXTh0N7qy/W8+949hRl7CF1r243N53e/9W8LhyVm2gY19ZcF3rDs9cflRL0GXC4DxtFj963nxXXnoIVYqyULEmhqGZuxWEthVVgdwv1LLZQtpw8c9iGApRT0bY1Bl++uYwKS7a+iU6wbJBzIEnSLAFFYz2/hKpdhwBNIUYS4y02u3u2QTm2nUjS1Oupe35YKTwKzQOMdoQ==
Received: from BL0PR02CA0047.namprd02.prod.outlook.com (2603:10b6:207:3d::24)
 by PH5PR10MB997709.namprd10.prod.outlook.com (2603:10b6:510:39c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 08:40:50 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:207:3d:cafe::1f) by BL0PR02CA0047.outlook.office365.com
 (2603:10b6:207:3d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 08:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 08:40:47 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 03:40:36 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 03:40:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 03:40:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H8eaNo2380679;
	Tue, 17 Mar 2026 03:40:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3784E9ACF4; Tue, 17 Mar 2026 03:40:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Leon Anavi <leon.anavi@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer for PocketBeagle
Date: Tue, 17 Mar 2026 03:40:36 -0500
Message-ID: <20260317084036.3635287-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317083729.1640948-1-leon.anavi@konsulko.com>
References: <20260317083729.1640948-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|PH5PR10MB997709:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ceeb51-bccb-4b01-5be5-08de8400e2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	juPxN2bcSO4TlhyMq7PxYQ0IeDYRIDGlo8+KRhvb/b9CMXo6f8O2vpG3NiFRm1ykEpWPcmhedoLHvrUTRELJ4i3E9XzOeTOw6QYsEpD9jJ8J4eCy9f/r6m4k4wIaVqg6JntUX5nclRusTyCBs55wCkX3DA+XwrfFl5Yq+BmcRAZ8qMDgFZ8vF2JcTVsoM/s1eYCdfXNmsj/DbCCRKBWY1K7Uzm8d/+F4dAybK5p1UmAUYLhisCgRkgLCu9Z7rl0zhW24I2XHiApcZXBMdsgwgCb0gFtOfXQXoWRH7o0bW3euee2FS3tTjf7mpTApecIThvTwlMTNdIW1kDiL5dgyAzhlqO1O9ezGQUqHiq7sT2YycVRGc1ZdNNdD8WEcYHPKTcldPbTPQtYt7+WbrTjc0CcKtt6ZIHENzKVt1lxyOJQ5Js5YwIQ78wk+9Ze9DIBOgJALXoyeN2NV+Qwl+zRi88yNojUAgn9qQvkPDvLoWAtfgaXaVy7922U20cgTS73mv1xLc5qmzZ6wfZraP62BExbClRfMT5yDoPLVi8+fVrZRQv3jVGTefDHoHlOaKTMXb1lJY3teON+vcP/WFwtsr28eVWeVmVfKkpJrkT5r4KkmisGglIS4CCpHpZmOhbKxv1Gzv5cibQzN5TfSJiMBqFQgWDkHt/fs3Zd8vyx3sDXi9bzucIEAn2zJVCeR58hPUlhxbhQlAP4a19+MalP4Vt+xKnDDINjdQo9E0fv9z2gh+cwgbQ/dzRraHm5E1GQD219q8VNzAIw3uNLtREfVSw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pP102gmLWoI5VA30zzepgcEvAY3HebtbHmX6choFnol/HDlP8mZCCv4KJBdl36Z6Zl8od26wOSpSCFiTjwgGBdggPyz1/dL7Mcyu7VpIL9PxKNS0hqbXdO7dkhSc4gEo5NyHfOf58+uv9XzE3iOQiwSWFbB3VWPYo9s09XrgM4GPCrQOpKOR4/oS3Uc0B3VQBxh2SlaFeuSod/b8RoqHegJ1VulryiLb3cQ+GLy16A9S8ths8qQtSq5QOkltbtjQHH16H60kpofJGODqZSUb6R7aFofoIIY4wvzBrEK3N65wnoqLozTJOW6rWuLqpn/44Muw6vlsu2fqjE3V2pkdyb2aDd+pQKE4h7UTsI5yQgBXZRT3yc/eff2iNoaXf8HPphzxlna2oEGa7GQE66oitgNvQNuiO7O5D+HZ8fCfyh3wYYK2aUa20f1tFcxSZv5F
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:40:47.4764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ceeb51-bccb-4b01-5be5-08de8400e2f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997709
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 08:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19733

meta-ti / na / 20260317083729.1640948-1-leon.anavi

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
WARN - [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer for PocketBea=
gle
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:55
            Subject: [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer=
 for PocketBeagle
   =20
    WARN: Commit message does not include file/recipe name: u-boot-bb.org: =
Add a tick-timer for PocketBeagle. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer for =
PocketBeagle
- Submitter: From: Leon Anavi <leon.anavi@konsulko.com>
+From: Leon Anavi <leon.anavi@konsulko.com>
- Date: Date: Tue, 17 Mar 2026 10:37:29 +0200
+Date: Mon, 16 Mar 2026 18:34:58 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fb58dade2bb8bfeb0b70202050bf34254=
ee64c8a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 00d3d9ec970580d296870c0886bd6836c3caca0d

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
        meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-d=
ts-am335x-pocketbeagle-Add-tick-timer.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




