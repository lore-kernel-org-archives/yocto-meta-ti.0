Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDD3C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:59:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6837.1683835152999664021
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 12:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=whFsqsMr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BJxBfU025050;
	Thu, 11 May 2023 14:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683835151;
	bh=iK/VaH5PnoDssuG4SlVReLUE/IVCSXHrRpquzFlTqy8=;
	h=From:To:Subject:Date;
	b=whFsqsMrLyYyBX5xvnERneQEchxLmFAZGs6myWorBZH05r2FHy/NI0F7MwJqlkLoe
	 WS/7KI3uduXN1pZXc/lxNcdCMGUL/IBeC0bGY7YXyYKWJnG94SSoPw3x4lFIj1i739
	 yq21DKrbOEWJ97JOVFH0JUMgEwH4U0Kp66To2XEk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BJxAmb078133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 14:59:11 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 14:59:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 14:59:10 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BJxAg0045837;
	Thu, 11 May 2023 14:59:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pxCRS-0004Uu-Gd; Thu, 11 May 2023 14:59:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: Add extra tiboot3.bin version that matches default
Date: Thu, 11 May 2023 14:59:10 -0500
Message-ID: <20230511195910.17248-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 19:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16524

When creating the boot partition we copy all of the images for the
different board types (gp, hs-fs, hs-se), but one of those we consider
to be a default.  That default is not copied with the longer name, but
rather with the tiboot3.bin name.

The issue comes when someone wants to boot with a different bin file.
They need to copy the approriate longer named .bin file to tiboot3.bin.
But then the original name of what tiboot3.bin is lost unless the use
backs it up.

This patch just additionally copies that longer named bin file so that
anyone who wants to look at the boot partiion and decide to boot for a
different board can know which file to copy to tiboot3.bin and does not
need to worry about making a backup.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc   | 1 +
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 1 +
 meta-ti-bsp/conf/machine/include/am62xx.inc    | 1 +
 meta-ti-bsp/conf/machine/j721s2-evm.conf       | 1 +
 meta-ti-bsp/conf/machine/j784s4-evm.conf       | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index eacfa584..e708a313 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -7,6 +7,7 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62A is for HS-FS
 BBMULTICONFIG = "k3r5-hs-fs"
+IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
 do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
index bcc6f493..99237a90 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
@@ -7,6 +7,7 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62x LP is for HS-FS
 BBMULTICONFIG = "k3r5-hs-fs"
+IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
 do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index c1e0ed0c..c98da5f5 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -8,6 +8,7 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on AM62x is for HS-FS
 BBMULTICONFIG = "k3r5-hs-fs"
+IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
 do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index bdea7c44..78973600 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -21,6 +21,7 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 # Default tiboot3.bin on J721S2 is for GP
 BBMULTICONFIG = "k3r5-gp"
+IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
 do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 4fe64d88..4274e800 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -21,6 +21,7 @@ UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
 # Default tiboot3.bin on J784S4 is for GP
 BBMULTICONFIG = "k3r5-gp"
+IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
 do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
-- 
2.17.1


