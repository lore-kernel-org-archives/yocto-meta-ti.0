Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83C32E00C1D; Tue, 26 Jan 2016 13:17:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39575E00BFD
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:16:59 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLGwPU007812
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:58 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLGwxj004368
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:58 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:16:58 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUN012813;	Tue, 26 Jan 2016 15:16:58 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:41 -0500
Message-ID: <1453843011-28530-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
References: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] ti-pdk.bbclass: Add class for creating RTOS PDK components
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk.bbclass | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 classes/ti-pdk.bbclass

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
-- 
1.9.1


