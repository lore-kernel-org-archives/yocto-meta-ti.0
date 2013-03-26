Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C7E7E014E9
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4FC9E52A6F; Tue, 26 Mar 2013 00:42:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004228.4FC9E52A6F@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : beagleboard: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 6a02716519df5526f63b23b9a763bb14d33434cd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6a02716519df5526f63b23b9a763bb14d33434cd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:27:45 2013 -0400

beagleboard: switch default u-boot preference to machine-specific tree

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beagleboard.conf  |    2 ++
 conf/machine/include/omap3.inc |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index a65e360..f923119 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -8,6 +8,8 @@ require conf/machine/include/omap3.inc
 GUI_MACHINE_CLASS = "bigscreen"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-beagleboard"
+PREFERRED_PROVIDER_u-boot = "u-boot-beagleboard"
 
 IMAGE_FSTYPES += "tar.gz ubi"
 EXTRA_IMAGECMD_jffs2 = "-lnp"
diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 99f0c80..212ebe7 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -16,7 +16,7 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r123"
+MACHINE_KERNEL_PR = "r124"
 
 KERNEL_IMAGETYPE = "uImage"
 


