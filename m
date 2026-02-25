Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA180F5544C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:52:08 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37558.1771987922895238238
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=a3hFIguZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmKcm0qhgW3Tik+DrKTHEeyxhDTnDGZGq66R5u4aEJuli4gJS6iJtqdjTJu61x2/NBlIB9MHL6mGHO5mSliaR4BESghK6XkKIymCzOftLCcKrXCgAqgSnu01s5HL2W0Kp9XKtR2sCU7zpcc3MU/HzlOsl1IhP3BqrlBzSlOxb3SGUHt7TnvJjFjc/D9vUZi96qAoLE68PCi9jgKSwf/r5qxPHmkoPpjFV1+7Y1AO3arv+g0VlpoidxcYXbXS7rm/dcz4z6ucmRuvcnHFydTvGKp9Utu+L6bXZgGsbU/dPQYcpQWnCniK72mMg9PEvpLWMHUTYY0GnROhNwVpVWg2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4k+qNvmsTV/uYXQVa2c/JaQrwCKdSPfzgF87NFavB0=;
 b=mPLLBRUv1agBv3EK8lRqgaASoqN8OEB9bUJeP1ojwBL1OWVw3sKghm3t/VEadw0X6efzKqdbKU7EoATH1bLS/pPttWwKS/bnjRrXTs4HnogEYzPLsND6mFrK6766MT6Kwd89dsRsn57X/+vVKLkCrMK2CAhpQv7YOeeLK3LLBiS30WDVZ7zRCqmzRjXRozoNBcLOqqGOscSFsNXWsZ/jagEtrK4xewq0DxMdo3wh9UkVFomld1FciNaMJyBdqDp8o7cb6Sdl13b3E6J4p6m5APMeIHhrnqxUDcrw7tlQT4hFgLeWqDMbaD6DlR2L1OfHhY/pfPiIhqYXD27c9ieJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4k+qNvmsTV/uYXQVa2c/JaQrwCKdSPfzgF87NFavB0=;
 b=a3hFIguZYOaggnK147j7HuKu+6PtZH6uIo6a3Sp4dz3kUoaC7S84J44dg+LVZbXeO+7D1P4jg9cYY6u19qtj4HnoN7qTt1QwOYASnB/a0Yp9501nUOTyc2haxID0i1Nnl+vFRTWTFgfHcY9O0BXRJJRhGODZpQfKWESjHQm/NMI=
