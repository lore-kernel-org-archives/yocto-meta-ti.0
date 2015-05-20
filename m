Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D845EE004F6; Wed, 20 May 2015 06:30:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E70E0095D
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 06:30:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4KDUNnt019041
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:30:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4KDUMJ6028152
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 08:30:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 08:30:22 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4KDUMKp029777;	Wed, 20 May 2015 08:30:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 May 2015 09:30:20 -0400
Message-ID: <1432128620-18860-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 2/3] libulm: Add ULM library for ARM and DSP.
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
X-List-Received-Date: Wed, 20 May 2015 13:30:41 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
* v3 changes:
  - Use the more generic "keystone" soc family as opposed to the
    specific k2hk-evm machine.

* v2 changes:
  - Add support for k2hk-evm
  - Reorganize file based on oe-stylize.

 recipes-bsp/dsptop/libulm_git.bb |   42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 recipes-bsp/dsptop/libulm_git.bb

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
-- 
1.7.9.5


