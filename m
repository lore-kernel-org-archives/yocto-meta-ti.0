Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7215AC54FD0
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 07:49:21 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33941.1771573751473172111
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 23:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=a/kSOCfI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.65, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7gZvk5YewJzciQgEHXnx0ucNEcxtUBOEZSgdcz3ReiJFhiQ7TmeSXX67JDu5DyBGTC6XlKiYz7FaWRQN16yOAAfazknM3bkucNzubi126dcB2jdu+r3yBC2UpBF5WkdeKbSSjxKe9PY/4uJvuh3YwTGDLdHJIT+rehN+T/cmtsu/4p0rD1HTV0kbCL6hWyl058YV2NIfRgHjCspiT9aRNy0YgMxahpmR4DRUHhA8UE7hl6Utw73NlYeul5XqWBJ4lW0lX1p+aONIid27oeS0V1D6G0UKlONNU/eSvPkmZR9vnvl40D4t7Bkx4BVXatagL6MK3eoAYzHppraV/hIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onzmXoNIEyQbusHwc9+V6yEuvA+9lG+adKSIMFLJHDE=;
 b=Dg3PnOYhXyUH4WI08uMGTHaolbYhBgNGbg+bz3yBFmcH5y54O25UADSWJ0fmr2qyMbgRbJb893VS47IldgW0TFEBu7RlO9Vk4k03vqlMXG1FYOnF9fsB/TpA9sAepjsUssx/aQai117zTt1zmTMHJU5vACLstinc5R7epBwd+nl/2y7bG4CxUDugDaW7IVOuT2/GJGjZ1UAdQhLRtBMqY+6OKEHvm8xeXZwfC3GLO6wZTAIENS/msO4hzUqvHszyO2msIxKLvy0glIgHCX+oYmhRFK9KUT9cGck80/P+36VvOarpCHC6MAy89f+xppBsVT5Lk3yVFRcrno8w1hegWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onzmXoNIEyQbusHwc9+V6yEuvA+9lG+adKSIMFLJHDE=;
 b=a/kSOCfI8z+9R+y1jAMzO4edv0W/s3UXhz4tA+XWn+MsY+W0zKcD/ooHZuJwf1MIhcpYu2OJNATxYr4KUZkeIXbQb5EV83ZkM4ca4gISNbV3soDjT2toKFXc8bcbRjmS3pkVsM+6s1tDOrqtQk+K3sIAE3KFVPtyaZmswg3x0y0=
