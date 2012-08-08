Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A72D8E013DB
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 19:59:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3EC0552A92; Wed,  8 Aug 2012 02:59:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120808025931.3EC0552A92@arago-project.org>
Date: Wed,  8 Aug 2012 02:59:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Wed, 08 Aug 2012 02:59:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fc003234aae7d8a69fafe6a4cfb0118bc18d3b0b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fc003234aae7d8a69fafe6a4cfb0118bc18d3b0b

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jul 26 12:40:43 2012 +0200

u-boot 2011.09+git: update to latest version of Tom Rini's tree

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2011.10rc.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index c4b4ca7..7035b4c 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r28"
+PR = "r29"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -26,7 +26,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0010-am335x-switch-to-ext4-mode.patch \
           "
 
-SRCREV = "ec687252299796639ff9bcb981804fbec7b445a4"
+SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 


