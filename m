Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CCE2E0140A
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 11:10:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3IIA6ff016025
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 13:10:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3IIA54Z011113
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 13:10:06 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Apr 2013 13:10:05 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3IIA2JB003060;
	Thu, 18 Apr 2013 13:10:04 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 18 Apr 2013 13:10:00 -0500
Message-ID: <1366308600-17639-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2 1/2] am33x-cm3: use init script to load firmware
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
X-List-Received-Date: Thu, 18 Apr 2013 18:10:07 -0000
Content-Type: text/plain

* The PM firmware is now loaded using an init script so make
  the init script installation part of the firmware package.
* Fix up the SRC_URI to the proper format.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Fixed whitespace to use tabs instead of spaces
---
 recipes-bsp/ti/am33x-cm3/init-am33x-cm3 |    6 ++++++
 recipes-bsp/ti/am33x-cm3_git.bb         |   17 +++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/ti/am33x-cm3/init-am33x-cm3

diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-bsp/ti/am33x-cm3/init-am33x-cm3
new file mode 100644
index 0000000..56c17b3
--- /dev/null
+++ b/recipes-bsp/ti/am33x-cm3/init-am33x-cm3
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Load the PM CM3 firmware
+echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
+cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
+echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 247ba4d..169789e 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -4,9 +4,18 @@ LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
 PV = "04.06.00.07"
+PR = "r1"
 SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
+BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git"
+INITSCRIPT_NAME = "am335x-pm-firmware-load"
+INITSCRIPT_PARAMS = "defaults 96"
+
+inherit update-rc.d
+
+SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
+           file://init-am33x-cm3 \
+          "
 
 S = "${WORKDIR}/git"
 
@@ -17,7 +26,11 @@ do_compile() {
 do_install() {
 	install -d ${D}${base_libdir}/firmware
 	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
+
+	# Install the init script to load the PM firmware at boot
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
-FILES_${PN} = "${base_libdir}/firmware"
+FILES_${PN} += "${base_libdir}/firmware"
 
-- 
1.7.0.4


