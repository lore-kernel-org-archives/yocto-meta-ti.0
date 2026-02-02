Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBF6E7FDCB
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:52:11 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62055.1770061925692440802
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 11:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uKlRaHrJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.23, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbsWm2pQ3n/5bTnCnqebIeLTX0ALIMm9rKs1KzCY/Q+oYFXorQ5wrFmZWuJsDExotYpxhh5BJgZp4a2UAuAngxCtESZpn1RQGjx0QIvXaSbwH7whA3BrcLLnAF2AATGOybTocUllvZtY98Oi8ibqZCTk2+IZ9NFDYM+aBiD6Y6ZLZhuDMBE9mefGhhaeWm6dS6KXD7YHzMUm/88+OMeRFxFU4r2nsFWWvj+Q8iXyD5oQxGep5PVDErsv7MYdXAgBQPaSi0asnJ6ToR5kMhkwgB+a9Kj/R8uI+b5cZQyL2zQUmCrGsKXnwkF5zdKiwDrZqO9ZHRV+kkHJB+pTyzT91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjXzZJnNWDD6YNOLOdvw+lG05eXmtIzBDyzWnR8xS68=;
 b=RWq2fwzCFFsJDASIdAxXdTcRpeV/XJy1efCSYDbP6KqCUSyEoyteWS7n/vexfQ9T4kgByly6XWN4NGUWZ4OrT7hJUNuWIEgboPKG4GifONgjtdm4f+57RCunQThdteEP/I3+L6XhtuK/FMQCf/GyA4Jk8p6geW32RUbhfBv0hsZVoFFOWgA81PYoLKXldcg/H3ME19QnS98YVO1biPyDYqIJZqSTLW+SmMLsJ904wr+NTUIPs6TEtpDYC/q+IhsOd5R8N2y9fT41iNB50NxAm7oic+RNlDfWI1YCNhUuXW0vU7/slruIXk5rdlsoskQ3qmOn1qmWLrc2YZPEN2td4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjXzZJnNWDD6YNOLOdvw+lG05eXmtIzBDyzWnR8xS68=;
 b=uKlRaHrJVwKOARxXLjGGyUYZUzIDX8pKtWq2S5Rnb7GOVamTwYTCaWOVyxUM1OHssZJ8XPRTvqtasokZTpX8ueOFNdzRsvZNzF06LWZcsUpDs7CImSS9pZHOKyLkwT3Bbw2ScBkm/delQuOAjje9lIba+hz0d7Bhvte8lyEz9eY=
Received: from SA1P222CA0118.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::6)
 by SJ0PR10MB4767.namprd10.prod.outlook.com (2603:10b6:a03:2d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:52:01 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::86) by SA1P222CA0118.outlook.office365.com
 (2603:10b6:806:3c5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 19:52:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:52:00 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:51:59 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:51:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 13:51:59 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612Jpx912711105;
	Mon, 2 Feb 2026 13:51:59 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vmzxn-000000081Yo-08Ix;
	Mon, 02 Feb 2026 13:51:59 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/2] conf: am62p: Add ECDSA key signing
