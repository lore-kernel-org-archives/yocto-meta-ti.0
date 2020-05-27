Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.162.1590594975050066167
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 May 2020 08:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 689BC40ADE;
	Wed, 27 May 2020 15:56:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FzbnDYUcMNq; Wed, 27 May 2020 15:56:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4550940A18;
	Wed, 27 May 2020 15:56:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9DCBE16FA39;
	Wed, 27 May 2020 11:56:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] conf/machine: unify common AM65x GP and HS settings
Date: Wed, 27 May 2020 11:56:12 -0400
Message-Id: <1590594972-50037-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf    | 24 ------------------------
 conf/machine/am65xx-hs-evm.conf | 23 -----------------------
 conf/machine/include/am65xx.inc | 24 ++++++++++++++++++++++++
 3 files changed, 24 insertions(+), 47 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 0007377..2f3b92a 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -6,32 +6,8 @@ require conf/machine/include/am65xx.inc
 
 BBMULTICONFIG += "k3r5-sr2"
 
-MACHINE_FEATURES += "touchscreen"
-
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
-KERNEL_DEVICETREE = " \
-    ti/k3-am654-base-board.dtb \
-    ti/k3-am654-base-board-sr1.dtb \
-    ti/k3-am654-gp.dtbo \
-    ti/k3-am654-idk.dtbo \
-    ti/k3-am654-idk-sr1.dtbo \
-    ti/k3-am654-evm-hdmi.dtbo \
-    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-evm-tc358876.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo \
-    ti/k3-am654-pcie-usb3.dtbo \
-    ti/k3-am654-base-board-jailhouse.dtbo \
-    ti/k3-am654-evm-prupwm.dtbo \
-"
-
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
-OPTEEMACHINE = "k3"
-OPTEEFLAVOR = "am65x"
-OPTEEOUTPUTMACHINE = "k3"
-
 IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index 702ba30..e4eebb6 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -4,27 +4,8 @@
 
 require conf/machine/include/am65xx.inc
 
-MACHINE_FEATURES += "touchscreen"
-
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
-KERNEL_DEVICETREE = " \
-    ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
-    ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
-    ti/k3-am654-idk-sr1.dtbo \
-    ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
-    ti/k3-am654-base-board-jailhouse.dtbo \
-    ti/k3-am654-evm-prupwm.dtbo \
-"
-
 UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
 
-OPTEEMACHINE = "k3"
-OPTEEFLAVOR = "am65x"
-OPTEEOUTPUTMACHINE = "k3"
-
 UBOOT_ENTRYPOINT =       "0x80080000"
 UBOOT_LOADADDRESS =      "0x80080000"
 UBOOT_RD_LOADADDRESS =   "0x84000000"
@@ -39,7 +20,3 @@ UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-
-OPTEEMACHINE = "k3"
-OPTEEFLAVOR = "am65x"
-OPTEEOUTPUTMACHINE = "k3"
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index d433ed1..f60d166 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -1,6 +1,30 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY_append = ":am65xx"
 
+MACHINE_FEATURES += "touchscreen"
+
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am654-base-board.dtb \
+    ti/k3-am654-base-board-sr1.dtb \
+    ti/k3-am654-gp.dtbo \
+    ti/k3-am654-idk.dtbo \
+    ti/k3-am654-idk-sr1.dtbo \
+    ti/k3-am654-evm-hdmi.dtbo \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
+    ti/k3-am654-evm-tc358876.dtbo \
+    ti/k3-am654-pcie-usb2.dtbo \
+    ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am654-base-board-jailhouse.dtbo \
+    ti/k3-am654-evm-prupwm.dtbo \
+"
+
+OPTEEMACHINE = "k3"
+OPTEEFLAVOR = "am65x"
+OPTEEOUTPUTMACHINE = "k3"
+
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "am65xx"
 TI_PDK_LIMIT_BOARDS = "am65xx_evm am65xx_idk"
-- 
2.7.4

