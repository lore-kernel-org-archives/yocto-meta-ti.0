Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9F01E00C74; Tue, 18 Jul 2017 16:05:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 720ACE00BC0
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4ujI020827
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419096;
	bh=xiyLTnNg8M56MHELCU3TOXD2Uf7A1KU+4m9dFW3CvxI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ddnDp2LdeUiJq/UY2ZsrngPdnSzZZrmZZhW0jbC5gKrOj1oyfzWzKH755BlDUDage
	naTH3wVhHzAJ0a4iuU+4XfW0PG0erU1IJQZBvct6JarT8CpGAKjg5Otid9s4HobfnA
	vdofmqRzISGUBWHjBwnShW4QgpdNqJUnDym4hzwk=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4uei032549
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:55 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46i6000997;	Tue, 18 Jul 2017 18:04:55 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:44 -0400
Message-ID: <1500419028-3361-33-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 33/37] vps-lld-rtos: Added rtos recipe for vps-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:08 -0000
Content-Type: text/plain

Upstreaming RTOS low level driver for Video processing subsystem.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary & merged in to a single recipe

 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 94 +++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
new file mode 100644
index 0000000..8f759b8
--- /dev/null
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -0,0 +1,94 @@
+SUMMARY = "TI RTOS Low level driver for Video Processing Subsystem (VPS) "
+
+require recipes-ti/includes/ti-paths.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=32;md5=4303d306ea53eb66132983d6901c137d"
+
+COMPATIBLE_MACHINE = "omap-a15"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+VPS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/vps.git"
+VPS_LLD_GIT_PROTOCOL = "git"
+VPS_LLD_GIT_BRANCH = "master"
+VPS_LLD_GIT_DESTSUFFIX = "git"
+VPS_PACKAGE_BASE   = "${S}/../vps_base"
+VPS_LLD_ROOTPATH = "${VPS_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/vps"
+
+# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.06B"
+VPS_LLD_SRCREV = "58729317b65bdb24d4343cbb1f7f6cb90ca2faf0"
+
+BRANCH = "${VPS_LLD_GIT_BRANCH}"
+SRC_URI = "${VPS_LLD_GIT_URI};destsuffix=${VPS_LLD_GIT_DESTSUFFIX};protocol=${VPS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${VPS_LLD_SRCREV}"
+PV = "01.00.01.06B"
+PR = "r0"
+
+S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS = " ti-cgt6x-native \
+            ti-cgt-arm-native \
+            ti-sysbios \
+            common-csl-ip-rtos \
+            gcc-arm-none-eabi-native \
+            osal-rtos \
+            ca-certificates-native \
+            ti-pdk-setup \
+            edma3-lld-rtos \
+            board-rtos \
+            uart-lld-rtos \
+            i2c-lld-rtos \
+            pm-lld-rtos \
+"
+
+# Fetch task cannot be completed until after ca-certificates-native populates sysroot with the SSL certificates
+do_fetch[depends] = "ca-certificates-native:do_populate_sysroot"
+
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export FPULIB_PATH = "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/4.9.3/fpu/"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+
+export PDK_VPS_ROOT_PATH = "${VPS_PACKAGE_BASE}/package/all/pdk_/packages"
+
+BOARD_PACKAGE = ""
+BOARD_PACKAGE_am57xx-evm = "evmAM572x"
+BOARD_PACKAGE_dra7xx-evm = "evmDRA75x"
+
+
+do_configure() {
+    rm -rf ${VPS_PACKAGE_BASE}
+    cd ${S}
+    
+    # remove any previous package
+    rm -f ${VPS_PACKAGE_BASE}
+
+    # make the release package before building it
+    make package BOARD=${BOARD_PACKAGE} DEST_ROOT=${VPS_PACKAGE_BASE} PDK_VPS_COMP_PATH=${S}
+}
+
+do_compile() {
+    echo "vps lld root path is ${VPS_LLD_ROOTPATH}"
+    cd ${VPS_LLD_ROOTPATH}
+    
+    # Build am572x and am571x libraries
+    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+
+    #archive
+    tar -cf vps_lld.tar --exclude='*.tar' ./*
+}
+
+do_install() {
+    cd ${VPS_LLD_ROOTPATH}
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/vps
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/vps \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags"
-- 
1.9.1


