Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89668EB5968
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 02:24:11 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35805.1770863041864582630
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 18:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UiEDQsdj;
 spf=pass (domain: list.ti.com, ip: 52.101.48.7, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZiK46oD1gEgB5O3+Nqn4TWfKQ/7w/8+KOygTQfjRWNzIq8RCP+dWuDKjVOXGM8ftCzqLEsUdMdtyd5rkk1LChpMlvJ4AiQSedpBgXNMUg+xmRLi/vgMl8xOYe6Vy1vKBBmUOkezSUsVSVnqJLHSvdPuC5dYovkMT3XvaHNOSOFRaq+6e2lM+9UBMk4XHonWvwQxhXIl19zzPDjjTs7Y6T0+nXUX+NtcnRowl52H62M1kocWzs7NJFyq0c+pMUwq0coU5w1oR8s5iw6aN8CfVCL1aK0Q594MeMvMcbUwcdaBD7WKHqVyb74EbpKRRceiSK/w41LKa72G+RSYcgLUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5ZqluH8QMtuWC8xD65vXJxDwsXLtD4q/jZBbL+28yY=;
 b=MBNfxtZCIKo7wgtVUHN96al9/XNAVR+pvsKAEJ0hczEkdPSZVUTHDzBqZ4M9TUaxO+6cZK2nPn9uG++Grc93DfkOZOXQR1R2CNkupAomEP8roVIuwI/mDJ7KjnogaZeS2LD6w1j+Qq+yhmNWy4PIv7EkjxMN8/k/7OA/B46TiDgo49gZHxCXvU5dnOhAP92DVCc+AtxbB0ghqDeYRmnlITfgyiR4zPgKggrXAydFVZpa1qOYQ4LYZITIyuktgjDjGPv6HkOUHC6lJtQZJtdKXyFsFd1h80s9dK87agZ438y5X3c5u8BheLcl9zig76LvYltukDUM7KuUohPCkNN+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5ZqluH8QMtuWC8xD65vXJxDwsXLtD4q/jZBbL+28yY=;
 b=UiEDQsdjK1lstkC0MqZTF/gTQaxNxa8kwE/fYRhoYDD669jDq5BVf5b3NIqwXX86hVAh2ieUX/zxw4F1+7mKQdWqT691LRqt32MFfM/ShIRglvQ9U1LPrdxzEAWWDhylMoz5BzN6iTO8ygZtyly8xNICzvT5GUjprrx0XjRjP8DOkofUfgo0tldLurCcGCwNSH0C8291uSCBQq3ucVwRGJqPVw8RrADxUfqvKz+5WqPCXZsuEw1VCAghc3gz6J/YyivdyX0r/fRMWx+c9m+oSopDo6uuskDzOVlxwWbItj2KSMpJQ4SYRWkHxaCRofPmzj83tQQLlbm/8qiPzWRdZQ==
Received: from MN2PR15CA0063.namprd15.prod.outlook.com (2603:10b6:208:237::32)
 by DS7PR10MB4847.namprd10.prod.outlook.com (2603:10b6:5:3aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 02:23:58 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::5c) by MN2PR15CA0063.outlook.office365.com
 (2603:10b6:208:237::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 02:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 02:23:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 20:23:55 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 20:23:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 20:23:55 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C2Ntsj2689491;
	Wed, 11 Feb 2026 20:23:55 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 991AE2A61; Wed, 11 Feb 2026 20:23:55 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
Date: Wed, 11 Feb 2026 20:23:55 -0600
Message-ID: <20260212022355.2572913-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|DS7PR10MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 62337afa-91ed-4127-e54d-08de69ddc686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fsvGIoj/Mw2owYHKxuO2TpPFSoImVxStTP6uVJnUULrnFQ5/jtsxDPfhVfon?=
 =?us-ascii?Q?5RauwTODyvFzJq0SIOjbtR8WxyJgKOB6gp6gAflEb9Pdw55M90qSgvzPY4eA?=
 =?us-ascii?Q?rsbmMEEw/5bTI3gSbWBgoGTWp9bs21ywGVN41/5W+K6YKtz7mjxmikDvMb3A?=
 =?us-ascii?Q?ftP+ipghXyrw14JCmyi9OCUGorzrBf6XAaoaIYvPD4juZEAG/FWsyIjphF4z?=
 =?us-ascii?Q?L4uCEL3URzGPliSBXqqAhz7aiy56GLmgI1gW1NUDkhF/Bjm6VYXmQ1LL/HDG?=
 =?us-ascii?Q?Y/donchl2BLn2ZZ770Q4CJVwrP1M+7mQUAp9woP5wvcA+4IZXgtxfrWLl+Cb?=
 =?us-ascii?Q?D1BN5q2hPmxefgXEGUDhcCQjPUiYlq8N1jeALuUGgQCFINKmjTFJ1a0fcVQ8?=
 =?us-ascii?Q?vQFLs4wnGI1wMBt9VmMzRpJ0jSkITGKJnUsHrfpm4hH1kHKf2Duz9tdnkSim?=
 =?us-ascii?Q?7agP/f0YXyJq40KV/LHjRBtkLcATgyt49kU7zriPdOERd+eD6qvgd2MZU/1K?=
 =?us-ascii?Q?9fEVlWwBWCFgrJP0nZUUf1SBS46xn/vd2Gj+qXoLQc2dGpzY+U6oUsDrFBDd?=
 =?us-ascii?Q?/uunTdyn0ABFW7NjN4RkgWF4ITVMtaGG3jrMGIcKdnWlT8FfQcCZCFZIGmmM?=
 =?us-ascii?Q?NESGoqvj/Oi3025/OwXgafthdNM8Zq4avrbh2tH9+lvrqsL+KWDAP6vO9NC0?=
 =?us-ascii?Q?PnOGwJ5/D2eTdkz5TzChzfeKitvWkefy8NzE2ERUcCVD1mOxcg8xdEWcyJqf?=
 =?us-ascii?Q?C2+WgPTJVylUWtYlMvnm0Msdky4qgksxOlufcCj2tBhPQT0QAaMHWzql2aQt?=
 =?us-ascii?Q?r3sJ4L5dYLuVFTqopg14ZM4VjbPOhJ9lm0DXIS05Pv1ncrGl3vuxg4xFS0x9?=
 =?us-ascii?Q?UFOpTDZi0YvFYw2kG6VpmM9TnOXG4KvteI6wqaam6WmX/lmDva+68zHiouss?=
 =?us-ascii?Q?uO24CXNQy7SynupFPFUE9SyZAXwU51c0LCPca2d+p9Qi0HaBT+vmF86v6gCN?=
 =?us-ascii?Q?UgkQPk5RZ5ionfJN1OsUzW4/zgpJwoOog1yZEvX93m+pDLfAcPvZXPZk7hB4?=
 =?us-ascii?Q?hQK6Un95uDZqBN/lQFl1eBjxDrF3yzQf8OBnjHCErkEHYgCLiAJGaC9jg2Ia?=
 =?us-ascii?Q?/Fb4450YQhGtQkEOKt/Rknk/7LEzlNmkyMd05ooVCd/Dq9OIxwURIBIfPdyp?=
 =?us-ascii?Q?02QGyUYaxmQMIzy7bgXngiO5w8Mx6aOhQdjhsSHgcy7nOzEM9fTvZQp1Jcsi?=
 =?us-ascii?Q?a3t50Z13DQxCPGkH7VwXQ10LPyK0V23OGAjrkQ425m4gUt0899h4Z//3ENJf?=
 =?us-ascii?Q?tZdvUb34y3WI6tglSsJMC8KK8zadr8yAy7CDuwX9yABa/kElOfuCvzb52GZ6?=
 =?us-ascii?Q?VfyHAY31kB4w4ipdaOqKj4/tOx+aCuoyQa2JbGRj3zcFQp3L87/U90kH7jzO?=
 =?us-ascii?Q?JdV53mkgml1TFcXknXPvaBDFYUlaNuyAsl/4TeRiL1B6gB3tiJc7h3VXhPJM?=
 =?us-ascii?Q?ixSi5AAgLoZ6WAnAiqkap2gJawP5Rt9TVRexOXVD2xttRP5uphoLH+vK3rog?=
 =?us-ascii?Q?AxxweTsahP72kug2XnecPtsvpwUVlpPqi6rhBL+U3QSLMs5ZTF6syi1Z7ooz?=
 =?us-ascii?Q?mweEmzYRJba4ZCGftf7UkztCc+vKwdOyZY6KT/ZNj+Jm0Yi8YCL3eXGMO5yK?=
 =?us-ascii?Q?aREgxQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zGuT7xN7K4A5kmhrYCRBSq2cgSppZtCEhB2CukaPziFoD8cplL/20sBemR9XZl7l8o3OLTbJYh2QoPVtMmRmcrkm3DH4paMyAzcZskmw1NtPo8+VOy2inTRjq5CjHEFRpxpUItVxG7Swp0SRCX6CLGraqlsKouI8TnEiEQmWvxwqGweeH+Hq8jorsoJBBXmhcbvWDsZc1TK1ofsiO+l7QMzkm43Qia0QKXYy9OF3MgyPs9WpgZDHyWw+IrgQdAcCEXTExrEcNF5RLxltHtuRj4wfWGdxU9x4+K2MApAYxj1fWx+/8xm0RgC0hRcdj+rKad36lOIm1UWhw1KM0cW9TObcRiegMioGdP2QtjkhC//ac5q0vSuFWD/boUBIBQ4NBYikRQwFT1g+lcaIudP0i2PGX8uSW4psEC91o0zKxdsN7fUNoYamHn69NE0Fg8U1
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:23:57.1374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62337afa-91ed-4127-e54d-08de69ddc686
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4847
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 02:24:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19496

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442..dfa62d2a6b9d=
e71dc6fb682882834c9390324c42
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D7db1482473e9a9562061c6f89e6d3cd86a17e616..41842a7ccad599b=
3b5aa4500de859a0f01583a8c
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3De36172c9eb8513198f33eee06b8cff28c6556e11..8210918=
c3b8678d9781cf982c86757705405bfb3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index df200716..a624b730 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
 TI_DM_FW_VERSION =3D "11.02.07"
-TI_SYSFW_VERSION =3D "11.02.05"
+TI_SYSFW_VERSION =3D "11.02.09"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
=20
-TI_LINUX_FW_SRCREV ?=3D "8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442"
+TI_LINUX_FW_SRCREV ?=3D "dfa62d2a6b9de71dc6fb682882834c9390324c42"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 75302049..de315160 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "7db1482473e9a9562061c6f89e6d3cd86a17e616"
+SRCREV_uboot =3D "41842a7ccad599b3b5aa4500de859a0f01583a8c"
=20
 DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index d51f4329..aca5f102 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "e36172c9eb8513198f33eee06b8cff28c6556e11"
-PV =3D "6.18.8+git"
+SRCREV ?=3D "8210918c3b8678d9781cf982c86757705405bfb3"
+PV =3D "6.18.9+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
--=20
2.43.5


