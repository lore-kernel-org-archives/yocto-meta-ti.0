Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3CBD4335B
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 01:52:50 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3174.1765504368091410990
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 17:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UiYT9P/h;
 spf=pass (domain: list.ti.com, ip: 40.107.209.1, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7B4X/XrAdKJ/3nldqgSyebqOyXCvlIY2zvUUJRjp+kTx3gyCBs2rbkjxphffyQ3CqldLOUG/4zaY5QwJCTksKwFwcCcJzTsbUrzoYB6E2BokyZTk3XkJvH+zNfaibJds7utGR6enU8kQzPWY+ncHLQmPWHYdj4OUbRC6kP2wvNpqGQ6uXj4Jxaqusa/q2GyTKgsutekRwunn5zi+p+926IzPWeCducdAs5WyGBwSWVhpYtZnHH8hkMHaSpi1EaEmd+va/Jln83mLCkT4CJI4vQN8HSnSmf7pbQ217pYpHoI1CR5h1JWpq5h4qeCTW9dZaAb3V4TWD2Fw55oNWAv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx1hM43oaEN97wvGTCSagJDEPqX+20xb53I0IZY2YNw=;
 b=nZVJlYdsYSpOV0fB8yHMKvSKIHwroi/ZFbj0zyYgPEEDy85D0eR6o0siKs+svCbNxFsOQeVwvtqB/GoCwkdmbvXEnR0R+yHzsnWRvcCrQv8lHLUeqF7s+Zcdp/01JNcKMnhvt7qdED9LxOrTQkh1IXNqpzJqgtr3iou4jGaYTeMcw4P/ouSp8pCONf2MIX//Pm/blR1y20TzOCffJIR6Oh5F9D5v0tvYkJ6IHcm9LoOeZijClpaiwVLyWa+d84ARPvBU5Cu1qvZarGG04xSry44b17c0s+tqNjoVo0F+ujZMUYkpX8i0nWqMvob5Qb5Tvd8RElbk0OidmJ1VD1IC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx1hM43oaEN97wvGTCSagJDEPqX+20xb53I0IZY2YNw=;
 b=UiYT9P/h9PwbJTsnuVfkZVys+KT6TfjqzynRUiikMUEwlhhXex7CzW1fLnJ2lhLhGaMiJ52aFk6pQzvzSRI8g2d+HJUAnb95PlUNzqlhotORYH9wacghz8r7vs+OhtX3eGX0qSBRi8Z/n/kOUz1rkXVYUhlM/b5Cngh8Sx/ThcL8aWpZ8l3h6sIbEW/UA/C5FvjymZPjw8ns6NwbnSKGVNLHEPhMCcPu9HIGyaOF+UOMEUKIq7P+K6kNtFp4IfoI42j1m5bnsX9ls4u8l7jjLgLccp9ThMd/NiJtwN0AQueXUVQOl+2Tbju7wpq5TVlIe+EhNiAGQQeyUk6bo3mg0w==
Received: from PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::17)
 by IA0PR10MB7384.namprd10.prod.outlook.com (2603:10b6:208:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 01:52:45 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::8) by PH7P221CA0018.outlook.office365.com
 (2603:10b6:510:32a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 01:52:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Fri, 12 Dec 2025 01:52:43 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 19:52:39 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 19:52:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 19:52:38 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BC1qc4d1448419;
	Thu, 11 Dec 2025 19:52:38 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id A783D13661B; Thu, 11 Dec 2025 19:52:38 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512111451
Date: Thu, 11 Dec 2025 19:52:38 -0600
Message-ID: <20251212015238.1862952-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|IA0PR10MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8e7aef-334c-49ea-26fe-08de392123f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UZrNOcfghytXvgUZafw8RuLc1kvz6kpeO/E+1Zm5pFnH16ipb60/rMMMQQli?=
 =?us-ascii?Q?ecd0XAutYXQFZBSBUWpsImrF/xJwmiuyKTRyGfKRQjurzqWpHNkpmGjj+6SR?=
 =?us-ascii?Q?zqoy8k5cr1ga6nkzw0JMFSXoL7aM6uUTf4WcOYV64IA7pLMdKpAuh11+QkKE?=
 =?us-ascii?Q?7/btYpE0TiN5OSifbIEUNkCbztKBBdQ+u8AnjOUiIbp30OUFBQQa0lFj9cXW?=
 =?us-ascii?Q?y3OHv0S1k8YZ3E7+xLYoE43Z/hCS5JO3bTN48R2wZbJcXYFVTlN1Ej9s+SkT?=
 =?us-ascii?Q?W60tiPQ+m6tGqTqz5UGhxx6auzk3c8yjD4iDkOvurw/oq1T1vIjdeDWZW9Fk?=
 =?us-ascii?Q?HN4WJ747zyp6yN4MGoOEfQCFE3DcmXSMjS9epoce+ikcixeiKa9FqzLCLn1F?=
 =?us-ascii?Q?bnY7Leb3rK9wg3PlspLwr5Ojonkg/O/D794wFjVMaewYsPk597pjvBcrdgaw?=
 =?us-ascii?Q?pNXSQrBeIB43B2MovRljsnAgHsCmwvKGV9the+94LUHKjP9wmCQyFsqhqxIM?=
 =?us-ascii?Q?AAxeXLaxmUN+b+v3rkIL+l687VCofms8lNllf4XNTDWR3nCO62ZOcYeiBHIK?=
 =?us-ascii?Q?DiKOQtt0wWc4mDXw7auNMfONohXahn5qYGGbLp8fs5unb+mZXMjBauS0jfpN?=
 =?us-ascii?Q?3Htw7fI3LMWKFfDYRmLu5XzKdkRPVdbqAJBLjlffC1LBPfR1YM3LNY/RO9QM?=
 =?us-ascii?Q?ioKukXMKwwONu92FAFueKaMPCNatNb78DjOae1ZaX+F+gKEdoYdGWUTXQqGc?=
 =?us-ascii?Q?sAwmkHDlGg7rLNUke+xJj7nvOVBXycMY1jP6ODNveu5jQ8RTuNdWsKYcwHh8?=
 =?us-ascii?Q?HXnd2Qgg4QytzzkhvqqpHFW7uSh0CbDyb59LoTS7Z/JZfcuJXVl8eicxoBTh?=
 =?us-ascii?Q?+0IqPWIiCK7Dmnp+P1B5ZtB8gFkz0IM3znWydNB25Y61ERkxAAUOgAhJyWBL?=
 =?us-ascii?Q?3o0kvoA3gWhKQP3jaZwk3O2nkvryvKqemXPFa2B0/CZ9zInxSnf+SGyBUzsR?=
 =?us-ascii?Q?fBBIkXJIDM9SUHSaZ64okjqg/8p2cPuuMMSncCfzbzlnFSuAY18Kk6w84WNJ?=
 =?us-ascii?Q?ikIaC2xSFeCieA98hPJwmca0ZSBMuZJNZksBmmkfPEgVULN4foCQ823ZDtLV?=
 =?us-ascii?Q?FElPVcustzjbFkOQ+5lB5g03DecJuHtRDTQuliXHGp1/QJPs6qaqN+W6d02K?=
 =?us-ascii?Q?rBB+Kc2hp4m0uRmE4gER1tErACv8vxT7dZdC2Mmzb5TkPVEoQJ44NcWJRQRg?=
 =?us-ascii?Q?KUWwj89e7t3ngty8+worFuZ7Yh+wPuC9g/E5CwI8C7N3zP++hMoM0n5DbxCk?=
 =?us-ascii?Q?nzU1z+PupUH31/wZ3PrZ7R22at9Ct9eVYpebIg8AcUWXkoOWdZNgFl7Qku/2?=
 =?us-ascii?Q?6LHlvZwsPhxvBwYon9mARVbc/XfbAw/0x64mV+nlFW5quZh2KAdWhuXrdeqv?=
 =?us-ascii?Q?1VjuAC7/+3MINJGs0bXeaKy7Mm28gl55wTODqHzbCOo9BSbhgFgzPM3Oh9sA?=
 =?us-ascii?Q?bNTsmv8VtEGXeUmgqfmgwkuKhYcEf+zuHtZ/uA5LnPj7k/3ggOQIQRWgSs6Q?=
 =?us-ascii?Q?Ijx4jXlzPbPnrYaPTSs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 01:52:43.2169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8e7aef-334c-49ea-26fe-08de392123f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7384
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Dec 2025 01:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19355

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Dd7b3607a76e08b3be8f61ba69d959fa063f44b11..8ec0c42b8ccf=
2c9e8bebfd7c4e03d93fed555442
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D7493977a537fe3f8a45814c6284b942f7f09e035..01cecc3207f4702=
e223316e886d0dcf607be1e5b
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Db55c76863125ca84f6ec11c6b6f57e66a5dbbf9a..9d44=
16c67fd3165abe25e4d0d539533a109a90d1
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D31b07ab8dfbcc182da591e9e3703edd9f4ca7633..bb34876=
646c9e16fa18d60b76f0dd1c6736fad3e

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 682107be..51cd27b8 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "d7b3607a76e08b3be8f61ba69d959fa063f44b11"
+TI_LINUX_FW_SRCREV ?=3D "8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 72ac1802..9e733448 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "5939ceaeb664b8da5499dc4ecfa1caa7f5bcc31a"
+SRCREV_tfa:am62lxx =3D "7252a99fb781075db1987d8ce2c7e37324297427"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index a87b88c6..3c78abf2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "7493977a537fe3f8a45814c6284b942f7f09e035"
+SRCREV_uboot =3D "01cecc3207f4702e223316e886d0dcf607be1e5b"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index edc0eee3..86d0bbcd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "b55c76863125ca84f6ec11c6b6f57e66a5dbbf9a"
+SRCREV_ARM32 =3D "9d4416c67fd3165abe25e4d0d539533a109a90d1"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 006f4b1a..f574976b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "31b07ab8dfbcc182da591e9e3703edd9f4ca7633"
+SRCREV ?=3D "bb34876646c9e16fa18d60b76f0dd1c6736fad3e"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


