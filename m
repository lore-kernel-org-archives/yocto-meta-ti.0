Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDB8E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:39:10 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.518.1771450748414908543
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 13:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qikAv6IX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.28, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO76DcBJ3tqPml08mQU2jwnNqvJUrjDNKsgnXtoJ4A40R5t9lIXl/BWiE8CdpEbVxlz/jVdttme0yMahkhsDV1F9oQznvSSVZkniTPB7WbeYsmlrz0VxoFnnfkc2kktA/Xc00EZhmE1lrZjonUWOWfqOHhrhF8n6nRWTW5ZZbMsq+o8z1+QH5YQ75qROcZG8u6y5HIWNcbO6XQW6yccY/i78maO5Xiy61S/TlCKvOA4NrJ/0RtuRUvA8qrjKAucI+2sZGEsRCiL5gefy+qFnZrcXH2kFanHnwWaUH9RKR48l1hhs7xKzaMosIYRdyanRZV9xXL+47kF4T1XOKBnjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iJrKm169K/0EYMvvstWC310Us1SEBVR4hhBJ+sOXec=;
 b=SDxhv5JDjGueyxIR8/4YaE61SiDugd0CPEfEwNia7WaJ8PbwUktz9gb23Z9/dMOFCgYmB9rMcAfAJ+VSfpGjE5LW5Pe778aQAQhGC5Uk1hP8FDBSFUnJncMWW0gRm1ab0EZl1U+940EdoFRXSwtipVTqPx3JFIo8jl0Ea1bWpn8bl7gx6n8yNbS7K6X+PPQg4JneKuydYhCWht3FW82oX6sPAQLDVvV5opnMZ7yxrDVoaC6/RpVXZTtXJEHny/Tw2QwEj7lVJCbXAtGLKV2ncSDpBt8P9/RxYI4VMfdY9V4E21+yQfkFYqQKjVBhzy00UIjMiHEnAB91EzXhLTDpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iJrKm169K/0EYMvvstWC310Us1SEBVR4hhBJ+sOXec=;
 b=qikAv6IXqJ07S08PI6kcrfrSOzMGe7DDE3SmjuO5v2C4HugQg3EiNr/Rfrb08+Tdu4jibfNtT9HeKMYs6ZNbTbaxpYXNieWubhTRf9tv+4ztD8G9Wtfm7wst2HPr1+4AmNC8X+hXxlkvtY3vApWxZyuZroN6QHfxrvXmAhJCsf8=
