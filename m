Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F39D5B87D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 00:32:41 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10144.1765845155362376028
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 16:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Rf/t6O3Y;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.67, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTswUnXEa82we5d0jyIs7f4a+HL2dXCjd87Dj2h1xQMYch4bswWXtOgqteTDk3nOT0EGh8y0BC5BDc89/TlsHPHE6u0AMAOVH6k173qkNR7E6wzQ6mpTubhMth5MjlMzTeQnL57/50kHY2IdXefACKzfExnxILLXFL6W5DxRiwLeG865E+auQyKWag8r43Yj/dfPAxZfAlUPyFhEXlI+gcO1fJgboporfpPrKur0h21z6BEQqPR5J6mt2NmuYAcqonUwOFFO+HfKaIYD28vbsW881K51xWLGKGmCyROGrP5daKjEhlAY22YcJkImxlqyBlnVuhWaCeX/WV8HHxt06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMUvQSNWfGqBzGI2y6TLFUDqKrD/zfaMNi3DxYQgfGM=;
 b=dmVuzsSd4Bw/Ug+bjcJgb15K8m0Geum/iIRxLD35rOslRyxtfy6nAA0oFYYHxlXJAvmRcjvRRIDGqkxzvnq5hzufj6Yb+r1BY6bXFEK56MqgXITZ/wKGeOx74NXQmaGXXrqM3p8wLtF5MF+0eB6BXLAulPa7ZZUJxvHEgCuhgPlA6AGDhGmO9jCbrWmufH9UhyJ5et2bwU7RN+qJF/rcad3tHoWR/SslB2NFck0aFN463gJ0/QzJS9nrKvt8ZQ0AEFy+VJZKWfO7zgME7cGQ2XtOxW8Ig+w5uxnfmGbDF3nS7NrGRJmcMMg63bDn8NTsPE2qK9q3//2GXAxMBj8Tjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMUvQSNWfGqBzGI2y6TLFUDqKrD/zfaMNi3DxYQgfGM=;
 b=Rf/t6O3YmT7uIP5xj85bE0VRv44JX5hvpHZaooNrpcnoSaU3auaES7TwiZP5p+zoVIpavVja9slF9wRsCJwbHhoRRp+AlM5NOXA8r4FzV7xj5o0lphLS8el3CNGUebcB7Qa140Qxu6Q6VLdoNCE/yy7ikTr7nA25X0yM6in21Ss=
