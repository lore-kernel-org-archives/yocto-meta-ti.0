Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC913D1BDDB
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 20:32:29 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25948.1764793940950702875
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 12:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HL/8qZTZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.31, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcIQ4HeMos8JHEXDD94XDt8apUv93RKoi5pQe8sRikUen9/qfoyndyFkURML4DNkcoPPklvuISktCzY3OQC+uPeASFm+BDROqBRSZArzSoyQ1G1s3w+3O9XXXKebuM3oqQsb6ruqFABLY6UA+ePVdHjmnAVcBXXZp+Vya1jBPQNF391yVq0Ou5Rz/fz02ACGirEngGx48R4qRKa+Lh2N90SI43oxtnJMfpU+WTslA6+isIF8HTTz8suCklYbQwCNyZTKDaUT1Y6AbEPrpUN2/Q/L+LvoAui8BgoSEHc9FP+w7tL2q3TSX8w34M9LXxrjBHuzprSH74ooiIF7ZF1IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWN55g1GwQsv9Lhd2vj0XJRoralLBu0NOLMIurDpq7I=;
 b=RfpbCvCHUfsYAYIeXANvXgDwYwRfekRsH49q5HxF069cyZhKj/SuxnXwJj4nrWnyVjqEtusHl+Svq+tZxL7hhtS8hIT8WKS/+yYzNwrMQEQnAX2pPM2vYppSlfDeU06/f2Oc0cuhLtmcPS7AZWRJq06oHcKgMHtAhOm73BZh/eLzBa/vlYZljVWUE96xr1bhfpq/CEIL10+zloD7Wc88VRRoiVYyqEM4HATYRMPJVmvEv6wNIWOlKhjeNdPCnCWKXbchu0dO9X8lK5GUlv1dHxEexrmIxyLwxYYsUjJDV+8kJTVzboSpBLFUDYrLxtIigQz0j+8QJqDIbo9S+hME3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWN55g1GwQsv9Lhd2vj0XJRoralLBu0NOLMIurDpq7I=;
 b=HL/8qZTZZuoXinZjps6b0ahLccpQecvtS5vHCRXqN7l7fhCKE7ZVAhIBx82YaRDRCmu9kqZdLLzkb6LyH7ZAKGfgH70bqIjYJzwRQPaOnYwAhySD6WlbNcU3kPhGqiNPPlVsARZFEU5QdZY5pXJJneUbXnZFr1BdpO+gnK3v784=
Received: from BYAPR01CA0061.prod.exchangelabs.com (2603:10b6:a03:94::38) by
 SJ0PR10MB5614.namprd10.prod.outlook.com (2603:10b6:a03:3d7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 20:32:17 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::7b) by BYAPR01CA0061.outlook.office365.com
 (2603:10b6:a03:94::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 20:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 20:32:16 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 14:32:14 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 14:32:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 14:32:13 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3KWDe7396911;
	Wed, 3 Dec 2025 14:32:13 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/2] meta-ti/all: Merge omap-a15.inc into am57xx.inc
