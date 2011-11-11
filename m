Return-Path: <joelagnel@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F16B3E0030A
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 06:50:22 -0800 (PST)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pABEoMSM015002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 08:50:22 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pABEoLPE026857
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 08:50:21 -0600 (CST)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pABEoLN7020581
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 08:50:21 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 11 Nov 2011 08:50:21 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pABEoKEC005364;	Fri, 11 Nov 2011 08:50:21 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 11 Nov 2011 08:51:47 -0600
Message-ID: <1321023107-6072-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] udhcpd: Fixes and new udev rule
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
X-List-Received-Date: Fri, 11 Nov 2011 14:50:23 -0000
Content-Type: text/plain

This moves the logic to configure and start dhcp to a udev rule which
is a better place than a systemd service

Also fixes a bug where stopping and starting network service would
cause dhcp to fail.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/gadget-init.bb              |    6 ++++--
 .../gadget-init/g-ether-start-service.sh           |    1 -
 .../gadget-init/network-gadget-init.service        |    3 +--
 recipes-ti/beagleboard/gadget-init/udhcpd.rules    |    2 ++
 4 files changed, 7 insertions(+), 5 deletions(-)
 create mode 100644 recipes-ti/beagleboard/gadget-init/udhcpd.rules

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 8ddefaa..0d4682e 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r10"
+PR = "r11"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -15,6 +15,7 @@ SRC_URI = "file://storage-gadget-init.service \
            file://99-hokey-pokey.rules \
            file://hokey-pokey.sh \
            file://bone-gmass-eject.rules \
+           file://udhcpd.rules \
            file://g-storage-reinsert.sh \
            file://g-ether-start-service.sh \
            file://g-ether-load.sh \
@@ -50,7 +51,8 @@ FILES_${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service
 FILES_${PN}-network = "${base_libdir}/systemd/system/network-gadget-init.service \
                        ${base_libdir}/systemd/system/basic.target.wants/network-gadget-init.service \
                        ${bindir}/g-ether-load.sh \
-                       ${bindir}/g-ether-start-service.sh"
+                       ${bindir}/g-ether-start-service.sh \
+                       ${sysconfdir}/udev/rules.d/udhcpd.rules"
 
 FILES_${PN}-udhcpd = "${base_libdir}/systemd/system/udhcpd.service \
                       ${base_libdir}/systemd/system/basic.target.wants/udhcpd.service \
diff --git a/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh b/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
index 2db16c2..076a5fe 100755
--- a/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
+++ b/recipes-ti/beagleboard/gadget-init/g-ether-start-service.sh
@@ -6,6 +6,5 @@ then
 	then
 		/bin/systemctl stop storage-gadget-init.service
 		/bin/systemctl start network-gadget-init.service
-		/bin/systemctl start udhcpd.service
 	fi
 fi
diff --git a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
index 1e22627..0ee2914 100644
--- a/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
+++ b/recipes-ti/beagleboard/gadget-init/network-gadget-init.service
@@ -4,8 +4,7 @@ Conflicts=storage-gadget-init.service
 
 [Service]
 RemainAfterExit=yes
-ExecStartPre=/usr/bin/g-ether-load.sh
-ExecStart=/sbin/ifconfig usb0 192.168.7.2 netmask 255.255.255.252
+ExecStart=/usr/bin/g-ether-load.sh
 ExecStop=/sbin/rmmod g_ether
 
 [Install]
diff --git a/recipes-ti/beagleboard/gadget-init/udhcpd.rules b/recipes-ti/beagleboard/gadget-init/udhcpd.rules
new file mode 100644
index 0000000..db65f9a
--- /dev/null
+++ b/recipes-ti/beagleboard/gadget-init/udhcpd.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=="net",ACTION=="add",KERNEL=="usb0",RUN+="/sbin/ifconfig usb0 192.168.7.2 netmask 255.255.255.252",RUN+="/bin/systemctl start udhcpd.service"
+SUBSYSTEM=="net",ACTION=="remove",KERNEL=="usb0",RUN+="/bin/systemctl stop udhcpd.service"
-- 
1.7.4.1


