Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E908E002A8
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 02:59:16 -0700 (PDT)
Received: by eaab16 with SMTP id b16so345445eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 02:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=VtX2TCQrIYBLbKdF2DvFwtjD9Yvoh/VLSB8DzOOCo1s=;
	b=oJyXEfHQRNXOYzzBCaS+97PO3JYuPD/yJ6BRQrhFnAr4zS1C8QgfM27YJoEF2lVUHi
	liSHUipp6d2OgzkvJG1xWVkOTbKqmofG4X8rCHDTldeO1f+byOg1XM+EfiBzYhKVthuG
	T5D7BJ+6qR9/529d48QTRNW2qjHqrv+oLBn3B4+7LR7gRjen/g4uG9m/URHBrD4O7W9j
	1TNDtzmN8bfirSHude15zHjmNW+Ur4spDiQHqxX+FdVGAW1U5QmzePGdVqdxCBTO5Qhm
	weh6yevIjJ+j4SFUXk73L0h3pz8dKaxQZEJaokWs4WWwwN4hL78yuWoG+ljma5CmjYUQ
	6D1Q==
Received: by 10.14.100.193 with SMTP id z41mr11367827eef.112.1342000755293;
	Wed, 11 Jul 2012 02:59:15 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a16sm4257468eeg.0.2012.07.11.02.59.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 02:59:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Jul 2012 11:58:28 +0200
Message-Id: <1342000711-18346-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342000711-18346-1-git-send-email-koen@dominion.thruhere.net>
References: <1342000711-18346-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQntqawRfK5JJLjfbLx3NWK/W+xHAbNYNIguBwg5rEXPXXi2Afr1CNTUxBiW0u0wwfw3a83u
Subject: [PATCH 5/8] beaglebone-capes: use backlight hack for all LCD4 variants
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
X-List-Received-Date: Wed, 11 Jul 2012 09:59:16 -0000

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


