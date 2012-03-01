Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77D24E0030B
	for <meta-ti@yoctoproject.org>; Thu,  1 Mar 2012 14:00:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 08C6952AA1; Thu,  1 Mar 2012 22:00:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120301220021.08C6952AA1@arago-project.org>
Date: Thu,  1 Mar 2012 22:00:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux 3.0: update to 3.0.23
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 22:00:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2dbb7f09bf1c54d505d2e84a3a614bc5ca9b89aa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2dbb7f09bf1c54d505d2e84a3a614bc5ca9b89aa

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Mar  1 09:22:27 2012 +0100

linux 3.0: update to 3.0.23

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index b7d23af..8fc0903 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r116"
+MACHINE_KERNEL_PR = "r117"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index fac6348..32ef963 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.22"
-# v3.0.22 tag
-SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
+PV = "3.0.23"
+# v3.0.23 tag
+SRCREV_pn-${PN} = "bf6a68d2a214e07f7c0d6538e00e17b826714160"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 


