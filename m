Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D8E3E00B9C; Fri, 11 Mar 2016 11:25:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 764F7E00B9C
	for <meta-ti@yoctoproject.org>; Fri, 11 Mar 2016 11:25:42 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 11CA7529D3; Fri, 11 Mar 2016 19:25:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160311192542.11CA7529D3@arago-project.org>
Date: Fri, 11 Mar 2016 19:25:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: enable tar.xz images for current machines
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
X-List-Received-Date: Fri, 11 Mar 2016 19:25:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 7cdb10200b3ae3429fcce5fd7a28973df593c8c1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7cdb10200b3ae3429fcce5fd7a28973df593c8c1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Mar 12 01:10:14 2016 +0000

conf/machine: enable tar.xz images for current machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 conf/machine/am437x-evm.conf |    2 +-
 conf/machine/am57xx-evm.conf |    2 +-
 conf/machine/dra7xx-evm.conf |    2 +-
 conf/machine/k2e-evm.conf    |    2 +-
 conf/machine/k2g-evm.conf    |    2 +-
 conf/machine/k2hk-evm.conf   |    2 +-
 conf/machine/k2l-evm.conf    |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 5b3481f..ac643b4 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 7d40aec..16f7cd8 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index e32b98f..cd3adc9 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = "115200 ttyO2"
 
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 986b8e2..b1e34ab 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 551587f..e531f71 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -8,7 +8,7 @@ UBOOT_MACHINE = "k2e_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2e"
 
-IMAGE_FSTYPES += "ubi tar.gz cpio"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 14f286a..00234a4 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2g_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2g"
 
-IMAGE_FSTYPES += "ubi tar.gz cpio"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 3c09a7e..f9954d3 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -8,7 +8,7 @@ UBOOT_MACHINE = "k2hk_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
-IMAGE_FSTYPES += "ubi tar.gz cpio"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 76fb3f8..a94be5a 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -8,7 +8,7 @@ UBOOT_MACHINE = "k2l_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2l"
 
-IMAGE_FSTYPES += "ubi tar.gz cpio"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 


