Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8332AE00D91; Wed, 25 May 2016 15:20:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP,
	but had no rDNS
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE8D4E00D78
	for <meta-ti@yoctoproject.org>; Wed, 25 May 2016 15:20:01 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7R006EB7CXOYK0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 25 May 2016 17:19:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=MGR6_c9jQ9qH82C0CLkA:9
Received: by 100.15.86.14 with SMTP id 7063703f; Wed, 25 May 2016 22:19:45 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B83F5162015;	Wed,
	25 May 2016 18:19:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 25 May 2016 18:19:44 -0400
Message-id: <1464214784-8296-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] machine: explicitly list ubifs in IMAGE_FSTYPES, so RM_OLD_IMAGE works
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
X-List-Received-Date: Wed, 25 May 2016 22:20:04 -0000

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
index 5b5d48d..0936a9c 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0 115200;ttyS3 115200;ttyO3"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 9003535..4a86e00 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 5d6bf09..7dbc088 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 03efa19..6c69683 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index eef9583..a1970e6 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2e_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2e"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 125a949..c09fa48 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2g_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2g"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 4c33f37..3c3c957 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2hk_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index cf540f4..a5b0706 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2l_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2l"
 
-IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz cpio"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-- 
2.2.0


