Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C488FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:34:06 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.818.1778006044667631633
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 May 2026 11:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cXBksREP;
 spf=pass (domain: ti.com, ip: 40.107.201.31, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUY4waf98BjQNiVH5HBpakFNCur48i1VY+IOfTId+YlLTIanvcahWv8fMJcz4eYSeZlqt9QYJHVwGvzr2WBcM0lNClh1gRY4/qg1TCzpvwvj432h4z6XvCaq6BOS6wNmTszFc3OAebbSsAZopUjGqMIyVTa8iZ2MjjNFzB3W6aKNSOs7+53jjX0XkS28WZFwXzggTW5g4G4M9/xXqNJquGAL+fUKj4Gl/0B+HgXQmJy26gHGr0iK7gOSXKJxKoUotPJgLQzos0AGmxZp04nF1c6bNFO99g8BMCW6hJVpl530J9XZRZeeGD7Q66KPxcwzo6fZklXvYNiKFax/6ul2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG3aT1VtrIiEJk4jR9DUgswbs0jhQBS8nneaafLhhEs=;
 b=ABFp/6junjyRPXu5zpptUsjLQw/LTBh266cwY8IdXmsCBwA7SfoNfPNAfXTxRSFFB0FOYDdXSohmaSzS591yPPv6wOWH0PoWyKVs3fv/lH+848bCVivFlb4dzjjFUqP3f2sO6aGNULQ22B1BFg1Dcv2T7wFJDguxWNhoZT/kQvqe3iWwLw+HknO1SZCsKkIyRrd8ih4fAHag6GXEZEijh/3S5hOeR+WuT5pJN+hOFskCteuCkCOoxmnn4U34Gp2WyQcwhyTEYSwxtABb+eblccOp/9EfX8LadYH+0UPhosxAD+tBchgMQt9S7PHk1ebsGW1MqMPmRmG1dpKcXKcqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG3aT1VtrIiEJk4jR9DUgswbs0jhQBS8nneaafLhhEs=;
 b=cXBksREPEHqLVrCz8MbhhzkP73ucleYH5q49wPrExg8qFYjoyhQKm2nW8794paNxJ1OYPd640v/EmzvCTIbjdFEXLDcNaIJTjYoAODpPRThOt3h5V0EESNVICKLKxkA5KWJBruzbgqNTVPif9NkYFNzrU4lI/ETYIof5RmyVWFI=
Received: from DS7P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::32) by
 CY5PR10MB6237.namprd10.prod.outlook.com (2603:10b6:930:43::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 18:34:02 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::af) by DS7P220CA0034.outlook.office365.com
 (2603:10b6:8:223::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 18:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 18:34:01 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 13:34:01 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 13:34:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 13:34:01 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645IY0t73583654;
	Tue, 5 May 2026 13:34:01 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] trusted-firmware-a: Remove TFA_K3_SYSTEM_SUSPEND build flag
Date: Tue, 5 May 2026 13:33:58 -0500
Message-ID: <20260505183358.58730-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|CY5PR10MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 2347a41a-94d0-4e20-102e-08deaad4e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WD+Ib8SEVNgrG8Qr+MQEqBZOksXibgId8A8ccjZ4hAVML3I+squu71YdqgJem0FmtHj2nyc6Pam0oaujy36ju+W1ZNIVLTGfuzG9Wn/9Bowu7dGRE/fNAWLaYgFI44NG68JXNhXDjAaPMZfM/h8FagJBrFXByL42BonhK2wV/Uw01QlvJNQCjbJNgOL3ZucCNsjlPY5skwqdmK7R50wlpBCRBQwLyKI3Rj6ExsmngCUvLk3oOSt5JwTxlOuzf2lJMk+BeDn09W495IDdnwW9dvnScI72J7MnJLbb4IMdXizrTFeA7z0cM5sTWbr/1rRmBtYr0qDAfM08m7c98P/ksk+wDlah1dPjEXymvdJV544/hHXFeGb4tw+uqXSD2lvCJpNtDGSZ4eUz6V6kQ9tkDlZzfxgeYxhgXtSHpX4Dna/MUZ4qhr2tfx5RjZSc2k5qOX7JpstjbCrgTz6ckt/DvCJjRiOJshQDo7FDMRJ3VZaIFvUjJ91+Eq3zRvScbtCsmx6o5cxhKfh1HxmU0+IU+Dm9IxN5rfTGskDwEi7ec/YnyLGh2idtfmB2ciHBPPCUauyxhKVaemFXirFzrPVTV7cGe7LcxOhlIlQNSQFWW8LcBczXQk5lxxRyOwKeR3e2141ClPfdorYDd2zpVFEzPKhP1kLmPFrtmfpAlxn/meGmlHK/AlP6pnRiKBFaUBIhupkpZp/uBXdnbZdB47bFMJeM/+YGaopuN7T64DYceqI=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bqHaa/g8PzmF539VGcPoKXlswISVmI/jWshIC+lhJZ8HU1kJDYwuLp6ue6cx5qAvvCzkLm7PIIT0WPy0y6tjeGl4+UW4x/jH6Aizg0TL4qvWoSOBvFrxG9qJidZSIAqIqQ1v3GRODlx5tM8orfg3HAtzeTQpU4I0eURl+ZZztAeEDgOGiLRAGDcji59hR6rBYXCimSFllk2k+aSpn5r1fpsEiDcCxeXscIDwcXaUOv0n+TGKaSthUhy1WYQ0Z9l0Fjv3dST9mGdDLvDD0rT8sMRbBgGJomeA9QMGEEvwMP1Ydg+adoYXP9/09K0bJQk1Sv3dJEKTTZh8Kerh8XRgap0ph2rVIRhUiA1aC3t51QmTH2YmAuy+lV+nv81+jwb5hskb6bRRpqvXyOgVsfInuDENU/bClW3jUIGAHgiqLYGwCVenU/DNwUsrc0uS8iQj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:34:01.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2347a41a-94d0-4e20-102e-08deaad4e121
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6237
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 May 2026 18:34:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19929

