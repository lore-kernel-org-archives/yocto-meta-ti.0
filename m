Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19E97E013C3
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 15:31:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MMVrAb025921
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 17:31:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MMVrpo026244
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 17:31:53 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 17:31:53 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MMVoPu003117;
	Mon, 22 Apr 2013 17:31:51 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 Apr 2013 17:31:47 -0500
Message-ID: <1366669907-26521-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] u-boot: Add am3517 u-boot recipe
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
X-List-Received-Date: Mon, 22 Apr 2013 22:31:55 -0000
Content-Type: text/plain

* Add correct u-boot recipe for am3517.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 conf/machine/am3517-evm.conf                |    5 ++---
 recipes-bsp/u-boot/u-boot-am3517_2011.09.bb |   19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-am3517_2011.09.bb

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
-- 
1.7.0.4


