Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCEF1E01404
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A9E6252A38; Wed, 18 Apr 2012 17:20:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172028.A9E6252A38@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux 3.0: update to 3.0.28
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
X-List-Received-Date: Wed, 18 Apr 2012 17:20:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3a441d63e9ffddcb20615610c6d176230cdc90d0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3a441d63e9ffddcb20615610c6d176230cdc90d0

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:40 2012 +0200

linux 3.0: update to 3.0.28

Runtime tested on Angstrom/beagleboard-xM

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 16078db..9903856 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r118"
+MACHINE_KERNEL_PR = "r119"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index a817c1d..522a87d 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.25"
-# v3.0.25 tag
-SRCREV_pn-${PN} = "9bf176a3e029ae7f2dc6feae185091525a988be2"
+PV = "3.0.28"
+# v3.0.28 tag
+SRCREV_pn-${PN} = "0527fde0639955203ad48a9fd83bd6fc35e82e07"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "a"


