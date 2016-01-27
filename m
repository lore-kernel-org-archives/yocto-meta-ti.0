Return-Path: <vomegaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B699E007B5; Wed, 27 Jan 2016 09:46:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2D01E0079A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 09:46:09 -0800 (PST)
Received: by mail-wm0-f53.google.com with SMTP id n5so38231080wmn.0
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=oRukextCE4GAg9D2JT2zGFAPU1whnNTBZcZ1e2LLtUI=;
	b=bnsEhSMq4q9Yd1uDAWnb1iuxIqWaq5sWBXK6IJLB6E9OjnUUa79XzEASCqsY4KW0/P
	HfJtkyWdWNRN8iB0KPFzkO3eih7o1pWyNw0mGRbIUXjOMc85UOGzeGRfwJpx0KMcnZKH
	/d0+yyxk0kdrZ7q5lUfyOBiC8//sk4jzcFSkhPKuFGgXkNrxwjH3SgSC7B7WNUIqiFwJ
	Z7yE+GYqVz8kBzhg2ci85qK8jrM6jr2IfI6+dK1SMxu/ULiLdxkH31IP5mmPKMinHs7X
	t2OpYWK67gXxyu+3wTPoAQyq9rISeA5DPQGJWkXIX7wtoDm+WFkqDyUxQ0mTs7Jbg2B5
	cL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=oRukextCE4GAg9D2JT2zGFAPU1whnNTBZcZ1e2LLtUI=;
	b=RO4LOc+d+SyEtfSSwicY60nqd0aG8jyrlATL8V9ufnMNf65HeCJGo+Uyff1otMsyCB
	swGlf5GYTUgo7eifLesY5Cz2w9dkVax4e2hxdKC/BW4+/fQrWJPIZFTTuMtERMc95Kxe
	ztFKPOphOySRasLncyI/poblnhLHkn1oDOCoeBfaXVKZNomoJn6IojmI6Lu2UtOTCfhf
	TXSLifnlGdI6V1oKUVll0UY3EDsDsX5nVuaJMmbvhHSvMcy4NSqoeb7qRme5cFC+3700
	DXKFDPgzTDxT7mHwCZeGI69RVHu35qs5joprxERBQt41uaemmW6it0ruEBszckcO+OQM
	PIIA==
X-Gm-Message-State: AG10YOSOS9G0JPcOZEddADhaYihFy3y1TdcYPCSQlhyPW2FJOHAZ5tXwQR0QgLahyFbIDQ==
X-Received: by 10.28.65.85 with SMTP id o82mr33018053wma.23.1453916768593;
	Wed, 27 Jan 2016 09:46:08 -0800 (PST)
Received: from sgxcmp131.intra.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id 75sm9346609wmo.22.2016.01.27.09.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 09:46:07 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: meta-ti@yoctoproject.org
Date: Wed, 27 Jan 2016 18:46:05 +0100
Message-Id: <1453916765-5504-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Correct the name of the variable used to define the size of the logo: GUI_MACHINE_CLASS renamed MACHINE_GUI_CLASS.
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
X-List-Received-Date: Wed, 27 Jan 2016 17:46:25 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 conf/machine/am335x-evm.conf      | 2 +-
 conf/machine/am3517-evm.conf      | 2 +-
 conf/machine/am37x-evm.conf       | 2 +-
 conf/machine/am437x-evm.conf      | 2 +-
 conf/machine/beagleboard.conf     | 2 +-
 conf/machine/beaglebone.conf      | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/omap3.inc    | 2 +-
 conf/machine/include/ti33x.inc    | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
 conf/machine/omap3evm.conf        | 2 +-
 conf/machine/pandaboard.conf      | 2 +-
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
 
-- 
2.1.4


