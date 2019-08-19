Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC0BAE00B57; Mon, 19 Aug 2019 15:18:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E58B4E00B1B
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 15:18:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 47E3940BE8;
	Mon, 19 Aug 2019 22:18:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2Njlal4IkcDT; Mon, 19 Aug 2019 22:18:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 262E340BC0;
	Mon, 19 Aug 2019 22:18:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EFAD5172E7B;
	Mon, 19 Aug 2019 18:18:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 19 Aug 2019 18:18:18 -0400
Message-Id: <1566253099-50583-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] conf/machine: update with new DTBs/DTBOs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Aug 2019 22:18:24 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf   | 1 +
 conf/machine/include/ti33x.inc | 3 ++-
 conf/machine/j7-evm.conf       | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 83eae59..27bb0b0 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -16,6 +16,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-csi2-ov5640.dtbo \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am654-base-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 8ddae81..28d0972 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -30,8 +30,9 @@ KERNEL_DEVICETREE = " \
     am335x-evm.dtb am335x-evmsk.dtb \
     am335x-icev2.dtb am335x-icev2-prueth.dtb \
     am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
-    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb \
+    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
+    am335x-boneblack-prusuart.dtb am335x-sancloud-bbe \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1cb9aff..ca594e8 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -28,9 +28,9 @@ OPTEEOUTPUTMACHINE = "k3"
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 WKS_FILE = "sdimage-bootpart.wks"
 
+do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
+
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "j721e"
 TI_PDK_LIMIT_BOARDS = "j721e_evm"
 TI_PDK_LIMIT_CORES = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mpu2_1 mpu3_0 mpu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
-
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
-- 
2.7.4


