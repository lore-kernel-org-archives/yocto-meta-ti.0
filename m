Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A628DE00971; Tue,  9 Oct 2018 13:45:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.210.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9336E00950
	for <meta-ti@yoctoproject.org>; Tue,  9 Oct 2018 13:45:12 -0700 (PDT)
Received: by mail-pf1-f195.google.com with SMTP id l17-v6so1452338pff.2
	for <meta-ti@yoctoproject.org>; Tue, 09 Oct 2018 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8NRRTkP9KluZnvGkATkZJO84peB9VbQtKavWcSvVd2Q=;
	b=i2wooSf3LYkarDxWme4ImggrP9KxPRR2h29D8Pi/xWJ2L4WoIfC8v2NPHUdDy3GXlP
	ioJ8BrmhYPDDCwoYIDuisU8IwwnguNBlmQqc76Cr18IJ9yL2IGtj0D4tEJjM/a53Ics4
	ZSIN24JU8CvSAmb7FuFC9HgtCIxrtGVwUuXqCbS/vZQJKXfxaMYqCQVLVbKl2jcIZDXa
	QHnXETO8DjI+LCh1XhPp5l/TR8lojBywWmhzakwqG6CXY6bV087gooH+if0Ct1iwKZRj
	ldwZJt/nHXGMcSQ4M6i6Y0bfUnLzSZOsrKjrq90EFawr34vo5fr/iCKLogol/9wP20hV
	oEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8NRRTkP9KluZnvGkATkZJO84peB9VbQtKavWcSvVd2Q=;
	b=pRpRusZsBkXRFucNcND3qiiw4Ys7RHUp99HyBi47zHG8DqLzjyjdEIYykxliTum4B/
	2o6jV+Z4fJV4hLMLT8l98/b15NgxjzdEE5sl+V6kg0X6pqyOlEBOCEHuFg26CVEq+FWe
	btC39fxQWPYB+HPrFJbl/gC1kCoc20GfQFp7xSAyD/eS4r1ABKGcYkkCIU14ubE3x5It
	wtUYhRBOzst2vqckUVtx6hlczgkd0cAwwFITDEgxbFrjGZ3RWZJwtt+KUcfQd2A/aEIF
	78EBSSvJ7J9v90pKUbC64xZ6bfZ4AmwIBAt5DW7+0D7GdNKdFFtztNVzTYPHIQlNSjsH
	Knsg==
X-Gm-Message-State: ABuFfojUvUayr4p2be3WBtMhpmIFLNEKBJZHsxba4ggyPQvHdp6p/UGI
	egI1jEPDi53/3O/2x32Eouszqb/R
X-Google-Smtp-Source: ACcGV61DTmOQGt8IIDb6P6ddmhGNgkgvfrniTTLpPtjzZ+UWNRigehIeckwKbx6hNY0Soks76NemUA==
X-Received: by 2002:a62:e414:: with SMTP id
	r20-v6mr31918340pfh.25.1539117911636; 
	Tue, 09 Oct 2018 13:45:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	w127-v6sm27613410pfd.112.2018.10.09.13.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 13:45:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  9 Oct 2018 13:45:03 -0700
Message-Id: <20181009204503.6089-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] recipes: Limit ti specific recipes under ti-soc override
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
X-List-Received-Date: Tue, 09 Oct 2018 20:45:13 -0000
Content-Transfer-Encoding: 8bit

This helps in multi-BSP scenario, where other BSP layers are also
present in the layermix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/cuia/cuia_1.0.0.13.bb                      | 3 +++
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 3 +++
 recipes-bsp/x-load/x-load_git.bb                       | 3 +++
 recipes-graphics/gbm/libgbm_10.0.0.bb                  | 3 +++
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb     | 3 +++
 recipes-graphics/omapfbplay/omapfbplay.inc             | 2 ++
 recipes-multimedia/libdce/libdce_3.00.14.00.bb         | 2 ++
 recipes-ti/bios/ti-biosutils_1.02.02.bb                | 3 +++
 recipes-ti/dmai/ti-dmai_svn.bb                         | 3 +++
 recipes-ti/dsplib/dsplib.inc                           | 2 ++
 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb             | 2 ++
 recipes-ti/includes/ti-unpack.inc                      | 5 +++++
 recipes-ti/ipc/ti-ipc-common.inc                       | 2 ++
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb      | 3 +++
 recipes-ti/mathlib/mathlib.inc                         | 2 ++
 recipes-ti/ndk/ti-ndk_3.40.01.01.bb                    | 3 +++
 recipes-ti/swtools/swtools_git.bb                      | 2 ++
 17 files changed, 46 insertions(+)

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
index e048f6aa..a7caf504 100644
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -23,3 +23,6 @@ do_install() {
 	cd ${S}
 	oe_runmake DESTDIR=${D} libdir=${libdir} includedir=${includedir} install
 }
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 94485b6a..d29b6496 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -22,3 +22,6 @@ do_install() {
     install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
     install -m 644 ${S}/galcore.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
 }
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_git.bb
index dd8bce2d..1ce1b0f0 100644
--- a/recipes-bsp/x-load/x-load_git.bb
+++ b/recipes-bsp/x-load/x-load_git.bb
@@ -17,3 +17,6 @@ CONFIG_HEADER_beagleboard = "1"
 XLOAD_MACHINE_omap3-touchbook = "omap3530beagle_config"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
