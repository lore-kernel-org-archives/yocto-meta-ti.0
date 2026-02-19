Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE48E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 02:32:41 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5924.1771468352240849344
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 18:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hZgC9VEq;
 spf=pass (domain: list.ti.com, ip: 40.107.200.13, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejDsWFaPgZjgLU7XxVHtZLjaFNNtBXE6QzCRWIX+l7q7PwqiGjqTzSA7ah9Ajexes9MUUAx3Ne60WbTavjroZmyGJTfA6mw+IgQgBZ20Cv7BBppV9tp/zHkc5+UFL0z4uBhCgcMHLsazluCyeq9xXTgzKjQ7mcWsCSJvStOLe0c4GnUdgKTGGSxKWshthmlhun6oE0vPtzCsgOmatXAALQmEmqJla3iZazPC/MGMI6sbMuvmhe5ioS5HK+xC7Horbf+7Foo7m7O7yTyYFMXMZ03s43iZXNw8xyiRpsDuR+R7OqgRcNz65Yhv8JvWkFPteOcMWAkvA0SBzQMHArc56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gQbSDC24vczEvruDLN9bVCnw6l3YIMB49atrpH7lzg=;
 b=Xdvyl4jctwP9m3mTAaWlhyptZi8lYEjd07NQ0DP52mWiDe5TwSua+6DgB9014NAWFQ1gD/4OnHJXtirRLDJC6d64OmXtGRo4+Yl73GluN05X+FfX/7F82+C/fxTvJYtqpMbJE0r9PO03H1Dh2ys3TEirV2mxVBrgLcNLICEY5Lu5rHPXXGzvyLd7A2oHJ+e+QrOfImJqbNzTIGCO4rqBxOMyGRC2yEK60tVdbGT1odTu1bSJoj7OfmdxerH87Zl6XLYWltzT3lF+98m/c6rIiIWLHKBzXLM1T8p9wtVL3/yQm9VJlINuZfZuTQJSj5WNewXcc4Swfqet6Pf0Rj2Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gQbSDC24vczEvruDLN9bVCnw6l3YIMB49atrpH7lzg=;
 b=hZgC9VEqZSu/PH+aKxmQwKLOASOl6MkHeYsDwYTpfF1Km/3qmP1lhAWUMwLb4Wq4x+hdFUpn4GiJXR86NXcYlYIKVUm0tzxVydxbKMgfQXXTPGsmWkiSVXvagzWTyADAOEumT9cve1EvvcEP01VPl7CGfkyfTbJdbSg/deeMvV2XaBDsYpaek863RyRi2mIThNxrXFuElSzPF5XhyDgldrkeTJ173jhZcNB1kydKjK56loTi1Xa151oBH2t0AjYLd2v22a/4rhPWjIQwgf/S7OVM5q6xxztr0wZeA2+QM/PKmDQO5KhaWc7d23h1xnysm8Q68nyN7a2IkwWzD/213g==
Received: from CH0PR08CA0007.namprd08.prod.outlook.com (2603:10b6:610:33::12)
 by IA3PR10MB8418.namprd10.prod.outlook.com (2603:10b6:208:57a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 02:32:29 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::42) by CH0PR08CA0007.outlook.office365.com
 (2603:10b6:610:33::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 02:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 02:32:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 20:32:27 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 20:32:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 20:32:27 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61J2WRSF1389730;
	Wed, 18 Feb 2026 20:32:27 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 9F3942A61; Wed, 18 Feb 2026 20:32:27 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602181811
Date: Wed, 18 Feb 2026 20:32:27 -0600
Message-ID: <20260219023227.2282583-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|IA3PR10MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e277fd-498f-4657-31ea-08de6f5f2012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QSD5CJWu+0VPPUj1qqPeRamUkHxvTfuSJ85Wk/6h231dciFmA3GGw8rjG8+/?=
 =?us-ascii?Q?PBMVqEtRpHlD2wRpYNF+2rmT2A64mMwq+v4en+RPaAKUOBKMzNbrbuQUqR9h?=
 =?us-ascii?Q?BADTH7uJ7DhKSg5lcUDsQhvMHtCrqJcNVYghxpan+E6xJPUujBNh4Xn1Esb6?=
 =?us-ascii?Q?Qf6EPdwMBfimjydZV3k3h3kASGYdyHvgTnmRgR7Zf6ZQBCFxFEJqdIeorizv?=
 =?us-ascii?Q?xVmfQntkD8sNg3/xVbfLPP2+BDml9lmrgArGwFhn+R2sXop1PEDNB9zm7NBP?=
 =?us-ascii?Q?yS7t5lLAChAEtA+QqmJ6U62/uxIdPmyNXuTor2n0nVkP8xNK2IukRnK1L18z?=
 =?us-ascii?Q?fsNpN8tvhngnr+HpTuo9OYYNxZWi0ALWHb/5/UVb3nP3QLJ1cu6LYe0r/+bS?=
 =?us-ascii?Q?0NErmb+c0j5H16IagaIG9i+6zeg2BRnQiXAeQdivcfg+YtgJUVprksUvWDLa?=
 =?us-ascii?Q?NJ4/SiupWDy+qopRTAVbpS310Quq69RKETcPQf3oJWbinQz+6EW9UvWMizff?=
 =?us-ascii?Q?x00z+sbaxta4Y9mHVaMw/fQlb8cscJUOR5kuqIVfvsMcUf6rJObMmueyCPDM?=
 =?us-ascii?Q?85Bi6700KBMXlFkjFeWqxkbJJq3BN9f7RdHGjIosR5Ld0n71LgCEPKQx2Bu6?=
 =?us-ascii?Q?PFXe5TCAx4HcOcRZl/VuXdv6aiEDZCKnaqpwpoUVmxWJk+ucs6K7ljygKGOW?=
 =?us-ascii?Q?4ygIPHIVNoJDIgyckKBuxPEzOTMcHzFEWZ1EUmWOxrSatZ6gkJyc0pZKwyca?=
 =?us-ascii?Q?Wi6+cilHkDUFAia9aL9bw4sD/tFcBIKdxaxSY2J2OhpK9dRFgs941nYJARDd?=
 =?us-ascii?Q?Rlq1DpyhwTbrqeReZN2Mane7hoxNRP20A74KrSY8qMKNoEbb710GWcX2i6nf?=
 =?us-ascii?Q?l4cvZfZ/6yEtAmzbG0eyonYn2D/xJo83HzW6BnKRWhe5lT8Rx9hh2UpvtzmL?=
 =?us-ascii?Q?VXFB6e3mq9v7MEOA/aPNQvi46xyyDJ7qia0ly/XFPHLhpY5ei8IAE4RLj6n3?=
 =?us-ascii?Q?OJmxYn7Ay1qB+dseS0EDXtduK5EUv3C4pxvHORN9KzoSSX0hd2nrzZFzMV6X?=
 =?us-ascii?Q?r/WtX4ELUYTeKBftKuN+AO9t35xh6qPWkNla2qTDJVlPEJZWnGiKPZ3c0YTK?=
 =?us-ascii?Q?mrCMTWzvpFeroBiyYaUGYmAAV6pGCPZKiIy5gbnqt1Pam86q198aDveblGvn?=
 =?us-ascii?Q?fjtD66QjmeECQA2X7E3uO5TJ4D3UmXwH5M7vf5LT/eafCqZsxXTZpB+ON+eH?=
 =?us-ascii?Q?2v39sdzudj7G2vvMBYPJRyUg3u+MphvU29pK0GXQAALmRNi7kzjxcSf5dEiG?=
 =?us-ascii?Q?qmUFrh3hbazOHWllTq2zKU5hUOZngMAr/L6/IWWuHvYSED77lBCeT8qO/vpY?=
 =?us-ascii?Q?XgWLj5vmpQyJJoalIOODF+ochzNQSW1u3jINekm24mhtzi5CTXHVolr5ZdUg?=
 =?us-ascii?Q?HGqPPR3/4y2878eVSr22Q35KSbAGdLiFoQ9ozKdWtToxvPWKh5uFNWhEtdRm?=
 =?us-ascii?Q?yFe7Se1Q+GTS3DdvPLsWznKLxvjTypa3/S7U+f/jsD+v+D1kIlUQ1SU/Eg1D?=
 =?us-ascii?Q?m+8NND5SlOASR7lbW3ZqPeHOMSyoRvWKTJxI8BdZPQb4dmSGx2G9Ve0DZMf8?=
 =?us-ascii?Q?FYN9jqPEbTZEWrjgRD6Ed5x/o2NXaHZvE/klvtsfWlVC+3DYFc9tIsY0Q/A7?=
 =?us-ascii?Q?IH0XMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gNfCInXY2ThESeziO9Io0AIsF2T5tXhAPX7dLlTyWl+zycxu1ZkwM5JYRK4l24GeAfw6EVZPXEqKBSqFcABuhFgkqURxsz5E+3xJw/r9IjL35kjddTB72AdVTdSWyW6dpL4tFaxJwbrgFvul+8DnJ36XdCwijdT77uUENA4/Zm4F6ED82Rjk8aICzZNZkmo/2xb3577Ezcjr8PWU325QJNfsaet+n+KlOAL38gq8tDvpqw+m6iDRkCtzAZTeSTKCFiQMcJWUJ1MayrkySvaUGhEbQZ3IrtvVDu7Ig0bh7VMVPnUluNnZ93SfELM4a1y78YnRwBbEOJVI3hxks6zKhtgj3py/MwqSgVSR8fXpoYplZldQvYkR7SJ8Jo1fvRm+wLn1YXkgsx6D/qbe6Dgr+ocDAV94OPuuWa0u6kIw+iubTg9xgGHAiXUisR3DbDU3
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 02:32:28.2886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e277fd-498f-4657-31ea-08de6f5f2012
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8418
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 02:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19548

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D3c35ffe92dd85b5acfcbf350cd1a6cc829994b20..941e1f7a3b3f=
683a59a0e51fb78817eb31841430
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D65c7cac7324df20db0cfec1377fc3728018d5808..0c5b72a0b975e5e=
01ed6164cc9547526c680fe95
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dabdf4e7f1d6d22a2162c91baa1f2a32f8e7adf88..49a4f3a=
41af39ec952f7caadb856418e1b734449

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 83a11378..4467d06d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "3c35ffe92dd85b5acfcbf350cd1a6cc829994b20"
+TI_LINUX_FW_SRCREV ?=3D "941e1f7a3b3f683a59a0e51fb78817eb31841430"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 92530669..10980950 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "65c7cac7324df20db0cfec1377fc3728018d5808"
+SRCREV_uboot =3D "0c5b72a0b975e5e01ed6164cc9547526c680fe95"
=20
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0afde29d..20fdddb7 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "abdf4e7f1d6d22a2162c91baa1f2a32f8e7adf88"
-PV =3D "6.18.9+git"
+SRCREV ?=3D "49a4f3a41af39ec952f7caadb856418e1b734449"
+PV =3D "6.18.12+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
--=20
2.43.5


