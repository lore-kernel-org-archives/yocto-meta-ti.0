Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39309E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:11:46 -0700 (PDT)
Received: by wibhm6 with SMTP id hm6so181589wib.11
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Ec8Ds8sbwsaAbVLTVsP0ceV9FcZLbnxYH45eJ36cKMg=;
	b=Z2LbKAYebaTil/QxcupA5elOpNC917V9uyPfUnz+LNOTD5apZqgTs87zGAi9qr5QA5
	j1FdaDANuKx+0dFrgjY7EP4lQohRJ1g1I84qQTSWgsWE2Fdf5i8rkffUJpvX+BYyW9Z/
	jY1y60PNiwoVg4cvupy4S5CQ3lq7S/cQK9It7vUg5GZcPlaRrId89dXyTjZFT5XxJxuN
	RdMQIUODnR7alV7/DkNPJqLV73GiAOeeJGqcjhvgGOk+LqG3GvpCOspTbPaBrzClXkGO
	WPRtpBSXpnEerfbLhNdcPshkszFocmh4JmTP8vgp3yUpHQcBqwxPWN3PuCS15ZG/PGP/
	Z2dw==
Received: by 10.216.142.38 with SMTP id h38mr7411594wej.54.1337350305294;
	Fri, 18 May 2012 07:11:45 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id eb8sm1212215wib.11.2012.05.18.07.11.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 07:11:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri, 18 May 2012 16:11:39 +0200
Message-Id: <1337350299-26498-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnzaos9+iL+QhCJoE6VmKdYFzeRmsJ+riOo4xfXp/01fgvtSW5Fd5zTwB1A1RMFJ9EEmsnb
Cc: denys@ti.com
Subject: [PATCH] beaglebone-capes: add a powerdown script as well
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
X-List-Received-Date: Fri, 18 May 2012 14:11:46 -0000

The current powerdown script disables the PMIC backlight

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-capes.bb           |    5 ++++-
 recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh |   11 +++++++++++
 recipes-ti/beagleboard/beaglebone-capes/cape.service |    3 +++
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100755 recipes-ti/beagleboard/beaglebone-capes/cape-stop.sh

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
-- 
1.7.10


