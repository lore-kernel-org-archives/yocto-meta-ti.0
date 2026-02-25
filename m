Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA310F5544D
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:52:08 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37560.1771987924087501328
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ht4IMiyX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.54, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuUpgkQ0kktXMIgKsn4ieQ61stkZQsgJ23PTU09eltT9CTvBzabVRRnOm56OpznKbRnNkYI2ZohL2jm5UHO+sPRPfhwHWPwOtXfuHiTewvtUJlIHcSog/Bx0SYUSNRhI2LWwT0pzeKC4OCMK9MAz1jAply7eoc6VzI91xa/kV1JHZUHnAIhBvyMP8KSNMazvv46nTRdgbCfHJTI8AElGesLotxVLCbOQURXzoGwhiPmYhvPgi9mpp/0bsJkUGnzsMEvPE32nH6AMYAIXQJhVZjL6xBAKYxmlcLbvj3rfjBEx4ISNxztXrqX7yzlOk/vd4M42AgzYkm7mfx9W0/YQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zp6gBgQnO8yoKzShx3thW7wcTFC3GFN/mtI3KDjho14=;
 b=MYoyAfAqf4F9ochOFdnz3w3Y/PdmqJw7tj3y8fvE7WE8VeALfy8BSCpOXz+dtti39M82kuPTeL/zQ+hitALjS7wf2VAd9Mb4zi3OdBxyR13VJJRMKfleYtQEFXzCpDkOVRl9CC8JS3Rmh0fcYA0I8//QnB0LZ5j2TAJDqbTiEi/Nxfd3ZxZewvldvbg3sTQYRJclxxlcD4SKgJl0UbnmQLrZGhBMrDD398HEAzeTfsiv6m+2d/A/ani898eO3MC2JBGrW5CvmeNGG1gsARUoOB18rFctt90r8g55F51l04XZ8nkJ/JMF70bH3ORiGw1f3PewOEu8g4zUtZh8+qCzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp6gBgQnO8yoKzShx3thW7wcTFC3GFN/mtI3KDjho14=;
 b=ht4IMiyX+bn1NN/Km6O0xxyR4h7SJMVksWEnq+AR3cvKGRrOy2tx+7ZLATtGqKvSaylqmE+ys0oIlQF16702MmanI2bW8U/EJRbLmAZh6KazKfZJljjlRadHeXUognWKmcIcKLIRXtUL/yzeFx5gCI/FxsnGgL3u5qkRMw5XmCk=
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Wed, 25 Feb
 2026 02:52:02 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::c8) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.7 via Frontend Transport; Wed,
 25 Feb 2026 02:52:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:52:01 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:51:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2pt4M3349485;
	Tue, 24 Feb 2026 20:51:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv50F-0000000CVjw-24yO;
	Tue, 24 Feb 2026 20:51:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/4] dsptop: Tweak SECURITY_STRINGFORMAT
