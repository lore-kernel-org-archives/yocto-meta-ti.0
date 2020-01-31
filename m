Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.593.1580495273750746186
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 10:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vsrz4Kug;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VIRrZH062041
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 12:27:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580495273;
	bh=mSbqWWjeCOyGnNZ5PeFszTyz6DcuJf4GXn8PyHa3i3E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vsrz4Kug7rrpgaj2dKLVqhNgKF/1gkjENc2hCW/xSrZXD6f3PgEyvNthw5tXRZrwe
	 4QSp/RUXj4E42mnHRo/uapH8fMha0AKAAfrfuMiAZRKq0jsOXGXogY2QkgsvQO701Y
	 eGWt5/lsVyjaftKU1myJLphDtBkeCFWhiGjlcgFw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VIRrmm083291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 12:27:53 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 12:27:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 12:27:52 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VIRqwH071369;
	Fri, 31 Jan 2020 12:27:52 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH RESEND 2/2] xserver-xf86-config: Remove server-xf86-config xorg.conf configurations
Date: Fri, 31 Jan 2020 13:27:52 -0500
Message-ID: <20200131182752.14386-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131182752.14386-1-afd@ti.com>
References: <20200131182752.14386-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This package adds the xorg.conf needed for some Xorg servers. Xorg does
not need these anymore as the automatic configuration will handle this.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../xserver-xf86-config/omap3/xorg.conf       | 29 -------------------
 .../xserver-xf86-config/omap4/xorg.conf       | 15 ----------
 .../xserver-xf86-config/omapl138/xorg.conf    | 29 -------------------
 .../xserver-xf86-config/ti33x/xorg.conf       | 29 -------------------
 .../xserver-xf86-config_0.1.bbappend          |  1 -
 5 files changed, 103 deletions(-)
 delete mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/omap3/xorg.conf
 delete mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf
 delete mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/omapl138/xorg.conf
 delete mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/ti33x/xorg.conf
 delete mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/omap3/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/omap3/xorg.conf
deleted file mode 100644
index 983bb082..00000000
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config/omap3/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
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
-        Driver  "omapfb"
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
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf
deleted file mode 100644
index 87ded4dd..00000000
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config/omap4/xorg.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-# more /usr/share/X11/xorg.conf.d/99-omap.conf 
-# X.Org X server configuration file
-
-Section "Device"
-        Identifier      "Video Device"
-        Driver          "omap"
-        Option          "Debug"         "false"
-        Option          "HWcursor"      "false"
-EndSection
-
-Section "Screen"
-        Identifier      "Screen"
-        Monitor         "Monitor"
-        Device          "Video Device"
-EndSection
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/omapl138/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/omapl138/xorg.conf
deleted file mode 100644
index 0d6ab435..00000000
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config/omapl138/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
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
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/ti33x/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/ti33x/xorg.conf
deleted file mode 100644
index 0d6ab435..00000000
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config/ti33x/xorg.conf
+++ /dev/null
@@ -1,29 +0,0 @@
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
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
deleted file mode 100644
index 72d991c7..00000000
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
2.17.1

