Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2400.1588985437896371891
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 May 2020 17:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E6B3C40BA6;
	Sat,  9 May 2020 00:50:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEQVJ12Q8uTK; Sat,  9 May 2020 00:50:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49B4D409AA;
	Sat,  9 May 2020 00:50:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9196E17272F;
	Fri,  8 May 2020 20:50:34 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-img-encode-decode: not compatible with K5.4 - remove
Date: Fri,  8 May 2020 20:50:34 -0400
Message-Id: <1588985434-14184-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-img-encode-decode_1.0.0.bb                  | 31 --------------------
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb  | 18 ------------
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb  | 18 ------------
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 34 ----------------------
 4 files changed, 101 deletions(-)
 delete mode 100644 recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
 delete mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
 delete mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
 delete mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
deleted file mode 100644
index 0192717..0000000
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Kernel drivers for the IMG VXE384 MP2 and D5520 encoder/decoder found in TI SoCs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"
-
-inherit module
-
-MACHINE_KERNEL_PR_append = "g"
-PR = "${MACHINE_KERNEL_PR}"
-
-COMPATIBLE_MACHINE = "j7"
-
-SRCREV = "0eba3678300f649e49f03d92d1b624cf0e008008"
-
-EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-	oe_runmake all -C ${S}/linux/decoder
-	oe_runmake all -C ${S}/linux/encoder
-}
-
-do_install() {
-	install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
-	install -m 644 ${S}/linux/decoder/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
-	install -m 644 ${S}/linux/encoder/vxe-enc.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
-}
diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
deleted file mode 100644
index 48a1753..0000000
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=f17e17d664f72942124e4fcf06c178ee"
-
-DEPENDS = "libdrm ffmpeg"
-
-inherit autotools pkgconfig
-
-PR = "r1"
-SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
-
-EXTRA_OEMAKE = "CC="${CC}""
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
deleted file mode 100644
index 3bb5d74..0000000
--- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Test applications for TI ENC (v4l2 encoder for IMG VXE384)"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=3545dd5bdf513840937d38c10b866605"
-
-DEPENDS = "libdrm"
-
-inherit autotools pkgconfig
-
-PR = "r0"
-SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
-
-EXTRA_OEMAKE = "CC="${CC}""
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
deleted file mode 100644
index 2812fa2..0000000
--- a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Video Decoding Firmware Packaging recipe"
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=84ca7278930db001870686ad997d6bb1"
-
-BRANCH = "master"
-SRCREV = "0acbf1d0a7c7eaca0ef14c1a30ce313ea82147e5"
-
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-PV = "1.0-git${SRCPV}"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-VXD_FW_DIR = "${S}/decoder/firmware/"
-
-# make sure that lib/firmware, and all its contents are part of the package
-FILES_${PN} += "${base_libdir}/firmware"
-
-do_install() {
-  install -d ${D}${base_libdir}/firmware
-  install -m 0755 ${VXD_FW_DIR}/pvdec_full_bin.fw ${D}${base_libdir}/firmware
-}
-
-# This is used to prevent the build system to strip the executables
-INHIBIT_PACKAGE_STRIP = "1"
-# This is used to prevent the build system to split the debug info in a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
-INSANE_SKIP_${PN} += "arch"
-
-# we don't want to configure and build the source code
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
-- 
2.7.4

