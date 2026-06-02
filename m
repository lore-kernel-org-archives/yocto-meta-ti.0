Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BF4CD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 22:33:02 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7629.1780439573915554882
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 15:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TlfT8fYa;
 spf=pass (domain: ti.com, ip: 40.93.198.32, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bE+FL2lxvbgpAt+q9ZfPazLme2nDaPdeYou7i1CO4UNA0+U7BI3DtZjWV7lhMIAfsHIqV0TGzPoReH5j5HTnTLkqqcwot6m4c7On8zA7wBUKYoqiOxT9judIiJ45nv/Liju+aeNMBw4JtTzCF980/hIWKcpsAkcOHNayskEWLv+iPr9gDFxOTo3PshHqQtusRl8wBM1DQGQ0JfQS+P6Mu8s/tZrZ++TOtEjKvNWNDZ4opKGfzuoXmVLnYFqlMYikyljtD39pO8HqcHv83ZuVKedMjnXsPHmnUJPxHFRBa8RIveqV/mvQ6BQiu96B1QJPExnymmnea41lXRsyDiA9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp28QU75JmAy7h38Fzed3wzwHSfXram7XifsMFYpXTw=;
 b=Aa6Un6bazgU3IN72hG9F+idUQuIuD/yHbQbvBLFBLXcYzMDItbdhOt5plgyB0NR84mGv4yx0lMa2OrTqhTYbTedKuI9lM3JGzyJd0F2K2U1xVWqMHVQ3Wu6mHRrxFhwzy4m9eGZba4LFe+4uquLsJir7UMTT71HQXlmdipjxmsRboFttwNOHh4tRFB8PIl0INsvV0E4LJirKyaCD4fU6ooHbpg0jStPnDyvvI1IgJtIotchohkv4kkZOxgeOvGlFv8//S+Pynh3HzL7SaXsSIFMNyCsiUAy56ogRMEX8fTX1sj9sHnD7xcfLR+y7LM5akoosLAY9ZKUVq6Q9cDfrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp28QU75JmAy7h38Fzed3wzwHSfXram7XifsMFYpXTw=;
 b=TlfT8fYa6ki/I2MRvYU6Cd0kqsIHKorFZvzNDd6rM2C0AO7/t5F8r1tC1Akfa+pa2cSp9vHmoigCxyN3Tc5tCVmRBiNoxQErV4s1Q/Ys2XW5Gjo9Ux89SvmUK3Yf69kLy0oewOX97x9hHYZefDtvR1Mpyjd3mYTSo27P1c/Jy0s=
Received: from BN9PR03CA0388.namprd03.prod.outlook.com (2603:10b6:408:f7::33)
 by IA3PR10MB8020.namprd10.prod.outlook.com (2603:10b6:208:50d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 22:32:52 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::9e) by BN9PR03CA0388.outlook.office365.com
 (2603:10b6:408:f7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 22:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 22:32:50 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 17:32:50 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 17:32:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 17:32:50 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652MWotr463906;
	Tue, 2 Jun 2026 17:32:50 -0500
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
Date: Tue, 2 Jun 2026 17:32:50 -0500
Message-ID: <20260602223250.3054197-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|IA3PR10MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c22d913-05f8-411a-b9e7-08dec0f6e169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|6133799003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	LKaYnLAv3pYpNhGsQLn7sFXJsUEnk7dEwtx2b+/MazwEfOl/VeTeNbka8D4l8Qxc0DvmKMDY2bD2KiicWlv5v/oMSz0TtfTK3p+IGIxiQJTgrLUo0xuwEe5Xd10+l6BGfvrcDzsP3qAJ4JRxWHJe8ze47javHkUYuzedMj37gsuleHPihWs/BidDGgkBU8rsLFw1ZZIvKwdAS/CWuKxsxMH1iA3zSrOJlmfYZk9WlhLucNCZSYuh+UczgnDhYteAPea51ZVAfuHImOW6+t6vMoK9RO0+adXxHT/kwa12cKj7PmXRm7EsMnACnJAi58LT5x/+hPSXwQ2lbVkL+EssrnFZw5AE8F8yR9NJ4gWYdzQ/AuiREQwAATw9dQS2roLFIbsVyMaEfNow459iC2kT3rhos2MUk5ZQk0L8BKhVG0kjxAt1M5nykLrRgbC74Iuepu46SR1Auw7TJ0rAPqYgLYT0JVGYyI2vgdwobasp1yxtEs4z5khrOeKSSr64hOQMNQuOlqD7dfV5vZo0LtjZRzVE07LHc3a9Mxi1UFA0gICyZIFPYKZ/WWxw/5nGJpoN9mTrERkXP+GwUSDkmuxCB/RQx/+rto5ixG0dvLoyGlTVYTycSazQuhY4h6VnWJupN6k9I/v6RsdzbpPeKEb4u4hw/B64r17boVEJ20XoQmdPmqrIT9xkiK3TlDIdXxjrnC1awedzGoCZ1/p7Smdl9jKjTqzrVrM92NO0abaohiw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iFVNWXxCWF4VJWp4NVzH5XLSekam3URiSI/hcYfA5cMPDAtCQxH62XzNAtBvc3LIIQyD8ycqwoVMU6iBGCpBLhfqKvKK4gde6C67C93jwAyERbNLFbC81/qPW3cgHHi29lB8oku5DgrMZxVjcalUujZEtgZYcz5KgDRI/zn9ZdkAJsbwsGrRrB3mQtgt5OneOZVBupscmotfgriOS+8L14IUXmJH/r8K6U1RMHNUBu1qsJoDvbWvd+mgnhpSNmyzTZA1PnF5rT7Q8H2d5gD4e6zeur/9fdrlC4yC5ZJ5pxNycgnasy76xbVTWxIOcDDMHkY+bW/R7E2wjBHWXQl1HlvBV00v+QOIL0Nvl6FDUyjyQbXIZrkb3yD72HPkPvMZR8+BbVBABlhyT8tf4d/aAB0PfP9I+GdSpts4qBcSkAxlU2U3WqGUBLe+tgs0fW1c
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 22:32:50.8243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c22d913-05f8-411a-b9e7-08dec0f6e169
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8020
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 22:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19952

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 26.1. Update BSP configuration files with new
preferred recipe versions.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 2 +-
 ...er_25.3.6908880.bb =3D> ti-img-rogue-driver_26.1.6967606.bb} | 4 ++--
 ...bs_25.3.6908880.bb =3D> ti-img-rogue-umlibs_26.1.6967606.bb} | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_25.3.6=
