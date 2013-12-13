Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C718E007D6
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2013 15:04:10 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBCN49fx000966
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2013 17:04:09 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBCN49vS022099
	for <meta-ti@yoctoproject.org>; Thu, 12 Dec 2013 17:04:09 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Dec 2013 17:04:09 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBCN46mc000651;
	Thu, 12 Dec 2013 17:04:07 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 12 Dec 2013 18:12:54 -0600
Message-ID: <1386893574-19212-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] am33x-cm3: Add support for ti43x devices
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
X-List-Received-Date: Thu, 12 Dec 2013 23:04:13 -0000
Content-Type: text/plain

* The ti43x devices use the same firmware image but load it
  slightly differently.
* Add a different init script to load the firmware image for
  ti43x devices.
* Because there are different init script make the package
  machine specific.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/ti/am33x-cm3/init-am43x-cm3 |    6 ++++++
 recipes-bsp/ti/am33x-cm3_git.bb         |   11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/ti/am33x-cm3/init-am43x-cm3

diff --git a/recipes-bsp/ti/am33x-cm3/init-am43x-cm3 b/recipes-bsp/ti/am33x-cm3/init-am43x-cm3
new file mode 100644
index 0000000..0a75c1f
--- /dev/null
+++ b/recipes-bsp/ti/am33x-cm3/init-am43x-cm3
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Load the PM CM3 firmware
+echo 1 > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
+cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
+echo 0 > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 260db16..75b6c73 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -4,7 +4,10 @@ LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
 PV = "05.00.00.01"
-PR = "r0"
+PR = "r1"
+
+# Make package machine specific due to different init scripts
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # SRCREV corresponds to tag v05.00.00.01
 SRCREV = "40cb75b9dd9ba15c6de1c15cbb7cce8f1a6588b8"
@@ -21,8 +24,12 @@ RDEPENDS_${PN}-initscript = "am33x-cm3"
 
 SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
            file://init-am33x-cm3 \
+           file://init-am43x-cm3 \
           "
 
+SCRIPT_ti33x = "init-am33x-cm3"
+SCRIPT_ti43x = "init-am43x-cm3"
+
 S = "${WORKDIR}/git"
 
 do_compile() {
@@ -35,7 +42,7 @@ do_install() {
 
 	# Install the init script to load the PM firmware at boot
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	install -m 0755 ${WORKDIR}/${SCRIPT} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
 PACKAGES =+ "${PN}-initscript"
-- 
1.7.0.4


