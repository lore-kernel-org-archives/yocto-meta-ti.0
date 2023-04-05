Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2312DC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:50:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.139286.1680720631033509499
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 11:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ADIqOdI0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335IoS00069726;
	Wed, 5 Apr 2023 13:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680720628;
	bh=XymmZjg9Y77LuAz5Qi3Nnmus8qxd3/xauuAYGMNUS4o=;
	h=From:To:CC:Subject:Date;
	b=ADIqOdI0kCSaobBkuQqWUia0g0X87cL3KaNT7II6a5nqQnvmJv4siwu0pLgwo+tw+
	 eoTflBX0JvP6iY4mfamFC59io5Cxo6hYZY2M8z13MNNNzyeSkP3P6CRnZR3P3vdw0F
	 YxKN8XfmFjkBotxawP14DZnqD35vgfj9O0FgyRU4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335IoS44008922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Apr 2023 13:50:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 13:50:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 13:50:28 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335IoRRh022046;
	Wed, 5 Apr 2023 13:50:27 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: Set common default SERIAL_CONSOLES for all K3
Date: Wed, 5 Apr 2023 13:50:27 -0500
Message-ID: <20230405185027.26235-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Apr 2023 18:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16293

The traditional order of serial consoles for K3 has ttyS2 being the
primary UART attached console. ttyS0 is also a common choice for
distros and the TI kernel may switch at some point. To prepare
we check both UARTs on all K3 devices. Move this common check
to a K3 common location.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf  | 3 ---
 meta-ti-bsp/conf/machine/include/am62axx.inc   | 3 ---
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 3 ---
 meta-ti-bsp/conf/machine/include/am62xx.inc    | 3 ---
 meta-ti-bsp/conf/machine/include/am64xx.inc    | 3 ---
 meta-ti-bsp/conf/machine/include/am65xx.inc    | 3 ---
 meta-ti-bsp/conf/machine/include/k3.inc        | 3 +++
 meta-ti-bsp/conf/machine/j7200-evm.conf        | 3 ---
 meta-ti-bsp/conf/machine/j721e-evm.conf        | 3 ---
 meta-ti-bsp/conf/machine/j721s2-evm.conf       | 2 --
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf    | 3 ---
 meta-ti-bsp/conf/machine/j784s4-evm.conf       | 2 --
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf    | 2 --
 13 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index 6e8c863c..e6cba3df 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/j721e.inc
 
-SERIAL_CONSOLES = "115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 UBOOT_MACHINE = "j721e_evm_a72_config"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index d0970948..0c6b8503 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62axx"
 
 MACHINE_FEATURES += "screen touchscreen"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62A is for HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
index d37d4673..4601603c 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62xx"
 
 MACHINE_FEATURES += "screen touchscreen"
 
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62x LP is for HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index af6a6db4..953128cc 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am62xx"
 
 MACHINE_FEATURES += "screen gpu"
 
-SERIAL_CONSOLES = "115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on AM62x is for HS-FS
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 157bf5d5..c486f3c1 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -1,9 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":am64xx"
 
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am642"
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 564d61b0..b848881c 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -3,9 +3,6 @@ SOC_FAMILY:append = ":am65xx"
 
 MACHINE_FEATURES += "screen touchscreen gpu"
 
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 93bcea76..5c3c771a 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -53,3 +53,6 @@ MACHINE_FEATURES += "efi"
 WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
+
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index b17b65b7..dff1da69 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/j7200.inc
 
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 KERNEL_DEVICETREE_PREFIX = "ti/k3-j7200"
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index f602a77b..8682ad60 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/j721e.inc
 
-SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721e \
     ti/k3-j7200-mcspi-loopback \
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 1f54c7b1..a16e744d 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/j721s2.inc
 
-SERIAL_CONSOLES = "115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 8fa98440..085c91e7 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/j721s2.inc
 
-SERIAL_CONSOLES = "115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
-
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 53bb4e4f..c0483505 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/j784s4.inc
 
-SERIAL_CONSOLES = "115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 1c56f55a..4deb0f8b 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/j784s4.inc
 
-SERIAL_CONSOLES = "115200;ttyS2"
-SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
 OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
-- 
2.39.2


