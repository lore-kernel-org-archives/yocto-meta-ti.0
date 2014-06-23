Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0347DE003D8; Mon, 23 Jun 2014 09:02:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FE04E003D8
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:02:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 24C2F52A6A; Mon, 23 Jun 2014 16:02:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623160201.24C2F52A6A@arago-project.org>
Date: Mon, 23 Jun 2014 16:02:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machine configs: set optimized hardfp DEFAULTTUNE if not set
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
X-List-Received-Date: Mon, 23 Jun 2014 16:02:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 721aad503b2c6ad8555b4c70f564b8d83481bf47
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=721aad503b2c6ad8555b4c70f564b8d83481bf47

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 20 22:33:44 2014 +0000

machine configs: set optimized hardfp DEFAULTTUNE if not set

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    3 ++-
 conf/machine/include/omap-a15.inc |    3 ++-
 conf/machine/include/omap3.inc    |    3 ++-
 conf/machine/include/omap4.inc    |    3 ++-
 conf/machine/include/ti33x.inc    |    3 ++-
 conf/machine/include/ti43x.inc    |    3 ++-
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