Received: from DM6PR07CA0129.namprd07.prod.outlook.com (2603:10b6:5:330::23)
 by BL3PR10MB6140.namprd10.prod.outlook.com (2603:10b6:208:3bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 00:32:31 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::aa) by DM6PR07CA0129.outlook.office365.com
 (2603:10b6:5:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 00:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 00:32:30 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 18:32:29 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 18:32:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 18:32:29 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BG0WTAS3256191;
	Mon, 15 Dec 2025 18:32:29 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
Subject: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add support for beaglebadge
Date: Mon, 15 Dec 2025 18:32:29 -0600
Message-ID: <20251216003229.2229848-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|BL3PR10MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: ba76d8e1-36fe-4402-c909-08de3c3a9910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sP2+9UWGKWBkd2Z22OWI1+BiqGSxdVuAk8vUF0rUrquDeFS0AzyNiJDubTr2?=
 =?us-ascii?Q?zCBVV2CXf2PYQ2LKzv5KEglnCEat/COOERqtCkJUEOzcqHC0OvGL885BGfNe?=
 =?us-ascii?Q?irvNeyhE5G7PXkaRxpjYw8BBou2weK7yozXGAOpIqq6PrUvPUs+WR28rLQ8S?=
 =?us-ascii?Q?3JU/HU1bbnjEHgkhnyDQPlwSlQXRnmjFTRvhIFpK6v0twoaOyTpkdhgsiucG?=
 =?us-ascii?Q?Q2Zq2iua6SbN/VDcNcUje8u4zAGgqCQitZgeoSyNM1kEGbnw1PT+bMuLb5sp?=
 =?us-ascii?Q?Uet/e7kKal8uhRT0YFd7anCVBiadu76eFc3oAEHUXDGQcdcuyWp0zQAFJurP?=
 =?us-ascii?Q?+6sgJaRxiqhAGyHuWzF05jyDPgHiCwsRiyf34QIGgkSzfau/EiyuueAprxs2?=
 =?us-ascii?Q?hHy7NRtuig1kd2JZH5e3yrsTikhRkVONjEbqtGt638lS1TwbCS7+pdvZogPN?=
 =?us-ascii?Q?+VOdSELPkeZgsM1sQ4ZlUd4aId/xe+xjykjoeqh4LKJQovcwCn88udcGrqlw?=
 =?us-ascii?Q?N75PvvB7Fv6hwjXq0HXWcHEliy+rw8DBh8sw04HHbe7Xe1qBqiEKHOvU5yBT?=
 =?us-ascii?Q?FtY/y9LD3nFnAsd3/ioZeoAhDEuX++y/8iCquYMatlSKod9MOtIILowlnzAv?=
 =?us-ascii?Q?5FhqUsrJ5i9ct6Usapi7BaUStd69PfDJZctoFOhNku/vDbPkTIOZjltc1uRC?=
 =?us-ascii?Q?xDlLqjKbPkVrJZA1SnfG0TpBq32Kk6hkbkpDzuQA7EW1IllM+X6qPLdu3QFt?=
 =?us-ascii?Q?6mtEeIJx96vwd5UqPZE+0U7lxik0TyJnPpqFHOUmioLgoPJNouvgj+Dmp7Yk?=
 =?us-ascii?Q?MEJNvi8VPbrZoxdxUe5uIDFYOes5Zoptxe6BM2FwYp9tLCp3Gl97XkJtSRYB?=
 =?us-ascii?Q?PE9FN9OZ8yRlhCsd0MfZ2V7PL4o/tkexFwdiP87ytus0FmhHNp88DrbNVW8n?=
 =?us-ascii?Q?ZEkmzcAUVJE5C+5/CzteQlaXPN8B23wcdEu14QiYpYx7XXBH4tDkEPQmEHmO?=
 =?us-ascii?Q?ScsPunHKRPYSGCX5+33lvkJk6qL6icRf7HiVawc7d9rBYHxoqj5RB+hZREew?=
 =?us-ascii?Q?Du58sSA006pIn8fXJi8a1fmxLoXk1H8mty6KfaAlg1DASSklntkE8r2lTzub?=
 =?us-ascii?Q?ZqDIuO+snYjd3vbMkGBwpz+Ecpwtltd14e9BKofUbP5GWdHLsuFyMrR8Y4yQ?=
 =?us-ascii?Q?rKWjlJ47OAQ+2bYSf5tB4mtuyk/NfSrNICLzYqy+tOHbwrBRlxwVB585KqdV?=
 =?us-ascii?Q?hMdbU5WhY/hd85abg4QU+Tp2MrLT4BHImIlmcTz61twUIWTnGLEOQ0zWY0IC?=
 =?us-ascii?Q?GfMA5cEUJ85RWIAFeJQzDIfWg6imRdavyaicN+T7axeIAvwwGbdNvVuz1jyc?=
 =?us-ascii?Q?a7IZLlExf23pd4VG8urXIjH09gDvsITtfXtxPYFyCIcgQFe8cS1g0B1SPqUI?=
 =?us-ascii?Q?lLH+phCn1zpQJiQoTA/Bod8gL9RYc3861QW/UJJugejraS9U4dXXVAXq42pK?=
 =?us-ascii?Q?eIwElqrJMO7z0A8oXcQyLWNJhncjDIk6gctNVHLtr9B+TbEdM+BL07KQ2fIs?=
 =?us-ascii?Q?aFiHmiiBeBickVkJ2Bs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 00:32:30.6200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba76d8e1-36fe-4402-c909-08de3c3a9910
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6140
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 00:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19358

Add support for the beaglebadge which is an am62l
based device that requires new build configration
for u-boot and TF-A sources.
---
 meta-ti-bsp/conf/machine/beaglebadge-ti.conf  | 19 +++++++++++++++++++
 .../conf/machine/include/beaglebadge.inc      |  9 +++++++++
 .../trusted-firmware-a-ti.inc                 |  3 +++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/beaglebadge.inc

diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-bsp/con=
f/machine/beaglebadge-ti.conf
new file mode 100644
index 00000000..a9d59823
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@NAME: AM62L Badge
+#@DESCRIPTION: Machine configuration for the TI AM62L Badge
+
+require conf/machine/include/beaglebadge.inc
+
+IMAGE_FSTYPES +=3D "ubifs ubi"
+
+MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
+
+UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am62l3-badge \
+"
+
+KERNEL_DEVICETREE =3D ""
+
+UBOOT_MACHINE =3D "am62lx_badge_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/beaglebadge.inc b/meta-ti-bsp=
/conf/machine/include/beaglebadge.inc
new file mode 100644
index 00000000..5700050a
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/beaglebadge.inc
@@ -0,0 +1,9 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append =3D ":am62lxx"
+
+MACHINE_FEATURES +=3D "screen"
+
+TFA_BOARD =3D "am62l-badge"
+TFA_K3_SYSTEM_SUSPEND =3D "1"
+
+OPTEEMACHINE =3D "k3-am62lx"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 9e733448..7ef3dfb7 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -14,6 +14,8 @@ SRCREV_tfa:am62lxx =3D "7252a99fb781075db1987d8ce2c7e3732=
4297427"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
+SRCREV_tfa:beaglebadge-ti =3D "76800058f24e3eb3fcacdb12106a881ae279f8c3"
+
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRANCH=
}"
=20
 COMPATIBLE_MACHINE =3D "k3"
@@ -24,6 +26,7 @@ TFA_SPD =3D "opteed"
=20
 # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
 TFA_INSTALL_TARGET:am62lxx =3D "bl31 bl1"
+TFA_INSTALL_TARGET:beaglebadge-ti =3D "bl31 bl1"
=20
 EXTRA_OEMAKE +=3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART') if d.getVa=
r('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE +=3D "${@ 'BL32_BASE=3D' + d.getVar('TFA_K3_BL32_BASE') if d.=
getVar('TFA_K3_BL32_BASE') else ''}"
--=20
2.34.1


