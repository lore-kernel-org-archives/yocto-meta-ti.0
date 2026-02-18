Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860A3E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:48:20 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.770.1771451298684022145
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Feb 2026 13:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=J7w2WaxV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.70, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJoKvO9V3A6Pc+vSEGSftqO0xA+p1V43KUOiow53mi/zDXGqIPeXwY5X2eYbCz22U8n3xBlMCi9tsDrSq3QTgdBk1e4JRzMf5Rae0M9H5hBz6HQKiRRO1kN6PsfKuBxou4pOpwwjBDmuAd07EuqxMUXWv3qpVMyyvB50rpY1iPbIK9U/PgkFJVx2g7PDntIT2J/e+rPw9iLCPGkZmzm4gplMJ7tD5i5IN1jnBk9LNYHvk5MRkQb9tJTetLBCpX3sbxY8mQBP5Frw4hC0Nv55R0F0D8tfS+aZMR7pf7gx0xsCz5T5eejVL+1oxYBTbwdTA1qrts1Ry1qvTS0ZA0ZoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d37/jJMGeLOjLPZi3nizpogApzbFH+KwXcVKgka4x1w=;
 b=cZ59ndSTq8P9vCa9zzMf35QxI9onFdWKLQsROHw5OKgZnH61TCfL/0BSnHixtMYmMuL87WGvGKpJOQnit5vQPI453VCU3/JtnHVh1DfKJgnsKuI7MRfJ6AqmkCsdq69uZd2ttF54ex0Dnna+MAQrMIkVErTjTGqcLFGS9xtJ3T5QfcOAl9761Q6Kx+cPTa8ai8McKSETXLRI+fd9NtlVUwYBYjJFrq55XmCZfxu0Q+7uDkTuuMYu/oqtb1WdUNSBx7eY5f3RKrQ2kLDZXvnUD4oE0w/xhfOYOHgRo9ZOdCq5CvlqfxYDC1dDnn51upsA9tcXm5VTeaxy9QWYc6dI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d37/jJMGeLOjLPZi3nizpogApzbFH+KwXcVKgka4x1w=;
 b=J7w2WaxV0C9h1kSBFu98ZZ7nV14RkVGo3kQpyZJg/9V8rR4vs1GERkg6tbYePg9KuaJDZPVVOJRdTQErK+gYnec2rFpezFf/iTvbwcOcYhbTRPTNX5S3xf/EmbN4vlmvzpakXMt8c4B6p3OeTA/7UvNv/GvIcTX+8N3JkwUVZIg=
