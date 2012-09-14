Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E670E01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 22:53:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 323F952A99; Fri, 14 Sep 2012 05:53:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120914055357.323F952A99@arago-project.org>
Date: Fri, 14 Sep 2012 05:53:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-mainline: update to 3.2.28
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
X-List-Received-Date: Fri, 14 Sep 2012 05:53:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: acc985b09cafa913239f401af8a00ffa86d540da
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=acc985b09cafa913239f401af8a00ffa86d540da

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Aug 24 09:20:38 2012 +0200

linux-mainline: update to 3.2.28

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc             |    2 +-
 recipes-kernel/linux/linux-mainline_3.2.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 0f3cc36..8ce0ebc 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r121"
+MACHINE_KERNEL_PR = "r122"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 69344ff..bc0a145 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.2.18"
-# v3.2.18 tag
-SRCREV_pn-${PN} = "52c6b95f8a2edaff98b779f15b2f4d69b61b18b9"
+PV = "3.2.28"
+# v3.2.28 tag
+SRCREV_pn-${PN} = "1f873aca1c7aa7a574b276c040d304d16f1dbfa4"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 


