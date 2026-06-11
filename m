Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37C1CD8C9D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 04:07:17 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38199.1781150830397643230
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 21:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kNmoAPFR;
 spf=pass (domain: list.ti.com, ip: 52.101.57.38, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvBoEaczQO33R5m6vHGJLuTUiEfXlUOvyMZLm20Kf8FruVTDUWlYh99AkKuJDBduFWL187xvVZM+crccM/dlpH37NZ9DWVEAx+Yrn7j7I4x7AUEWUVIKgSiYlT4aNwyBe3L3M1OZZiZ+sRuwBovMh4C5c5Q3yMURos17u1uhUJYdfzRxgtaIwG7a/3cSdiaM0bDhAU9ebfsMKLkMQ2pWq7H2/YNWhgmvm9BUxnAYwq3EHjb51tMPIRnHs44s5Iv4lwCrAQoBXD9lNHs1TNP5PpsbqLXb+8v1p8c5w74avR9Y5SkhvjO5L9Sfdml2RhWxb3Gj9oK/+DPlJElgIpKNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+6UFtQNUneIcYw2wXJeHihIYRxtklAx9csCcGKIExI=;
 b=cMLlSVQL6/1vN/3bmv2fXBMaTQ9P54uJDGyXnptJwtW3tpDEBOU0s65mh6c1DRsrOcKvcl6psN3M1SNfIztDeJeNFr6SUo/qcJ3K3eqs6Bz97JFp5DnHt/Gvz9XmoXlwYVJjfj7E5TBoPTw5chpu7KwPAufDDWWI5wysSHkv1FWYZowSbdTT2t1bly597ZUOpOLXVKTmRuxQ+DhFivMgfcseK1H/JPiqzZfQH4QiqUnNU8cMLev1MixIU4nvxGrutT5/v6YEkWNF/ZDXhqWRYeGUFDEb6Ni/iX4LAhD3+ZoCNb1ufMTY5eRdNv0HjCDQwATd50wQsHsYvMXiUSFp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+6UFtQNUneIcYw2wXJeHihIYRxtklAx9csCcGKIExI=;
 b=kNmoAPFRM9SCiCWKv2T7JAGTc4F/OHLg3+5u+B3XUaBw9BW3dyyPjMjR0WwjQECRrvWhKSI3JUhQT8yTqvRS/Bao8HEaBSkcEf0JIKtagSJIz6BN7ZqBbClykOM8Fdzw9mFdgfbohxUiwaEtq4Pn6RDHpkiUanTlergTrn8bx4sVvaoOSi1X3LcPmtB5vwTmrsrmiIN86srci4TABlPxntjBOwk3rJsHPaO8Sc+6jcc74ECmRMR68aHXR2BkgHk1E1H0/M0441wiot9DEAC46MiR9nJdj/oeFQMuaSRNmH/8rSEcZ3lrj0JPSAS8GAPHnLi8r9WQANE4rcBIu9zb+g==
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by CY8PR10MB6849.namprd10.prod.outlook.com (2603:10b6:930:9d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 04:07:07 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::b) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Thu,
 11 Jun 2026 04:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 04:07:06 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 23:06:46 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 23:06:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 23:06:46 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65B46kR61076489;
	Wed, 10 Jun 2026 23:06:46 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 400FD2A65; Wed, 10 Jun 2026 23:06:46 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202606101800
Date: Wed, 10 Jun 2026 23:06:46 -0500
Message-ID: <20260611040646.3657421-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CY8PR10MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 0038b864-4fb9-479e-5093-08dec76ee706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|6133799003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Bla8980D5hsHQ1d12n6VV3riyOXiKVNTcXw6gKM/xkJWsyg/cxoyfH5N+feTHY4z1gS5m+Iy3sX14WbnipIhJDxUdCxz4MOkGGIoKrqN1HnvnSZWlE0XqGOCCWGeWkNXhRBC2UBsb1+3ph1D3vOxpZnHb8m6E2KGwyOJcM/35z9Khwd59+q+iRq9wPc5OO4jpOyzasrhCt4rd4KP9LHDbO4Kd7t7gUILU9tTiNloww4v+syIhK6sRANpymb/sIpDYg6r7bnuOhWzmdE8muS4swq2Fd9JjAiPFtOyU0qyMIon51OninfWAPelmR8CtAcJR3OkRaBgZHKA3aLISLgpoOtSgW3F1nTlBd3hZ4YHF8UsrzXg6qFrHoEz7w6lMLSTZ6g/0I7H214wikpF7SANNhJCH8Lr/UUVaoOC3tV2i80PaExZS+Si87gpxSUXOzllKZvCHBnkzUvOWk75qpOXjbD9/pVnCTLIFaVA3SrCnT3OlpVWRV3SUhzvcwtgYWTdt2rPnxedggvLgOr5WKY689lXqe1Ar5fed7r2F8k58yv6mYxoDdKhjnxtuVawViFFS0JrJ/Yun3WRDgdqMnmUjLuJasWO4Cr91hNuTLZr7cJtZ3xPyp1A//4oZV1HlBGIgLWZL5g4GNJKxKeqyJBMGg5HDgui1QmVL7b5oLHukfnC0emRioLXA0VnlVEfxoFFHHWZ5xjXv+qH9GmK7yTeUC3ADFEBcg23Gy/o5hxooRw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(6133799003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gGgvBpuH3kyfMzPImhxMUeH4ZaNt4BXyd2Bbhr0f6sy4/NSOsprae6ec69pCn8yZJ5hPH+pV6vSsLFz216qX2nxfz3rHmOp9CTanGuNiKvERZ8qsHAk9MmSoJohQhyqwJCcOoLM5wF9jqZbhPmq4sBmtSxctWC5xH+6fSuaXKJA4dOpbdvV+INfp3JxKBK/k9m8DN/eRBh3pp7HD9ugW0dLZReakf0q+4kJ1bSGMoIcG5NSrFQ0NGB07UkgYs74h65eyrC5iZm/vzBUe1Qi0BjLEsM4C8xZDjerGOjrQE9c/A+Pb5VAFC4RlN9QuQoRIDr8PrI2duxnyDZQLH0qWGz2nnQqjAZ7UFOy7TcH8OZZWFoVwXCpmOuwrgBbg6NJneV2ISOHy42NyGlXQfXHEKdpmngfHlqoFr3T6h+kBA86pfnrLzalcRKCjq5S0SXpw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:07:06.8090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0038b864-4fb9-479e-5093-08dec76ee706
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6849
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 04:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20019

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D9e9d50ff563f83db86d36b72cd7fb4f487d6b414..ec029baad8b4=
b147af8331a5e099ef891e5ae1f4
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D19795f63be7ee27e38b6e800ff6c88a2feaae13f..f6338e22d2ac077=
7a68fb0f295f4cf1e3e63f659
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D1f603935204df4b34054fa3bac80158e528e2c36..617c6fa1c50fab2=
acb3955b8888ec71ae7630769
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D62fdc7890cde3197051743120ff44162b7356cc5..d7f2=
b5b19f14fb51ad279f76fbeedd0dfd40b69c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dc52c5589aab8c376f975b1feb7b8746b7b6624bd..4e3bcc1=
0a5d1e9822e0ed2dad5cdd16f7cf30fe6
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D0472fbafd7277ece9e1bae4189bc6099e33cdbc4..4c3bfa1=
5a22a5c6729519e730459c483c125d5db
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3D44a5a7ecf3eb23614b801d7f5a10f2deed4542ce..b042b729cf573537f68fa3ea5050f=
5d22b07c811

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 85b73854..126c46df 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "9e9d50ff563f83db86d36b72cd7fb4f487d6b414"
+TI_LINUX_FW_SRCREV ?=3D "ec029baad8b4b147af8331a5e099ef891e5ae1f4"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index a66862be..10697fa2 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "27ec63132041f7b9c6b3747731de4f8c6036a430"
+SRCREV_tfa:am62lxx =3D "bd4afc7d9dcc492b8894fe88a666c880b2fb1734"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index d03cae2b..31fd341a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "19795f63be7ee27e38b6e800ff6c88a2feaae13f"
+SRCREV_uboot =3D "f6338e22d2ac0777a68fb0f295f4cf1e3e63f659"
=20
 SRC_URI +=3D "file://0001-binman-migrate-form-pkg_resources-to-importlib.p=
atch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 56afc908..d3a00652 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "1f603935204df4b34054fa3bac80158e528e2c36"
+SRCREV_uboot =3D "617c6fa1c50fab2acb3955b8888ec71ae7630769"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 0d974c0b..21baed23 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "62fdc7890cde3197051743120ff44162b7356cc5"
+SRCREV_ARM32 =3D "d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 8a86e1d8..33972782 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "c52c5589aab8c376f975b1feb7b8746b7b6624bd"
+SRCREV ?=3D "4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6"
 PV =3D "6.12.57+git"
=20
 SRC_URI +=3D "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch=
"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index ed87d378..306ac881 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "0472fbafd7277ece9e1bae4189bc6099e33cdbc4"
+SRCREV ?=3D "4c3bfa15a22a5c6729519e730459c483c125d5db"
 PV =3D "6.18.15+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/me=
ta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index a65c2bba..5514f2e7 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "44a5a7ecf3eb23614b801d7f5a10f2deed4542ce"
+SRCREV =3D "b042b729cf573537f68fa3ea5050f5d22b07c811"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


