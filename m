Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CBFFCB625
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 16:50:21 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73578.1772815815699275621
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 08:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uw17BWVT;
 spf=pass (domain: list.ti.com, ip: 52.101.193.15, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxwOt/f+5LSSGzHp1a8p8l//4S7Qd+gSkdI7bNzQGWIKCxoE8Mr5p8v2p1wM9mA5Ub6sgMxhQc02goK6E/dUrat3nL8idiH+aKt3tPyTGfOrd6/dVlaL9bk9uXSGa+xzt5mWeSTk80NtZF02WJ/NB0rNuiZcSDT7JvpTixXCQbkZ6laZsvAYR06g0YCfpislQUwnbIBB4a4eoHQx3vc95QjZA6u95r214jLo2TdZn/DmvnIEkR5ZJ3Z5SweewOPQNj+BNZ1hayW9IwWwdn3T+W2EhZPQ45oAYV8jqeoGoe4xTItIH+erWCaKWrrku0RUNFwWqD1v7PkQGIThPufIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNy1B1FgLD0BZiYAoX0bJt/dNxF59pS5peWbwyeoqg0=;
 b=tzRcgYqNziFcNMO6MfgPRlGv/crQBgxSLPM7psEWQX4LLRe8zoEyZ7UlJBfHxgTRx1Qa5xez6qb6J6VwHEI3gj7UosonQIM16/23ol4bGtsMx4hpUvMqQns6WepwJIX5ExGxopbz9kdDzNFbPWbqgz14RF2mgCBcHsG0EGpRUgwLuvMblbcqVZfBlHHpYJRvgLqLn4qkKF+wPQB5Ims8miVEYJfyIpUIzXmQJBdMNIh4Ycvw4cnppD1HMHkOxehj4ZvHaOcjpCvWW35F/fyFmc7sZkAOi1kGxw7AHdt6cpyqmvbMtRpaN8k8hVTFJ++YcIukYWmnF2uxzSv6KhApWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNy1B1FgLD0BZiYAoX0bJt/dNxF59pS5peWbwyeoqg0=;
 b=uw17BWVTtTop46m1b+gzWp4KN8NsMUdwPPMwrkb63dImZ/yLWOddrEm/cGK9muLDKT+1VQ9dAUfBPxeeJ3lPlxMDZQisEIztzvW1NPmOlaSnelWOsxR9CI9JAobqMgRtgarokhX8wyXAj9IcrM1nmB0u58/gEc2+NwbQ2xExl7ltzkDH+qZCHwN75r1nMZkavP9QTXtKKlTigmNrbhMgyPV53kSb92/6M3zm7Cxe5YXXPfn2mOUEuvFUkOMChYMShMa1qTx18MW2MEoL5NEnTCJE06D4INm0rrmHnbcKMQVr5wN+lSyNvnu4oblkriFdFYAe78GwdK4pD08uraKe8g==
Received: from MN0PR03CA0002.namprd03.prod.outlook.com (2603:10b6:208:52f::31)
 by IA0PR10MB7601.namprd10.prod.outlook.com (2603:10b6:208:48e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:50:11 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::cf) by MN0PR03CA0002.outlook.office365.com
 (2603:10b6:208:52f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 16:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 16:50:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:50:10 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:50:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 10:50:10 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626GoAEE4149920;
	Fri, 6 Mar 2026 10:50:10 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 431B59ACF4; Fri,  6 Mar 2026 10:50:10 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM support
Date: Fri, 6 Mar 2026 10:50:10 -0600
Message-ID: <20260306165010.1494059-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260306163735.1316257-1-s-tripathi1@ti.com>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|IA0PR10MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 40854de6-3d35-4f6d-2529-08de7ba06e76
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	QwclRWH/fSJ7OYgMscqx0ron7fvikIPBlXysVWqmXh0qEzZkN9Cs+ZwNjmZAl1xJsZ/Bheq/F2NkgpHxe4mpGfTuDkun+dFS/D9nW90e3Onb5pOibEwcrnGxk7XMFtZHDBnU5I6XfWYbpZPOf16c2pVm2ck8A+Bm0KwWNLfcbOcw6XQ2czJJ+fioFZUu2MfU/ICI0jHrHEm2Pm5L08Fxmy6uPCTOzlK/WK7dq8pW9BCRjQAYCV8qOCQGc4N7yU55RJgXSs12FYgc4fPHPoLdwSppsMIO3vKK815N1eLDQL9+YkHwdn0uaAEayHIsIvLecJ09Rzn1gqC92C/Ei4EQOOTX+jqop152fFp5lMfVSdbvyzWg3xT6kLfSpJhEuqT3NH2G9q82DAG10VpFQODBqkXRxm+gwhyVHOcr3BbFK/0PwlmIfR+3Eo1D2dTlqME48LWyzsE0b5OfCrcVIL7dp1nc6w5NnrSPNwi8BNsdUN7RWxJa9y2L6LNDR0dshnmX4MHBkWF3IWlRc4hvYJwGCvR51E7nv1v65gd0GPnAV9J39PqvNRLc8n5ftwsUz03AJFjcDlw9yk4r1PzHVL4gSX6G07wyWXIw9sK1wBK53meyluVr4TRvSMvBB2FUasoBfDPMPqpN/xCzHbKNw7Fd0qSwsmNtcSkGyS+105ywt/CziO7ftQQ3ZwVCEM5duqGGhTK4M+3WslBIGYSGxCEhL59LyNGNQvMvtq2+J6KLmYOJS4UC6T1HLA0ZwTW15sc34duy2p+Gt0IKxC8hdDMnnA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	H9R35V28kch6dgpqww2wMjtEPyeVB/XsNuisv91u/3SNjE56u/jxaarNcFsO2NzPlmCNDrcz9ftk+HqoNV5bQma2+eWByYFT2Chzq5s9IeQ0r/1VACIrh3+Iv+IpJzyigfhoiXAaNdpMCfQI2u/H4MTjloh+vviGSkG1HDVGeTxLXekxHVnsSRMB7a0lcs1zrP+rLBY6uJsfzOGfsZwNk+8a2J48Q24NGmJgi6MsJa4cC1w38h/EtYseZip27pYgvUG4G6Z7GnjJeQRNwgeFmEczMmpbq3sov1KPLHkVoe9nMDgqhXmYafYUqx5PMCgVV5Vt1cWrcA1D7Jja6OaYZnnwPwMLNWzl4ZQtaDxhbnptFqbHCThoiS308OmMXJBEe2q9EEDJKZclWWiQXwZT6bNQ+S6HGIkJVJBrJfuFxFuokbS/V5mE8XxhyHt3ayeV
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:50:11.0201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40854de6-3d35-4f6d-2529-08de7ba06e76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7601
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 16:50:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19673

meta-ti / na / 20260306163735.1316257-1-s-tripathi1

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
WARN - [meta-ti][master][PATCH v5 1/3] linux-ti-staging: Add LUKS encryptio=
n config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v5 2/3] initramfs: Add LUKS encryption modul=
e with fTPM
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v5 3/3] ti-core-initramfs: Enable initramfs =
for LUKS encryption
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
- Patch Series: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fT=
PM support
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Fri, 6 Mar 2026 22:07:32 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: f8e3654a1ab4864627635a365ef3f5d8b=
4a09385

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: deced73fc1a79071913faddb857ca79c2f6c7b72

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




