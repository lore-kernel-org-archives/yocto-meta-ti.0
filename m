Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE365E009E4; Mon, 18 May 2015 10:24:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 291DAE009E1
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:24:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHOnh5014242
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:24:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHOnU3024062
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:24:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:24:49 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHOj1E026575;	Mon, 18 May 2015 12:24:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:24:41 -0400
Message-ID: <1431969882-24031-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431969882-24031-1-git-send-email-j-stiffler@ti.com>
References: <1431969882-24031-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libulm: Add ULM library for ARM and DSP.
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
X-List-Received-Date: Mon, 18 May 2015 17:24:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dsptop/libulm_git.bb |   43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 recipes-bsp/dsptop/libulm_git.bb

diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_git.bb
new file mode 100644
index 0000000..4e5c5b4
--- /dev/null
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION="TI dsptop utility."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"
+
+include dsptop.inc
+
+DEPENDS = "ti-cgt6x-native"
+
+PR = "${INC_PR}.0"
+
+ALLOW_EMPTY_${PN} = "1"
+
+COMPATIBLE_MACHINE = "dra7xx"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PARALLEL_MAKE= ""
+
+S = "${WORKDIR}/git/dsptop/ulm"
+
+DEVICE=""
+DEVICE_dra7xx = "DRA7xx"
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
+FILES_${PN}-dev += "\
+    ${datadir}/ti/ulm \
+"
-- 
1.7.9.5


