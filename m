Return-Path: <vomegaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB698E00928; Thu, 28 Jan 2016 00:10:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AC81E00838
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 00:09:58 -0800 (PST)
Received: by mail-wm0-f45.google.com with SMTP id p63so12805494wmp.1
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=rIfwvMojcZK7CYTKOsUJiP8V6i84Ssz+JoNnQC5dteA=;
	b=rhamdNtrgsEbw35s6KLCwofQBVY6obw33374MeQHVVPe0iOuiHFzY07hym/xg7kpVQ
	kFBjBb7edRuw+sdwgkkXgo/0C+E9GETWfJ4a/qq099qPxsiWgy1eOo3fRV8vqOIqeQ1v
	PgE0e14g5GFQEPzk6NBmYsjLy5KklMPUgaWZOlzohckKZDg0bbvc2BcrsvQK18H359rB
	+AFBtjyqLM16FiaK/i0KXOk4sYz38gYUCUbnjtiNnyZ+fkyQT7K7+wtJAXZNnT+MnGtI
	idQfs/CwbRFOyveqzyHykl2bviX82CRmwIgspgdu5OLWyDqrSslK8YWipP/YpANT5dbU
	gXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=rIfwvMojcZK7CYTKOsUJiP8V6i84Ssz+JoNnQC5dteA=;
	b=FWptecJ3GQGYs3kfbY+AnpGoh4CKIvXy6P5g7dD2IkXpsvy286UMqvToy4NXWLJygR
	RfKQ1vOrMQP/Z11aLTb3/PUcswJ0YA0n4g/vQzN2VZOPd8ODYxpgfPHCTrog/PYqGNSU
	WuPPYKJQelIzT008YdXeXECvJE5xAJsQQ1hhBrMGs3G2A7kMUZtxkZli2BvhEOTzlwC6
	VLlq7zqp0BU2cdSkUyUM1zeT+qK9dsiFMF++zOnKEVr2o9EGC3OfhB46/iEavlHSyMfp
	5vEHJAy/QPEOEr2XFEJ7/cTxY0/ksBKl7mQ0vHWkjIDLLd6sMI8pRNfB7OmUuedLY/m4
	i8SA==
X-Gm-Message-State: AG10YOQYUTEcvTfnWc60xxcbZdld9ySDREaXRn7P4U18nSLgQcvtWi+gafxFmLATt9VRDg==
X-Received: by 10.194.234.41 with SMTP id ub9mr1564047wjc.9.1453968597663;
	Thu, 28 Jan 2016 00:09:57 -0800 (PST)
Received: from sgxcmp131.intra.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	y124sm1640314wmg.3.2016.01.28.00.09.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 00:09:56 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: meta-ti@yoctoproject.org
Date: Thu, 28 Jan 2016 09:09:54 +0100
Message-Id: <1453968594-3931-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Correct the name of the variable used to define the size of the logo.
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
X-List-Received-Date: Thu, 28 Jan 2016 08:10:00 -0000

GUI_MACHINE_CLASS renamed MACHINE_GUI_CLASS.

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


