Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14291E00CF4; Wed,  8 May 2019 21:15:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87062E00963
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2019 21:14:59 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C12F940BB7;
	Thu,  9 May 2019 04:14:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id u3GxY22x7LKl; Thu,  9 May 2019 04:14:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A887E40BAA;
	Thu,  9 May 2019 04:14:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7C66A16EAB5;
	Thu,  9 May 2019 00:14:56 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  9 May 2019 00:14:53 -0400
Message-Id: <1557375295-41687-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/3] conf/machine: introduce am65xx SOC family and new am65xx-hs-evm
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
X-List-Received-Date: Thu, 09 May 2019 04:15:01 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf    |  7 +------
 conf/machine/am65xx-hs-evm.conf | 23 +++++++++++++++++++++++
 conf/machine/include/am65xx.inc |  7 +++++++
 3 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 conf/machine/am65xx-hs-evm.conf
 create mode 100644 conf/machine/include/am65xx.inc

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 877b1a6..1113dbc 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: AM65xx EVM
 #@DESCRIPTION: Machine configuration for the TI AM65xx EVM
 
-require conf/machine/include/k3.inc
+require conf/machine/include/am65xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
@@ -28,8 +28,3 @@ WKS_FILE = "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES = "u-boot.img"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "am65xx"
-TI_PDK_LIMIT_BOARDS = "am65xx_evm am65xx_idk"
-TI_PDK_LIMIT_CORES = "mcu1_0 mpu1_0"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
new file mode 100644
index 0000000..1de37cf
--- /dev/null
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@NAME: AM65xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
+
+require conf/machine/am65xx-evm.conf
+
+UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+SPL_BINARY = "tispl.bin_HS"
+SPL_BINARYNAME = "tispl.bin"
+UBOOT_BINARY = "u-boot.img_HS"
+IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
+
+OPTEEMACHINE = "k3"
+OPTEEFLAVOR = "am65x"
+OPTEEOUTPUTMACHINE = "k3"
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
new file mode 100644
index 0000000..d433ed1
--- /dev/null
+++ b/conf/machine/include/am65xx.inc
@@ -0,0 +1,7 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY_append = ":am65xx"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am65xx"
+TI_PDK_LIMIT_BOARDS = "am65xx_evm am65xx_idk"
+TI_PDK_LIMIT_CORES = "mcu1_0 mpu1_0"
-- 
2.7.4


