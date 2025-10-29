Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DA5CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:21:45 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.9])
 by mx.groups.io with SMTP id smtpd.web01.1233.1761715296663122074
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Rn0+GvFi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.9, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFkPN8E44KPghG6EQnl5tndlSOBWVPj6SQOiJYdWoaFErpLJ/0nGePZwgvfp4hN0XTeKXZcGmsBuIjuqzmOKs/EVCHb9w7m1A/RYhxPZ2ln4FOJMFjps5rAHzOgVVjIE3DbhviNkxhdpnA84NCM1UD81ECwVa/vyeygxtzSJqJWHqqCKJxoJeIwAolagI5idTU5nQCUuwb9BZO3gG3eZffRiT6zjvZ+JFbB0b9Hju2kJYblPuI1UAX45wc7sjGMSrATwbHs3O9+eBiBdLvn06iZNxMgXqIum9jseaKTo5WGfirTnwCGt9p7mcP7FoksEl/liBtEMi3WZ6/uU78MJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLDdVTh+OxlhMYafX/oegxCf9/MdRHr6R/2PCo3Ql0E=;
 b=Z9uH/WnXxcdvltaISxhy3XhqDYJW098dh+VLWTZ/Jj0M2LcOB4cCUlW8danoscrTFV6t9de6BhzDQtIeddWnyNAeFVC1DrNRcmfreCQG1Vepn57jvF9SI6TwFa37SXo0GLeE4x8dWqtLxt1f7ZTwRKs9be16Xmq8a/kjoxllvUb430jj7TJqGyx18PVzgGHpHET3c1AkThMnMYpHdOhLanRgxoRDYusFULL+u5mm+EhQGhrkU6+6comfzBVcSzoTeEzNMXysEGwdu3HoUtE5Tdmdr9dv7nzJybCQCgBioyu2ZOuw5kRBKZDJZAx3qH/hKLKd6jdVWRVi+vJxflX0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLDdVTh+OxlhMYafX/oegxCf9/MdRHr6R/2PCo3Ql0E=;
 b=Rn0+GvFisvAcK4WO8646pvbd7OoYBOEG+k9/uLz/IOWa7GWsaOZyxB4I20gKS5FxwXMcWwqSvK8jithsrr09w5ilULCPu0bg0tF8YA7PWbLb8UUsIjNa97KsrelBelis1BWk/afj/mWCgB2QMSZMHgXMyK8o299QpYKIsRYHZxU=
