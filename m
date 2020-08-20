Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.115692.1597946484081782403
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 571A840C3A;
	Thu, 20 Aug 2020 18:01:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHIMHR02QcoQ; Thu, 20 Aug 2020 18:01:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3BCC740B2D;
	Thu, 20 Aug 2020 18:01:22 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 52DD217341D;
	Thu, 20 Aug 2020 14:01:21 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/3] ti-display-sharing-fw: remove deprecated firmware
Date: Thu, 20 Aug 2020 14:01:14 -0400
Message-Id: <1597946476-11345-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Display sharing is not supported in K5.4+ and corresponding FW is now obsolete.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-display-sharing-fw_git.bb                   | 48 ----------------------
 1 file changed, 48 deletions(-)
 delete mode 100644 recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb

diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
deleted file mode 100644
index 9115b6b..0000000
--- a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "TI Display Sharing Firmware"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
-
-PV = "06.01.00.00+git${SRCPV}"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit deploy
-inherit update-alternatives
-
-PROTOCOL = "git"
-BRANCH = "ti-linux-firmware"
-SRCREV = "e7be1ab85266c47236330e2909997d20fc62e312"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-TI_DISP_SHARE_FW_DIR = "${S}/ti-display-sharing/"
-TI_DISP_SHARE_FW_FILENAME = "ti-display-sharing-j721e.bin"
-
-# make sure that lib/firmware, and all its contents are part of the package
-FILES_${PN} += "${base_libdir}/firmware"
-
-do_install() {
-  install -d ${D}${base_libdir}/firmware
-  install -m 0755 ${TI_DISP_SHARE_FW_DIR}/${TI_DISP_SHARE_FW_FILENAME} ${D}${base_libdir}/firmware
-}
-
-TARGET_MAIN_R5FSS0_1 = "j7-main-r5f0_1-fw"
-ALTERNATIVE_${PN} = "j7-main-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TI_DISP_SHARE_FW_FILENAME}"
-ALTERNATIVE_PRIORITY = "9"
-
-# This is used to prevent the build system to strip the executables
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
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

