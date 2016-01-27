Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CE15E009EA; Wed, 27 Jan 2016 12:54:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AE12E00852
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 91ED1529CF; Wed, 27 Jan 2016 20:54:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205448.91ED1529CF@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-pdk.bbclass: Add class for creating RTOS PDK components
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
X-List-Received-Date: Wed, 27 Jan 2016 20:54:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a1be6f468d9974a290a8ec6c3c9c032378794481
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a1be6f468d9974a290a8ec6c3c9c032378794481

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:41 2016 +0000

ti-pdk.bbclass: Add class for creating RTOS PDK components

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 classes/ti-pdk.bbclass |   66 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
new file mode 100644
index 0000000..ae76fdf
--- /dev/null
+++ b/classes/ti-pdk.bbclass
@@ -0,0 +1,66 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+inherit perlnative
+
+DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native"
+
+DEPENDS_append_omap-a15 = " ti-cgt6x-native ti-ccsv6-native"
+DEPENDS_append_keystone = " ti-cgt6x-native"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+get_build_dir_bash() {
+  if [ -f ${S}/package.xdc ]
+  then
+    grep '^package' ${S}/package.xdc | sed -e 's|\[.*$||' | awk '{ print $2 }' | sed -e 's|\.|/|g'
+  else
+    echo ${S}
+    return 1
+  fi
+}
+
+export CROSS_TOOL_PRFX="arm-none-eabi-"
+export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+
+export ROOTDIR = "${B}"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+
+export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
+export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
+
+PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+
+do_configure() {
+    BUILD_DIR=${B}/`get_build_dir_bash`
+
+    mkdir -p ${BUILD_DIR}
+    cp -r ${S}/* ${BUILD_DIR}
+    cd ${BUILD_DIR}
+
+    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
+    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
+    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
+    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
+    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
+}
+
+do_compile() {
+    ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
+    ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${XDCARGS}" ROOTDIR="${ROOTDIR}" -PR .
+    ${XDC_INSTALL_DIR}/xdc release XDCARGS="${XDCARGS}" -PR .
+}
+
+do_install () {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"


