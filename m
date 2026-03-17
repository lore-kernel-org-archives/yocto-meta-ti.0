Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B18FF6E93
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:41:12 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1847.1773787252147174270
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tLGcIht9;
 spf=pass (domain: list.ti.com, ip: 40.93.194.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdEJa2xXZ86R7SOgIpfqkNkIlD/G319vEpK9EjSBdz930lP8MXwGC+8+RbI9GpYw5qhZWdOkLiNx3aoPc7PAdv9IzIOjamzuCRQCCb0P9lktl5v7/5FfpU1qXTktqp6AcGH8Fm0DEZuSMRVF06YGJGu7GNaCiGI5DyeD9guMGyE9hivw2ufv/ZVeXUjukhoSD689HELRC1qNMC1nH4f3CQCYrPkp7NuxnFUqDN1KnFv0u2JAo+MJ4QiKJHsOF+VflukQN08ifUFnjSyuLI7reiF58c80UR0DbAo3dWDugTFKSC8a81UAVmIU0wobYXTussYUx8VHwuO9Li6t1Ki2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d33bsPwoEoX9FGWLw6GGriAVmPR28EmFmr+bWSxBFkw=;
 b=rOc7GoK3ueve60gqfOMabAdEnXlDDeJtJsXlgOqY2nCrENGc3kwAmiWXrhstGcUXovcCTsQotM8fDeLnSvWSRZfXH3ZpJvfGARXEvuxN94BXKRDIsfIeo1wrIWOv2YEho9ziI+sW6nJcj1FYAJmZLX2QalcaAUMb2/DmGaF/Mf8xu/G+CF0Cfnp5ZZCW7z80uuvB4P54ExnsCdSpZTOUMcVaiSH1EfIB4UsqcaSqP7z3A74Cv9pVLgBfksY82I2qQLTVppIeBPV9vtwFhhxnywkXcd1tTNZF/gTXmuGOdlV6u2HsozlxppsRSqTgZf6g49PFG3977dmC6gC7ZADFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d33bsPwoEoX9FGWLw6GGriAVmPR28EmFmr+bWSxBFkw=;
 b=tLGcIht9QSO+72mmgaTeCPdu0N7WXsq5xK7XHAnmhMjDcoF21qkxZAS6Bp35fgQiOTUiYI+pVDWI04ro/BWWOo4XHFd/WYXHOohmZJraPMLyEnOL711D5piog/Q2pEjXzBC77MhUvFpk5J7MyoHD+bBPw/+drS/xVDrz0XGs2ZwOQQb7yCQ5SXMHDXWnvVlLc5et+yT4Xv2pA/Ls6CxsltlGprHADPlJjrL6ho3sww/iOWqwI8r6EgMIgYWzcjmFYMOQFIvseK0ZIfYVOT0Mswqs2kwrTAyJaHjT/6/H/f1ftpurvniKUH1E23DBqmD8mBY8j18vf4sGAPhXcxvz4Q==
Received: from BY3PR10CA0009.namprd10.prod.outlook.com (2603:10b6:a03:255::14)
 by PH7PR10MB6506.namprd10.prod.outlook.com (2603:10b6:510:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 22:40:48 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::a9) by BY3PR10CA0009.outlook.office365.com
 (2603:10b6:a03:255::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 22:40:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:40:48 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:40:47 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:40:47 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:40:47 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMelE83093566;
	Tue, 17 Mar 2026 17:40:47 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9E5719ACF4; Tue, 17 Mar 2026 17:40:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] layer.conf: Update the layers to support wrynose
Date: Tue, 17 Mar 2026 17:40:47 -0500
Message-ID: <20260317224047.3892383-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317223608.1973962-1-reatmon@ti.com>
References: <20260317223608.1973962-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|PH7PR10MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 972e97f0-1e12-4e4a-0e16-08de84763c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	l1qQMxXXo1353izXC6QnQ2bYgoOdXfjQGFlcED8ClaiYoyuP+jju76KYdLQNoq8WOhDoD7hE/afKvCyM9yTir6PDssSzb+9e2P8VRr8O7Bd8BXRDyQQpbhdpdErWEy7JPAXmSk0psyY9rpwRfce8cOkfqlQLiBX8ip+vTj3WdZ+chGViU6utjhcR+bhtsWF79VHmNSccaVvjXh2BDXpO7dsWVC6kLUjJMpqCcc85gKqi8aDGpu/ipWenou7FyWKerO0UB5XDhvDbJXq9c13ck46esFlBWcTFFslOvdGzxSRW+Lf5Fmg4AKnl4kriDeNxxKzSrAMiJgsO3V7x2RWmZKm4uwYZV4nqBMQYQczZBzPGGxOdIBwSCFmfcvZeOkEV+2Ru6MHj2Canj0Yei47wBXqKOkpFx8KMDq03Ni/wdPU/0k+JcIhSLdRTg5QanPdxwb3ERi5tcew9GaKxh0dewK0J3XuX2jNE9VQs+DSm/BSOU67HfHAnCb0y5t0mrZ61IpiVEuonCGxNESEUW/sY59sDFaXQilBM4iVNen0DSFTT2GtIcYD5iqfewZnWRLZRcKQlu7ceTndQFGX49rVnkSYZayFAtRTLSxcTYlki6bnIlnRZo3yc7yF8fwbSg775exgv0hx4DYa7tvSd0p9nfgnidS9oJxaZ81I5v6Zs/RIaMPtLIDYpGqUoS/4HrkVDrc3aGF5HOFsRivxJdWfCD4q41KspL6DVfNsBML1Vaj4r8uovH6FLVdsV/4u7Sds6WpJme9534my0IaSpCHjciA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nrgbc/ah4JXbUvZRVVqXZGrHMFWlYO6aOIjpbIQngwAGTeXWDEO+SnZejm4ErW/+uzQiRwPjQ66lmQHr79k4zDy92W/elbTxiVuBcen13mNEL1Z3iZBBLwq1sxXurqHY67K5mByO7A0EzO7s5IgJl+MFkvRfBPxZfTnzJ5sATXmVPSiryqzIwAlTNfXwp96dGM79hBb2Tyi8dqVUgj1XaUzPkgpHjlOOM2Qmlj+I+7uqL7R1Is4sJIhMNaWbVwsF+BH7+eglGhHDx2/PLToIa0Gq3gEt4z/ektu3WVZSMek6UTrqLiIn8LJZ0yUP8S2qNY5d8BgisaWWh+Oz0qRNb4B6l+p/Qyj78ue8nm2641RzgFW/Sec9o4JfgU3+ie7g9mtzk/O4bn2G8X+r0lbBTP1hLL3X6h1qlMUsZFBE9kcNL2/18jma/5KgU/Mt2YWu
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:40:48.4316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 972e97f0-1e12-4e4a-0e16-08de84763c48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19752

meta-ti / na / 20260317223608.1973962-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] layer.conf: Update the layers to s=
upport wrynose
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Mar 2026 17:36:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4dd012ad40961d0b94f9fc5a7a2e2e80a=
c191885

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: layer.conf: Update the layers to support wrynose
- Commit SHA: 0dde7f7b5ac2b93fabf28f6de445fa5d2067ee93

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
ERROR: Layer meta-arm is not compatible with the core layer which only supp=
orts these series: wrynose (layer is compatible with whinlatter)




