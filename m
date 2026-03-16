Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1850F53D7C
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:13:19 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56207.1773681189783601456
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 10:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lTvbX9/g;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.43, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4ey5m+M2uM+fyIBF7+SL8anasFaIzqNERu5s3T36QSEZ7TB7yRbia4QTT7fAl0q2nr8d6wdiKCRG8wQFlXthfY1LyV9x5f9aw1pkFBjvpQDcILgNtez1Ix+uQInIs+bHooV9/V7ieP7sZLlUvHgpajkMnSRrnbYlhGvPQKpFbhBryoaVJ05z3UBw0jJCPhIPefWgYrS2J4aIGOoFw5uP6kEgNrVVeLh5tceW/Md25Lq6j99T4SE21uvrPRQkfWFhGbVTpzIurr6eLx3lUGCJGvvxKEZYhHzY6J8xUm0DXkbQJVWesmCY6A2qH1rrB8+0zmVQ90+0xPeoIWa+BF+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTkgrxytFbZPWSycCsMU2o2RlSEeI7TGAAyVWkdV7F8=;
 b=mst9drcXNnbLtXZCfcgWns5xjiERGqrgfDFN1GrZFkmVqOUPH75LZyzDwJtslNIzUKlHjyBYlQT6jMu3kv7Rk5VuIv0UoQ8aBNF0ev0uQy/ZDucugJFvBAHfLPuc8fMVk5lK/folE/XSOTmTti4aDcX73W0GP+tWYpU5rniByqMgKvvnKFf9LC5mNmR65BYwrQfuJEhKMm+QSFZALsIH9S0vYwh9HDwkKqr+DmmIMKlsghNg9VEJ44AiFY/t3QL08u7C6C8+NwqbAm1fkcVzusGBCpctzB37b6yyG0ep55HWMxw4ZAq0ydOomIVctAFiXEQdUurSEzF1sxuhDPqFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTkgrxytFbZPWSycCsMU2o2RlSEeI7TGAAyVWkdV7F8=;
 b=lTvbX9/gveQnfa/oIKRgJIlJ8o8RHslHWP3cIOVXcsBukA2CL4rGAJ6/1eBA66LFPR0NOu1qJejrzpUIMkBnWzGzSskms8DaKBUO2xJjIJZrnbdGOocQbb6gwDTJLz67Ek5TS4i0Y33IbMP0UX4P+ObpZWxrnjwwvv3Js+GbUiA=
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by DS0PR10MB997675.namprd10.prod.outlook.com (2603:10b6:8:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 17:13:07 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::c) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 17:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 17:13:06 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:13:05 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:13:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 12:13:04 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GHD5Vp1662054;
	Mon, 16 Mar 2026 12:13:05 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2BV3-0000000EArL-0LOL;
	Mon, 16 Mar 2026 12:13:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] u-boot-ti-staging_2025.01: Backport fix for python3-setuptools change
Date: Mon, 16 Mar 2026 12:13:02 -0500
Message-ID: <20260316171305.3378319-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171305.3378319-1-reatmon@ti.com>
References: <20260316171305.3378319-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS0PR10MB997675:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a35e9e-0108-4e2c-e32b-08de837f4a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	0EVA2ATExaYEO80N2gHSPYEfh1LvTN8kRgLxaVq0gfQI7BGgimUaSCSX+btd2vq2NrsMrtlwz+J5ysKHqiZeRYbgarao9tsTMFwJWlPpQxiNjTy7uJWp6SuBqHhmUPMKtZ7RG7hzBZ73GKBQKVDTvveoxBL1K84NBWXzRgNLufx3NvFPi8zlOk+qRdfCC4TFBoQMiyZ2CjhGdpwAh2fqeR/hz9/zyvpXzTx73qfMDffSrN0FtNUNR6E+HGT33EKPurrcvOqKqJNYb9BKwmcssAbX9EUZ1RLrb19g0DAS6+8NIIB+zRTAlzRSqkU+H/2dsy8m4FQhgmi3ChBD7fLlTBOhn/kEXnZs+xlgxCo1EADMLUjoXKBv61n+jAjThATpI1w3pcd8jdu2hAwLNGXsA/Nve0N1RxayPfktDG/zJIRQSN7q3yTcaSkNBRRPV/M3CzwlgDRoNPv5cJR4IbLZQ7A3ZT7LjefTs57Fv4f62QIT1hSu4FzJ/XtTIxCTvjHqkQhd0D+dKiTmF6UNbhtgLrGFwyNoBQLJlTq3iaOKmNEOjCPNJinntZSC1przt/pTw4G+7jyirR62omkCBpGOMVaxUVNFit7mo/pK/GtK737NYb3HnUNwsTfnCEu4tC3DmvQY04HBpOzg1R2td497xdCRoytxfUylA8KVaGolKbB/Hes3vZuKf4TbooKCrsBYsns1Npoei3FHyQ/inAhbrjb9OH/rLCKKpXY7NLGIE70=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VNlAvjuV0gvTm8eQFi0Zx/Ivwtn31U+Y/ZE7/y7RFcsiGsrItCFJ3kVZ4p9n3R8G2+j/BddfGDSNMPHrcwUxctD7G9uzfyMPyuuxvAp1Kw31L7g2TFK+mEEzN8E86iT1wgblaSRnsxu35KnIYcCZM4Yg5SkWy/hOYhG1x0Tb/afRw60B5mkAr4sQNoDQJfdveyof4LYYFjNOXiguha/4e/pEtZ7e6nPSoqryZEpQdgpMULIt24/iHjXfolWpiKS7Ng6iVKOSX8+ksY0kVL58UC4u3QFPV4ppIMv4e/mkLqCNsSzbdzbEYmFRZdWamHFPwU6cZcJUGpebHkth8Y4qDqx0LsXT3BMuSskDKROMXfPnhTSKS5TwV/4H2TL2vaSBa79HbVL0Hq2Jawb+WfJiGxgOSFIP/DpIYgBFwKQNwC/MgovK2989kfZnJOsTH2uY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:13:06.5375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a35e9e-0108-4e2c-e32b-08de837f4a77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997675
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 17:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19718

