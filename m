Return-Path: <joelagnel@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83D69E00307
	for <meta-ti@yoctoproject.org>; Wed,  9 Nov 2011 22:05:09 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAA658ce016009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Thu, 10 Nov 2011 00:05:08 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAA658Vi019912
	for <meta-ti@yoctoproject.org>; Thu, 10 Nov 2011 00:05:08 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAA658sI006383
	for <meta-ti@yoctoproject.org>; Thu, 10 Nov 2011 00:05:08 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 10 Nov 2011 00:05:07 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pAA657Fm006638;	Thu, 10 Nov 2011 00:05:07 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 10 Nov 2011 00:06:35 -0600
Message-ID: <1320905196-2476-1-git-send-email-joelagnel@ti.com>
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
X-List-Received-Date: Thu, 10 Nov 2011 06:05:09 -0000
Content-Type: text/plain

* Add rule to start network-gadget when mass storage is ejected
* Add network-gadget-init service and scripts to switch to g_ether
* Add DHCP service / conf
* Update to storage-gadget: rmmod on stop

v2 changes:
* Fix g-ether MAC address by reading from mac_id
* Split into multiple packages

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
Note about an issue:
This works correctly except that the usb0 iface doesn't come up automatically and
has to be manually ifup'ed after the gadget module loads.

 recipes-ti/beagleboard/gadget-init.bb              |   31 ++++++++++++-
 .../beagleboard/gadget-init/bone-gmass-eject.rules |    1 +
 recipes-ti/beagleboard/gadget-init/g-ether-load.sh |   46 ++++++++++++++++++++
 .../gadget-init/g-ether-start-service.sh           |   11 +++++
 .../beagleboard/gadget-init/g-storage-reinsert.sh  |    4 ++
 .../gadget-init/network-gadget-init.service        |    9 ++++
 .../gadget-init/storage-gadget-init.service        |    2 +
 recipes-ti/beagleboard/gadget-init/udhcpd.conf     |    5 ++
 recipes-ti/beagleboard/gadget-init/udhcpd.service  |   11 +++++
 9 files changed, 117 insertions(+), 3 deletions(-)
 create mode 100644 recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
 create mode 100755 recipes-ti/beagleboard/gadget-init/g-ether-load.sh
 create mode 100755 recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
 create mode 100755 recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
 create mode 100644 recipes-ti/beagleboard/gadget-init/network-gadget-init.service
 create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.conf
 create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.service

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index ee51586..defef63 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r3"
+PR = "r8"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -9,13 +9,21 @@ COMPATIBLE_MACHINE = "(ti33x)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://storage-gadget-init.service \
+           file://network-gadget-init.service \
+           file://udhcpd.service \
+           file://udhcpd.conf \
            file://99-hokey-pokey.rules \
            file://hokey-pokey.sh \
+           file://bone-gmass-eject.rules \
+           file://g-storage-reinsert.sh \
+           file://g-ether-start-service.sh \
+           file://g-ether-load.sh \
           "
 
 do_install() {
 	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
 	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system
+
 	for i in ${WORKDIR}/*.service ; do
 		install -m 0644 $i ${D}${base_libdir}/systemd/system
 		ln -sf ../$(basename $i) ${D}${base_libdir}/systemd/system/basic.target.wants/
@@ -23,10 +31,27 @@ do_install() {
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
+	install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
 
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
-
 }
 
-FILES_${PN} = "${base_libdir}/systemd ${sysconfdir} ${bindir}"
+PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
+
+FILES_${PN} = "${sysconfdir}/udev/rules.d/99-hokey-pokey.rules \
+               ${bindir}/hokey-pokey.sh \"
+
+FILES_${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
+                       ${base_libdir}/systemd/system/basic.target.wants/storage-gadget-init.service \
+                       ${bindir}/g-storage-reinsert.sh \
+                       ${sysconfdir}/udev/rules.d/bone-gmass-eject.rules"
+
+FILES_${PN}-network = "${base_libdir}/systemd/system/network-gadget-init.service \
+                       ${bindir}/g-ether-load.sh \
+                       ${bindir}/g-ether-start-service.sh"
+
+FILES_${PN}-udhcpd = "${base_libdir}/systemd/system/udhcpd.service \
+                      ${sysconfdir}/udhcpd.conf"
+
+RRECOMMENDS_${PN} = "${PN}-storage ${PN}-network ${PN}-udhcpd"
diff --git a/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
new file mode 100644
index 0000000..ee6f93e
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="block",ACTION=="change",KERNEL=="mmcblk0p1",RUN+="/usr/bin/g-ether-start-service.sh"
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-load.sh b/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
new file mode 100755
index 0000000..f940064
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+function get_devmem()
+{
+	/usr/bin/devmem2 $1 | grep ": " | cut -d ":" -f 2|cut -d "x" -f 2
+}
+
+function hex_to_mac_addr()
+{
+	addr=$1
+	n=0
+	mac_addr=$(echo ${addr} | while read -r -n2 c; do 
+		if [ ! -z "$c" ]; then
+			if [ $n -ne 0 ] ; then
+				echo -n ":${c}"
+			else
+				echo -n "${c}"
+			fi
+		fi
+		n=$(($n+1))
+	done)
+	echo ${mac_addr}
+}
+
+function reverse_bytes()
+{
+	addr=$1
+	New_addr=$(echo ${addr} | while read -r -n2 c; do 
+		if [ ! -z "$c" ]; then
+			New_addr=${c}${New_addr}
+		else echo
+			echo ${New_addr}
+		fi
+	done)
+	echo ${New_addr}
+}
+
+DEVMEM_ADDR_LO=$(get_devmem 0x44e10638|bc)
+DEVMEM_ADDR_LO=$(reverse_bytes ${DEVMEM_ADDR_LO})
+
+DEVMEM_ADDR_HI=$(get_devmem 0x44e1063C)
+DEVMEM_ADDR_HI=$(reverse_bytes ${DEVMEM_ADDR_HI})
+
+DEV_ADDR=$(hex_to_mac_addr "${DEVMEM_ADDR_HI}${DEVMEM_ADDR_LO}")
+
+modprobe g_ether host_addr=${DEV_ADDR}
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh b/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
new file mode 100755
index 0000000..2db16c2
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+if [ -a /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file ]
+then
+	x=$(cat /sys/devices/platform/omap/ti81xx-usbss/musb-hdrc.0/gadget/lun0/file)
+	if [ -z "$x" ]
+	then
+		/bin/systemctl stop storage-gadget-init.service
+		/bin/systemctl start network-gadget-init.service
+		/bin/systemctl start udhcpd.service
+	fi
+fi
diff --git a/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
new file mode 100755
index 0000000..d358640
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+/bin/systemctl stop storage-gadget-init.service
+/bin/systemctl stop network-gadget-init.service
+/bin/systemctl start storage-gadget-init.service
diff --git a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
new file mode 100644
index 0000000..979d8aa
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Start USB Ethernet gadget
+Conflicts=storage-gadget-init.service
+
+[Service]
+RemainAfterExit=yes
+ExecStart=/usr/bin/g-ether-load.sh
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


