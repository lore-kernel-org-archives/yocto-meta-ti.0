Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A62C27C50
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22780.1717184742150279702
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k2ypxhgT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjfa1091695;
	Fri, 31 May 2024 14:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184741;
	bh=ViL2dP81inZu8jMw/301/LXVF031l+MzIy9NpVfN8To=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k2ypxhgTxzF0npunmMBlQiuJnUU4canCe48XLc9U+CzHj86b846W3oLQHgRAKe2Np
	 qNkfkn/MO5RvjJ9hmLbHqgx1dy0OrYJqn8PdYZfHTD+GayMXwUJh9zMRCn3GpoF0B4
	 5aYS+3mMP/0ITS819EWsmsuyIrYhjo2ds8FHV1ic=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjf28029071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:41 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJje4C033258;
	Fri, 31 May 2024 14:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8C4-0006GG-NQ; Fri, 31 May 2024 14:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 1/2] recipes: Update to UNPACKDIR for files going into WORKDIR
Date: Fri, 31 May 2024 14:45:38 -0500
Message-ID: <20240531194540.24017-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531194540.24017-1-reatmon@ti.com>
References: <20240531194540.24017-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17687

For recipes that have file:// in SRC_URI, the files are placed into
WORKDIR.  Moving forward [1], that directory will be UNPACKDIR and
eventually move to somewhere other than WORKDIR.  So update all
references to WORKDIR that are looking for these file to use UNPACKDIR
instead.

[1] https://git.openembedded.org/openembedded-core/commit/?id=e022d62ba917790af2121da57646271ef17c03fa

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-core/udev/eudev_%.bbappend       |  4 ++--
 meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc |  2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb             | 12 ++++++------
 .../recipes-ti/beagleboard/beaglebone-capes.bb       |  4 ++--
 meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb | 10 +++++-----
 .../recipes-ti/devtools/ti-cgt-pru_2.3.3.bb          |  8 ++++----
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb |  2 +-
 meta-ti-extras/recipes-ti/includes/ti-unpack.inc     |  4 ++--
 8 files changed, 23 insertions(+), 23 deletions(-)

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
diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
index 8da90c79..213f6871 100644
--- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
@@ -9,7 +9,7 @@ do_configure() {
     # Always copy the defconfig file to .config to keep consistency
     # between the case where there is a real config and the in kernel
     # tree config
-    cp ${WORKDIR}/defconfig ${B}/.config
+    cp ${UNPACKDIR}/defconfig ${B}/.config
 
     scm_version=$(printf '%s%s' -g $(git -C ${S} rev-parse --verify HEAD 2>/dev/null | cut -c1-12))
 
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
index c96113fe..47bd6a51 100644
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
+++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TI PRU Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
 LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
 
 require recipes-ti/includes/ti-paths.inc
@@ -10,7 +10,7 @@ require recipes-ti/includes/ti-unpack.inc
 
 BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
 BINFILE_NAME = "cgt-pru-x86"
-TI_BIN_UNPK_ARGS = "--prefix ${S}"
+TI_BIN_UNPK_ARGS = "--prefix ${UNPACKDIR}"
 TI_BIN_UNPK_CMDS = ""
 
 BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
@@ -26,12 +26,12 @@ SRC_URI[cgt-pru-arm.sha256sum] = "8390cb77b46b728ce2940595b81406f76d86dfed58c212
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
-    cp -r ${S}/ti-cgt-pru_${PV}/. \
+    cp -r ${UNPACKDIR}/ti-cgt-pru_${PV}/. \
           ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
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
diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
index 13068843..4cefefbf 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
@@ -5,7 +5,7 @@
 #  TI_BIN_UNPK_ARGS   - contains the arguments to be passed to the bin file.
 #  TI_BIN_UNPK_CMDS   - contains list of commands separated with colon to be 
 #                       passed while unpacking the bin file. The keyword 
-#                       workdir expands to WORKDIR and commands are appendded
+#                       workdir expands to UNPACKDIR and commands are appendded
 #                       with '\n'. Eg. TI_BIN_UNPK_CMDS="Y:Y: qY:workdir"
 #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
 #                       the output in some internal directory
@@ -30,7 +30,7 @@ python ti_bin_do_unpack() {
 
     # Change to the working directory
     save_cwd = os.getcwd()
-    workdir  = localdata.getVar('WORKDIR')
+    workdir  = localdata.getVar('UNPACKDIR')
     workdir  = bb.data.expand(workdir, localdata)
     os.chdir(workdir)
 
-- 
2.17.1


