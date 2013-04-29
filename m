Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A49A6E014C8
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 07:27:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TERi4X004121
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 09:27:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TERim2008149
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 09:27:44 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Apr 2013 09:27:44 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3TERfWS022166;
	Mon, 29 Apr 2013 09:27:42 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Apr 2013 09:27:37 -0500
Message-ID: <1367245658-15077-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] am33x-cm3: Split init script into its own recipe
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
X-List-Received-Date: Mon, 29 Apr 2013 14:27:45 -0000
Content-Type: text/plain

* 3.8+ kernels uses an init script to load the cm3 firmware.
* 3.2 kernel require the cm3 firmware during compile time therefore not
  requiring an init script.
* Remove the init script from the main am33x-cm3 recipe and place it in its own
  recipe to allow specific kernel recipes to choose to load the firmware via an
  init script.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb                    |   14 +----------
 .../{am33x-cm3 => am33x-load-cm3}/init-am33x-cm3   |    0
 recipes-bsp/ti/am33x-load-cm3_1.0.bb               |   22 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.8.bb       |    4 +-
 4 files changed, 26 insertions(+), 14 deletions(-)
 rename recipes-bsp/ti/{am33x-cm3 => am33x-load-cm3}/init-am33x-cm3 (100%)
 create mode 100644 recipes-bsp/ti/am33x-load-cm3_1.0.bb

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 4829b78..4835e17 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -4,19 +4,13 @@ LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
 PV = "04.06.00.10"
-PR = "r2"
+PR = "r3"
 
 # SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
 SRCREV = "27ca4643e422245a95723de1df0247a00eada45b"
 BRANCH ?= "master"
 
-INITSCRIPT_NAME = "am335x-pm-firmware-load"
-INITSCRIPT_PARAMS = "defaults 96"
-
-inherit update-rc.d
-
 SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
-           file://init-am33x-cm3 \
           "
 
 S = "${WORKDIR}/git"
@@ -28,11 +22,7 @@ do_compile() {
 do_install() {
 	install -d ${D}${base_libdir}/firmware
 	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
-
-	# Install the init script to load the PM firmware at boot
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
-FILES_${PN} += "${base_libdir}/firmware"
+FILES_${PN} = "${base_libdir}/firmware"
 
diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-bsp/ti/am33x-load-cm3/init-am33x-cm3
similarity index 100%
rename from recipes-bsp/ti/am33x-cm3/init-am33x-cm3
rename to recipes-bsp/ti/am33x-load-cm3/init-am33x-cm3
diff --git a/recipes-bsp/ti/am33x-load-cm3_1.0.bb b/recipes-bsp/ti/am33x-load-cm3_1.0.bb
new file mode 100644
index 0000000..d99757b
--- /dev/null
+++ b/recipes-bsp/ti/am33x-load-cm3_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+RDEPENDS_${PN} = "am33x-cm3"
+
+INITSCRIPT_NAME = "am335x-pm-firmware-load"
+INITSCRIPT_PARAMS = "defaults 96"
+
+inherit update-rc.d
+
+SRC_URI = "file://init-am33x-cm3"
+
+
+do_install() {
+	# Install the init script to load the PM firmware at boot
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 622fa3e..561bb55 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -26,7 +26,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_ti33x += "am33x-cm3"
+RDEPENDS_ti33x += "am33x-cm3 am33x-load-cm3"
 
 # Default is to package all dts files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -44,7 +44,7 @@ SRCREV = "1de3616c36710b6949844738f9c63b96e307c49f"
 PV = "3.8.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.7.0.4


