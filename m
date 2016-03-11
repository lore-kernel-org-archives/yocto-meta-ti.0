Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83ECDE00BE2; Fri, 11 Mar 2016 11:10:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E1CDE00B9C
	for <meta-ti@yoctoproject.org>; Fri, 11 Mar 2016 11:10:39 -0800 (PST)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3W003V82L33H90@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 11 Mar 2016 13:10:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=MGR6_c9jQ9qH82C0CLkA:9
Received: by 100.15.86.14 with SMTP id 3430a7f5; Fri, 11 Mar 2016 19:10:16 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7971E161F21;	Fri,
	11 Mar 2016 14:10:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 11 Mar 2016 14:10:14 -0500
Message-id: <1457723414-1386-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] conf/machine: enable tar.xz images for current machines
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
X-List-Received-Date: Fri, 11 Mar 2016 19:10:43 -0000

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
index 9013c7c..78d4fcf 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz"
+IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyO0 115200;ttyO3"
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
 
-- 
2.2.0