Received: from BYAPR21CA0004.namprd21.prod.outlook.com (2603:10b6:a03:114::14)
 by LV3PR10MB7983.namprd10.prod.outlook.com (2603:10b6:408:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:51:59 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::f0) by BYAPR21CA0004.outlook.office365.com
 (2603:10b6:a03:114::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.7 via Frontend Transport; Wed,
 25 Feb 2026 02:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:51:57 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:51:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2ptfk3349482;
	Tue, 24 Feb 2026 20:51:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv50F-0000000CVjQ-1sxZ;
	Tue, 24 Feb 2026 20:51:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 20:51:52 -0600
Message-ID: <20260225025155.2981821-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|LV3PR10MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc2ddb7-da24-4afb-76c5-08de7418d77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34070700014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WqmIpdmhDn/MweoMgAUulIxne/HuaWdgY6O2dttc7+8fBBmTbKH+jmL+BB1p?=
 =?us-ascii?Q?74yvKe5ZtwpDpWpuHYkSBKbdRCbpcxU/5glSEgFBtnFzUUThQNqoPb9ckTV0?=
 =?us-ascii?Q?mrB5eDSXKzqQ9EQXP7fGWvqps1xyP2lW1lEpWr4sXMzo6GkGwHaxRabEGW7Z?=
 =?us-ascii?Q?YhFygusWky7NagY6qkoFwzbFg6TSNBohTjT/oxNa6blBFMn/7h6WMH3BR+PJ?=
 =?us-ascii?Q?Z/VxSAYaHzhzkEKBa4goZ/nt6SydJbd7Vw3h+hhNRNYrg4lQlWrPEy2P2yoU?=
 =?us-ascii?Q?4Yv9twXFp9HQcPE/yqZ/6TGl8Uxfi1BASKpucje8NL63KNZ/LCYtrtCgC6H/?=
 =?us-ascii?Q?u/3qR/9sRzLv8nJSfjX9yTLvgvG+xVYP2tWb8FPhMMVHPJVMEF8R/kaUmQMQ?=
 =?us-ascii?Q?DIamQE4BV70OKkJZKYvHWGVX96y+hVso138dmKcHd/eOBaOvU8Sn0Sfu5Qio?=
 =?us-ascii?Q?F9aT7CjTLRyKh1OsxDkZJhHGyZLVV722KJkMu2o8qqeb9CIvvDNdY/lBdGo6?=
 =?us-ascii?Q?nyp2WH5Cy+CdgSTb2ifT7Wh2KeAwYnauZFtdivaLcH5r/Vduhn2Tu7o8GLpY?=
 =?us-ascii?Q?1kxw3GgGqzM05C+P1NqwRJfD+dACiqfZVsN9WEcPHINU1OxJGyBp7pcIq2Ln?=
 =?us-ascii?Q?A8Lsr0Au0vc93X3ip2uZSNEQyOiWHE0+zPiT85daGlBTYRaS8DsoGtQKkGNT?=
 =?us-ascii?Q?N3UK8TjrO7V7/fEqZ+YRzCOmC3oGY+zkg62F66sou7802shOUbj+7+Qx+4By?=
 =?us-ascii?Q?4bCNH+r48D64/CJ8ctubS41lRO/dQYzMLyvriz+qeNT6HXwNEikIXoQ4Oz8G?=
 =?us-ascii?Q?ee4vcSOB5G/yw2e4tHHAp//X5bAldMS61HeDE8Z3oexPNM2tGHkesfQHRvym?=
 =?us-ascii?Q?f3jnFR7RizE6CkkHlkOw5B7WadRqz+C0ibmJLgDN6uEPumJiNy3Veh9OKhhg?=
 =?us-ascii?Q?EAE1369BsBlfdsiOmlL6Il4mfMkr/3K7E66TWc1YvcU67wRf/y+WdJCi7GIB?=
 =?us-ascii?Q?ttQXGrRU7a5HwBd21R3n9qtnQnnA6vCSSM6qn2y/wrbFM9cR3YrTuZRr19V5?=
 =?us-ascii?Q?Z3m/tlTq10FWgebIuomk92UuZ/v8XsbLJlhSh4UFB4OV7KxThhCFYAk1FpTA?=
 =?us-ascii?Q?iQPhMKGuBBhVTh8EqBMPQAaErK+N5RPHjdVHPn6ikj4ZCAm4BCit13hQgoDG?=
 =?us-ascii?Q?D0HXws8axTVHVDVgozlfAeEkAfxKSdRxP7Z3WwcQhgJFAPOKnzUUX+QSpd/H?=
 =?us-ascii?Q?2GlFB+YGpDw7CWmRZ0psYWGFlCL0N3m/XR7JVzwzmMOyDcTNhAw2cFHCVWzf?=
 =?us-ascii?Q?f65iglsLd2L5r7sHEdIVR42gwO1a1POFeDXTY6Gg4gR+MdA6RTZhDjephZKO?=
 =?us-ascii?Q?GKgafpDp6dBXCrEPejX4kv0pZa/p4DOUZKOsu38pj1jiuU6k/HopOiP6i0h0?=
 =?us-ascii?Q?TDuXx3l++mV7gd+E0XaEojNMxoMh2mDkVlnGPPxZkPs5rOmg55nnoH/W/Zoa?=
 =?us-ascii?Q?TgHc5/TNgD/QtIiNH9QAkZSXucC+OdaAx63DEFczzC61bYNzrxpUllhw9Jti?=
 =?us-ascii?Q?B+2aG42dDxevHo7fUm7o9Y9iPSdZ8hnKM5UpCnH0W+pIdOnPp9tZ3LTthYTH?=
 =?us-ascii?Q?Sqd6jHSXtNQGzbYm5hMx7/Gh70t385AKdhWYdj0+0eVmMVD7d5bWsHeViQrL?=
 =?us-ascii?Q?S2vdZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34070700014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UrepoNMGR3Oy6trBCn+lKQ4obHizvRz7/OaZWyD1kzwxqiN1Bde3k/qirj866GzhgvlLcJXpsLtqVxZM9E1l9vfN2i9vBnnCSqhO0s0ZA7z3lKriaf0gvCrCHvEVVZFjgmlH613/nwG7dPx+K+2RnY6ws5WIXTGOIx2j3zRD1KYYpl+hXTv3G0A7IJ6vDG40nna3G9XR9Zr2ciaFRebGsZr0H4Fm9FmevISDmkMFj4/v+fh+BKXIhvGvFDPRhBKhqZzNrfgAa9YR7BzrTgdW3doi7ste+2/iTb5wdbazwy82g1E7iWbepd4g5ZJ0jRu/M+aKF6j83VP+Q40HTQK4vse0uEgv54FttUUaXktgXVGNxp0ablaBHoygs1lie+B5uFetw8Ym2ZiohAuTQpyfTGZyQtuAvwFVJkxC1xD9K28MXNmmJlgPLt0CprlaTHTP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:51:57.5081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc2ddb7-da24-4afb-76c5-08de7418d77b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7983
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:52:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19601

As of [1], static libs are disabled by default.  But this package relies
on static libs, so we need to allow for building them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Moved the setting from the .inc into the .bb file.

 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb b/meta-ti-bsp/=
recipes-ti/ipc/ti-rpmsg-char_git.bb
index 63711a3b..50565300 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
@@ -5,3 +5,5 @@ require ti-rpmsg-char.inc
 inherit autotools pkgconfig
=20
 PR =3D "r0"
+
+DISABLE_STATIC =3D ""
--=20
2.43.0


