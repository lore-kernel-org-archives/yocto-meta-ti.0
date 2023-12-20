Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8CDC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 16:07:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.25410.1703088464389125601
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Dec 2023 08:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P/XQcXOZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BKG7eoS018222;
	Wed, 20 Dec 2023 10:07:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1703088460;
	bh=dIXAwMma9vIvwzPYoqyttvTsEZ+RJMx1J9Bng8Xyaco=;
	h=From:To:CC:Subject:Date;
	b=P/XQcXOZbfYta2J3o6hozVcbD81QD26ljgTOm+Cnu/x26Wvh3Jt1w9bxreu0+eiLo
	 euGC1nxPMB/QPdHSo+FEDqPa624BNWG3bu52jEoM6XQOtRvwlaG1Vi42nMRhovWxmI
	 4vlL912rGcS9NNsSFwaNXCazK/cxZhkQps2g7/FI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BKG7ef5036756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Dec 2023 10:07:40 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Dec 2023 10:07:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Dec 2023 10:07:38 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.40.136])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BKG7c6d025946;
	Wed, 20 Dec 2023 10:07:38 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC] meta-ti-bsp: Build R5 bootloader without multiconfig
Date: Wed, 20 Dec 2023 10:07:37 -0600
Message-ID: <20231220160737.40535-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Dec 2023 16:07:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17351

The R5 SPL bootloader is the only software we build using the R5 (arm32)
multiconfig environment. Using multiconfig pulls in a large number of
build dependencies (see the -native environment in baremetal tmp dir)
this increases build time and space.

Using multiconfig for a deploy target also leads to several oddities in
the bitbake build system forcing use of a non-standard deploy directory
and careful checks that no recipe built in both configuration deploy
the same files.

While I believe we will get more use out of multiconfig for future
devices, today let's simplify the K3 build infrastructure here by
building R5 SPL like a normal firmware using a foreign targeting cross
compiler. This is the technique meta-arm uses to build firmware (see
scp-firmware and trusted-firmware-m recipes). Add a new tiboot3 firmware
recipe here.

With that we can also drop all the related k3r5 multiconfig files and
definitions. Do that here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/classes/ti-secdev.bbclass         |  3 -
 .../conf/machine/am62axx-evm-k3r5.conf        | 11 ----
 meta-ti-bsp/conf/machine/am62axx-evm.conf     |  5 ++
 .../conf/machine/am62pxx-evm-k3r5.conf        | 12 ----
 meta-ti-bsp/conf/machine/am62pxx-evm.conf     |  5 ++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 12 ----
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 ++
 .../conf/machine/am62xx-lp-evm-k3r5.conf      | 11 ----
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 ++
 .../conf/machine/am62xxsip-evm-k3r5.conf      | 16 -----
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf   | 10 +++
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 11 ----
 meta-ti-bsp/conf/machine/am64xx-evm.conf      |  5 ++
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 11 ----
 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  5 ++
 .../conf/machine/am65xx-hs-evm-k3r5.conf      | 11 ----
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf   |  5 ++
 .../conf/machine/beaglebone-ai64-k3r5.conf    | 17 -----
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  5 ++
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf | 14 ----
 meta-ti-bsp/conf/machine/beagleplay.conf      |  5 ++
 meta-ti-bsp/conf/machine/include/k3.inc       |  4 +-
 meta-ti-bsp/conf/machine/include/k3r5.inc     | 27 --------
 meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf  | 11 ----
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  5 ++
 .../conf/machine/j7200-hs-evm-k3r5.conf       | 11 ----
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf    |  5 ++
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  | 11 ----
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  5 ++
 .../conf/machine/j721e-hs-evm-k3r5.conf       | 11 ----
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  3 +-
 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 11 ----
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  5 ++
 .../conf/machine/j721s2-hs-evm-k3r5.conf      | 11 ----
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   |  2 +
 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 11 ----
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  5 ++
 .../conf/machine/j784s4-hs-evm-k3r5.conf      | 11 ----
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf   |  2 +
 meta-ti-bsp/conf/multiconfig/k3r5.conf        | 10 ---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  3 -
 .../u-boot/tiboot3-staging_2023.5.bb          | 65 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  2 -
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 40 ------------
 44 files changed, 152 insertions(+), 303 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/include/k3r5.inc
 delete mode 100644 meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5.conf
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb

diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp/classes/ti-secdev.bbclass
index b3d70e5c..18d15269 100644
--- a/meta-ti-bsp/classes/ti-secdev.bbclass
+++ b/meta-ti-bsp/classes/ti-secdev.bbclass
@@ -2,14 +2,11 @@
 
 # K3 SECDEV scripts use OpenSSL
 DEPENDS:append:k3 = " openssl-native"
-DEPENDS:append:k3r5 = " openssl-native"
 
 # Use package version of TI SECDEV for K3 if one is not provided through the environment
 DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
-DEPENDS:append:k3r5 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
 TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
 TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
-TI_SECURE_DEV_PKG:k3r5 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
 
 # For non-K3 we require the SECDEV tools be provided through the environment with the following vars
 TI_SECURE_DEV_PKG:ti33x = "${TI_SECURE_DEV_PKG_CAT}/am3x"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
deleted file mode 100644
index 2af3317e..00000000
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62A HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62A EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am62ax"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index 22f61401..59884629 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -14,4 +14,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62a7-sk.dtb \
 "
 
+SYSFW_SOC = "am62ax"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE_R5 = "am62ax_evm_r5_defconfig"
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
deleted file mode 100644
index 36915381..00000000
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ /dev/null
@@ -1,12 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62PX EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
-
-SYSFW_SOC = "am62px"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62px_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index d7c9f589..116d819b 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -15,4 +15,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62p5-sk.dtb \
 "
 
+SYSFW_SOC = "am62px"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE_R5 = "am62px_evm_r5_defconfig"
 UBOOT_MACHINE = "am62px_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
deleted file mode 100644
index 548369ca..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ /dev/null
@@ -1,12 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62XX EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-require conf/machine/include/ti-extras.inc
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index fadbc6f4..6f234811 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -14,4 +14,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE_R5 = "am62x_evm_r5_defconfig"
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
deleted file mode 100644
index aa9422cd..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62XX LP GP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 229b74bc..e33b60e2 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -16,4 +16,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62-lp-sk.dtb \
 "
 
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE_R5 = "am62x_lpsk_r5_defconfig"
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
deleted file mode 100644
index 0daff2b9..00000000
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62XX SIP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-UBOOT_CONFIG_FRAGMENTS = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index b5dd18f1..2e077f75 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -13,4 +13,14 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE_R5 = "am62x_evm_r5_defconfig"
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
+
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+UBOOT_CONFIG_FRAGMENTS_R5 = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
deleted file mode 100644
index e932928a..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am64x_sr2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/machine/am64xx-evm.conf
index c6ba2a87..dc21c174 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -4,4 +4,9 @@
 
 require conf/machine/include/am64xx.inc
 
+SYSFW_SOC = "am64x_sr2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
+UBOOT_MACHINE_R5 = "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
deleted file mode 100644
index 8744ac3e..00000000
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am65x_sr2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index f6eb6f0c..9b050b03 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -4,6 +4,11 @@
 
 require conf/machine/include/am65xx.inc
 
+SYSFW_SOC = "am65x_sr2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "am65x_evm_r5_defconfig"
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
deleted file mode 100644
index 337c8413..00000000
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am65x_sr2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
index f8221f31..4164ae53 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -4,4 +4,9 @@
 
 require conf/machine/include/am65xx.inc
 
+SYSFW_SOC = "am65x_sr2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE_R5 = "am65x_evm_r5_defconfig"
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
deleted file mode 100644
index b893f380..00000000
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ /dev/null
@@ -1,17 +0,0 @@
-#@TYPE: Machine
-#@NAME: BeagleBone AI-64 (R5F)
-#@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j721e"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
-
-UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index e529f565..bad86a22 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -4,6 +4,11 @@
 
 require conf/machine/include/j721e.inc
 
+SYSFW_SOC = "j721e"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "j721e_evm_r5_defconfig"
 UBOOT_MACHINE = "j721e_evm_a72_config"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
deleted file mode 100644
index c40615c9..00000000
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: BeaglePlay (R5F)
-#@DESCRIPTION: Machine configuration for the BeaglePlay (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
-PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index ac4a202a..312fc503 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -18,6 +18,11 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 OPTEEMACHINE = "k3-am62x"
 
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "am62x_evm_r5_defconfig"
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 2415f0ba..84feee08 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -5,8 +5,6 @@ SOC_FAMILY:append = ":k3"
 
 require conf/machine/include/arm/arch-arm64.inc
 
-BBMULTICONFIG += "k3r5"
-
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r0"
 
@@ -62,7 +60,7 @@ MACHINE_FEATURES += "efi"
 WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
 
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
+do_image[depends] += "tiboot3-staging:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
deleted file mode 100644
index 63267a5e..00000000
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-# TI K3 Armv7 profile for Cortex-R5F cores
-
-require conf/machine/include/ti-soc.inc
-SOC_FAMILY:append = ":k3r5"
-
-# The closest of existing tunes for Cortex-R5F
-DEFAULTTUNE = "armv7athf"
-require conf/machine/include/arm/armv7a/tune-cortexa8.inc
-
-# R5 runs early bootloader and loads SYSFW
-# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
-# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst
-# https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
-PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
-PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
-
-SPL_SUFFIX = "bin"
-SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
-SPL_SYMLINK = "tiboot3.${SPL_SUFFIX}"
-UBOOT_SUFFIX = "bin"
-UBOOT_BINARY = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
-
-PACKAGECONFIG:pn-u-boot-ti-staging = ""
-PACKAGECONFIG:pn-u-boot-ti-mainline = ""
diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
deleted file mode 100644
index 68061883..00000000
--- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J7200 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j7200"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "j7200_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index dff1da69..e733d15a 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -10,4 +10,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-j7200-common-proc-board.dtb \
 "
 
+SYSFW_SOC = "j7200"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "j7200_evm_r5_defconfig"
 UBOOT_MACHINE = "j7200_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
deleted file mode 100644
index 1922d5c8..00000000
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J7200 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j7200_sr2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-UBOOT_MACHINE = "j7200_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
index 54fd2b4a..fc33106c 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
@@ -4,4 +4,9 @@
 
 require conf/machine/j7200-evm.conf
 
+SYSFW_SOC = "j7200_sr2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE_R5 = "j7200_evm_r5_defconfig"
 UBOOT_MACHINE = "j7200_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
deleted file mode 100644
index 070bf7aa..00000000
--- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721e EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j721e"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index 5e1f6dca..ca23e3e3 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -15,4 +15,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-sk.dtb \
 "
 
+SYSFW_SOC = "j721e"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "j721e_evm_r5_defconfig"
 UBOOT_MACHINE = "j721e_evm_a72_config"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
deleted file mode 100644
index 7904c660..00000000
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721e HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j721e_sr1_1"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
index 441ca169..3d4bedb6 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -4,4 +4,5 @@
 
 require conf/machine/j721e-evm.conf
 
-UBOOT_MACHINE = "j721e_evm_a72_defconfig"
+SYSFW_SOC = "j721e_sr1_1"
+SYSFW_SUFFIX = "hs"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
deleted file mode 100644
index 508e96e5..00000000
--- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721S2 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j721s2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index ecb1836f..63d86af0 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -18,4 +18,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
 "
 
+SYSFW_SOC = "j721s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "j721s2_evm_r5_defconfig"
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
deleted file mode 100644
index 58cd92c4..00000000
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721S2 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j721s2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 4cf32a28..1129a189 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
 
 require conf/machine/j721s2-evm.conf
+
+SYSFW_SUFFIX = "hs"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
deleted file mode 100644
index 04feebc6..00000000
--- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J784S4 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j784s4"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 40a63651..a242ef8a 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -18,4 +18,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm.dtb \
 "
 
+SYSFW_SOC = "j784s4"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE_R5 = "j784s4_evm_r5_defconfig"
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
deleted file mode 100644
index 80a228a0..00000000
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: J784S4 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "j784s4"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 8fa1c1fd..42468088 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
 
 require conf/machine/j784s4-evm.conf
