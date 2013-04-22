Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF117E01489
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 13:24:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C2C7852A94; Mon, 22 Apr 2013 20:24:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130422202439.C2C7852A94@arago-project.org>
Date: Mon, 22 Apr 2013 20:24:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : u-boot-am33x: Update u-boot recipe to 2013.01.01
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
Commit: 3b2d0910db367916fdcd5e1fcf5fb4673edbab6d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3b2d0910db367916fdcd5e1fcf5fb4673edbab6d

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Apr 22 11:21:42 2013 -0500

u-boot-am33x: Update u-boot recipe to 2013.01.01

* Update to latest version of u-boot that supports the 3.2 kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb    |   17 -----------------
 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |   20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 17 deletions(-)

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


