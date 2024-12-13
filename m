Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3ACE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 16:22:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19674.1734106921574828446
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 08:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OIiB4gmn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BDGLx6F103960;
	Fri, 13 Dec 2024 10:21:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734106919;
	bh=8rQZkIrJLaFyMAWBp3caZVI5DdOe4kbzkhsI6BKk9bQ=;
	h=From:To:CC:Subject:Date;
	b=OIiB4gmnAe0eU9RIPdXhhAcc/0UFAYsK5f5mn7mDMPvBpdAIJCB/FcMq1RRy9lSSz
	 7TBp9d8j5g1CZONBpRETpHuDPCpxxhmToA6eQQViJwAp5pccdgvZ41f97anm3vYSS7
	 9fZWdqjQ6cP/3R/oog8PkOwmSeM2prVYffWU4uv0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDGLxIs119404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Dec 2024 10:21:59 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 10:21:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 10:21:59 -0600
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDGLxrF065393;
	Fri, 13 Dec 2024 10:21:59 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] meta-ti-extras: recipes-ti: Remove gadget-init package
Date: Fri, 13 Dec 2024 10:21:59 -0600
Message-ID: <20241213162159.59221-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 16:22:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18105

As the patch that added these states, this is an ugly hack, the issues
involved are fixed and no longer relevant, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/beagleboard/gadget-init.bb     | 60 -------------------
 .../gadget-init/bone-gmass-eject.rules        |  1 -
 .../beagleboard/gadget-init/g-ether-load.sh   | 46 --------------
 .../gadget-init/g-ether-start-service.sh      | 10 ----
 .../gadget-init/g-storage-reinsert.sh         |  4 --
 .../gadget-init/network-gadget-init.service   | 11 ----
 .../gadget-init/storage-gadget-init.service   | 11 ----
 .../beagleboard/gadget-init/udhcpd.conf       |  5 --
 .../beagleboard/gadget-init/udhcpd.rules      |  2 -
 .../beagleboard/gadget-init/udhcpd.service    | 12 ----
 .../update-image-info-on-mmcblk0p1.sh         | 37 ------------
 11 files changed, 199 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
 delete mode 100755 meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
 delete mode 100755 meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
 delete mode 100755 meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
 delete mode 100644 meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service
 delete mode 100755 meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh

diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
deleted file mode 100644
index f22583c0..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-DESCRIPTION = "Units to initialize usb gadgets"
-
-PR = "r19"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-COMPATIBLE_MACHINE = "(ti33x)"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRC_URI = "file://storage-gadget-init.service \
-           file://network-gadget-init.service \
-           file://udhcpd.service \
-           file://udhcpd.conf \
-           file://bone-gmass-eject.rules \
-           file://udhcpd.rules \
-           file://g-storage-reinsert.sh \
-           file://g-ether-start-service.sh \
-           file://g-ether-load.sh \
-           file://update-image-info-on-mmcblk0p1.sh \
-          "
-
-do_install() {
-	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
-	install -m 0644 ${UNPACKDIR}/*.service ${D}${base_libdir}/systemd/system
-
-	for i in ${UNPACKDIR}/storage-gadget-init.service ; do
-		install -m 0644 $i ${D}${base_libdir}/systemd/system
-		ln -sf ../$(basename $i) ${D}${base_libdir}/systemd/system/basic.target.wants/
-	done
-
-	install -d ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${UNPACKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${UNPACKDIR}/*.conf ${D}${sysconfdir}
-
-	install -d ${D}${bindir}
-	install -m 0755 ${UNPACKDIR}/*.sh ${D}${bindir}
-}
-
-PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
-
-ALLOW_EMPTY:${PN} = "1"
-
-FILES:${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
-                       ${base_libdir}/systemd/system/basic.target.wants/storage-gadget-init.service \
-                       ${bindir}/g-storage-reinsert.sh \
-                       ${bindir}/update-image-info-on-mmcblk0p1.sh \
-                       ${sysconfdir}/udev/rules.d/bone-gmass-eject.rules"
-
-FILES:${PN}-network = "${base_libdir}/systemd/system/network-gadget-init.service \
-                       ${base_libdir}/systemd/system/basic.target.wants/network-gadget-init.service \
-                       ${bindir}/g-ether-load.sh \
-                       ${bindir}/g-ether-start-service.sh \
-                       ${sysconfdir}/udev/rules.d/udhcpd.rules"
-
-FILES:${PN}-udhcpd = "${base_libdir}/systemd/system/udhcpd.service \
-                      ${base_libdir}/systemd/system/basic.target.wants/udhcpd.service \
-                      ${sysconfdir}/udhcpd.conf"
-
-RRECOMMENDS:${PN} = "${PN}-storage ${PN}-network ${PN}-udhcpd"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
deleted file mode 100644
index ee6f93e2..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/bone-gmass-eject.rules
+++ /dev/null
@@ -1 +0,0 @@
-SUBSYSTEM=="block",ACTION=="change",KERNEL=="mmcblk0p1",RUN+="/usr/bin/g-ether-start-service.sh"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
deleted file mode 100755
index f9400649..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-load.sh
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/sh
-
-function get_devmem()
-{
-	/usr/bin/devmem2 $1 | grep ": " | cut -d ":" -f 2|cut -d "x" -f 2
-}
-
-function hex_to_mac_addr()
-{
-	addr=$1
-	n=0
-	mac_addr=$(echo ${addr} | while read -r -n2 c; do 
-		if [ ! -z "$c" ]; then
-			if [ $n -ne 0 ] ; then
-				echo -n ":${c}"
-			else
-				echo -n "${c}"
-			fi
-		fi
-		n=$(($n+1))
-	done)
-	echo ${mac_addr}
-}
-
-function reverse_bytes()
-{
-	addr=$1
-	New_addr=$(echo ${addr} | while read -r -n2 c; do 
-		if [ ! -z "$c" ]; then
-			New_addr=${c}${New_addr}
-		else echo
-			echo ${New_addr}
-		fi
-	done)
-	echo ${New_addr}
-}
-
-DEVMEM_ADDR_LO=$(get_devmem 0x44e10638|bc)
-DEVMEM_ADDR_LO=$(reverse_bytes ${DEVMEM_ADDR_LO})
-
-DEVMEM_ADDR_HI=$(get_devmem 0x44e1063C)
-DEVMEM_ADDR_HI=$(reverse_bytes ${DEVMEM_ADDR_HI})
-
-DEV_ADDR=$(hex_to_mac_addr "${DEVMEM_ADDR_HI}${DEVMEM_ADDR_LO}")
-
-modprobe g_ether host_addr=${DEV_ADDR}
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
deleted file mode 100755
index 6e73b155..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-if [ -a /sys/devices/platform/omap/musb-ti81xx/musb-hdrc.0/gadget/lun0/file ]
-then
-	x=$(cat /sys/devices/platform/omap/musb-ti81xx/musb-hdrc.0/gadget/lun0/file)
-	if [ -z "$x" ]
-	then
-		/bin/systemctl stop storage-gadget-init.service
-		/bin/systemctl start network-gadget-init.service
-	fi
-fi
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
deleted file mode 100755
index d358640a..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/g-storage-reinsert.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-/bin/systemctl stop storage-gadget-init.service
-/bin/systemctl stop network-gadget-init.service
-/bin/systemctl start storage-gadget-init.service
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadget-init.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
deleted file mode 100644
index 0ee29147..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Start USB Ethernet gadget
-Conflicts=storage-gadget-init.service
-
-[Service]
-RemainAfterExit=yes
-ExecStart=/usr/bin/g-ether-load.sh
-ExecStop=/sbin/rmmod g_ether
-
-[Install]
-WantedBy=gether.target
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
deleted file mode 100644
index 9a8513e8..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Start usb mass storage gadget
-After=dev-mmcblk0p1.device
-
-[Service]
-RemainAfterExit=yes
-ExecStart=/sbin/modprobe g_mass_storage file=/dev/mmcblk0p1 cdrom=0 stall=0 removable=1 nofua=1
-ExecStop=/sbin/rmmod g_mass_storage
-
-[Install]
-WantedBy=basic.target
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
deleted file mode 100644
index 3bcf00f0..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-start      192.168.7.1
-end        192.168.7.1
-interface  usb0
-max_leases 1
-option subnet 255.255.255.252
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
deleted file mode 100644
index db65f9ac..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.rules
+++ /dev/null
@@ -1,2 +0,0 @@
-SUBSYSTEM=="net",ACTION=="add",KERNEL=="usb0",RUN+="/sbin/ifconfig usb0 192.168.7.2 netmask 255.255.255.252",RUN+="/bin/systemctl start udhcpd.service"
-SUBSYSTEM=="net",ACTION=="remove",KERNEL=="usb0",RUN+="/bin/systemctl stop udhcpd.service"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service
deleted file mode 100644
index 1f4ac688..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/udhcpd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=DHCP server for USB0 network gadget
-After=dev-usb0.device
-Conflicts=storage-gadget-init.service
-
-[Service]
-ExecStart=/usr/sbin/udhcpd -f -S /etc/udhcpd.conf
-ExecStop=/bin/kill -TERM $MAINPID
-KillSignal=SIGINT
-
-[Install]
-WantedBy=gether.target
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh b/meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
deleted file mode 100755
index a4daf734..00000000
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
+++ /dev/null
@@ -1,37 +0,0 @@
-#!/bin/sh
-mount /dev/mmcblk0p1 /mnt
-echo "Image info snapshot" > /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "/etc/angstrom-version:" >> /mnt/info.txt
-cat /etc/angstrom-version >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "/proc/cpuinfo:" >> /mnt/info.txt
-cat /proc/cpuinfo >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "uname -a:" >> /mnt/info.txt
-uname -a >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "/proc/cmdline:" >> /mnt/info.txt
-cat /proc/cmdline >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "ifconfig:" >> /mnt/info.txt
-ifconfig >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "/etc/angstrom-build-info:" >> /mnt/info.txt
-cat /etc/angstrom-build-info >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "/etc/image-version-info:" >> /mnt/info.txt
-cat /etc/image-version-info >> /mnt/info.txt
-
-echo >> /mnt/info.txt
-echo "opkg list-installed:" >> /mnt/info.txt
-opkg list-installed >> /mnt/info.txt
-
-umount /mnt
-- 
2.39.2


