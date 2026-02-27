Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FDAFD9E3A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:52:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104881.1772221966505578363
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 11:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qo8OD8GB;
 spf=pass (domain: list.ti.com, ip: 40.93.194.30, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlOQvA7ooXD3UpkrMNyziGzViz3HQe65/6KK1I2ZMs7PbvNFl49M5k+Mk2RSxqplBadspVgkDtJHQtPqrsqdRruq4HPriEOA8EgN6kfSQxETuzQQdnI2FGd7nfa3gXyoKnDoWvNUTsSORdQ2SmNX8KEopqu7FpkuXZgw1ZPVGYwfbQMF5yGIxE0rVXGIbTVtKs1KPJIcXUL5UoaC1fLZsSjcg/hqNnilSDIMFaVzkBdGYFQjA20HXUV8ZfndbxySTFLWLrKdXm4UwU8oFTiKngA4HcJz7twuaMojvmb/1t780owrnvmBOkRGs6z33sDuuTaVc+C/CFUBVnINkLWiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Dqxu68iosUsEZI0qCpFzwXoEe7HR19G0j2fy5JEQzs=;
 b=RflFRBoKhQ2Uvp2kwQVLGI3GL/o0iXcmfWPiO9aDlCQErx4BhTA1pMBCVYAg9DG26+FhLdhRnkj4bvPVWVThRm5+XCDddMhhk1CMPnEo7xUP4qZm0R2Hunysjc4HemVJ4A3m04CxCwhBfk0veNIE+LT8tO9ZLB1yb6IBE2Y1z8z4Spf6NfZgOlH8pKwxfeQu/5QHy6mmmKklrvhVgwT5Qhvmh2kmiAz2Vr3woTxUxGVNhjW1BOpq1FFizHjHbIv4YjGekSWs7/pqrhiSb4Zr50ytarb5aNnBX9qJgqZHEoWaz/ZHIiQF6Pusf48JuSgHrY0dohiMeOniTy2AnjOxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Dqxu68iosUsEZI0qCpFzwXoEe7HR19G0j2fy5JEQzs=;
 b=qo8OD8GBQLktrl1f77qtlEji2QYKnH8aRTwIlT88uLEwwAQR55czfKdeVl+SQyAHDjEPKtaTpwSfcGbmHn1aMyaA+AIJ3/mVInaSXQwRYMo2WkeZS7SsvwLDquvv36W1IYyI0RC2TShb1Wk9F6uqj93zUzgPVF1lRnvULAjF3bTgwQOo+OM46vy+O1YQRv+LX8OdcYfhP8l8/K+MTEHOwAnA1/9at0MhgmV6I+CgXnsVhFzJka6rbNvtI9fNjE603t7P6hXKu0Dlb8xj1HPg8T78OGdQ2fRu51p7HQKY1rmBODM9HqOb7wK/klH7TQhFXEsNVUAwiQEUuzXtnoNoqQ==
Received: from CH0PR03CA0235.namprd03.prod.outlook.com (2603:10b6:610:e7::30)
 by CH3PR10MB7433.namprd10.prod.outlook.com (2603:10b6:610:157::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 19:52:42 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::90) by CH0PR03CA0235.outlook.office365.com
 (2603:10b6:610:e7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 19:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 19:52:42 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 13:52:39 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 13:52:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 13:52:39 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RJqdcW109545;
	Fri, 27 Feb 2026 13:52:39 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 901792A61; Fri, 27 Feb 2026 13:52:39 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202602271140
Date: Fri, 27 Feb 2026 13:52:39 -0600
Message-ID: <20260227195239.2256511-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CH3PR10MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 7516b7ee-5f5c-43ba-5ec4-08de7639c51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	GFSgS2k/CDMLw5qFYtMvYen9JMoUdfH5Hsw9M3NE7lYwtKoH33FDNljNGP5nWqm6arwv/TEIPDaSfQRdVrAHa+Bugaxz9pSr+tkaSTgfiym0Krkkcn2A7F1/CH1G+i8lJpQ/dQIfiCzPFG6hVffX3YPeBfMHVBunmsIbhhEFN9Y+PhTmm3ONGkdYdxRTn2hjTsh2gNqYzr6h6CzZS1zkUHmmv7UhdcMq7F1nIrHiM2KuFCvAvvkbTqUVZa3+pASrAyRRZVdFrqXnqO/i6aE7Ql++NDZq7VZ/wK/aPt0kyWqJs9Yyc+DfqM3ivy1aqexILzm7kv2YQ6AZULu6Z60fMdZhRhMH5OMXHzLowN5FkG9gi6Cv+KiUquzTr/Xj+WnYoFzlyxGSaNZqXM7YqM1udrFg+VqvwkcjejTcllFiKSmNgMOWKgIg2D3ETC00W6JAjvjDrsjNvHrf/LBpZperPEThNRq2AnXVcXStNgBVFpPeuHVGKYbn35rqIm7DsyTFD1kOULAs0HHDnGku8jp7ih7TKDnti0iEUUJ+iV3LOhzwSamF2KdEnDB9aOWr0wKRh7jt722lhr+11TxpDlfI3ybfwDS4Z5X6NMoKKguwFYLfa4iQa+nj0nK6ThSbp02o6N1BFr+lCaxulZDx0h87qx7UZsEvIV31nWmSTiKj3CJVj3Br3IsuHRXXZosBBG8G5YfGlh4ylFpz8RaLitQktZ2oQIUZQVZbEMTZnEMv7Q4kEXljP+Kq1kQFrMkREkmCNKRzvcCuyvmf4tdNun06/dKi1pqnWeuLwcEo9reMiXMbLKQlp1t10Cy0ozmgk7qusR9GN3u9IF3XqVkOozoguQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	STJgfvrInQGf5tRVaM6ndhFVIfaTEnSw5hobiJ/0Ze7IWV0wCxZKdMqTNxG2bSfnf6aobe5PBQHwpsYKmvtQ2oCG6GCPuRXNkomARJkfEoiUpq0Byzpp+fFnijpJ3jhEQe9koFotuVy0WR3PfSugQptcbSq6JiIq/lC77+ETRamdaZPCfa8NGi5BCTAWoTe4aB8ykv1/zWuBM+x69KXU7J/FIAGzbuRvskL83ZheIskmOrRHbusbBR4V1E1eVWwB/tqiJP3ZUiWyCSInvWUMuiiS1s1AogoTJivsJxNHnE6Tf3pMLF2Hqe915zelhLpd2/wqnRpd+PP9PL2+Drm5G2PplotJy+dQiXDwxHssbqpV20nNxyK8ShL0Bsf4g24zFVJzOcZjLKOI63a0yJwFptR8aIbfvcKMMIVbz6xQCSFK5r1mLsU65+BrgxqvIDt6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 19:52:42.4503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7516b7ee-5f5c-43ba-5ec4-08de7639c51c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7433
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Feb 2026 19:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19621

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Dfc93d06371ec35ef634284748e8263907327d6fd..c5eea0af8225=
334b1babfa750b329200dcee3d2b
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dcb63a11faef453412da23e72c5e9b6782cf62274..c42989009c20983=
4eb512c065e283c492ec3dd50
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D7e2c5ee21e318f67edb760f67fe16d41b1dc5a1e..e9ebc82=
5175636714e0ffa113133ef03879748df

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index b10f1a0a..e963acb7 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "fc93d06371ec35ef634284748e8263907327d6fd"
+TI_LINUX_FW_SRCREV ?=3D "c5eea0af8225334b1babfa750b329200dcee3d2b"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index f830e181..6f00bf40 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "2838c4785805ae8ab50e5692012cc071fd065c24"
+SRCREV_tfa:am62lxx =3D "77f19d893b8cd78c50092bc797a1de52f99c428d"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 0a925846..199e4411 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "cb63a11faef453412da23e72c5e9b6782cf62274"
+SRCREV_uboot =3D "c42989009c209834eb512c065e283c492ec3dd50"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 235ed9d5..8e4ccd7d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "7e2c5ee21e318f67edb760f67fe16d41b1dc5a1e"
-PV =3D "6.18.12+git"
+SRCREV ?=3D "e9ebc825175636714e0ffa113133ef03879748df"
+PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
--=20
2.43.5


