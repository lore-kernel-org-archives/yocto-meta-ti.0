Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE06D109192F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 22:58:25 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1123.1773961099305878984
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 15:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=oREwSO3/;
 spf=pass (domain: list.ti.com, ip: 52.101.61.32, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8rrdKXh/fE75JWC3BDE5j6wscLBlkjkf1pmmhwmlGLSf4XqhyfYw57kU9a5JGt/kmJM7DuU0FfhsFxEnTmeX7kMxG5UvnX0WhZO1+8JneUi/GxYvhbmURdVLpAWHULQShRZb+ODQUg1Sc43pRsoAS2ZarKNMB1N1KCpotqplzlv/++yB0Mphvq4kjwCzG5iMtZIORVqD7T2CzXyQZEbl+oLHUxF5R4Mke0vKc2V9o7LrABTWc38JXLmXumyVs/l1au7JAztuU0QJt/B7dwNyeKqvPtA7O1PIYK0pHwCdmd1jKDdrtvTCZugNSYAuqgLKdGrQp0I4liXSwq69E/ttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LENW8O63Qevubu4b1y6FMPViVtwzQJ6cH/XBcpJeIlY=;
 b=CVf73UzNU1JLtqGM0nSwjKDGByrbQt/BZIldhmoGFvO3RIo4XbPNx13VnhfVGt1kxXuCoM/zvIHVi2oIx0gh35c0whjg5olZDJbN9VZLFti2Re++1IswOhshacY+pRfoySKhfxHsMHv+zfXFLjyXwdVFITizFmCFhWXABn7RfAjfMesBC/ndbvWO7lKjgBp/+TWhWyp91jCaJWiZtIkFuB9AG5NOQir1GmdKJ+xqheOWLEGIgRf7SNs28K8uA8EpLUEX+2ve0fW8WXpzHmaTgRlL8fBoMszmpIGbuwAoCO+hwEQBgIzI3y3c/Q5yugia6sS6KP9xw69omih5ZVuvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LENW8O63Qevubu4b1y6FMPViVtwzQJ6cH/XBcpJeIlY=;
 b=oREwSO3/ILgfwds+1ZsHRmkAId9q0v5ir69rOTdOLWqTC0x/hZJTTKtRJZUvEa+pcezKOpQXyVEDxy7SdKfG5kF9G1nr49eS025uozlbtHS6ORmUC6+wSq8n/CLxY3f3uXUUZtiiP9bvfsmySY5/hd5FdxeldCR54clKKJZHv1vn8LIVvsZnQQASRTWu0swX/2T+BKhXbIdUpDhzGllIdNlKf+Tlxh1/OBIUnwCweYDMD9uC+Ti9xybYHrA6SaBv1SdF7qE4kUwIRI9X0uOqHedMyEQvGdkor/8IAI3gPQ9l3OSKhBmp19sXBmk1qLNENmiZPZTpYHHwhaZYSdQl+w==
Received: from CH2PR14CA0039.namprd14.prod.outlook.com (2603:10b6:610:56::19)
 by DS0PR10MB8199.namprd10.prod.outlook.com (2603:10b6:8:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 22:58:16 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::51) by CH2PR14CA0039.outlook.office365.com
 (2603:10b6:610:56::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 22:58:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 22:58:15 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 17:58:15 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 17:58:15 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 17:58:15 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JMwFG0867667;
	Thu, 19 Mar 2026 17:58:15 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0FEBA2A67; Thu, 19 Mar 2026 17:58:15 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603191530
Date: Thu, 19 Mar 2026 17:58:15 -0500
Message-ID: <20260319225815.455989-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|DS0PR10MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 098b52e2-ea1c-438d-37c8-08de860b0151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	vtBTjmys7dQde99S/qNyvzn5AMknlR75sS9WKIse7yy1IdvA7SR9aJApkwsTrHnFc/AM+iaLIDJdDlTc7X+A7uWw3j+mmIf9osDKi5xUvoN8bWrnxXqWkkYUhArQc0zMyb03r1fovUu9MiIoGm02b03oZU5dz02VB0T5XQ5vniHrvEEqPS/7NHzRy0S1giBUMNl0iprhMxP+5R4pZKsb3UzHhBUAuus5/qjsnpY/uKdewGOpJCUE1Xr8ZIGG3xROCVAPFWFjkZd5IypFujXXQsn5pDv2McuQ+U7jfGjIZOGcXkEvMF2tU0bDpjS5qpJYPY8T2jGv1/WRpwIumpcj55tlcFUsli3IEpuxoX5+gLp4q0fyG4xUIKOP+7ylgokj50nOAxmvDo/5+0dBaFal+/ssjZPjNfr9Krviojy8D9j7Wb2otfYffS+p+ebEnqlxDG8JpedXztCEElBCsWIdRZ+PRDJWm31koH53LAXuEmxa7F9Dr7zZXGPZW1zZfn4y3fyJD+dqCwzZ1JvgbM5aWynJqegI6qKC9452KwPSKjx8OXLyZkcx6KlPLAjbjkJK6KskLMO7VcuuXr6E8V3C9960e07foTtiaGxQQaa5lIfQIhHiCxCa3uEsoYJnUPkfdS899PvLK3ngSd38p/4hGjlHy8q7qFwsy7EdvE2Tc9HFQxsg47WSPylwyMumyCF8mssRTkxnaW3vq/NK7Z3UC6WyGYJFw0ib9WfRayrMWmUGDTjTBnZxK2ZIXCOBoMX6FVcxUP0KBURuytrjqOz6jA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y0aLTyGncp9Uh9XC6kvG4jE5dN5wRdPfJia7Pl1Vay5+t9B7XP2KXCCi/xdlL0PL3wb85dwTG737fLvd4qrnX6zy3r0GaqLVmZA3TN6yLq9ZV0D+wTOtc+nVJRzv0HGq7r6Dp7S9HEITFSewdLSsMg6decMkatm7pTPmJLUQocdZVpUKt3UzhiVoqzboPv1MLffE724llHkMend/D+n9Aob3EOGZloTuYY9qyEudHnfPQFXR6JF+kYXT0Gz8FGFsrlXjHeGqjKxBknyk5HOP8pmEFAqubUgOvGJyQzzgBxSRPiNxLQvUXJeC0W6bOdqlfdLAf+QBB5H4zEN3MkbriaAvoB9zn8iZQr0OSQYqbQyd0TB7T4LWU8IVNLWEDjTNaYB1omZTSMZkqohrSAbC6jQ8zBkbs522WOlDKQBP+cF8d5S0aLjVWuV+Cmew4pr9
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 22:58:15.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098b52e2-ea1c-438d-37c8-08de860b0151
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8199
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 22:58:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19793

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Da85ebd5c5b216646779b3d34efa09f0a7d818d62..aaa3d54aaa9e=
837834fa6b6dd99e9fefdfcf7949
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D81a97a3303f8c786014d8644d185a368fba902c5..a46241db71e383b=
b6dda103ecad12b13e7af3c38
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dd6380d740b3af3be9a9ebbd347b5b0c34cd82e81..fa0fe81=
7f5ee1b0542f757abaded245c6e5a1321

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 23b3eaa1..9ed421a4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "a85ebd5c5b216646779b3d34efa09f0a7d818d62"
+TI_LINUX_FW_SRCREV ?=3D "aaa3d54aaa9e837834fa6b6dd99e9fefdfcf7949"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 535c75d8..ec670a14 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "8e4153d49c98ce5309b41b33e1d3da709d17afa4"
+SRCREV_tfa:am62lxx =3D "d203b8453905178252094416448de009931087e0"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 323e42e8..7ad50c78 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "81a97a3303f8c786014d8644d185a368fba902c5"
+SRCREV_uboot =3D "a46241db71e383bb6dda103ecad12b13e7af3c38"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 05a85d58..3d278daf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "d6380d740b3af3be9a9ebbd347b5b0c34cd82e81"
+SRCREV ?=3D "fa0fe817f5ee1b0542f757abaded245c6e5a1321"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


