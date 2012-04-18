Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBB4CE013FB
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 405EB529A0; Wed, 18 Apr 2012 17:20:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172029.405EB529A0@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-capes: userspace support for capes
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
X-List-Received-Date: Wed, 18 Apr 2012 17:20:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f026aa7bd09a75034b28a0aa7e750059fd2c2813
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f026aa7bd09a75034b28a0aa7e750059fd2c2813

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:42 2012 +0200

beaglebone-capes: userspace support for capes

Not everything can be done inside the kernel yet, so have a script that does the userspace portion.
Only the LCD3 cape is supported currently, more will follow later.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-capes.bb         |   23 ++++++++++++++++++++
 .../beagleboard/beaglebone-capes/cape.service      |    8 +++++++
 recipes-ti/beagleboard/beaglebone-capes/cape.sh    |   12 ++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
new file mode 100644
index 0000000..88d4a17
--- /dev/null
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Userspace setup for beaglebone capes"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit allarch
+
+SRC_URI = "file://cape.service \
+           file://cape.sh \
+          "
+
+do_install() {
+	install -d ${D}${base_libdir}/systemd/system/
+	install -m 0644 ${WORKDIR}/cape.service ${D}${base_libdir}/systemd/system
+
+	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
+	ln -sf ../cape.service ${D}${base_libdir}/systemd/system/basic.target.wants/
+
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/cape.sh ${D}${bindir}
+}
+
+FILES_${PN} += "${base_libdir}/systemd/system"
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.service b/recipes-ti/beagleboard/beaglebone-capes/cape.service
new file mode 100644
index 0000000..44a2a38
--- /dev/null
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Beaglebone cape support
+
+[Service]
+ExecStart=/usr/bin/cape.sh
+
+[Install]
+WantedBy=basic.target
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
new file mode 100755
index 0000000..69accff
--- /dev/null
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
+	PARTNUMBER=$(hexdump -e '8/1 "%c"' $eeprom -s 58 -n16)
+	case $PARTNUMBER in
+		"BB-BONE-LCD3-01.")
+				echo "Turning on backlight for LCD3 cape"
+				i2cset -f -y 1 0x24 0x07 0x09
+				i2cset -f -y 1 0x24 0x08 0x60;;
+		*)
+				echo "unknown cape: $PARTNUMBER";;
+	esac
+done


