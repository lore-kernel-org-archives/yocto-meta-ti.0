Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB7EAE007A2; Fri, 29 Aug 2014 09:55:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65FD8E00781
	for <meta-ti@yoctoproject.org>; Fri, 29 Aug 2014 09:55:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0E7DB52A51; Fri, 29 Aug 2014 16:55:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140829165534.0E7DB52A51@arago-project.org>
Date: Fri, 29 Aug 2014 16:55:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machine: clean up MACHINE_FEATURES for omap5, dra7, am57
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
X-List-Received-Date: Fri, 29 Aug 2014 16:55:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e13e44b1d682efc386f47a072634d8ebed1fed21
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e13e44b1d682efc386f47a072634d8ebed1fed21

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug 26 20:59:58 2014 +0000

machine: clean up MACHINE_FEATURES for omap5, dra7, am57

* Enable "sgx" feature on all - the driver may still be missing, but GLES is
  available from omap5-sgx-ddk-linux package
* Enable "touchscreen" feature only on dra7 and am57 - not available on omap5

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 conf/machine/am57xx-evm.conf      |    6 ++----
 conf/machine/dra7xx-evm.conf      |    6 ++----
 conf/machine/include/omap-a15.inc |    5 ++++-
 conf/machine/omap5-evm.conf       |    4 ----
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