A recent change in oe-core [1] to bump the python3-setuptools change
introduced a build error with the 2025.01 version of u-boot in binman.
Backport a fix from the master branch of u-boot [2] to address this.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Dab6b2bf7b55=
5d3516abea6255b800fe6f9673a69
[2] https://github.com/u-boot/u-boot/commit/538719cb6a77934d069e0e64f264457=
a59a9ebfc

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../u-boot/u-boot-ti-staging_2025.01.bb       |  2 +
 ...rate-form-pkg_resources-to-importlib.patch | 73 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-binman-migra=
te-form-pkg_resources-to-importlib.patch

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 08bba71b..6fef7e91 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -5,3 +5,5 @@ PR =3D "r0"
 BRANCH =3D "ti-u-boot-2025.01"
=20
 SRCREV_uboot =3D "ef2eb76b650415637bd93b0eddfb1e31489117f9"
+
+SRC_URI +=3D "file://0001-binman-migrate-form-pkg_resources-to-importlib.p=
atch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-binman-migrate-form=
-pkg_resources-to-importlib.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0=
001-binman-migrate-form-pkg_resources-to-importlib.patch
new file mode 100644
index 00000000..854eb6df
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot/0001-binman-migrate-form-pkg_re=
sources-to-importlib.patch
@@ -0,0 +1,73 @@
+From 538719cb6a77934d069e0e64f264457a59a9ebfc Mon Sep 17 00:00:00 2001
+From: Yannic Moog <y.moog@phytec.de>
+Date: Tue, 1 Jul 2025 07:45:37 +0200
+Subject: [PATCH] binman: migrate from pkg_resources to importlib
+
+pkg_resources is deprecated, use migration guide in [1] to migrate to
+importlib.resources.
+Keep the Python 3.6 backwards compatibility.
+This also fixes the binman version test which failed for setuptools
+versions that print the deprecation warning.
+Change from __name__ to __package__ as with the transition from
+pkg_resources to importlib_resources using __name__ results in
+TypeErrors [2].
+
+[1] https://importlib-resources.readthedocs.io/en/latest/migration.html
+[2] https://github.com/python/importlib_resources/issues/60
+
+Reviewed-by: Bryan Brattlof <bb@ti.com>
+Signed-off-by: Yannic Moog <y.moog@phytec.de>
+
+Upstream-Status: Backport
+---
+ tools/binman/control.py | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/tools/binman/control.py b/tools/binman/control.py
+index af447d792a7f..1307222591de 100644
+--- a/tools/binman/control.py
++++ b/tools/binman/control.py
+@@ -8,12 +8,11 @@
+ from collections import OrderedDict
+ import glob
+ try:
+-    import importlib.resources
++    import importlib.resources as importlib_resources
+ except ImportError:  # pragma: no cover
+     # for Python 3.6
+     import importlib_resources
+ import os
+-import pkg_resources
+ import re
+=20
+ import sys
+@@ -96,7 +95,7 @@ def _FinishTag(tag, msg, result):
+             msg =3D ''
+         return tag, msg
+=20
+-    my_data =3D pkg_resources.resource_string(__name__, 'missing-blob-hel=
p')
++    my_data =3D importlib_resources.files(__package__).joinpath('missing-=
blob-help').read_bytes()
+     re_tag =3D re.compile('^([-a-z0-9]+):$')
+     result =3D {}
+     tag =3D None
+@@ -151,8 +150,9 @@ def GetEntryModules(include_testing=3DTrue):
+     Returns:
+         Set of paths to entry class filenames
+     """
+-    glob_list =3D pkg_resources.resource_listdir(__name__, 'etype')
+-    glob_list =3D [fname for fname in glob_list if fname.endswith('.py')]
++    entries =3D importlib_resources.files(__package__).joinpath('etype')
++    glob_list =3D [entry.name for entry in entries.iterdir()
++                 if entry.name.endswith('.py') and entry.is_file()]
+     return set([os.path.splitext(os.path.basename(item))[0]
+                 for item in glob_list
+                 if include_testing or '_testing' not in item])
+@@ -756,7 +756,7 @@ def Binman(args):
+     global state
+=20
+     if args.full_help:
+-        with importlib.resources.path('binman', 'README.rst') as readme:
++        with importlib_resources.path('binman', 'README.rst') as readme:
+             tools.print_full_help(str(readme))
+         return 0
+
--=20
2.43.0


