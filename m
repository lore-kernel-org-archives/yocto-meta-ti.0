Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2D78E013FB
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2012 06:18:41 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so4564326wib.11
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2012 06:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=TzSH7IUmnR/6EcbjE3IHf6xgUYl1F0gB61LqYUeqhYU=;
	b=eBNK0n2Y3GyXe1zgiX5jCDTufwllbTb5BieKrEh7bai0urIrCcB3snJHrO0ToaOn0H
	EBvZptlLoLHd2+AfOzExcqjRyVRn8S1phtKNwXj+wHs/rTnpHOb4RVjTuK+3k1jsC/oi
	O0AloFehmtDVkFcMrIE7NTFCftV+DxAJIgIBNlmFgnP2TNwwGppPpuY0lgRe4W9pbMbp
	VH9d74siqsJVZ4ICmCvy6rlP5SV2hmShONjbN94dCr+Fm9uTsb/RAd5+oUD9N3oRPbZY
	GYxy7UH7h5+sKQjUSIWxaTmminDRO5SyFQxJXK5q1ANKg97YTdm0yP9L5YKfjwoVvt2I
	YI0Q==
Received: by 10.216.45.146 with SMTP id p18mr6771092web.47.1334582320214;
	Mon, 16 Apr 2012 06:18:40 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 17sm19995323wis.0.2012.04.16.06.18.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 06:18:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 16 Apr 2012 15:18:34 +0200
Message-Id: <1334582314-13693-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQm0zhqD2onIrIV5BMpgiLrqG5kMaWA7zT+G80+PcxXoeSWLmd0Y3sAmzJ3ubr2AIwIk5F2u
Cc: denys@ti.com
Subject: [PATCH] beaglebone-capes: userspace support for capes
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
X-List-Received-Date: Mon, 16 Apr 2012 13:18:42 -0000

Not everything can be done inside the kernel yet, so have a script that does the userspace portion.
Only the LCD3 cape is supported currently, more will follow later.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-capes.bb         |   23 ++++++++++++++++++++
 .../beagleboard/beaglebone-capes/cape.service      |    8 +++++++
 recipes-ti/beagleboard/beaglebone-capes/cape.sh    |   12 ++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/beagleboard/beaglebone-capes.bb
 create mode 100644 recipes-ti/beagleboard/beaglebone-capes/cape.service
 create mode 100755 recipes-ti/beagleboard/beaglebone-capes/cape.sh

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
-- 
1.7.2.5


