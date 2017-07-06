Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA41AE00BDC; Thu,  6 Jul 2017 15:50:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19BE2E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:50:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MoWEk021369
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499381432;
	bh=L/hIB2oLSUwl2IQro0GwN1IQ49xu6ygSuCkC+pzfATI=;
	h=From:To:CC:Subject:Date;
	b=R+tK+89JqTrK37JiK+u4+uUtODapKxr87b7clpvb+3IHpp5iXB51jz0qi1bvbsjFe
	VvJ8V1HRYoTOr8t24Xul2HbkO0r5XmeUsfuWwyN5qn4QiEiySLCuXqJLtdeXzhUE11
	jwpMNvyaB/wiFpcf9XZRtAs1HccdfHUK2Cfy6OkM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MoW14006932
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:50:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:50:31 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MoVRF006852;	Thu, 6 Jul 2017 17:50:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:50:30 -0400
Message-ID: <1499381430-60996-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sbl-boot-rtos: Added recipe for sbl-boot
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
X-List-Received-Date: Thu, 06 Jul 2017 22:50:33 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb

diff --git a/recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb b/recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb
new file mode 100644
index 0000000..247cddb
--- /dev/null
+++ b/recipes-bsp/sbl-boot/sbl-boot-rtos_git.bb
@@ -0,0 +1,116 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/qspi/sbl_qspi.h;beginline=1;endline=40;md5=db47887841d8a8cd6c41e72dd13b6d20"
+
+COMPATIBLE_MACHINE = "omap-a15|keystone|omapl1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/sbl.git"
+SBL_BOOT_GIT_PROTOCOL = "git"
+SBL_BOOT_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.SBL.01.00.06.00B"
+SBL_BOOT_SRCREV = "b05f51145fad910c4a830eb8c98afba552b86c9d"
+
+BRANCH = "${SBL_BOOT_GIT_BRANCH}"
+SRC_URI = "${SBL_BOOT_GIT_URI};protocol=${SBL_BOOT_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${SBL_BOOT_SRCREV}"
+PV = "01.00.06.00B"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = " ti-cgt-arm-native \
+            uart-lld-rtos \
+            spi-lld-rtos \
+            i2c-lld-rtos \
+            board-rtos \
+            common-csl-ip-rtos\
+"
+
+DEPENDS_append_omap-a15= " mmcsd-lld-rtos \
+            fatfs-rtos \
+            pm-lld-rtos \
+"
+
+DEPENDS_append_k2g = " mmcsd-lld-rtos \
+            fatfs-rtos \
+"
+
+DEPENDS_append_k2g-hs-evm = " \
+            secdev \
+"
+
+DEPENDS_append_omapl1= " mmcsd-lld-rtos \
+            fatfs-rtos \
+"
+
+CLEANBROKEN = "1"
+
+PARTNO = ""
+PARTNO_am57xx-evm = "am57xx"
+PARTNO_k2g = "k2g"
+PARTNO_k2hk-evm = "k2hk"
+PARTNO_k2e-evm = "k2e"
+PARTNO_k2l-evm = "k2l"
+PARTNO_omapl137-evm = "omapl137"
+
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export TOOLCHAIN_PATH_ARM9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export CROSS_TOOL_PRFX = "arm-none-eabi-"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+LDFLAGS = ""
+CFLAGS = ""
+
+export SBL_SRC_DIR = "${S}"
+export SPI_WRTR_SRC_DIR = "${S}"
+export QSPI_WRTR_SRC_DIR = "${S}"
+
+# Environment variables for K2G HS
+export SECBIN = "${SECDEV_INSTALL_DIR}/scripts/secimagecreate.sh"
+export KEYPATH = "${SECDEV_INSTALL_DIR}/sec/ks2keys/dev"
+export BM_DIR = "${SECDEV_INSTALL_DIR}/boot-monitor"
+export SK_DIR = "${SECDEV_INSTALL_DIR}/ram_secure_kernel"
+
+do_compile() {
+    cd build
+    ./sbl_${PARTNO}.sh
+}
+
+do_compile_k2g-hs-evm() {
+    make clean BOARD=evmK2G
+    make flashwriter_clean BOARD=evmK2G
+    make clean BOARD=iceK2G
+    make flashwriter_clean BOARD=iceK2G
+    make all BOARD=evmK2G SOC=K2G BOOTMODE=mmcsd SECUREMODE=yes
+    make all BOARD=evmK2G SOC=K2G BOOTMODE=qspi  SECUREMODE=yes
+    make flashwriter BOARD=evmK2G SOC=K2G SECUREMODE=yes
+    make all BOARD=iceK2G SOC=K2G BOOTMODE=mmcsd
+    make all BOARD=iceK2G SOC=K2G BOOTMODE=qspi
+    make flashwriter BOARD=iceK2G SOC=K2G
+    rm -rf binary/evmK2G/mmcsd/obj/
+    rm -rf binary/evmK2G/qspi/obj/
+    rm -rf binary/iceK2G/mmcsd/obj/
+    rm -rf binary/iceK2G/qspi/obj/
+    tar -cf sbl.tar --exclude='*.tar' --exclude='*.git*' ./*
+}
+
+do_compile_omapl138-lcdk() {
+    cd build
+    ./sbl_omapl138.sh
+    ./sbl_c6748.sh
+}
+
+do_install() {
+  install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl
+  find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/boot/sbl \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


