Return-Path: <alessio.bogani@elettra.eu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 518A5E00D88; Mon, 26 Aug 2019 13:27:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [140.105.206.208 listed in list.dnswl.org]
X-Greylist: delayed 288 seconds by postgrey-1.32 at yocto-www;
	Mon, 26 Aug 2019 13:27:53 PDT
Received: from spamalot.elettra.eu (spamalot.elettra.trieste.it
	[140.105.206.208])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E6B9E00C5C
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2019 13:27:53 -0700 (PDT)
Received: from spamalot.elettra.eu (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	3A975440DE3_D643FA7B
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2019 20:23:03 +0000 (GMT)
Received: from pc-bogani.elettra.trieste.it (pc-bogani.elettra.trieste.it
	[192.168.205.85])
	by spamalot.elettra.eu (Sophos Email Appliance) with ESMTP id
	31A9643E31F_D643FA5F; Mon, 26 Aug 2019 20:23:01 +0000 (GMT)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: meta-ti@yoctoproject.org
Date: Mon, 26 Aug 2019 22:22:59 +0200
Message-Id: <20190826202259.9753-1-alessio.bogani@elettra.eu>
X-Mailer: git-send-email 2.17.1
X-SASI-RCODE: 200
Subject: [PATCH] am65xx-evm, beagle-x15, beaglebone, j7-evm, lego-ev3: Let user optionally override kickstarter files
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
X-List-Received-Date: Mon, 26 Aug 2019 20:27:56 -0000

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 conf/machine/am65xx-evm.conf | 2 +-
 conf/machine/beagle-x15.conf | 2 +-
 conf/machine/beaglebone.conf | 2 +-
 conf/machine/j7-evm.conf     | 2 +-
 conf/machine/lego-ev3.conf   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 27bb0b06..bd57c485 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -29,6 +29,6 @@ OPTEEOUTPUTMACHINE = "k3"
 # tiboot3.bin and sysfw.itb, which are provided by meta-arago
 # u-boot-k3-r5 and ti-sci-fw recipes
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-WKS_FILE = "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-bootpart.wks"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
index 275a5ce0..1386ff05 100644
--- a/conf/machine/beagle-x15.conf
+++ b/conf/machine/beagle-x15.conf
@@ -12,7 +12,7 @@ SERIAL_CONSOLES = "115200;ttyS2"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
-WKS_FILE = "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES = "MLO u-boot.img"
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 450a1893..69db4215 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,7 +13,7 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-WKS_FILE = "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-bootpart.wks"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY}"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index ca594e81..98a4258b 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -26,7 +26,7 @@ OPTEEOUTPUTMACHINE = "k3"
 # tiboot3.bin and sysfw.itb, which are provided by meta-arago
 # u-boot-k3-r5 and ti-sci-fw recipes
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-WKS_FILE = "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-bootpart.wks"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
 
diff --git a/conf/machine/lego-ev3.conf b/conf/machine/lego-ev3.conf
index 5c425221..5b89a6a7 100644
--- a/conf/machine/lego-ev3.conf
+++ b/conf/machine/lego-ev3.conf
@@ -17,6 +17,6 @@ KERNEL_DEVICETREE_BUNDLE = "1"
 SERIAL_CONSOLES = "115200;ttyS1"
 
 IMAGE_FSTYPES += " wic"
-WKS_FILE = "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-bootpart.wks"
 WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPES}"
-- 
2.17.1


