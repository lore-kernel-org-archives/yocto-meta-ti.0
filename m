Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CCDFE0044A
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 14:03:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7064352AA4; Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120611210315.7064352AA4@arago-project.org>
Date: Mon, 11 Jun 2012 21:03:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-capes: add support for weatherstation cape
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
X-List-Received-Date: Mon, 11 Jun 2012 21:03:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 03092005396f548c401ebbea5bf670c31614992a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=03092005396f548c401ebbea5bf670c31614992a

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Jun  7 17:40:44 2012 +0200

beaglebone-capes: add support for weatherstation cape

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/beaglebone-capes.bb      |    2 +-
 recipes-ti/beagleboard/beaglebone-capes/cape.sh |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index 2a9f1fb..b463a89 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Userspace setup for beaglebone capes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r2"
+PR = "r3"
 
 inherit allarch
 
diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
index 61240a5..566cdf5 100755
--- a/recipes-ti/beagleboard/beaglebone-capes/cape.sh
+++ b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
@@ -10,6 +10,12 @@ for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
 				echo "Turning on backlight for LCD4 cape"
 				i2cset -f -y 1 0x24 0x07 0x09
 				i2cset -f -y 1 0x24 0x08 0x60;;
+		"BB-BONE-WTHR-01.")
+				echo "Initializing I2C devices"
+				echo sht21 0x40 > /sys/class/i2c-adapter/i2c-3/new_device
+				echo bmp085 0x77 > /sys/class/i2c-adapter/i2c-3/new_device
+				echo tsl2550 0x39 > /sys/class/i2c-adapter/i2c-3/new_device
+				echo 1 > /sys/bus/i2c/devices/3-0039/operating_mode;;
 		*)
 				echo "unknown cape: $PARTNUMBER";;
 	esac


