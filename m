Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83EA4E00596
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:30:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A4E052ABE; Tue, 21 Feb 2012 02:30:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221023014.2A4E052ABE@arago-project.org>
Date: Tue, 21 Feb 2012 02:30:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : u-boot 2011.12: Add fw_env.config for beagleboard
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
X-List-Received-Date: Tue, 21 Feb 2012 02:30:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5bd4167ac1580bb9a1a6efb55c0006a365342201
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5bd4167ac1580bb9a1a6efb55c0006a365342201

Author: Tom Rini <trini@ti.com>
Date:   Mon Feb 13 11:40:27 2012 -0700

u-boot 2011.12: Add fw_env.config for beagleboard

beagleboard provides a correct fw_env.config file so add to the SRC_URI
and RRECOMMENDS on u-boot-fw-utils.

Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2011.12.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 3610837..35ffd4b 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r4"
+PR = "r5"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
@@ -15,6 +15,10 @@ COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|oma
 CACHEFIX = "file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
 CACHEFIX_omap4 = ""
 
+# File is board-specific, only copy when it will be correct.
+FWENV_beagleboard = "file://fw_env.config"
+FWENV = ""
+
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch \
            file://2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch \
@@ -26,6 +30,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            ${CACHEFIX} \
            file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
            file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
+           ${FWENV} \
           "
 
 
@@ -35,3 +40,5 @@ SRCREV = "cba9a894fdb1cb49b60fcd1d1d6919cbd7995dd5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
 S = "${WORKDIR}/git"
+
+RRECOMMENDS_${PN}_beagleboard = "u-boot-fw-utils"


