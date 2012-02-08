Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BF44E01373
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 960C452A8C; Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062925.960C452A8C@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : gadget-init: adjust for kernel 3.2 based sysfs layout
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
X-List-Received-Date: Wed, 08 Feb 2012 06:29:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f244d42300e290fac43bedf875c199fa0e8ad2f5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f244d42300e290fac43bedf875c199fa0e8ad2f5

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Jan 31 16:34:00 2012 +0100

gadget-init: adjust for kernel 3.2 based sysfs layout

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 recipes-ti/beagleboard/gadget-init.bb              |   10 +++++-----
 .../beagleboard/gadget-init/99-hokey-pokey.rules   |    2 --
 .../gadget-init/g-ether-start-service.sh           |    4 ++--
 recipes-ti/beagleboard/gadget-init/hokey-pokey.sh  |    7 -------
 4 files changed, 7 insertions(+), 16 deletions(-)

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


