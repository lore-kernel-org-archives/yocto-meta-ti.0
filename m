Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA29DE0079B
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 14:12:52 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0DMCpEp018689
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 16:12:51 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMCpA0016831
	for <meta-ti@yoctoproject.org>; Mon, 13 Jan 2014 16:12:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 Jan 2014 16:12:50 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0DMCjkq032472;
	Mon, 13 Jan 2014 16:12:49 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Jan 2014 17:33:06 -0600
Message-ID: <1389655987-31349-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
References: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] linux-ti-staging: Add dependency for VPE firmware
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
X-List-Received-Date: Mon, 13 Jan 2014 22:12:53 -0000
Content-Type: text/plain

* The VPE firmware should only be added for the dra7xx-evm
  machine type since that is the device with the VPE IP.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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
-- 
1.7.0.4