+
+SYSFW_SUFFIX = "hs"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
deleted file mode 100644
index 936bce2f..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ /dev/null
@@ -1,10 +0,0 @@
-MAINMACHINE := "${MACHINE}"
-
-DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
-
-MACHINE:append = "-k3r5"
-TCLIBC = "baremetal"
-TI_TMPDIR_APPEND ?= "-k3r5"
-TMPDIR:append = "${TI_TMPDIR_APPEND}"
-
-SDKPKGSUFFIX = "k3r5-nativesdk"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 12292c88..0597d9bb 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -17,9 +17,6 @@ do_install() {
 }
 
 do_deploy(){
-}
-
-do_deploy:k3r5() {
 	install -d ${DEPLOYDIR}/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sysfw
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb b/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb
new file mode 100644
index 00000000..0f1929b5
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/tiboot3-staging_2023.5.bb
@@ -0,0 +1,65 @@
+require u-boot-ti.inc
+
+include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
+
+PR = "r0"
+BRANCH = "ti-u-boot-2023.04"
+SRCREV = "b0d717b732ee28e446baf94522b3491e590f7fbb"
+
+PROVIDES:remove = "virtual/bootloader"
+PROVIDES:remove = "u-boot"
+
+# Using gcc-cross-arm-native here would have been ideal
+# as the compiler version would match between R5 and
+# main ARM core builds. arm-oe-linux-gnueabi-
+DEPENDS += "gcc-arm-none-eabi-native"
+
+EXTRA_OEMAKE += "CROSS_COMPILE=arm-none-eabi- CC=arm-none-eabi-gcc"
+
+UBOOT_MACHINE = "${UBOOT_MACHINE_R5}"
+
+SPL_SUFFIX = "bin"
+SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
+SPL_SYMLINK = "tiboot3.${SPL_SUFFIX}"
+UBOOT_SUFFIX = "bin"
+UBOOT_BINARY = "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
+do_compile:append () {
+	if [ -n "${UBOOT_CONFIG}" ];
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ];
+				then
+					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY} ]; then
+						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARY}
+					fi
+				fi
+			done
+			unset  j
+		done
+		unset  i
+	else
+		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
+			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
+		fi
+	fi
+}
+
+do_deploy:append () {
+	for f in ${B}/tiboot3-*.bin; do
+		if [ -f "$f" ]; then
+			install -m 644 $f ${DEPLOYDIR}/
+		fi
+	done
+
+	for f in ${B}/sysfw*.itb; do
+		if [ -f "$f" ]; then
+			install -m 644 $f ${DEPLOYDIR}/
+		fi
+	done
+}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 5bb20213..1ec5f9bf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -12,6 +12,4 @@ BRANCH = "v2023.04-ti-09.00.00.011"
 SRCREV = "4b8f8be8870f03d92a2b01d0d30ab912118adc82"
 
 BRANCH:beagleplay = "v2023.04-ti-09.00.00.011-BeaglePlay"
-BRANCH:beagleplay-k3r5 = "v2023.04-ti-09.00.00.011-BeaglePlay"
 SRCREV:beagleplay = "10afea462ea1113701f6f0f8853fdff985aa275d"
-SRCREV:beagleplay-k3r5 = "10afea462ea1113701f6f0f8853fdff985aa275d"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 2f15c4fb..b0f88a5a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -31,7 +31,6 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
 
 # SYSFW/TIFS Firmware
 DEPENDS:append:k3 = " ti-sci-fw"
-DEPENDS:append:k3r5 = " ti-sci-fw"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
@@ -79,7 +78,6 @@ SYSROOT_DIRS += "/boot"
 
 # SPL (Second Program Loader) to be loaded over UART
 SPL_UART_BINARY = "u-boot-spl.bin"
-SPL_UART_BINARY:k3r5 = ""
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -108,30 +106,6 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
 
-do_compile:append:k3r5 () {
-	if [ -n "${UBOOT_CONFIG}" ];
-	then
-		for config in ${UBOOT_MACHINE}; do
-			i=$(expr $i + 1);
-			for type in ${UBOOT_CONFIG}; do
-				j=$(expr $j + 1);
-				if [ $j -eq $i ];
-				then
-					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY} ]; then
-						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARY}
-					fi
-				fi
-			done
-			unset  j
-		done
-		unset  i
-	else
-		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
-			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
-		fi
-	fi
-}
-
 do_install:append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
@@ -204,20 +178,6 @@ do_install:append () {
 	fi
 }
 
-do_deploy:append:k3r5 () {
-	for f in ${B}/tiboot3-*.bin; do
-		if [ -f "$f" ]; then
-			install -m 644 $f ${DEPLOYDIR}/
-		fi
-	done
-
-	for f in ${B}/sysfw*.itb; do
-		if [ -f "$f" ]; then
-			install -m 644 $f ${DEPLOYDIR}/
-		fi
-	done
-}
-
 do_deploy:append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
-- 
2.39.2


