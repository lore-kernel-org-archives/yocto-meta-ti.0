Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4AAEE013C3
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 18:37:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 23F4C52A96; Tue, 23 Apr 2013 01:37:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130423013717.23F4C52A96@arago-project.org>
Date: Tue, 23 Apr 2013 01:37:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : u-boot: Add am3517 u-boot recipe
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
X-List-Received-Date: Tue, 23 Apr 2013 01:37:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 8f5baa2153ee5c1123e54feb0e2077089bd121ae
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f5baa2153ee5c1123e54feb0e2077089bd121ae

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Apr 22 17:31:47 2013 -0500

u-boot: Add am3517 u-boot recipe

* Add correct u-boot recipe for am3517.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am3517-evm.conf                |    5 ++---
 recipes-bsp/u-boot/u-boot-am3517_2011.09.bb |   19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 097e797..b9b6d17 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -17,9 +17,8 @@ USE_VT = "2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
-# Support for am3517 is in the same tree as am33x
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am33x"
-PREFERRED_PROVIDER_u-boot = "u-boot-am33x"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am3517"
+PREFERRED_PROVIDER_u-boot = "u-boot-am3517"
 
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
diff --git a/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb b/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
new file mode 100644
index 0000000..6321406
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
@@ -0,0 +1,19 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+
+COMPATIBLE_MACHINE = "omap3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "AM335XPSP_04.06.00.08"
+
+# Lock to the commit corresponding to tag "v2011.09_AM335xPSP_04.06.00.08"
+SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"


