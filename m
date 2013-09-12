Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32394E005B3
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2013 08:25:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F13E852A65; Thu, 12 Sep 2013 15:25:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130912152519.F13E852A65@arago-project.org>
Date: Thu, 12 Sep 2013 15:25:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-pru-sw-edma-driver: let module. bbclass package modules automatically
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
X-List-Received-Date: Thu, 12 Sep 2013 15:25:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ed4ebd0b7c7a4fe24601144f03c4ecb438128698
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ed4ebd0b7c7a4fe24601144f03c4ecb438128698

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep 11 22:18:27 2013 -0400

ti-pru-sw-edma-driver: let module.bbclass package modules automatically

The new method is to automatically package modules into kernel-module-<modname>
and make the custom name depend on the standard unified one. Messing with
FILES_${PN} usually causes problems, so avoid it and let module.bbclass do
it's magic.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
index c7fdfd1..1a418d7 100644
--- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omapl138"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+svnr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
@@ -28,5 +28,3 @@ do_install () {
         install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
         install -m 0755 ${S}/edmautils.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/
 }
-
-FILES_${PN} = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru/edmautils.ko"


