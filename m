Return-Path: <ndec13@gmail.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D77D0E013F7
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 06:51:57 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9JDpsBk027709
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 08:51:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDpsRZ005793
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 08:51:54 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 19 Oct 2012 08:51:54 -0500
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDpSvB000682;
	Fri, 19 Oct 2012 08:51:54 -0500
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 19 Oct 2012 15:51:26 +0200
Message-ID: <1350654686-22868-4-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
References: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 3/3] pandaboard: use xf86-video-omap by default in XSERVER config
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
X-List-Received-Date: Fri, 19 Oct 2012 13:51:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <n-dechesne@ti.com>

Also we need to pull in module-exa as xf86-video-omap relies
on it, at run time.

And replaced the default xorg.conf for 'omap4' machine to take
new driver into account. Do not enable HWcursor (e.g. mouse
using DSS overlay) to keep things simple for now..

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Hervé Fache <h-fache@ti.com>
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
-- 
1.7.0.4


