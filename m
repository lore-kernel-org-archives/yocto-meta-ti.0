Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF96ACD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:51:05 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22266.1780397461609969809
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 03:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XuGGAP+9;
 spf=pass (domain: list.ti.com, ip: 40.107.200.38, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htoisHSQV2nMdeNjM0iEijOHEMp7Zb1eD1RyzxZ111LvBnF4FSZSrn/3qkMexj2RzEucH9EgmwOteHccsHDBSe1wIQ8AvaCAb6gSe3dYxNq9gr28FyZpozgOCQ+Lp3NOeDgb18Wtb89R5cowjL4807rGjzoTnuBMzApUSKK1XaENMjBlEUeqp4+Az4GRQzAX9VDWlveZCJmWJdrGjZnppi05vZkMpLWSPMTOcgpFuK1c2mKMuGxQNdSUkj6mM1FG/GVDLiEL5P8HKexHzZAnvAtZcWYEbkR2rmFPEBY/P/ArljdMyRN3MyOLzTX2vmOAfp+KYrq85AsJIPURJg6IiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbtrjzC5TTzW2nXnxQFsFvCUghEH3bSXKAmqZjHn+c4=;
 b=Ga2Cpq0b6C0+h+mqey343hVGP2xBlhrKVYt/8EtnWlsqR2fKOS97ziUeWvG0T3ijBalxdF/1+ErhP3LhxTjDwutBxBLkD3VX00SZhy0lN+zLMoWTlPr0yQ/GPGSb45XIoWXa8orYh0Yp9lkgFlbwszvgSJY9k+p9zKAaSh0HxBP+ILvuFlsrcgk1IS7NgUEGglXeg89QXGfDTshLXLd7VMoZqqVp/g1dWphIW+3aZ0bH4rjQAzpEG1tVlwv+VD//tKe6R+exasYbnYR1jgawtCHv8+BKPKtx0+PxyAS/bDsCDPK+nukHYwIhuB3W84CbXhwbSaApCYcuDSrzuf8JFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbtrjzC5TTzW2nXnxQFsFvCUghEH3bSXKAmqZjHn+c4=;
 b=XuGGAP+9zdiZ4w4yrRry6i6EwZyoTBQE0FUYZcqZB6Lrq2qAyVekq5u4mLIc/H/kFg9HQyLNbXW3+MiWm26RHr1m2a0aJLhHtMX21LDeXwldZz30WsI9Jn+ncaWSE6n7zjIiZ+FRUex9pf3vEp01E9zJeYvX2O83gIRLk6ofg0bzE7STScpyBufapPkWUxFHGG/bWJdPHcG2VE9Uko2imobWaYrS3VbAv31HmwP0ZFs3bw+7+oxUxDKV8gLITM3cLzlNhSh6w8wOBG65fpTumRirwI8kmelhbYvaTjmPdlPVkWpeGw+Ivv6qD7/4GZr63dCt6avsG7HsEwNc+/8/lg==
Received: from SJ0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:2c2::7)
 by SN7PR10MB6547.namprd10.prod.outlook.com (2603:10b6:806:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 10:50:58 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::6b) by SJ0PR13CA0032.outlook.office365.com
 (2603:10b6:a03:2c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 10:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 10:50:56 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:50:41 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:50:40 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 05:50:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652AoetL3704055;
	Tue, 2 Jun 2026 05:50:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CBE10138B5A; Tue,  2 Jun 2026 05:50:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <nm@ti.com>,
	<u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
Subject: Re: [meta-ti][master/wrynose][PATCH 0/2] Fix NFS boot on K3 platforms with bsp-next kernel
Date: Tue, 2 Jun 2026 05:50:40 -0500
Message-ID: <20260602105040.1167874-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260602104810.1068959-1-m-shah@ti.com>
References: <20260602104810.1068959-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SN7PR10MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c29cb6-4b89-47b5-5e27-08dec094d393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	FXROdeI3hShQ+cNVjKAQYMyfhDyUAWSYgtg5FUVjGXtrVvXvspHfw+7HZvMId/Na3qpEtQjr93jQ1JhkEwo8a0TACiFZbZ2ZDXL5vfLAJkgJfy41n6d+MtvQGscl/bFjuO17XKgHdMcp+nllgokiA3cugeVa2LpTOcjnp8upjDqG1u8RBN4PhAWJKp5UbAgjDFfLntNJsZQM4cy9BRvRbTQ0c1HLOgOlafWFYjTqOlWYuCOVg1c9Qkzlt7iSbVDZm2zDM5cvTs/Lye4WL0+Oan4/NLsV4wWWcajvSg7bNH6vV/1z9y5r1aBtT/r4RDhftCx2lRLTBczxwho9oCs2MRiiELDty0nkw8ukxBDCtULcKAr12a+MhyPCEqLrKncu3vdPgiFbiUGHSUtT+TL4KKU5lVbC1mdsFxgUTCBlLjr4WSujaJbDO6H1GxGtfnz2qcc+77IR9vBqlbP2zVPuzs7qVHiyFigQwCIwZsPDAn3sRK6cHaeV2ZR3h1mOcaEIYP12YERULwSM2OI9wUvDIS752GkDEIoyl5NsafCNrxHGfTtVHCaLSWqde0ko+71ZX7i0WNru00FAxyaw6BrX6semTMLhJOQ6z4JWp6ytZnmNl4zohCBT8oL6LVBIc+F64M6NpRwSuClbRLlLSAcHWbcDh24iKKm65YW6SIRx/OhkUvl6fYB3b7L1EFwrlmxv8fuZYDlJLNEJUqfdmso5veE/DECTYWa816Bn/ueD+WY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xESIWhwcNJC2ro0z4PE8oPGSxU5MtsEFop4QFI13P5KWwnKt2DTa/3/AVwqBe1+g4k/XtYp6arBcBd+I779aMIspoQ+HnNRx1ctPgq02EPi+10bCwT20GWngivoe8BV8aBD9z7PW+5OEezxhUD99Z87URHD7dYRKRvsLTRz3svV9R/gw39Q3dFtZ65PpxLCIfatoVvqC/KG9rDNZEQuIz5jsTpAW4Li+X27zSQwm2jz3Ior5Rc82YYWfwbdB3LgHBD4nbPlA/DFuCT2JSKLhDuPq210MPVeOG6tw+k96podyfsMuQD69EHhyrO8saPJpaV7TYA7wSibHcaSzdqc0HeFlHOwM1h8KJHa3zCDTaYr6i7ykh2fatGiCQPE80ZgwHJerzXJmcPDXJq0w4YA5DJO6IRyr2wiKNfPnbq66bMeFqV83VH9mqzoR8cxea914
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:50:56.9240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c29cb6-4b89-47b5-5e27-08dec094d393
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6547
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 10:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19948

meta-ti / na / 20260602104810.1068959-1-m-shah

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
- Patch Series: [meta-ti][master/wrynose][PATCH 0/2] Fix NFS boot on K3 pla=
tforms with bsp-next kernel
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Tue, 2 Jun 2026 16:18:08 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1742f2f1f00ab0f1eeac41115904bf1cb=
8a4f3a3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605272200
- Commit SHA: efd871d4eb504ec366027fdf6d1f934d2844a04a

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH 0/2] Fix NFS boot on K3 pla=
tforms with bsp-next kernel
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Tue, 2 Jun 2026 16:18:08 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1742f2f1f00ab0f1eeac41115904bf1cb=
8a4f3a3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Suhaas Joshi <s-joshi@ti.com>
- Commit Subject: meta-ti: optee: Update to 4.10.0 tag
- Commit SHA: 42558bf1f1b1ec3224a957e6ac51c7e7ec83b427

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
        meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bb=
append
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-framework_%.bb=
append
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




