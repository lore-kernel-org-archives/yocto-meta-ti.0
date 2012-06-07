Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB859E0144E
	for <meta-ti@yoctoproject.org>; Thu,  7 Jun 2012 08:41:03 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so313432eek.35
	for <meta-ti@yoctoproject.org>; Thu, 07 Jun 2012 08:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1XCjSBnxHGE808CGaK8SWDuT9w13Qagp+zup58cYA3U=;
	b=NyiOd6LgvSdgz8eJr78dB0QY2v9mET/xG4THz9nOORyGrfcGlwBoIa41ERQeWJ/jCW
	92jPpXFPXWkciFlHygH3hwX0qq2FgzClbteSbdtEqkWJ22Qc0GO6Tg3MGMTIJXQTGxTE
	fz0tP0mUeDLUUaWtnvJE+zYuC/CSmFF8DHydfmtQj2hWNy8jQMoGaoy/GfiWbOndzLfi
	Ujg0jj7W9hmknfxa9jiEr9ZJ1PnkcBtHb+8QKpC1na4rWpV9GYUJ8iCzVVKIur4wOpTE
	dU5rgE5p6tEkzscW4BEbvvq8Zotmle0Jcu/msPXXOYZkM+oK5+NL1UKW+WwOZZHLaZwD
	jBdQ==
Received: by 10.14.53.80 with SMTP id f56mr1451494eec.168.1339083663376;
	Thu, 07 Jun 2012 08:41:03 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id m5sm12115801eeh.17.2012.06.07.08.41.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 08:41:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  7 Jun 2012 17:40:43 +0200
Message-Id: <1339083645-18356-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
References: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlhPHl8ITxm9RYGWbjpqBEX/bS9k7rkHxXqYvbLPRNvSxu2FRGQEK3+683NismWw3c5SnzR
Cc: denys@ti.com
Subject: [PATCHv2 5/7] beaglebone-capes: add support for 4.3" LCD cape
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
X-List-Received-Date: Thu, 07 Jun 2012 15:41:04 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-capes.bb           |    2 +-
 recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh |    3 +++
 recipes-ti/beagleboard/beaglebone-capes/cape.sh      |    4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

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
-- 
1.7.10


