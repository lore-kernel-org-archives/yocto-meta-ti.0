Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2781093168
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 01:37:46 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13340.1774402663182803755
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 18:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=v+pKR8n5;
 spf=pass (domain: list.ti.com, ip: 52.101.57.22, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaJGDE1guBGM441iG7sK71xVwgGUOFMxQnPhOvduyCyhXVr7w9iDfvjME3GQKCSk8SM0rgSdF+JVLy7y6NuwoWdqhUrn3+1GYFwfWzgH1n90dKotrYfGJv0rXjdKZ8hZ5Ca6nxKlxRA5f7usE7FfRISaBcmBgPPT8Pti2E6FuyNkaqIO12EmWr3Hmu7Fwh+2L6nzVJccpunlgpGUs+cXhOLTKYrXHYpUJ985C1tAmAIv2BBTacD6JhXlPq4YVkum3QSzF63cmm6TU/vL77bRUbF90E4kJ4Z85YQRuyCIUEt5LXGbOvN7tMw6iN9qI16RXsBNjJfMp89UwVpRz1/Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhY/k7cVN7FLgcbbF0BeF/O3DdwmIwB//z1UBIWgnM0=;
 b=tn9A52OXbBNUHiN1yqFN4Uf6cVjCLvT0YsSKPPDSuhufjWKhhLCJDAXhhaodJ5T/ukUDaOFdLlc2D3D9lcO1BWxG7rwABf3mlkGEReI9jPSkNSX4Z0AdhirpBDae1LO8yU/CnRWTAh2VwYMdeDtKyXRrL8AKTHwUU5Vy+38NE60zj/4w+13QiHdTXlaQRc4GhpZ0Lq0mzZ7W58gI7xPM0Wvsy20Ef7YfYcDnMDI1mmpDTlF1SRDwmjLA2EDoLthWR7XnDlQ6AQjWzgZcOT8W2UusZBwkAxgMTEzQI7ws7rIFBo4GxjdCnGuSMJ/C3+0sRbgguTklue+sLZREWxURvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhY/k7cVN7FLgcbbF0BeF/O3DdwmIwB//z1UBIWgnM0=;
 b=v+pKR8n5fVIuYq4hd5M+AlkW+qUTrnINsViCCfMk2WxJtBi1gS/6OA7gfezijNUJUsC6RhtP4mD806otffZBZW3LgygSdZHvwT2XsPB9PdXeeDQTil14Ru3o6XSiPZxO82jVCKxsTOXOQMZuv6Z+Z1cRnyvGA44TEcCpCoy8+YpALoaded6SiU1N2I5pFShspJk7MbDtgtwPVmrJQRgQ1kB5UviSWDX0bEe5R7wUlvoaydpCi/u4odQ7hhl5PThYdbiFUW0F58sNpVCIlPBFCbypoqzMxRX4IwiLbf/h2ysWwxas8nXUtb6PIBL+/VA3bk8EpT+oaTNJHSt6iooXdg==
Received: from CH2PR18CA0029.namprd18.prod.outlook.com (2603:10b6:610:4f::39)
 by CH4PR10MB8147.namprd10.prod.outlook.com (2603:10b6:610:236::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 01:37:39 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:4f:cafe::2b) by CH2PR18CA0029.outlook.office365.com
 (2603:10b6:610:4f::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 01:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Wed, 25 Mar 2026 01:37:39 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 20:37:29 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 20:37:29 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 20:37:29 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62P1bTLi2144900;
	Tue, 24 Mar 2026 20:37:29 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 337F52A67; Tue, 24 Mar 2026 20:37:29 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603241800
Date: Tue, 24 Mar 2026 20:37:29 -0500
Message-ID: <20260325013729.3326901-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CH4PR10MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1dd8ab-fb4a-4be6-f38c-08de8a0f19dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Z63h1KhDugnop6yKwnIxYui0IZo9SXFTTAGsnaEFd6bCiuqIUti1segbkwOJ6GNkknI91JD1G5Bi5u8n2FRw5nrvItIIlXHz+DfWZ6ZaAv7PYbmeqcUbh59jySxl0uQZMg+8MdT+psdp78Z76ZRJofgPZ4IuDEiDf1PrPvkZhDcSaNHPpO5oQYL97cOCgssHMk8BjU1N3Jtvr4yZ6fsDXRuPvK91dVw3kcNMJM/36K12q+b5UkIJN/PM1zMq+mLEEC8/78IcooWmzWK+K7cwh/BCpVF1GeLhrZdLgxQbE6A65+gyYj5sDVyA5Nvc0VE7e4ahSGzPmdvJJbDCjelosBu8eouu6ijhINpddFDkSj2Tbxpvp9iJDw+tyXMoGRd2RwACr7q01R/rzD37L+oQsy+dm56HNzUuD6uJO4u8CnU1byzkrY5Yi5ncdsnyet75v07IfUFkFQmtd2HzujIwPvvyQhESPMn2D7S3OCe4mMz6To1Itfrk+1w44bNQuFonbVLGHxml0CVaSoNQGQBwOYI+CSVXLPNZyaksX1rvClBOsbI084ZRBVUFg5wGStDFQfel6zPL9Y3Ndrwhkq4+xwgTLNgnXYvTTlQo5kQ92Djx1k6CTkjKm5Fww40LCMvdp15ZdMGvzNWZNnGxUhM/GWRkQDzozssZBBvwSLt3y9PhcSEfoG6J4j8F2MIcly64p95aZtYOS6H3zzYM6tE1IEvquU5E26XGWy4c+w7H+rTt43p20GnH7OUMMofYTeEVY2jlwhaEBZp4ttgM/4jQYA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UmrzIGqTK/x3zKkuXT0pYPVEEPaBJBAiUkbQAb8BNrZjwbv+LXTfdn9LYl5+GnUc/q0d1/Ci6cA4RSyFNloU49p5itNT3LOse6+naQrTP8UdMlbpePjhZ2itLnA+LXmSRChQK/3Lq94Hevv3LpQKZfOu/2adL5YKGBLwEty+j85RUkemIhmqQSKZlb6DDTOUAe6lwaGLQd2wVyytpBrcPSba7nj/VNrj+ojZ4OY/RDHzUZox59uiAqnRHcc1Yur/f/9/klAoC1W+7XvkiPbJMMwljsD5FepoDChxO7XTkiMZ+WCeSYH4RCRKEX+SDwN1saK/bkxId5PgdJTF3zXmWSa4ZGF6E0F5QX9DUsb7wgj/XvehPI5WIJrJm2vAEwsJq7FUfITixjnW8dSh+tdijd+hEdQDfJ5taEtMekSxpXMkHcDaMUU8xSTSYHWpT0AV
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 01:37:39.5296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1dd8ab-fb4a-4be6-f38c-08de8a0f19dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8147
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Mar 2026 01:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19811

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Daaa3d54aaa9e837834fa6b6dd99e9fefdfcf7949..9e9d50ff563f=
83db86d36b72cd7fb4f487d6b414
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Def2eb76b650415637bd93b0eddfb1e31489117f9..7b9dedb046eb6a7=
20997f61582c7b13da1b5b9f0
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dfa0fe817f5ee1b0542f757abaded245c6e5a1321..c164e38=
1f6bc1a72b527f0bf3a6b1fc9af06517f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 9ed421a4..85b73854 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "aaa3d54aaa9e837834fa6b6dd99e9fefdfcf7949"
+TI_LINUX_FW_SRCREV ?=3D "9e9d50ff563f83db86d36b72cd7fb4f487d6b414"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 6fef7e91..ea7455f0 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "ef2eb76b650415637bd93b0eddfb1e31489117f9"
+SRCREV_uboot =3D "7b9dedb046eb6a720997f61582c7b13da1b5b9f0"
=20
 SRC_URI +=3D "file://0001-binman-migrate-form-pkg_resources-to-importlib.p=
atch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 3d278daf..ea0eb305 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "fa0fe817f5ee1b0542f757abaded245c6e5a1321"
+SRCREV ?=3D "c164e381f6bc1a72b527f0bf3a6b1fc9af06517f"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


