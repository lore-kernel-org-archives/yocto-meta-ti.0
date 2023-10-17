Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8BCCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:30:45 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.198673.1697509837969900380
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 19:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l47r4zES;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1e58a522e41so3063665fac.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509837; x=1698114637; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XRNLmkWOHoSz2JZOcftXLKc/chU20kmiBLLk0yJBrA=;
        b=l47r4zESE3LQ7aI2Nfj7gx7rnSWBlWgDvJoqPTnrmUx8w3/psYuB0RPdvyeVxhX3hZ
         XLJO6cdGiYhlygZjZ2PSKTEVGgmbJEn0za5J7nHsJF58It+rq5EQlgRb4N40L3Te0+dn
         kcJerzE64JFuty9GTu36TCKQ/7DHab6v4wKr09J42efMkOrXJvM0zdO13rGzSlalZ8en
         AQNFlOVN3szyBikyk93fpNGDf9LaNqDS7YODl/2BCkkpplE9d8hC74yXvm80lie7+fRH
         EHy6koEGcxXkr8cJ8iQvwBLugU8X0P+1uuvGHDAm1EWfwk0hMqoZoU6tY8Xh5/MTbHCW
         aaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509837; x=1698114637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XRNLmkWOHoSz2JZOcftXLKc/chU20kmiBLLk0yJBrA=;
        b=G+LDf91auTOzPNO6bYUc4A0pO8fWfRQ15awBFc09HYySS+eEGngvPZso8EBZS+6ZKk
         Fjpc9iGl5o6dwx4u85tyHsSerQ/0JH3iSC7MIE6DzRYvnvdTdLMqe5aLlYZ9Mc0aoWTn
         48LzehwHOYfsA4rr9z1sv5g2HUmjNzXu/mqP4zewCrcvXse32iKtsf6KRlXezifD6ukT
         yyVq745JUV/glWTuv1YQYUVKRynf/WDDAKB9SPbrqFwChru7TMqvf/KsIUq8HKTsfeFd
         gikMbOXAe/v877MMPuLjiiZRXqaXe4Q476Jnypl0+ZTX0kn/I/PGxoAETlx55uP8HYW4
         R7QA==
X-Gm-Message-State: AOJu0YwbY/SRtHNuB1I4rEeDoVnZPeLg+yDIlxuMHz1FTGcP5Zy/RWpB
	zSmlPf7h1anwlgGHd1eRAq8=
X-Google-Smtp-Source: AGHT+IF881voYCuQ8+pH1+K+jT90Z/h55142aGIbOghgGfxbr8ezeE7GfRj0X8F/7aMdG+IAN9iIJg==
X-Received: by 2002:a05:6870:d911:b0:1e9:9c34:af66 with SMTP id gq17-20020a056870d91100b001e99c34af66mr1033443oab.2.1697509837208;
        Mon, 16 Oct 2023 19:30:37 -0700 (PDT)
Received: from rig.lan ([2600:1700:eec4:a85f::3])
        by smtp.gmail.com with ESMTPSA id mo16-20020a056871321000b001e9a60dbc42sm95331oac.47.2023.10.16.19.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:30:36 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: reatmon@ti.com,
	denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org,
	Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv3 1/3] ti-sgx-ddk-*: version bump to support kirkstone
Date: Mon, 16 Oct 2023 21:29:49 -0500
Message-ID: <20231017022951.108252-2-res.sapp@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017022951.108252-1-res.sapp@gmail.com>
References: <20231017022951.108252-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 02:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17128

From: Randolph Sapp <rs@ti.com>

Bump ti-sgx-ddk-um and ti-sgx-ddk-km to the new branch for Kirkstone and
mesa independent builds. This also sets up SGX to use the latest mesa
revision rogue uses.

Changelog:

 - IMG Support has officially ended. This repo will not be getting
   regular updates after this unless things are really broken.
 - The Mesa patches which were previously being relicensed internally
   were opened and combined with the unofficial rogue efforts on
   freedesktop.
 - Toolchains were upgraded and multiple warnings and issues were
   addressed. Hardware recoveries work now, but there are still some
   longstanding issues with SGX that remain to be addressed if further
   resources are set aside for that.
 - We moved to an lws-generic build target to avoid rebuilding external
   components. As such, these external components must be patched as
   needed. Libdrm is an example of this and the required patches can be
   found in meta-ti.

Known bugs:

 - Buffer allocations under Weston may misbehave
 - GLSL macro redefinitions will cause errors regardless of whether or
   not they are identical

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-sgx-ddk-km_1.17.4948957.bb             | 27 +++++-----
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |  1 -
 .../ti-sgx-ddk-um_1.17.4948957.bb             | 53 +++++++------------
 3 files changed, 32 insertions(+), 49 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index bf4fa98a..ca28ae76 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
 LICENSE = "MIT | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+LIC_FILES_CHKSUM = "file://GPL-COPYING;md5=60422928ba677faaa13d6ab5f5baaa1e"
 
 inherit module
 
