Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17A3EB28C1
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:06:29 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5116.1770354385631072843
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gg/Dr5vH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.50, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haz+DpDRJDI9mN7Cyugf3bJ8Bvkow1fmz8xNvz/XYbQxYO+8ZnuUSXq82wMdS2jKWuBqDOmC3jXIrKCsqydd5fULRU2xj3ornVBry5/yVjOXsYq++Xw2ZCeccYYaDuXgr73fbpFvR7F4RjYm89QmEeJ/kHB5RZjPWTwklYR6iO4FhBXuZGENxCQxGUvpjAQaA3y+yn0YvB4zWJ07nJTdnFd0vZq4J7acnWjl8Ccve3y292gx+O0jgTcrPcTxkVBswchYj9CB764jiipDM0HkYuZbPuWCOPquyUsaebFyyKahn9rdg9cdsvH0tfbwrsvL54gQvvnDkhJwP72Pb5K/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSVoLvnboVIE1BMwBzziSNXZnuoJ4NMhEIYO7d5h4iI=;
 b=CSwzPw0ZFpjqhMsRxjSxnudMsDjdTWl/D7u6zakzg+qoI+e4TDyUUU39NN8jCTm8nnssOTLwPPHaV19YbO/V6H/UQk5hdSkE3eQXQzle7wAM13znbkPGjCjRNn8qOapT+OL9V3CqlL7PkAZO0UwEtbegTw3GvF2otB5Zgueo3+zfQLdMl0SxsoScB0Ulfc/xpt7rgQUXGPt+o/ciEIbaPSPCU//vVGqe9dDNr2o4oNJ3eIMNIbWUOUqykagEf79Qx/f4/se5lXKEp3eCq9zLWfKQfC+NaHRtDDrjnXFsUE/7J7iAFJh8tRvcbVbkK1uBLOp8uC/KUrw61FsJGdKm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSVoLvnboVIE1BMwBzziSNXZnuoJ4NMhEIYO7d5h4iI=;
 b=gg/Dr5vHmZRFzIndSdKxslO6G/bKimVtosVjo9VFkCBdaiXTouAwcA0LlSQzBtGTw2mE/F9VB4AOmwozdpJUDgd/DUIvZcLFqTaXVepmwfnTlmEh/MpuUloiz3xNaTtu3LdGMoA0X0IfUkQPmNxPv8dzQ3yy8GqyIRrBGRX55aY=
