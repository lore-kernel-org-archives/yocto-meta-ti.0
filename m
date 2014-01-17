Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A974E00830
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:47:33 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3924352A8B; Fri, 17 Jan 2014 17:47:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140117174733.3924352A8B@arago-project.org>
Date: Fri, 17 Jan 2014 17:47:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: remove initscript dependency
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
X-List-Received-Date: Fri, 17 Jan 2014 17:47:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 21d21908c8ded4a94da5ce8950cd83e9b22b7096
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=21d21908c8ded4a94da5ce8950cd83e9b22b7096

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Jan 17 11:40:21 2014 -0600

linux-ti-staging: remove initscript dependency

* Remove the RDEPENDS for the am33x-cm3-initscript package since
  the latest kernel source use the hotplug functionality to load
  the firmware.
* Updated the SRCREV to the latest kernel sources which include
  the hotplug fix.
* Bump the MACHINE_KERNEL_PR for the am335x and am437x devices
  which are affected.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                |    2 +-
 conf/machine/include/ti43x.inc                |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    7 +++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index af340d2..17b968d 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r20"
+MACHINE_KERNEL_PR = "r21"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index d9bfd25..8913380 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r1"
+MACHINE_KERNEL_PR = "r2"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 7d5439e..2d9f813 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -13,8 +13,8 @@ RDEPENDS_kernel-base += "kernel-devicetree"
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
-RDEPENDS_kernel-base_append_ti43x = " am33x-cm3 am33x-cm3-initscript"
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
+RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
@@ -36,8 +36,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-# Corresponds to ti2013.12.00 release
-SRCREV = "dfea149efb32485f17bb7440eb326549c8f647e2"
+SRCREV = "b0f3ccd18d39c375491519ba285babf152eab9d8"
 PV = "3.12.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild


