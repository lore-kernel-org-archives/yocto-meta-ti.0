Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6403E00F67; Wed, 28 Feb 2018 16:09:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F1A0E00EBD
	for <meta-ti@yoctoproject.org>; Wed, 28 Feb 2018 16:09:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F99320B77;
	Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kv_JrV_3ne1g; Thu,  1 Mar 2018 00:09:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E7C0120059;
	Thu,  1 Mar 2018 00:09:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 25FAF1632D4;
	Wed, 28 Feb 2018 19:09:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 28 Feb 2018 19:09:45 -0500
Message-Id: <1519862990-49259-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/5] recipes: remove outdated recipes, some deps are no longer satisfied
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 00:09:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/packagegroups/packagegroup-ti-test.bb | 26 ----------
 recipes-ti/beagleboard/beaglebone-tester.bb        | 56 ----------------------
 recipes-ti/beagleboard/bonescript.bb               | 38 ---------------
 recipes-ti/beagleboard/bonescript/bone101.service  | 11 -----
 recipes-ti/beagleboard/bonescript/bonescript-git   | 11 -----
 recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb  | 55 ---------------------
 6 files changed, 197 deletions(-)
 delete mode 100644 recipes-core/packagegroups/packagegroup-ti-test.bb
 delete mode 100644 recipes-ti/beagleboard/beaglebone-tester.bb
 delete mode 100644 recipes-ti/beagleboard/bonescript.bb
 delete mode 100644 recipes-ti/beagleboard/bonescript/bone101.service
 delete mode 100644 recipes-ti/beagleboard/bonescript/bonescript-git
 delete mode 100644 recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb

