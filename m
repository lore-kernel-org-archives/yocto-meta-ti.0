Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED825E01623
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 13:57:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 43B9B52A81; Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130925205739.43B9B52A81@arago-project.org>
Date: Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to the latest 2013. 10-rc2 and make it the default
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
X-List-Received-Date: Wed, 25 Sep 2013 20:57:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 48887f4327746c6eb361492c5c651f5ef5e0c05e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48887f4327746c6eb361492c5c651f5ef5e0c05e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 23 22:15:06 2013 -0400

u-boot-ti-staging: update to the latest 2013.10-rc2 and make it the default

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_git.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
index 8d96aee..8c005b4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
@@ -4,16 +4,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=6bc50ecab884fce80cd3ef3da8852b08"
 
-PV = "2013.07+2013.10-rc1"
+PV = "2013.07+2013.10-rc2"
 PR = "r0+gitr${SRCPV}"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
 
-SRCREV = "39bc12ddc36c9e30199471da0f3a929b178a04b2"
+SRCREV = "fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


