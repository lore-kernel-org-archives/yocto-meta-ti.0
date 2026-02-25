Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91864F55448
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:49:18 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37651.1771987753146386947
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qggvppeC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.51, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufLaolOJEPZXb3t6YFrMcW3X4vUYIOlQTCpxZHrYBUlHblUAIBbtBg2yaUQ8NMKqyjGzEoBBj1vk6RD7f+dUdZwQ5l/nnhhImLr1OPCI9/Wu4mfl08Fnq2yN5/Yh9rPFQnyP0j+M0ajXZPG5A2MeK8RBgFzcoRDXVfM9r6rBlVoIPgsFEH613lT+Z4dq8KFcPDT3SF5362Hc4Fy5XcKIKFNMxfP0U64SpqgC5tqSDkuNiyO4viMEnJzMP44OTY1x8MboXqd/15j3hCulJTESfQm4GobhM7e5xm/Ghrx9xTUJ616AK0r3c5p9J37I63U5GrHvupWX/uHCgsv/Fsy8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLr04BVY5XXLp5bbke8O/lmXfsSecVaARDFychwmsU8=;
 b=TykXgQJhnP5s5P7vsL+6i1GLluvAJwx8U9hEMFdBCT/k2G4P/F/Ms7RQSfgUXJF3yNqELvRCUY8xZWPJoshc7VmnFG3L2Q2iiPoUc6JVqEppnh76Xzo9EPm1mMNhAH9r6kIj+FJASv6GUxCSQqCiQtDtesOnIwcrKEa7JnXCh2cIG1dC2dp8YGIm4lHb+ersC1/U7R5h7OWNs6nyfBuoxFTswID7OrOhjmcPzjtFwOaXEVQC9wKWa4gmperUKbUzd0rsARv8gp+NQHTqv2I2BnDUUNlk64cpbOs7zC80jkLr2C5NfTQaS5/KGJeUWKLe3fpLrwRYwRLKAwy0LIT7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLr04BVY5XXLp5bbke8O/lmXfsSecVaARDFychwmsU8=;
 b=qggvppeCYjfKCxMXqAHumMzxlq/PZvpD20byKagAZNstWnuzRbfjXvLL4WKP9GwHE2ss2iOrzGwcm9g3YnYXvvZqNaMo0IyxWQxRugl4NEwdJ6DthDY6Zj6kasPL5YNbtAXANQn+38DHpmyw0XqXDlD3ixUZwaUIa9gvzF5n0P0=
Received: from BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17)
 by BL3PR10MB6020.namprd10.prod.outlook.com (2603:10b6:208:3b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:49:10 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::a0) by BL1PR13CA0132.outlook.office365.com
 (2603:10b6:208:2bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:49:09 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:08 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:49:07 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2n78U3837111;
	Tue, 24 Feb 2026 20:49:07 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv4xX-0000000CCdX-3Grb;
	Tue, 24 Feb 2026 20:49:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 4/4] gdbc6x: Tweak SECURITY_STRINGFORMAT