Date: Wed, 3 Dec 2025 14:32:11 -0600
Message-ID: <20251203203211.1113327-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251203203211.1113327-1-afd@ti.com>
References: <20251203203211.1113327-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|SJ0PR10MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: 35aacbe0-e2ee-4e95-235c-08de32ab0c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u2KPHtnls7ysazULcKJbVQ5liMhB282ip5ITMBTV6Y+ryS6OrBzEj22j00Wd?=
 =?us-ascii?Q?QyZcNZDyC8fr/8AeodFFdbp5qEi8JjGk7BAcr4OITj3qWkvF7AxLTLASpPvI?=
 =?us-ascii?Q?XBHBiYcA1DRM0FC/eWcf70ripefRu//ELyf+FeZ1uKSPSQ+UVT66F2If2kbN?=
 =?us-ascii?Q?1YlGVilxiFGjCRY5G27ArpqltJjtG2PvN7s1It8nGjRaD5CqbnTwSK1dMMGm?=
 =?us-ascii?Q?X6SqWlAmOc7sKxw3bWuguKnKP8CzfV3TNfJn20Q6NUXqlM7JBou4ZeF+rYmg?=
 =?us-ascii?Q?wxl9dWwdmLjaHLsuZfyuuV1odpA7Gm0Cceh8ZY9Jkebv/tX61Q+p/dEG+NN+?=
 =?us-ascii?Q?tZ55UXYQtih7pgtsxl2VDCTx5JXnZoRWBBU+f61lSKpHLMaqWaHY+79SusYN?=
 =?us-ascii?Q?BogvIPhDu1P/KMTAZzbY0vencqphoHdKXxqZ5edyFjWULFhXP6Wls2PhPnbU?=
 =?us-ascii?Q?lOF9yqQX77tYSmH9OfAamrkV/WXWgeqge8swSvqKkzgbAeBXHWf82qmMTRS6?=
 =?us-ascii?Q?aKjmMdZnBD/RuwPYcSIRNjzWuKvOBO99bdgb4fnJ322BM96vToO7obu2I/zq?=
 =?us-ascii?Q?uXGySnZJBYVsip2qXNOZqBXrH2Zqw+CZksTqmoA0JyGOxgc0hXh59bOO0O+T?=
 =?us-ascii?Q?QQcMCGqXBbyiCTkc7RST0zRB4aHXUSkgKFZsbfveDHJ8ke1sipPizpEUTBWS?=
 =?us-ascii?Q?WH7pCg2u/TdCATwwQgfl/L0hsAzHoNsqBI01TgU08s4oGs02KJ9FogHgQwP9?=
 =?us-ascii?Q?0fgUQLmO6zK+HoqJGShxvUKs9v290OAgTe1UgEFUEDHrw7f2Bzqc4q2apNAG?=
 =?us-ascii?Q?fy5jWIm4V8BbZcLR4BeLPo1PUOuQBpONks6UMBDEAoHM4V/f6Z+i8V0SsuP2?=
 =?us-ascii?Q?/MD6GL9KLlVPrbnQHDmYPWXHqTdLq71t4CxggaEj3QrMcQrC5mW/3kgWtFGi?=
 =?us-ascii?Q?+iKVHRrVmyONiUFtYp9BRsCASJQ5eIlOAd7B2lfR5fUK9/h9fCFR/xyV1V7I?=
 =?us-ascii?Q?gpCFvRCduNJMu+8pXNgRBNS0kjcdpmfR0gdOt5IkbEAylKSku8rXEOKbFAmJ?=
 =?us-ascii?Q?ZoUCNSJGknYmIHTn71wVVv010PYBeGgtc3mLx0AupQAjGRgigFajIMMRkS09?=
 =?us-ascii?Q?cTxHXAVvMLemxZeNrg8JNksJPGBI0chsRl8nqQ1tm8oY3aFrXEpaHp/H07km?=
 =?us-ascii?Q?PNzt6VfRB0w351mDZHMPetsF4avozEDgzn5wL79VFXqkiZWgBY/t51+d6cee?=
 =?us-ascii?Q?mAFbWDOhqGbNuWmCi2dWwOSrE4XOHX2mL164rpZ5yjzf5Alwdyiwk4ACgNTq?=
 =?us-ascii?Q?vDtlgxdhY2m1cJ28vO7rokqJBiemhr7zwusb/W1iMRLNXK6ZK7LhW8DDtcJH?=
 =?us-ascii?Q?0eOS9YxGP1KvtxtkfjFPdICGbzFqPQbWEb8uw43UQ/u1eZZSF58GzXWqpdDc?=
 =?us-ascii?Q?pvWLw78/m/6Ls1jtyi/3KUAjIPwzz6fXXx2d5AEYDSA+iBPMVzsTBSECszGb?=
 =?us-ascii?Q?U6+xnc4MpVAHONIEfsuBBsr3rOyLXZgVtYTrbGgynU/eqhNkyzO73DnTMvPZ?=
 =?us-ascii?Q?RU9VBipXLpvQPdgrADw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:32:16.1097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aacbe0-e2ee-4e95-235c-08de32ab0c68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5614
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 20:32:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19327

As am57xx.inc is now the only user of omap-a15.inc, merge the content of
omap-a15.inc into am57xx.inc and remove omap-a15.inc. As we no longer have
this common include, also remove "omap-a15" and use "am57xx" in its place.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am57xx.inc   | 50 +++++++++++++++++--
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 50 -------------------
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  4 +-
 .../libgal/ti-gc320-libs_5.0.11.p7.bb         |  2 +-
 .../ti-sgx-ddk-um_1.17.4948957.bb             |  4 +-
 .../dsptop/debugss-module-drv_git.bb          |  2 +-
 .../recipes-bsp/dsptop/dsptop_git.bb          |  2 +-
 .../recipes-bsp/dsptop/libulm_git.bb          |  2 +-
 .../recipes-bsp/pru/pru-icss_git.bb           |  8 +--
 .../recipes-devtools/gdbc6x/gdbc6x_git.bb     |  2 +-
 .../gdbc6x/gdbserver-c6x_git.bb               |  2 +-
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  2 +-
 .../recipes-ti/imglib/imglib-c66x.inc         |  2 +-
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc |  8 +--
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 10 ++--
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc  |  2 +-
 16 files changed, 73 insertions(+), 79 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/omap-a15.inc

diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf=
/machine/include/am57xx.inc
index c7c8029f..6acc0cb0 100644
--- a/meta-ti-bsp/conf/machine/include/am57xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
@@ -1,6 +1,50 @@
-require conf/machine/include/omap-a15.inc
+require conf/machine/include/ti-soc.inc
 SOC_FAMILY:append =3D ":am57xx"
=20
-MACHINE_FEATURES +=3D "pci"
+DEFAULTTUNE ?=3D "armv7athf-neon"
+require conf/machine/include/arm/armv7a/tune-cortexa15.inc
=20
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw prusw-fw pruhsr-fw pru=
prp-fw"
+require conf/machine/include/ti-bsp.inc
+
+# Graphics providers and variables
+require conf/machine/include/mesa-pvr.inc
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_SGX_DRIVER_PROVIDER}"
+
+KERNEL_IMAGETYPE =3D "zImage"
+KERNEL_IMAGETYPES =3D "zImage uImage"
+KERNEL_CLASSES +=3D "kernel-uimage"
+
+UBOOT_ARCH =3D "arm"
+UBOOT_ENTRYPOINT =3D "0x80008000"
+UBOOT_LOADADDRESS =3D "0x80008000"
+
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX =3D "1"
+UBOOT_EXTLINUX_ROOT =3D "root=3DPARTUUID=3D${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES =3D " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${DEVICETREE_FILES} \
+"
+
+SPL_BINARY =3D "MLO"
+UBOOT_SUFFIX =3D "img"
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
+
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "vpdma-fw goodix-fw prueth-fw pru=
sw-fw pruhsr-fw pruprp-fw"
+
+# Use the expected value of the ubifs filesystem's volume name in the kern=
el
+# and u-boot.
+UBI_VOLNAME =3D "rootfs"
+
+# List common SoC features, may need to add touchscreen for specific machi=
nes
+MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 screen alsa mmip dsp=
 gc320 pci"
+
+IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
+WKS_FILE ?=3D "sdimage-2part.wks"
+IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
+do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
+do_image_wic[depends] +=3D "ti-rtos-messageq-test-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/co=
nf/machine/include/omap-a15.inc
deleted file mode 100644
index 8e029431..00000000
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append =3D ":omap-a15"
-
-DEFAULTTUNE ?=3D "armv7athf-neon"
-require conf/machine/include/arm/armv7a/tune-cortexa15.inc
-
-require conf/machine/include/ti-bsp.inc
-
-# Graphics providers and variables
-require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_SGX_DRIVER_PROVIDER}"
-
-KERNEL_IMAGETYPE =3D "zImage"
-KERNEL_IMAGETYPES =3D "zImage uImage"
-KERNEL_CLASSES +=3D "kernel-uimage"
-
-UBOOT_ARCH =3D "arm"
-UBOOT_ENTRYPOINT =3D "0x80008000"
-UBOOT_LOADADDRESS =3D "0x80008000"
-
-# Generate an extlinux.conf file
-UBOOT_EXTLINUX =3D "1"
-UBOOT_EXTLINUX_ROOT =3D "root=3DPARTUUID=3D${uuid}"
-UBOOT_EXTLINUX_BOOT_FILES =3D " \
-    extlinux.conf;extlinux/extlinux.conf \
-    ${KERNEL_IMAGETYPE} \
-    ${DEVICETREE_FILES} \
-"
-
-SPL_BINARY =3D "MLO"
-UBOOT_SUFFIX =3D "img"
-
-EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
-
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image-zimage"
-
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "vpdma-fw goodix-fw"
-
-# Use the expected value of the ubifs filesystem's volume name in the kern=
el
-# and u-boot.
-UBI_VOLNAME =3D "rootfs"
-
-# List common SoC features, may need to add touchscreen for specific machi=
nes
-MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 screen alsa mmip dsp=
 gc320"
-
-IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
-WKS_FILE ?=3D "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
-do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
-do_image_wic[depends] +=3D "ti-rtos-messageq-test-fw:do_deploy"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.494=
8957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.494895=
7.bb
index f5cea270..343f09de 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx|am65xx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -19,9 +19,9 @@ SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-ddk-=
linux.git;protocol=3Dhttps;
=20
 SRCREV =3D "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
