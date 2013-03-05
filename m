Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4192CE014C5
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2013 14:11:31 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ7001CGKAG9AE8@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 05 Mar 2013 16:11:17 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A258C204AB; Tue,
	05 Mar 2013 17:11:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 05 Mar 2013 17:10:31 -0500
Message-id: <1362521433-9996-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1362521433-9996-1-git-send-email-denis@denix.org>
References: <1362521433-9996-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/5] omap4, pandaboard: unify and cleanup configs
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
X-List-Received-Date: Tue, 05 Mar 2013 22:11:31 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Centralize common/SoC settings in omap4.inc SOC_FAMILY config.
* Set/override uncommon specifics in machine configs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/omap4.inc | 2 ++
 conf/machine/pandaboard.conf   | 6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index 5ee5f9d..cf71be1 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -17,6 +17,8 @@ MACHINE_KERNEL_PR = "r1"
 
 KERNEL_IMAGETYPE = "uImage"
 
+UBOOT_MACHINE = "omap4_panda_config"
+
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 3ebd6d9..b3d0399 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/omap4.inc
 
-UBOOT_MACHINE = "omap4_panda_config"
-
 GUI_MACHINE_CLASS = "bigscreen"
 
 IMAGE_FSTYPES += "tar.bz2"
@@ -13,6 +11,4 @@ IMAGE_FSTYPES += "tar.bz2"
 SERIAL_CONSOLE = "115200 ttyO2"
 
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen touchscreen usbgadget usbhost vfat sgx"
-
-
+MACHINE_FEATURES = "kernel26 wifi bluetooth alsa apm ext2 screen usbgadget usbhost vfat sgx"
-- 
1.8.1.5


