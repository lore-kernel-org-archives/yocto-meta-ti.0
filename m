Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DE8CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 06:08:17 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1728.1764655688662229056
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 22:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uvp6rKT2;
 spf=pass (domain: list.ti.com, ip: 40.107.208.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmVqgmAGr4Wr2WHGyBqyRYMwOATCML4fDIJlnlabKteA20WgyVqGI8AO6iaf0gVoc/8+A+fuBDfIWJk/+CBJsFaqcb3M4b+oU2fLMKborPvLKLaaYkEH+eKYR6S2B+2Z2uhyN+8VBK3Mlf5Z7tvZJF7qkzt+QeE/bKxq+nILxoV4VU3kXNmsKbnjLBY0vywQM37zy7SRJhdi87lQKx0m9A+7RDZ8nMe82wiyVPX5Fy7ZMD3UZ5gLP5G5IPqWKl4hP/9RaT4RszqLnENCFRxNjQHAq+Al+SatpZirgDXP1kvTzf0C8/tQGDDwf+quzfiHwDVW+o39pYVQrQ2jIm7+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZcsMtYAhBUpCLUA0YNrQgDjZOR4AMYvaRyRkL9o+Tc=;
 b=Y0nY59YgeduN3a+edR6SjzZIeMF5cYyugpaoh+4iw1DcLqZhd8XE6fhvf9hO7O/hk7P6GIVmPFNxjTzW2oisA63FmEkp8TQEPt2KRIRzTBy7wH79KiZqgD/m2IevMKHsqsePFmOcT7eFT5yJ1g/JSvzB0M6NHzxizZiOwxAqHSbVVyBAR64XWLwMwJ7+GGKbqhJC+efSVna6TTtEK4BNi8pFBvIvJ0L5yyCXgZaLFgLMV9CroeqkOsoyKTi8i2Wd2G1GujSbQ0bnL4p8cdGXvixOmfIlMNpztxP1HzOB++Lxy0hB/EpteoKo3MFiZpjJGZ/ypWVMyFX8RxIKlNOtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZcsMtYAhBUpCLUA0YNrQgDjZOR4AMYvaRyRkL9o+Tc=;
 b=uvp6rKT2QvLzg7MsX575ndIvHOctEp9vhzZeYKul3sqBvwE1DeB/3hZcTnEgPIQG4P1J5hmGd2ctoj/Vct/JXezRNAhycDfCFkm7QceS+YRuy/6aPm/8ALFd5BZOyrIBnI19t6cc9K2nqC9IDIo6lLqBn95SdtCQgZW/8rKx0pUI2x4zgNsHyEOFzK91UWHndlUq34LlMdoMnOr/Bhe37+gi1MokQM4rZFBXd52KP4QDqHkrA0aeRXosZ/8bGcm4SmZ13qbTURrF9GnLqnudm6BrseiMOSgBd3Bi/WswxYkPrp8MiED0wpTelNzlDjKxNm3zqx4r13AA1lJo9PV9dA==
Received: from BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29) by
 MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Tue, 2 Dec
 2025 06:08:06 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::ed) by BYAPR01CA0052.outlook.office365.com
 (2603:10b6:a03:94::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 06:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 06:08:04 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 00:07:47 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 00:07:47 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 00:07:47 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B267luK1698208;
	Tue, 2 Dec 2025 00:07:47 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8781313F525; Tue,  2 Dec 2025 00:07:47 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <reatmon@ti.com>,
	<a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
	<denys@konsulko.com>
Subject: Re: [master][PATCH v2] am62axx.inc: Add TPS6594 regulator and core modules to initramfs image
Date: Tue, 2 Dec 2025 00:07:47 -0600
Message-ID: <20251202060747.1958573-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251202055907.303737-1-m-shah@ti.com>
References: <20251202055907.303737-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 134f5e3f-ad0a-411a-41e4-08de31692840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zI86AAN46TTMyZNTKylTW9oHexCL0NrmkEgQzW07+X1JFGy//wofKbjmMS51?=
 =?us-ascii?Q?HVDLt8Tqdr8Sp96aONf4pagw68KXFveP+pQB0yUgFjt/o2WAHx8i5F0Jp4PD?=
 =?us-ascii?Q?fMQ3W6gTjYw9E9FR88ObWG2GL3r3TWG+GfxL9A2sjhxOq4Cbx+edaLfwcXyW?=
 =?us-ascii?Q?e+FWTzy+6ghlafFoU2Gn0zSyKZwkGzT6DXbJFYUXe5PKnKtJXGn3ogiDGha+?=
 =?us-ascii?Q?jGzf4yoagVye9HAvxR2jXXd9qnUUcDed1RchI1d68DI6y5l+ttigwNHeW+0F?=
 =?us-ascii?Q?8L77I7IY+lFdRyIUPMbnF5eiUjS4WsMCJJkaLMVUmzcj1igF3pArN7XSPwVW?=
 =?us-ascii?Q?4rlTjh5ZJSn+G6mZv8MF3zUcF8bDK4Dkdps/oqmcit+w/jIgSHuQxZTnyrEo?=
 =?us-ascii?Q?dNrV2/LOYGda/YKt22WT4pgq1ptU20cUl8+IyskZ9IODZ6mKVkL+k/NA7+yJ?=
 =?us-ascii?Q?XpAYWMXTm7x2THLy7Ty3Do3Uzx4vk+nVRuAJl/YZ0+SDe0kCv8ue3YNdT1+I?=
 =?us-ascii?Q?d32e11Sqkof9i8VJt+08CI5kU3vBMaOaQwm9yRKiGmdWirLkweKI5KvZfuXP?=
 =?us-ascii?Q?WzS6IXjN54TVHbvjfl+hosBA3lOVZp/uQHxwX8xcYwBs4S/DoGwwxSKE+8js?=
 =?us-ascii?Q?OdzWDL6g3+EzUkCff2Y9mosJf6d4ONwNGevkuk76EWw+0BXArmVmem1I4oo9?=
 =?us-ascii?Q?bWsK9bEui8r6UCJRMhUEBalhE+gvGOGCRix8nH7fx78cjkb3419YGp0CYNz6?=
 =?us-ascii?Q?IHCFwim+BrWyjB+DTfuJOJyX57+ZlAtsGdyWC+Z3t75uh66/GjylnNMn+4ua?=
 =?us-ascii?Q?Zb43YbPgWtLOtzFrW8mInKayhZBoDaMS3JsGadEWfwXQCi2k+nNeJMOsOU9Q?=
 =?us-ascii?Q?SCNKVrv02oCi6hY0zi2lHvaAQztBtC/txlJmKOd/KzBf11Pi46++LeMf30T0?=
 =?us-ascii?Q?Cw8k1cPn/x1pmRnjlgvqlPIr/0PamUx5s2mufbd2ES80Hgaxto2uQ1VJbRY7?=
 =?us-ascii?Q?QbML5pX2dRf6jASFX+cceEblGwJtzum2nzk8Ez0ClH9jDq9fEKwmGZwzC5rT?=
 =?us-ascii?Q?mvSFIsP6HZHFKGF8+TyWngFNs92Qe/0dEQRlOjow43rWQBrObKuyOOK5dTbM?=
 =?us-ascii?Q?S2c6KWXaknPbnjp8bt0jibyoFVz2B4EDV2nunyRImTCOF61K1uyop/5vWCFj?=
 =?us-ascii?Q?HYuOEoPF7MkweB35zpCvmtBiFJYnLYyxtS7pU0b6xgGOwjYUw5www9JCAW6p?=
 =?us-ascii?Q?BGhKL4ZgDCbZuriQ7k/LIu4bhoEIXO5a0RLEg1fHC4hZFOIE+brC20PVer0m?=
 =?us-ascii?Q?4oqbRxuaBdIsl33JGeTvP/B1BOJp+tLZHmSeoKStmJN1m9ke9DCRVo6pqm7z?=
 =?us-ascii?Q?JutX9mZaro3bQ0a0zh4xAyGg2L/EKvzhakzTj8nT2SXXFo63q4JVtr15lGcM?=
 =?us-ascii?Q?PFYH6RxvZlySJotmqLKE90DAVHSi1PyCkGCXjDLGRvVd/9i10DGHIhYmQzsl?=
 =?us-ascii?Q?fQZz/yUxpEQsOIQCMd4L25zEwBES8kWEciHoA5w5Q1JCa9D4nMbtkPEz/LyV?=
 =?us-ascii?Q?iYwplk6rN6jZ3iIuHg8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 06:08:04.9188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 134f5e3f-ad0a-411a-41e4-08de31692840
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 06:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19316

meta-ti / na / 20251202055907.303737-1-m-shah

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
WARN - [master][PATCH v2] am62axx.inc: Add TPS6594 regulator and core modul=
es to initramfs image
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
- Patch Series: [master][PATCH v2] am62axx.inc: Add TPS6594 regulator and c=
ore modules to initramfs image
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Tue, 2 Dec 2025 11:29:07 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1900e16f59d8cd3547016b151baa7438f=
2fa665f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: ef4a1171e41999582bcd0707450c6281995e956b

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




