Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B90BE0122C
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2013 19:20:45 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSZ0044NQHQCPT1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 11 Sep 2013 21:20:30 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7611D20426; Wed,
	11 Sep 2013 22:20:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Sep 2013 22:20:13 -0400
Message-id: <1378952413-6388-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] ti-pru-sw-edma-driver: let module.bbclass package modules automatically
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
X-List-Received-Date: Thu, 12 Sep 2013 02:20:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

The new method is to automatically package modules into kernel-module-<modname>
and make the custom name depend on the standard unified one. Messing with
FILES_${PN} usually causes problems, so avoid it and let module.bbclass do
it's magic.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
1.8.3.2


