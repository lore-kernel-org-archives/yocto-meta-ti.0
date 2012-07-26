Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A2E3E01351
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7D0DA52AA4; Thu, 26 Jul 2012 01:32:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013211.7D0DA52AA4@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-capes: use backlight hack for all LCD4 variants
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 51ce8e5738e9ab91122769aa1bedd36f95de613d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=51ce8e5738e9ab91122769aa1bedd36f95de613d

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jun 28 11:53:55 2012 +0200

beaglebone-capes: use backlight hack for all LCD4 variants

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-capes.bb         |    2 +-
 .../beagleboard/beaglebone-capes/cape-stop.sh      |    4 ++--
 recipes-ti/beagleboard/beaglebone-capes/cape.sh    |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index b463a89..ae9132e 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Userspace setup for beaglebone capes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r3"
+PR = "r4"
 
 inherit allarch
 
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
index 4950017..222a010 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh
@@ -5,8 +5,8 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 		"BB-BONE-LCD3-01.")
 				echo "Turning off backlight for LCD3 cape"
 				i2cset -f -y 1 0x24 0x07 0x00;;
-		"BB-BONE-LCD4-01.")
-				echo "Turning off backlight for LCD3 cape"
+		"BB-BONE-LCD4"*)
+				echo "Turning off backlight for LCD4 cape"
 				i2cset -f -y 1 0x24 0x07 0x00;;
 		*)
 				echo "unknown cape: $PARTNUMBER";;
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
index 566cdf5..c279349 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
@@ -6,7 +6,7 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 				echo "Turning on backlight for LCD3 cape"
 				i2cset -f -y 1 0x24 0x07 0x09
 				i2cset -f -y 1 0x24 0x08 0x60;;
-		"BB-BONE-LCD4-01.")
+		"BB-BONE-LCD4"*)
 				echo "Turning on backlight for LCD4 cape"
 				i2cset -f -y 1 0x24 0x07 0x09
 				i2cset -f -y 1 0x24 0x08 0x60;;


