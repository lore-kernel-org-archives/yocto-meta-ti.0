Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13272C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 10:26:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.50762.1681727201437367355
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 03:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=malformed MIME header line: Subject: [meta-ti][master/kirkstone][PATCH v2] j721e-hs-evm: Merge j721e
 defconfigs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33HAQex2088389
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Apr 2023 05:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681727200;
	bh=vhTZT6IU3C2RGIJJjml4+71k0+ocKOSfS6X+CLofbw4=;
	h=From:To:CC:Subject:Date;
	b=CcK3yfzZQPCzXRKKxhI6yHWN6E3VS+O6eMZIKAE4Ge2gC2RZOAWdD5nAj4G/ruQKj
	 VyHo8s0x04YCA5XQ7KUwN9TRchKd/APCbr3QqowoLokHKFTT3rpa+AAB/+3lyvTW/M
	 Lkhxj8iDEdNbt7L8lWnYQoOSaWHjZL2k7S3Rjoxg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33HAQeeI068815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Apr 2023 05:26:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 17
 Apr 2023 05:26:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 17 Apr 2023 05:26:40 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33HAQcKZ037697;
	Mon, 17 Apr 2023 05:26:39 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Udit Kumar <u-kumar1@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2] j721e-hs-evm: Merge j721e
 defconfigs
Date: Mon, 17 Apr 2023 15:56:37 +0530
Message-ID: <20230417-kirkstone-v2-1-70e3c2a561be@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681727141; l=1679;
 i=m-chawdhry@ti.com; s=20230417; h=from:subject:message-id;
 bh=vabApJJ0yCFi4WAXPyE2hedM011Q07QRcnzoa+hAYGg=;
 b=2uzL3pj65JGEY0EKim2Z/PN9jp4oefcOSZDEV4y1D0zt41olyZtQJ256TQOAMuyoLAuF5Z/6W
 OnEADEH5/ejA44uYbpDlEM0bhcL++H/DT0dhZ8lpunrL98XNyMu7+eO
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=J/YFdaNRtg/0laEMIcsNnCdIcyFQ3oolBqBrCkiyjHo=
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Apr 2023 10:26:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16405

uboot will now use a merged defconfig build so keep the defconfig same=0D
for hs here=0D
=0D
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>=0D
---=0D
Lore link for the u-boot patch: https://lore.kernel.org/u-boot/20230324-j72=
1e-upstream-hs-v6-0-5aa43a4817a9@ti.com/=0D
The patch is merged internally for this=0D
=0D
v2:=0D
Fix broken commit message=0D
---=0D
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf | 2 +-=0D
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf      | 2 +-=0D
 2 files changed, 2 insertions(+), 2 deletions(-)=0D
=0D
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/j721e-hs-evm-k3r5.conf=0D
index 56312c0ce52d..94c434eaefbc 100644=0D
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf=0D
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf=0D
@@ -14,4 +14,4 @@ UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"=0D
 UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"=0D
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"=0D
 =0D
-UBOOT_MACHINE =3D "j721e_hs_evm_r5_defconfig"=0D
+UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"=0D
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/=
machine/j721e-hs-evm.conf=0D
index 00ec19980c1e..0ed77c3da7b5 100644=0D
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf=0D
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf=0D
@@ -4,7 +4,7 @@=0D
 =0D
 require conf/machine/j721e-evm.conf=0D
 =0D
-UBOOT_MACHINE =3D "j721e_hs_evm_a72_defconfig"=0D
+UBOOT_MACHINE =3D "j721e_evm_a72_defconfig"=0D
 =0D
 SPL_BINARY =3D "tispl.bin_HS"=0D
 UBOOT_BINARY =3D "u-boot.img_HS"=0D
=0D
---=0D
base-commit: c8ba8aaade90101f06164aec1b393d7c8b3aa201=0D
change-id: 20230417-kirkstone-12a840df853f=0D
=0D
Best regards,=0D
-- =0D
Manorit Chawdhry <m-chawdhry@ti.com>=0D
=0D

