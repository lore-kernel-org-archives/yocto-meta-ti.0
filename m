Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A6E2E00498
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 13:15:11 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAFLF9e2008773
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 15:15:10 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFLF8mx029124
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 02:45:08 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 16 Nov 2012 02:45:07 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFLF4Yc005286;
	Fri, 16 Nov 2012 02:45:06 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Nov 2012 15:15:03 -0600
Message-ID: <1353014103-13763-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] AMSDK machines: Update the FSTYPES for AMSDK machines
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
X-List-Received-Date: Thu, 15 Nov 2012 21:15:11 -0000
Content-Type: text/plain

* Updated the IMAGE_FSTYPES to ubi and tar.gz for the AMSDK
  machine types as the base file system type.
* This was done to speed up compression/decompression time at
  the expense of file size.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/am180x-evm.conf  |    2 ++
 conf/machine/am335x-evm.conf  |    2 +-
 conf/machine/am3517-evm.conf  |    2 +-
 conf/machine/am37x-evm.conf   |    2 +-
 conf/machine/am387x-evm.conf  |    2 ++
 conf/machine/am389x-evm.conf  |    2 ++
 conf/machine/beagleboard.conf |    2 +-
 7 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index fb57f6e..827885b 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -9,6 +9,8 @@ UBOOT_MACHINE = "da850evm_config"
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
 
+IMAGE_FSTYPES += "tar.gz ubi"
+
 MACHINE_FEATURES = "kernel26 serial ethernet"
 
 SERIAL_CONSOLE = "115200 ttyS2"
diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index e7ddd0b..e86c41b 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -12,7 +12,7 @@ GUI_MACHINE_CLASS = "smallscreen"
 
 require conf/machine/include/ti33x.inc
 
-IMAGE_FSTYPES += "ubi tar.bz2"
+IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index b3efa9a..e817069 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES += "ubi tar.bz2"
+IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS2"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index ddb54e8..9a1acb4 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES += "jffs2 tar.bz2"
+IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/am387x-evm.conf b/conf/machine/am387x-evm.conf
index ebf9889..5d9cc8f 100644
--- a/conf/machine/am387x-evm.conf
+++ b/conf/machine/am387x-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the AM389x evm
 
 require conf/machine/include/ti814x.inc
+
+IMAGE_FSTYPES += "ubi tar.gz"
diff --git a/conf/machine/am389x-evm.conf b/conf/machine/am389x-evm.conf
index 9bfe7a7..2a84cad 100644
--- a/conf/machine/am389x-evm.conf
+++ b/conf/machine/am389x-evm.conf
@@ -3,3 +3,5 @@
 #@DESCRIPTION: Machine configuration for the am389x evm
 
 require conf/machine/include/ti816x.inc
+
+IMAGE_FSTYPES += "ubi tar.gz"
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index a9029d1..b3604a5 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -19,7 +19,7 @@ EXTRA_IMAGEDEPENDS = "u-boot"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
 
-IMAGE_FSTYPES += "tar.bz2 ubi"
+IMAGE_FSTYPES += "tar.gz ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
 
 # Guesswork
-- 
1.7.0.4


