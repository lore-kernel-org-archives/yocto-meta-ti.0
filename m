Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EF9CE0027C
	for <meta-ti@yoctoproject.org>; Mon,  6 May 2013 21:26:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r474Q8A7008615
	for <meta-ti@yoctoproject.org>; Mon, 6 May 2013 23:26:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r474Q8FL031648
	for <meta-ti@yoctoproject.org>; Mon, 6 May 2013 23:26:08 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 23:26:08 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r474Q5ku021108;
	Mon, 6 May 2013 23:26:07 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 6 May 2013 23:26:03 -0500
Message-ID: <1367900763-2961-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH v3] am33x-cm3: Split init script into its own package
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
X-List-Received-Date: Tue, 07 May 2013 04:26:09 -0000
Content-Type: text/plain

* 3.8+ kernels use an init script to load the cm3 firmware.
* 3.2 kernel require the cm3 firmware during compile time therefore no init
 script is needed.
* Separate the init script from the main package and place it in its own
  package.
---
Changes since v1:
Instead of seperating the init script into its own recipe that init script is
now seperated into its own package.

Drop the patchset number since the other patch in the set isn't needed.

Changes since v2
Use a more common sense name for the new package.

 recipes-bsp/ti/am33x-cm3_git.bb              |    9 ++++++++-
 recipes-kernel/linux/linux-ti-staging_3.8.bb |    4 ++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 4829b78..3549fcd 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
 PV = "04.06.00.10"
-PR = "r2"
+PR = "r3"
 
 # SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
 SRCREV = "27ca4643e422245a95723de1df0247a00eada45b"
@@ -15,6 +15,10 @@ INITSCRIPT_PARAMS = "defaults 96"
 
 inherit update-rc.d
 
+UPDATERCPN = "${PN}-initscript"
+
+RDEPENDS_${PN}-initscript = "am33x-cm3"
+
 SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
            file://init-am33x-cm3 \
           "
@@ -34,5 +38,8 @@ do_install() {
 	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
+PACKAGES =+ "${PN}-initscript"
+
 FILES_${PN} += "${base_libdir}/firmware"
 
+FILES_${PN}-initscript = "${sysconfdir}/*"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 6fe52e2..4afc0e2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_ti33x += "am33x-cm3"
+RDEPENDS_ti33x += "am33x-cm3 am33x-cm3-initscript"
 
 # Default is to package all dts files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -30,7 +30,7 @@ SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
 PV = "3.8.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.7.0.4


