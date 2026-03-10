Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A58FCC9B8
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 04:36:13 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33120.1773117369588793988
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 21:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Zsmfp11a;
 spf=pass (domain: list.ti.com, ip: 52.101.52.0, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcDCc1k6BJ/D7Q1eJZ9ww8paHe5QJe2ABUTB7m4DhYHqeSCDtYbszl71odgD4kWMpfYaukrINsT6XUT6eMQbPzlBoiyri6Q1TIIU036nCiWfwlb0cpv024u0xHAyisMOV9ZzpuxuBBLLPtoFOOmcQUXuEdhjrF32vHu2H29R7diBf8tUXyF9LFMuZq2iBFCo4Qmq0ySR+yQwdeq0JeP0+F9eN1vy53+cJqGNCr0bGgvMLupYTK2ezrh+zbXoUN0m0g1o/jTWQ7R7IYY9T4Fj06aYrKcfPu1S5PMewCJYHYCWAdc4BRK4gA+vmPZUr/aunlubdJAuKBTVNoSSByfdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnN+sxC5e7gG/0sW2VlLbKl3rJyMUiPvQZXsEceIL0I=;
 b=g3SybJfqCg8ZXCAEYQytjivIYgO+W2Cua7gLxU34GaFxRFpBXGLTDTE9oLshO+rzOtDl32i+NTpSmbMhE7wS+8UcWYO0eqZG53jCAMxbl94KbQhs0yY7r1cUIQF4wxztkJRzCiLqvzYV9JKT9k4sZlaqvKK3lMCWHBo4uKw6H1vAMcUsFfWHiCwpYPoncP5jRHtmLde3Dhr7+C4UVUQKn8UFDxB1DDjkp/JlFLOF7nWElJkH8YGcI3+UaK6IiHkqkXinWW8WG1qv9xa2TSI1gAb6k5Ub1UsOsEyehBQlN8OsrcYkrYvhgD4tE3YPIkGpWtk4BdhZIl56ub5XucaPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnN+sxC5e7gG/0sW2VlLbKl3rJyMUiPvQZXsEceIL0I=;
 b=Zsmfp11aH4swo67dPFpkQI8dGVhzm+mOgs3KP2z7z19fs2E+wtACsNEMZYDx7K4PfI0E5jQuc157Fd17G9iPN4BwQMa+TLQIplDnUbFRhzvZJ++CY7DsEl4DuuVdsnm1AK4h7+XdEPE9dnEvy6E1KSYkt7l+43Y/m367HsMkADOZE1XJ58xFzMwFAOES6WIKwqY99uWDfYjf7xSTaxR1qT+Pvv7Vztxh+LzXhn1qIFXgnBHpfNq/KUHNCAJI0e+qDxKRF4z3zbR1WghTM6VSN+h+yfnljvjUsXrSI8EHILvm9iCk0fjenyz4a5fP3Y4svvKnHAzBaOI/OFpqA5tKZA==
Received: from SJ0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:2c0::28)
 by MW4PR10MB6297.namprd10.prod.outlook.com (2603:10b6:303:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Tue, 10 Mar
 2026 04:36:07 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::b5) by SJ0PR13CA0023.outlook.office365.com
 (2603:10b6:a03:2c0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Tue,
 10 Mar 2026 04:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 04:36:06 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:36:05 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:36:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 23:36:05 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62A4a5W01863237;
	Mon, 9 Mar 2026 23:36:05 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 7357D2A61; Mon,  9 Mar 2026 23:36:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603091800
Date: Mon, 9 Mar 2026 23:36:05 -0500
Message-ID: <20260310043605.3034427-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|MW4PR10MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f3c5cf-5bd4-4cc6-49a5-08de7e5e8b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	FfxduGcNXT8F1VZd1s0zkgluhB511edhuVFXvEUZ+A8TrvOGulPGB4a/UOdN+xwejQDrm6RbhufTIDk0sIPoYZPn0JfJ8b8ErL1vYEJEOpPkHjGCuFTZJbo5LNd7ukMQ2NLc/tIlZecpPnbu/h6ntICiGXA2xi3CDYsGEiSf9S6QkU3K3itOUV/b1q3fIHLdtI7xNXKvRWBoPs1zKEsR517Urm8LEeAcubEfHjZC1tAZUXfJzKaaWAOKgHtoQNCtF5GWXwDTZNCkKdUVmAcWbBLzuOIfSd8jk0QkgDmxvPyAgSfPRS9nHpIs0His2HFxr5dKw5rpzto+nWsjoOEKRuPvaWUp7pKXtciKvkgGxiiqCh3Shdu4kI+oltJSrPoQ9b2hgwmnnk+izzY1rX4ecNXWvgR8MZX1YdlY/lvb71yPUBbD/zU9Mr0BnBbhn1SCOHIL2ZysT5yrcCRiQAVLc1T7dPs1dsDRv3LnqZdijDlfL2crAsRZTyO86MK7ZHEh4+VrNXBnGLZrbSEAY0K2GtUNJk3oPiNqi19kMdRYrayMar0uUoK0O77mSEvcj6+rpZlYMRQ5rzPvC3oeGvHozfpjQ6GqsvyQYgBC5EIiaJSCIxX/jVxUF1kYCfx6cMILGQbnBqMulTtslXHHijLdv5deU6pXvrP2KBqgpZA8A71BvZNksDut2pqAaKd2yNyb+IqiKcnZlEwEBTAu0qKGSkUgy1JBGDsLltB8a0gwPfk3AANTsyFzKFOHcjtPyV9UYRC0D/mKfqQq+/UmjyuZYQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zCKXrOrbi95YwytmtS4sdS7ZfmJyBgAE96/cDFkgolVoMiraaSZD5V1xdFdcS2mOSwTvw4wSUglopIo8zKLXP/L9RuL0oEMunRabAlsxP8wEeNuRIgSw78XuOdwlMM8HLYnyfZLdT5TF9WzBhfd6GZrYLJmTx5S+zdO4HFM/ivfhgytOT7RRu6SYNUXTBBrG1mYXCO/ItILncWuvmyAQLwmNJONXfl+nDwHgtkY7XOhDe2CEMNy0jzPiDlaQtj14NBaEleK6K1w9/FM5LgaBn+9IAvfBUbMMmxWMZWgHuD4KhQzTmqQW2mqNIxT7U9UlqbV/EPtsFUaKTaBjdfPEvYcgN0fuhpVbOtKllrP+3XWGiXMAj46OryDBwJrrlhBg1FokgGeM0BaQAaZE9qJ37EWAmOY5sw0fyXH7SpSmfODW7CLeuZag1HARWNHX+8kI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:36:06.3096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f3c5cf-5bd4-4cc6-49a5-08de7e5e8b6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6297
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 04:36:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19685

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D8dedb46bfd7e7bba52cbedfbab10fe4383317b7b..e585d2fccbb4c11=
389ecd9afb00ec5e707267afc
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D1ae61a325571a4b242dac987edcbff0bf11cbd35..f13c619=
0c45bc24cc6640e39c36304bbc4ff22e7

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 9e8caefa..82a4bc9d 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "6cbb606a1de234c08aaf6eae57ae24f6422ec111"
+SRCREV_tfa:am62lxx =3D "50dc9697b977bf8491aee7a591195dac0b027f35"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7c00623e..a843d246 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "8dedb46bfd7e7bba52cbedfbab10fe4383317b7b"
+SRCREV_uboot =3D "e585d2fccbb4c11389ecd9afb00ec5e707267afc"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 1b05b120..60995e09 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "1ae61a325571a4b242dac987edcbff0bf11cbd35"
+SRCREV ?=3D "f13c6190c45bc24cc6640e39c36304bbc4ff22e7"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