Date: Tue, 24 Feb 2026 20:49:07 -0600
Message-ID: <20260225024907.2908365-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225024907.2908365-1-reatmon@ti.com>
References: <20260225024907.2908365-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|BL3PR10MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f20093-be7c-4340-6b02-08de7418734f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34070700014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a82p+9iFdp+Dg915ZG/8i8an+RXQvifMQzY4Mq/m1PyVZthJE5ex9yscD5oe?=
 =?us-ascii?Q?WG5h3BPrOM2oE+PDH5pXhAdd5XIWxfwVUvdNPoN0frllW7dAs0Rg3KnrNgnU?=
 =?us-ascii?Q?HW/cHHvmM2+OnfFowsz3SelosgNv3yXr7yp2NlYRtgfr1XV/CMu6FA9CZmsm?=
 =?us-ascii?Q?4Uj4BFPGpQgxF9P3FuLvNk02TFqWLvD30ZO8F6+/qsx45x0w2FfqQFtpASgR?=
 =?us-ascii?Q?boFtMG+g3R3Y5GbstNqgcBol2MsBY6kLi0UWd5QZULKxWMLMaTTA4sQk/zhb?=
 =?us-ascii?Q?nTwxnLYQx+NTlsvSP81/OF/aMe+APvgVTZaM5jO+WRGHFfyXIvm5t6Fi9uig?=
 =?us-ascii?Q?WZsqYDYGQYpPjQDs3U+2vJhpdTOd42H8nb1vGxt7OIm6c/rogXzp6Nz9wwwm?=
 =?us-ascii?Q?l1m97/XJuVm/jdiW1zfx2TmQN+tTu0mOYnf8poTZUlwe9fLLBvxV6oGiTD+G?=
 =?us-ascii?Q?95atIw+la330CJqBqEuXJQ3tagYoDaytFGHcj3HsSoewMGPQVjnOrPWCmN3a?=
 =?us-ascii?Q?m2MlfNg2EPObHyB7IcvkM55LDBzWdWMCkP9ikvkWro0NoHzvYdRUD1xssS2a?=
 =?us-ascii?Q?U+iqzUK75AtGEWrSL/AOHh6r+NavMnQOx0mYmp9u/C3sw4PZ8UR2la9alrKa?=
 =?us-ascii?Q?tbkN1NB2d8Ig2TRxLy2yGpSnZlgGfuVCFylraD+K3/aQg1Zfk+eNmHgXiDrs?=
 =?us-ascii?Q?uPC4Jg92uUA0uSejCBxxucYs5Mwly1BryX//QicoDUDSW0ejMMQgtrwYHdwT?=
 =?us-ascii?Q?f/dQdE5QjJpCo/dmQQeKzz6MTI2All2YyySUdBjHM7t7ROnctKKYT9+mX7xG?=
 =?us-ascii?Q?y2+cNW15vVRChvbRdFepv6AfDMWH+c0OLp6p3UrNNdKTpC2mshHtF2rtkwMU?=
 =?us-ascii?Q?eP8Gk9qJrP4LIvHlWa6bzd0vsfQfk2LpB66tn8GvGgWxBYKZ8PssyPwnHGoo?=
 =?us-ascii?Q?MRd1s9AjeTFIgrZPGZKNaf4GxI93et2T2HyYVV3pPR5GnSYA4hI5eDtBrrRs?=
 =?us-ascii?Q?Bem5Z/1STXAFz8e/ENGCRiWZy91N33VBK74V/HuVo6DKR6NPJBTyWumopnd1?=
 =?us-ascii?Q?36eZzaAje/aMs4Nxj+ZoAmgdDkTHDPW23tbKn7uBY0TNynQnrcMIOy4QEdcJ?=
 =?us-ascii?Q?7GJDdoFao+8qgDj5I/6bjFjcGogAtXOEWtO7vwxzQdXG1qUXBWdvkXr2wau0?=
 =?us-ascii?Q?GT2lJSVSr6o8yMO19dU4m4kn4Tbt15tZiQS/6A4io+18C1NW+nJUzVJ1DTxE?=
 =?us-ascii?Q?SvG+iT68cagq6PkmHNSC2Q16RCBqnNS6tcA4TKPtZPuiwpKvisqp9LTjUR1F?=
 =?us-ascii?Q?PwM5Ut6DC2JYd2u0hddYpRz5ZJE5Qe38jBXadkoiHsyezXLNQbxGR0UnXNlM?=
 =?us-ascii?Q?vy7faH2ncoC3FhobjMM6NSxKxdzTDi1BxveQ/qenFszegAK5lw94PEyXA/8c?=
 =?us-ascii?Q?UGzOk4O6TZi/6MT0yFgnnpwf7Sl59hE0WrXBIIEOO1DFHf8nx9Us3KZc3Xvy?=
 =?us-ascii?Q?CcJEguko5EkSAD3R9NbbIM8edy+R4Ne2/d6T4ahD9CL+8qW9l4gzDDKFc7OU?=
 =?us-ascii?Q?5fl1ToLJWZxWiLDSqKR4xYJatb6GKF9yZzb64RyfHoExmtvIPKTX3kmbO3Cn?=
 =?us-ascii?Q?jwhRoSmniOWP37aZZQ7CxQu3PybKOD23wFhS1bdONHfE4a4jvUGA9KMgMZIb?=
 =?us-ascii?Q?Jw019w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34070700014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Am3vgh0H+py7jT3lFX84L/QEB6tA5+/qtAvRHXnX9h3uZNYVJ22TIIhXvoFiV5SljRxGNWmmy8SRa7a+Pa7Goj7lPhpJte/BqBzXgTxBBHcMZyqLQsXaAJR8T4/oUJta8jsDhUmkUNAn1B0wYY5IRdzZRfV3xgFhxVfi2QZW4yMW5HwgB9iRzG817GHgQ6zNclhzPBDTXdjCgd+SAzrWl/1bGLZqP/cII1wMPQjU8QqGz8J6GTCFhB0e50Bc4LYzcD9xp2pZSKG9DRY6fHWKvCFThZk8B9e0m6QkxWrzlJ+kN1yc44UpxRSRzFkass2nMLQt7Id+4QL9mBp5+0MbpYiKAiGUvk9JzkSSsotX0IqLb92IYU6v7rAu0NTIG7GGt4vEmW9IvXhuAmAgogtTzRYI4xi5gZisPO7SZr53HEM8Nfoxn4gLG6z2JwwEK02H
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:49:09.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f20093-be7c-4340-6b02-08de7418734f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6020
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19598

A change in oe-core [1] has turned on higher security checks, but gdbc6x
will not build with FORTIFY_SOURCE turned on.  Remove that setting to
get it building again.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D4c2d64c10a5=
b0437ab1ea04df22386f0f95124d1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti=
-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 521d06fe..6b90b4f0 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -51,3 +51,5 @@ PARALLEL_MAKE =3D ""
 # Disable the "buildpaths" check while we figure out how we are
 # going to address this issue.
 INSANE_SKIP:${PN} +=3D "buildpaths"
+
+lcl_maybe_fortify =3D "${@oe.utils.conditional('OPTLEVEL','-O0','','${OPTL=
EVEL}',d)}"
--=20
2.43.0


