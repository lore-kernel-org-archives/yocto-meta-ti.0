Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91197C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 14:42:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.15950.1676299356965787488
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 06:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IM4orXl3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DEgWNt091183;
	Mon, 13 Feb 2023 08:42:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676299352;
	bh=2kKti4Zeveydpo92+lBZdc1ioKPF5s5BAoSckRvDvdk=;
	h=From:To:CC:Subject:Date;
	b=IM4orXl39zXO+4RnIZlGNj6LrtgXaIpcruAt/5f0/3OD7K/HlBaOWiXVEjHr0WQBt
	 9jwpBavCTz3U3fv0Ta/FKhLyicchTDVgXKV6TKlr5TdgJzjnN0XbGwOv58dcUKBavZ
	 TXOZJ5aEaw8dYmEwVQrdHnIm/U7eirSDTkGpjA+8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DEgW9s095488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 08:42:32 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 08:42:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 08:42:31 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31DEgUDB045678;
	Mon, 13 Feb 2023 08:42:31 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH V2 1/2] am62xx-evm: Add AM62x HS-FS evm configuration
Date: Mon, 13 Feb 2023 20:12:20 +0530
Message-ID: <20230213144220.3839983-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 14:42:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15824

Lets add the basic AM62x HS-FS configuration
- Add machine conf for AM62x HS-FS.
- The wic images will boot on AM62x HS-FS devices by default. The sysfw image for GP and HS-SE will be packaged in the wic image as tiboot3-am62x-gp-evm.bin and tiboot3-am62x-hs-evm.bin respectively.
- Add ti-sci-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 conf/machine/am62xx-evm-k3r5-gp.conf    |  5 +++++
 conf/machine/am62xx-evm-k3r5-hs-fs.conf | 14 ++++++++++++++
 conf/machine/include/am62xx.inc         | 15 +++++++++++----
 conf/multiconfig/k3r5-hs-fs.conf        |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb  |  1 +
 5 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 conf/machine/am62xx-evm-k3r5-hs-fs.conf
 create mode 100644 conf/multiconfig/k3r5-hs-fs.conf

diff --git a/conf/machine/am62xx-evm-k3r5-gp.conf b/conf/machine/am62xx-evm-k3r5-gp.conf
index d9867bc7..6e155ea2 100644
--- a/conf/machine/am62xx-evm-k3r5-gp.conf
+++ b/conf/machine/am62xx-evm-k3r5-gp.conf
@@ -8,7 +8,12 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
+SYSFW_TIBOOT3_SYMLINK = ""
+
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
 
+SPL_BINARY = ""
 UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
 UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
+
diff --git a/conf/machine/am62xx-evm-k3r5-hs-fs.conf b/conf/machine/am62xx-evm-k3r5-hs-fs.conf
new file mode 100644
index 00000000..0f016547
--- /dev/null
+++ b/conf/machine/am62xx-evm-k3r5-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62xx HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx HS-FS EVM (R5F core)
+
+# Booting HS-FS requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY_append = ":k3r5-hs-fs"
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am62x_evm_r5_defconfig"
diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index 912318e9..6b2c0da3 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -8,11 +8,18 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-BBMULTICONFIG = "k3r5-gp"
-do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+# Default tiboot3.bin on AM62x is for HS-FS
+BBMULTICONFIG = "k3r5-hs-fs"
+do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
-# Since default tiboot3.bin on AM62x is for GP, add a version for HS-SE
+# Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
+BBMULTICONFIG += "k3r5-gp"
+IMAGE_BOOT_FILES += " tiboot3-am62x-gp-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
 BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += " tiboot3-am62x-hs-evm.bin"
 do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
diff --git a/conf/multiconfig/k3r5-hs-fs.conf b/conf/multiconfig/k3r5-hs-fs.conf
new file mode 100644
index 00000000..c6d58ead
--- /dev/null
+++ b/conf/multiconfig/k3r5-hs-fs.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE_append = "-hs-fs"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 7896c366..7d046750 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -39,6 +39,7 @@ SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
 SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
+SYSFW_PREFIX_am62xx-evm-k3r5-hs-fs = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
-- 
2.34.1