@@ -16,33 +16,30 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "ti-img-sgx/${PV}/k5.10"
+BRANCH = "${PV}/mesa/k6.1"
 
 SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
+SRCREV = "2cb2c9609b7740cb2c348e669a96f26e1cc858da"
 
-TARGET_PRODUCT:omap-a15 = "jacinto6evm"
-TARGET_PRODUCT:ti33x = "ti335x"
-TARGET_PRODUCT:ti43x = "ti437x"
-TARGET_PRODUCT:am65xx = "ti654x"
+TARGET_PRODUCT:omap-a15 = "ti572x_linux"
+TARGET_PRODUCT:ti33x = "ti335x_linux"
+TARGET_PRODUCT:ti43x = "ti437x_linux"
+TARGET_PRODUCT:am65xx = "ti654x_linux"
 PVR_BUILD = "release"
-PVR_WS = "nulldrmws"
+PVR_WS = "lws-generic"
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
-
-do_compile:prepend() {
-    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
-}
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} \
+WINDOW_SYSTEM=${PVR_WS} PVR_BUILD_DIR=${TARGET_PRODUCT}'
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
 do_install:am65xx() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasiacon/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
deleted file mode 100644
index e49fd9b8..00000000
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
+++ /dev/null
@@ -1 +0,0 @@
-SUBSYSTEM=="platform", ACTION=="bind", ENV{DRIVER}=="pvrsrvkm", RUN+="/usr/bin/pvrsrvctl --start --no-module"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index 755cc4f5..d2565318 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -1,38 +1,35 @@
 DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
 PR = "r38"
 
-BRANCH = "ti-img-sgx/kirkstone-mesa/${PV}"
+BRANCH = "${PV}/mesa/glibc-2.35"
 
 SRC_URI = " \
     git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
-    file://pvrsrvkm.rules \
 "
-SRCREV = "bbae7217051341f515515ec190e165119102f45a"
-
-TARGET_PRODUCT:ti33x = "ti335x"
-TARGET_PRODUCT:ti43x = "ti437x"
-TARGET_PRODUCT:omap-a15 = "ti572x"
-TARGET_PRODUCT:am65xx = "ti654x"
+SRCREV = "70364424dd496833fad5b243c9e6cc8b077f04ac"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
 
 PACKAGECONFIG ??= "udev"
-PACKAGECONFIG[udev] = ",,,udev"
+PACKAGECONFIG[udev] = "UDEV=true,,,udev"
+
+def use_sysvinit(d):
+    return d.getVar('VIRTUAL-RUNTIME_init_manager') == 'sysvinit'
 
-def use_initscript(d):
-    sysvinit = bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d)
-    udev = bb.utils.contains('PACKAGECONFIG', 'udev', True, False, d)
-    return sysvinit and not udev
+inherit ${@oe.utils.ifelse(use_sysvinit(d), 'update-rc.d', '')}
 
-inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
+TARGET_PRODUCT:ti33x = "ti335x_linux"
+TARGET_PRODUCT:ti43x = "ti437x_linux"
+TARGET_PRODUCT:omap-a15 = "ti572x_linux"
+TARGET_PRODUCT:am65xx = "ti654x_linux"
 
 RDEPENDS:${PN} += "libdrm"
 
@@ -40,24 +37,10 @@ RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
 
 S = "${WORKDIR}/git"
 
-do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-
-    without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
-    with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
+EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"
 
-    # Delete initscript if it is not needed or would conflict with the udev rules
-    if ${@oe.utils.ifelse(use_initscript(d), 'false', 'true')}; then
-        rm -rf ${D}${sysconfdir}/init.d
-        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
-    fi
-
-    if $with_udev; then
-        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
-            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
-    fi
-
-    chown -R root:root ${D}
+do_install() {
+    oe_runmake install
 }
 
 FILES:${PN} =  "${bindir}/*"
@@ -66,6 +49,10 @@ FILES:${PN} +=  "${includedir}/*"
 FILES:${PN} +=  "${sysconfdir}/*"
 FILES:${PN} +=  "${datadir}/*"
 FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
+FILES:${PN} += "${nonarch_base_libdir}/systemd/system"
+
+# No debug or dev packages for this recipe
+PACKAGES = "${PN}"
 
 INSANE_SKIP:${PN} += "ldflags"
-INSANE_SKIP:${PN} += "already-stripped"
+INSANE_SKIP:${PN} += "already-stripped dev-so"
-- 
2.42.0