Received: from BN9PR03CA0319.namprd03.prod.outlook.com (2603:10b6:408:112::24)
 by SJ5PPF2D96878B0.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:06:22 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::ae) by BN9PR03CA0319.outlook.office365.com
 (2603:10b6:408:112::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 05:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:06:21 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:06:20 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:06:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:06:20 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61656J6q557080;
	Thu, 5 Feb 2026 23:06:19 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [master][PATCH 2/2] recipes-bsp: Remove TI TAD5212 DAC firmware recipe
Date: Fri, 6 Feb 2026 10:36:08 +0530
Message-ID: <20260206050608.1929093-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206050608.1929093-1-p-bhagat@ti.com>
References: <20260206050608.1929093-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SJ5PPF2D96878B0:EE_
X-MS-Office365-Filtering-Correlation-Id: a67571d5-bb67-439c-2068-08de653d77fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZF8BaOmh48PSewxN278DgZeYRyiEczq8fNqlrK9W9EQE7DKHEHtBEn+oGoSe?=
 =?us-ascii?Q?qsG8QazTGEfNkQrOAfSLZ3Wba3CeVxgE7p5AqpiedjOTf8CVB0NpO88/rhuO?=
 =?us-ascii?Q?ilsr7Sv13lMqvky71zR+DUyGSKDitykOQzQH1O1Uctgmbrk03MmX0IwpeaG4?=
 =?us-ascii?Q?CnBhs3ete1GLE71VdzagcLFiCppUhS+l9lC1NPMlPeDnBkYX1d0lunenkrGD?=
 =?us-ascii?Q?8Jicg7y/WnIxLeQK1QvUVIVsdST0MCsY1Z7aiG6IwwbnI4MVeOUC2+EWgjfD?=
 =?us-ascii?Q?lkG4MiNMBVMP17jw0eQnCc2+++fIuJ5Iv7dpNKe/iBzP8DoNBNQzz0OWGhtV?=
 =?us-ascii?Q?Ynbmbc4xUSf6C8BdQOnOu59WVD77QZXfAeK1bZ35nTsC0nRab8YkTKt1zEcQ?=
 =?us-ascii?Q?KQjXu1Tei68IrU6TZFmhNL9+9yO6EPkPUwQc+crfBMNXQNUMBACI9xlFYyJz?=
 =?us-ascii?Q?2dV5iuxQJirCf1Fi3/YhIOiRJ+ZHRQXmQDmvY6aY6ZyO3VSyL07s7fvtPFcE?=
 =?us-ascii?Q?/hAUSshQsZf/fauMc2NDVW5+gHCOnuUYz7fnpSGC2wgp3FHMJNI7GQw2kP+i?=
 =?us-ascii?Q?YD4XK0ft3ZLuP1yJCBv5uBfIb/lFXe21Za040J/KXJ6r5ZLthHwAn3Ux0V0P?=
 =?us-ascii?Q?7DG1QZsIc0vzYTd6GOvVDMmyMsBxGNORjuHjoa/uyuDc530tRbkhBCHptzUd?=
 =?us-ascii?Q?rhcGr2HK0geM1HeLKWSkeTf/VBFCbmFXxZLmWiTXBPbCnvGa497QtxXNQIuD?=
 =?us-ascii?Q?Q036/tRAZoU1Lsq7ktQoDne3MPHhMYh2iYkQg4btnY2v6JK9h/YPy7cpQJcY?=
 =?us-ascii?Q?HeZ6+gdHHi8iggud29P6EjVjGAabEOlyBjhAyK/wYCb5R4LfRCnncMBrzk/m?=
 =?us-ascii?Q?+8o5olzeMLWVzRPkorfTCQbCrujXWDQHamIGnaKAlrMZTX8Q0rz3AQwooCq6?=
 =?us-ascii?Q?ySjNsIQSiLf7qidy17RKiGt0BliuA4KXoRk6ui3Zz3X1ftHG/cW7/9ZTcBhD?=
 =?us-ascii?Q?irJUb8ayavLcYKH/hwLGoSXAr2+Zed779k3M6MbUVjXfpwKOx/IAE2GNhwkx?=
 =?us-ascii?Q?Ydc9oGlyN0evX4iVn72WCGRAs6ZGJiB54+CmR7X8Uph4mhnnF5bsWRK0cm5m?=
 =?us-ascii?Q?U3OoZ1dydxtyrkKAn8u9bQU2TAIaObodOz8gpvva1Bk9GxS/1B/p+e1YF0ki?=
 =?us-ascii?Q?vMlzTAkpMHk6JX22VFsSeD3ROwl8hlZiD98rvkzrX0UPYoWBArUxcwsR4Stv?=
 =?us-ascii?Q?n+FTSSZN0L2bI54inEDk8DwZcxWGz/A7OknIquuMs2mlkDzhJvWihnnuv3f9?=
 =?us-ascii?Q?Yd5uGZksq8dXAPABaGy3Mhjwf8cNrjBqcwDsQmOf+K4+MnQzeuERf0RY/7l0?=
 =?us-ascii?Q?jaN/g3KW+TaRx/zifng/AZ+Vxed4mRoPlkTnCOQKaizzFFwPdkiBxQRd6Hmn?=
 =?us-ascii?Q?RzMKRSCDKfvDEDUjocOkb9J/7X5OdOIYneNMEAcNfx+eQcJH56Eqcbz2PQye?=
 =?us-ascii?Q?koqdD11VUD7D6zfq3AAUH6v40VULO61cjCkNifKPzJ2f6Q2tuQM2MoA9y4Wl?=
 =?us-ascii?Q?yZNO90UkpYpJTbGY7RXdgqg5hTZGPvU+jvdrdqLrZTaF+iJb/jLiZNtFuBBN?=
 =?us-ascii?Q?EJprF6DHOGY+oy3+xecB6xJPXZkWGXnBHLxt/hN1ffQB?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Kz5GGhhSpDcUIUsRQ76R848Tw2QsB/gfhXanbctOXejZsPG/qCJKsTwyCFIVWS2Q2nhXvXBKg/x8tr8KYSnGY45QLbEsCkYKslwhp4ltdSJyYvyY6skRjTvt/77uEXfvKPIFcCLWK5WvgyUaGUlB3hQXAx93ykb30SZSTJ6TQXEN7abvghkgmGXDd6YWxV9vTQKMFz5NDgCEvYCMDUJoi9VyvwkIBUCO//ImOISK/RzpGZV6gwZ0tG9cMvdQJNqL+gDYrno50okPV8fzVXHb8v7iUmMDxD9s6soOdkTJQQBDBtld3z5pz02E15SY9xLb5jIdqpI9vRNL5K3oE7hAH/zJihCuJ7heWgATsyMRqRCBQz2HoJ89wfqerniJZ/jTi17NLgqlwMDhODTA4Nv89A6b3SQ8FtA6jc+T/KRILO90AZAK04n4rUKgaHCQ11lo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:06:21.2364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67571d5-bb67-439c-2068-08de653d77fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2D96878B0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:06:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19466

TAD5212 now uses a dedicated driver instead of the PCM6240 driver,
making the firmware files no longer needed. So remove the recipe and
corresponding changes.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf       |  2 +-
 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb  | 17 -----------------
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc     |  1 -
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index 4b77656d..d19d4790 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -17,4 +17,4 @@ FIT_CONF_DEFAULT_DTB =3D "k3-am62d2-evm.dtb"
=20
 UBOOT_MACHINE =3D "am62dx_evm_a53_defconfig"
=20
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw ti-adc-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-adc-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb b/meta-ti-bsp/r=
ecipes-bsp/ti-dac-fw/ti-dac-fw.bb
deleted file mode 100644
index 8f68009d..00000000
--- a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION =3D "TI DAC TAD5212 config prebuild binary firmware"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV =3D "${TAD5212_FW_VERSION}"
-PR =3D "${INC_PR}.0"
-
-COMPATIBLE_MACHINE =3D "am62dxx"
-
-TAD5212_1DEV =3D "tad5212_01.bin"
-TAD5212_4DEV =3D "tad5212_04.bin"
-
-do_install() {
-	install -d ${D}${nonarch_base_libdir}/firmware
-	install -m 0644 ${S}/ti/tad5212/${TAD5212_1DEV} ${D}${nonarch_base_libdir=
}/firmware/
-	install -m 0644 ${S}/ti/tad5212/${TAD5212_4DEV} ${D}${nonarch_base_libdir=
}/firmware/
-}
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index ecd4e350..d01e3f07 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -17,7 +17,6 @@ CNM_WAVE521_FW_VERSION =3D "1.0.8"
 TI_DM_FW_VERSION =3D "11.02.07"
 TI_SYSFW_VERSION =3D "11.02.05"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
-TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
--=20
2.34.1


