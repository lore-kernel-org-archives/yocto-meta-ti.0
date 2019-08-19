Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F8D9E00BEB; Mon, 19 Aug 2019 16:58:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24171E00B3E
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 16:58:21 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JNwLlt046995
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 18:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566259101;
	bh=OhQPEv5pogDuA8JVDwMtJzwVxQSvf7Lm0seW88wruTs=;
	h=From:To:CC:Subject:Date;
	b=OZSgwAVAmixbSjM+aD7t9MlE9jyBwwh+hqrsPrWov8S283wpPDUjCs0pvrkW7COH5
	WHFEq8cncnareE30lpAajJkEmSeFyOxMlbN4la6Moypj9t4lDWFyJxHcCoNmN+SLPg
	o9lSiCBDikzJwxudlHap+PwruMaHlFCxFOLN02EU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JNwLHB048303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 18:58:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 18:58:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 19 Aug 2019 18:58:21 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JNwKK6110386;
	Mon, 19 Aug 2019 18:58:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Aug 2019 23:44:00 +0000
Message-ID: <20190819234400.18819-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 1/2] conf/machine: update with new DTBs/DTBOs
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
X-List-Received-Date: Mon, 19 Aug 2019 23:58:23 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - fix missing .dtb suffix in sancloud-bbe

 conf/machine/am65xx-evm.conf   | 1 +
 conf/machine/include/ti33x.inc | 3 ++-
 conf/machine/j7-evm.conf       | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 83eae598..27bb0b06 100644
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
index 8ddae81c..5ff6efea 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -30,8 +30,9 @@ KERNEL_DEVICETREE = " \
     am335x-evm.dtb am335x-evmsk.dtb \
     am335x-icev2.dtb am335x-icev2-prueth.dtb \
     am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
-    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb \
+    am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
+    am335x-boneblack-prusuart.dtb am335x-sancloud-bbe.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1cb9aff5..ca594e81 100644
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
2.17.1


