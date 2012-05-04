Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3870E0070C
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 17:07:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1E5B752A78; Fri,  4 May 2012 00:07:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120504000735.1E5B752A78@arago-project.org>
Date: Fri,  4 May 2012 00:07:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beagleboard: switch to linux-mainline and drag in more modules
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 00:07:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: aaf625eb50f9a290a7250b8009beae7e050390dd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aaf625eb50f9a290a7250b8009beae7e050390dd

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  1 21:06:49 2012 +0200

beagleboard: switch to linux-mainline and drag in more modules

also bump MACHINE_KERNEL_PR to force rebuild of external modules like sgx and dsp.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beagleboard.conf  |    5 ++++-
 conf/machine/include/omap3.inc |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 0043a70..a9029d1 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -17,7 +17,7 @@ require conf/machine/include/omap3.inc
 # SPL build
 EXTRA_IMAGEDEPENDS = "u-boot"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp "
@@ -46,3 +46,6 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 
 # and sdio
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+
+# For a modularized kernel we want to drag in networking, sound, rtc etc."
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 9903856..c5b1979 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r119"
+MACHINE_KERNEL_PR = "r120"
 
 KERNEL_IMAGETYPE = "uImage"
 


