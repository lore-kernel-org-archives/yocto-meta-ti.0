Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E83EE013A7
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D89A752A9F; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004223.D89A752A9F@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot 2011.12: modify multi-machine version for the new .inc file
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
Commit: 3b49d182d54e77a2f82d3bcb4ed3b5cb33b7fe56
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3b49d182d54e77a2f82d3bcb4ed3b5cb33b7fe56

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:05:17 2013 -0400

u-boot 2011.12: modify multi-machine version for the new .inc file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2011.12.bb |   16 +++-------------
 1 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 137f5b5..13cb537 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -1,15 +1,10 @@
-require u-boot.inc
+require u-boot-ti.inc
 
-# SPL build
-UBOOT_BINARY = "u-boot.img"
-UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
-UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
+SPL_BINARY = "MLO"
 
-PV = "2011.12"
 PR = "r8"
 
-# No patches for other machines yet
-COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
+COMPATIBLE_MACHINE = "(beagleboard|pandaboard|am3517-evm|am37x-evm|omap3evm)"
 
 # Non-omap4 platforms need outer cache turned on
 CACHEFIX = "file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
@@ -36,12 +31,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
            ${FWENV} \
           "
 
-
 # v2011.12 tag
 SRCREV = "cba9a894fdb1cb49b60fcd1d1d6919cbd7995dd5"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-S = "${WORKDIR}/git"
-
 RRECOMMENDS_${PN}_beagleboard = "u-boot-fw-utils"