index 38715ccf..9e3c7ed0 100644
--- a/recipes-graphics/gbm/libgbm_10.0.0.bb
+++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -16,3 +16,6 @@ SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH} \
             file://0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch"
 
 S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index dafaac1e..a2f8f192 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -37,3 +37,6 @@ do_install() {
 }
 
 INSANE_SKIP_${PN} += "ldflags"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc b/recipes-graphics/omapfbplay/omapfbplay.inc
index df166dd3..744eb8f7 100644
--- a/recipes-graphics/omapfbplay/omapfbplay.inc
+++ b/recipes-graphics/omapfbplay/omapfbplay.inc
@@ -14,6 +14,8 @@ SRC_URI = "git://git.mansr.com/omapfbplay;protocol=git \
 S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
 
 # We want a kernel header for armv7a, but we don't want to make mplayer machine specific for that
 STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
diff --git a/recipes-multimedia/libdce/libdce_3.00.14.00.bb b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
index 04c0b718..0deec7ab 100644
--- a/recipes-multimedia/libdce/libdce_3.00.14.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
@@ -13,3 +13,5 @@ PR = "r1"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-biosutils_1.02.02.bb
index 5b6b4f43..01c070d7 100644
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
+++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
@@ -7,3 +7,6 @@ SRC_URI[biosutilstarball.md5sum] = "0654e9e72b0a6fc7a6575829c0cd90c9"
 SRC_URI[biosutilstarball.sha256sum] = "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
 
 INSANE_SKIP_${PN} = "installed-vs-shipped"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 4a91b9b9..3cc54b91 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -38,3 +38,6 @@ SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=
                  "
 
 INSANE_SKIP_${PN} = "installed-vs-shipped"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index f3696795..a3953105 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -69,3 +69,5 @@ ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
 
 INSANE_SKIP_${PN}-dev = "arch"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
index e3b1c56f..c2e7d268 100644
--- a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
+++ b/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
@@ -4,3 +4,5 @@ SRC_URI[md5sum] = "6db908bef3b933dc8cea666564d5d4d8"
 SRC_URI[sha256sum] = "2caa9c859cfe348197e860f07d174a8ab7048d38d6d3a12ec576802122c9e91e"
 
 
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index a571fd5d..b520d6ab 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -79,3 +79,8 @@ python ti_bin_do_unpack() {
     # Return to the previous directory
     os.chdir(save_cwd)
 }
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
+COMPATIBLE_HOST_class-native = "(.*)"
+
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index dddb7344..aea9d278 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -2,6 +2,8 @@ PV = "3.50.02.02"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
 
 PLATFORM = "UNKNOWN"
 PLATFORM_omap5-evm = "OMAP54XX"
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
index 1a56d1da..113e6a69 100644
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
@@ -12,3 +12,6 @@ SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
 SRC_URI[sha256sum] = "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
 
 INSANE_SKIP_${PN} = "installed-vs-shipped"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
index 6aea085a..61f198bc 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -68,3 +68,5 @@ ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${MATHLIB_INSTALL_DIR_RECIPE}"
 
 INSANE_SKIP_${PN}-dev = "arch"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
index 4a494b19..c6c18733 100644
--- a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
+++ b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
@@ -11,3 +11,6 @@ SRC_URI[ndkzip.sha256sum] = "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f77304f14f0
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_SYSROOT_STRIP = "1"
+
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
index 425a0690..168fe211 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -42,3 +42,5 @@ FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
 
 INSANE_SKIP_${PN}-dev = "arch staticdev"
 ALLOW_EMPTY_${PN} = "1"
+COMPATIBLE_HOST ?= "null"
+COMPATIBLE_HOST_ti-soc = "(.*)"
-- 
2.19.1


