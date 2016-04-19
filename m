Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F973E00DC9; Tue, 19 Apr 2016 14:48:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C95EBE00C87
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 14:48:07 -0700 (PDT)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5W005NSHVC8K20@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 19 Apr 2016 16:47:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=uu2xRCEq3_b-zrAfydEA:9
Received: by 100.15.86.14 with SMTP id 39a6eb00; Tue, 19 Apr 2016 21:47:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DC041161FA3;	Tue,
	19 Apr 2016 17:47:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 19 Apr 2016 17:47:32 -0400
Message-id: <1461102453-6703-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] conf: update old machines to use linux-ti-staging and u-boot-ti-staging
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
X-List-Received-Date: Tue, 19 Apr 2016 21:48:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/davinci.inc | 9 +++++----
 conf/machine/include/omap3.inc   | 9 +++++----
 conf/machine/include/omap4.inc   | 3 ++-
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
 
-- 
2.2.0


