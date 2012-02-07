Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39986E01386
	for <meta-ti@lists.yoctoproject.org>;
	Tue,  7 Feb 2012 03:14:32 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so6302851wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 07 Feb 2012 03:14:31 -0800 (PST)
Received: by 10.180.81.35 with SMTP id w3mr33252876wix.10.1328613271402;
	Tue, 07 Feb 2012 03:14:31 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm31456837wib.0.2012.02.07.03.14.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:14:30 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue,  7 Feb 2012 12:14:10 +0100
Message-Id: <1328613252-27915-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
References: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
Subject: [BeagleBone][PATCH 4/6] gadget-init: adjust for kernel 3.2 based sysfs layout
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
X-List-Received-Date: Tue, 07 Feb 2012 11:14:32 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/gadget-init.bb              |   10 +++++-----
 .../beagleboard/gadget-init/99-hokey-pokey.rules   |    2 --
 .../gadget-init/g-ether-start-service.sh           |    4 ++--
 recipes-ti/beagleboard/gadget-init/hokey-pokey.sh  |    7 -------
 4 files changed, 7 insertions(+), 16 deletions(-)
 delete mode 100644 recipes-ti/beagleboard/gadget-init/99-hokey-pokey.rules
 delete mode 100755 recipes-ti/beagleboard/gadget-init/hokey-pokey.sh

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index d016c09..150ff8e 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r13"
+PR = "r16"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -12,8 +12,6 @@ SRC_URI = "file://storage-gadget-init.service \
            file://network-gadget-init.service \
            file://udhcpd.service \
            file://udhcpd.conf \
-           file://99-hokey-pokey.rules \
-           file://hokey-pokey.sh \
            file://bone-gmass-eject.rules \
            file://udhcpd.rules \
            file://g-storage-reinsert.sh \
@@ -37,12 +35,14 @@ do_install() {
 
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
+
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "w    /sys/class/pwm/ehrpwm.1:0/polarity -    -    -    -   1" > ${D}${sysconfdir}/tmpfiles.d/lcd7.conf
 }
 
 PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
 
-FILES_${PN} = "${sysconfdir}/udev/rules.d/99-hokey-pokey.rules \
-               ${bindir}/hokey-pokey.sh \"
+FILES_${PN} = "${sysconfdir}/tmpfiles.d"
 
 FILES_${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
                        ${base_libdir}/systemd/system/basic.target.wants/storage-gadget-init.service \
diff --git a/recipes-ti/beagleboard/gadget-init/99-hokey-pokey.rules b/recipes-ti/beagleboard/gadget-init/99-hokey-pokey.rules
deleted file mode 100644
index bb3c8d3..0000000
--- a/recipes-ti/beagleboard/gadget-init/99-hokey-pokey.rules
+++ /dev/null
@@ -1,2 +0,0 @@
-ACTION=="remove", DEVPATH=="/devices/platform/omap/ti81xx-usbss/musb-hdrc.1/usb1/1-1",  RUN+="/usr/bin/hokey-pokey.sh"
-
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh b/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
index 076a5fe..6e73b15 100755
--- a/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
+++ b/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
-if [ -a /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file ]
+if [ -a /sys/devices/platform/omap/musb-ti81xx/musb-hdrc.0/gadget/lun0/file ]
 then
-	x=$(cat /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file)
+	x=$(cat /sys/devices/platform/omap/musb-ti81xx/musb-hdrc.0/gadget/lun0/file)
 	if [ -z "$x" ]
 	then
 		/bin/systemctl stop storage-gadget-init.service
diff --git a/recipes-ti/beagleboard/gadget-init/hokey-pokey.sh b/recipes-ti/beagleboard/gadget-init/hokey-pokey.sh
deleted file mode 100755
index 2139eb0..0000000
--- a/recipes-ti/beagleboard/gadget-init/hokey-pokey.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-sleep 1
-echo F > /proc/driver/musb_hdrc.1
-sleep 1
-echo F > /proc/driver/musb_hdrc.1
-
-- 
1.7.2.5


