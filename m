Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A821125847
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:16:35 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.185.1773242185546674033
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 08:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OD9r2qWQ;
 spf=pass (domain: list.ti.com, ip: 40.93.194.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOH1zzShJbnwfNSNlEMeMvHB6Fg6Swd352ANBRui5ICbeDliPkFW+UWEJA9EmKWczKZlE8XrjaPQvsGCSRgoB2ppYr8ixfetym+MbrC1LDP9v/7jnnPKiZnGSz8cgzvv5ZmAv5u1wrEnsq3z+1ggK8xvfsAEleJSNwhMk7/kilnqtSLMfMGqIHODliwupE3xFRUi2pa3vztvmGsQTRrtMHVxTU3xmdqlLEswwFClvqN8ZUUbYjfzzn9CsjsN19iKSaCcYjqaj6oOg9ExQ1D0w5ZrRCt3jbRPX8b9+D8T2EN6QNCZg4w4PZyCougawN+cxx/oSvu6SszN69HK4U9Ezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZA9Ila8MUcoMw8RYw805/s0PZF6dd3gIBSgF9rVS04=;
 b=aKKtrwDpPubK/of/xwqlVyp3L/XThxo/2jqrrhrFadx/+7sOqhaGO51i6i08SuQj3VUu2VHEmZTa5gqJF5tIEZNwER8D8xyLMraMcHkJun8saqfkdq8AVdz2TKYPruTc1gmuoYtnrXYvA0sp7efKOgM5QDmd0yY2clcxpObGpzyt6lwEV0GUCsU/ZC4d/8u3qIsEQRQKZ/hYC/gEKk0qp359zmYdfUV5cfnjUkONJyd7EXI3UOJ4IXFmjIy/j0IlfAGvyGaGmPz/JA4rw9EkolPV/cwNQj5iSSrcva2XdIrro3W8g/7fy54TytSWSfj6D2OOT0DBF1g6UcMwx0saiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZA9Ila8MUcoMw8RYw805/s0PZF6dd3gIBSgF9rVS04=;
 b=OD9r2qWQ2llsAY4OXYax05sAWtYzhDz/N0ohYMoeUYh2MCsCaD3eqYC94zjfYC3ogtaOz8rDLhe+fT/zu+SFoMJRyi97hohILtcEF58FXabO/C8lfnJ+8OHFgRz6P2DRDOZh/2s/8ElIOiVgTlcyIyRZh1USq/Wh55BrHlfxEMIFEH48Ywnm7kvpok26dxmmy65l6USHuwi/MiTymU1ixyjXW0OSQo8mEP6SpZiDc2i8Iviap3EzCct1oY2qTKAB1Y/YEYmT8ftkQxBjZhAZWV9bhHuhIoKcGDxa1I9xTRZoXyOwwNzuupiOC3fTzJorFFJ1Mejf3M7m3h43zNK4XA==
Received: from BY5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:1d0::22)
 by LV3PR10MB7865.namprd10.prod.outlook.com (2603:10b6:408:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:16:22 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::ba) by BY5PR04CA0012.outlook.office365.com
 (2603:10b6:a03:1d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 15:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 15:16:19 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:16:08 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:16:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 10:16:08 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BFG8Dr1070493;
	Wed, 11 Mar 2026 10:16:08 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 780269ACF4; Wed, 11 Mar 2026 10:16:08 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Prudhvi
 Veeramachaneni" <prudhvi@ti.com>
Subject: Re: [master][PATCH v3 0/3] jailhouse: Fix build issues and QA warnings
Date: Wed, 11 Mar 2026 10:16:08 -0500
Message-ID: <20260311151608.334597-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260311150100.3275513-1-s-sadik@ti.com>
References: <20260311150100.3275513-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|LV3PR10MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 458a1d9f-7785-420d-be2f-08de7f8125d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zHDnpyq2w5UVtpWIJ0XPYX6m6w5Rq8islkk6lKKRk5ZGfigjlpSZIUkft3lCpc86j3b/YNdIO3M51kOUOCLtSNYNkeW7D/WuBkICuypLHXZ1I/xjlP5W0mTxxHbI8kwrumftjmOdzmN28OxD9OEAOfKQJM7g8kOZ0z+JG9baMxHdAe9M0d+NWQLf2AnLXHYIE/CSjfj2RlJU70hK0/GxyvCmLf5mP03kQR1zVwgBVR9qlXdXLYIC3UZhu5POr4D6MXe7xIVvi5AEmSbeRJy0n1xKMYOgoREVWcjUWVvM0ec5IGcPqVYSSNvUYtKSpOcMKxEG/+O0p76VPjlYNC7RDXBt8z4dHJbIC35ff23jEj4O6NqxMH6oDkcv7U9toxSB/rwDofEfq7g6idNqI2wrJW3f7CyNYDgoJZW90yYn1zTvhCSbTRzSYGjiGrArIXfkbhlMABjge9t4fDebZlwIo0HA5KWVMwFxiCDLxNDFTnGb95eogoAljU05abcreP1qqusrEW8H5iCZyutdsrBUUigi6ZAl4GBV59XSrqEZnrUMjusCYAPilRBM3/C4/wZA3mqwz5I7CCQLZVkKnz3Ch85LGqL0TLAaMdAJ50Pk3l8dqqkaIF+2Oq9gU6PkkNtrqHDPXfGZQsmzHBuLlUqEdwTmjWV+NiD5Q2snd/PwcW9AslYASHK9Nab1ISl/ntZHHRQ+8I4pULrq334ucyNrBpNcX2lxQ3fc2WaHw3k4V7yEcbehE6WG6dQDIayZSOr1y2sEvy4Es2nRj1qxSiUT4g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zMzeDdM+Ak2F92viAkH9jm06g4Z/kNMf3Wch7Wg27YA+nw4g0Xeges+G4Mlscb+vgjtcOHIoPVHaeAqgSxoCwotu+PX1fVhCmpO2faN2ZeVQ/4WxugmBuD9z5sWSuGL4nrEkajcLKojWOGO6C5z2NjL37C23XD24V4X5dfmWNfWs4CWIPg4YdApvdJRZSp9XndJdUWd4cr8D6uk5FhyoHCQAwjTLS/AboW0p+q47ig/5P8McTsSEFXU4tiXoP8tugu+/yww7fe8n8jwXvI+zoHdzBzH96Y72o0U/p8PvycELav8KjEAhjStrWgSeE9sfNgTUFkBw1+PV5Ga3+ONgvKsnplSFMyXOAp6mo92NjkNSB5C2LUozNAtgeZmqpDwiCdjoVpDbOi/Py6v89Ft/QR7E+3daTNZjlIc4bVt9QTya5tR2QvKPZjhXVrmsmaTU
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:16:19.3975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 458a1d9f-7785-420d-be2f-08de7f8125d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7865
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 15:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19702

meta-ti / na / 20260311150100.3275513-1-s-sadik

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
WARN - [master][PATCH v3 1/3] jailhouse: Fix JH_RAMFS image path
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH v3 2/3] jailhouse-inmate: Inhibit debug package split
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH v3 3/3] ti-jailhouse: Fix buildpaths QA warning and c=
leanup
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
- Patch Series: [master][PATCH v3 0/3] jailhouse: Fix build issues and QA w=
arnings
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Wed, 11 Mar 2026 20:30:57 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: b09bccac47146e8e86702518896803353=
ceb4e5d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 2976bdb6413a80438ce1fe7d4056105f6385f019

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




