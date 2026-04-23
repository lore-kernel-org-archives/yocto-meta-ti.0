Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2B7F99370
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:13:43 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17146.1776942818222813269
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 04:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jLTql6NS;
 spf=pass (domain: list.ti.com, ip: 52.101.53.60, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVs5MBhKkylFC+BHsbTWFno4Rdwbm0sfia7y2teenqwLhPzdOxfBJawtVbzAZ/RgCSO038+e1QA/6PR2Z8bjzdtuEuCxPs2bichAGkFb/vxKxAjKuIhu9zUzshUQbOIUuJQ7RFlHUz9Ed6Mr84ynREhTPQTgydK0FOe4Y5f3aN0dxGahmEjihw0Gq12dDClB81gCS1pfqpMxG+RmWuSxABSn1wYcjoqKzLll22jz70rjFahf+2Ga5kp8T2UtzHnP8doLskuvXOzlbYuYYj0HlkOEbvzAsd25ajDpXG7Sb9zstfYJ9HvneHZcfiJ+L44tUwsgGopChMqvbLicmWAC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwjkI0B9JeONhM1LPY/pNw25dd/1eTETb1TNT+/eqK0=;
 b=CHg7jrUquX2sanhnCOc+vqhsZ/h6omNYK2SOG1fD5cSGz79A73KnpkPFWclA079VmrhizRMUPRiKgL5t0ldmCQRqRw/CyC7tMyBapvkvBUzf4kaiGsVRqdAwI06Hz93RYnT1fljnTSE7Cc7XyGp/3He3fjGigQkFV1XmmRArSSiyIS9jW5qw9JWIIh37yqSvlz0aAiokO1PAlRJBVtyUSnYuatlx45u/SDIVzsmSkTeCuQfJtTqp/3nnlK9ceL3yLt9ojMo6I3Kmr1S9GQ3om3T5+Ou/dyyWJtxZQ3T9SRAd/eE+xuUL8NttnCwohpiaDzHRo2V5wwXXS2tAjPN04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwjkI0B9JeONhM1LPY/pNw25dd/1eTETb1TNT+/eqK0=;
 b=jLTql6NSfqX54qkF0xavbZ//QcLYyU1x/MOI04S6fbfE1RbVqYmpwEOvI2rozJOk9vyTfZIJu6bl1QYnU2WQHb86HESkeR8uanwmPCXVh2gszC6E0Dj4eJM2hV2rOggH8JSeabKOc0Ss9QgnzAPNlbfuS6vVzPL6FF4ONXxM0NsFaz+fbGjT261KfoDQU04RD+MR0S/FU7ZtSQgWvbcipqrepRxgFBpwvuHBaAUAXPPwqZvJVyzJp1dzcPAMfxvWQa9DN34bfofFHQYRNna9CSRCTccx9g5fGwLD9GPmTuWTl4fATOuHf5Y/8+LJtoGGk/mnRxJ+v1vXZjEDD23mlg==
Received: from DS7PR03CA0157.namprd03.prod.outlook.com (2603:10b6:5:3b2::12)
 by PH3PPF87283933B.namprd10.prod.outlook.com (2603:10b6:518:1::7b4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Thu, 23 Apr
 2026 11:13:33 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::af) by DS7PR03CA0157.outlook.office365.com
 (2603:10b6:5:3b2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 11:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 11:13:31 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:13:26 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 06:13:25 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 06:13:25 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63NBDPeA1476217;
	Thu, 23 Apr 2026 06:13:25 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id D85562A67; Thu, 23 Apr 2026 06:13:25 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202604230400
Date: Thu, 23 Apr 2026 06:13:25 -0500
Message-ID: <20260423111325.1686044-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|PH3PPF87283933B:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fd0946-c901-42dd-12af-08dea1295a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JmIrkmWLTxNZuGq7E+U70WFd2KBvGTPEgBbW+zrVTGSMyehcv7fKpsSdIiHwP8Nr1yJ+fNY+aNBcdazNvo2raPw1Tb7UDGs8k0cX4B0kEX/H6XlmQvTfm2XaWLBmD64aVCDXy6MtyFdGTqKV/5oTIWbZRsxI/CvzbrCN4GGugIdXz0pkv5pt8288HEMItr2evs8MAT0S/ygiZH0kFjIw3wPc42rbvVre4Lq/M8iMGaOWkT6elLoAmLPPIbQ1xJXBvXSUDfQyPVgz2cqF/nGUsvoHWn5kNL2Y41iEaqMFJPad7A/Xb7wxW9CEd0tNi+ocTP20SB4xr0J7MfDrgUcTEP4dhBPuoOM1zSAt+ucmIgTArjzVS62DzZ2j/rEOHA1oYZBPhJFNkiMTKCmY8ba73OU17kob6UVHH37sEVFuzFs8/DJJ/H8mXg2rdybINgU1wUI293PnB78Njp9u3DHte0S7Yyw+HtMOr+if2VMr/tZ/6YrRRCwSRyCb8O7+aefavcWG3CbM69N1MB8V7LH+9swL2/VOeOj4kAdLHRbeBMYkIRSGSg4zsQb+UochrnnXXNeiNMOZjwK9B5wMjPDsSxum7V0V/iWBRx9Np5tzO9N+9jL9q3O3/ls7pP20TNzhZczrQGKDVgQxOeaXmgvG3B5/fGqLDJxrdANr9seZ7HV69p0o+wrFsruKAmbU9NMFkZO10MPSnF0Ww7Mcamlx6nNNR30fm65lH3q1JrxsXr/UvPQGGAmu5BTzfnIRXI3q7RZNa8L5+U/3xlmegwOLww==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vch960Jo2GwQp6rw4r4dh4D+GkbSVLfHj1jyH5Ce+yj4cC6JRspJaYQF571QqNAdGIq84+ZJd7NezzzU2OlGMJ2QYC6InhnareGbqCLQAHY+hKC8NKNBRDAlKokq7LNcmFY0yvH4EpxinQfGz/FY/Kf2Iy+fZnNG0v1q0ZEWu7JoQJ49XLi1v8PsrnLHgxD8Wun2oJ9/efysKAerrKpbGkO5OEHK1Ar9R2lrkxtISuMo1laFOQZDe0vFaBFyv9oGRbuLAyiNo0RuLnN8D6zcFU+9twyFvrdyK+MQxlTowG0SNdZTuaRE3g5ekfQ/D0lmVkC/dcR20mf5BBB/mpqMULzhRsYKJ05lujatAl+fK34eruP+0AJ1so9A4Zt6QuMRgIBxb1yKQn5i12G/fCsbKRfF6qwRfkc0059e6bQPQOzb+4SqQaFh7WpKbguP6p0w
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:13:31.4947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fd0946-c901-42dd-12af-08dea1295a68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF87283933B
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Apr 2026 11:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19875

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D7b9dedb046eb6a720997f61582c7b13da1b5b9f0..19795f63be7ee27=
e38b6e800ff6c88a2feaae13f
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D2549829cc194ffd9e38b755d2e10c7fc4cd971eb..ee3048ee0822c35=
312379b6e24b5c80e9a845110
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Da3bc6dc973a99822f0707b1c9ba06b56bf142076..62fd=
c7890cde3197051743120ff44162b7356cc5
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dda3c0f0a33ac00f7138c695a16d90301cf7ec02b..c52c558=
9aab8c376f975b1feb7b8746b7b6624bd
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dc214492085504176b9c252a7175e4e60b4b442af..fa14abf=
25646c5814b997836539dbb859d6a669f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index ec670a14..695b8b90 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "d203b8453905178252094416448de009931087e0"
+SRCREV_tfa:am62lxx =3D "17d2997c0e7d4549720a5d176916f5ea0f63b009"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index ea7455f0..d03cae2b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "7b9dedb046eb6a720997f61582c7b13da1b5b9f0"
+SRCREV_uboot =3D "19795f63be7ee27e38b6e800ff6c88a2feaae13f"
=20
 SRC_URI +=3D "file://0001-binman-migrate-form-pkg_resources-to-importlib.p=
atch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 6b2353d8..a7225293 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "2549829cc194ffd9e38b755d2e10c7fc4cd971eb"
+SRCREV_uboot =3D "ee3048ee0822c35312379b6e24b5c80e9a845110"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 5957194c..0d974c0b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "a3bc6dc973a99822f0707b1c9ba06b56bf142076"
+SRCREV_ARM32 =3D "62fdc7890cde3197051743120ff44162b7356cc5"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index c63d7532..8a86e1d8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "da3c0f0a33ac00f7138c695a16d90301cf7ec02b"
+SRCREV ?=3D "c52c5589aab8c376f975b1feb7b8746b7b6624bd"
 PV =3D "6.12.57+git"
=20
 SRC_URI +=3D "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch=
"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 126af476..1b7ec01a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "c214492085504176b9c252a7175e4e60b4b442af"
+SRCREV ?=3D "fa14abf25646c5814b997836539dbb859d6a669f"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


