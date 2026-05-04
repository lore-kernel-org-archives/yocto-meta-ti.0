Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F97EFF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 16:07:25 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18502.1777910841230381193
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 09:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=YQDWkKgA;
 spf=pass (domain: list.ti.com, ip: 40.93.194.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAducpmyxE50kVlpPXlvo7EPYg2Mid3OE7nmBOXTmrBTCh2DyD7OXtUhO2r47pukEJoug5SW0XdnTLDmRZAFh9W/R5fKKYVWKK8ZYcuIhJazs8jhngp/aOWU0VJh5GSMcPBanFH4O7cXggQMXcdvavl6WUD36JSXxrJNXMWImSx/66xTnzUiIyigOEkdXKXM18we5RUbk83jQCKIwkypN03pTkIJpcGw/nGbKVJBjMLDATsrPov9GtRplTKAajxFhRypmMYptF75IgmczRWyrUeh2GKak2xWNVNReZZYM+nDrQWs4hT4c1IK7pK3JIYfqq5AXQjYrIo5Vb5s6VPcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3W+IT+HszWdKPFrqvfrnJ1Ss8x7oYcn6K/bbAWdq4s=;
 b=oP4BqPk2GpemCectci/URihB4tlDZ036GMB6oy3nRZSDtG2lsUWWgPMnYFV5sl2NA74JIfkVKxnKDHHrdx8l/IdmQPndV1LV64Er7iSRiDMuOTWe46LQH4ZBbGxUXKQvJ6e9x/QLYRe54z7MO30xnH++CHoLDSSj2AWb1jc0kmU0x93EbELNKCBgLarALW4rGBvRPDzUyBQ3fxcLBzaibb5fPO6BICBEEAUEja3Y+jDjVD9NUQfdSjvdE78V+lxCBFN6X//D9xllTU4mQiPC0Mf978PedsycPAI0hzo1RXFvlnrJWTX9gGQCA4MEY1UjtKe1Thbu+L4LWOih55M/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3W+IT+HszWdKPFrqvfrnJ1Ss8x7oYcn6K/bbAWdq4s=;
 b=YQDWkKgAG+cBs03E+ol/4O5xJ9KTqG/7BsD2ihPSMLVG27SNGyDh6+4SfBgwXsIDf8OkPt54S9GLbV++29Q3bb+a9PazJfohFIwetZvDO1LDo51UZk8RJsRYPTgf9cPtQR/88UzCq77cxIuZB5DqyMtSv34JmAqhtUx+PZawpYHhe6DslG9f3kJqNeZ+KNZJoSHQAWi9yftHMJUsVj5QUs63HHW//w3D0JQlxDmr4+L1TuzKHhE7c5sChFoerz9myTPynnfPVL3koErnPd3cTVAuLObQpfIAvX1DGhGTtsmry79D5mACaT86M1XpcdWEyB4E/pWfX62FQN5cB07ahA==
Received: from BN0PR04CA0130.namprd04.prod.outlook.com (2603:10b6:408:ed::15)
 by DM4PR10MB5967.namprd10.prod.outlook.com (2603:10b6:8:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:07:18 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::67) by BN0PR04CA0130.outlook.office365.com
 (2603:10b6:408:ed::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 16:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 16:07:18 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 11:07:03 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 11:07:02 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 11:07:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644G72jj218958;
	Mon, 4 May 2026 11:07:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D0B03138B5A; Mon,  4 May 2026 11:07:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH 1/3] meta-ti-test: layer.conf: explicitly depend on meta-ti-bsp
Date: Mon, 4 May 2026 11:07:02 -0500
Message-ID: <20260504160702.4163926-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260504154714.736175-1-denis@denix.org>
References: <20260504154714.736175-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DM4PR10MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f074d6-c895-42bf-da9b-08dea9f73761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	JH/FTpjDPkB1mdFK4NCv/TBMmZyH7GNhX+lWzTDdnhhvCM6MOCFgiF+9eZ/Fcunif5MCnYu2rSPtuqJ6+7frfq8RLjbsU7J0eyvbhNk1mncGmsIMF912jf4Q6yYEE2I5e7YztyK30IbdTt7R/z0Z6O4fDDV2xmNepe+7Jo/Uxrlg8AKV8gtu1R8kpddiNiS7wYuBo2kRxBGG+OrwAqLBSeaxOf97h6TCYmq+qdbOzv/0WcKnBK0kat6QUdaHY0WA5Gi2LVfIZDawQuoel/ab+FU571nrNww+M6kh7Y/L8lHT3epMq+nOOpjZJ4nv2/8M/Nhu098vgjijVfaOND4ypWAxY9hH/AGskSj+vSKVN/FKynJEaiJvo2qPHOEgUSQ/SmdzgvSgLv+StYh1n88na1Cx5sLRRAVOmCNZtV5QZOO68SLU+elVRhS0yBAFFVzXKrs4j7AcrVMMALrGLPb2S8c5OaMjmNDQtmzxnECqGcxrwmQRK5BtzUioQFXt8wOtK1FcRN6x6H2cdw714oA2XF6P6d2VLuSatVI2HsyzDmr3C3kZ9VL6NnExea8ykMzUADmkptB7nddsBkVuxryjWcXYr06G6ace6RoTTCuWom3h6Li9bU2/UcWKoN+8iydDZFZ8zRaE063ucqalvcqZYhd5NmV12kAulIPb2yIT6cVDZKKuryytyg9Iz3CcaontTCHUr1vRkM8L1TO4l+kxnHzyqPYwV0m7FH7CD/UgRXE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YFKtjRLf57K8al0fEDqGLWkr24BmOtJ+NXVwlXyU2cbmZ/En7U7fNoQhGoPdOfWb8ASbAeR66vmBtoO3yQsvGuxibuMfvTNS8uT3KzPSFWbL7ufazws0scGSQjMBi0Zfbr8VzMvoY5tOex2WoKR11Tfp4acO1GiZ4KmcRLT+lRylIH6S7R89DFHi9EyoEdk8knUyZfr+cLp7+Wmb8CfFja0eMQ5O/2sCs4x8wLBIKUbE9tq6OqrW7xR6JX4T9Vug6txKUr8HTcpCa1aD/RWDO5/IJtWfVIcLFV9R6EhPQLf5DhDqdssGDXlEEX7PtirI6Y4XZdZoHmjJ2gg6/r03t+wn21Esvutl5GkPCm9uTQxtljV/V1dQytwvTVfCc4NcqA9o2RNlYCrFKqajyJ+8B2or2bcwdAq1CgoNgQiGKEMm/fzQDksI5pTBFMM4xhl1
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:07:18.3090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f074d6-c895-42bf-da9b-08dea9f73761
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5967
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 16:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19928

meta-ti / na / 20260504154714.736175-1-denis

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
WARN - [master][PATCH 1/3] meta-ti-test: layer.conf: explicitly depend on m=
eta-ti-bsp
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: layer.conf: explicitly depend on meta-ti-bsp.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 2/3] meta-ti-test: layer.conf: recommend dynamic laye=
rs
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: layer.conf: recommend dynamic layers.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 3/3] meta-ti-test: bc: remove unneeded workaround
    WARN: Commit message should not include directory path to recipe: meta-=
ti-test: bc: remove unneeded workaround.
              meta-ti-test (COMMIT-MESSAGE-3)
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
- Patch Series: [master][PATCH 1/3] meta-ti-test: layer.conf: explicitly de=
pend on meta-ti-bsp
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Mon,  4 May 2026 11:47:12 -0400
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 65712087d99e39648e566c92886a7b061=
651fe3d

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




