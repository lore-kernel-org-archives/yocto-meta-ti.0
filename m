Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DEE8E00CC2; Wed, 30 Aug 2017 15:42:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22C16E00CC0
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:42:40 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UMgU01031967
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504132950;
	bh=uxK8nZGgP+M3DO8XyT9kvEu02GHTxGs/gfG6NQ/9UIE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ICjBiLREW76OJgeFqF7ty48hlOqqJM6PeAzbp+bfmuBVAqBmlQxTvF8wWI3qvBGzN
	JSnUVNkNpJwsxxcRyoOW1ztJ3rY+R+45ezAMFZVpyv6kfXI4PHrDo4Y+n+WQ0WPm7c
	RpYrt1WA5OdNv+IW8G9VvSgknYNOeiOD2uvZBwoU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgP5O014882
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:42:25 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 17:42:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 17:42:24 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMgL0d004119;
	Wed, 30 Aug 2017 17:42:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 30 Aug 2017 18:42:12 -0400
Message-ID: <1504132936-7725-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1504132936-7725-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 3/7] vps-lld-rtos: Added rtos recipe for vps-lld
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
X-List-Received-Date: Wed, 30 Aug 2017 22:42:49 -0000
Content-Type: text/plain

Upstreaming RTOS low level driver for Video processing subsystem.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v3 - Removed intermediate tar-untar for do-install
 v2 - Added summary

 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 93 +++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
new file mode 100644
index 0000000..3a968dd
--- /dev/null
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -0,0 +1,93 @@
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
+    # Build libraries
+    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+
+    #  Clean up .tar files from the package
+    find -name "*.tar" -exec rm -f {} \;
+}
+
+do_install() {
+    cd ${VPS_LLD_ROOTPATH}
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/vps
+    cp -r ./*  ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/vps
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch ldflags"
-- 
1.9.1


