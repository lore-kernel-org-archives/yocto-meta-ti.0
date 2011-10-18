Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 163C2E004E9
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2011 13:10:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTA00IYK2PUX4W0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 18 Oct 2011 15:10:43 -0500 (CDT)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D7FF414AF59; Tue,
	18 Oct 2011 16:10:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 18 Oct 2011 16:10:34 -0400
Message-id: <1318968634-16027-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.7
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot 2011.10rc: update with latest rev and new SRC_URI
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
X-List-Received-Date: Tue, 18 Oct 2011 20:10:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Tree moved to arago-project.org
* Remove i2c releated voltage change writes that were a nop

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2011.10rc.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index ad104d6..272ed70 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -4,14 +4,14 @@ require u-boot.inc
 COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
-PR = "r10"
+PR = "r11"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
 UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
-SRC_URI = "git://github.com/trini/u-boot.git;protocol=git;branch=int_am335xpsp_04.06.00.01-v2011.09-for-sdk-05.03.00.00 \
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=int_am335xpsp_04.06.00.01-v2011.09-for-sdk-05.03.00.00 \
            file://2011.09git/0001-am335x_evm-boot-kernel-from-ext2-3-filesystem.patch \
            file://2011.09git/0002-am335x_evm-set-bootdelay-to-0.patch \
            file://2011.09git/0003-am335x-evm-make-rootfs-RO-on-boot.patch \
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/trini/u-boot.git;protocol=git;branch=int_am335xpsp_0
            file://2011.09git/0004-am335x-evm-fall-back-to-bone-if-header.config-is-emp.patch \
           "
 
-SRCREV = "3fb65523c5994718b56a3b4b18ddf1ef3ffc02dc"
+SRCREV = "4b41772ae4ef8fbea0b3e93af169a115e3ad6d12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-- 
1.7.0.4


