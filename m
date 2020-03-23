Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.772.1584996946878163416
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 13:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 64.68.198.64, mailfrom: denys@ti.com)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F9A440C3D;
	Mon, 23 Mar 2020 20:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3TneHneZdTW; Mon, 23 Mar 2020 20:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 03C2940C0C;
	Mon, 23 Mar 2020 20:55:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 495BD16D7BC;
	Mon, 23 Mar 2020 16:55:44 -0400 (EDT)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] recipes-ti: deprecate softhsmv2/libp11/engine-pkcs11
Date: Mon, 23 Mar 2020 16:55:44 -0400
Message-Id: <1584996944-2848-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

These components depend on OpenSSL 1.0 and haven't been updated for long time.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb | 22 ------------
 recipes-ti/libp11/libp11_git.bb               | 19 -----------
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb   | 48 ---------------------------
 3 files changed, 89 deletions(-)
 delete mode 100644 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
 delete mode 100644 recipes-ti/libp11/libp11_git.bb
 delete mode 100644 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
deleted file mode 100644
index 01bd58f..0000000
--- a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "OpenSSL PKCS11 engine"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=471dacb7f0586e35729f422b8098585f"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-DEPENDS = "openssl libtool libp11"
-
-COMPATIBLE_MACHINE = "keystone"
-
-BRANCH = "master"
-
-PV = "1.3.0.1"
-# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.01
-SRCREV = "56ac060e2245907a442376d586924af26ed7e478"
-
-SRC_URI = "git://git.ti.com/keystone-linux/engine-pkcs11.git;protocol=git;branch=${BRANCH}"
-S = "${WORKDIR}/git"
-
-FILES_${PN} += "${libdir}/engines/*.so*"
-FILES_${PN}-dbg += "${libdir}/engines/.debug"
diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
deleted file mode 100644
index a768f15..0000000
--- a/recipes-ti/libp11/libp11_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "PKCS11 abstraction library"
-LICENSE = "LGPL2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-DEPENDS = "openssl libtool"
-RDEPENDS_${PN} = "ti-softhsmv2"
-
-COMPATIBLE_MACHINE = "keystone"
-
-SRC_URI = "git://git.ti.com/keystone-linux/libp11.git;protocol=git;branch=${BRANCH}"
-BRANCH = "master"
-# Following commit corresponds to DEV.LIBP11-01.03.00.00
-SRCREV = "43c4f63a8d803fde2bcd8e4f8969e5fe9edf0e33"
-PV = "1.3.0.0"
-
-S = "${WORKDIR}/git"
diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
deleted file mode 100644
index 6a196ae..0000000
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-DESCRIPTION = "TI softhsmv2 package"
-LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR | Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=700a883962ccff663f888f3f7221ce8f"
-SECTION = "libs"
-
-mntdir = "/mnt"
-
-inherit autotools pkgconfig
-
-DEPENDS = "openssl libdaemon zlib"
-COMPATIBLE_MACHINE = "keystone"
-
-BRANCH = "ti-softhsm-rebase"
-SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
-#Following commit corresponds to tag DEV.SOFTHSM-02.00.00.00
-SRCREV = "b0eef602c03583e59c289ba113b64eaa4f5cac13"
-PV = "2.0.0.0"
-PR = "r0"
-
-S = "${WORKDIR}/git"
-
-CFLAGS += "-mno-unaligned-access"
-CPPFLAGS += "-mno-unaligned-access"
-
-EXTRA_OECONF += " \
-    --with-zlib=${STAGING_EXECPREFIXDIR} \
-    --with-openssl=${STAGING_EXECPREFIXDIR} \
-"
-
-INITSCRIPT_NAME = "softhsm-daemon.sh"
-INITSCRIPT_PARAMS = "defaults 10"
-
-inherit update-rc.d
-
-FILES_${PN} += "${libdir}/softhsm/lib*.so.* ${mntdir}/*"
-FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
-FILES_${PN}-staticdev += "${libdir}/softhsm/*.a"
-FILES_${PN}-dev += "${libdir}/softhsm/*.la ${libdir}/softhsm/lib*.so"
-
-INSANE_SKIP_${PN}-dev = "dev-elf"
-
-do_install_append() {
-	install -d ${D}${mntdir}/securedbv0
-	install -d ${D}${mntdir}/securedbv1
-
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/src/bin/daemon/softhsm-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-}
-- 
2.7.4

