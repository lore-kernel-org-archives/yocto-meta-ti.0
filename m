Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9E00E00DFD; Tue, 19 Apr 2016 15:06:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70FD7E00E00
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:06:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B363252A19; Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160419220558.B363252A19@arago-project.org>
Date: Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf: update old machines to use linux-ti-staging and u-boot-ti-staging
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
X-List-Received-Date: Tue, 19 Apr 2016 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4b74d640a29bfc05a471d72d1e371385a5f8e16f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4b74d640a29bfc05a471d72d1e371385a5f8e16f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr 20 03:47:32 2016 +0000

conf: update old machines to use linux-ti-staging and u-boot-ti-staging

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/davinci.inc |    9 +++++----
 conf/machine/include/omap3.inc   |    9 +++++----
 conf/machine/include/omap4.inc   |    3 ++-
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 9f90f24..59e423d 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -1,12 +1,13 @@
 require conf/machine/include/tune-arm926ejs.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r53"
+MACHINE_KERNEL_PR = "r54"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 UBOOT_MACHINE = "davinci_dvevm_config"
 
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index f83bfa2..3a84140 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -17,13 +17,14 @@ XSERVER = "xserver-xorg \
 MACHINE_GUI_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r126"
+MACHINE_KERNEL_PR = "r127"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "omap3_evm_config"
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index 1657326..deb3316 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -6,6 +6,7 @@ require conf/machine/include/tune-cortexa9.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
@@ -14,7 +15,7 @@ XSERVER = "xserver-xorg \
            xf86-video-omap"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r3"
+MACHINE_KERNEL_PR = "r4"
 
 KERNEL_IMAGETYPE = "zImage"
 


