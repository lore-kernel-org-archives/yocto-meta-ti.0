Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29D93E00A86; Mon,  1 Jun 2015 07:54:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E75BE00A54
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:54:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EFC5352A81; Mon,  1 Jun 2015 14:54:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601145446.EFC5352A81@arago-project.org>
Date: Mon,  1 Jun 2015 14:54:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld-rtos: Add the EDMA3 LLD RTOS package.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:54:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: b9036f2c8eb13e9c80c8f41a42594cf270ed0e62
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b9036f2c8eb13e9c80c8f41a42594cf270ed0e62

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 22:20:17 2015 +0000

edma3-lld-rtos: Add the EDMA3 LLD RTOS package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |   75 +++++++++++++++++++++++++++
 1 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
new file mode 100644
index 0000000..246d7a8
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -0,0 +1,75 @@
+require edma3-lld.inc
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+PR = "r0"
+
+DEPENDS = "ti-cgt6x-native ti-sysbios ti-xdctools"
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PLATFORMLIST = ""
+PLATFORMLIST_keystone = " \
+        tci6636k2h-evm \
+        tci6638k2k-evm \
+        tci6630k2l-evm \
+        c66ak2e-evm \
+"
+
+PLATFORMLIST_dra7xx = " \
+        tda2xx-evm \
+        dra72x-evm \
+        am571x-evm \
+        am572x-evm \
+"
+
+S = "${WORKDIR}/git"
+
+PARALLEL_MAKE = ""
+
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr"
+export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export CGTOOLS = "${XDCCGROOT}"
+export CGTOOLS_ELF = "${XDCCGROOT}"
+export CODEGEN_PATH_DSP = "${XDCCGROOT}"
+export CODEGEN_PATH_DSPELF = "${XDCCGROOT}"
+export TMS470_CGTOOLS = "${XDCCGROOT}"
+export UTILS_INSTALL_DIR = "${XDC_INSTALL_DIR}"
+export XDCPATH = "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
+export PATH := "${XDC_INSTALL_DIR}:${PATH}"
+export ROOTDIR="${S}"
+export INTERNAL_SW_ROOT="${S}"
+export CROSSCC="${TARGET_PREFIX}gcc"
+export CROSSAR="${TARGET_PREFIX}ar"
+export CROSSLNK="${TARGET_PREFIX}gcc"
+
+
+EXTRA_OEMAKE += " -C ${S}/packages TARGET=66 FORMAT=ELF"
+
+do_configure () {
+    sed -i -e "s|^UTILS_INSTALL_DIR =.*$|UTILS_INSTALL_DIR = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^bios_PATH =.*$|bios_PATH = ${SYSBIOS_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^xdc_PATH =.*$|xdc_PATH = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_DSP =.*$|CODEGEN_PATH_DSP = ${XDCCGROOT}|g" ${S}/makerules/env.mk
+    sed -i -e "s|^CODEGEN_PATH_DSPELF =.*$|CODEGEN_PATH_DSPELF = ${XDCCGROOT}|g" ${S}/makerules/env.mk
+
+    cd ${S}/packages
+    ${XDC_INSTALL_DIR}/xdc .interfaces -PR .
+}
+
+do_compile () {
+    for p in ${PLATFORMLIST}
+    do
+        oe_runmake PLATFORM=${p}
+    done
+}
+
+do_install () {
+    install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
+}
+
+INSANE_SKIP_${PN} = "arch"
+
+FILES_${PN} += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"


