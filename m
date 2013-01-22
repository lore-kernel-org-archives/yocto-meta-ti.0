Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D764CE011DB
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 19:32:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2FB1652A21; Tue, 22 Jan 2013 03:32:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130122033213.2FB1652A21@arago-project.org>
Date: Tue, 22 Jan 2013 03:32:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: update to the latest dev release for keystone
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
X-List-Received-Date: Tue, 22 Jan 2013 03:32:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 9f7148c2361434702ed35ad7cf12364b94550f80
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9f7148c2361434702ed35ad7cf12364b94550f80

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 21 21:37:18 2013 -0500

u-boot: update to the latest dev release for keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{u-boot_2012.07.bb => u-boot_2013.01.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2012.07.bb b/recipes-bsp/u-boot/u-boot_2013.01.bb
similarity index 70%
rename from recipes-bsp/u-boot/u-boot_2012.07.bb
rename to recipes-bsp/u-boot/u-boot_2013.01.bb
index f39e60c..ee443b0 100644
--- a/recipes-bsp/u-boot/u-boot_2012.07.bb
+++ b/recipes-bsp/u-boot/u-boot_2013.01.bb
@@ -8,13 +8,13 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
-SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
 
-SRCREV = "6e710c61dba2665e01c900470a0a63743ff431c6"
+SRCREV = "DEV.MCSDK-03.00.00.06"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 


