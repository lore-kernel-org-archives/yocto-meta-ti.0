Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78760CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:54:21 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24804.1780505660114314508
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 09:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FC3wBR/C;
 spf=pass (domain: ti.com, ip: 52.101.56.41, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHAztz6oibp1FR9a/z1StCitPiQeM6YhqgRr3cZI6sVcjq652LTQvUhbCIwdzNZ1pfZIHrtHRLQrRhTU3fc0ksaSZes289GiN2noLuTe/epb+HFyHrY8MPwDYGDrgeMC/ts4DGX0qYMz07xUFeuF3tNBk5i99kSPTwj+431w3zX8mq8HpZ6ziEbxqCOz4Pbfno7oNdK6xoxDGn1Nbm8E2LIUkyTApONFcudyv90FxlE2WKJB2cdojlV2JHD/pVyrj99A6uPKsamlY+dbNdDyUJkk6nsyRsxAFsJvCSb0S6LDxbZ7gUkWK0UnJMIdI+6ktD8NrvNkEaWI8TPmmg2xBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoDdG7LQ2Lyh2x9758RJw2lgkIr4gzd/Bu7oWa+lGz0=;
 b=CxORow/hizcLbdRevIKw/YBAfyKCZS8REdVcWt/pfawfGrDFl9eWWVoiNEZXjwG5NO4i5jWFCyQvl3YAavQi7N9GP9G3pVeJIRxht7oFG41tO5Wimd12StFIAb+chHCTt3WeQkeokieNIZ+14EU99qOHkkb4UEQCYDPHSfivAXODosp7KB9TG2puVXOfs4Mh7jHakhVoSbOAd36ZdOzAg1YqxpCB9uYHBXSOLuQ3imkeR0pC4vKkjPr+ZfHhDEwSU3/k05rTd0YwJTgK6jPoSR0E9nu5+hofoTh220/Mqr8kKSOkhBcVzHP3PdmfBu5kxvPwfTTGV9pRF+aTz50SyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoDdG7LQ2Lyh2x9758RJw2lgkIr4gzd/Bu7oWa+lGz0=;
 b=FC3wBR/CXwdpAEKEHfPnfCv0/fbsXoz5+lKPILvKGtcX9J0w5HuczGjx51UWFuMx7lNHr6tHTGyL7n86I6PaUd+08QkEEbolsLkw/7yyPZutBpz4Ql8i9J1M2rjYOCk+OB3QavZR2kfJvgE+8AohqHIJQ+au4KYse1JbPLHvt4g=
Received: from PH7PR17CA0017.namprd17.prod.outlook.com (2603:10b6:510:324::13)
 by DS4PPF3984739DB.namprd10.prod.outlook.com (2603:10b6:f:fc00::d15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 16:54:16 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::3c) by PH7PR17CA0017.outlook.office365.com
 (2603:10b6:510:324::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 16:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 16:54:15 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 11:53:55 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 11:53:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 11:53:54 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653GrsvR1623186;
	Wed, 3 Jun 2026 11:53:54 -0500
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v3] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
Date: Wed, 3 Jun 2026 11:53:54 -0500
Message-ID: <20260603165354.3073981-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS4PPF3984739DB:EE_
X-MS-Office365-Filtering-Correlation-Id: e03ef0bc-c44b-41ce-fa18-08dec190bf2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kI+J6ZCXDkBHimHdpS9nS6b1tQJF6S4CHcRzpBNhoYwzKSoO8UMZBq8beXnWl2uy5tlyrkNOLN6cMyXWa98hBHRRpaP6K6QJAHWRpvSklLduAELlhWfmlKtSkCcUcF+pI94BOPVUdnBWxysy+tDvClyAogQUBf6okV7hZKcJdQv+3hdikwMaZYPtmgKcod93cprnyLsAjgQWUR0K97S/gH0EvFs+r09WbQaYfHgMjVuFN4MDwwUGQll5g2OwiHl8UUi+l5MXOYt0o6Xp2pjbAPYtzRlsHj85zp04T4cH7Dvb9+Lg3xjoT9BXTbjr5N2HsZsd88uQJm3XEVJL775cKojAmoEg9X9eOqPJHck+l3YfD1HSwSHvic9dW8ENTa9MnfwiteHh89Qv5O15wBc3yECJ8ITuAVX+IT54JlETy0K2MvSLV0e3y+9ZfTaaSIXNydFzSK1TG8obcJoJufMabORB85jyDdy1Tvjwqj0iThB4n4uEqO1302C7pd2NfRfI+75vemdsyZ6/K6WfUUR9ZSISTI/t5OpRdYirzni37mxJvTvyNFvTbN947OjCUIarznzWFkg3dy2XisU3qi0IOwG3kja2aSgqGAiV8kM43tke7xe1Ki4mbtJtCyL+60ObZDUYI82CaYewoR7dr+KEwhfweqPatyYHfTJoywge/Z4Ree8tHhL2pSuMulO10uaMFhVj84FzvrHAZB9vHdNU3iylvuqBH0blMwHy7UD2DYI=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b1NxXFxQ0CqQ2w5IyXhIgn8Cr4C7jCEE/cwBHSTUdKsE2wH2GRnILG8yQOtQb7WVFbDJIOOgaSoWUiS04nRQsYzcf823aqHo8hOdUHjQ8ozt/xyNVBamM/yir7ybZuIdlkWCe/GSa+O6IhTJ8E8YNdzNOTUjLJvlsdbTKLyNi4adrLs53TbIG+ZYIwUIQGYwXfHXs3uAsFnKndcFvio9SAOz3125bCKOz9/q6WICVTZK5cdZiq19Gkoy1ZVCZBwTvgVdJI5ORuObGqpfP/LNqz1+YIJkyn529S5r5PPXDtYTN5Csehc+wLqykBih/jaFNKJCY3t2aseUX+M83qQAHm+QF6/xrsbvg8bT24fAM1R3+SqiPAq7W9EQf2l50GwSrTk6xbta5u9qtbwPa/IiiYuaMkkrZgEFBEEdxL7vJ1k6qKiIQTUf+K4bWiJbHbxq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:54:15.9265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03ef0bc-c44b-41ce-fa18-08dec190bf2b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3984739DB
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 16:54:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19967

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 26.1. Update BSP configuration files with new
preferred recipe versions.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Use git format-patch -C option to make the patch more legible.
v2:=20
- No need to delete the old 25.3 DDK recipes as that would break
  compatibility with previous LTS kernels (6.6, 6.12).

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


