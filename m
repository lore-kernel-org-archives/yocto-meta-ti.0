Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADDB1E013C9
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 13:24:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5B59152A3E; Mon, 22 Apr 2013 20:24:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130422202438.5B59152A3E@arago-project.org>
Date: Mon, 22 Apr 2013 20:24:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-omap-psp: Update commit
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
X-List-Received-Date: Mon, 22 Apr 2013 20:24:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: bb6646fd963c53a4386a7448c62a75990f285407
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb6646fd963c53a4386a7448c62a75990f285407

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Apr 22 11:21:40 2013 -0500

linux-omap-psp: Update commit

* Update to latest supported release.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc                |    2 +-
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 212ebe7..c80939a 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r124"
+MACHINE_KERNEL_PR = "r125"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index 5d72af5..d1a6478 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -5,7 +5,8 @@ DESCRIPTION = "Linux kernel for OMAP3 EVM from PSP, based on linux-omap3 kernel"
 
 COMPATIBLE_MACHINE = "omap3"
 
-SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
+# SRCREV corresponds to tag v2.6.37_OMAPPSP_04.02.00.07
+SRCREV= "adcd067326836777c049e3cb32a5b7d9d401fc31"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
 # see conf/machine/include/omap3.inc


