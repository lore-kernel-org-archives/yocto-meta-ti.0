Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8738EE01341
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2011 22:56:46 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTE00J0PJ6ASO3Z@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 21 Oct 2011 00:56:35 -0500 (CDT)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8B8CB14AF59; Fri,
	21 Oct 2011 01:56:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 21 Oct 2011 01:56:25 -0400
Message-id: <1319176585-30116-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.7
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot 2011.10rc: update to the latest revision
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
X-List-Received-Date: Fri, 21 Oct 2011 05:56:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Updated to latest version to pick up the following changes:
* 9158d7f am335x: Really correct NAND partiton layout
* 4723773 am335x: Wrap spl_board_init in a CONFIG_SPL_BOARD_INIT check
* 40c310c Change CPU to 720MHz and bump VDD1 to 1.26V
* 9c154ee Add missing i2c0 pin mux configuration in spl_board_init

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2011.10rc.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 3f6e570..888c5bf 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -4,7 +4,7 @@ require u-boot.inc
 COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
-PR = "r12"
+PR = "r13"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -21,7 +21,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0004-am335x-evm-fall-back-to-bone-if-header.config-is-emp.patch \
           "
 
-SRCREV = "066e4c106677e9243bd7ae26e638f8d98e1f0606"
+SRCREV = "9158d7f37d596b867039345cb2e3f8f18f54fe46"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-- 
1.7.0.4