Date: Mon, 2 Feb 2026 13:51:58 -0600
Message-ID: <20260202195158.1912610-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202195158.1912610-1-reatmon@ti.com>
References: <20260202195158.1912610-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|SJ0PR10MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a134248-953d-4347-08c2-08de62948799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xT84J9fMTAYkI85JNSH4ObBXcGhYK6spzi+aQ7ndRyuKN/FGySJRURDYNj14?=
 =?us-ascii?Q?QENtykP8113G0xMGWD1TVbY5M3c/YfoR1xFP+/ghW39xS+mniwDl/waBleMH?=
 =?us-ascii?Q?eYMpNna089v0f9E2leXc69sChUdFoGE7hugO97javxYHqqrEl8AxKnqFumDK?=
 =?us-ascii?Q?ysYNcCLJ9ApnRoQhlOPEO7Lx7BmxddC/QCzs9qR0kZS3SyYYr1aHB5+0rg3w?=
 =?us-ascii?Q?xvcM4tUWGKiFYj0d8QhqELy34vNs45K2UQ/LmuIwVaxuFNAkzO36F9ujV3HN?=
 =?us-ascii?Q?yzc+rdixSbaAOZUTAnQwIjcHMbcdSQ9ieBn2qZC5PYBxyQAvQA/i+LZI4yQB?=
 =?us-ascii?Q?Z+x4HesiRtBUiIy+Glr5p5g0x/1Kja8aNEYUstGIebgJsZPiAbtAmUIQKO1X?=
 =?us-ascii?Q?/3sek6RtVlPgEnJAngP4eL8Djn5X7Ngithbym4dvINdtQEd7eWDi+LXtVyiA?=
 =?us-ascii?Q?GRAPyQAM6sgF6sWeQPAq1yQv47lZdxtq3O0Cw1H+RFxtcPGNdTbeg8XUGDk0?=
 =?us-ascii?Q?lXOgy6rmL6EIJ6biIqPIUSsf+NUild1eJHE2QHxRecSpBBH74WiNNsyBWx4r?=
 =?us-ascii?Q?avPpqs0Jyvs6VB9eVNPsfC7+7lXV5JHD4LxWTDIHmjOtX03QJz/aBznWYfwL?=
 =?us-ascii?Q?73CBQUIzkA7UVlog9xzsabtGShDDPKDjIbmBiiM3vbBWlodluEa+TPtyL/xs?=
 =?us-ascii?Q?H3IGCBYcenhtegfYn879NpXMY6u1vFtrthyiISAjbRQbmM21qKezCbrZZl0Z?=
 =?us-ascii?Q?luyeA7n4D7LhkTfVWkaKe2IFYDshhjNA8phqNi6VnC75Tu/OpNcjxs2QnyEe?=
 =?us-ascii?Q?V/TNnXZuWCc1yXgLnveGPIG0LyD8Hs65ZagM4w5VRHA6HP6znBU/VsaalWb8?=
 =?us-ascii?Q?gb9ByHegpEEUblAe9OO0NKcKEhggu3eb7YloNbTeG1L/eEDdrXDkhtZbs7Hb?=
 =?us-ascii?Q?iuxiElYHqtIg6juFm7ZgeZQDLYtD4L+rN1KGczz2ThVn0SFJpy8giBnaq+xk?=
 =?us-ascii?Q?pi++h5T4hF9rbSPY2OvG5UERdbN1oZgAaMdrKckP1eBM5f+3p4K5sDSJ4mYY?=
 =?us-ascii?Q?cT9WrjorYs9ZMnVi93YkvaE3UbSPgRrzpA499waXfMGlg5aJUb8a6ptmZZL7?=
 =?us-ascii?Q?/q6tc2KBlVcjRFw3i9y4mxMUsfaq3xMODlscXSFbvDsakhZAfaah2fdjVzlh?=
 =?us-ascii?Q?xhf7qGzWHlARgvxfiDPCvDNdLxrnKrd/7mOGKFzIREZ7UIQLhQsmdoRQC3nh?=
 =?us-ascii?Q?DKKbtH+2fesIXzmO56kR7Ws33lKYxLtC0sr53dE/wnzde/ak1R3+Pbzytfme?=
 =?us-ascii?Q?magAR+1CvarF8jrnp5boEZ3jbmHTP5VRAoWGBrybxDXuoCG9MJ09UOrawXRH?=
 =?us-ascii?Q?5PxRGttkr7MkEocYIbncp+B2+shc/A6R5+ESrqAJdb6UUC8rGUNvTilu5qaY?=
 =?us-ascii?Q?U3Gia9Spv/yuDrw6KwotGw79xFD6pxXjHiOCjf440EJD0ront3LIpr6PxQMj?=
 =?us-ascii?Q?YHQYOWPEXPU8W7yZ3fw7Dl8UjhgnoCMJXpWQTRv+TyzfCmzK7T+V+kMyZyHD?=
 =?us-ascii?Q?xnzhGSJh/xlqCT74SQ6VikiQ2DpueNQXXnoUhldJwa1EZaRklc6k/WzBt2t1?=
 =?us-ascii?Q?rK+95of8No49BPW/UEyPoVOVSrjj/zXl+8AmsuPLyDpA/rjftDtVIJxyhyS2?=
 =?us-ascii?Q?dup9DA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vk8fhFxP6Cw3TZHQvLgHggiqWiHCxPARyrXWUdw7KBIGjQ2opT0uTdoeWoo6SlLWnCAks3oO7LbqOH4xBwmckyR+TbXGxpF3jsaD9H+RlgOeglSGg0lp39qsgQQgnMzS1H2ciKpsLjfwIawKgs6qovzA2yyJRS1/PZQdJEob0WDdHqw4t0XVuzM/NVdyy6OnzaXYXUmpZEysWr3G0xjFtpeg8PSC5UdhRPvgBfWqZAXIYzHFjWAFdZYlIgS1mG/PPEvNJGTFXrTf11DRF+R9tTJDi97N8rfYGnYMRgfKOqZZvJkI+kiJ7WXUxsbUKvDgz6OEB9AJ7cXlZ4BTiOCO3j5LmoEnuP2CbYtpeFTLflF+wOMC2uS6LPo2JpjZ7mkzfZd0ymho3e5iAWRZfAlR/McFeD6bQrwsfpUNw4gYp7yxirY9IkP8gr5d7NVUNJYH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:52:00.2056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a134248-953d-4347-08c2-08de62948799
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 19:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19456

