Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354E9D26293
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:15:49 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14413.1768936547953607197
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 11:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=jE14FXZC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.38, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/AiPn8/po8BkaVYLLHJCP3VbNP/De5mJOOrDYLQq/VjnLr4WqwisIS4wtqmHtA7JepsNx04geTUDvNxuvT4AjDe02qSPiAw3B/TCIJUPnOTpz+xp9L+CsDjsKqfivb6bRXFx4msTtJPxvJl8rYsjOIpMiHhktGZukVtDciPFBFTUfPtFEuany4matIEeX3iTAt5MSVu/bxMY4cZP02nKayjgu2I3NcSYRVc6WyjcZlG9xKzd3496Lv10/OJ4UfYPctmsYU9DbssoASsrZJ2oNrYmOLk7zjHbOZYg1SLG1anjT1xk9EUONzqR4mH5U7OLN3LJ2w8wIYEAPSnmQHp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E60fuvyNvSNp3Mk8s/OSet94VfU2wjri256wgV2/uPs=;
 b=VJw3klvad+M71htdOWg83HzcqSTVe3TiiUBNHyckRGSj2smBGCaLvIaHelmepaJQFNqPvigfY9yCrbhajg6vLvtIeiGqoeitzdlw0tJxSJk0WDI58kNawNrgNskHFOccTHmRXWrnAE/kNTss66dXA8IRwiGQNxaOxOtfF4qeG7lWGUeAXQXBfIDm5LEJdKKXl/JLqJZUsPxs9A9YcKs5Rz+Nk+MBMRNuLXXuIj3SYglQeKgCnv9WgD2Jsgl2XO5E9uKbItTdGH1Hx9DaDVzFUU/jTZvdTpE3r79HI95/Rn30uNNQZpwTfbFhKxAEd5bq9fBR+CZggwH46nVqK7mB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E60fuvyNvSNp3Mk8s/OSet94VfU2wjri256wgV2/uPs=;
 b=jE14FXZCIQ/4ysyHr5WlsVoNebXPUG498NwjGg+B/UBq78HLiHHnSAxnaHPeGF+mhmPuZRd1bO7bL+OBPv0VSwJ/MPgTzPvRQ+ZlVA8QU4Kaz5h7gtCq32T6FeB35ra0ACHoqFq7wOGz7DlvFtPaTH7reIKveYDchfTcs/IFAHY=
