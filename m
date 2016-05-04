Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6B03E00870; Wed,  4 May 2016 10:41:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4A38E007EF
	for <meta-ti@yoctoproject.org>; Wed,  4 May 2016 10:40:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B0807529E8; Wed,  4 May 2016 17:40:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160504174058.B0807529E8@arago-project.org>
Date: Wed,  4 May 2016 17:40:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: configure all used consoles regardless of UART driver
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
X-List-Received-Date: Wed, 04 May 2016 17:41:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d236f27110a27598fa727c09f0bc71a037a0a563
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d236f27110a27598fa727c09f0bc71a037a0a563

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed May  4 23:15:15 2016 +0000

machines: configure all used consoles regardless of UART driver

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am437x-evm.conf |    4 +++-
 conf/machine/am57xx-evm.conf |    4 +++-
 conf/machine/dra7xx-evm.conf |    4 +++-
 conf/machine/k2e-evm.conf    |    4 +++-
 conf/machine/k2g-evm.conf    |    4 +++-
 conf/machine/k2hk-evm.conf   |    4 +++-
 conf/machine/k2l-evm.conf    |    4 +++-
 7 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 16f7cd8..e4f237a 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -11,7 +11,9 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index cd3adc9..5d6bf09 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -8,7 +8,9 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyO2"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 UBOOT_MACHINE = "am57xx_evm_config"
 
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index b1e34ab..03efa19 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,7 +8,9 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 UBOOT_MACHINE = "dra7xx_evm_config"
 
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index e531f71..0735357 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -10,7 +10,9 @@ BOOT_MONITOR_MAKE_TARGET = "k2e"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 00234a4..125a949 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -12,7 +12,9 @@ BOOT_MONITOR_MAKE_TARGET = "k2g"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index f9954d3..d375b24 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -10,7 +10,9 @@ BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 SYSVINIT_ENABLED_GETTYS = ""
 
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index a94be5a..c7b712b 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -10,7 +10,9 @@ BOOT_MONITOR_MAKE_TARGET = "k2l"
 
 IMAGE_FSTYPES += "ubi tar.gz tar.xz cpio"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLE = ""
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 SYSVINIT_ENABLED_GETTYS = ""
 


