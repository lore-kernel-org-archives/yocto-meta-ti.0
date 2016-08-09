Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE83CE00E50; Mon,  8 Aug 2016 19:08:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.15 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3600 seconds by postgrey-1.32 at yocto-www;
	Mon, 08 Aug 2016 19:08:30 PDT
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A878BE00E48
	for <meta-ti@yoctoproject.org>; Mon,  8 Aug 2016 19:08:30 -0700 (PDT)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBM007QRB5M5F70@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 08 Aug 2016 20:08:11 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=MGR6_c9jQ9qH82C0CLkA:9
Received: by 100.15.86.14 with SMTP id 6efad846; Tue, 09 Aug 2016 01:08:11 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 930201620E0;	Mon,  8 Aug 2016 21:08:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 08 Aug 2016 21:08:09 -0400
Message-id: <1470704889-16424-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] machines: drop tar.gz images in favor of tar.xz
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
X-List-Received-Date: Tue, 09 Aug 2016 02:08:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf | 2 +-
 conf/machine/am437x-evm.conf | 2 +-
 conf/machine/am57xx-evm.conf | 2 +-
 conf/machine/dra7xx-evm.conf | 2 +-
 conf/machine/k2e-evm.conf    | 2 +-
 conf/machine/k2g-evm.conf    | 2 +-
 conf/machine/k2hk-evm.conf   | 2 +-
 conf/machine/k2l-evm.conf    | 2 +-
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
-- 
2.7.4


