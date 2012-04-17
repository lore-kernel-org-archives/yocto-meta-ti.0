Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E889E00596
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:57 -0700 (PDT)
Received: by mail-wi0-f182.google.com with SMTP id hr14so489410wib.11
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=TzSH7IUmnR/6EcbjE3IHf6xgUYl1F0gB61LqYUeqhYU=;
	b=jzy6jxKV8dAs9AC/AfIi7m2qq2JAIvjRs2J469kjo5Yr97ZPNzT5MTJ13dba3IYHlB
	IqJD5jXVQqr/dqf6iFz6bfDcF56a1jF/uCyfEcf9rGGhFVMmN9EOGWmVD/Jvtp4O1AP6
	xEVlrnaWXbOj3V9figpWsbN7fi5Q/uKqxrscN8sORljOK7yGBC8fpWUlDCRD387/JC6u
	f7tlVTFwK6mTGgC4nv1ay8GjEXzC6fYBsNGnSZ8V8u5iN93j97BpDBqQL7LVM2VwaZay
	OFhNv72UVxI4L62lp5B0p6rqjMScT1D3RWJTDl0nd9rm/q4QDeTZiFoQdChRBDdH54+/
	zO/Q==
Received: by 10.180.81.166 with SMTP id b6mr6986923wiy.0.1334666876669;
	Tue, 17 Apr 2012 05:47:56 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id h8sm43059174wix.4.2012.04.17.05.47.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:47:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:42 +0200
Message-Id: <1334666866-24955-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkkNU3JTb1CdsX9At8qjUWDqG1CDVi7+ma8jQkM7UFH2i2NNIT7ejrUSzTrKugrYSHros4x
Cc: denys@ti.com
Subject: [PATCH v2 3/7] beaglebone-capes: userspace support for capes
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
X-List-Received-Date: Tue, 17 Apr 2012 12:47:57 -0000

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