All supported TF-A handle this automatically based on the firmware, the
flag no longer does anything as it isn't checked in TF-A now. Remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/pocketbeagle2.conf                     | 1 -
 meta-ti-bsp/conf/machine/include/am62axx.inc                    | 2 --
 meta-ti-bsp/conf/machine/include/am62dxx.inc                    | 2 --
 meta-ti-bsp/conf/machine/include/am62lxx.inc                    | 1 -
 meta-ti-bsp/conf/machine/include/am62pxx.inc                    | 1 -
 meta-ti-bsp/conf/machine/include/am62xx.inc                     | 1 -
 meta-ti-bsp/conf/machine/include/j722s.inc                      | 1 -
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 1 -
 8 files changed, 10 deletions(-)

diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/conf=
/machine/pocketbeagle2.conf
index 7cfe6e30..cc7957fc 100644
--- a/meta-beagle/conf/machine/pocketbeagle2.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2.conf
@@ -12,7 +12,6 @@ SOC_FAMILY:append =3D ":am62xx"
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
 TFA_BOARD =3D "lite"
-TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
 OPTEEMACHINE =3D "k3-am62x"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index 0577ffaa..59d83c06 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -5,8 +5,6 @@ SOC_FAMILY:append =3D ":am62axx"
=20
 MACHINE_FEATURES +=3D "screen touchscreen"
=20
-TFA_K3_SYSTEM_SUSPEND =3D "1"
-
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am62x"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/con=
f/machine/include/am62dxx.inc
index fc2ce4a3..7a11bb1a 100644
--- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
@@ -3,7 +3,5 @@ require conf/machine/include/mc_k3r5.inc
=20
 SOC_FAMILY:append =3D ":am62dxx"
=20
-TFA_K3_SYSTEM_SUSPEND =3D "1"
-
 TFA_BOARD =3D "lite"
 OPTEEMACHINE =3D "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/con=
f/machine/include/am62lxx.inc
index 26abe479..b626119a 100644
--- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -6,7 +6,6 @@ MACHINE_FEATURES +=3D "screen"
 SERIAL_CONSOLES =3D "115200;ttyS0"
=20
 TFA_BOARD =3D "am62lx"
-TFA_K3_SYSTEM_SUSPEND =3D "1"
 TFA_PLATFORM =3D "k3low"
=20
 OPTEEMACHINE =3D "k3-am62lx"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/con=
f/machine/include/am62pxx.inc
index 560334c1..6bf20ee4 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -9,7 +9,6 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 TFA_BOARD =3D "lite"
-TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
 OPTEEMACHINE =3D "k3-am62x"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf=
/machine/include/am62xx.inc
index 9e24898c..fc20893b 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -12,7 +12,6 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DR=
IVER_PROVIDER}"
 IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
=20
 TFA_BOARD =3D "lite"
-TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
 OPTEEMACHINE =3D "k3-am62x"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/=
machine/include/j722s.inc
index c2732b70..097c4e24 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -9,7 +9,6 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
 TFA_BOARD =3D "lite"
-TFA_K3_SYSTEM_SUSPEND =3D "1"
=20
 OPTEEMACHINE =3D "k3-am62x"
=20
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 695b8b90..cd96ede1 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -28,5 +28,4 @@ TFA_INSTALL_TARGET:am62lxx =3D "bl31 bl1"
 EXTRA_OEMAKE +=3D "${@ 'K3_USART=3D' + d.getVar('TFA_K3_USART') if d.getVa=
r('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE +=3D "${@ 'BL32_BASE=3D' + d.getVar('TFA_K3_BL32_BASE') if d.=
getVar('TFA_K3_BL32_BASE') else ''}"
 EXTRA_OEMAKE +=3D "${@ 'PRELOADED_BL33_BASE=3D' + d.getVar('TFA_K3_PRELOAD=
ED_BL33') if d.getVar('TFA_K3_PRELOADED_BL33') else ''}"
-EXTRA_OEMAKE +=3D "${@ 'K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('TFA_K3_SYSTEM=
_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 EXTRA_OEMAKE:append:ti-falcon =3D " PRELOADED_BL33_BASE=3D0x82000000 K3_HW=
_CONFIG_BASE=3D0x88000000"
--=20
2.39.2


