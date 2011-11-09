Return-Path: <joelagnel@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B593FE0132F
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 08:01:04 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA9G13RD003769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 9 Nov 2011 10:01:03 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA9G13iZ008503
	for <meta-ti@yoctoproject.org>; Wed, 9 Nov 2011 10:01:03 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA9G139d025215
	for <meta-ti@yoctoproject.org>; Wed, 9 Nov 2011 10:01:03 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Wed, 9 Nov 2011
	10:01:03 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pA9G12AE006401;	Wed, 9 Nov 2011 10:01:02 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 9 Nov 2011 10:02:24 -0600
Message-ID: <1320854545-31502-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] gadget-init: Add network-gadget services and other fixes
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
X-List-Received-Date: Wed, 09 Nov 2011 16:01:05 -0000
Content-Type: text/plain

* Add rule to start network-gadget when mass storage is ejected
* Add network-gadget-init service and scripts to switch to g_ether
* Add DHCP service / conf
* Update to storage-gadget: rmmod on stop

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/gadget-init.bb              |   10 ++++++++--
 .../beagleboard/gadget-init/bone-gmass-eject.rules |    1 +
 .../beagleboard/gadget-init/g-ether-insert.sh      |   11 +++++++++++
 .../beagleboard/gadget-init/g-storage-reinsert.sh  |    4 ++++
 .../gadget-init/network-gadget-init.service        |    9 +++++++++
 .../gadget-init/storage-gadget-init.service        |    2 ++
 recipes-ti/beagleboard/gadget-init/udhcpd.conf     |    5 +++++
 recipes-ti/beagleboard/gadget-init/udhcpd.service  |   11 +++++++++++
 8 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
 create mode 100755 recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
 create mode 100755 recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
 create mode 100644 recipes-ti/beagleboard/gadget-init/network-gadget-init.service
 create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.conf
 create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.service

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index ee51586..7b440ff 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r3"
+PR = "r4"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -9,8 +9,14 @@ COMPATIBLE_MACHINE = "(ti33x)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://storage-gadget-init.service \
+           file://network-gadget-init.service \
+           file://udhcpd.service \
+           file://udhcpd.conf \
            file://99-hokey-pokey.rules \
            file://hokey-pokey.sh \
+           file://bone-gmass-eject.rules \
+           file://g-storage-reinsert.sh \
+           file://g-ether-insert.sh \
           "
 
 do_install() {
@@ -23,10 +29,10 @@ do_install() {
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
+	install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
 
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
-
 }
 
 FILES_${PN} = "${base_libdir}/systemd ${sysconfdir} ${bindir}"
diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
new file mode 100644
index 0000000..fa5d627
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="block",ACTION=="change",KERNEL=="mmcblk0p1",RUN+="/usr/sbin/g-ether-insert.sh"
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
new file mode 100755
index 0000000..6c6956e
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/g-ether-insert.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+if [ -a /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file ]
+then
+	x=`cat /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file`
+	if [ "$x" == ""  ]
+	then
+		/bin/systemctl stop storage-gadget-init.service
+		/bin/systemctl start network-gadget-init.service
+		/bin/systemctl start udhcpd.service
+	fi
+fi
diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
new file mode 100755
index 0000000..546b438
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
@@ -0,0 +1,4 @@
+#!/bin/bash
+/bin/systemctl stop storage-gadget-init.service
+/bin/systemctl stop network-gadget-init.service
+/bin/systemctl start storage-gadget-init.service
diff --git a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
new file mode 100644
index 0000000..0a03898
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Start USB Ethernet gadget
+Conflicts=storage-gadget-init.service
+
+[Service]
+RemainAfterExit=yes
+ExecStart=/sbin/modprobe g_ether host_addr=00:dc:c8:f7:75:05 dev_addr=00:dd:dc:eb:6d:f1
+ExecStartPost=/sbin/ifconfig usb0 192.168.7.2 netmask 255.255.255.252
+ExecStop=/sbin/rmmod g_ether
diff --git a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
index 2fe48e1..9a8513e 100644
--- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
+++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
@@ -3,7 +3,9 @@ Description=Start usb mass storage gadget
 After=dev-mmcblk0p1.device
 
 [Service]
+RemainAfterExit=yes
 ExecStart=/sbin/modprobe g_mass_storage file=/dev/mmcblk0p1 cdrom=0 stall=0 removable=1 nofua=1
+ExecStop=/sbin/rmmod g_mass_storage
 
 [Install]
 WantedBy=basic.target
diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.conf b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
new file mode 100644
index 0000000..3bcf00f
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/udhcpd.conf
@@ -0,0 +1,5 @@
+start      192.168.7.1
+end        192.168.7.1
+interface  usb0
+max_leases 1
+option subnet 255.255.255.252
diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.service b/recipes-ti/beagleboard/gadget-init/udhcpd.service
new file mode 100644
index 0000000..f076673
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/udhcpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=DHCP server for USB0 network gadget
+After=sys-devices-platform-omap-ti81xx\x2dusbss-musb\x2dhdrc.0-gadget-net-usb0.device
+
+[Service]
+ExecStart=/usr/sbin/udhcpd -f -S /etc/udhcpd.conf
+ExecStop=/bin/kill -TERM $MAINPID
+KillSignal=SIGINT
+
+[Install]
+WantedBy=basic.target
-- 
1.7.0.4


