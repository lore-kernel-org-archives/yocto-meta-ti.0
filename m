Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE47C44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 20:49:14 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22164.1769028552234508055
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 12:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qK+PBMKQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.24, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3JSEfU/kZparrzLbV4xy3p2Pm23VuB2TEyQ9a9Bn9j8BIuFKTbLjP2MkfmprvbR4qziT6mgB4tg/ZwlfDiw1QXzauBiwS6F2Pl3y4O5FjlO/wT8EP7LSe2h4zXXQkfNphncK1bMsW2T/Qan/jwAxDX5gaDm3foRXBTi5gGHJWFfwT7budvz3JswE/zSuju7fZk1rgbRLnjuPnZ5g7ChstfNnVL+pFVOQG2lYSJfovbMpuKRzM5aOikCDGlmSbWUZApEf2+4pUefixgVELgsiDJi2lc6N0Aoisg2HpqRDlMztA9gXZle7pj3hcdbFDwq1kjIaQF4O4kSkqDPzEPzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUBInnpKAnGxvs+3WvutAf//FBpV143eBOSH5AvY3JQ=;
 b=gYblwFjFgmUH0cfnCXGUstw4Jq8F7iVvXhEWitLzmqIrY0qQH6E1CjkHAPbznSETBptTyD8oInEX8M+P7YRfiy/NaM3CAHX7BvPdEk3wySqPqVACraf8dThc8yvIEemWbP1xWvfUP/cD2b5mt4EtB7g0SajZ5P5vBEClmON+mN/krOUe/hvl5lIIUvGmSVKh3zrzakWpVLjT3vVc3RnWU6b3skU287vfdqBQCo60TjEDSP33XlcjVa4Y+KDfUo5UeP+1MEXAWnG/efe/mMp/CrUMlbS5C15sUS2cSTZOo84oJijc8eceEN5F8FEanbNe5GbyyRC6ZXhpBozflI+aVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUBInnpKAnGxvs+3WvutAf//FBpV143eBOSH5AvY3JQ=;
 b=qK+PBMKQ+RxAYvtS2tDJ203ETjr9po/NKNLkvOwzJld3OagamfuwSh+0pp8fModmCjB4h2LpqY7I1z4fEHRhTfuv9i7yY0JahWQfcyzcXEBHINSvxOQB5ReTzfn4JPfne9JzQe8kzEn9A29tRB90hw8P1XUCaTa+IBHrpLJBdqE=
Received: from CYZPR12CA0005.namprd12.prod.outlook.com (2603:10b6:930:8b::11)
 by CH3PR10MB7930.namprd10.prod.outlook.com (2603:10b6:610:1c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:49:04 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:8b:cafe::67) by CYZPR12CA0005.outlook.office365.com
 (2603:10b6:930:8b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 20:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 20:49:02 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 14:48:56 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 14:48:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 14:48:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LKmtq43485843;
	Wed, 21 Jan 2026 14:48:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vif8J-00000003Poy-3oFY;
	Wed, 21 Jan 2026 14:48:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/2] conf: am62: Add usbdfu tie-test-builds configs
