Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E9BDE013AC
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A83455298C; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004223.A83455298C@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-beagleboard: modify beagleboard specific version to use new namespace feature
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
Commit: 3b8880042373aaaefe6176cca6a36b8756a8b850
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3b8880042373aaaefe6176cca6a36b8756a8b850

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:02:47 2013 -0400

u-boot-beagleboard: modify beagleboard specific version to use new namespace feature

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ot_2011.09.bb => u-boot-beagleboard_2011.09.bb} |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
similarity index 89%
rename from recipes-bsp/u-boot/u-boot_2011.09.bb
rename to recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
index edacb6c..519df16 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09.bb
+++ b/recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
@@ -1,11 +1,8 @@
-require u-boot.inc
+require u-boot-ti.inc
 
 PR = "r7"
 
-# SPL build
-UBOOT_BINARY = "u-boot.img"
-UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
+SPL_BINARY = "MLO"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard)"
@@ -37,7 +34,3 @@ SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
           "
 
 SRCREV = "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-S = "${WORKDIR}/git"