=20
-TARGET_PRODUCT:omap-a15 =3D "ti572x_linux"
 TARGET_PRODUCT:ti33x =3D "ti335x_linux"
 TARGET_PRODUCT:ti43x =3D "ti437x_linux"
+TARGET_PRODUCT:am57xx =3D "ti572x_linux"
 TARGET_PRODUCT:am65xx =3D "ti654x_linux"
 PVR_BUILD =3D "release"
 PVR_WS =3D "lws-generic"
diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb=
 b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index bd7cf015..86aa71b8 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -7,7 +7,7 @@ inherit features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gc320"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 CLEANBROKEN =3D "1"
=20
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17=
.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.1=
7.4948957.bb
index af27981f..c4cc5f10 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.494895=
7.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.494895=
7.bb
@@ -4,7 +4,7 @@ LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e76=
f"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx|am65xx"
=20
 PR =3D "r38"
=20
@@ -37,7 +37,7 @@ inherit ${@pick_init(d)}
=20
 TARGET_PRODUCT:ti33x =3D "ti335x_linux"
 TARGET_PRODUCT:ti43x =3D "ti437x_linux"
-TARGET_PRODUCT:omap-a15 =3D "ti572x_linux"
+TARGET_PRODUCT:am57xx =3D "ti572x_linux"
 TARGET_PRODUCT:am65xx =3D "ti654x_linux"
=20
 RDEPENDS:${PN} +=3D "libdrm ti-sgx-ddk-km"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/=
meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index fdb16ec4..e80591b2 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -8,7 +8,7 @@ S:append =3D "/debugss_module/debugss-mod"
=20
 inherit module
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 EXTRA_OEMAKE =3D "PLATFORM=3DDRA7xx_PLATFORM KVERSION=3D${KERNEL_VERSION} =
KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
=20
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extr=
as/recipes-bsp/dsptop/dsptop_git.bb
index c1080468..c5242d5e 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -8,7 +8,7 @@ PR =3D "${INC_PR}.2"
=20
 S:append =3D "/dsptop"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 EXTRA_OEMAKE =3D "release DEVICE=3DDRA7xx CROSS_COMPILE=3D${TARGET_PREFIX}=
 CC=3D"${CC}""
=20
diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extr=
as/recipes-bsp/dsptop/libulm_git.bb
index 1bcaa0ea..638973c4 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -11,7 +11,7 @@ PR =3D "${INC_PR}.0"
=20
 S:append =3D "/dsptop/ulm"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 EXTRA_OEMAKE =3D "release DEVICE=3DDRA7xx CROSS_COMPILE=3D${TARGET_PREFIX}=
"
=20
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extra=
s/recipes-bsp/pru/pru-icss_git.bb
index 84d00eed..b7066583 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -14,7 +14,7 @@ PV =3D "6.5.0"
=20
 require recipes-ti/includes/ti-paths.inc
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am62xx|am64xx|am65xx|j721e"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx|am62xx|am64xx|am65xx|j721e"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 PACKAGES:prepend =3D " \
@@ -36,7 +36,7 @@ SUBDIRS =3D "examples pru_cape/pru_fw lib/src labs"
=20
 PLATFORM:ti33x =3D "am335x"
 PLATFORM:ti43x =3D "am437x"
-PLATFORM:omap-a15 =3D "am572x"
+PLATFORM:am57xx =3D "am572x"
 PLATFORM:am62xx =3D "am62x"
 PLATFORM:am64xx =3D "am64x"
 PLATFORM:am65xx =3D "am65x"
@@ -84,7 +84,7 @@ do_install:append:ti43x() {
     done
 }
