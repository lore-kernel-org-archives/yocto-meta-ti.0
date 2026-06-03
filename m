Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CE9CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:02:19 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28024.1780513335481855098
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JFhc7Esr;
 spf=pass (domain: ti.com, ip: 40.107.208.50, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+Qfy706HzOuzPegAIwlWptqucwExHUz5ln81+agxfi5Pncc9iRT1CYuCapHFsuF7E02I9JB2XxtHTbNPyR0SZeqJ1j4R1ykRJ271mMS0I1dbPK/NbqdbAOGW91OqOp18Fchwk31GfsSfUpp+1w1Wi9iwJxNIciHIeSpTf5OaQiHRjosqO/TZtNKwUVOBZeM5JwUmoiPOfDyjN8P7yEG665GnALwj0CBnc8lxn404akOZb1VA1ibTiat8PuD347uPqzeB7eN3LuZcAA2yn/pqGo9YM3wI8S+H86cY1rw3D8GSiav8MCBBMFTe6FS/L+pEjWzcURTht/7P07DgwvMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OgleS9DzJZUPMccq9cxDr30I7qwe/urN3afJxGmnDk=;
 b=qKrO0lxEkGRuju/qVtkUaeEYh5RGMV7DdxMbRYUoStZPfhhcFQSuepzwgJ3sTzYc4AvPdGJOY0zx40IvXnqNZbnfEg93U314G3rGQIgVjIjgW5IZbRAWbDkCwqEEDWeTYT5J/PM76xentQMrmEqJcn8IQjAsz+CxDtASixtEWf4e6k9ewTim42AavX5uPZ3ienGpzaZSC39FAEtzg3I8HfMqyIVQX1YIKhORt0D6dtizyJj0fuKiOjU/+TV/OKycSl9Gi87FEspHEZfp+I8nRv/eOD9l6F0SjQ2DhdGRveWE3sxwe6CH6Jg3qVWAgBLtyzNoGkDXWa3eHexO+Lmoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OgleS9DzJZUPMccq9cxDr30I7qwe/urN3afJxGmnDk=;
 b=JFhc7EsrkY0AiVLo62ruqy5KiUAi6KTRXN6Al1nEBajoIw/1qdqVnn37YBoiyhGg+rSJTmrAXhaZPK3FO+KP+/r7oL24M4dY1zeRG4ME7xk4bwoG5Sy0/FWvdfVkXq1/5N1qowP81yUbm/z9Fb4fNFu8ROtf1PSzZvW642aYwOM=
Received: from BL1PR13CA0136.namprd13.prod.outlook.com (2603:10b6:208:2bb::21)
 by CY5PR10MB5940.namprd10.prod.outlook.com (2603:10b6:930:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 19:02:11 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::27) by BL1PR13CA0136.outlook.office365.com
 (2603:10b6:208:2bb::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 3 Jun 2026 19:02:10 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:01:58 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:01:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:01:58 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653J1wZ21813791;
	Wed, 3 Jun 2026 14:01:58 -0500
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [PATCH v4] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
Date: Wed, 3 Jun 2026 14:01:58 -0500
Message-ID: <20260603190158.3082977-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CY5PR10MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a7604c-f297-4ae6-e33d-08dec1a29d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nWHSXwoTCv8wpuf9C5ErMGrSY/0wl6ByYjvH9L96+251s5sgclJ61jbLd1ParNwZ0X86vYmRSlnoIHRzxB5OHPswWu6HXk/q5twuFIein56tCQ7YOSeZdHmJF3iNNQHLsf8q9qwt1vpd9ZoTMTQdsNHPznoae8qICRr2nr1Q+oyFReY9hW3m+TJoLKJM4DsVc5xhvXfZfbtf5JskG9/cjn27Tpcz2EakwKaLI5awCbFY87GbI6Y/7+cGFW92oEFqTmlxPELSSxniNr7u4kcVTx0TXmsz5W7fNw0jKpy5PobdpxS21jszm6/w9elRWdWSzNxzNYMujMxRrA46DyGOSO97RiBNR0xRzQZ/Oh59ounyk4bhiR/E79gKkww2VkcistiPDc+KUxKk3L6GZf7EGU9bYb0ndggtNkZMcU5Wj41757S3MQoKJJgDYjbmYJj8D7ocT0+KrR7G4R6uQwkK8NGbfmOMcfOnatTF7KS54DRXAGkCDcU8HhQsLTWvuooN25lgo+NOjOkCcGnjNS6a9yOCjsRNZnHRpMrgmJg3OOB7MdBcac5th1vTrG+MCVtusOR8/X7vzsAiGz8LU9Q7nS3eWbBMX9m6p7S2Spgw8as+uS0bCn/XagjEFHA6764FnWcdEMp0EECTPFzRS71nTbk/TygpwxgqwLiTGm/A+J9oxfRAlKv2PTZmo8Il0CG+Sj2ysTT7VbrHBgbCntaVBK90c4s/xpvAfrPxlFfRtqI=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ckMo/7pCzq8VB7OOyN+NnDgd1pMu1pkT0LSeQITG4gB/mIrJTq8MGyYlVYs7w8ubrua2kVCGnx6raJTQmCsA6rAuuQVOAlrwt1aikJ7kwrY2cuNzvUPGqgCnTyOhj0hm5EICttWXVE/vc+mT3GySWZ2GbtQwDYBuIVE5/N1IUbJP9SAwCkP4mEa996SLBGKxg4jo1I7oqEJnKYBZzIaELRWfphMOOyfyuvVgett4Q22AI3HbvtzQh5N0+gStBn46+HplqeWTDzUcy6/DZv0AKBb79cKdtJuLmpx8j4evVa5ikCyBPE+qQ3VjX++dqWUGIW1p5XWRpzIxSbKhLIErEksyFAEaXwrX1W3NUR3fRo6OIZWh3y9En+GM31vujyUoZ0DP5zHKNUTcu9ITJgwPOvtsM6heMLDU+4DgLwQslr/bYWv5ushw3ESLbHSQ8eDG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:02:10.3855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a7604c-f297-4ae6-e33d-08dec1a29d88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5940
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:02:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19970

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 26.1. Update BSP configuration files with new
preferred recipe versions.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v4:
- Patch formating was wrong, use instead:=20
  git format-patch -C -M --find-copies-harder
v3:
- Use git format-patch -C option to make the patch more legible.
v2:=20
- No need to delete the old 25.3 DDK recipes as that would break
  compatibility with previous LTS kernels (6.6, 6.12).

 meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 2 +-
 ...er_25.3.6908880.bb =3D> ti-img-rogue-driver_26.1.6967606.bb} | 4 ++--
 ...bs_25.3.6908880.bb =3D> ti-img-rogue-umlibs_26.1.6967606.bb} | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_25.3.690=
8880.bb =3D> ti-img-rogue-driver_26.1.6967606.bb} (93%)
 copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_25.3=
.6908880.bb =3D> ti-img-rogue-umlibs_26.1.6967606.bb} (98%)

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
copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.=
6908880.bb
copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.69=
67606.bb
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
copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.3.6908880.bb
copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.=
1.6967606.bb
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