Received: from SN7PR04CA0027.namprd04.prod.outlook.com (2603:10b6:806:f2::32)
 by SJ1PR10MB5954.namprd10.prod.outlook.com (2603:10b6:a03:48b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 19:15:44 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::4a) by SN7PR04CA0027.outlook.office365.com
 (2603:10b6:806:f2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 19:15:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 19:15:43 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:15:42 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:15:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 13:15:42 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KJFgwr1577707;
	Tue, 20 Jan 2026 13:15:42 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1viHCY-00000009I4T-0AYK;
	Tue, 20 Jan 2026 13:15:42 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Adapt to upstream change to UBOOT_CONFIG flow
Date: Tue, 20 Jan 2026 13:15:41 -0600
Message-ID: <20260120191542.2214409-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|SJ1PR10MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 5744892e-a8f7-4cb6-a6c2-08de58584e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BPzScPfIePNpFy1fBPk1M0WEBhBjgKJUx8HdAWW5ws1XojOcrUD4PD98fDNc?=
 =?us-ascii?Q?anlK3bVR8jLScNrre5zrxSPqllYv5GiWb+3t4By4PadNWYESEATiHmEgLIuj?=
 =?us-ascii?Q?LuDf/5xsBBawafYsRRRHhqn1U4m8H1fliYh7dmzPahIpq9AvOil50HHuri3E?=
 =?us-ascii?Q?VcrUeWBlhI6iKnSoKwu/oY1MOe13junCjnTM0/B/dcKR9aTNb31xkVoSIdy/?=
 =?us-ascii?Q?1+TiMp7ks1FozyCD8AfuQTU61WgxVofhSn0OrM/6xrJhWQMFQGyb70B6ryKd?=
 =?us-ascii?Q?fB8VLbGvehEcg7tKjlQ4oFWji59+5HYPZsdGwPCbzz6/rfW7+mmyzOe0hA+c?=
 =?us-ascii?Q?ajhQykPvHH/4VuT6TEf/aL0VjCftS+XmgtMU79d3WD4SBmQOg5e8tg1jwF/D?=
 =?us-ascii?Q?MpAaLX/zfZYXPvqQ9nC/gatC18omFRxL75lHE90cy2fC7UMpLPpZV0QlRfdl?=
 =?us-ascii?Q?ujmRzbjh2Giu+QMDHg9A7YXdGqMaU5lXCOUwXrOP+nUJfLtO5BeC9NLKy046?=
 =?us-ascii?Q?5CxpwsIxlolTyAkEw5NKI67do11YRfrgAEK6Rj/lz241K+CA1MsB6vxT4wDR?=
 =?us-ascii?Q?PFdw8bNVs8m0DtRKyrDuqGXa1yVCJ637I41P9lUR5BN2V5gSsKRTbDPQFq+n?=
 =?us-ascii?Q?IbO52tw3CJxZT4ketF81h6PFF35tOOC0m8nxZoFzvYYc5HUJbpXHMnaF1yFR?=
 =?us-ascii?Q?rT39NieqrJ5z2MEpSLGCKUoNC6ZdPELTI1AK+I8TPH6pJk7MaluLHv/iD3wb?=
 =?us-ascii?Q?i6tq3dkAxiW1SHKRxToo0cclhQGjBUCAWepoI2Z30MGElB8Uj04fcnKVdzHC?=
 =?us-ascii?Q?VSSsAAZh/A9NCVOxKwBXx/xIQVMqhpVJ8t3B5y9CVCu5/o/5TeFPsmN9pyTu?=
 =?us-ascii?Q?lvfpLdVz5ktvVNjoh1Z/rcJ17LsUrPMVogzlM0KxVSxajxDo3LzSRYgnmB8Q?=
 =?us-ascii?Q?WofZKcV/SfXh2jIiNsrW7xacuzxBBiGka6j2jUdrI1Ecp4lz+dZVRT4m4Pad?=
 =?us-ascii?Q?fQWw3lBBYE0sFTRs9HFXX/Fx69YsQVKHzr/zb3TBVM4HWmto9ARJ9t1dYkG+?=
 =?us-ascii?Q?D04PM150yEdBTkb+Gbg7yqVMB8A87fDgR8cQHydY2eAEn8ja4ykniP09g8Lg?=
 =?us-ascii?Q?Ls0gqqOO05NPvi0gCbP+z6NHnVO+ZrYfX6nJdscvrD6zUcLEzdtBCPBAvBUR?=
 =?us-ascii?Q?xSXMffu789l8dv6NDURdMzvuRymQb13rN+IMIZj5QtlZZWJ64j7CNvKIQHhA?=
 =?us-ascii?Q?dQBG466B4OaAbsRTJIkBD02At3sdRhz8owlpBY1YIffyM9gb3UY98iJK+EvC?=
 =?us-ascii?Q?voOu8jE5lmxw7CHosgzJpJSq53Kj7Ja+y+IMayFqnVIDucgH0HiCZNVoislg?=
 =?us-ascii?Q?N1bzDEewK7N9RHH5PBYLP7yTAz6DVT22M0sN1PkLk0cqnxNpV8Ysnpx3KwSU?=
 =?us-ascii?Q?rAaV9pl2Vk6qxf5mzEyhWhsPKWMRWg3xoJNyAxovLAF1KgzaCcw6x7rb6x6i?=
 =?us-ascii?Q?VSl0MaBhuTMEEZgvxTXXKfT/ogACe+WJXNSCkTrKEFbmrScnJXAav7tgnXwH?=
 =?us-ascii?Q?EjL19gZLbHMzC8rIThZ29XxJHU2+xUeWbmcHu9129J3TenTIHj1jgQiu8coC?=
 =?us-ascii?Q?e7cPHAdh9NiLXbYrHh/iYiIcchxo0NRtMsvbROobHyZmjwnST4VPRYnm0N5a?=
 =?us-ascii?Q?7uRR5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 19:15:43.0107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5744892e-a8f7-4cb6-a6c2-08de58584e84
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5954
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jan 2026 19:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19429

A recent change to the UBOOT_CONFIG flow in oe-core [1], introduced
support for UBOOT_FRAGMENTS.  We need to stop using our internal
UBOOT_CONFIG_FRAGMENTS and start using the new UBOOT_FRAGMENTS.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Dcd9e7304481=
b24b27df61c03ad73496d18e4d47c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf        | 2 +-
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf        | 2 +-
 meta-ti-bsp/conf/machine/am62pxx-evm.conf             | 4 ++--
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf         | 2 +-
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf      | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 -------
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          | 1 -
 7 files changed, 6 insertions(+), 14 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62axx-evm-k3r5.conf
index e02e10ed..30c7ea7e 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -6,4 +6,4 @@ require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62ax_evm_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
+UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62pxx-evm-k3r5.conf
index 44744c46..27cc7c40 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -6,4 +6,4 @@ require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62px_evm_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
+UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62pxx-evm.conf
index fd5f269a..4bebe510 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -25,9 +25,9 @@ FIT_CONF_DEFAULT_DTB =3D "k3-am62p5-sk.dtb"
=20
 UBOOT_MACHINE =3D "am62px_evm_a53_defconfig"
=20
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which h=
as to be build
+# UBOOT_FRAGMENTS holds the list of u-boot config fragments which has to b=
e build
 # along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-m=
ergeconfig.inc
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_spl=
ashscreen.config fragment present in ti-u-boot tree
-UBOOT_CONFIG_FRAGMENTS =3D "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABL=
E', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+UBOOT_FRAGMENTS =3D "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1'=
, 'am62x_evm_prune_splashscreen.config', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am62xx-evm-k3r5.conf
index 1665f586..e8d7fd05 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -6,4 +6,4 @@ require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
+UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp=
/conf/machine/am62xx-lp-evm-k3r5.conf
index 8319ae19..8ae4af36 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -6,4 +6,4 @@ require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
=20
-UBOOT_CONFIG_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
+UBOOT_FRAGMENTS:ti-falcon =3D "k3_r5_falcon.config"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
deleted file mode 100644
index c7ce5047..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-do_configure:append () {
-   if [ -n "${UBOOT_CONFIG_FRAGMENTS}" ] && [ -n "${UBOOT_MACHINE}" ]
-   then
-       oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMEN=
TS}
-       oe_runmake -C ${S} O=3D${B} olddefconfig
-   fi
-}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index 9801ffbe..97a895b0 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -7,7 +7,6 @@ do_compile:prepend () {
=20
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-require u-boot-mergeconfig.inc
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
=20
--=20
2.43.0


