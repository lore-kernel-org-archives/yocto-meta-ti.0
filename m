Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00577E00655
	for <meta-ti@yoctoproject.org>; Wed, 24 Oct 2012 18:01:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0C27552A43; Thu, 25 Oct 2012 01:01:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121025010142.0C27552A43@arago-project.org>
Date: Thu, 25 Oct 2012 01:01:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Nicolas Dechesne : pandaboard: use xf86-video-omap by default in XSERVER config
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
X-List-Received-Date: Thu, 25 Oct 2012 01:01:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 95e12712ddffcc7ec0789a8700137afe2e449445
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=95e12712ddffcc7ec0789a8700137afe2e449445

Author: Nicolas Dechesne <n-dechesne@ti.com>
Date:   Fri Oct 19 15:51:26 2012 +0200

pandaboard: use xf86-video-omap by default in XSERVER config

Also we need to pull in module-exa as xf86-video-omap relies
on it, at run time.

And replaced the default xorg.conf for 'omap4' machine to take
new driver into account. Do not enable HWcursor (e.g. mouse
using DSS overlay) to keep things simple for now..

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Hervé Fache <h-fache@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap4.inc                     |    3 +-
 .../xserver-xf86-config/omap4/xorg.conf            |   44 +++++++-------------
 2 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index 96eaae7..ecd23c4 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -11,8 +11,9 @@ XSERVER = "xserver-xorg \
            xserver-xorg-extension-dri \
            xserver-xorg-extension-dri2 \
            xserver-xorg-extension-glx \
+           xserver-xorg-module-exa \
            xf86-input-evdev \
-           xf86-video-fbdev" 
+           xf86-video-omap"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r1"
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf
index 0d6ab43..87ded4d 100644
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf
@@ -1,29 +1,15 @@
-Section "Module"                                       
-        Load    "extmod"                                
-        Load    "dbe"                           
-        Load    "glx"                                           
-        Load    "freetype"                             
-        Load    "type1"                        
-        Load    "record"                    
-        Load    "dri"                       
-EndSection                            
-
-Section "Monitor"                                                                    
-        Identifier      "Builtin Default Monitor"
-EndSection                                       
-
-Section "Device"                                  
-        Identifier      "Builtin Default fbdev Device 0"
-        Driver  "fbdev"
-EndSection                                                
-
-Section "Screen"                                        
-        Identifier      "Builtin Default fbdev Screen 0"     
-        Device  "Builtin Default fbdev Device 0"            
-        Monitor "Builtin Default Monitor"               
-EndSection                                              
-
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Builtin Default fbdev Screen 0"        
-EndSection                                              
+# more /usr/share/X11/xorg.conf.d/99-omap.conf 
+# X.Org X server configuration file
+
+Section "Device"
+        Identifier      "Video Device"
+        Driver          "omap"
+        Option          "Debug"         "false"
+        Option          "HWcursor"      "false"
+EndSection
+
+Section "Screen"
+        Identifier      "Screen"
+        Monitor         "Monitor"
+        Device          "Video Device"
+EndSection


