Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF49E00439
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 15:13:29 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1CAEC529D2; Wed,  5 Feb 2014 23:13:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140205231329.1CAEC529D2@arago-project.org>
Date: Wed,  5 Feb 2014 23:13:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : keystone: Add pci feature to MACHINE Keystone
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
X-List-Received-Date: Wed, 05 Feb 2014 23:13:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: df6816424c38fade639285d096735864bc73d7ab
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=df6816424c38fade639285d096735864bc73d7ab

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Jan 31 23:47:58 2014 -0500

keystone: Add pci feature to MACHINE Keystone

- Device support pci interface

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 72e71bf..b961ad3 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -8,7 +8,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
 PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r6"
+MACHINE_KERNEL_PR = "r7"
 
 KERNEL_IMAGETYPE = "uImage"
 
@@ -20,4 +20,4 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 EXTRA_IMAGEDEPENDS += "boot-monitor"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci"


