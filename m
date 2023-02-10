Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4138C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 12:56:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13577.1676033784436254491
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 04:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YKvyBpgI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31ACuJ1H007552;
	Fri, 10 Feb 2023 06:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676033779;
	bh=XqzaFDPw+bR8lD9Rr3d4InXK132pqtDOty0k/A83rxU=;
	h=From:To:CC:Subject:Date;
	b=YKvyBpgI++AY2JnA1G0H2d/DutTAS4rdm1HiZjDaGDIsFlV/j4rzjXZqciSQOKm77
	 COoF7XkrBhP9XMXLRlp9+q/GPBE6fKbh0FXvUe5suUPpjYkgNcOWWCCaQyY/bCyuG7
	 KNCgLA3OkCRGB4oF0mUH/6/A6Jx0zkK1Jkt4GM4w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31ACuJ0X044688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 06:56:19 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 06:56:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 06:56:19 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31ACuHoc019822;
	Fri, 10 Feb 2023 06:56:18 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH] am62xx-lp-evm: Add AM62x LP HS-FS evm configuration
Date: Fri, 10 Feb 2023 18:26:15 +0530
Message-ID: <20230210125615.2607653-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 12:56:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15792

Lets add the basic AM62x LP HS-FS configuration
- Add machine conf for AM62x LP HS-FS.
- The wic images will boot on AM62x LP HS-FS devices by default. The sysfw image for HS-SE will be packaged in the wic image as tiboot3-am62x-hs-evm.bin.
- Add ti-sci-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf | 14 ++++++++++++++
 conf/machine/am62xx-lp-evm-k3r5-hs-se.conf |  7 +++++++
 conf/machine/include/am62xx-lp.inc         |  8 +++++++-
 conf/multiconfig/k3r5-hs-fs.conf           |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb     |  1 +
 5 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
 create mode 100644 conf/multiconfig/k3r5-hs-fs.conf

diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf b/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
new file mode 100644
index 00000000..0178fcfc
--- /dev/null
+++ b/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM62xx LPSK HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-FS EVM (R5F core)
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
+UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
index b752ee7e..37e9760a 100644
--- a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
+++ b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
@@ -11,4 +11,11 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
+SYSFW_TIBOOT3_SYMLINK = ""
+
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+ 
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/conf/machine/include/am62xx-lp.inc b/conf/machine/include/am62xx-lp.inc
index c38de868..02937662 100644
--- a/conf/machine/include/am62xx-lp.inc
+++ b/conf/machine/include/am62xx-lp.inc
@@ -8,8 +8,14 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-# Default tiboot3.bin on AM62x LP is for HS-SE
+# Default tiboot3.bin on AM62x LP is for HS-FS
+BBMULTICONFIG = "k3r5-hs-fs"
+do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
 BBMULTICONFIG += "k3r5-hs-se"
+IMAGE_BOOT_FILES += " tiboot3-am62x-hs-evm.bin"
 do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
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
index 7896c366..24af66a2 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -41,6 +41,7 @@ SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
 SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
 SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
+SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs = "fs"
 SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
 
 SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
-- 
2.34.1


