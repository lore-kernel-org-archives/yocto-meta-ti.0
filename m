Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50254E00FD4; Wed, 10 Aug 2016 19:33:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59207E00FDA
	for <meta-ti@yoctoproject.org>; Wed, 10 Aug 2016 19:33:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B3FAF52AC0; Thu, 11 Aug 2016 02:33:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160811023324.B3FAF52AC0@arago-project.org>
Date: Thu, 11 Aug 2016 02:33:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: drop tar.gz images in favor of tar.xz
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
X-List-Received-Date: Thu, 11 Aug 2016 02:33:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b0921714087efbf9cc5d7caf1fd55d12a8f68222
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b0921714087efbf9cc5d7caf1fd55d12a8f68222

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug  9 07:08:09 2016 +0000

machines: drop tar.gz images in favor of tar.xz

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
index ed78e50..ab227b0 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0 115200;ttyS3 115200;ttyO3"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 8af6a77..1561602 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 16ce76a..98698e6 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "tar.gz tar.xz"
+IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index a03a7fe..09f758d 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "tar.gz tar.xz"
+IMAGE_FSTYPES += "tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index a1970e6..84f0bfb 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2e_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2e"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 3f0651d..e633e0f 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2g_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2g"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 3c3c957..9e66116 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2hk_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index a5b0706..0ced976 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2l_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2l"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"


