Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED7FCDB47E
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 01:38:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.55312.1697247498771673405
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ss6G12A0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39E1cGEe029403;
	Fri, 13 Oct 2023 20:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697247496;
	bh=WW83iGR3oHMKf5AgkpTZ/EDstHOUJ9PvoFRCzbNzyq8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ss6G12A0tUAMSEvGK/c+ewDdjkR4a1wOdIAtaMCbY6WBMLfKy+cgDLSDJCA+aNlCe
	 KVO6Rp0dX2x5OjZ78vKfoPE8Qh4T5e5sinDon2uDf24hnW1Lvqt+81zabpkE//ihup
	 QeEKAdz4PFXR7RG2HKemDkMxgxkBuv278M/HvswA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39E1cGs8100756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Oct 2023 20:38:16 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 20:38:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 20:38:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39E1cFIq019500;
	Fri, 13 Oct 2023 20:38:15 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 1/3] ti-sgx-ddk-*: version bump to support kirkstone
Date: Fri, 13 Oct 2023 20:37:55 -0500
Message-ID: <20231014013757.1398842-2-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231014013757.1398842-1-rs@ti.com>
References: <20231014013757.1398842-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Oct 2023 01:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17113

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
 .../ti-sgx-ddk-km_1.17.4948957.bb             | 27 +++++------
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |  1 -
 .../ti-sgx-ddk-um_1.17.4948957.bb             | 48 +++++++------------
 3 files changed, 28 insertions(+), 48 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index bf4fa98a..5914e412 100644
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
+SRCREV = "e1bbee4d3f7cfedbce3f78a4ac432096f92b858c"
 
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
index 755cc4f5..95b2b76f 100644
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
+SRCREV = "a864d75b69430d23d23221148a12eb323fc443b0"
 
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
-
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
+EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"
 
-    chown -R root:root ${D}
+do_install() {
+    oe_runmake install
 }
 
 FILES:${PN} =  "${bindir}/*"
@@ -66,6 +49,7 @@ FILES:${PN} +=  "${includedir}/*"
 FILES:${PN} +=  "${sysconfdir}/*"
 FILES:${PN} +=  "${datadir}/*"
 FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
+FILES:${PN} += "${nonarch_base_libdir}/systemd/system"
 
 INSANE_SKIP:${PN} += "ldflags"
 INSANE_SKIP:${PN} += "already-stripped"
-- 
2.42.0


