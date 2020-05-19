Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3571.1589848366383830950
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 May 2020 17:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6980840B9D;
	Tue, 19 May 2020 00:32:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YE3O6zW5ZfZ; Tue, 19 May 2020 00:32:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E75D540A18;
	Tue, 19 May 2020 00:32:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7D5E617316F;
	Mon, 18 May 2020 20:32:41 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] trusted-firmware-a: upstreamed and unified to meta-arm, drop locally
Date: Mon, 18 May 2020 20:32:41 -0400
Message-Id: <1589848361-36781-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k3.inc                        |  3 +
 .../arm-trusted-firmware_2.2.bb                    | 79 ----------------------
 .../trusted-firmware-a_%.bbappend                  | 23 +++++++
 recipes-bsp/u-boot/u-boot-ti.inc                   |  2 +-
 4 files changed, 27 insertions(+), 80 deletions(-)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 54b1789..6b78f4c 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -26,6 +26,9 @@ UBOOT_SUFFIX = "img"
 
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
+TFA_PLATFORM = "k3"
+TFA_BOARD = "generic"
+
 MACHINE_GUI_CLASS = "smallscreen"
 
 # Use the expected value of the ubifs filesystem's volume name in the kernel
diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
deleted file mode 100644
index ae957bf..0000000
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
+++ /dev/null
@@ -1,79 +0,0 @@
-SUMMARY = "ARM Trusted Firmware"
-DESCRIPTION = "ARM Trusted Firmware provides a reference implementation of \
-Secure World software for ARMv8-A, including Exception Level 3 (EL3) software. \
-It provides implementations of various ARM interface standards such as the \
-Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
-(TBBR) and Secure monitor code."
-HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
-
-inherit deploy
-
-DEPENDS += "dtc-native openssl-native"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-S = "${WORKDIR}/git"
-
-PV_append = "+git${SRCPV}"
-
-BRANCH = "ti-atf"
-SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
-
-SRCREV ?= "e516a389ac12fbe1597f61fea80ed3f230b9c5fd"
-
-# Make ATF "aware" of OPTEE, no build dependency
-PACKAGECONFIG[optee] = "SPD=opteed"
-
-COMPATIBLE_MACHINE = "k3"
-ATFPLATFORM_k3 = "k3"
-ATFBOARD_k3 = "generic"
-
-PACKAGECONFIG_k3 = "optee"
-
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-do_configure[noexec] = "1"
-
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" PLAT="${ATFPLATFORM}" TARGET_BOARD="${ATFBOARD}" ${PACKAGECONFIG_CONFARGS}'
-
-do_compile() {
-	oe_runmake all
-}
-
-do_compile_append_am65xx-hs-evm() {
-	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-	)
-}
-
-do_compile_append_j7-hs-evm() {
-	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/; \
-		mv bl31.bin bl31.bin.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-	)
-}
-
-do_install() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${D}/boot/
-	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31/bl31.elf ${D}/boot/
-}
-
-do_deploy() {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31.bin ${DEPLOYDIR}/
-	install -m 0644 ${S}/build/${ATFPLATFORM}/${ATFBOARD}/release/bl31/bl31.elf ${DEPLOYDIR}/
-}
-addtask deploy before do_build after do_compile
-
-FILES_${PN} = "/boot"
-SYSROOT_DIRS += "/boot"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
new file mode 100644
index 0000000..d43e7c5
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -0,0 +1,23 @@
+BRANCH_k3 = "ti-atf"
+SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
+SRCREV_k3 = "5b907a2813faf039d752cdeb6a7b94e95580c46b"
+COMPATIBLE_MACHINE_k3 = "k3"
+TFA_BUILD_TARGET_k3 = "all"
+TFA_INSTALL_TARGET_k3 = "bl31"
+TFA_SPD_k3 = "opteed"
+
+do_compile_append_am65xx-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${B}/${BUILD_DIR}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
+
+do_compile_append_j7-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${B}/${BUILD_DIR}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 8f8f0af..062a692 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -33,7 +33,7 @@ PV_append = "+git${SRCPV}"
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
 
-PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/boot/bl31.bin,,arm-trusted-firmware"
+PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}/boot/bl32.bin,,optee-os"
 
 PACKAGECONFIG_append_aarch64 = " atf optee"
-- 
2.7.4

