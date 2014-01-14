Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D46DE0084E
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2014 12:42:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1977D529CF; Tue, 14 Jan 2014 20:42:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140114204253.1977D529CF@arago-project.org>
Date: Tue, 14 Jan 2014 20:42:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: Add dependency for VPE firmware
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
X-List-Received-Date: Tue, 14 Jan 2014 20:42:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c7df1eec2b9376e8b2eb09b34edcd81cdb4a4e72
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c7df1eec2b9376e8b2eb09b34edcd81cdb4a4e72

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Jan 13 17:33:06 2014 -0600

linux-ti-staging: Add dependency for VPE firmware

* The VPE firmware should only be added for the dra7xx-evm
  machine type since that is the device with the VPE IP.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap-a15.inc             |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 308b2e4..b0a0e74 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa15.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r2"
+MACHINE_KERNEL_PR = "r3"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index cb3eabc..7d5439e 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -16,6 +16,10 @@ RDEPENDS_kernel-base += "kernel-devicetree"
 RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
 RDEPENDS_kernel-base_append_ti43x = " am33x-cm3 am33x-cm3-initscript"
 
+# Add a run-time dependency for the VPE VPDMA firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_dra7xx-evm = " vpe-vpdma-fw"
+
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"