diff --git a/recipes-core/packagegroups/packagegroup-ti-test.bb b/recipes-core/packagegroups/packagegroup-ti-test.bb
deleted file mode 100644
index 6971f07..0000000
--- a/recipes-core/packagegroups/packagegroup-ti-test.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Extended task to get System Test specific apps"
-LICENSE = "MIT"
-PR = "r1"
-
-inherit packagegroup
-
-TEST = "\
-    bonnie++ \
-    hdparm \
-    iozone3 \
-    iperf \
-    lmbench \
-    rt-tests \
-    evtest \
-    bc \
-    memtester \
-    "
-
-TI_TEST = "\
-    ltp-ddt \
-    "
-
-RDEPENDS_${PN} = "\
-    ${TEST} \
-    ${TI_TEST} \
-    "
diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
deleted file mode 100644
index 66b98a4..0000000
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-DESCRIPTION = "BeagleBone tester scripts"
-HOMEPAGE = "http://beagleboard.org/support"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
-
-# only scripts and data
-inherit allarch
-
-PR = "r20"
-
-SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
-          "
-SRCREV = "487a13e2e4faaafa40ba5430600e6aeecf9581a8"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${localstatedir}/lib/bone-tester/component/data/
-	install -d ${D}${localstatedir}/lib/bone-tester/init-scripts/
-	install -d ${D}${localstatedir}/lib/bone-tester/lib
-	install -d ${D}${base_libdir}/systemd/system/multi-user.target.wants/
-	install -d ${D}/boot/
-	install -m 0755 ${S}/bone-tester/init-scripts/uEnv.txt ${D}/boot/uEnv.txt
-
-	# systemd configuration
-	ln -s ../bone-tester.service ${D}${base_libdir}/systemd/system/multi-user.target.wants/bone-tester.service
-	install -m 0755 ${S}/bone-tester/init-scripts/bone-tester.service ${D}${base_libdir}/systemd/system/bone-tester.service
-	install -m 0755 ${S}/bone-tester/init-scripts/init.sh ${D}${localstatedir}/lib/bone-tester/init-scripts/init.sh
-
-	for i in $(find ${S}/bone-tester/component/ -maxdepth 1 -type f) ; do
-		install -m 0755 ${i} ${D}${localstatedir}/lib/bone-tester/component/
-	done
-	for i in ${S}/bone-tester/component/data/* ; do
-		install -m 0755 ${i} ${D}${localstatedir}/lib/bone-tester/component/data/
-	done
-	for i in ${S}/bone-tester/lib/* ; do
-		install -m 0755 ${i} ${D}${localstatedir}/lib/bone-tester/lib/
-	done
-
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/testaudio ${D}${bindir}
-
-}
-
-
-FILES_${PN} += "${base_libdir}/systemd \
-                /boot \
-               "
-
-RDEPENDS_${PN} = "alsa-utils-aplay sox iputils memtester"
-RRECOMMENDS_${PN} = "kernel-module-g-zero \
-                     kernel-module-g-mass-storage \
-                     kernel-module-g-file-storage \
-                     kernel-module-smsc95xx"
-
diff --git a/recipes-ti/beagleboard/bonescript.bb b/recipes-ti/beagleboard/bonescript.bb
deleted file mode 100644
index b9dfbe6..0000000
--- a/recipes-ti/beagleboard/bonescript.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
-
-PR = "r15"
-
-inherit systemd
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=659ee0c98db2664403c769d6b9ab50eb"
-
-SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-6af82b41178c37644399b19039ea7e80c1dbf8ee.tar.bz2 \
-           file://bonescript-git \
-           file://bone101.service \
-          "
-SRC_URI[md5sum] = "e5e214857afbd2e59b52171e60810be2"
-SRC_URI[sha256sum] = "e703416a63406c8b6c89fb1079406833ce6a9eb0ae1ba0a55fe3802b83186c50"
-
-S = "${WORKDIR}/bonescript"
-
-do_install() {
-	install -d ${D}${localstatedir}/lib/cloud9/
-	cp -a ${S}/* ${D}${localstatedir}/lib/cloud9/
-	cp -a ${S}/.git ${D}${localstatedir}/lib/cloud9/
-
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/bone101.service ${D}${base_libdir}/systemd/system
-
-	rm -f ${D}${localstatedir}/lib/cloud9/node_modules/binary/node_modules/put/test/c/itof
-	rm -f ${D}${localstatedir}/lib/cloud9/node_modules/binary/node_modules/put/test/c/ftoi
-}
-
-NATIVE_SYSTEMD_SUPPORT = "1"
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "bone101.service"
-
-FILES_${PN} += "${localstatedir} ${base_libdir}/systemd/system"
-CONFFILES_${PN} += "${localstatedir}/lib/cloud9/.git/config"
-RDEPENDS_${PN} = "nodejs cloud9"
-RRECOMMENDS_${PN} = "git"
diff --git a/recipes-ti/beagleboard/bonescript/bone101.service b/recipes-ti/beagleboard/bonescript/bone101.service
deleted file mode 100644
index 49562ba..0000000
--- a/recipes-ti/beagleboard/bonescript/bone101.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Beaglebone 101 presentation
-ConditionPathExists=|/var/lib/cloud9
-
-[Service]
-WorkingDirectory=/var/lib/cloud9
-ExecStart=/usr/bin/node bone101.js
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/recipes-ti/beagleboard/bonescript/bonescript-git b/recipes-ti/beagleboard/bonescript/bonescript-git
deleted file mode 100644
index d9e66cf..0000000
--- a/recipes-ti/beagleboard/bonescript/bonescript-git
+++ /dev/null
@@ -1,11 +0,0 @@
-[core]
-	repositoryformatversion = 0
-	filemode = true
-	bare = false
-	logallrefupdates = true
-[remote "origin"]
-	fetch = +refs/heads/*:refs/remotes/origin/*
-	url = git://github.com/jadonk/bonescript.git
-[branch "master"]
-	remote = origin
-	merge = refs/heads/master
diff --git a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
deleted file mode 100644
index dd493f8..0000000
--- a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-DESCRIPTION = "eZ430 Chronos Tools - MSP430 Development Kit/Watch"
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/EZ430-Chronos"
-LICENSE = "BSD-3-Clause"
-# We can't use the actualy source file, since it has space in its name :(
-LIC_FILES_CHKSUM = "file://eZ430-Chronos_CC_1_1.tcl;md5=59ba6ee0a26650ec660a4e65a9462806"
-
-SECTION = "multimedia"
-
-inherit allarch
-
-PV = "1_05_00_00"
-
-SRC_URI = "http://focus.ti.com/lit/sw/slac388/slac388.zip;name=slac388zip"
-
-SRC_URI[slac388zip.md5sum] = "22d4104a07af584222828fb377793796"
-SRC_URI[slac388zip.sha256sum] = "1c9cd1e36015e8db3b36c98be41907628144b76002b3f76b27fd310f4bd35ad7"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-S = "${WORKDIR}/ti/eZ430-Chronos"
-
-BINFILE="Chronos-Setup"
-TI_BIN_UNPK_CMDS="Y:workdir:"
-
-do_unpack_append() {
-    os.system('mv "Texas Instruments" ti')
-}
-
-do_configure() {
-	cp Control\ Center/Chronos\ Control\ Center/eZ430-Chronos_CC_1_1.tcl ${S}
-}
-
-do_compile() {
-    echo "Do Nothing for Now"
-}
-
-do_install() {
-
-    install -d ${D}/${installdir}/ti-msp430-chronos-apps
-    cp -pPrf "${S}"/"Control Center"/* ${D}/${installdir}/ti-msp430-chronos-apps
-
-    # Remove dos formatting
-    dos2unix "${D}/${installdir}/ti-msp430-chronos-apps/Chronos Data Logger"/*
-    dos2unix "${D}/${installdir}/ti-msp430-chronos-apps/Chronos Control Center"/*
-
-    # Should probably also remove hardcoded script reference to tcl8.5
-}
-
-PACKAGES += "ti-msp430-chronos-apps"
-FILES_ti-msp430-chronos-apps = "${installdir}/ti-msp430-chronos-apps/*"
-
-RDEPENDS_ti-msp430-chronos-apps += " tcl tk xdotool"
-RRECOMMENDS_ti-msp430-chronos-apps = "kernel-module-cdc-acm"
-- 
2.7.4


