Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E8E0E01456
	for <meta-ti@yoctoproject.org>; Sun, 17 Feb 2013 12:41:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id F184252A15; Sun, 17 Feb 2013 20:41:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130217204137.F184252A15@arago-project.org>
Date: Sun, 17 Feb 2013 20:41:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : linux-mainline 3.2: update beagleboard defconfig
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
X-List-Received-Date: Sun, 17 Feb 2013 20:41:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 544a96c93537e58c6dfb7a81f7af805d42114233
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=544a96c93537e58c6dfb7a81f7af805d42114233

Author: Peter A. Bigot <pab@pabigot.com>
Date:   Thu Dec  6 12:04:15 2012 -0600

linux-mainline 3.2: update beagleboard defconfig

Link the TLC59108 driver statically so ULCD7 initialization occurs
automatically as it did before f0e2305c7e1 which removed the initialization
from u-boot.  (Angstrom-v2012.12 does not include this module by default.)

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-mainline-3.2/beagleboard/defconfig |    2 +-
 recipes-kernel/linux/linux-mainline_3.2.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig b/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
index eaf9548..28f096c 100644
--- a/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
@@ -2907,7 +2907,7 @@ CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_GENERIC=y
 # CONFIG_BACKLIGHT_ADP8860 is not set
 # CONFIG_BACKLIGHT_ADP8870 is not set
-CONFIG_BACKLIGHT_TLC59108=m
+CONFIG_BACKLIGHT_TLC59108=y
 
 #
 # Display device support
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index bc0a145..7eafdfa 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -10,7 +10,7 @@ PV = "3.2.28"
 SRCREV_pn-${PN} = "1f873aca1c7aa7a574b276c040d304d16f1dbfa4"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 


