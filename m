Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E86E1E00BC1; Fri, 20 Jun 2014 09:34:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DCD5E00B7B
	for <meta-ti@yoctoproject.org>; Fri, 20 Jun 2014 09:34:32 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H009YT7CAP870@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 20 Jun 2014 11:34:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 43CA2200BD; Fri,
	20 Jun 2014 12:33:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Jun 2014 12:33:44 -0400
Message-id: <1403282024-19153-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] machine configs: set optimized hardfp DEFAULTTUNE if not set
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
X-List-Received-Date: Fri, 20 Jun 2014 16:34:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc | 3 ++-
 conf/machine/include/omap-a15.inc | 3 ++-
 conf/machine/include/omap3.inc    | 3 ++-
 conf/machine/include/omap4.inc    | 3 ++-
 conf/machine/include/ti33x.inc    | 3 ++-
 conf/machine/include/ti43x.inc    | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index a9449b2..9a5c11f 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -1,6 +1,7 @@
 SOC_FAMILY = "keystone"
 require conf/machine/include/soc-family.inc
 
+DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
@@ -8,7 +9,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r7"
+MACHINE_KERNEL_PR = "r8"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index dcf973e..3fef64e 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -1,10 +1,11 @@
 SOC_FAMILY = "omap-a15"
 require conf/machine/include/soc-family.inc
 
+DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r3"
+MACHINE_KERNEL_PR = "r4"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index c80939a..e71630b 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,6 +1,7 @@
 SOC_FAMILY = "omap3"
 require conf/machine/include/soc-family.inc
 
+DEFAULTTUNE ?= "cortexa8thf-neon"
 require conf/machine/include/tune-cortexa8.inc
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
@@ -16,7 +17,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r125"
+MACHINE_KERNEL_PR = "r126"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index cf71be1..066acca 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -1,6 +1,7 @@
 SOC_FAMILY = "omap4"
 require conf/machine/include/soc-family.inc
 
+DEFAULTTUNE ?= "cortexa9thf-neon"
 require conf/machine/include/tune-cortexa9.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap4"
@@ -13,7 +14,7 @@ XSERVER = "xserver-xorg \
            xf86-video-omap"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r1"
+MACHINE_KERNEL_PR = "r2"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 17b968d..53f38c9 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -1,6 +1,7 @@
 SOC_FAMILY = "ti33x"
 require conf/machine/include/soc-family.inc
 
+DEFAULTTUNE ?= "cortexa8thf-neon"
 require conf/machine/include/tune-cortexa8.inc
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
@@ -16,7 +17,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r21"
+MACHINE_KERNEL_PR = "r22"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 8913380..8c5fa2d 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -1,6 +1,7 @@
 SOC_FAMILY = "ti43x"
 require conf/machine/include/soc-family.inc
 
+DEFAULTTUNE ?= "cortexa9thf-neon"
 require conf/machine/include/tune-cortexa9.inc
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
@@ -16,7 +17,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r2"
+MACHINE_KERNEL_PR = "r3"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
-- 
2.0.0


