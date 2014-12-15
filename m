Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD346E009B0; Mon, 15 Dec 2014 12:22:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9E4EE0093F
	for <meta-ti@yoctoproject.org>; Mon, 15 Dec 2014 12:22:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0762C52A81; Mon, 15 Dec 2014 20:22:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141215202230.0762C52A81@arago-project.org>
Date: Mon, 15 Dec 2014 20:22:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : edma3-lld: add new recipe for edma3 low level driver
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
X-List-Received-Date: Mon, 15 Dec 2014 20:22:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 123dac8c82f03f117b3fdf361c9592304071983f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=123dac8c82f03f117b3fdf361c9592304071983f

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Nov 19 19:21:33 2014 +0000

edma3-lld: add new recipe for edma3 low level driver

- Provides low level driver for EDMA3 module
- supports k2k, k2l, k2e evm platforms

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld_git.bb |   80 ++++++++++++++++++++++++++++++++
 1 files changed, 80 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
new file mode 100755
index 0000000..1ed4b93
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -0,0 +1,80 @@
+DESCRIPTION = "TI EDMA3 low level driver and test code"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
+SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
+
+PV = "2.11.13"
+PR = "r0"
+
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "common-csl-ip"
+
+PLATFORMLIST = "tci6636k2h-evm \
+	tci6638k2k-evm \
+	tci6630k2l-evm \
+	c66ak2e-evm \
+	"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/*"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	cd ${S}/packages
+	for platform in ${PLATFORMLIST}
+	do
+		ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc" CROSSAR="${TARGET_PREFIX}ar" \
+		CROSSLNK="${TARGET_PREFIX}gcc" INTERNAL_SW_ROOT="${S}" make \
+		PLATFORM="$platform" TARGET=a15 TOOLCHAIN_a15=GCC FORMAT=ELF \
+		SONAME=libedma3.so all
+	done
+}
+
+do_install () {
+	install -d ${D}/${libdir}
+
+	# Static Libraries
+	cp ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg \
+		${D}/${libdir}/libedma3.a
+	cp ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/edma3_lld_rm.aa15fg \
+		${D}/${libdir}/libedma3rm.a
+
+	# Shared Libraries
+	cp -a ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma* ${D}/${libdir}
+	cp -a ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-evm/a15/release/libedma* ${D}/${libdir}
+
+	# Copy Headers
+	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
+	install -d ${D}/${includedir}/ti/sdo/edma3/rm
+	cp ${S}/packages/ti/sdo/edma3/drv/*.h ${D}/${includedir}/ti/sdo/edma3/drv/
+	cp ${S}/packages/ti/sdo/edma3/rm/*.h ${D}/${includedir}/ti/sdo/edma3/rm/
+
+	# Copy Sample Config
+	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2HSample.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2KSample.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LSample.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+	cp ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESample.c \
+		${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
+
+	install -d ${D}/${bindir}
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/bin/tci6636k2h-evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/bin/tci6638k2k-evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/bin/tci6630k2l-evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
+	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
+		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
+}
+


