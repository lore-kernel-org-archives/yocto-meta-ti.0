Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B2AC531EB
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 23:49:07 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27960.1771544944044347158
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 15:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=gXc6HQGR;
 spf=pass (domain: list.ti.com, ip: 40.107.201.58, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oubCYYR0EPXNo4MHmwEhVCFVFy/KO9mFAFJB0d9e9mOhV+kXUQr50VOJVcee6hSU7IKf0GRuI7Cp0MxhX+co9HSIzgZLNxXYj1QbFg8C+0tlq9ybJqzFiXJKi0yU6JKoNGi112weU4hDZSsM328TrMrWqugvgUaOEjbz7yj3EenxKcp/1u8CxItL6/ejLYovHzzKq0Gr/AGPTv+tAhTJ1z3QbCv9+BFku69H11fWXNRTD39cjPs4olZ5rwum3rBvhmipt5woglmCYjrSLbsZuujNmPhaztXG1ERGE1oGxHPUYrGoFkw/rWYgFgysrq7au8pJoLdsTwMrDFkPdatDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyWFd/1OO2sfqj5RXEbRjlVmDR48wNTHFhXFV05A1l0=;
 b=jdYKcRvfrfO5Q46MZ/jnRLv5L+LJVKdlxJ6ZuEfNBVM5vdiWZzuUey0+LmuKwN6odbj/2BesMwnU2bvfwnVxQ3EdGs4QU2YvL6fasvEsJN7Q/zme3UeLYTzHRu1dInQua9wSJL0D4QQPVnuppcK5lF6KxfBCBgGO5pMuPZwSUj++gFhxMYIHEoHmk5lMt0DeNRpTUxDTfRyJUgNTvLSm0Lf58GGr5FY0eURMktR6wK1au9rcVihjbjMdsRyURbTRsXjoUniHKEFJrdwUHQjy3tmNPptBNp+xYsCaIHpTQd80FTyuBxsIXt3cw6QROhjjLTH7ZgNk5e4sktecbJGVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyWFd/1OO2sfqj5RXEbRjlVmDR48wNTHFhXFV05A1l0=;
 b=gXc6HQGRIEkC8sTb5OuaKH23ttXWhgn3UC/DnAs75qddH2n+XrfAahvL6qbWlqpL9OHf6PDjpzUlCSpvCS/dTkPBzfKH5WGCjCLT/Vojza7BGM8mVJc+bSjp2AsWAyaMm0d55IMf1xezVF181xRlUstmypdB8Bxppyhu8Udg/aRUhbNGB2kbc26B9b4dEv0pYgAjWTj6aYORsWnGCxbQiu8zVuaIJbGOSbNJgrOenoMND1oZ6rEZDDzfyAfUa8yNGflYZp4dd7eZaHn8/APAaaML5+Cv+Xp5r7iUOoUrEIiA8dqve/ScZvOWRDD61X6tJ5OCB22BdSTqUa9Sn1oUzQ==
Received: from DS7PR03CA0210.namprd03.prod.outlook.com (2603:10b6:5:3b6::35)
 by CO1PR10MB4724.namprd10.prod.outlook.com (2603:10b6:303:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 23:49:01 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::dd) by DS7PR03CA0210.outlook.office365.com
 (2603:10b6:5:3b6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Thu,
 19 Feb 2026 23:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 23:48:59 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 17:48:59 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 17:48:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 17:48:59 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JNmxNR3388566;
	Thu, 19 Feb 2026 17:48:59 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0B46F2A69; Thu, 19 Feb 2026 17:48:59 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602191451
Date: Thu, 19 Feb 2026 17:48:59 -0600
Message-ID: <20260219234859.2476751-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CO1PR10MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e9b787-2ff3-459c-f42e-08de70117415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TYMyduHOqVaj792Ld/nwoPGLlWwlug6UVWrYXXs7TtUDc26PvR0GP59t6scU?=
 =?us-ascii?Q?8Y3krWRckrFJR2AVUboai+lcdhcHJBVH58bEyVTa8sDTjDkw4lUrpWqStbPs?=
 =?us-ascii?Q?rcM2uzYoyx/zZG1dxmVGoUCOZoRBAfvU2CUj5FZJ25FzL9TL85Z33orOEQMN?=
 =?us-ascii?Q?fIGWonm3Zr3yMpyVoJ34kXzc/41R6N+oFrP0bIb3VVDeT1rfD9afS5ufhFH1?=
 =?us-ascii?Q?qRC2EM3RviXs5WmvBJJgClIUhlkynROYhR96GaQom/F8EvXM/jFI8f6SziA3?=
 =?us-ascii?Q?S9igq54qUgwAP/SiD3FdqmeS1hUAmpO9/+AvdDY8y9eysHriiUyC9/sF5JYp?=
 =?us-ascii?Q?ZL5Vs0lWZoD8Nl3FVtzkfFZaAlalvF6+VQlb5Gy1rv9stGWgjlWdIH2bYoMJ?=
 =?us-ascii?Q?Mhni3DX9tnD9VMulZAfrSq+0U1sMJoM7VRjKH+dO3pCeqv484T1KuQZqSxLI?=
 =?us-ascii?Q?ITKApyHD658Bo/X796S4Vq7N/lGCFYiBOrk+CjLtWE2id/MVIagZYEumumh1?=
 =?us-ascii?Q?9wH0iT6XvjFG9on27aB/DF/L5PJR2FygMKD47uX40aGEvTbzI5p+nHYaZSgj?=
 =?us-ascii?Q?QQFVNMF9NWC10KTK9mWmQJqQCb2MVFLXA/BOHXz/hoy7+q0DoUhwLz351Sp+?=
 =?us-ascii?Q?USml0/I+a31Unbr3V6UwImdugHXxtwE2Fa22zLFfk7G8Tc65hv5eLQ4XUBTx?=
 =?us-ascii?Q?It4cZEOu1EdLegOa4vnyjnmoCyODXKGdZV74adDct3qRaD5rJ/uXMgiQ4EE+?=
 =?us-ascii?Q?29OOqAO+zQUOqUwgR6upQZu6JJIlHGD1K5A3jEI6jPjEh5+JwSr40JA0Oaac?=
 =?us-ascii?Q?JuKZvSxB0y57xweAsBgaoNkl2Nk8UyI0O6P4KUNNfbDgzbuOXWW7HRogKxYo?=
 =?us-ascii?Q?rhf0iOikIYQYrMZ0PmEOxtP+3zm7hYSO0rNCu8Cksk7HJXFMVxZ7Ki8XS1nm?=
 =?us-ascii?Q?pw3H+4z6u/QDgg+A0RpnSKIByytrWxWFZnC7bguUTtX73SIZT1Ci1tirbXn2?=
 =?us-ascii?Q?A8lKBtdQSR3WWW0s3LwL+A+erArbCl5tdjWncTJGPpJPDwFhhs3JusHncQwE?=
 =?us-ascii?Q?Sqdu7MhNupgFDg/9aCBhZQRXXR5x93nXcB0fG8JB6jFjfQmbuJci677RSLdV?=
 =?us-ascii?Q?Yf3kr9kJELXRo+kmmQyVEp2i2kb+EDDuFxNbBsdX4ut6Am6JvCoYyvQKutm6?=
 =?us-ascii?Q?DHq50Z/8g1BNCu2u4yrCSux5+pVQ1lJ0KyspM/nwXEExWqxvyPWA797pJgFd?=
 =?us-ascii?Q?AJa9JiFr5izmf5noHIyuD0PBJrIJS6g8dUKumfi920G8mUPAuxgO8ZqC2jnh?=
 =?us-ascii?Q?yChVQx3k06Kk5BapvJTuLj36Oop1cHUzhngO4HmfTE9WCIij+6ZyEPJDNPN0?=
 =?us-ascii?Q?F3J/2pa/I5qa/xBgZCohKbLeJLlA+AjKU96sZ/HENb7Cgll0THn43Y3JjJVV?=
 =?us-ascii?Q?Mqz4KX/8cqljHcYx+xWIOZzZBLkyI8PodG1xxqtr6yMCEe70YZpBIKAn2Qzj?=
 =?us-ascii?Q?wcUaeJp/hqKuKhSDFcorpUWpyBAI9KwkQRaWmj1Gd8lTxLtr8EZSZ7pZjs9B?=
 =?us-ascii?Q?gOa176pDf0aNrvQrkoky5Si8TAtn0KyWGN9fdrQe4BS1+WkFrxzYlrlK0WBX?=
 =?us-ascii?Q?pZi9fXmheGGeF8TqOSvNG/fQalYewwlCH69jcSqIOAxFkS6qoVHPwnFz825U?=
 =?us-ascii?Q?p34YlQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C/3romxemzacR9ahUInOShC5Z/h1w9viIuEl3Js/i2eAeR35Y86xF3AoHh5KSbEQ7Dm7ms2Na+c+ePhCh89YOvz2GiJmOzLv2rhwtF4ORdOuf1HNDpbMfXGKCCZYMXOURTyFfvj7nG8I17l/msk9k9iYv8XaKPrNkgr3LX2yZY4D0oynj68qyAc7pMVwo/AeBDn902W10KQ9LX+tYovGIaofbFf/y/zTB+eRKMqiBub72x2t5Jw6pRbhGyq1DJluVXyxStroo1iiBvU+oEFDzuphlLRN2Dvjo8IzxU/KBzFjOIE92Hp6IiPv2CAGVk0w519XrcjSdnyBObALfMgL9ot8AvxyD1aUhdzRPPdJk3gZSvjFIfR1J0iyvwZmf741fAeWYBuWJzmZqDS8qKS1ENqgceNxYwoS3JyRrM8N2YpkfYO6PeVlClaBNC8Tgkej
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:48:59.6716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e9b787-2ff3-459c-f42e-08de70117415
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4724
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 23:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19556

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D941e1f7a3b3f683a59a0e51fb78817eb31841430..fc93d06371ec=
35ef634284748e8263907327d6fd
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D0c5b72a0b975e5e01ed6164cc9547526c680fe95..cb63a11faef4534=
12da23e72c5e9b6782cf62274
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D49a4f3a41af39ec952f7caadb856418e1b734449..7e2c5ee=
21e318f67edb760f67fe16d41b1dc5a1e

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 4467d06d..b10f1a0a 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "941e1f7a3b3f683a59a0e51fb78817eb31841430"
+TI_LINUX_FW_SRCREV ?=3D "fc93d06371ec35ef634284748e8263907327d6fd"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 10980950..7ee10d11 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "0c5b72a0b975e5e01ed6164cc9547526c680fe95"
+SRCREV_uboot =3D "cb63a11faef453412da23e72c5e9b6782cf62274"
=20
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 20fdddb7..3cbfde60 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "49a4f3a41af39ec952f7caadb856418e1b734449"
+SRCREV ?=3D "7e2c5ee21e318f67edb760f67fe16d41b1dc5a1e"
 PV =3D "6.18.12+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


