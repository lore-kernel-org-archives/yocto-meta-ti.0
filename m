Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9168FE011AF
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 13:14:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9BBBF52A5B; Wed, 17 Oct 2012 20:13:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121017201359.9BBBF52A5B@arago-project.org>
Date: Wed, 17 Oct 2012 20:13:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Roger Monk : u-boot_2011.09[.10rc]: Always use gnu ld for LD
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
X-List-Received-Date: Wed, 17 Oct 2012 20:14:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: aa61e0a12b390371610ebf422af8cdeef9a35caf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aa61e0a12b390371610ebf422af8cdeef9a35caf

Author: Roger Monk <r-monk@ti.com>
Date:   Fri Aug  3 23:20:08 2012 +0100

u-boot_2011.09[.10rc]: Always use gnu ld for LD

   - Pull in gnu ld patch for 2011.10rc recipe
   - Bump PR

Signed-off-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 recipes-bsp/u-boot/u-boot_2011.10rc.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 7035b4c..2cb8271 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r29"
+PR = "r30"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -24,6 +24,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0008-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch \
            file://2011.09git/0009-ext4fs-ls-load-support.patch \
            file://2011.09git/0010-am335x-switch-to-ext4-mode.patch \
+           file://0001-config-Always-use-GNU-ld.patch \
           "
 
 SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"


