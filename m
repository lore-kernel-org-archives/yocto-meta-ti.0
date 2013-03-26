Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4ECBFE01423
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C28AE52A9D; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004223.C28AE52A9D@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-am33x: modify am33x specific version to use new namespace feature
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 10e430c3708ce10924aabe979181bcf17950494b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=10e430c3708ce10924aabe979181bcf17950494b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:04:22 2013 -0400

u-boot-am33x: modify am33x specific version to use new namespace feature

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...boot_2011.10rc.bb => u-boot-am33x_2011.10rc.bb} |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb
similarity index 82%
rename from recipes-bsp/u-boot/u-boot_2011.10rc.bb
rename to recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb
index 2cb8271..d1a8236 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb
@@ -1,4 +1,4 @@
-require u-boot.inc
+require u-boot-ti.inc
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(ti33x)"
@@ -8,10 +8,7 @@ DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
 PR = "r30"
 
-# SPL build
-UBOOT_BINARY = "u-boot.img"
-UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
+SPL_BINARY = "MLO"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=master \
            file://2011.09git/0001-am335x_evm-add-option-to-boot-kernel-from-boot-in-ex.patch \
@@ -28,8 +25,3 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
           "
 
 SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-S = "${WORKDIR}/git"
-