Date: Tue, 24 Feb 2026 20:51:54 -0600
Message-ID: <20260225025155.2981821-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225025155.2981821-1-reatmon@ti.com>
References: <20260225025155.2981821-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SJ0PR10MB4671:EE_
X-MS-Office365-Filtering-Correlation-Id: d678436c-aedb-40d4-7612-08de7418d9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|34070700014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4qA5PmM6tGr2j7eB0rdBEd7lD+O+7+1ye0pCcec7CVzVYjob/PvdxJoTyyTX?=
 =?us-ascii?Q?P38LmBH3vfqYhV+UB4ld8fkxQoa03yHVxwIDs6h30kmhaoboBXirvDbgbniE?=
 =?us-ascii?Q?cHerLn8InhmRRy/QPEyXWuyL7h93tnzWqxU+iMR1hafMr8YdjB2MHpDeX7Br?=
 =?us-ascii?Q?7hDreWzeHR1YeYstsZPpsItOn01k05ArgazKVvmn4k/cLm51cM2JJyPVhDda?=
 =?us-ascii?Q?+VtEtekUZWP+2iJBuPyeOaH+Tcb6OuAK7Bf1TBpxjf6KxtK2cpPvpGlIZ3+o?=
 =?us-ascii?Q?E6P+1+17Bz5q/xyd2370m7u9TpLLbq8JA3j0NIwaqnvq9U01blKbaIgFBwnf?=
 =?us-ascii?Q?Dc2Sw31Z3L371K6rG0MhMuyoYr12TWGMcycgH4MvL1QQfrgabSzOdauf0CDP?=
 =?us-ascii?Q?9dzhzGaD//mOLhfWv4q2icQuMXaaiLIwpLNVTkWsMboHqHUSR266sL/3nKa1?=
 =?us-ascii?Q?fqs1yV1KF1udQuBBdGNxjMCzuBUF5HbpK4uin2g74QNgqnztBfOfhxmTipJ3?=
 =?us-ascii?Q?lreQ2xh1sgX6dSn1DTnUkWXBwWnES6W7ixaFExU7kZcpWM/Yl6XHWzsYFI5z?=
 =?us-ascii?Q?a6OofGxysrzCd4286nFIOYQBrmLAbHSAQz1mIgcFPI9T+4nNZcpYy6YsiXfZ?=
 =?us-ascii?Q?HuegV5rVvVDH9XJpLxTlwgBeo/nCdNKGpzDQ0TpI7F7V1mf7fYdLazejmS3I?=
 =?us-ascii?Q?6jpc6kx9nazZ/ePEtwBt+1ctlQ6PEzHHeTysqMznBZpSmvpb1D8Jm80GU+lF?=
 =?us-ascii?Q?AZqbEflNs2EpqDo44ojcqAnIqfeS7hCKBwtZNGBj5q6y69umHbVWSpNBwb0e?=
 =?us-ascii?Q?3BsJl59Aa2idNArSm4dlZxtThu79ozJT/FNgT8qNCIMUnwuFGVp9WSB0y87+?=
 =?us-ascii?Q?L8A+HDkh9EOqdrjCu0qPNSXUTeHmT6uQwV4esqlAoqHQ8yoehQhJsh0pdmCO?=
 =?us-ascii?Q?Sm0jSLU3j33JDo0ahWOe1RQMGZ1UdrS3OesD9xGLYDCEB34Wdc2K2nuTusoW?=
 =?us-ascii?Q?WNtC0MGCvyF0l8L4ciUDG9TWd6mQgTCgmA6EPjR5J7uAbf4AiChBbo8Zexx2?=
 =?us-ascii?Q?6DcAV4z1DkIfbhKykqUZfctDJ9R33kfE8YVGExtN4u+jEm6Gsk+o0F8hHVGV?=
 =?us-ascii?Q?sgUDH+S5S+1wUWhGWKxp7VVPsSNAN1fdPbj9NH3YqrF5vKgub/51QOGGyykf?=
 =?us-ascii?Q?TTPKHZ7d8tyzgjb+u8/e4+rZlkdMRsxATBpZ9AfKN3bHqFHyxgv6/wsewSbj?=
 =?us-ascii?Q?0FJtvK0aL0+W0MZ87pFIgCIuJMT3Zl3hPvb0xEn/JfQDMWVrsNwXbmCFvSxV?=
 =?us-ascii?Q?JmHPa3MplEZYvfPJxYy6BSZiUwqsodfmTROTBeP3rmXzYc/BZ9H5OGz7Kb2Y?=
 =?us-ascii?Q?k1cGkpWzHGFu/sN61Ef0DhXWiZkRbaVtPBj+9/y0pulkyI2suf3eMS2Jjhm0?=
 =?us-ascii?Q?mZ+UZ3P9Qa45jV2gRWjUPmW8BZtzK35laHuoMttr+azkNCBUMYiMqSt05qX6?=
 =?us-ascii?Q?VpXt9V6YrnWGe7tpgM7c+Wlp7PfppxORKDbNZNztlVo8cZXTUWZrh6NGS/HF?=
 =?us-ascii?Q?utw5AnuBoSPA7lbEdlaP05Qgo59D+aLCFLz73EDdHreRKoJlCbMKZlGmm4iA?=
 =?us-ascii?Q?LFNUG3JmEgQikFdt7zIQBwdVVy+gxMadbIEzgwsk216pE8fOTa6dvVjalRfz?=
 =?us-ascii?Q?VVVadQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(34070700014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DAlDXZqWDOVfLyAKXW/Utc/EIolElZNk7q94XHh/SsPgcVbEPcSDk/Q9CZGbKQ3IIFWIuWJWDCSYs8qfVGEXiDJSodiFiekaYazTpf2SZGBlBf2vz3CRoTRkCVxrNJBelg7dQ7RM/e6kOO3Nn55K7APgksEJvUiaZYyJJESWQcWQaSpZcQLVG1IF4JSx2Efr1i5UG9gkzz4bygn54y7NPbRFJiojGeWvrvnlD/Iz3/8iHoqDPEspm/21EdvN/PAS53ujMFFaeFuJT8MrugjqA5TNZ5hWZqeD9+cpBM9NPAx6Aj2+eWk2mpkFmAQz4AaYVflXbQ/P+ilrC7zTvURnc3Snb9iFrucNbRJoR8vpP0Ra9IGGgEqWUvmxnquD862sc+rTvVh1zLI/Y1f2j88TWTUSwKPS6LwTt5wnguX3bLpt7n2USB6cIMg6cqyoo9zF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:52:01.3677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d678436c-aedb-40d4-7612-08de7418d9c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:52:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19602

A change in oe-core [1] has turned on higher security checks, but dsptop
will not build with all of them turned on.  Remove a single setting to
get it building again.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D4c2d64c10a5=
b0437ab1ea04df22386f0f95124d1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extr=
as/recipes-bsp/dsptop/dsptop_git.bb
index c5242d5e..85fc191d 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -22,3 +22,5 @@ RDEPENDS:${PN} =3D "debugss-module-drv bash"
 include dsptop.inc
=20
 PARALLEL_MAKE =3D ""
+
+SECURITY_STRINGFORMAT:remove =3D "-Werror=3Dformat-security"
--=20
2.43.0


