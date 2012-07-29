Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CFEFE0034C
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:17 -0700 (PDT)
Received: by eekd41 with SMTP id d41so1131520eek.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=VtX2TCQrIYBLbKdF2DvFwtjD9Yvoh/VLSB8DzOOCo1s=;
	b=adep9TV4HjpMZ3gZcrNr1gWnwirLipwedetgy45v4n7xq1zv2v5vJn5WZeg0T85cSE
	9gbGM8I2raiGo++udS2UgLyFj7iv3obgt9wAg+ZvwS9de64Kj5lcc5Hfydd0FnKacDi+
	B3OQ+4u9rv2s3tbJK0NW0zQboQs8LseFMwmdxduwr6/CekMKB9i0M4lBKhVIeZfM3be3
	0wr7lsEQh/9aTEDHNUo47zwVDLrnVMGMVUeXFi/NIxbsAPvHOJYhCm7F90TO228OsmJU
	ivipAdCxUuXmIGvaHZOITWyEZwpscc0Mo/jLfDnITmY41on/Z2KhZG/V8XEvQKF8gvla
	GNVA==
Received: by 10.14.3.132 with SMTP id 4mr9148161eeh.9.1343581756096;
	Sun, 29 Jul 2012 10:09:16 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t6sm21523701eeo.17.2012.07.29.10.09.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:27 +0200
Message-Id: <1343581714-20397-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkj5ZBXpy5pwBW+qUICTqedM1sj97h28x/jC3IMcVfYAU6QmKj63bL6a+iDuS06QhxxGyvk
Subject: [PATCH][for-denzil 05/12] beaglebone-capes: use backlight hack for all LCD4 variants
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:17 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-capes.bb           |    2 +-
 recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh |    4 ++--
 recipes-ti/beagleboard/beaglebone-capes/cape.sh      |    2 +-
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
-- 
1.7.10


