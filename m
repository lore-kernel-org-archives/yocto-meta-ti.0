Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2ADFDE00832; Thu, 19 Mar 2015 14:52:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 457D3E00777
	for <meta-ti@yoctoproject.org>; Thu, 19 Mar 2015 14:52:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B59CC52A43; Thu, 19 Mar 2015 21:52:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150319215226.B59CC52A43@arago-project.org>
Date: Thu, 19 Mar 2015 21:52:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap-a15, dra7xx: add mmip feature to entire SOC family
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
X-List-Received-Date: Thu, 19 Mar 2015 21:52:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 185220eb050fdd6c267121e40b699626c9e1e50c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=185220eb050fdd6c267121e40b699626c9e1e50c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Mar 20 03:43:13 2015 +0000

omap-a15, dra7xx: add mmip feature to entire SOC family

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/dra7xx.inc   |    2 +-
 conf/machine/include/omap-a15.inc |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index a7c8782..857e1b3 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
 
-MACHINE_FEATURES += "pci mmip"
+MACHINE_FEATURES += "pci"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 3654c3a..41a2f19 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -5,7 +5,7 @@ DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r6"
+MACHINE_KERNEL_PR = "r7"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
@@ -31,4 +31,4 @@ GUI_MACHINE_CLASS = "smallscreen"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx mmip"


