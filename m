Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE7F3E01452
	for <meta-ti@yoctoproject.org>; Thu,  7 Jun 2012 08:41:06 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so313432eek.35
	for <meta-ti@yoctoproject.org>; Thu, 07 Jun 2012 08:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=2eG+XGC65EPd+zMK6syWivS7oNn4fIxgLBjsEi5tGe4=;
	b=l7NQawz7L7vuA8/EwP6d3o8W/vUM3wcKXkuEi1KZS7K+y6vJ1x+C3KV3qpRHkkmcVL
	MACof4u+E+4io8lYLCjzHIq8aknsFDSYEcwSt8Fs5hy/3TuRCoJe7OfwiUVmqUdVVUBy
	nM/fikoSrqvxbQPw65cYBs107KHxwupX9M+nEqVAZdjEnKiMv/p1q7y/TNVajtMb/jOO
	k1xyH2hIY/AErhw8vtrAughkWjs1FvX3y624ZkYRF/mLWbjdtvwns3RgtkRhwfTK0P+I
	xW/6JAZLjoK1JagbN5FCcfeSh0sTCGHXDnkNpllZRC22eEG4uH4fEa//nnl7pLxIJvkL
	W9kg==
Received: by 10.14.96.204 with SMTP id r52mr1337438eef.58.1339083666028;
	Thu, 07 Jun 2012 08:41:06 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id c13sm12185127eeb.7.2012.06.07.08.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 08:41:05 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  7 Jun 2012 17:40:44 +0200
Message-Id: <1339083645-18356-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
References: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQncsM0qTr61yYejNx0xJ6BY5zZI/C6X0RD+jdDSDwZOuvvMGfwxIAecR0fPj3QMaBbVkSt8
Cc: denys@ti.com
Subject: [PATCHv2 6/7] beaglebone-capes: add support for weatherstation cape
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
X-List-Received-Date: Thu, 07 Jun 2012 15:41:07 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-capes.bb      |    2 +-
 recipes-ti/beagleboard/beaglebone-capes/cape.sh |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
-- 
1.7.10