Received: from CH2PR17CA0007.namprd17.prod.outlook.com (2603:10b6:610:53::17)
 by MW4PR10MB6629.namprd10.prod.outlook.com (2603:10b6:303:22e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 21:39:05 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::c0) by CH2PR17CA0007.outlook.office365.com
 (2603:10b6:610:53::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 21:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 21:39:04 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:39:04 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:39:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 15:39:04 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ILd4bW1050506;
	Wed, 18 Feb 2026 15:39:04 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver version 25.2 -> 25.3
Date: Wed, 18 Feb 2026 15:39:04 -0600
Message-ID: <20260218213904.1344360-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|MW4PR10MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d075f71-9bf9-45c3-88ba-08de6f362393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3YRAjdkMs2FT7vX0tFvudxTipO1F/2IdPLkb/wbmjREcroKhylrHWtDCrVZx?=
 =?us-ascii?Q?jlvfaUxpifMfhPwUCdc/AVz5zBI77ygznDWnU4cmse2BzzTeEWWoTPlidyDG?=
 =?us-ascii?Q?TpK4rm5eOy8cHxQZmzEl4ef0UlTyVrMeqn3coMJCOS8PXr+h4imVOi88xI0O?=
 =?us-ascii?Q?cQBywwBzNyAhB7MB13JaOwctJ536X0EdOqIgQgdgma3q/f//bNThvupj8MRJ?=
 =?us-ascii?Q?Tvv2Ux1Wvc0Q11APoKBWgemZi4WmrVvxeFaMuttw6tXH83FAclDeEj8hUVM5?=
 =?us-ascii?Q?/kQCqLwTKOa/Paqih/bCcSYhr9YIeJ9a+e/7boLins9gh1yf2U37ydxCUWvi?=
 =?us-ascii?Q?TUr/TLRfP9DWRvtqcVr3lSqiI3owkC/GqCIl2w3XL82oG0HINwqZmkuWQjxf?=
 =?us-ascii?Q?H5uNTRgIatn0Jv/QgBG75P4b34skhKHjjprf0ORD+1jcnKAdSIdE+m92T3ir?=
 =?us-ascii?Q?LFWhb/6hs/YpBnFZH6GUDaYcdI3kLVnV3/dTp6BBcUiuFz6ssNnKkkVE4/Iz?=
 =?us-ascii?Q?9z9cKu2hyjvsaqAOLVEIpwvlf/KnQ1QfTHI0NE13cOS2qeGFb/O45BYNvF/D?=
 =?us-ascii?Q?0ygOl8tqpuWNOi5nCJSN++jLicnNmlod3V1M+jXOkbEA+cizT6E/a2bXbQli?=
 =?us-ascii?Q?PuIEGEptZJDUyw6UDIc410Wk5yz6L0ENDa8dzE7CBnvX0P7ysJZtbj2tmN/R?=
 =?us-ascii?Q?Li+cwjZGEwzfOLfGYbK9hzCZIVv/4yTAvrBrBN8OFnplw4HmJYPzZ1E+qU76?=
 =?us-ascii?Q?IcoMb5K6RuOqIZcWTLX/Ad+xor/U0ZvY4K1IsoWVMtSVqZTmZCskozHusJDd?=
 =?us-ascii?Q?o+UBMa+xcaARRqKldZaAPmh0P/LFkHkZd8zHqNrSTz+aZ/OKa+tJ2rL/SwGO?=
 =?us-ascii?Q?j+XAHBhMM4FkxmSwgz//tXK9vBs/3y3hRH2/wk10VS/AkmqWdrS1rDlT9Eth?=
 =?us-ascii?Q?4ENV8XkUGyG/Ed6DO0fKvmBTYk467NwsqGJMEZXphXU8T0iWdzr/Qv8Hlo9F?=
 =?us-ascii?Q?nnzNtPy4VNAylj2MvFylMKvXZfyUyEOPY7d4rp8mnr8H5VihDNVsNZYSGhDs?=
 =?us-ascii?Q?xPWwjIQ3bTk92lJX7bVLAkvmQPh0bnHVhOqJL8BzlUVc5AfcrAqnHIVq5duG?=
 =?us-ascii?Q?y96ur+2b739QQMvydemsGWgFgEJPncZyUtTNRxxVw7yf5TXyHDjcPk3/nuv6?=
 =?us-ascii?Q?BKutEk/2+cryrBm10JtlxHuEULxdd1Us90FiA5F1apIrjS7T8c/jYVNzcErD?=
 =?us-ascii?Q?1WLB1gFNagIAC+VbEKW5nDx2JUDR+mzZhf10J5mfdDKJQXYVYJX7/ZvZSl8E?=
 =?us-ascii?Q?xAY7L+9mN+Nn6QD65KXEUGXkNiIJxHwdejfsH2hLyCajUrVzBZCi37RTO9br?=
 =?us-ascii?Q?JUoURGoLTHIO0ZNNq4/8WGSIh5wiIX6gqRGnSNUnAd/oWSExmccXgF5yaFMK?=
 =?us-ascii?Q?/aX0yD6yp2eyAmaePAc80bQ4kXFTVw5VObxOVUtVXe4YlK/21pysPaVCiVid?=
 =?us-ascii?Q?4Y+0N3r0cHefjir9tC7uCP6AveZBVu5PCtlswt8bXhGA4OabB3rgB+xt3QnG?=
 =?us-ascii?Q?6Km8v8DCuOSsQf1M0IYRKXhbpaHmhWwNvpkYaGMnInooYF99SS8Bt6vjwkau?=
 =?us-ascii?Q?M54jZxSgOgtFbxDGMMUiwYmClioPCMaXvdppjy/5Yx2eap3G0CwUsTUQaC+G?=
 =?us-ascii?Q?LeTzqw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m8YTolG4trvonxpxIY3wrk8X9G0TUk3i8n847r0Q37il3NGbOGblS3gmN+lT2dIMUw6S8A3rsPjwGqPch1fDgPB1xIyL2tFis08BkaU7WTRnBIYohjFOx0QPimCN4WICy8nthW7CY6mED2ZXuj3qFdjU/4I6I0sJzWlu7kvBDj8xF96Ie8dPwcSqp8iOuO9NyGX+9FjAdLJud/1rF3TolzZ4g1egsjbmfcl3vSzjnEuHRTD1XNTmJu+YEOb0GVsyhyE1h4kCwR3Xz1o4N+eDF/U0y781xmoGB5JnDv/mwArVucWhozGqxEsK9VoAUDQDcJv2Zs9Lgg+JJfH11P7GzaWC9A2iBlKfJPwJcB9ul8dTC0KQApHSxt54WUQzp5DdkmvBXzpRCk2fcpfuYIoXmoZ0NN6R0Ynfs68oJVqtWtdLz0S7ELymkBgBpIV+mEAq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:39:04.8021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d075f71-9bf9-45c3-88ba-08de6f362393
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6629
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 21:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19544

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 25.3. Update BSP configuration file to
package driver, which is now supports kernel 6.18.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++++
 ...er_25.2.6850647.bb =3D> ti-img-rogue-driver_25.3.6908880.bb} | 4 ++--
 ...bs_25.2.6850647.bb =3D> ti-img-rogue-umlibs_25.3.6908880.bb} | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_25.2.6=
850647.bb =3D> ti-img-rogue-driver_25.3.6908880.bb} (93%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_25=
.2.6850647.bb =3D> ti-img-rogue-umlibs_25.3.6908880.bb} (98%)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index 0ca2de64..2c0acf83 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -42,6 +42,10 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 =3D "6.18%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
=20
+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "25%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%"
+
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # ti-6_12
 # TI staging kernel 6.12, u-boot 2025.01
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25=
.2.6850647.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_25.3.6908880.bb
similarity index 93%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.=
2.6850647.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.=
6908880.bb
index b2f5e4ea..ea081651 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850=
647.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.3.6908=
880.bb
@@ -13,11 +13,11 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62=
xx|am62pxx|j722s"
=20
 DEPENDS =3D "virtual/kernel"
=20
-BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
+BRANCH =3D "linuxws/scarthgap/k6.18/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
=20
-SRCREV =3D "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
+SRCREV =3D "4fa6d8f63363e4926a0a7e7ef4a317c3d9c0f5b7"
=20
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_25.2.6850647.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_25.3.6908880.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_25.2.6850647.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
5.3.6908880.bb
index e4b95f8e..5246f588 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.=
6850647.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.3.=
6908880.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e=
3baa03de5207e76f"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
=20
-BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
+BRANCH =3D "linuxws/scarthgap/k6.18/${PV}"
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protoco=
l=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
+SRCREV =3D "2ecc98c61aedd931d8acf6fb4a1150ebf57fb178"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
--=20
2.34.1


