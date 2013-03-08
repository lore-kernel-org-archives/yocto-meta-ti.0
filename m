Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 705A9E01587
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2013 13:18:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DAFB152ABC; Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130308211818.DAFB152ABC@arago-project.org>
Date: Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap4, pandaboard: unify and cleanup configs
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
X-List-Received-Date: Fri, 08 Mar 2013 21:18:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 7251d2309b9e691188dd2e66b6468923b1dcffec
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7251d2309b9e691188dd2e66b6468923b1dcffec

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 16:28:30 2013 -0500

omap4, pandaboard: unify and cleanup configs

* Centralize common/SoC settings in omap4.inc SOC_FAMILY config.
* Set/override uncommon specifics in machine configs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap4.inc |    2 ++
 conf/machine/pandaboard.conf   |    6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index ecd23c4..6e90985 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -20,6 +20,8 @@ MACHINE_KERNEL_PR = "r1"
 
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


