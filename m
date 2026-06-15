Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487AACD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 18:53:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137044.1781549631922455343
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 11:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=raaG74vy;
 spf=pass (domain: list.ti.com, ip: 40.93.194.62, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFveoKqhgz//XRSAoNliqPY9o48YWuOQdoWXeQmNj/LR7pK/otlNt71TEithEhgh7vD8YubjXc3DSMkHQSQPlDy2oqscLe6oTLhuKzu0EiaSiIKzKSuDhfMVONhgYaaUB0ISGbOIPofthcB+Qf0eaJ3ecHuFDADZG147FaSB0abgeJQALh/pQVBBMZfbER1uDLj2L+dLiGqonUzUfygKlkJZ5m/AxedcHpcPsivlB7tQQHSGwJP8fHI7AcfbEW8YDgykyhBpo1HWvUjB6Vnh09EsGE7WZo4OCIZy4eS3P13195RiZyJJBOf4EziiNXUNVInb3bqDI/4rwv7IGjRiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHUEi25lKIM1i9TjuylU7/WLK9yOTUhr3pfXAHJj5Ew=;
 b=ydwQHo/KF5u14JtixrKka+5M/+rTjuAHRwy9ZYxXMinOCcrBmids6sIJ7i7haxbzoFPFgR/FXUaYKuSFneruam6fh+HLNvdsXGKzI03AHSfTSqwIVAJCn6q8zsBbISouRz/zmaTKsSWhaNUbUIxVqnvXjAcr38LoIERS1Nnbu9hek9CqWftRt65qyyhswaOx63qafQ+3g8Sqa2JmPyGYCK4Jyr7Sc2K7elYwp6fju4xGAgs9RxCoPxE46rdrLyhl0op51XiYMMJqiqIpibAd1gW3037ZAbZ4qtqrg/WcUPiEl9qMr8SSR8zyHyJq/nOPncLR61uJxKAjOshpsQQJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHUEi25lKIM1i9TjuylU7/WLK9yOTUhr3pfXAHJj5Ew=;
 b=raaG74vyMFlewjTdhXSrjZ6I2eTF67LwTvsAS1YoyOF38Ph66xZPpFJQFaXT1AHSfKk/BxLThsI1RSK2SgSzfObLaWOjXwOR4EKQI3mnGwBEvcngLCuNnTOTzyz0exVK6vda8f4jSJq4+YBKCYaUFCXJUg9sBagLOZWmxomWSf+v5Z38M2u2MeN7VBXQuZ7rOHY7SFBDtw1LwBt/zQnC309HQ4RxX1eWBKv/VTjetlfk4bqkTlcXX4F58f8aYJpI7iLXGP+cbx4d3Rw1BK9GAhyObHmXQ4ySujJqdrMXeo4LAgOVURpcccZqLKJ9wYMdkEgfRInAZjxQBNji6KiNyg==
Received: from BL1PR13CA0438.namprd13.prod.outlook.com (2603:10b6:208:2c3::23)
 by SA1PR10MB6318.namprd10.prod.outlook.com (2603:10b6:806:251::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 15 Jun
 2026 18:53:48 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:2c3:cafe::1e) by BL1PR13CA0438.outlook.office365.com
 (2603:10b6:208:2c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 15 Jun 2026 18:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Mon, 15 Jun 2026 18:53:47 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:53:47 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:53:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 13:53:47 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FIrlYb2498727;
	Mon, 15 Jun 2026 13:53:47 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 1BC192A6A; Mon, 15 Jun 2026 13:53:47 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202606151035
Date: Mon, 15 Jun 2026 13:53:47 -0500
Message-ID: <20260615185347.3206644-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SA1PR10MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 09cc659b-0053-4824-275b-08decb0f6eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vVJeApdvY5Odl6XaSRwCmOQO5tw/RVv72K7TTmFX6KlHoFPw5tHcPVycNtFd+JTvIm/nyxREHwwvJA9dEXOsjRlvDcCgybOl1t51MVPnr7na4RvmXUu81ULhePmQh3pNpUV3yvmah8JixDOkYA+sjAFHF6ElXU9rF0VM+MEmMuY5E3y990HIgRm/nEkp1q/t2iS9bgfpdgZ57KfWh6AJ3BmvZxhWLOkDTtwfAtQ3S4/J60g6XC46+qN+lsq2ZcCwY38njVi2De+yLnmYzczHnW/OqeupYb+rpG6xsH3s1vLSNuBIN1SBp8TxY4n1/izD/m0CDkpqFcxFqc8gPmsUCkIIVdkORi76CGEAL5agzv1qwrwTD+goP4rkOP9HijK8E8FdC/4xqQaFrE19HCWhV/Q5wIOYBz67ojzVdDM2a+lRI6FuCw0mnjUPv+cw9OSa0wNO8UsBZHJ2ubvyHarx5NWyBOydx5IPcFWrce0DqmuJts80V/VwMJUd1yx3NKbmPgk7LKR+0yhaWDhCNBkTjQAjTQ/thjg0nQCnD9V/vGx9p83BFIy/M3GVWchHaoqDjDZ8068IfMaEac68cGlsC9E0rQgz/SxwvCiZ4me69ESAfj3epdI4nnl/EAEgRAAgIfzm+KNR5GAk4r4UFeQ1cji/wf3orvKV54PXJrGpGD6IzwVrAyfLx/t0iHvhhqhribtrsqZ3jA1tbKBqefAvczZVZw+T1YbNwAlIimpPIE0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SSNDxH9WfDMWiBz/UuZS9+OXMdafEzn9itAaoDSxBRZy7ZjkHhkEIlWE8wK2vVh84r/jfTenTsf04dXzA8gSOipo73+3As4xnZgCg0LQh0CNItQHDEmGz57XHFdMhP7MU1kUlRJtvN0naMxKoWghPh5iPBLZKYrgSDSm3WwPZLHBXDN/+vXhiCtFeCHjsIPjSj98JeSy9B6A8Zms/KLTWk7H+gzNOO5h2cYQgO/4RWRuo65VuWUfuHDbCBadtcRcGiL/hq90qK1Rptx1rV+y1NOG5YCOjsgefXKrh0cuf8+9mPUm/12l35obv+QB4et6depVGJ2G4oZWoNUDBmze8OZ9L/99FZX9mtJP2dMgaacczUBjgz1uwpZyKFofWWrRHJvJ9EFrGTdXm4LUm1/iXBUw+vxU76j5+CWrdP/4oJCTokGDlQMVlLic1QiLEYr7
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:53:47.8056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cc659b-0053-4824-275b-08decb0f6eef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6318
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Jun 2026 18:53:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20036

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D8fe6c3d6cab73545d14e8c0969d19c8d434843fe..59351d453295=
295909a25a68b30f87e5c85a6e8a
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Df6338e22d2ac0777a68fb0f295f4cf1e3e63f659..1612e4d1deb11d4=
9304c715576854b28cc10e34d
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Dd7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c..c6cc=
0cab5b8575a2a70f0c4f9dbc9981f367d8e3
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6..98bbe0d=
37952d0ce1b6508f108c357ceb6d58bf3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 57c31696..d8416ce1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "8fe6c3d6cab73545d14e8c0969d19c8d434843fe"
+TI_LINUX_FW_SRCREV ?=3D "59351d453295295909a25a68b30f87e5c85a6e8a"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index a8197c66..8ffc1cf5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "f6338e22d2ac0777a68fb0f295f4cf1e3e63f659"
+SRCREV_uboot =3D "1612e4d1deb11d49304c715576854b28cc10e34d"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 21baed23..64a5e0d1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c"
+SRCREV_ARM32 =3D "c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index ba02bc13..2ec29a12 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6"
+SRCREV ?=3D "98bbe0d37952d0ce1b6508f108c357ceb6d58bf3"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


