Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36DCCE00809; Tue, 26 Aug 2014 08:00:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D21AE007F6
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 08:00:29 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAX00MVL5NYCB70@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Aug 2014 10:00:09 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9008520088; Tue,
	26 Aug 2014 10:59:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 26 Aug 2014 10:59:58 -0400
Message-id: <1409065198-8468-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] machine: clean up MACHINE_FEATURES for omap5, dra7, am57
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
X-List-Received-Date: Tue, 26 Aug 2014 15:00:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Enable "sgx" feature on all - the driver may still be missing, but GLES is
  available from omap5-sgx-ddk-linux package
* Enable "touchscreen" feature only on dra7 and am57 - not available on omap5

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf      | 6 ++----
 conf/machine/dra7xx-evm.conf      | 6 ++----
 conf/machine/include/omap-a15.inc | 5 ++++-
 conf/machine/omap5-evm.conf       | 4 ----
 4 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 0beed60..25b1647 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/dra7xx.inc
 
+MACHINE_FEATURES += "touchscreen"
+
 IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO2"
@@ -30,7 +32,3 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
-
-# Currently removing the sgx machine feature because there is no SGX package
-# available for omap5
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 7069b44..ba7b440 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/dra7xx.inc
 
+MACHINE_FEATURES += "touchscreen"
+
 IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
@@ -30,7 +32,3 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
-
-# Currently removing the sgx machine feature because there is no SGX package
-# available for omap5
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 3fef64e..d7ddb62 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -5,7 +5,7 @@ DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r4"
+MACHINE_KERNEL_PR = "r5"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
@@ -29,3 +29,6 @@ GUI_MACHINE_CLASS = "smallscreen"
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
 UBI_VOLNAME = "rootfs"
+
+# List common SoC features, may need to add touchscreen for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index ba60e7c..d21abc1 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -30,7 +30,3 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 UBOOT_MACHINE = "omap5_uevm_config"
-
-# Currently removing the sgx machine feature because there is no SGX package
-# available for omap5
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
-- 
2.0.4


