Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9DA6E01505
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 09:22:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MGM1ee017466
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 11:22:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MGM1ep009783
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 11:22:01 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Apr 2013 11:22:00 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3MGLpaC001894;
	Mon, 22 Apr 2013 11:21:59 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 Apr 2013 11:21:42 -0500
Message-ID: <1366647702-24282-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366647702-24282-1-git-send-email-fcooper@ti.com>
References: <1366647702-24282-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] u-boot-am33x: Update u-boot recipe to 2013.01.01
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
X-List-Received-Date: Mon, 22 Apr 2013 16:22:02 -0000
Content-Type: text/plain

* Update to latest version of u-boot that supports the 3.2 kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb    |   17 -----------------
 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |   20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 17 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb

diff --git a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
deleted file mode 100644
index 7320e02..0000000
--- a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require u-boot-ti.inc
-
-DESCRIPTION = "u-boot bootloader for ARM MPU devices"
-
-COMPATIBLE_MACHINE = "ti33x|omap3"
-
-DEFAULT_PREFERENCE = "-1"
-
-PR = "r7+gitr${SRCPV}"
-
-SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
-
-BRANCH = "amsdk-05.06.00.00"
-
-SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
-
-SPL_BINARY = "MLO"
diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
new file mode 100644
index 0000000..19ec34e
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
@@ -0,0 +1,20 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+
+COMPATIBLE_MACHINE = "ti33x"
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r5+gitr${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+# This version of u-boot is meant for 3.2 kernel which doesn't support device tree.
+BRANCH = "ti-u-boot-2013.01.01-amsdk-05.07.00.00"
+
+# Commit corresponds to tag "v2013.01.01_amsdk-05.07.00.00"
+SRCREV = "8eb15a787c558fee98b0fa2a66ff0849c732edcc"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"
-- 
1.7.0.4


