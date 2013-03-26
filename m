Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B8FEE014E8
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D891452AA7; Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004227.D891452AA7@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: modify mainline version to use the new . inc file
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 6b8e4763e7dddc715fcf1e0903283cc18d6e8be8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6b8e4763e7dddc715fcf1e0903283cc18d6e8be8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:07:53 2013 -0400

u-boot: modify mainline version to use the new .inc file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2013.01.01.bb |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
index 4c460cc..e3da1f3 100644
--- a/recipes-bsp/u-boot/u-boot_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot_2013.01.01.bb
@@ -1,13 +1,9 @@
-require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+require u-boot-ti.inc
 
 DESCRIPTION = "Mainline u-boot bootloader"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 DEFAULT_PREFERENCE = "-1"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PR = "r1"
 
 SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
@@ -16,7 +12,4 @@ BRANCH ?= "u-boot-2013.01.y"
 
 SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
 
-S = "${WORKDIR}/git"
-
-UBOOT_SUFFIX = "img"
 SPL_BINARY = "MLO"


