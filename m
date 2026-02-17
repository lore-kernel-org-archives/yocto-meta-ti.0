Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C621DE9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 22:21:29 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24194.1771366885510086207
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 14:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iq50m2ng;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.17, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRysQ+gIKYlNIdOSlZQmd4urQHTyQS3myUVwCNA9rT+ZnF7MpDkeVknd5bZ+LKGeWTIVfiHQr8abYB1+MIXlzeRSYVO0WXKIzIGsQBEnIYI6iI9DEr5RXtyR/m26I/sUEVt3VEK+V/fuyQ+HMMwqXUlIzbP0VIW1b3le070RdY6euZauckBnM9AwQzLmamXBUGg+11uyPHZoik4W8kTq7u626y05ZZAxUX5W/+oirN9RPNKn1aM+9B+p869ILq2PyMJMLZyTBMa4MVSbvBzD5xn+vPR20Ahe1Cpcow/NvAIxvf0Jnlc8fAcyZuIq7OWYicqrCHSAz35IR7JoezbpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XllUzJ+59Qew8Fm4RDtAjWXhlErQb9l7LCDDK2epEI=;
 b=KASdobgw3YyqfbYXAAMLQyK5ruFtqMvnq9RAf9qsWQ93Q9RUxEqgSaNX0Qms0fcWZa+/eYovtIrox/nuyzfGR2PDr82uO0gq0C3Tad+QAaKnUcAEhlVavEFaTzSElBHlZwQVLgFEFhHsrMddYxR2JmRiDz08JNoSq3tla1CbDia5s1mteu3cj/ANWbLs3tPYJDFwKUP9Oz7+qZI1J6xVCgkq1WY8XFpMRAc6cwQ+UldnRdhnBageijIxEHdMHefi+htZTqwrD6AobkFUo4jYX5UZFrW5RNSNMon3uq6eHcIb+K/wUkmazG/HX+nXueKbo0MYJwj1B0Fe0ElaXOeOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XllUzJ+59Qew8Fm4RDtAjWXhlErQb9l7LCDDK2epEI=;
 b=iq50m2ngqiYtDMcvTIE4JXt7zXV9Jp8n8ZCs8Om8O7SlIVUnr9R0ENsr3O9Ma3K00HRZ3ZpOTAnyGOjwx8Chou1Gmc5PejE7YlmgfBE/xB3qxT/bMjq5/FZN/mTehDzmfK7NYGlD5b8ZPTRaAphRL/4BzER02a/2+bS2OTwzhb4=
