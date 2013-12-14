Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E57CEE007FD
	for <meta-ti@yoctoproject.org>; Fri, 13 Dec 2013 23:42:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9D37E52A16; Sat, 14 Dec 2013 07:42:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131214074200.9D37E52A16@arago-project.org>
Date: Sat, 14 Dec 2013 07:42:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : am33x-cm3: Add support for ti43x devices
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
X-List-Received-Date: Sat, 14 Dec 2013 07:42:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: be7a5b8c579417ae03598c8415fa2fc573a7cd9a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=be7a5b8c579417ae03598c8415fa2fc573a7cd9a

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Thu Dec 12 18:12:54 2013 -0600

am33x-cm3: Add support for ti43x devices

* The ti43x devices use the same firmware image but load it
  slightly differently.
* Add a different init script to load the firmware image for
  ti43x devices.
* Because there are different init script make the package
  machine specific.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3/init-am43x-cm3 |    6 ++++++
 recipes-bsp/ti/am33x-cm3_git.bb         |   11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

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


