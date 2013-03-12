Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7629BE0071D
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 14:50:48 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJK000VYI0EXI00@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Mar 2013 16:50:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C61520033; Tue,
	12 Mar 2013 17:50:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 12 Mar 2013 17:50:34 -0400
Message-id: <1363125034-6501-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] machines: unify all machines to produce tar.gz instead of tar.bz2 by default
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
X-List-Received-Date: Tue, 12 Mar 2013 21:50:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beaglebone.conf   | 2 +-
 conf/machine/keystone-evm.conf | 2 +-
 conf/machine/omap3evm.conf     | 2 +-
 conf/machine/pandaboard.conf   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index dc77dd7..f4112f5 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -9,7 +9,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index a2c05f8..c878d52 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/keystone.inc
 
-IMAGE_FSTYPES += "ubi tar.bz2 cpio"
+IMAGE_FSTYPES += "ubi tar.gz cpio"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index a793798..584866c 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -9,7 +9,7 @@ XSERVER += "xf86-input-tslib"
 GUI_MACHINE_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
-IMAGE_FSTYPES += "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index b3d0399..1707f80 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap4.inc
 
 GUI_MACHINE_CLASS = "bigscreen"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO2"
 
-- 
1.8.1.5