Received: from BN9PR03CA0557.namprd03.prod.outlook.com (2603:10b6:408:138::22)
 by CH3PR10MB6740.namprd10.prod.outlook.com (2603:10b6:610:144::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 22:21:23 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::19) by BN9PR03CA0557.outlook.office365.com
 (2603:10b6:408:138::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 22:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 22:21:22 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:21:22 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:21:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 16:21:21 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HMLLl73567725;
	Tue, 17 Feb 2026 16:21:21 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsTRZ-0000000BQp3-3Alu;
	Tue, 17 Feb 2026 16:21:21 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [master][PATCH] conf: Change weak assignment of IMAGE_BOOT_FILES
Date: Tue, 17 Feb 2026 16:21:21 -0600
Message-ID: <20260217222121.2724706-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|CH3PR10MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1083126c-b8fe-40b1-c4e0-08de6e72e1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xdLrjkm4c7YJMZc0AtcJ79ohjQUxReUL5cQiezbduYsYwgIltH59nkSkwals?=
 =?us-ascii?Q?AQ05Sro1K36x09R9dLvC3QgoKG+nd9m9fQP9JuFMiYHrNlCFsRSz4NO0js5k?=
 =?us-ascii?Q?Tvuyt2QBU1DKTDdX+ZgEK4dRx4brDbml+vwAKAV8a5gDVWmNFdfc2ymld1sL?=
 =?us-ascii?Q?p8nagdVLGtoSHmDkCGvb/p8jM4OHr9lcl7GueSSFdKvNfGv/YaAydG41qBod?=
 =?us-ascii?Q?S+9U/0sLemLj8J/MeWWGyqcoydx0b2b3my1z2RKmpgKsh0OaCdk0ChX5XRJ3?=
 =?us-ascii?Q?IhE/Xkz2gY9W80YfHGmpTiVrwNPYiXFyspgBHin1IHrXwoXBy+D1iFselBIL?=
 =?us-ascii?Q?WtHN2iDbfgsAuHpb/E2KYyhqaV2HuLUS9hLTzt7LfaXdZ4RcZHCXI6/UwoSx?=
 =?us-ascii?Q?PQGa0M+C0JeMRGW/n3kVtNV4ZHfpWF6af/LkVMxwYyWn4du/mGN4OjXYtN9N?=
 =?us-ascii?Q?Y8N07RXmboHaHmspLP1/msHLBu/+PUEX0CjHL89+3M4hwPz1oN84L2WiwbI+?=
 =?us-ascii?Q?viObOFJJxaTf/yYy/JNVF+muadPOvkbUp+IgqceI5KlFu0h05buBMvZDCEnZ?=
 =?us-ascii?Q?hecmcJdwVkznJ5IovwaNcZP38gBJ08vyJYBj9zyISLdDSOi0Kst19kwSrmf/?=
 =?us-ascii?Q?HWZOmTXu8qnlqTxZN7mC+ZBBALzf2VRYHUwjGdPtBS/nAyU4rXvxwVM6gqG4?=
 =?us-ascii?Q?omO/R+2e+yup9aPDIs3ss/+mB7DFMzXO8VJy5wn9Lja1Xmn9Z02ugl9hC4Ph?=
 =?us-ascii?Q?3cX0u4l2kMNmFbaFq7awPcYaNHMEhvmfP1lWsaDPqbpWxaXkddGPdvdkBVCo?=
 =?us-ascii?Q?9L4r4sU8RIacalQEW4IRPQBtaao/jYwvB1rCv9tYKIy7EyxcD5Rl1KyUPhIx?=
 =?us-ascii?Q?l4SiQxnuCH2hmPW4lZITI58VYhQlRGabtAbRGh0624To+rJGhK4w6Y+mnfEL?=
 =?us-ascii?Q?2PDjF1NRQrDGJrR0ycy311PX5xjSyeOQ+yBhVhFFz0cOTPYH4ccIRSh9pTCQ?=
 =?us-ascii?Q?D8HjIJf0FuKLxaw/Np11AZeI82CqaxXDWavraazVwPV4B7v8T+OEnQluZ6ma?=
 =?us-ascii?Q?Cvj0FYiq0E24wQut3+NxNjG1qpGMS1yTJfqBm5vXVuC8LEYnxad/oOnNdxyh?=
 =?us-ascii?Q?BlkPyt/7DTr8xH2A/OfFdqiBz2/W4NwEue2ELl6c+hc7L/SF8URujOrv4J3W?=
 =?us-ascii?Q?pNvSqc/RTB5iRyoRVAI5jgqgJlzzKjcg16aZ4nbz1sBzTdkzdIwiQFZx/fkE?=
 =?us-ascii?Q?XZ4JfVNIqICVvJel9dRCQeJ6fxZ95HLxyorOx5wMIBusvPmoGxB73coZZfh6?=
 =?us-ascii?Q?XYfibLBBMDTCRH741vOalubnVVorILjKmyXOcs5gmJDi2OCl875FpomJ/Lu0?=
 =?us-ascii?Q?y3zAdr/QZtzbWQsEQYnaUWb1YkwaMF5oNyHmN57Hda88iPDS5mWBcmfiCCDo?=
 =?us-ascii?Q?SVUWeP4IauIDrElr1ZHHa58o1fTvU4665BSDfbCZATiOgiprl+lOaaIep1OO?=
 =?us-ascii?Q?nMPMCEDcp5ASrw6xbd+wRe7YDnNkaVvRVtIEYidk5/kow1mbtDUvSmTVujJ2?=
 =?us-ascii?Q?4qfmks25n5vfn1YOcIRTmVBGLftOYfwz/99u8ASH98dBt84SM6fVjmR1+AJ5?=
 =?us-ascii?Q?FZAWtovif+yXe1vo5ml8DQ0DwklmIOPWN23dpIh5k7d6KrNFDkcUjBOiLyo3?=
 =?us-ascii?Q?dtblAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lrTOIjVlmgZpHuOWX2nXEpL1MbwdVvoS16sI8QPK/UzKZc4KvPn0VQDnJReiOjg0UglVSc73RWtzXKw7B8x2PjnHNbVybOcBHA33wHZ9K1xulxrEcDpjLhiINQIzcjJy4LPTvn918zpHXjgDHY+50NSDAOpXEbvkloR0BIvOv77WFtXBXKuQgLk+csquXMNhAxaGqVMF8+hnkKblwnMF4s0NIPcWxWbeIhbpUH8IUwGQhIHLZGgugy+W0udJYPyHT/qUfGW4Pz1FEJKHK75Dj0n5vh2HdzrfPQ7IWcRktpcf8d+bLV9ANEQnSDqnhUrecSFGtxwBUtn5JVA1p7rbaASPDakPLvZ5CX18HXFxD6AG8VEraqHvJkdQahvAf47donNBu2eJ3xJxtlzV/ry8rpWYzCAw8DYWTFBQSWqCvz/r4bagC13HRt9Mzbr5OepE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:21:22.5183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1083126c-b8fe-40b1-c4e0-08de6e72e1c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6740
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 22:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19536

Rather than using ?=3D to default the value of IMAGE_BOOT_FILES, instead
use +=3D to add the files we want to the probably empty value.

We ran into an issue where the recent ti-core-initramfs changes used +=3D
and overrode the ?=3D in k3.inc, resulting in no boot files being packaged
in the wic boot partition.  This addresses the issue by ensuring that we
never have a situation where the required files are not in the final
list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am57xx.inc | 2 +-
 meta-ti-bsp/conf/machine/include/k3.inc     | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc  | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf=
/machine/include/am57xx.inc
index 6acc0cb0..cce42e2c 100644
--- a/meta-ti-bsp/conf/machine/include/am57xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
@@ -45,6 +45,6 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 scr=
een alsa mmip dsp gc320 p
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
+IMAGE_BOOT_FILES +=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
 do_image_wic[depends] +=3D "ti-rtos-messageq-test-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 698b46d7..89a67f3c 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -43,7 +43,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-pka-fw"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
=20
-IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bi=
n tiboot3-*-evm.bin"
+IMAGE_BOOT_FILES +=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bi=
n tiboot3-*-evm.bin"
 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
=20
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/=
machine/include/ti33x.inc
index 252b6e5a..2b5ee53b 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -91,5 +91,5 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 als=
a"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES}"
+IMAGE_BOOT_FILES +=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES}"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/=
machine/include/ti43x.inc
index 5c09e2f5..0c37871a 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -63,5 +63,5 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 scr=
een alsa"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES}"
+IMAGE_BOOT_FILES +=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLIN=
UX_BOOT_FILES}"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
--=20
2.43.0


