Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05916D2F349
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:02:44 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64404.1768323760328907820
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 09:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=H1O8D81r;
 spf=pass (domain: list.ti.com, ip: 40.93.195.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BN7KV8rf2FkNjMVn7SNqlu8iRh7jVFZWazy7+YDDxrrovj1Xt6XUmJnekCbyZZU+BjfRBTzYRd0Mjo3ibTPVvslNIoPS4UYEXckHGiqimCTF0hufWS8kkR9WN+zedJQRjF55ndKe2Aht0/eqMdcp8pigwuT0oWaqJzsUj9JuksgXViNIkhYEcZl1yzG4lDtI4lFBS/pgqgyq9TmtNJWBeBb7L99NkkJdUeroRdLWDqTHSDoVPD/Lsme2t1nn7RpAvwnT0pJwMKuXCqqd0RhfktxJIB4ukTcuWPQrN1a8CdTokE4ToBjQhxrWcajGDbyJve1JxkgaLcsF0XC2KlrMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+fbUpAIcl/4hepRiNFSEOpwYHYhMBll5BcyMejrxwQ=;
 b=i7o2+QFoZWZlXz7vnHX7McudRAuuiwGspI2LmaXo+9US7Vee4AndAgD764iIlmzeVUQtQB1TV6Xd9826ZPSJlghsw484KICwy+XCiwk35yTE0PQtZSR0kJeUgt/BJhwM5zmMZ6Pv5IdG7Ae6HyUD4ji/MSYqXOp1UAATNJeS0UFwBMMaEC9SHtixAc/Pyxm7ZTCFNtRN5DcivGp5Fs4N7v7tj50uSDAlOnSyHOwgrJTBW8X47LANBcbPV3OqaSEd0jdLA19kAy82II6mjTzwbAPnDwoseYhA9rZ2TDTQhOnCKtTPofT4L5o37ayFC/3OC1+R8tupXPVacajzbAuzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+fbUpAIcl/4hepRiNFSEOpwYHYhMBll5BcyMejrxwQ=;
 b=H1O8D81rc+BwF8Nm24opA4r9vcAt+V7nbVOlfeo2e/BrnBGh3jqfUMGb0axbhuHNHbBidfyRIfp7k25eBjPA1JbuOJXwsM3iX10ySPv/C8MUGU0yr6BkD49RQJ7QYvDFk498PQ7FcgZuHkPYzJfVYU5KZyjyFt64RROoUbEep9nxDNkCkhUecmgkb99PjbOcobw/pqJYec3MmglXnxtFbZy4+/g3bBHsWkt6V5rAaWMRxOGdToksRusrQGeN8GldFUg0N2hpfXIJv9V4QeCnbcHLLUgb5gk4XAGWFLfYsJFs7ZdaizZcixdtQ6++dmffdpmbd26zm9flrRI5Yh4blQ==
Received: from BN9PR03CA0337.namprd03.prod.outlook.com (2603:10b6:408:f6::12)
 by IA1PR10MB5922.namprd10.prod.outlook.com (2603:10b6:208:3d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 17:02:37 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::7c) by BN9PR03CA0337.outlook.office365.com
 (2603:10b6:408:f6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 17:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Tue, 13 Jan 2026 17:02:37 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 11:02:36 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 11:02:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 11:02:36 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DH2aPT2481723;
	Tue, 13 Jan 2026 11:02:36 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 14FD69ACF4; Tue, 13 Jan 2026 11:02:36 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.01
Date: Tue, 13 Jan 2026 11:02:36 -0600
Message-ID: <20260113170236.2045651-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260113165053.2457854-1-lcpdbld@list.ti.com>
References: <20260113165053.2457854-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|IA1PR10MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e8eea3-aa5a-4016-6dac-08de52c58dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TCfKB5dFq40h7TUXk24NBi/Wdipap1iQ3VtHUau4LnM0Q6CxUVY1IIrslCfT?=
 =?us-ascii?Q?tQhqDDwEsB20G8QAhIS9EAxJPWqBdyk92pWhHtFei5nyTAr43ICoGU+PLQne?=
 =?us-ascii?Q?SPVVVXVVAl8D/zrH25JUEJTBVhzP+zPiOISKP2WxGB+uxitDERvTxSN86WIt?=
 =?us-ascii?Q?IoeyaLqn3SJ3SuhZ2neYC728T6DN4A/9VJ7gwgxEhvZ2l/3OQCD/9aun6lti?=
 =?us-ascii?Q?PibIp9yoq0r9KGrVKxgAXsdRYoimtBSaCE7FzWbQv6d9lzkINkbzknfYW81e?=
 =?us-ascii?Q?Oiwjivc1TUV6BbviOzr7j95Ggalxq5KAlTf6h5mRzH3R0U5PzLvXCYd8MI14?=
 =?us-ascii?Q?nm7RssXXWX7IuZ6z1r7klExTunTwKYr25G3iLK6zZH+XMYOH0rUjSt7wT6ou?=
 =?us-ascii?Q?tTdRUhp+9WozkavZ/5Qa2GAbPIEbld3LVBtVo+YLXNWSgCufR8rSt+nf1TBA?=
 =?us-ascii?Q?y48lrBdw15NDqXdePHASdy31hzYq7EuVfujmrKnsuvglFMYFE4QasA9cVVxR?=
 =?us-ascii?Q?psWbG496B1DXigb5siGh0aLwCU9oAh1qfuj6gRgwDiPjJ3BoqlJw9etbju1T?=
 =?us-ascii?Q?cFPn6JzpM2w/7YHCM2vcmwN7Ai1pPDYyCMzFQSVRGywUsSSTpJed2uxt8ToX?=
 =?us-ascii?Q?ABu2vZP+K6BtBprig4I7+hUmuJ27K+44oX77BTOqcIL6elKo8yDQ5k0p+/Df?=
 =?us-ascii?Q?Y6U5vM4L9oLPUa3PAE3peG82iQ7a6snihHhsIhfmGgTGUmUBr1pDeDZ+s2hs?=
 =?us-ascii?Q?jgBmkcRw2x9woAAgl8f6aFdboPIHpMAff8HczZ6UfG9mwNZkwx+9ztPD16nc?=
 =?us-ascii?Q?xaC9OY9FIsKod+mgbnWCrIisb1Hlx3+Z3z4aBnRGHk6GFouzxMaIVvGFR7r+?=
 =?us-ascii?Q?VZkpRTwWNhO1EQURatxJXvwbxxhF2VPsMfv8D426xtOGLHOz+Gk5wf4cqhZu?=
 =?us-ascii?Q?DxIbUqbtCCnD2wKpVKSBQdohB3PVM2YytLxkorRnoqqf07L/RUN7aWhdKWaz?=
 =?us-ascii?Q?n9gHbL0OMVLBNjKASh5lZtjKjCXjkff3RRp4BrhFMdzaXREQsfCg6jZTyc4p?=
 =?us-ascii?Q?qiZeUX8izMysIylWlnUo2B/vFC+IcoeQVYMoamUx1GO5WMFf3uMjfR1tfg3I?=
 =?us-ascii?Q?4tmNSdP6PQRWRN7aRMf/KGChUqba+cYxPNFFXFNH9gV0Fl/BcOxpuXcgTGDL?=
 =?us-ascii?Q?UvFChD3yS781B2k5txNYjIp3Zysq+rFETQIhj7QcbqyzXPX4EvQVj+/ZmIBC?=
 =?us-ascii?Q?FZi6llKzUcfXn7KhvFXoGQG9rq3scfVuFqZss3/ykBnbwZ++Vg9N54ZB9wlN?=
 =?us-ascii?Q?ZhCOWqaMFLCp7L3DTr3evpTLUjJ5hibMHVHXHuA4Ua89Q2RQknjEu1jB2k9A?=
 =?us-ascii?Q?e5KOmA/SVT0VZCnkSbIeQWJBOkVwsRTEw6Xqe/Osgx3RCuDJN4EfgosAardN?=
 =?us-ascii?Q?N2PZlzs7PQgllODOl6+8mWcNooRzs6SoMnR+kn1sw8RfpqjdMQ+vPbDp3rfw?=
 =?us-ascii?Q?+f7Jybx35gmyPV3OYVDtLpbhF7+nOKMIXSjFhJmnus6pV2BTiU0wIHsPz6Ms?=
 =?us-ascii?Q?mwFGiok9tfxSdLlYLM8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:02:37.1883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e8eea3-aa5a-4016-6dac-08de52c58dba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5922
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 17:02:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19413

meta-ti / na / 20260113165053.2457854-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to vers=
ion: v2026.01
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 13 Jan 2026 10:50:53 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 50477a85f212fb8075f93017d80dc30c2=
78072a4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 53f8ec9a2f1ef9b4da9f61755410fdd6a0232cec

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




