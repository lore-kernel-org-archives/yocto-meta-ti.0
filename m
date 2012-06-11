Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4C79E0044A
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 14:03:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D14D2529EB; Mon, 11 Jun 2012 21:03:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120611210314.D14D2529EB@arago-project.org>
Date: Mon, 11 Jun 2012 21:03:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp: enable TSL2550 driver for beaglebone weatherstation cape
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
X-List-Received-Date: Mon, 11 Jun 2012 21:03:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5f7c0da7a483c59eee67cb39db231ad8486d313c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5f7c0da7a483c59eee67cb39db231ad8486d313c

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jun  7 17:40:40 2012 +0200

linux-ti33x-psp: enable TSL2550 driver for beaglebone weatherstation cape

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c9316db..f88be14 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1012,7 +1012,7 @@ CONFIG_MISC_DEVICES=y
 # CONFIG_APDS9802ALS is not set
 # CONFIG_ISL29003 is not set
 # CONFIG_ISL29020 is not set
-# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_SENSORS_TSL2550=m
 # CONFIG_SENSORS_BH1780 is not set
 # CONFIG_SENSORS_BH1770 is not set
 # CONFIG_SENSORS_APDS990X is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 46a6277..e3a427b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


