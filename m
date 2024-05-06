Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0712C10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 15:47:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.24005.1715010464753670386
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 May 2024 08:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mvTGh7e3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446FlhSR042270;
	Mon, 6 May 2024 10:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715010463;
	bh=cXX1Bj4O3AXiZ66RQjGbHppqB2dw1fLADKFTct7AZ3I=;
	h=From:To:Subject:Date;
	b=mvTGh7e3r8wCC8kSwySBmqHM9AuEXkIhvxYgiGOsTn1LKm3aCgrSuobE93L1rs9Yc
	 k9UPHlR1i5ItSV8caWLnl7yP068eBX1ZJWwFUq0SxWsB8HqgXeuqdRmvGJFtNRXMtu
	 u4W9POh/8klcbYY9HQF+0FPS88hl6dlS4OTZ4VBs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446FlhrN008771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 10:47:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 10:47:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 10:47:43 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446FlhEW118815;
	Mon, 6 May 2024 10:47:43 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s40Z4-0007je-SO; Mon, 06 May 2024 10:47:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] recipes: Update WORKDIR references to UNPACKDIR
Date: Mon, 6 May 2024 10:47:42 -0500
Message-ID: <20240506154742.29695-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 May 2024 15:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17643

This is a correspnding patch to match one from Richard Purdie in
oe-core. [1]

Since we want to be able to stop unpacking to WORKDIR, correct the WORKDIR
references in recipe do_compile/do_install tasks to use UNPACKDIR in the
appropraite places instead.

[1] https://git.openembedded.org/openembedded-core/commit/?id=d73595df69667fe9d12ecd407b77a0b8dae2109c

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-core/udev/eudev_%.bbappend       |  4 ++--
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb             | 12 ++++++------
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb |  2 +-
 .../recipes-ti/beagleboard/beaglebone-capes.bb       |  4 ++--
 meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb | 10 +++++-----
 .../recipes-ti/devtools/ti-cgt-pru_2.3.3.bb          |  2 +-
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb |  2 +-
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend b/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
index ddb1e75d..dee46cda 100644
--- a/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
+++ b/meta-ti-bsp/recipes-core/udev/eudev_%.bbappend
@@ -8,6 +8,6 @@ SRC_URI:append:ti-soc = " \
 PR:append:ti-soc = ".3"
 
 do_install:append:ti-soc() {
-    install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
-    install -m 0644 ${WORKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${UNPACKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
 }
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
index e2db6efd..11be09ea 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://tiipclad-daemon.sh \
             file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch \
            "
 
-CFLAGS += "-I${WORKDIR}"
+CFLAGS += "-I${UNPACKDIR}"
 
 DAEMON = "UNKNOWN"
 DAEMON:dra7xx = "lad_dra7xx"
@@ -45,18 +45,18 @@ do_install:append() {
 
     # Modify the startup scripts to point to the right
     # lad daemon executable.
-    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.sh
-    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.service
+    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${UNPACKDIR}/tiipclad-daemon.sh
+    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${UNPACKDIR}/tiipclad-daemon.service
 
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/tiipclad-daemon.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/tiipclad-daemon.service ${D}${systemd_system_unitdir}
     install -d ${D}${sysconfdir}/init.d/
-    install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    install -c -m 755 ${UNPACKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
 do_install:append:dra7xx() {
     install -d ${D}${sysconfdir}/modprobe.d/
-    install -c -m 644 ${WORKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/
+    install -c -m 644 ${UNPACKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/
 }
 
 PACKAGES =+ "${PN}-test"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index d3ada9c6..f518027d 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -36,7 +36,7 @@ do_install () {
     cp -rf ${S}/install_gdb/include/* ${D}${includedir}
 
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
+    install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
 }
 
 RDEPENDS:${PN} = "gdbserverproxy-module-drv bash"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
index ceefe0d6..ded1d9c0 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -14,13 +14,13 @@ SRC_URI = "file://cape.service \
 
 do_install() {
 	install -d ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/cape.service ${D}${base_libdir}/systemd/system
+	install -m 0644 ${UNPACKDIR}/cape.service ${D}${base_libdir}/systemd/system
 
 	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
 	ln -sf ../cape.service ${D}${base_libdir}/systemd/system/basic.target.wants/
 
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/cape*.sh ${D}${bindir}
+	install -m 0755 ${UNPACKDIR}/cape*.sh ${D}${bindir}
 }
 
 FILES:${PN} += "${base_libdir}/systemd/system"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
index 3ab00ec3..f22583c0 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb
@@ -22,19 +22,19 @@ SRC_URI = "file://storage-gadget-init.service \
 
 do_install() {
 	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
-	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system
+	install -m 0644 ${UNPACKDIR}/*.service ${D}${base_libdir}/systemd/system
 
-	for i in ${WORKDIR}/storage-gadget-init.service ; do
+	for i in ${UNPACKDIR}/storage-gadget-init.service ; do
 		install -m 0644 $i ${D}${base_libdir}/systemd/system
 		ln -sf ../$(basename $i) ${D}${base_libdir}/systemd/system/basic.target.wants/
 	done
 
 	install -d ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
-	install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}
+	install -m 0644 ${UNPACKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d
+	install -m 0644 ${UNPACKDIR}/*.conf ${D}${sysconfdir}
 
 	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
+	install -m 0755 ${UNPACKDIR}/*.sh ${D}${bindir}
 }
 
 PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
index c96113fe..26690314 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -31,7 +31,7 @@ do_install() {
 }
 
 do_install:class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
+    ${UNPACKDIR}/${BINFILE} --prefix ${D}
 }
 
 FILES:${PN} += "${datadir}/ti/*"
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
index fd34657a..1acd2f9f 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
@@ -92,7 +92,7 @@ do_install() {
 }
 
 do_install:class-target() {
-    ${WORKDIR}/${BINFILE} --prefix ${D}
+    ${UNPACKDIR}/${BINFILE} --prefix ${D}
 }
 
 FILES:${PN} += "${datadir}/ti/*"
-- 
2.17.1


