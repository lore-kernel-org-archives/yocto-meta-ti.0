Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C01F8E0030B
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 14:07:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8A2F95299F; Mon, 21 May 2012 21:07:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120521210730.8A2F95299F@arago-project.org>
Date: Mon, 21 May 2012 21:07:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-capes: add a powerdown script as well
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
X-List-Received-Date: Mon, 21 May 2012 21:07:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 185d6216110354cca80f27b76d78a46336dadfc1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=185d6216110354cca80f27b76d78a46336dadfc1

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May 18 16:11:39 2012 +0200

beaglebone-capes: add a powerdown script as well

The current powerdown script disables the PMIC backlight

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-capes.bb         |    5 ++++-
 .../beagleboard/beaglebone-capes/cape-stop.sh      |   11 +++++++++++
 .../beagleboard/beaglebone-capes/cape.service      |    3 +++
 3 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index 88d4a17..f128924 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -3,10 +3,13 @@ DESCRIPTION = "Userspace setup for beaglebone capes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
+PR = "r1"
+
 inherit allarch
 
 SRC_URI = "file://cape.service \
            file://cape.sh \
+           file://cape-stop.sh \
           "
 
 do_install() {
@@ -17,7 +20,7 @@ do_install() {
 	ln -sf ../cape.service ${D}${base_libdir}/systemd/system/basic.target.wants/
 
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/cape.sh ${D}${bindir}
+	install -m 0755 ${WORKDIR}/cape*.sh ${D}${bindir}
 }
 
 FILES_${PN} += "${base_libdir}/systemd/system"
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
new file mode 100755
index 0000000..a08498d
--- /dev/null
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
+	PARTNUMBER=$(hexdump -e '8/1 "%c"' $eeprom -s 58 -n16)
+	case $PARTNUMBER in
+		"BB-BONE-LCD3-01.")
+				echo "Turning off backlight for LCD3 cape"
+				i2cset -f -y 1 0x24 0x07 0x00;;
+		*)
+				echo "unknown cape: $PARTNUMBER";;
+	esac
+done
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.service b/recipes-ti/beagleboard/beaglebone-capes/cape.service
index 44a2a38..ce0db71 100644
--- a/recipes-ti/beagleboard/beaglebone-capes/cape.service
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.service
@@ -2,7 +2,10 @@
 Description=Beaglebone cape support
 
 [Service]
+Type=oneshot
+RemainAfterExit=yes
 ExecStart=/usr/bin/cape.sh
+ExecStop=/usr/bin/cape-stop.sh
 
 [Install]
 WantedBy=basic.target


