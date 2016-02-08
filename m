Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0DA2E00D95; Mon,  8 Feb 2016 09:30:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0BFDE00C71
	for <meta-ti@yoctoproject.org>; Mon,  8 Feb 2016 09:30:55 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 254A652A79; Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160208173055.254A652A79@arago-project.org>
Date: Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Thomas Perrot : conf: change GUI_MACHINE_CLASS to MACHINE_GUI_CLASS
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
X-List-Received-Date: Mon, 08 Feb 2016 17:31:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: f9dcfafdfc1adce42986cad647cd57d51ed1d158
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f9dcfafdfc1adce42986cad647cd57d51ed1d158

Author: Thomas Perrot <thomas.perrot@tupi.fr>
Date:   Wed Jan 27 23:46:05 2016 +0000

conf: change GUI_MACHINE_CLASS to MACHINE_GUI_CLASS

Correct the name of the variable used to define the size of the logo:
GUI_MACHINE_CLASS renamed MACHINE_GUI_CLASS.

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf      |    2 +-
 conf/machine/am3517-evm.conf      |    2 +-
 conf/machine/am37x-evm.conf       |    2 +-
 conf/machine/am437x-evm.conf      |    2 +-
 conf/machine/beagleboard.conf     |    2 +-
 conf/machine/beaglebone.conf      |    2 +-
 conf/machine/include/omap-a15.inc |    2 +-
 conf/machine/include/omap3.inc    |    2 +-
 conf/machine/include/ti33x.inc    |    2 +-
 conf/machine/include/ti43x.inc    |    2 +-
 conf/machine/omap3evm.conf        |    2 +-
 conf/machine/pandaboard.conf      |    2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 08daa8e..55bbf95 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/ti33x.inc
 
 # Use built-in LCD by default
 XSERVER += "xf86-input-tslib"
-GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubi tar.gz"
diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 7295c1f..4fef634 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap3.inc
 
 # Use built-in LCD by default
 XSERVER += "xf86-input-tslib"
-GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
 IMAGE_FSTYPES += "ubi tar.gz"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 16ce73c..99adb08 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap3.inc
 
 # Use built-in LCD by default
 XSERVER += "xf86-input-tslib"
-GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
 IMAGE_FSTYPES += "ubi tar.gz"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 9ff8944..7d40aec 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/ti43x.inc
 
 # Use built-in LCD by default
 XSERVER += "xf86-input-tslib"
-GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "ubi tar.gz"
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 32985b3..955961f 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/omap3.inc
 
 # Only has DVI connector for external screen
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 IMAGE_FSTYPES += "tar.gz ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp"
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 8a7e52a..bf3d91e 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/ti33x.inc
 
 # Only has DVI connector for external screen
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 IMAGE_FSTYPES += "tar.gz"
 
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 41a2f19..9316998 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -24,7 +24,7 @@ XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-video-fbdev"
 
-GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_GUI_CLASS = "smallscreen"
 
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 0757b43..f83bfa2 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -14,7 +14,7 @@ XSERVER = "xserver-xorg \
            xf86-input-keyboard"
 
 # Default to external video, change to smallscreen for built-in LCD
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r126"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 53f38c9..fa2ead5 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -14,7 +14,7 @@ XSERVER = "xserver-xorg \
            xf86-input-keyboard"
 
 # Default to external video, change to smallscreen for built-in LCD
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r22"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 8c5fa2d..a603059 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -14,7 +14,7 @@ XSERVER = "xserver-xorg \
            xf86-input-keyboard"
 
 # Default to external video, change to smallscreen for built-in LCD
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r3"
diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
index 6bfd808..7051d88 100644
--- a/conf/machine/omap3evm.conf
+++ b/conf/machine/omap3evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/omap3.inc
 
 # Use built-in LCD by default
 XSERVER += "xf86-input-tslib"
-GUI_MACHINE_CLASS = "smallscreen"
+MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen ethernet"
 
 IMAGE_FSTYPES += "jffs2 tar.gz"
diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
index 1707f80..99497c1 100644
--- a/conf/machine/pandaboard.conf
+++ b/conf/machine/pandaboard.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/omap4.inc
 
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 IMAGE_FSTYPES += "tar.gz"
 


