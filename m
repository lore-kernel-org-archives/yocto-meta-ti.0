Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBFFC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 21:40:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.3258.1659390011070928705
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 14:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TbOCSdA7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 271Le9TA036092;
	Mon, 1 Aug 2022 16:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659390009;
	bh=y5oYFujOv28w3jIC057dqDckiLiNNcdssF9qJGsQkIc=;
	h=From:To:CC:Subject:Date;
	b=TbOCSdA75Iiz7HMH7Qf64xLxmhj2lv4R63LfKDC9MXXF3YexNu8J9IOuwpfZ6yeAD
	 MloTtkgX92oDXgG/CP1c2NFpo4aOW/KbGGs1F3PE6tLoY1jSwvpXabbUb2FvNdavOr
	 613MvL+3vTlIm6jeXeRAFPtEUy2lnY0Z0wn4A9KE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 271Le9Cf015849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Aug 2022 16:40:09 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Aug 2022 16:40:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Aug 2022 16:40:09 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 271Le78g035718;
	Mon, 1 Aug 2022 16:40:08 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/4] conf: machine: Make multi-certificate
 image the default
Date: Mon, 1 Aug 2022 16:40:04 -0500
Message-ID: <20220801214007.25463-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Aug 2022 21:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14914

Only the first two K3 devices do not support multi-cert boot so
lets make multi-cert the default and only add back sysfw.itb
for these two devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/include/am62xx.inc | 3 ---
 conf/machine/include/am64xx.inc | 3 ---
 conf/machine/include/am65xx.inc | 5 ++++-
 conf/machine/include/j7.inc     | 2 --
 conf/machine/include/k3.inc     | 5 +----
 conf/machine/j7-evm.conf        | 3 +++
 conf/machine/j7-hs-evm.conf     | 1 -
 conf/machine/j7200-evm.conf     | 3 ---
 conf/machine/j721s2-evm.conf    | 3 ---
 9 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index 0364edd1..0231235f 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -8,9 +8,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 TFA_K3_SYSTEM_SUSPEND = "1"
 
-# AM62 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 8e8e146f..930fba08 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -14,9 +14,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm-nand.dtbo \
 "
 
-# AM64 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 1898f19c..b70d212f 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -22,9 +22,12 @@ KERNEL_DEVICETREE = " \
 
 BBMULTICONFIG += "k3r5-sr2"
 
-# Use default IMAGE_BOOT_FILES_LEGACY files
+# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
+IMAGE_BOOT_FILES += "sysfw.itb"
+
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
 IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
+
 do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 
diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
index d3eda1a8..c187f299 100644
--- a/conf/machine/include/j7.inc
+++ b/conf/machine/include/j7.inc
@@ -4,8 +4,6 @@ SOC_FAMILY_append = ":j7"
 OPTEEMACHINE = "k3-j721e"
 OPTEEOUTPUTMACHINE = "k3"
 
-# Use default IMAGE_BOOT_FILES_LEGACY files
-
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "j721e j7200"
 TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index f85e6b98..24741dee 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -41,10 +41,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
-IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
-
-IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
 
 WKS_FILE ?= "sdimage-2part.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1f47f00c..514695d6 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -9,6 +9,9 @@ MACHINE_FEATURES += "gpu"
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
+IMAGE_BOOT_FILES += "sysfw.itb"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-proc-board-tps65917.dtb \
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index ece0d85e..5cb2a3cd 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -20,7 +20,6 @@ UBOOT_SYMLINK = "u-boot.img"
 
 BBMULTICONFIG += "k3r5-sr1-1"
 
-# Use default IMAGE_BOOT_FILES_LEGACY files
 # Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
 IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index 2565c90c..c8a03a7b 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -13,8 +13,5 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
 
-# J7200 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index 8cf3a414..ba5e8def 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -18,8 +18,5 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
-# J721S2 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.36.1


