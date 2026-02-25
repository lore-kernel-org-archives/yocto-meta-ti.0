Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF26F55449
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:52:08 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37561.1771987925942962197
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FrwRlcXg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.45, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGHPyNsOrtm3X5iSmr1OPwaMqUmlXt1oRWW7x87u8nyfI0PaHvzK7uki2AeAauIlCHVevZu6kyrsdMOq50vUecTtIH4gOvqhy7/METgZRNPvy+3LbMxC8bbanU7V0gES/ypQW40Wcm5Dzd0JC36qIPbBpqi1DwhP2JyprtnNQ4r+Dj2fcThXfbI5W/pN/rD1H+NN4pUK61NNITfMgSxdTP8y7WsCH/xQWu6FhsdB4y7BQ1YlvmY+6CJvEvqYzATtJRLy5GpwqaurdOlcH+X2pxY/HTY/Zyi40NbvUMV1Y7+6sf31A7g+aph2le/buddZmSoDKP6ZyU1xvBKjAAlydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QNwxk/P5NIzGsjYCjEzR6Nx/m7pNjjE6SBK+NuUQ2o=;
 b=I/06zOnHRHXMub2r6fZBYCg7PsS65kAUvNsEB9D5RXHp0s67sWEDiAcY+3z9J11YzKPa02w9IRrEEnTPh6ialyqsu8jptXU1kUBrzhYhXrC5f4xG7CpRSAAYmU4TS/qIzOvh3Qx4ksQ84XxfJIKva0rO1VmlbV3E31OIK28ZJq8hDnulHMEHykOGN7wKVXcJbQDtahPe1NOUgendpAMjxN9mDILKZlakKZjrLhjsO4e7jmCeDDfOOr5Ug6Xx4vo4H9yH40lAlvGS/BRMMYaDem3UaDWPpeadTedFQakDfdTd2ajQ88noOwk2GxmNgt1x4uBf1cbYn1FV0V3nyVoNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QNwxk/P5NIzGsjYCjEzR6Nx/m7pNjjE6SBK+NuUQ2o=;
 b=FrwRlcXgGLrB0tzpfsoevxNtXVrX82CBYD7DEx5VaUG79us9T0Ygc5dlSFfNqNx9vzLbWELDVuwnnd/ijP1/xHL0ull+d4E+BcK650jIKxJBQwzfUsAl6GeLuyZ5K+OvR5BOTNrT/hUJon17ABgjeXhlwDdgk87Sq91rRGehcnM=
Received: from BYAPR21CA0004.namprd21.prod.outlook.com (2603:10b6:a03:114::14)
 by LV3PR10MB7939.namprd10.prod.outlook.com (2603:10b6:408:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:52:03 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::76) by BYAPR21CA0004.outlook.office365.com
 (2603:10b6:a03:114::14) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:52:02 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:51:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2ptxP3840337;
	Tue, 24 Feb 2026 20:51:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv50F-0000000CVk7-28sp;
	Tue, 24 Feb 2026 20:51:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 4/4 v2] gdbc6x: Tweak lcl_maybe_fortify security setting
