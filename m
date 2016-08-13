Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45C74E00C4D; Fri, 12 Aug 2016 17:05:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E30F0E00C44
	for <meta-ti@yoctoproject.org>; Fri, 12 Aug 2016 17:05:52 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E9C2952AC0; Sat, 13 Aug 2016 00:05:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160813000550.E9C2952AC0@arago-project.org>
Date: Sat, 13 Aug 2016 00:05:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machine/k2*-evm: disable uncompressed cpio by default
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
X-List-Received-Date: Sat, 13 Aug 2016 00:05:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 40e6a592838864c60ec5baf1be362735e59ef48a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=40e6a592838864c60ec5baf1be362735e59ef48a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 13 05:21:31 2016 +0000

machine/k2*-evm: disable uncompressed cpio by default

Let distro decide which image can be initramfs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2e-evm.conf  |    2 +-
 conf/machine/k2g-evm.conf  |    2 +-
 conf/machine/k2hk-evm.conf |    2 +-
 conf/machine/k2l-evm.conf  |    2 +-
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


