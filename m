Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45872E0139E
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6105652A8A; Mon, 27 Feb 2012 14:12:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141229.6105652A8A@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux 3.0: update from 3.0.17 to 3.0.22
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b43e9fc0e1d3b52636f818c2303d43202e723114
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b43e9fc0e1d3b52636f818c2303d43202e723114

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 21 11:10:08 2012 +0100

linux 3.0: update from 3.0.17 to 3.0.22

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index f415864..b7d23af 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r115"
+MACHINE_KERNEL_PR = "r116"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index d62c1ea..65084fb 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.17"
-# v3.0.17 tag
-SRCREV_pn-${PN} = "e9d23be2708477feeaec78e707c80441520c1ef6"
+PV = "3.0.22"
+# v3.0.22 tag
+SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 