Received: from BYAPR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:74::25)
 by SJ5PPF8CB762A0C.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 05:21:33 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::ce) by BYAPR05CA0048.outlook.office365.com
 (2603:10b6:a03:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 05:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 05:21:31 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:21:26 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:21:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:21:26 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T5LO5K3482742;
	Wed, 29 Oct 2025 00:21:25 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [meta-ti][master][PATCH v3] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 10:51:24 +0530
Message-ID: <20251029052124.2712052-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SJ5PPF8CB762A0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 8577a94a-73de-4d21-f9c4-08de16ab055f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+lXrd1at+ejq36tbVmsp2/IYP3vqoUlgxmupsjDyVKA8I2VwkPxJvhVHuqIU?=
 =?us-ascii?Q?1HXphAydZG+ys8UKlZc+bPIypLoD8ce+kfGtuTk2O0DUAY2ZKNQbK9NPHpkc?=
 =?us-ascii?Q?pl4qcFFj67z8R39Ny99h7gM77YU961hYMWind3vtzEev87JPMs8jy7xeGneU?=
 =?us-ascii?Q?rcOl35tpz0Ja7cbnNz/hQYce/N3bopyCEhwSlLMa2ZrO0j+LCCh4OM2AVB/E?=
 =?us-ascii?Q?U0/1Hf8JWVh1eo8rCSou8WVyxN3rpLIbzCxBL7OWuRK3HruyzZx8Z4e1LcaM?=
 =?us-ascii?Q?Y/Se2cVX2lTzV/yHDWMt9gNh+0yjaKRvdfWNxOMP+VCBDbIFlomDcxwwRlHb?=
 =?us-ascii?Q?tqEo5YvBz+son5ZB0BpBdMj63xr5Tu6mOHOguhnuxyVIMZrLIdykkkHEXsI8?=
 =?us-ascii?Q?qVUZRwwm+a8bkRSrDgVvS+VP3izvnew/3ao2/PZh0+1WVzNmY2AOtrKSNYU+?=
 =?us-ascii?Q?rLDJRwlOtJud8cZJXXT/TVS7l3iybkAG0U0ntx8UK0cvf3/UuWlgX19Thqmb?=
 =?us-ascii?Q?PawnglwPuNf7Gz0dJM8I73n4WCmonDkS+/WdtUPfCp5J1HiFIntjw2nJfXx1?=
 =?us-ascii?Q?7OoRxkGlj1FvD1ydYyWWyE8b2tIlE7sh42PLeRN+Y7fYM17UMH45QbjenHuY?=
 =?us-ascii?Q?44HogVidUKZLbEcJxmcfZUMSzFkHPsBooVi0UN698+77V6c/VLOvhNxpntz4?=
 =?us-ascii?Q?eaYcVMcsj7Cfs+XdNLEF1E1iaEWFUO6zDlV/5a27pwOaL8jnCKpYWr/ScPtl?=
 =?us-ascii?Q?gv4rRQ0PZAH7YLbr2IZ/NEvXAhtS1RwGG8mDPAksOpMgfk/Vn6MpLmqMNzSB?=
 =?us-ascii?Q?sUw965QpblpHkwORmo9yPqkdaRtbP9Kfd1QhSJTBsSgPXU8EiIEXdnXXFlaj?=
 =?us-ascii?Q?iMVgl2kcwzUZ9jFQdMBp/TPPigr5HT61UPMNTFxReyZXVl3hI02NouunjS2L?=
 =?us-ascii?Q?8R+k2rIOQL7Jz2HtA8Ypn7vQNypdwM1wYEh17hNoWS80v4Pnxb3LH0Tt0+5I?=
 =?us-ascii?Q?+6EVXXiRWiP9C+hIkJwiNBPrr0diVsGYxWHoPTxkiZF6KpWHSacyHoaK84PO?=
 =?us-ascii?Q?JAv1XbiHFJDHznOG3WTYdVpPk4Uz6pOWVWMKBXPj+78PqTpzNJY6sLCxO9ub?=
 =?us-ascii?Q?ejw+7ikFn94Qb82mLlHQh8S7B2gOLNibssoI+fF9LzleayoTo8j+lDkzPTN8?=
 =?us-ascii?Q?L1pkgIPh3P+PmVMMm3NEWZqyATVqN15Ykj1hQGTFBrXeEPhXuuple7QGk+0c?=
 =?us-ascii?Q?qsEeNFvPmM0PZCC0nQ7Zw0xl8Z3YKrLNskSoaOfydxxnjV96xiEVczpx98FW?=
 =?us-ascii?Q?l8HsbbXy1mxri6vKPGgAH24Y3XlDNMu57+QcwaTPHGVuzNC6N51BBgYJX47Z?=
 =?us-ascii?Q?79YpeZgSqlExXqYGxyrAZw8QTbU6YNMjGBlMy7XSq+eTZTFL6Dre3FvoNrs3?=
 =?us-ascii?Q?gLr0F/DOJVZGP3wTcE93bhI6+KHlDaTfz2tdPCoAS/scwVsadvN4Dnv5ldTV?=
 =?us-ascii?Q?8ZPuJ+AUUNf3OHj7WnKehSHMDOw2irwUVnSniJKUyot4YZB1IVfAd/spZhwu?=
 =?us-ascii?Q?AmCueO0JlkV548hpSq8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:21:31.7861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8577a94a-73de-4d21-f9c4-08de16ab055f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8CB762A0C
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19197

From: Vishnu Singh <v-singh1@ti.com>

Replace MIT license with TI-TFL to align with TI release policy
and product requirements. Legal approval: SRAS00013045
Update scarthgap srcrev and disable 2dfft example from lib build.

License-Update: Replace MIT to TI-TFL license

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
Change log:
       v1->v2:
              - Update commit message with license-update
       v2->v3:
              - Add branch name in patch subject

 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bs=
p/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index 165ce8fb..cf816d9c 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,14 +1,14 @@
 SUMMARY =3D "RPMsg DMA shared library"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c5=
3"
+LICENSE =3D "TI-TFL"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50ed=
3"
=20
-SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dmain"
-SRCREV =3D "609fd72f458ba56f80d06810509ef88d010d2c03"
+SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dscarthgap"
+SRCREV =3D "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
=20
 inherit cmake
=20
 DEPENDS =3D "ti-rpmsg-char"
=20
-EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
+EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOFF -=
DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
=20
 COMPATIBLE_MACHINE =3D "^(k3)$"
--=20
2.50.1


