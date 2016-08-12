Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00E99E00C2B; Fri, 12 Aug 2016 16:22:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93B4BE00A7F
	for <meta-ti@yoctoproject.org>; Fri, 12 Aug 2016 16:22:03 -0700 (PDT)
Received: from vz-proxy-m003.mx.aol.com ([64.236.83.2])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBT00I1TKVV6S10@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Aug 2016 18:21:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=EDCZS3Slg7tGr17y9w9vtg==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=K5ciuoNkWLDvwNsHRwQA:9
Received: by 100.15.86.14 with SMTP id 57facb7b; Fri, 12 Aug 2016 23:21:46 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 54E181620C3;	Fri, 12 Aug 2016 19:21:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Aug 2016 19:21:31 -0400
Message-id: <1471044091-17277-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] machine/k2*-evm: disable uncompressed cpio by default
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
X-List-Received-Date: Fri, 12 Aug 2016 23:22:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Let distro decide which image can be initramfs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/k2e-evm.conf  | 2 +-
 conf/machine/k2g-evm.conf  | 2 +-
 conf/machine/k2hk-evm.conf | 2 +-
 conf/machine/k2l-evm.conf  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 84f0bfb..9b54639 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2e_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2e"
 
-IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index e633e0f..cc4f210 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2g_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2g"
 
-IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index 9e66116..eec52d6 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2hk_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2hk"
 
-IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 0ced976..d8d3944 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -10,7 +10,7 @@ UBOOT_MACHINE = "k2l_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2l"
 
-IMAGE_FSTYPES += "ubifs ubi tar.xz cpio"
+IMAGE_FSTYPES += "ubifs ubi tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-- 
2.7.4