908880.bb =3D> ti-img-rogue-driver_26.1.6967606.bb} (93%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_25=
.3.6908880.bb =3D> ti-img-rogue-umlibs_26.1.6967606.bb} (98%)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index f7e2710c..a48c4f07 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -43,7 +43,7 @@ BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-stagin=
g"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
=20
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "25%"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "26%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%"
=20
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25=
.3.6908880.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_26.1.6967606.bb
similarity index 93%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.=
3.6908880.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.=
6967606.bb
index 190417ca..876c3e50 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908=
880.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967=
606.bb
@@ -13,11 +13,11 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62=
xx|am62pxx|j722s"
=20
 DEPENDS =3D "virtual/kernel"
=20
-BRANCH =3D "linuxws/scarthgap/k6.18/${PV}"
+BRANCH =3D "linuxws/wrynose/k6.18/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
=20
-SRCREV =3D "d241b0d5df404c60b80233bb5116b596039062e6"
+SRCREV =3D "50e14e425cbac240b2da93fac0cfcc987a4959c3"
=20
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_25.3.6908880.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_26.1.6967606.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_25.3.6908880.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
6.1.6967606.bb
index 5246f588..ff631c2d 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.=
6908880.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.=
6967606.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e=
3baa03de5207e76f"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
=20
-BRANCH =3D "linuxws/scarthgap/k6.18/${PV}"
+BRANCH =3D "linuxws/wrynose/k6.18/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "2ecc98c61aedd931d8acf6fb4a1150ebf57fb178"
+SRCREV =3D "a59e0e6b92dfee7aad046b839cf6ae644355b89d"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
--=20
2.34.1