Date: Wed, 21 Jan 2026 14:48:54 -0600
Message-ID: <20260121204855.814231-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH3PR10MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a175ab6-55f1-4f3b-0683-08de592e82c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JEolwjof9/0o/BHTPCGz1Ks/ZaAjxV0NVxt3/4Aquw3S01uRH/boaKD97amN?=
 =?us-ascii?Q?o69hZO5TniiNp2B5ES7XjbHgWu2HV60kl9H9/YBnidq+WnGv13ZkkspKfu+y?=
 =?us-ascii?Q?d22h5qTrE/hPthgQw8fivsZFuQhfTv+E/fYYV17QiyyutOBo9fdK4QR0XUSt?=
 =?us-ascii?Q?za/X9QCdswZSrJKCskJkToH7M/OyOt9n6BbrxhWFnRKeNJh5ney+dne4zuGi?=
 =?us-ascii?Q?U7itsnY00BIaHY3aZlcNC0NpPTOjvAMXP/z4pV7YZpBsNz3WrTb74Fd9BIQa?=
 =?us-ascii?Q?mXfQwtKhvRVqcvPyqdkstjp01liTDqUvekadU0jZ06MkuPHbHWfGOPRR64xk?=
 =?us-ascii?Q?ERi5b/zATR8VEeE/VeqP5EZQ5zt2b9i2/ob0ptbJp4a9yPop8FtVRfBhm9/a?=
 =?us-ascii?Q?P8dE0Sjh9gv6/xuonKZNNRZ80M2g0MQWDigLOZJoBPE95nwaf9ltAx5dMqNj?=
 =?us-ascii?Q?z7/eVtX/h+O3grV2zocmQj7SK4cP7eP5KP2F+E+6Sp014uZJsMn3jtUULlIU?=
 =?us-ascii?Q?LtxmSi9BDM664UR9KD2dHkFUGIT8fSOAQnqDu5DjhacZ3lDlbsczzH8c/f0z?=
 =?us-ascii?Q?axkSRr0Koc30CKE2GGxvM1Sh77muZQ9I1KFUu8Lg521IHWBuoVDXF4pNuT19?=
 =?us-ascii?Q?PzVHrN4JVCtPBvHlBVwptwaTTGPyulX+KD7blsbKzXPQ+h0d/D2Bws0AIwra?=
 =?us-ascii?Q?c4KKQi35vDPKLb1BK7P9lc2+XtqMINNmc1JvZxzDpOHS2xMhl8SG8baLff5x?=
 =?us-ascii?Q?nfEoKdXuxVXKjh8X23Dl83qMPHYGXbm+gYtFbDKJK/z/oIc/sc09X9uh1Foa?=
 =?us-ascii?Q?vudxINIsqIS21k/YP7N0VFTwUmNQeNrwFotVmyaMgCotDzG4dgQGf0+sKBK4?=
 =?us-ascii?Q?Qc+mBnzDRneWY/7w3YWqJ75s5ScwY0oX5a8C1yNWahDq3Ihyg4F8ilzLhmjp?=
 =?us-ascii?Q?KS2ROE1PZFJhfO0k5mVMFRNsxUFADphcSrDmiSNG6ixINAgyySC0btvgTsq/?=
 =?us-ascii?Q?sKbn32nYVs/qSeV7T8OstbNSxeQsLilDYX9cg4zy1EUbBamisBRONGqMXWWc?=
 =?us-ascii?Q?BduYxKovnRvQfYdyEuf76jw5kDu3Bo1eIb14SJDI9myIC0xTPn4fTCRkpfJh?=
 =?us-ascii?Q?+X2oWgd/2Siwe8AAK0dNQusyYsDrB51ERtx06i+/x0daKg/v6QKH1pY2MJRr?=
 =?us-ascii?Q?Y70b5JJ9xNPZiDCYmI/p5ST7FnIw02htiy66AmBHeaVxOv5Q/bEjMYpuNIX2?=
 =?us-ascii?Q?hbnzzXXp0fcWD4wzd06oqtClyj8xmI+mI911mXl2CuBP0TAb2KmHi8ggS9vX?=
 =?us-ascii?Q?Cc2epctqGC3BI8Dtk2z9w+fiV00MMb2w+kafsorI7ykKqbdQLRz9UTuOBNwS?=
 =?us-ascii?Q?+9GQ36+i5HathwOwTyHC5bAta1G/MQvjc4kh2vZspnjn0BmHZ4gUl82iS9oW?=
 =?us-ascii?Q?GRfU1/Ify3LtmPyjuqQ41bCkyZtXaFIrjGnHjzmu9bFgaHIFZgt70p3ge/7k?=
 =?us-ascii?Q?J/76j8T91xm6tgNpn/7FviOnCXsUjjjSXwrF47xwp4zqqZXaP9dB2sWOW5u7?=
 =?us-ascii?Q?dnHjbARy6K3XG0UYQcEKD0cGMoNK8qD5fojbRnJoknse276xTgczkz0+RGq4?=
 =?us-ascii?Q?fuMfTLPMlA9zxoZYUF8Jxytw58Ay/VbwPpFtu96OU+a+Mn2GFQfaEafPYQNA?=
 =?us-ascii?Q?5QUKGw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:49:02.9551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a175ab6-55f1-4f3b-0683-08de592e82c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7930
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jan 2026 20:49:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19435

Using the new UBOOT_CONFIG flow, enable a mode where additional uboot
configurations can be built along side the main config.  In this case,
turning on USBDFU for a board for testing purposes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 8 ++++++++
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 9 +++++++++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 8 ++++++++
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 8 ++++++++
 4 files changed, 33 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62axx-evm-k3r5.conf
index 30c7ea7e..fb2fa7cf 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -5,5 +5,13 @@
 require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
+UBOOT_MACHINE:tie-test-builds =3D ""
+
+UBOOT_CONFIG =3D ""
+UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
+UBOOT_CONFIG[main] =3D "am62ax_evm_r5_defconfig"
+UBOOT_CONFIG[usbdfu] =3D "am62ax_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS[usbdfu] =3D "am62x_r5_usbdfu.config"
=20
 UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62pxx-evm-k3r5.conf
index 27cc7c40..bf82849a 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -5,5 +5,14 @@
 require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62px_evm_r5_defconfig"
+UBOOT_MACHINE:tie-test-builds =3D ""
+
+UBOOT_CONFIG =3D ""
+UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
+
+UBOOT_CONFIG[main] =3D "am62px_evm_r5_defconfig"
+UBOOT_CONFIG[usbdfu] =3D "am62px_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS[usbdfu] =3D "am62x_r5_usbdfu.config"
=20
 UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am62xx-evm-k3r5.conf
index e8d7fd05..9c8147e8 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -5,5 +5,13 @@
 require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
+UBOOT_MACHINE:tie-test-builds =3D ""
+
+UBOOT_CONFIG =3D ""
+UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
+UBOOT_CONFIG[main] =3D "am62x_evm_r5_defconfig"
+UBOOT_CONFIG[usbdfu] =3D "am62x_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS[usbdfu] =3D "am62x_r5_usbdfu.config"
=20
 UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62xx-lp-evm-k3r5.conf
index 8ae4af36..c65c624c 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -5,5 +5,13 @@
 require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
+UBOOT_MACHINE:tie-test-builds =3D ""
+
+UBOOT_CONFIG =3D ""
+UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
+UBOOT_CONFIG[main] =3D "am62x_lpsk_r5_defconfig"
+UBOOT_CONFIG[usbdfu] =3D "am62x_lpsk_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS[usbdfu] =3D "am62x_r5_usbdfu.config"
=20
 UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
--=20
2.43.0


