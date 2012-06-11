Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C60B7E006D9
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 14:03:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4C09252A92; Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120611210315.4C09252A92@arago-project.org>
Date: Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-capes: add support for 4.3" LCD cape
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
X-List-Received-Date: Mon, 11 Jun 2012 21:03:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c5e5c304b86a398d65330f430330ce5f730b56c5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5e5c304b86a398d65330f430330ce5f730b56c5

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jun  7 17:40:43 2012 +0200

beaglebone-capes: add support for 4.3" LCD cape

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-capes.bb         |    2 +-
 .../beagleboard/beaglebone-capes/cape-stop.sh      |    3 +++
 recipes-ti/beagleboard/beaglebone-capes/cape.sh    |    4 ++++
 3 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index f128924..2a9f1fb 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Userspace setup for beaglebone capes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r1"
+PR = "r2"
 
 inherit allarch
 
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
index a08498d..4950017 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
@@ -5,6 +5,9 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 		"BB-BONE-LCD3-01.")
 				echo "Turning off backlight for LCD3 cape"
 				i2cset -f -y 1 0x24 0x07 0x00;;
+		"BB-BONE-LCD4-01.")
+				echo "Turning off backlight for LCD3 cape"
+				i2cset -f -y 1 0x24 0x07 0x00;;
 		*)
 				echo "unknown cape: $PARTNUMBER";;
 	esac
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
index 69accff..61240a5 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
@@ -6,6 +6,10 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 				echo "Turning on backlight for LCD3 cape"
 				i2cset -f -y 1 0x24 0x07 0x09
 				i2cset -f -y 1 0x24 0x08 0x60;;
+		"BB-BONE-LCD4-01.")
+				echo "Turning on backlight for LCD4 cape"
+				i2cset -f -y 1 0x24 0x07 0x09
+				i2cset -f -y 1 0x24 0x08 0x60;;
 		*)
 				echo "unknown cape: $PARTNUMBER";;
 	esac


