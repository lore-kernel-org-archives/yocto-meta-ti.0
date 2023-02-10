Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0039C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 12:45:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13404.1676033144722931633
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 04:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rP7U8/Ci;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31ACje8C000987;
	Fri, 10 Feb 2023 06:45:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676033140;
	bh=9YznR+WYAesrxiUWzRjnH7GuQ2ALGiClPRJ/YbIjQPQ=;
	h=From:To:CC:Subject:Date;
	b=rP7U8/CiA2lYO2BZjYjqQfEAgkjcyq7ESkdfZxiSsU/UpYSjIon1vPONiLeykZlHK
	 suphSInJGHnI3KiSDOsREvEmGR7OEAjk+2Ao9CuORR1ubxim/PS7M5moqADbV85N0i
	 KSyqJhyjnAAPymmuNo6plBfHsKj5eHo75DuvwN2E=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31ACjeEf032026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 06:45:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 06:45:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 06:45:39 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31ACjcxe110483;
	Fri, 10 Feb 2023 06:45:39 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH] am62xx-evm: Add AM62x HS-FS evm configuration
Date: Fri, 10 Feb 2023 18:15:34 +0530
Message-ID: <20230210124534.2607360-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 12:45:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15791

Lets add the basic AM62x HS-FS configuration
- Add machine conf for AM62x HS-FS.
- The wic images will boot on AM62x HS-FS devices by default. The sysfw image for GP and HS-SE will be packaged in the wic image as tiboot3-am62x-gp-evm.bin and tiboot3-am62x-hs-evm.bin respectively.
- Add ti-sci-firmware overrides.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 conf/machine/am62xx-evm-k3r5-gp.conf    |  5 +++++
 conf/machine/am62xx-evm-k3r5-hs-fs.conf | 14 ++++++++++++++
 conf/machine/include/am62xx.inc         | 14 ++++++++++----
 conf/multiconfig/k3r5-hs-fs.conf        |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb  |  1 +
 5 files changed, 33 insertions(+), 4 deletions(-)
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
index 912318e9..bd577887 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -8,11 +8,17 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-BBMULTICONFIG = "k3r5-gp"
-do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
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