Received: from SN7PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:f2::10)
 by BL3PR10MB6236.namprd10.prod.outlook.com (2603:10b6:208:38f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:48:16 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::2) by SN7PR04CA0005.outlook.office365.com
 (2603:10b6:806:f2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 21:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 21:48:15 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:48:15 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 15:48:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 15:48:14 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ILmEDI1524007;
	Wed, 18 Feb 2026 15:48:14 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-img-rogue-*: Migrate GPU driver version 25.2 -> 25.3
Date: Wed, 18 Feb 2026 15:48:14 -0600
Message-ID: <20260218214814.1345555-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|BL3PR10MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 2287d9b5-073f-4ce5-42f9-08de6f376bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OySwXC5/gwnEag/knRdZ4qEf5yymYI5nhsxhBeA37VeQpFDqHkk7rv/Ee346?=
 =?us-ascii?Q?zQqONbfC9GGofJZ1DjZTt8eBc553HKwjyI5Ylql98ogTaw2b9I3hGGVk4l9C?=
 =?us-ascii?Q?SisJ73gdR8iDybQ3iFkfgh9uznbl6cox6MqDyt/QlGGQloVPLR7slcwKmIgg?=
 =?us-ascii?Q?cDAZt/+TqznMU6tKyGtT8COSu7dmhOo1IHcK47l6aR4CWMObP0ZjSM/fk4H7?=
 =?us-ascii?Q?AV8grHAOPXUZ4dzhRUJiaTvD3P+2SDFGkkXeP/13Wp7HX9uQ2WHOUWWS0Ave?=
 =?us-ascii?Q?Yt33ZVwnjawqs3f3zQ4Oc/yxixcMMDnWkhBIlRb7KbZ11q0AfTQHO7KRb4if?=
 =?us-ascii?Q?iTKbVBZZldOBslg0TCTA/UOPO46fiULSuPDhVtr7juriHDQ7ZeD29WJLQXbZ?=
 =?us-ascii?Q?RebxgndqD3eoBdpH6xn4yow6dO8IKX0hWh3RlkGvv6a+wRH2yD6ehsBAsmts?=
 =?us-ascii?Q?57xh89AAvQhiDwH8iIQc5rKP9JRtMHHhS9G9G/dSG1urhAgaZy9qxT+F76D/?=
 =?us-ascii?Q?2dXt64jpox8bIoBT9xqCMJ01n8rho7Qo2W1PuymsMKYIsiRGdXe4pv/R4niW?=
 =?us-ascii?Q?Fd9DL2PuglLff32gW2m1TnwmnXmZHmFxO83Yr38EOvYViFc3Psc6DAJpLIdc?=
 =?us-ascii?Q?3vwfOpmvVDzVp6KBK7VYTk61TwLm4EJqE6AH18J71VLaRTnFCJGIxhA7+pTC?=
 =?us-ascii?Q?kxS4jSWY+N2p5lDsoxUaE8a3Wd6DBCPz0sgZt13Ue7MCTN3JHQwI7Y9fvBI+?=
 =?us-ascii?Q?gA+IGNkZ8X2cas+2igO2ukj7I1CZenPfr8wXKEid/k5kmeorY+OD3neWqfs1?=
 =?us-ascii?Q?8fCwB7MDw/U3G/x9x2a9VFWvjwq3HP2tbWFM5QUxsh3cVudcVznwR2HTKNRr?=
 =?us-ascii?Q?S9zDl7nfwBVZE9dtAI5Tc6YnqYBjN+WVQAGdEMnHTMcgJLdMxQeCc9ayBj3E?=
 =?us-ascii?Q?sBiylzAOL9BkyTOo2R+B/2NvhRtGQbX95dHjk54nIghnnyFai26HdKDs88pm?=
 =?us-ascii?Q?FcPRZ1u2gXS/PHnM8LOzZFweE/SVtu/0joTThCabagms5AcHhJXV7/YDC3el?=
 =?us-ascii?Q?9dFRl9VuXigTuCpXRcW/3ImIHl+KCG3RR8Q7fBTlpxY2y0kZlkAxXDbFR06y?=
 =?us-ascii?Q?JK1VlW/BUkX64LGjgdIqgFoZ0C7N7Ul3MZUlw3TJ9XmiS87bEzLciUqWtm6T?=
 =?us-ascii?Q?O4QEflhykN0P77ijRpQBvRLNFpA/4Kn7yF8aJi34cjg8QxWKMiCEvBTbG6B4?=
 =?us-ascii?Q?XrhNXBjAT4iMCKGJRPkHwzVFI5YOgCDxKhwHPS2tTVyXkvf9QKgVfEhN4bq1?=
 =?us-ascii?Q?FaA8F1PQlf972oqKf6JaeEnOB15Oyw+EMnAuLvmlg54HTWI0bphdQXY1AN6K?=
 =?us-ascii?Q?RxjPnqYBqNr+D7FvUB0/DdczIrLERgck6hvrMreR1+RMFGlKsrSuMDKWGGLr?=
 =?us-ascii?Q?LRbYukYSGjx4glvUO5HeADujy5rePL488UTqFgmzkIzQ04qUiWuBTdVfUxhf?=
 =?us-ascii?Q?cO3u2PXJzqkgjrS7hhFkpA1bRci7GgD/iK5g6Dnof+AY5BC/ZSFLNYuCc6pA?=
 =?us-ascii?Q?w5qwf2bIJ052taPa92VckWcW++OlReclysnGEeNE+cVbZiYOqNifAI7rPSGq?=
 =?us-ascii?Q?7aTBBkC6kWi65gRPcmpY3+/hABIjfIJv65TLXzQuZ3vEFVMR1vsbXJ3wiv1T?=
 =?us-ascii?Q?MHjpQA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tgGTv3PZhYcpSnQupByEKu8UdY60TOdIEZ8J57pGudl/ObL5GQqUJ4sZ/0XMU9eCHIp+7h4Y02kRBA6NaYRiolS7mAywKSiKYFsueKzlWTT6eKlLx2ed8KPJS3pYORNY+JuK8c47Gug2pBmbFAsTVWnLVFUUQQHeq4wVLaRWjfZBACXplR5TEgKKLnd8PGf032siS3JwAEy0adlmdwp+sv56VJP1+Arq+51K/fAu2n9hJI90pG5u1uPa+/+pmgbr5A7BbQo1enXIdUhV5aeXaSYXfPbet+GF2L9KW/uG8DjCtdpVlybfuGDMZbM/pqcv+v3yqd8HIvC9KPUGxCtGSihrLIkh0Nzg8UMPhhrJkU8Sh1cZPPMEgXUVJ+rYbJnqbKWvUUnNapAyldLX8evWrgbzH5/fpBwg2lKX6XQziqs64j/D3bVXRrzYMZ7UBbzM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:48:15.4222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2287d9b5-073f-4ce5-42f9-08de6f376bbd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6236
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Feb 2026 21:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19546

From: Antonios Christidis <a-christidis@ti.com>

New recipes for GPU DDK 25.3. Update BSP configuration file to
package driver, which now supports kernel 6.18.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Edit on the commit message, "which is now supports" -> "which now
  supports"

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