Use the new framework to add alternative key signing for the am62p
platform as an example.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../conf/machine/am62pxx-evm-k3r5.conf        | 15 +++++++++++----
 meta-ti-bsp/conf/machine/am62pxx-evm.conf     | 19 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62pxx-evm-k3r5.conf
index bf82849a..292b658b 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -4,15 +4,22 @@
=20
 require conf/machine/include/k3r5.inc
=20
-UBOOT_MACHINE =3D "am62px_evm_r5_defconfig"
-UBOOT_MACHINE:tie-test-builds =3D ""
+UBOOT_MACHINE =3D ""
=20
-UBOOT_CONFIG =3D ""
-UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
+UBOOT_ECDSA_SIGN_CONFIG ?=3D "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline =3D ""
+
+UBOOT_CONFIG =3D "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG:prepend:tie-test-builds =3D "usbdfu "
=20
 UBOOT_CONFIG[main] =3D "am62px_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] =3D "am62px_evm_r5_defconfig"
 UBOOT_CONFIG[usbdfu] =3D "am62px_evm_r5_defconfig"
=20
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] =3D "${TI_SIGN_WITH_ECDSA_KEY}"
+
 UBOOT_CONFIG_FRAGMENTS[usbdfu] =3D "am62x_r5_usbdfu.config"
=20
 UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62pxx-evm.conf
index 4bebe510..bc056e6b 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -23,7 +23,24 @@ KERNEL_DEVICETREE =3D " \
=20
 FIT_CONF_DEFAULT_DTB =3D "k3-am62p5-sk.dtb"
=20
-UBOOT_MACHINE =3D "am62px_evm_a53_defconfig"
+UBOOT_ECDSA_SIGN_CONFIG ?=3D "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline =3D ""
+
+ECDSA_BOOT_FILES ?=3D "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin=
-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_6 =3D ""
+ECDSA_BOOT_FILES:bsp-next =3D ""
+ECDSA_BOOT_FILES:bsp-mainline =3D ""
+
+UBOOT_MACHINE =3D ""
+UBOOT_CONFIG =3D "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG[main] =3D "am62px_evm_a53_defconfig"
+UBOOT_CONFIG[ecdsa] =3D "am62px_evm_a53_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] =3D "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES +=3D "${ECDSA_BOOT_FILES}"
=20
 # UBOOT_FRAGMENTS holds the list of u-boot config fragments which has to b=
e build
 # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-m=
ergeconfig.inc
--=20
2.43.0


