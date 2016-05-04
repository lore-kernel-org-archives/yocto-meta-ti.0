Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B1F6E00870; Wed,  4 May 2016 10:15:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 091D4E00791
	for <meta-ti@yoctoproject.org>; Wed,  4 May 2016 10:15:37 -0700 (PDT)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6N009L0X9FE800@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 04 May 2016 12:15:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=m4SCPRQokZ5D3auuPDkA:9
Received: by 100.15.86.14 with SMTP id 02b530fa; Wed, 04 May 2016 17:15:21 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7CD05161FC8;	Wed,
	4 May 2016 13:15:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 04 May 2016 13:15:15 -0400
Message-id: <1462382115-29542-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] machines: configure all used consoles regardless of UART driver
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
X-List-Received-Date: Wed, 04 May 2016 17:15:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-evm.conf | 4 +++-
 conf/machine/am57xx-evm.conf | 4 +++-
 conf/machine/dra7xx-evm.conf | 4 +++-
 conf/machine/k2e-evm.conf    | 4 +++-
 conf/machine/k2g-evm.conf    | 4 +++-
 conf/machine/k2hk-evm.conf   | 4 +++-
 conf/machine/k2l-evm.conf    | 4 +++-
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
 
-- 
2.2.0


