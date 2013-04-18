Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C536E0146C
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 12:45:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 39C0952A8F; Thu, 18 Apr 2013 19:45:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130418194532.39C0952A8F@arago-project.org>
Date: Thu, 18 Apr 2013 19:45:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : am33x-cm3: use init script to load firmware
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
X-List-Received-Date: Thu, 18 Apr 2013 19:45:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 14a312f1e9d724d61d163d9872d7f6542ee180b9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=14a312f1e9d724d61d163d9872d7f6542ee180b9

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Thu Apr 18 13:10:00 2013 -0500

am33x-cm3: use init script to load firmware

* The PM firmware is now loaded using an init script so make
  the init script installation part of the firmware package.
* Fix up the SRC_URI to the proper format.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3/init-am33x-cm3 |    6 ++++++
 recipes-bsp/ti/am33x-cm3_git.bb         |   17 +++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

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
 