Received: from SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::10)
 by CYYPR10MB7673.namprd10.prod.outlook.com (2603:10b6:930:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 07:49:09 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::eb) by SJ0P220CA0002.outlook.office365.com
 (2603:10b6:a03:41b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 07:49:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 07:49:07 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 01:49:00 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Feb
 2026 01:49:00 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Feb 2026 01:49:00 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K7mx493511666;
	Fri, 20 Feb 2026 01:48:59 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>,
	<vishalm@ti.com>
Subject: [meta-ti][scarthgap][PATCH] meta-ti: optee: Update to 4.9.0 tag
Date: Fri, 20 Feb 2026 13:18:42 +0530
Message-ID: <20260220074842.2206111-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|CYYPR10MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 669fe3ae-e162-40dd-fb62-08de705486c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Le0g8MA5bKfuzviPL9NgqLhcFo9kFmXUyyeS5ROTS0VKe3PpWZyxgicyq6pA?=
 =?us-ascii?Q?QWKc29qTojLEdBf0LK9zrBzXYmhSltNGmjlINZZqJK6ROpjVE73Gdb9Qyhan?=
 =?us-ascii?Q?OI8QcLTPdTzqRW8gSSS6suhCFvUED0LRKFXGdkRSbRluUfvOG0TG3QIWK36A?=
 =?us-ascii?Q?xdAmQ2bi1y1aJFOhicogZTSP2YJ19NBM8w0vkHunKt1LUlgCNXuIC9Az+AIl?=
 =?us-ascii?Q?scVDFbRmZ21IZoS/PqmnBEVYjh9nXBrX05GdWm4yKjzeHFSmW9GaSNJt8rdG?=
 =?us-ascii?Q?N9QrP4mpsoYE4jaFpGVHIek574WwoBqE7hPkosjgI+YoHwuCgCoktqSCemfV?=
 =?us-ascii?Q?ImercCjoa0eqU2bqGxV3bURITyfRw7qED6Uk4pmV8QqLtCVwukJCL0v7wf74?=
 =?us-ascii?Q?pBOK/f3YyOvdEJ8Y/MeZtTlQ3dJxqUBdDKd+QsxZ0SYUtvXIK5BW9zPGSP9h?=
 =?us-ascii?Q?VUX67aeBuCJh4yOZdwQx4WhMmMohRn0sum69lr0z75RuvESYnOqs9HwnG5hq?=
 =?us-ascii?Q?b9V0mu6cvmLLmCPRxtSl1GuJT3UYwfb916LRixX7LP8Dfs2AWE6QIflgzixA?=
 =?us-ascii?Q?42hAaaC2rkN2NVCFhoBKG9t+O8kVjdpzBnYNUizUBRn/g7jV2DFy0bfVWR2H?=
 =?us-ascii?Q?KDhuFUusKsoAMad0c8kBcLl26WSj4jD2lkQrXXheN2BZfzhKBPQhhkY2jOUe?=
 =?us-ascii?Q?WZUwMOISLEjzG2jSQGUX80xLxWMz34z8fS1J/0ydgVLuUnwG89m+yG8LGlUA?=
 =?us-ascii?Q?IY0AZbtfRgJe/xbItJoHyZVApbcSy2uL69DR6HWRqtE4gnrwo8dWaWpaNI/0?=
 =?us-ascii?Q?SZUEJIWyl62BBbo79BevEHI8nHcL3Aum8hmtGesseGxPXn9HMWuCBtjGC9MH?=
 =?us-ascii?Q?Y7SVk6T1ARPB+EAU3FN4/kDIB4mBrUeLBqp+uXz89xIr9k5vXZN5yaZ47lb3?=
 =?us-ascii?Q?0Gm+vusVLOb1+WLRCWdGLdhMoplEQ2y+IDHVrw9/vM3N/ZxVDWOJkZTC/us1?=
 =?us-ascii?Q?/hN4FD6MNKKBm3LJcEwp0iLOHxKLRSdghiF+g5RLlhGebq/Zz+IDA/y/p89m?=
 =?us-ascii?Q?OEYpEZAa/i36yrsBubqunXH6+cwEXD4Klc1/iQPJHHMI4DQB571P/fau+8jm?=
 =?us-ascii?Q?uEoJGBV2tggPlB06KLM9xCSOtUTHzco3MerzrJ/VeTrOeJCtcbSPFwdmykuh?=
 =?us-ascii?Q?Ql/Djb0u7bMvSpyMGQAtKtGKhxVo4blI+jvVFcaoSL5ET/PXD4nYZQC7gsRE?=
 =?us-ascii?Q?fgwLgu/Jwa3I91iwXduZO11ey6nEcwCQ1bzjuyPS028bEhRNpcGc/1C4Fvug?=
 =?us-ascii?Q?OUmIAtb2OkuhMWWabeORKajYXit/f/eSVTZYi5jnDDhPy8ICPJLrHc2Y6EHO?=
 =?us-ascii?Q?PZeFUPL2/J8ASAcur9nn2l8HgJwFgFrDM4/eKVN9mHgoWVsb8SSsHG6xJ88B?=
 =?us-ascii?Q?uko/fpVBaQUc/jsL6zQmuTF9O9LaOLnvEgwm0Wpp901le7rbpXadN1tu5Cwh?=
 =?us-ascii?Q?yqPg7es7bDiH8K28aKnynbPtUovvPGU0K6lM4o/U94vxITBTDSGMR34/ZW2q?=
 =?us-ascii?Q?WN5BCz0W+PdQUMLsbABTVdT8gpK63zRv6mIsmXk4aHxR6i9CsUzp2781WjNh?=
 =?us-ascii?Q?JRBDUPAQidm3eOcrmnLMUTDPGt5doxawmMxhXOQhQNLKrE1+2ovVXGs5No0j?=
 =?us-ascii?Q?cQm27g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GvRXDFypyn5p0jxN70Js+/vm0NuYZxRYcmFVUc0O0mIJs5cWumrIlODyzMo4vK8QZxGVvDNfRCvceZ9FZp533AvSq5Aj0gYdJ5VEmidNwll0eHKL80cw6fklkaiH0YtXRwEdKQ/sClgW5calHIBAsxFRTKhEzOdcyZSoWNtOpt0KvnX0c6Ewsp4yHCTqQo+O4+39dkfHrWctkoLIdJqinT7f7v4PzLOvizntgNSs6R3w2b6LsttMicc9PMUFUwpVI0t0UOQpD4ftQQZ80fx/eHob/H35o1wuEEgSx8FKNmHjYcYkJqRyj2DqXYng2JZ68JBBYkuk5FKYDHehrqQ1AuiLwrKSjK+/KvEqx1qalo0oMk47JUtvaZzjai8CYO4BGyFBfG12flB4K4NCubRyqksJUNitubyOs+SvRvMCD4bwu6H8SmGNWaZycnWyCy4v
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 07:49:07.2247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 669fe3ae-e162-40dd-fb62-08de705486c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7673
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Feb 2026 07:49:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19558

Update all optee components, including optee_os, optee_client, optee_exampl=
es
and optee_tests, to 4.9.0 tag.

In case of optee_os, the commit SHA is ahead of 4.9.0 tag, to integrate cha=
nges
done to apply firewall to AM62L.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc      | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 289ca5b5..68b6b262 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
+PV =3D "4.9.0+git"
+SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 91dd5e60..6ec2a83d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "14321a0607db16099d158478b21a2b2e37b3a935"
+PV =3D "4.9.0+git"
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 0f040e6e..0b8da91c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
+PV =3D "4.9.0+git"
+SRCREV =3D "3322f1326f141ef3f41ac7a1c1e08ca23a869fd4"
 SRC_URI:remove =3D " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch=
 \
     file://0001-arm64.h-fix-compile-error-with-Clang.patch \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index d2593cb8..f56d40de 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,7 +1,7 @@
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea4b=
e560"
=20
-PV =3D "4.7.0+git"
-SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
+PV =3D "4.9.0+git"
+SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
=20
 SRC_URI:remove =3D " \
     file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
--=20
2.34.1


