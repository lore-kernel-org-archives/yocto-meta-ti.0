Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 589A6E007C2; Tue, 12 Aug 2014 15:11:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 384E9E007A0
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 15:11:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4ED69529F5; Tue, 12 Aug 2014 22:11:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140812221106.4ED69529F5@arago-project.org>
Date: Tue, 12 Aug 2014 22:11:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update with version 1.8.7
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
X-List-Received-Date: Tue, 12 Aug 2014 22:11:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: a817ad5826b1c35084a6abb093b89a3916ecb283
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a817ad5826b1c35084a6abb093b89a3916ecb283

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Aug 13 02:03:49 2014 +0000

am33x-cm3: update with version 1.8.7

* Move repo to git.ti.com
* Bump PE due to versioning schema change
* Drop init scripts needed back in 3.8 days

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3 |    6 ---
 recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3 |    6 ---
 recipes-bsp/am33x-cm3/am33x-cm3_git.bb         |   43 ++++--------------------
 3 files changed, 7 insertions(+), 48 deletions(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3 b/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
deleted file mode 100644
index 56c17b3..0000000
--- a/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# Load the PM CM3 firmware
-echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
-cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
-echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3 b/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
deleted file mode 100644
index 0a75c1f..0000000
--- a/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-# Load the PM CM3 firmware
-echo 1 > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
-cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
-echo 0 > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index 42f20da..51ec9bd 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -3,35 +3,14 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "05.00.00.03"
-PR = "r1"
+PV = "1.8.7"
+PR = "r0"
+PE = "1"
 
-# Make package machine specific due to different init scripts
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+SRCREV = "fb0117edd5810a8d3bd9b1cd8abe34e12ff2d0ba"
+BRANCH ?= "next"
 
-# SRCREV corresponds to tag v05.00.00.03
-SRCREV = "a0ddffb63147e2079a08944c0e399c75538201a9"
-BRANCH ?= "master"
-
-# This init script is only used for older kernels that do not support
-# hotplug of the firmware.  Newer kernels do not require the initscript
-# package.
-INITSCRIPT_NAME = "am335x-pm-firmware-load"
-INITSCRIPT_PARAMS = "defaults 96"
-
-inherit update-rc.d
-
-UPDATERCPN = "${PN}-initscript"
-
-RDEPENDS_${PN}-initscript = "am33x-cm3"
-
-SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
-           file://init-am33x-cm3 \
-           file://init-am43x-cm3 \
-          "
-
-SCRIPT_ti33x = "init-am33x-cm3"
-SCRIPT_ti43x = "init-am43x-cm3"
+SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
@@ -41,15 +20,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware
-	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
-
-	# Install the init script to load the PM firmware at boot
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/${SCRIPT} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	install -m 0644 bin/am335x-pm-firmware.elf ${D}${base_libdir}/firmware/
 }
 
-PACKAGES =+ "${PN}-initscript"
-
 FILES_${PN} += "${base_libdir}/firmware"
-
-FILES_${PN}-initscript = "${sysconfdir}/*"