Date: Tue, 24 Feb 2026 20:51:55 -0600
Message-ID: <20260225025155.2981821-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225025155.2981821-1-reatmon@ti.com>
References: <20260225025155.2981821-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|LV3PR10MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: b0195bc4-ec11-44c3-cb8b-08de7418da5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34070700014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C+Pc6rZS+TvoKUdwMB9PoFCJ9ay3P0J+yDZc5Pt+Fxs50NKogweVbMvJdkPw?=
 =?us-ascii?Q?IQJ09Nwg7VNx92poBMI0X4k8684/YSIAoHpyeezLtwc8SHxQBpADkU/5IgDT?=
 =?us-ascii?Q?O5hwQtWEX8RqLBgWA+HcPsvOeiEMePlv8iEgo23WS4i7K+YiJ5PFGN39go15?=
 =?us-ascii?Q?dwDJGnk9waeDYm+6jn0X+hS74AL9jW3z7t7JGnA2yI5d9vwrMgfGnO1PdfLk?=
 =?us-ascii?Q?V1bUmn9kARxoRQHZrJkJUp+nC2wQUw2tV4JWGPHzUzlGtUMs+pwHs+b0FR1C?=
 =?us-ascii?Q?i1toOw/znwZ7MX1GF4x2m+frnFXIh5Q8gkqV2YlHmQYXBtRKw3Tjcm1wqF3O?=
 =?us-ascii?Q?a1bahAXs6VxXI9Nj/vz/p04iWFJN/HQXcMKau7aot2XGEjCrg5bfu4QHJ1KQ?=
 =?us-ascii?Q?jKr1LSBHmXYKZ8HwTJfUFWhq3K/DIfPBQuFndUI9ajocD1jMye77RXw6l1h9?=
 =?us-ascii?Q?C3UJSRV1FkwooYg3ngXgyEjAjj/QiIjdyLVz1AKyy2PGyXhMYICu+0BjyWUb?=
 =?us-ascii?Q?nCCAKOZ4MkVP2AvbT2l0Pc0oHv30H/V1SmpxqkiSkrvhakY+jxPyvSG1BodY?=
 =?us-ascii?Q?Ypzur2UUDFlL9fQMRS5Gn7yqk4APpCkZn6s0zwZQE1+D7KUAFhNIC0WnoIdk?=
 =?us-ascii?Q?1NgBCLhTGdEjbE+NE9V30DeEWcvdAUnjsQqyOisV2LyTRbQ+lfF3zbMt/66A?=
 =?us-ascii?Q?hJR2XWG1/RUkuQmv/CrwBISb0BLgN1OzTwZQa/uUhqcrHy/6/GKfilP9Uzr+?=
 =?us-ascii?Q?/sn+BFhve7WWiDFsKb3IlALOW6QBYHC54jBD2rlmG+yr4GMdpXWwwtfP8dPX?=
 =?us-ascii?Q?BRkpsj13em7cBBvAytyOLmcO0AqL5VD6TTRwAvYM6OEvIjPALxks+52icQnF?=
 =?us-ascii?Q?e7zfteHeiwRc5MHNMjxjvajUxvE4z1RHo3ycsjbmjGHeey5TbtI/ApDzViyr?=
 =?us-ascii?Q?0sHDO2S/TBV8dbaj3rwcuF/18VDPJ27MFr2PWmQ0MR9J4PjEwM2JdsxBJVoG?=
 =?us-ascii?Q?qM7zds6cQRdcu0xJvU7kYujUcgMRwf6zmhOdEhiUcofMy0u1QYDRiNBUdZKL?=
 =?us-ascii?Q?msl9QqUXvuWreHUasKFtOVf17Vj0twiAJIMKwzYnW/BGlc4aCTxQkJVFAU+4?=
 =?us-ascii?Q?0QXmtnM3tf11Kv+gSWVKl+2B/Py1QbtOpldSsknD5UqP5xs0NFoSInho0r/L?=
 =?us-ascii?Q?G0wdPuTV/NNt2u+K+O9SWH/Q3T/1gLusfpSmwW50og+rA5lnJb6REA2AtjBn?=
 =?us-ascii?Q?2v3nCXx54ia4duFswhKTd1z+oPAlllIZy0/giRBZwappmiB7QagIPgx+2CXA?=
 =?us-ascii?Q?XlD/he02LCOf12Y/g5mrShzSS7Cj9Gnj9sprJPsQ1XdAfzyRm8OZdGPp5Zie?=
 =?us-ascii?Q?sqCQunQxCYuFX8j4+hNP4GK/q3hUJFz7kZpRNCwghlJ36yYnaz8jYw/AqpuO?=
 =?us-ascii?Q?S53J0YQ2wLB0HjJgg5q+4LTzspy/Gg9Ju7WyAl1zub1elB3t1tUw3J/AHRBn?=
 =?us-ascii?Q?SmPpWYzM2Y/sZete5ZF2uYlR8P1tjGYR6WNdNUVChS+f7Wvnq2/eLS2vcrf9?=
 =?us-ascii?Q?pkZI3QZG2ff1vxqE4wdYfBxsWRj8aOqlikHik253mWg/OP08WK7HaTk9kscI?=
 =?us-ascii?Q?5HuSKpDyBMcwmZRsh8gBP8Hfcfs2NHik9JxznsaYX+5D4+9lS6BUdjMvoo0c?=
 =?us-ascii?Q?g/GdRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34070700014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iQsoWnijdgbeBvY+1l7x3Yo5yb1VoTx+G6iEGvPm7Yr3LHkcQpzcLRQYcsm4xSSqROqtbBTlyK8FElvpWNwiKiFwNn48xGbTjmcy7EaosHzPEVqFjVtpDVjXPgsypP02L19GYL8lqnhJFvTr1payseiwlc5nBD782sMi20Ll5Zl5zV9n11DXx0Y/H5hD+B6A4KhXthlZwVVFApdieL52drSldbQmQroHCc3xBlAidW+vvsLZ3//7Mm17RwD8bAvEAPzcer8ShED9nAYPcFL5vU6fn2YGOpPaBV9xtm7fupguSZar2Nm61V3/dXz9MWuxH7+8CuOri6SG4wZHCHdSTwxYijWf0ApD23yhhBcRBwkIzqeAuGe3TWtRB877JSNUwFLY30/vGA8JCqDZ+8pBYZ0dseg4nmgRKeRNywAcXrcAPOdkkOwGYapWRWY0CZVq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:52:02.3519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0195bc4-ec11-44c3-cb8b-08de7418da5d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7939
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:52:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19603

A change in oe-core [1] has turned on higher security checks, but gdbc6x
will not build with FORTIFY_SOURCE turned on.  Remove that setting to
get it building again.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D4c2d64c10a5=
b0437ab1ea04df22386f0f95124d1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix commit message

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