=20
-do_install:append:omap-a15() {
+do_install:append:am57xx() {
     install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
                    ${D}${nonarch_base_libdir}/firmware/pru
     for i in 1 2
@@ -182,7 +182,7 @@ FILES:${PN}-rpmsg-echo =3D "${nonarch_base_libdir}/firm=
ware/pru/PRU_RPMsg_Echo_Int
 # Set up names for the firmwares
 PRU_ICSS_ALTERNATIVES:ti33x    =3D "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES:ti43x    =3D "am437x-pru0_0-fw am437x-pru0_1-fw am43=
7x-pru1_0-fw am437x-pru1_1-fw"
-PRU_ICSS_ALTERNATIVES:omap-a15 =3D "am57xx-pru1_0-fw am57xx-pru1_1-fw am57=
xx-pru2_0-fw am57xx-pru2_1-fw"
+PRU_ICSS_ALTERNATIVES:am57xx   =3D "am57xx-pru1_0-fw am57xx-pru1_1-fw am57=
xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES:am62xx   =3D "am62x-pru0-fw am62x-pru1-fw"
 PRU_ICSS_ALTERNATIVES:am64xx   =3D "am64x-pru0_0-fw am64x-pru0_1-fw am64x-=
pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw a=
m64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES:am65xx   =3D "am65x-pru0_0-fw am65x-pru0_1-fw am65x-=
pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw a=
m65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1=
-fw"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti=
-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 3e6dfbff..521d06fe 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dbf0fe28=
72eb3dfeebb2cbe38206fe81f
=20
 DEPENDS =3D "ncurses bison-native texinfo flex-native gettext"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 PR =3D "${INC_PR}.1"
=20
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/=
meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index a2d8da75..bcb9624f 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -8,7 +8,7 @@ PR =3D "${INC_PR}.0"
=20
 S:append =3D "/gdbserver-c6x/src"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 EXTRA_OEMAKE =3D "PLATFORM=3DDRA7xx_PLATFORM"
=20
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-d=
rv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-dr=
v_git.bb
index 1e4fd6c5..799ba019 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.=
bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.=
bb
@@ -13,7 +13,7 @@ S:append =3D "/kernel_module/gdbproxy-mod"
=20
 inherit module
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 EXTRA_OEMAKE =3D "PLATFORM=3DDRA7xx_PLATFORM KVERSION=3D${KERNEL_VERSION} =
KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
=20
diff --git a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc b/meta-ti-ext=
ras/recipes-ti/imglib/imglib-c66x.inc
index 8fa2ceca..3c5efeb1 100644
--- a/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/imglib/imglib-c66x.inc
@@ -8,7 +8,7 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-unpack.inc
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 SRC_URI =3D "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/imglib/${PV=
}/exports/${BINFILE};name=3Dimglib"
=20
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras=
/recipes-ti/ipc/ti-ipc-rtos.inc
index 2f93db72..0b2ef9f5 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -41,16 +41,16 @@ RELEASE_SUFFIX =3D ""
=20
 PR =3D "${INC_PR}.r0"
=20
-DEPENDS:append:omap-a15 =3D " ti-cgt6x-native \
-                            ti-cgt-arm-native \
-                            gcc-arm-baremetal-native \
+DEPENDS:append:am57xx =3D " ti-cgt6x-native \
+                          ti-cgt-arm-native \
+                          gcc-arm-baremetal-native \
 "
 DEPENDS:append:omapl138 =3D " ti-cgt6x-native \
 "
=20
 IPC_TARGETS =3D ""
=20
-IPC_TARGETS:omap-a15 =3D "\
+IPC_TARGETS:am57xx =3D "\
     gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cg=
t-c6x" \
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-ext=
ras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index d2ac6276..2162a1ac 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -81,11 +81,11 @@ KFPLAT =3D ""
 ALTERNATIVE_PRIORITY =3D "5"
=20
 ALTERNATIVE:${PN}-fw:omapl138 =3D "rproc-dsp-fw"
-ALTERNATIVE:${PN}-fw:omap-a15 =3D "dra7-dsp1-fw.xe66 \
-                                 dra7-dsp2-fw.xe66 \
-                                 dra7-ipu1-fw.xem4 \
-                                 dra7-ipu2-fw.xem4 \
-                                "
+ALTERNATIVE:${PN}-fw:am57xx =3D "dra7-dsp1-fw.xe66 \
+                               dra7-dsp2-fw.xe66 \
+                               dra7-ipu1-fw.xem4 \
+                               dra7-ipu2-fw.xem4 \
+                              "
=20
 ALTERNATIVE_LINK_NAME[rproc-dsp-fw] =3D "${nonarch_base_libdir}/firmware/r=
proc-dsp-fw"
 ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] =3D "${nonarch_base_libdir}/firmw=
are/dra7-dsp1-fw.xe66"
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/=
recipes-ti/vlib/vlib-c66x.inc
index 94c5d33b..c7c14f91 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -7,7 +7,7 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 SRC_URI =3D "http://software-dl.ti.com/libs/vlib/${PV}//exports/vlib_c66x_=
obj_${PV}_Linux.bin;name=3Dvlibbin"
=20
--=20
2.39.2


