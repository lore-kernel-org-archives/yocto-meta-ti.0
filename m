Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82D8FE00974; Fri, 22 May 2015 09:33:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB392E009A1
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 09:33:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8BBAA52A9A; Fri, 22 May 2015 16:33:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522163332.8BBAA52A9A@arago-project.org>
Date: Fri, 22 May 2015 16:33:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : libulm: Add ULM library for ARM and DSP.
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
X-List-Received-Date: Fri, 22 May 2015 16:33:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 4a297054ef5f5d553c3c918aea8cec0d759b25a2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4a297054ef5f5d553c3c918aea8cec0d759b25a2

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 20 19:30:20 2015 +0000

libulm: Add ULM library for ARM and DSP.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/libulm_git.bb |   42 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_git.bb
new file mode 100644
index 0000000..306d86f
--- /dev/null
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "TI dsptop utility."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"
+
+DEPENDS = "ti-cgt6x-native"
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git/dsptop/ulm"
+
+DEVICE=""
+DEVICE_dra7xx = "DRA7xx"
+DEVICE_keystone = "C66AK2Hxx"
+
+EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
+
+do_compile() {
+    oe_runmake arm XPORT_ONLY
+    oe_runmake dsp C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include
+}
+
+do_install() {
+    install -d ${D}${includedir}
+    install -d ${D}${libdir}
+    install -d ${D}${datadir}/ti/ulm
+    cp -f tiulm.h ${D}${includedir}
+    cp -f release/libtiulm.a ${D}${libdir}
+    cp -f tiulm.h ${D}${datadir}/ti/ulm
+    cp -f release/libtiulm.ae66 ${D}${datadir}/ti/ulm
+}
+
+COMPATIBLE_MACHINE = "dra7xx|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN}-dev += "\
+    ${datadir}/ti/ulm \
+"
+
+include dsptop.inc
+
+ALLOW_EMPTY_${PN} = "1"
+
+PARALLEL_MAKE= ""


